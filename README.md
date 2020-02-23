# QiitaCommunication

![QiitaMockups](https://user-images.githubusercontent.com/46615146/75111962-a3ad4400-5682-11ea-94fa-fcb422b2fee6.jpg)

##目的
オンライン講座のコードをベースに、swiftのプログラム処理の流れを理解するために一から作成しています。
基本デザインはオリジナルと同じです。


##工夫したところ
・コミットを頻繁に行い、作成の流れを記録。
・Result<Success,Failure:Error>型、UI部品実装のように参考になる箇所はevernoteに記載して自分のものにした。
・頻繁にビルドをしてエラー発生を防ぎ、エラー発生時はprint()、breakPointを入れることで不具合箇所を確認してコードを修正。


##苦労したところ
一つ実装するたびにビルドしていたので、大きなバグは発生しなかったのですが、
・func()の入れ忘れ
・APIモデルでIntで宣言しないといけない箇所に、Stringを入れていたことでエラー発生


##参考URL
Sean Allenさんの講座をベースに作成。
すべてコードベースで記載。
https://seanallen.teachable.com/

