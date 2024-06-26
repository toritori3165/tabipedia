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
* ログインID : manemane3@gmail.com
* ログインパスワード : manemane3


# 利用方法
* 調べたい旅行の情報を検索窓、または地図から検索する
* ユーザー情報を登録をする
* 旅行情報を投稿する
* 1旅行の中の細かい旅程を1日目、2日目、3日目、などに分けて投稿可能


# アプリケーションを作成した背景
### "旅の経験者のリアルな声がわかる、旅行情報共有SNSを作りたい"
自分で旅行に行くときに、事前の情報収集によくSNSを使っていたが、旅行専門のSNSがあったらより便利ではないかと考えたのが、開発のきっかけ。  
<br> 
以下のようなユーザー向けに作成。
* 旅行の情報、特に観光雑誌やサイトに載っていないおすすめ情報を知りたいユーザー
* 旅程を組むコツや移動のコツなど、旅の経験者の生の声を知りたいユーザー
* おすすめの旅行、旅程の組み方等を共有したいユーザー


# 実装予定の機能
* いいね機能追加
* フォロー機能追加
* 写真複数投稿機能、動画投稿機能追加


# データベース設計
![alt text](<スクリーンショット 2024-05-01 14.11.17.png>)


# 画面遷移図
![alt text](<スクリーンショット 2024-04-29 13.02.19.png>)


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
* 旅行全体の情報を保存する親テーブルと、日程別の旅程の詳細を保存する子テーブルを用意
* 検索機能は、投稿タイトルと地名の双方で部分一致で検索可能にした
* ボタンにホバーアニメーションを実装、直感的なUIや使って楽しいUIを意識
* フロント背景にスライドショーを取り入れ、旅行欲を喚起する、ワクワクするフロント面に仕上げた


# 改善点
* Google Mapが正常に表示されないので改善する
* Google Mapのピンの精度を上げる
* いいね機能やフォロー機能の実装


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

- has_many :trips, dependent: :destroy
- has_many :trip_comments, dependent: :destroy
- has_many :plan_comments, dependent: :destroy


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
- has_many :trip_comments, dependent: :destroy


### ■ plans テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| days_id                   | integer    | null: false                    |
| plan_title                | string     | null: false                    |
| content                   | text       | null: false                    |
| trip                      | references | null: false, foreign_key: true |

- belongs_to :trip
- has_many :plan_comments, dependent: :destroy


### ■ trip_comments テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| text                      | text       | null: false                    |
| user                      | references | null: false, foreign_key: true |
| trip                      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :trip


### ■ plan_comments テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| text                      | text       | null: false                    |
| user                      | references | null: false, foreign_key: true |
| plan                      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :plan