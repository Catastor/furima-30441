**FURIMA ER**

**users table**
|    column    |  type  | options |
|--------------|--------|---------|
|nickname      |string  |NOT NULL |
|email         |string  |NOT NULL |
|password      |string  |NOT NULL |
|first_name    |string  |NOT NULL |
|last_name     |string  |NOT NULL |
|first_furigana|string  |NOT NULL |
|last_furigana |string  |NOT NULL |
|birth_year    |string  |NOT NULL |
|birth_month   |string  |NOT NULL |
|birth_day     |string  |NOT NULL |



**items table**
|   title   |    type    |  option  |
|-----------|------------|----------|
|item_name  |string      |NOT NULL  |
|item_info  |text        |NOT NULL  |
|item_status|string      |NOT NULL  |
|price      |integer     |NOT NULL  |
|image      |            |          |



**comments table**
|   title   |    type    |  option  |
|-----------|------------|----------|
|text       |text        |NOT NULL  |
|user       |references  |          |
|item       |references  |          |



**buyer table**
|      title      |  type  |  option  |
|-----------------|--------|----------|
|delivery_charge  |string  |NOT NULL  |
|shipment_source  |string  |NOT NULL  |
|date_of_shipment |integer |NOT NULL  |



**address rable**
|     title     |  type  |  option  |
|---------------|--------|----------|
|postal_code    |string  |NOT NULL  |
|prefectures    |string  |NOT NULL  |
|municipalities |string  |NOT NULL  |
|house_number   |string  |NOT NULL  |
|phone_number   |string  |NOT NULL  |

