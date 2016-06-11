#Створюємо нову модель:
rails g migration Product name:string description:text price:float

#average price of products:
Product.average(:price)


#sum of price all products
Product.sum(:price)

#maximum price of product
Product.maximum(:price)

#minimum price of product
Product.minimum(:price)

#only products with name  =‘TV’ 
Product.where(name: 'TV')

#products where price less than 100 
Product.where('price < ?',100)



 Ruby Models H.W.Part 2

#Створюємо аккаунт
Account.create(name: 'HomerSimp', age: 47)

#Створюємо продукт
Product.create(name: 'monitor', description: 'Samsung 21', price: 200)
Product.create(name: 'PC', description: 'lenovo notebook', price: 250)

#Створюємо корзину
Cart.create

#Додаємо продукти в корзину
Product.find(1).update(cart_id: Cart.find(1).id)
Product.find(2).update(cart_id: Cart.find(1).id)

#Додаєм корзину в аккаунт
Cart.find(1).update(account_id: Account.find(1).id)

#Дістаємо  сумму продуктів в корзині для аккаунта
Account.find(1).cart.products.sum(:price)





