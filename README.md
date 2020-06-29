# sfdx-shellscript
sfdxコマンドをラップするシェルスクリプト群  
使い勝手を良くするためのコマンドを作っています。
WindowsではGitBashからの利用を、またはMacのターミナルからの利用を想定しています。

## ■前提条件  
### ■Windows  
1. Git Bash  
1. VSCode  
1. Sfdx Cli  
  
### ■Mac OS  
1. VSCode  
1. Sfdx Cli  

### ■Linux Commandの知識
cd , ls , pwd などのコマンド知識。  
[WindowsでGitを始めたらまず確認！Git Bashの設定&ショートカット](https://www.granfairs.com/blog/staff/gitbash-setting-shortcut)  
[ブクマ必至！Linuxコマンド一覧表【全33種】](https://www.sejuku.net/blog/5465)  
  
  
## 注意事項
期待しているSalesforceの環境にログインできていることを確認したうえで実行してください。  

sfdxコマンド長すぎるので、短くしたい。ついでに機能を便利に書き換えたいのでシェルで書いています。  
単純にキー入力を短くするだけならaliasでいいと思います。

設定に問題がなければ、シェルコマンドの実行でsfdxコマンドが動作するはず。  
※本シェルを使用して起きるいかなる不具合もサポートできません。自己責任でお願いします。  

コマンドはプロジェクトフォルダで実行する想定です。  
sfdx-project.json とか　force-appがあるフォルダです。  

## 導入方法
git bash上で、取得したshellscriptsフォルダに移動後、`setup`コマンドを実行することで、\~/.bash_profileにパスを通すようにしました。   
うまく動作しない場合はローカルPC上に取得後、ダウンロードしたフォルダのパスを\~/.bashrc、\~/.bash_profileなどのPATHに追加してください。    
`PATH=$PATH:{ダウンロードしたフォルダのフルパス。}`  
.bash_profileが存在しない場合には、`touch ~/.bash_profile`でファイルを作成し、`PATH=$PATH`を書き込んで保存してください。  

`sfCommandList`で、利用できるシェルの一覧と簡単な説明を表示します。  
  

### ユーティリティ系
`sfexec <filepath>` : 指定したファイルのApexコードを実行します。ファイルはパス指定  
`soql <soql query>` : SOQL文を実行します。  
       `soql "select id , name from Account where Name='test' limit 10"`  
`getObjectInfo {-I | -a | -N} <sObjectName>`　:　
       カスタムメタオブジェクトのAPI名を一覧表示。（自分に参照権限があるもののみ。）  
`retrieve` : `sfdx force:source:retrieve --manifest ./manifest/package.xml`　
       /manifest/package.xmlでメタデータを取得します。
`deploy 10 ./force-app/main/default/class/ \*.cls` : 10分以内に更新されたclsファイルをデプロイ  
`getCoverage {-d <ClassName> | -i <ClassName> | -a }`　: get Coverage rate. カバレッジ率を取得します。  
　　　　　　　　-d:指定したクラスのカバレッジ状況（行番号）を表示します。  
　　　　　　　　-i:指定したクラスのカバレッジ率を表示します。  
　　　　　　　　-a:全てのクラスのカバレッジ率を表示します。  
`sfGetDebugLevelId <Debuglevel Name>}`:DebugLevelIdをDebug level Name指定で取得します。
　　　　"sfGetDebugLevelId -d SFDC_DevConsole"  
`sfTraceFlagReference {-I <UserId> | -N <Name> } `:reference TraceFlagId.  
　　　　UserIDまたはUser.Name項目で特定できるデバッグログの追跡フラグ（TraceFlag）のIDを取得します。  
`sfTraceFlagCreate {-d <DebugLevel Name>} {-i <User Id> | -N <User Name> }`:create TraceFlag.   
　　　　IDまたはName項目で特定できるデバッグログの追跡フラグ（TraceFlag）を、-dで指定したDebugLevelかつ現在時刻で作成します。  
`sfTraceFlagUpdate {-i <ID> | -I <UserId> | -N <Name> } `:update TraceFlag.  
　　　　ID(TraceFlag)またはUserIDまたはUser.Name項目で特定できるデバッグログの追跡フラグ（TraceFlag）を現在時刻で更新します。  
`sfRemoveLogs {-i <UserId> | -N <UserName>}`:remove ApexLogs. IDまたはNameで指定したApexLogを削除します。  
`sendmsg`:send message to Slack channel. `echo 'hogehoge' | sendmsg`でSlackのChannel上にメッセージを送信します。    
  
## ログ系
`sft` : `sfdx force:apex:log:tail` replace command.  
`sftd` : `sfdx force:apex:log:tail |grep DEBUG --color=auto;`  
`sftf` : `sfdx force:apex:log:tail | grep -e "FATAL" -e ": line" --color=auto;`  
  
  
## テスト系
`th {testClassName,･･･}`　: テストを実行、結果表示します。（表示：human形式）  
`thc {testClassName,･･･}`　: カバレッジ付きでテストを実行、結果表示します。（表示：human形式）  
`tt {testClassName,･･･}` : テストを実行、結果表示します。（表示：tap形式）  
`ttc {testClassName,･･･}`　: カバレッジ付きでテストを実行、結果表示します。（表示：tap形式）  


