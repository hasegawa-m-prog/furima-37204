# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | text   | null: false |
| kana               | text   | null: false |
| birthday           | text   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| product     | string     | null: false |
| explanation | text       | null: false |
| user        | references | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| category  | text       | null: false |
| status    | text       | null: false |
| postage   | text       | null: false |
| region    | text       | null: false |
| days      | text       | null: false |
| price     | text       | null: false |
| item      | references | null: false |
| user      | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postcode     | text       | null: false |
| prefectures  | text       | null: false |
| municipality | text       | null: false |
| address      | text       | null: false |
| building     | text       | null: false |
| phone        | text       | null: false |
| purchase     | references | null: false |

### Association

- belongs_to :purchase
