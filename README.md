# README

## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| kana_first_name     | string | null: false               |
| kana_last_name      | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| product_name | string    | null: false                    |
| explanation  | text      | null: false                    |
| category_id  | integer   | null: false                    |
| state_id     | integer   | null: false                    |
| delivery_id  | integer   | null: false                    |
| region_id    | integer   | null: false                    |
| day_id       | integer   | null: false                    |
| price        | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one    :purchase

## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery

## deliverysテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| postal_code | string    | null: false                    |
| region_id   | integer   | null: false                    |
| town        | string    | null: false                    |
| numbering   | string    | null: false                    |
| building    | string    |                                |
| telephone   | string    | null: false                    |
| purchase    | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase