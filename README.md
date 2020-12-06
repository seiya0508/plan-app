# アプリ名
## plan-app

# 概要
『ゴミ捨て管理アプリ』です。当日のゴミ捨て予定をTopページにお知らせ表示する機能となります。

# DEMO
[![Image from Gyazo](https://i.gyazo.com/f35ea9e8f98a421f1fddc7935bfce1ce.gif)](https://gyazo.com/f35ea9e8f98a421f1fddc7935bfce1ce)


# 本番環境
https://plan-app-0508.herokuapp.com/
### ログイン情報
- Eメール:test@com.1
- パスワード:11111a

# 開発理由
私の日常の問題解決ができるアプリを開発したいと思い、毎日繰り返す作業や何度もミスをしてしまう事柄を題材にする事を考えました。私は、ゴミ捨ての曜日・種類がなかなか覚えられずゴミ捨てを忘れてしまう事がよくありましたので開発に至りました。

# 使用してみた感想(個人)
私は大変面倒臭がり屋なのでカレンダー方式も考えましたが、カレンダー予定を確認する事自体を怠ると考え、その日の予定だけをTopページに表示する事で見た目も機能もシンプルで毎朝の確認も簡単なのでゴミ捨て忘れを改善する事ができました。

# 追加したい機能(個人)
「whenever gem」を使用して、前日の何時から表示させるといった指定をする事により前日に20:00から表示といった指定表示機能を追加実装していきたいです。

# 使用してもらった感想(第三者)
- 便利ではあるが需要は少ない
- 個人よりも、複数の人でゴミ捨て当番制のある人の方が便利
- 朝の確認が楽になった
- 携帯画面のサイズに合っていたら便利

# 追加したい機能(第三者)
- lineに通知が来る仕様にして欲しい
- 隔週でゴミ捨て内容が変わる地域もあるので対応して欲しい
- web内からユーザーの住まいのゴミ捨てマニュアルlinkに移動できたら便利

# 使用技術(開発環境)
### バックエンド
Ruby,Ruby on Rails
### フロントエンド
HTML,CSS
### データベース
MySQL,SequelPro
### テスト
RSpeck
### エディタ
VSCode

# DB設計

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

- belongs_to :user

