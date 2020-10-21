**FURIMA ER**

**users table**
|    column    |  type  |  option  |
|--------------|--------|----------|
|nickname      |string  |NOT NULL  |
|email         |string  |NOT NULL  |
|password      |string  |NOT NULL  |
|first_name    |string  |NOT NULL  |
|last_name     |string  |NOT NULL  |
|first_furigana|string  |NOT NULL  |
|last_furigana |string  |NOT NULL  |
|birthday      |date    |NOT NULL  |

**association**
- has_many: items
- has_many: comments
- has_one : buyer


**items table**
|       column       |  type  |  option  |
|--------------------|--------|----------|
|name                |string  |NOT NULL  |
|info                |text    |NOT NULL  |
|category_id         |string  |NOT NULL  |
|status_id           |integer |NOT NULL  |
|price               |integer |NOT NULL  |
|delivery_charge_id  |integer |NOT NULL  |
|shipment_source_id  |integer |NOT NULL  |
|date_of_shipment_id |integer |NOT NULL  |

**association**
- belongs_to :user
- has_many   :comments
- has_one    :buyer


**comments table**
| column |    type    |   option   |
|--------|------------|------------|
|text    |text        |NOT NULL    |
|user    |references  |foreign_key |
|item    |references  |foreign_key |

**association**
- belongs_to :user
- belongs_to :item


**buyer table**
| column |    type    |   option   |
|--------|------------|------------|
|user    |references  |foreign_key |
|item    |references  |foreign_key |

**association**
- belongs_to :user
- belongs_to :item
- has_one    :address


**address table**
|     column     |  type  |  option  |
|----------------|--------|----------|
|postal_code     |string  |NOT NULL  |
|shipment_source |integer |NOT NULL  |
|municipalities  |string  |NOT NULL  |
|house_number    |string  |NOT NULL  |
|building        |string  |          |
|phone_number    |string  |NOT NULL  |

**association**
- belongs_to :buyer