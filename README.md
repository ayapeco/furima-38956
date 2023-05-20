# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| family_name        | string | null: false              |
| first_name_kana    | string | null: false              |
| family_name_kana   | string | null: false              |
| nickname           | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :buying_records

## items テーブル

| Column              | Type         | Options                        |
| ------              | ----------   | ------------------------------ |
| items_name          | string       | null: false                    |
| items_description   | text         | null: false                    |
| category_id         | integer      | null: false                    |
| condition_id        | integer      | null: false                    |
| shipping_fee_id     | integer      | null: false                    |
| shipping_region_id  | integer      | null: false                    |
| shipping_time_id    | integer      | null: false                    |
| items_price         | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |

### Association

- has_one :buying_record
- belong_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :shipping_region
- belongs_to_active_hash :shipping_time

## shippings テーブル

| Column              | Type         | Options     |
| ------              | ------------ | ------------|
| zip_code            | string       | null: false |
| shipping_region_id  | string       | null: false |
| shipping_city       | string       | null: false |
| shipping_street     | string       | null: false |
| shipping_building   | string       | 
| phone               | string       | null: false |
| user                | references   | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :buying_record
- belongs_to_active_hash :shipping_region


## buying_records テーブル

| Column      | Type         | Options                      |
| ------      | ------------ | ---------------------------- |
| user        | references   | null: false foreign_key: true|                 |
| item        | references   | null: false foreign_key: true|


### Association
- has_one :shipping
- belong_to :user
- belong_to :item