# アプリ名
- plan-app

# 概要
- 『ゴミ捨て管理アプリ』です。当日のゴミ捨て予定をTopページに表示するアプリです。

# 本番環境
- https://plan-app-0508.herokuapp.com/
ログイン情報
- Eメール:test@com.1
- パシワード:11111a

# 制作背景


# README

## users テーブル

| Colum           | type      | Options     |
| --------------  | ------    | ----------- |
| nickname        | string    | null: false |
| full_name       | string    | null: false |
| email           | string    | null: false |
| password        | string    | null: false |

### Association

- has_many :garbages


## garbages テーブル

| Colum           | type       | Options           |
| --------------  | ------     | -----------       |
| day             | date       |                   |
| dow             | integer    |                   |
| category        | string     |                   |
| other           | string     |                   |
| title           | string     | null: false       |
| user            | references | foreign_key: true |
### Association

belongs_to :user