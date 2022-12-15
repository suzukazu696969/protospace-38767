# テーブル設計

##usersテーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| name               | string | NOT NULL            |
| email              | string | NOT NULL,ユニーク制約 |
| encrypted_password | string | NOT NULL            |
| profile            | text   | NOT NULL            |
| occupation         | text   | NOT NULL            |
| position           | text   | NOT NULL            |


##commentsテーブル

| Column    | Type       | Options         |
| --------- | ---------- | --------------- |
| content   | text       | NOT NULL        |
| prototype | references | NOT NULL,外部キー |
| user      | references | NOT NULL,外部キー |


##prototypesテーブル

| Column     | Type       | Options         |
| ---------- | ---------- | --------------- |
| title      | string     | NOT NULL        |
| catch_copy | text       | NOT NULL        |
| concept    | text       | NOT NULL        |
| user       | references | NOT NULL,外部キー |