# QiitaCommunication

![QiitaMockups](https://user-images.githubusercontent.com/46615146/75111962-a3ad4400-5682-11ea-94fa-fcb422b2fee6.jpg)

## 目的
オンライン講座のコードをベースに、swiftのプログラム処理の流れを理解するために一から作成しています。
<br>
基本デザインはオリジナルと同じです。
<br>
<br>
## 工夫したところ
・コミットを頻繁に行い、作成の流れを記録。
<br>
・Result<Success,Failure:Error>型、UI部品実装のように参考になる箇所はevernoteに記載して自分のものにした。
<br>
<br>
## 苦労したところ

### 実装
・APIドキュメントの確認 → 通信するModelの定義
<br>
・初めて知るシンタックスの理解(Qiitaをメインに使っていました)
<br>
・NSLayoutConstraintの仕組みの理解(こちらはSean AllenさんのYouTubeチャンネルを利用)

### エラー、バグ発生時
一つ一つ実装するたびにビルドしていたので、大きなエラーは発生しなかったのですが、
<br>
・UI部品において、initへのfunc()の入れ忘れ
<br>
・通信をするモデルIntで宣言しないといけない箇所に、Stringを入れていた
<br>
ことが原因で発生したエラー、バグはprint()、breakPointを入れることで
<br>
不具合箇所を確認してコードを修正していきました。

<br>
<br>
<br>

## 参考URL
Sean Allenさんの講座をベースに作成。
<br>
すべてコードベースで記載。
<br>
https://seanallen.teachable.com/

