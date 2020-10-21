**FURIMA ER**

**users table**
|       column       |  type  |   option   |
|--------------------|--------|------------|
|nickname            |string  |null: false |
|email               |string  |null: false |
|encrypted_password  |string  |null: false |
|first_name          |string  |null: false |
|last_name           |string  |null: false |
|first_furigana      |string  |null: false |
|last_furigana       |string  |null: false |
|birthday            |date    |null: false |

**association**
- has_many :items
- has_many :comments
- has_many :buyers


**items table**
|       column       |    type    |            option            |
|--------------------|------------|------------------------------|
|name                |string      |null: false                   |
|info                |text        |null: false                   |
|category_id         |string      |null: false                   |
|status_id           |integer     |null: false                   |
|price               |integer     |null: false                   |
|delivery_charge_id  |integer     |null: false                   |
|shipment_source_id  |integer     |null: false                   |
|date_of_shipment_id |integer     |null: false                   |
|user                |references  |foreign_key :true, null: false|

**association**
- belongs_to :user
- has_many   :comments
- has_one    :buyer


**comments table**
| column |    type    |            option            |
|--------|------------|------------------------------|
|text    |text        |null: false                   |
|user    |references  |foreign_key :true, null: false|
|item    |references  |foreign_key :true, null: false|

**association**
- belongs_to :user
- belongs_to :item


**buyers table**
| column |    type    |            option            |
|--------|------------|------------------------------|
|user    |references  |foreign_key :true, null: false|
|item    |references  |foreign_key :true, null: false|

**association**
- belongs_to :user
- belongs_to :item
- has_one    :address


**addresses table**
|       column       |    type    |            option            |
|--------------------|------------|------------------------------|
|postal_code         |string      |null: false                   |
|shipment_source_id  |integer     |null: false                   |
|municipalities      |string      |null: false                   |
|house_number        |string      |null: false                   |
|building            |string      |                              |
|phone_number        |string      |null: false                   |
|buyer               |references  |foreign_key :true, null: false|

**association**
- belongs_to :buyer