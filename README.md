# README

![トップイメージ画像](https://github.com/hiroaki-inori/original-app/blob/master/top-image.png?raw=true)

## アプリケーション名
Message Teacher

## アプリケーション概要
「マッチングアプリでうまく相手を誘えない」
「営業メールの書き方が下手で案件獲得ができない」
メールやメッセージアプリに関して、
どんな文章を送ればいいか悩んでいる・・・という人たちのために、
みんなで文章を考えてあげよう！という掲示板型お悩み相談アプリです。


## 本番環境

### URL
http://18.180.137.107/

### テスト用アカウント
メールアドレス：test@test.com
パスワード：a123456

### 利用方法
- ログイン後、ページ下部の【メッセージの相談をする】をクリック

- 相談したい内容を記述し投稿

- 他の人の相談内容を見て、答えてあげられそうだったらコメントで答えてあげる

- 他の人のアドバイスを見て、参考になりそうコメントに「いいね！」ボタンを押す

- 相談を終了したい場合は、自分の相談ページの【相談を終了する】をクリック


## 制作背景

コロナ禍でオンラインのやりとりが増加している昨今、
メールやメッセージアプリを利用する機会が増えています。

仕事面では、対人ではなくメール営業も増加。
プライベート面でも、ある調査によると、
マッチングアプリの利用者の３割はコロナの影響で始めたと回答しています。

つまり、公私ともにメールの重要性が深まったと言えます。

また、自身の経験においても、
怒っている先輩の気持ちを逆撫でせず謝罪する文章を考えていたら
気づけば30分もLINE画面を見つめていたり、
出会い系サイトで時間をかけてやりとりするも、実際会うまでに至らなかったことなどが多々あリました。

そんな時、自身の返信内容をアドバイスしてくれるメンターがいたらなと思っていました。
そんな経験から、同じ思いをしている人たちを助けたいという気持ちと、
今の時代に合ったサービスが作れないかと思い考案しました。<br><br>


## DEMO & 工夫したポイント

[![Image from Gyazo](https://i.gyazo.com/5b70db1f97080e90e2a7c05fa3348f24.gif)](https://gyazo.com/5b70db1f97080e90e2a7c05fa3348f24)

全体画面<br><br>

[![Image from Gyazo](https://i.gyazo.com/167613ec0c365b791dd6f4e9f5581c04.gif)](https://gyazo.com/167613ec0c365b791dd6f4e9f5581c04)
【工夫したポイント】<br>
相談内容の文面をただ単に文章の羅列ではなく、LINE風に表示することでより内容を理解しやすくなリます。<br><br>

[![Image from Gyazo](https://i.gyazo.com/571f1e0ee8c7dd66bf653525885d7061.gif)](https://gyazo.com/571f1e0ee8c7dd66bf653525885d7061)
コメントに対する「いいね機能」。いいねの数字が見えることで、参考にすべき内容が把握しやすくなリます。<br><br>
【工夫したポイント】<br>
「いいね！」を多く貰っているユーザーのアドバイスは参考になるものも多いでしょう。そこで過去通算で「いいね！」を多く貰ったユーザーの文章は青文字で大きく表示される仕組みになっています。<br><br>

[![Image from Gyazo](https://i.gyazo.com/8f5de14b8fa5defa7a00ec3ab8f53085.png)](https://gyazo.com/8f5de14b8fa5defa7a00ec3ab8f53085)
[![Image from Gyazo](https://i.gyazo.com/48c1d3a3523799fb335669592da8aa25.png)](https://gyazo.com/48c1d3a3523799fb335669592da8aa25)
「いいね！」をたくさん貰ったユーザーは「レジェンドティーチャー」の称号が与えられ、
TOPページ一覧に表示されます。<br>
さらに、いいね1つ貰うごとに1ポイント貯まり、そのポイントで賞品と交換できます。(交換ページは今後実装予定)。<br>
ただ質問に答えてあげるだけでなく、称号が与えられたり、ポイントを貰ったりすることで
回答者側のモチベーションも大きく上がるはずです。<br><br>

## 課題や今後実装したい機能

### 課題
#### 【利便性とマネタイズ化】
- LINEやメールは素早く返信することも大事なので、質問して回答を受けて、そのアドバイスを実行するまでの流れはより早い方が良いと思います。そのため、投稿者がアドバイスの情報を得るまでの流れをより早くする必要があリます。
- サイトを運営する上でマネタイズ化は必須条件。広告案件の他、ポイント購入＆消費システムなどもつけていきたいと思っています。もちろん基本は無料。有料にすることでの付加価値も考えていきたいです。<br><br>

### 実装したい機能

#### 【ポイント購入機能&個別相談機能】
ポイントを購入して、レジェンドティーチャーに有料で個別相談に乗ってもらうことができる<br><br>

#### 【ポイント交換機能】
貯めたポイントを賞品と交換ができる。他のレジェンドティーチャーへの有料個別相談に使うことも可能<br><br>

#### 【自分の相談投稿にコメントを貰ったら、登録したメールに届く機能】
メール返信は素早さが大事なので、コメント返信があるとメール通知が来る機能を実装<br><br>

## 使用技術(開発環境)
- ruby 2.6.5
- Rails 6.0.3.7
- MySQL 5.6.51
- Nginx
- AWS
- EC2
- RSpec

## DB設計

### users テーブル

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
| like_point         | integer | null: false               |

#### Association

- has_many :questions
- has_many :comments
- has_many :comment_likes


### questions テーブル

| Column       | Type       | Options                        |
| ------       | ------     | -----------                    |
| title        | string     | null: false                    |
| outline      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| close        | boolean    | null: false, default: false    |


#### Association

- belongs_to :user
- has_many :comments


### comments テーブル

| Column          | Type       | Options                        |
| -------         | -------    | -----------                    |
| text            | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| question        | references | null: false, foreign_key: true |


#### Association

- belongs_to :user
- belongs_to :question
- has_many :comment_likes



### messages テーブル

| Column          | Type       | Options                        |
| -------         | -------    | -----------                    |
| who_id          | integer    | null: false                    |
| sentence        | text       | null: false                    |
| question        | references | null: false, foreign_key: true |


#### Association

- belongs_to :question


### comment_likes テーブル

| Column          | Type       | Options                        |
| -------         | -------    | -----------                    |
| user            | references | null: false, foreign_key: true |
| comment         | references | null: false, foreign_key: true |


#### Association

- belongs_to :user
- belongs_to :comment
