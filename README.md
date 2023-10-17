# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| name               | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| family_name        | string | null: false                |
| first_name         | string | null: false                |
| family_ name_kana  | string | null: false                |
| first_name_kana    | string | null: false                |
| birthday           |  date  | null: false                |

### Association
- has_many :items
- has_many :histories

## items テーブル
| Column                  | Type      | Options                        |
| ----------------------- | --------- | -------------------------------|
| item                    | string    | null:false                     |
| explanation             | text      | null: false                    |
| category                | string    | null: false                    |
| condition               | string    | null: false                    |
| burden                  | boolean   | null: false                    |
| source                  | string    | null: false                    |
| estimated_shopping_date | string    | null: false                    |
| price                   | integer   | null: false                    |
| user                    | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item

## histories テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | -------------------------------|
| user                    | reference | null: false, foreign_key: true |
| item                    | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item
- has_one :shopping_address

## shopping_addresses テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | -------------------------------|
| post_code               | string    | null :false                    |
| prefecture              | string    | null :false                    |
| city                    | string    | null :false                    |
| address                 | string    | null :false                    |
| building_name           | string    |                                |
| histories               | reference | null :false                    |

### Association
-has_one :histories
