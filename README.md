# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| name               | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| family_name        | string | null: false                |
| first_name         | string | null: false                |
| family_name_kana   | string | null: false                |
| first_name_kana    | string | null: false                |
| birthday           |  date  | null: false                |

### Association
- has_many :items
- has_many :histories

## items テーブル
| Column                     | Type       | Options                        |
| -------------------------- | ---------- | -------------------------------|
| item                       | string     | null: false                    |
| explanation                | text       | null: false                    |
| category_id                | integer    | null: false                    |
| condition_id               | integer    | null: false                    |
| burden_id                  | integer    | null: false                    |
| prefecture_id              | integer    | null: false                    |
| estimated_shopping_date_id | integer    | null: false                    |
| price                      | integer    | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :history

## histories テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | -------------------------------|
| user                    | reference | null: false, foreign_key: true |
| item                    | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_addresses テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | -------------------------------|
| post_code               | string    | null :false                    |
| prefecture_id           | integer   | null :false                    |
| city                    | string    | null :false                    |
| address                 | string    | null :false                    |
| building_name           | string    |                                |
| history                 | reference | null :false, foreign_key: true |
| telephone               | string    | null :false                    |

### Association
- belongs_to :history
