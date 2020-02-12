# sfdx-shellscript
sfdxコマンドをラップするシェルスクリプト群

## ■前提条件  
### ■Windows  
1. Git Bash  
1. VSCode  
1. Sfdx Cli  
で動かす前提です。  
  
### ■Mac OS  
1.VSCode  
1.Sfdx Cli  
で動かす前提です。  
  
期待しているSalesforceの環境にログインできていることを確認したうえで実行してください。  

sfdxコマンド長すぎるので、短くしたい。ついでに便利に書き換えたいのでシェルで書いています。  
短くするだけならaliasでいいと思います。  

git bash上で、取得したshellscriptsフォルダに移動後、`setup`コマンドを実行することで、\~/.bash_profileパスを通すようにしました。  
上記を実行しない場合はローカルPC上に取得後、ダウンロードしたフォルダのパスを\~/.bashrc、\~/.bash_profileなどのPATHに追加してください。  
PATH=$PATH:{ダウンロードしたフォルダのフルパス。}  
.bash_profileが存在しない場合には、`touch ~/.bash_profile`でファイルを作成し、`PATH=$PATH`を書き込んで保存してください。  

`sfCommandList`で、利用できるシェルの一覧と簡単な説明を表示します。  
  
設定に問題がなければ、シェルコマンドの実行でsfdxコマンドが動作するはず。  
※本シェルを使用して起きるいかなる不具合もサポートできません。自己責任でお願いします。  

コマンドはプロジェクトフォルダで実行する想定です。  
sfdx-project.json とか　force-appがあるフォルダ  

## ユーティリティ系
`sfexec {ファイル}` : 指定したファイルのApexコードを実行します。ファイルはパス指定  
`soql "{SOQL文}"` : SOQL文を実行します。 `soql "select id , name from Account limit 10"`  
`getAPINames {カスタムオブジェクト}`　:　カスタムメタオブジェクトのAPI名を一覧表示。（自分に参照権限があるもののみ。）  
`getObjectInfo {カスタムオブジェクト}` : カスタムメタオブジェクトのAPI名と項目名、型を表示。（自分に参照権限があるもののみ。）    
`retrieve` : `sfdx force:source:retrieve --manifest ./manifest/package.xml`　の置き換え   
`deploy 10 ./force-app/main/default/class/ \*.cls` : 10分以内に更新されたclsファイルをデプロイ  
`getCoverage `　: カバレッジ率を取得します。  

  
## ログ系
`sft` : `sfdx force:apex:log:tail` の置き換え  
`sftd` : `sfdx force:apex:log:tail |grep DEBUG --color=auto;`  
`sftf` : `sfdx force:apex:log:tail | grep -e "FATAL" -e ": line" --color=auto;`  
  
  
## テスト系
`th {class名}`　: テストを実行、結果表示します。（表示：human形式）  
`thc {class名}`　: カバレッジ付きでテストを実行、結果表示します。（表示：human形式）  
`tt {class名}` : テストを実行、結果表示します。（表示：tap形式）  
`ttc {class名}`　: カバレッジ付きでテストを実行、結果表示します。（表示：tap形式）  


