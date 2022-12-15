## Schema

- All remove should be soft delete?
- Review defauld values

### Create user Table
  - Discarded_at is a datetime and have and index see docs
  - Deault value for role?
```console
rails g model User first_name last_name email role:integer discarded_at:datetime:index
```


## Create product Table
  - Add sku? uniq to product
  - Name uniq?
  - Global should have a default value?
  - When create a global product, it must be added automatically to all restaurant's menu items (callback?)
  - Type is a reserve word we have to change
```console
rails g model Product sku:uniq name:uniq price:integer kind:integer discarded_at:datetime:index global:boolean
```

### Create restaurant Table
  - manager or manager_id?
  - When create a restaurant manager could be null?
  - Dependent in my opinion nullify, this justiify the null manager ?
  - When create a restaurant, global products should be added automatically to restaurant's menu items (callback?)
```console
rails g model Restaurant manager:references address city country phone
```


### Create restaurant_staff Table
  - Discarted_at or active?
  - Replace user with waiter
  - A waiter only belongs to one restaurant so the association is has_on ?? if we have the soft delete it has to be has many??
  - When create a waiter inmediately should asign to the manager's restaurant
  - A user only has one restaurant staff
  - If you delete a waiter the restaurant staff it's going to be delete also?
```console
rails g model RestaurantStaff waiter:references restaurant:references discarded_at:datetime:index
```

### Create menu_item Table
  - If delete a product the menu item its going to be deleted also
  - If delete the restaurant all the menu it's going to be deleted
  - Manager can remove a product? only Admin and admin could remove a product add by a manager
  - Extend menu???
  - I am continue having doubts about the price here
  - When a manager create a product should be created a no global product an also add an item menu (callbakc?)
```console
rails g model MenuItem product:references restaurant:references price:integer stock:integer
```

### Create order Table
  - I add a default valur for status it is going to be like in hold, then if it is asign to a waiter it is goiung to be pending and then other status
  - What happend should I do with order when delete a client (dependent?)
  - What happend should I do with order when delete a waiter (dependent?)
```console
rails g model Order client:references waiter:references restaurant:references total:integer status:integer
```

### Create order_line Table
  - When delete a product teh item menu it is gping to be delete ut the order line should be delete also??
  - Review the workflow to submit and order.
```console
rails g model OrderLine order:references menu_item:references quantity:integer price:integer total:integer
```