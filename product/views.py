from django.contrib import messages
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect

# Create your views here.
from product.models import User, Product, ShoppingCart


def login_view(request):
    if request.method == 'POST':
        user_row = User.objects.filter(name=request.POST['username'], password=request.POST['password']).first()
        if user_row:
            request.session['user'] = {
                'id': user_row.id,
                'username': user_row.name,
            }
            return redirect('index')
        else:
            return render(request, 'login.html', {'error': 'Invalid login credentials'}) # gai

    return render(request, 'login.html')


def index_view(request):
    all_products = Product.objects.all()
    return render(request, 'index.html', {'product_list': all_products})


def add2cart(request, product_id):
    # check login
    if 'user' not in request.session:
        messages.warning(request,  f'Please login to add to chart!')
        return redirect('index')

    cart_row, _ = ShoppingCart.objects.get_or_create(product_id=product_id, user_id=request.session['user']['id'])
    if cart_row.quantity is None:
        cart_row.quantity = 1
    else:
        cart_row.quantity += 1
    cart_row.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def cart_adjust(request, cart_item_id, operation):
    cart_item = ShoppingCart.objects.get(id=cart_item_id)
    if operation == 'ADD':
        cart_item.quantity += 1
    elif operation == 'SUB':
        cart_item.quantity -= 1
    cart_item.save()

    if cart_item.quantity == 0 or operation == 'DEL':
        cart_item.delete()

    return redirect('mycart')


def mycart(request):
    if 'user' not in request.session:
        messages.warning(request,  f'Please login to add to chart!')
        return redirect('index')

    user_id = request.session['user']['id']
    my_cart_rows = ShoppingCart.objects.filter(user_id=user_id)
    all_items_in_cart = []
    total_price = 0
    for row in my_cart_rows:
        temp = []
        product_rows = Product.objects.filter(id=row.product_id)
        product_row = product_rows[0]
        temp.append(product_row.name)
        temp.append(row.quantity)
        temp.append(product_row.price)
        subprice = temp[-1] * temp[-2]
        temp.append(subprice)
        total_price += subprice
        temp.append(product_row.img_url)
        temp.append(row.id)
        all_items_in_cart.append(temp)
    # all_items_in_cart.append(total_price)

    context = {
        "items_in_cart": all_items_in_cart,
        "total_price": total_price,
        'user_name': request.session['user']['username'],
    }
    return render(request, "mycart.html", context)


def product_detail(request, product_id):
    product = Product.objects.get(id=product_id)
    return render(request, 'product.html', {'product': product})
