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
| product_name | text      | null: false                    |
| explanation  | text      | null: false                    |
| category_id  | integer   | null: false                    |
| state_id     | integer   | null: false                    |
| delivery_id  | integer   | null: false                    |
| region_id    | integer   | null: false                    |
| day_id       | integer   | null: false                    |
| price        | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true | 

### Association

- belongs_to :users
- has_many   :purchases

## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| exhibit | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :delivery

## deliveryテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal_code | integer | null: false |
| prefectures | string  | null: false |
| town        | string  | null: false |
| numbering   | integer | null: false |
| building    | string  |             |
| telephone   | integer | null: false |

### Association

- belongs_to :purchases