# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| name_kana          | string | null: false              |
| nickname           | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :buying_record
- has_one :shipping_info


## items テーブル

| Column              | Type         | Options                        |
| ------              | ----------   | ------------------------------ |
| items_name          | string       | null: false                    |
| items_description   | text         | null: false                    |
| items_category      | string       | null: false                    |
| items_condition     | string       | null: false                    |
| shipping_fee        | string       | null: false                    |
| shipping_region     | string       | null: false                    |
| shipping_time       | string       | null: false,                   |
| items_price         | integer      | null: false                    |
| user_id             | references   | null: false, foreign_key: true |

### Association

- has_one :buying_record
- belong_to :users
- has_one :shipping_info

## shipping_info テーブル

| Column           | Type         | Options     |
| ------           | ------------ | ------------|
| zip_code         | integer      | null: false |
| shipping_state   | strings      | null: false |
| shipping_city    | strings      | null: false |
| shipping_street  | strings      | null: false |
| shipping_building| text         | 
| phone            | integer      | null: false |
| user_id          | references   | null: false, foreign_key: true |

### Association
- belong_to :users
- belong_to :items
- has_many  :buying_record


## buying_record テーブル

| Column      | Type         | Options                      |
| ------      | ------------ | ---------------------------- |
| user_id     | references   | null: false foreign_key: true|                 |
| item_id     | references   | null: false foreign_key: true|


### Association
- belong_to :shipping_info
- belong_to :users
- belong_to :items_info