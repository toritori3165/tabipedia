# アプリケーション名
### たびぺディア


# アプリケーション概要
### 旅行情報SNS
* 旅行の情報、特に観光雑誌やサイトに載っていないおすすめ情報を検索できる
* 地図から近隣のおすすめスポットを検索できる
* 旅程を組むコツや移動のコツなど、旅の経験者の生の声を知ることができる
* 自分のおすすめの旅行、旅程の組み方等を投稿できる
* コメントを通じてほかのユーザーとコミュニケーションが取れる



# URL
https://tabipedia.onrender.com


# テスト用アカウント
* Basic認証ID : yuki
* Basic認証パスワード : 9969
* ログインID : tsuyoshi@gmail.com
* ログインパスワード : nakagawake1


# 利用方法
* 調べたい旅行の情報を検索窓、または地図から検索する
* ユーザー情報を登録をする
* 旅行情報を投稿する
* 1旅行の中の細かい旅程を1日目、2日目、3日目、などに分けて投稿可能



# アプリケーションを作成した背景
### 旅の経験者のリアルな声がわかる、旅行情報共有SNS
以下のようなユーザー向けに作成。
* 旅行の情報、特に観光雑誌やサイトに載っていないおすすめ情報を知りたいユーザー
* 旅程を組むコツや移動のコツなど、旅の経験者の生の声を知りたいユーザー
* おすすめの旅行、旅程の組み方等を共有したいユーザー



# 実装予定の機能
* Google Map機能
* コメント機能追加
* いいね機能追加
* 写真複数投稿機能、動画投稿機能追加


# データベース設計
![alt text](<スクリーンショット 2024-04-29 12.32.05.png>)


# 画面遷移図
![alt text](<スクリーンショット 2024-04-11 17.03.09.png>)


# 開発環境
* Ruby on Rails
* HTML, CSS
* JavaScript
* MySQL, postgreSQL
* Render
* GitHub
* テキストエディタ（VS Code）


# 工夫したポイント
* Google Mapの埋め込み
* サーバーサイド側とフロントエンド側に分かれ、2名の分業体制でアプリを開発中


# 改善点
* Google Mapが正常に表示されないので改善する
* Google Mapのピンの精度を上げる
* フロント背景にスライドショー等を取り入れ、いい景色の写真を中心にたくさん使用し、もっと旅行欲を喚起する、ワクワクするフロント面に仕上げる


# テーブル設計

### ■ users テーブル

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



### ■ trips テーブル

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



### ■ plans テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| days_id                   | integer    | null: false                    |
| plan_title                | string     | null: false                    |
| content                   | text       | null: false                    |
| trip                      | references | null: false, foreign_key: true |

- belongs_to :trip
- has_many :comments, dependent: :destroy



### ■ comments テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| content                   | text       | null: false                    |
| user                      | references | null: false, foreign_key: true |
| trip                      | references | null: false, foreign_key: true |
| plan                      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :trip
- belongs_to :plan
