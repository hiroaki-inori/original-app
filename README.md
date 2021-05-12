# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| --------           | ------  | -----------               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| age_id             | integer | null: false               |
| gender_id          | integer | null: false               |
| occupation_id      | integer | null: false               |
| prof_image         | image   |                           |
| position           | string  | null: false               |
| pr                 | text    | null: false               |

### Association

- has_many :questions
- has_many :comments


## questions テーブル

| Column       | Type       | Options                        |
| ------       | ------     | -----------                    |
| title        | string     | null: false                    |
| outline      | text       | null: false                    |
| content      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column          | Type       | Options                        |
| -------         | -------    | -----------                    |
| text            | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| question        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item