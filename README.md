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
- has_many :comment_likes


## questions テーブル

| Column       | Type       | Options                        |
| ------       | ------     | -----------                    |
| title        | string     | null: false                    |
| outline      | text       | null: false                    |
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
- belongs_to :question
- has_many :comment_likes



## messages テーブル

| Column          | Type       | Options                        |
| -------         | -------    | -----------                    |
| who_id          | integer    | null: false                    |
| sentence        | text       | null: false                    |
| question        | references | null: false, foreign_key: true |


### Association

- belongs_to :question


## comment_likes テーブル

| Column          | Type       | Options                        |
| -------         | -------    | -----------                    |
| user            | references | null: false, foreign_key: true |
| comment         | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :comment