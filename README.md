# README

## users テーブル

| Colum           | type      | Options     |
| --------------  | ------    | ----------- |
| nickname        | string    | null: false |
| full_name       | string    | null: false |
| email           | string    | null: false |
| password        | string    | null: false |

### Association

- has_many :schedules


## garbages テーブル

| Colum           | type      | Options     |
| --------------  | ------    | ----------- |
| day             | date      |             |
| dow             | string    |             |
| category        | string    |             |
| other           | string    |             |


### Association

belongs_to :user