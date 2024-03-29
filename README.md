# README

# テーブル設計

## users テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| email                     | string     | null: false, unique: true      |
| encrypted_password        | string     | null: false                    |
| nickname                  | string     | null: false                    |
| gender_id                 | integer    | null: false                    |
| age_id                    | integer    | null: false                    |
| birthday                  | date       | null: false                    |
| prefecture_id             | integer    | null: false                    |
| profile                   | text       |                                |

- has_many :trips
- has_many :comments



## trips テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| trip_title                | string     | null: false                    |
| place                     | string     | null: false                    |
| start_date                | date       | null: false                    |
| end_date                  | date       | null: false                    |
| user                      | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :plans, dependent: :destroy
- has_many :comments, dependent: :destroy



## plans テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| days_id                   | integer    | null: false                    |
| plan_title                | string     | null: false                    |
| content                   | text       | null: false                    |
| trip                      | references | null: false, foreign_key: true |

- belongs_to :trip
- has_many :comments, dependent: :destroy



## comments テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| content                   | text       | null: false                    |
| user                      | references | null: false, foreign_key: true |
| trip                      | references | null: false, foreign_key: true |
| plan                      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :trip
- belongs_to :plan