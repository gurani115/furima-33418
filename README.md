# README

## usersテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| last name | string | null: false |
| birthday  | string | null: false |

### Association

- has_many :exhibits
- has_many :purchases

## exhibitsテーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| product name | text   | null: false |
| explanation  | text   | null: false |
| category     | string | null: false |
| state        | string | null: false |
| delivery     | string | null: false |
| region       | string | null: false |
| day          | string | null: false |
| price        | string | null: false |

### Association

- belongs_to :users
- has_many   :purchases

## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| exhibit | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :exhibits