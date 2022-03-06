# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |
| name_sei           | string | null: false             |
| name_mei           | string | null: false             |
| kana_sei           | string | null: false             |
| kana_mei           | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| product      | string     | null: false                   |
| explanation  | text       | null: false                   |
| category_id  | integer    | null: false                   |
| status       | string     | null: false                   |
| postage      | string     | null: false                   |
| prefectures  | string     | null: false                   |
| delivery_day | integer    | null: false                   |
| price        | integer    | null: false                   |
| user         | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| item      | references | null: false,foreign_key: true |
| user      | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column       | Type       | Options                 |
| ------------ | ---------- | ----------------------- |
| postcode     | integer    | null: false             |
| prefectures  | integer    | null: false             |
| municipality | string     | null: false             |
| address      | string     | null: false             |
| building     | string     | null: false             |
| phone        | string     | null: false             |
| purchase     | references | null: false,foreign_key |

### Association

- belongs_to :purchase
