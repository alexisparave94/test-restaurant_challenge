## Schema

- All remove should be soft delete(discarded)
- Review default values

### Create user Table
  - Discarded_at is a datetime and have and index see docs, check
  - Deault value for role, customer
```console
rails g model User first_name last_name email role:integer discarded_at:datetime:index
```


## Create product Table
  - Name uniq check
  - Global should have a default value, false , check
  - When create a global product, it must be added automatically to all restaurant's menu items (callback?)
  - Type is a reserve word we have to change
```console
rails g model Product name:uniq price:integer category:integer discarded_at:datetime:index global:boolean
```

### Create restaurant Table
  - When create a restaurant manager could be null check
  - Dependent in my opinion nullify, this justiify the null manager check
  - When create a restaurant, global products should be added automatically to restaurant's menu items (callback?)
```console
rails g model Restaurant manager:references address city country phone
```


### Create restaurant_staff Table
  - Discarted_at when the waiter change of restaurant. check
  - Replace user with waiter
  - A waiter if we have the soft delete it has to be has many. check
  - When create a waiter inmediately should asign to the manager's restaurant
  - A waiter only has one acitve restaurant staff
  - If you soft delete a waiter the restaurant staff it's going to have a discarded at
```console
rails g model RestaurantStaff waiter:references restaurant:references discarded_at:datetime:index
```

### Create menu_item Table
  - If soft delete a product the menu item its going to have discarded at
  - If soft delete the restaurant all the menu it's going to have discarded at
  - Admin could remove a product add by a manager
  - Manager can aad, remove or update a product add to his restaurant.
  - Extend menu??? consult with Carlos
  - I am continue having doubts about the price here. consult with Carlos and Diego
  - Scope about manager and admin updating products. consult with Carlos
  - When a manager create a product should be created a no global product an also add an item menu (callbakc?)
```console
rails g model MenuItem product:references restaurant:references price:integer stock:integer
```

### Create order Table
  - I add a default value for status it is going to be open, then if it is asign to a waiter it is going to be confirmed and then completed
  - What happend should I do with order when delete a client (dependent?)
  - What happend should I do with order when delete a waiter (dependent?)
```console
rails g model Order client:references waiter:references restaurant:references total:integer status:integer
```

### Create order_line Table
  - When delete a product the item menu it is going to be delete the order line should be delete also.
  - Review the workflow to submit and order. clear
```console
rails g model OrderLine order:references menu_item:references quantity:integer price:integer total:integer
```

## Consulting
  - About dependent in associations, because of the soft delete
  - I am continue having doubts about the price here. consult with Carlos and Diego