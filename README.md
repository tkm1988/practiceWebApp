# Django 勉強ノート

## 教材

* はじめての Django アプリ作成

<https://docs.djangoproject.com/ja/2.2/intro/tutorial01/>

## ディレクトリ構成（2019/10/26時点）

```
practiceWebApp
├── db.sqlite3
├── manage.py
├── polls
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-36.pyc
│   │   ├── admin.cpython-36.pyc
│   │   ├── apps.cpython-36.pyc
│   │   ├── models.cpython-36.pyc
│   │   ├── urls.cpython-36.pyc
│   │   └── views.cpython-36.pyc
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   ├── __init__.py
│   │   └── __pycache__
│   │       ├── 0001_initial.cpython-36.pyc
│   │       └── __init__.cpython-36.pyc
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
└── tutorial
    ├── __init__.py
    ├── __pycache__
    │   ├── __init__.cpython-36.pyc
    │   ├── settings.cpython-36.pyc
    │   ├── urls.cpython-36.pyc
    │   └── wsgi.cpython-36.pyc
    ├── settings.py
    ├── urls.py
    └── wsgi.py
```

## ノート

### コマンド

バージョン確認

```
$ python -m django --version
```

プロジェクト作成

```
$ django-admin startproject mysite

```

全てのIPアドレスからポート8080でテストサーバにアクセスさせる設定で起動する

```
$ python manage.py runserver 0:8000
```

```mysite/settings.py``` ファイルのデータベース設定に従ってデータベースマイグレーション

```
$ python manage.py migrate
```

Djangoにモデルの変更をマイグレーション の形で保存する

```
$ python manage.py makemigrations polls
```

マイグレーション時に実行されたSQLを表示する

```
$ python manage.py sqlmigrate migrationname
```

Django プロジェクトの検査

```
$ python manage.py check 
```


### モジュール説明

- ```mysite/manage.py```
	- Django プロジェクトに対する様々な操作を行うためのコマンドラインユーティリティ
	- ```django-admin``` と同様
	- 通常、単体の Django プロジェクトを用いる場合、```django-admin``` よりも ```manage.py``` の方が簡単に利用可能
	- もし複数の Django 設定ファイル間での切り替えが必要な場合は、django-admin を```DJANGO_SETTINGS_MODULE``` もしくは ```--settings``` オプションと共に利用する
-  ```mysite/``` ディレクトリ
	- このプロジェクトの実際の Python パッケージ
	- import の際に 使用する名前です (例えば ```import mysite.urls```) 
- ```mysite/__init__.py```
	- このディレクトリが Python パッケージであることを Python に知らせるための空のファイル
- ```mysite/settings.py```
	- Django プロジェクトの設定ファイル
	- 詳細は[こちら](https://docs.djangoproject.com/ja/2.2/topics/settings/)
	- ```DATABASE``` にてDB設定を行うことができ、デフォルトはSQLite
	- ```INSTALLED_APPS``` ではこのDjangoインスタンスの中で有効化されているすべてのDjangoアプリケーションの名前を保持している
		- 自身の作成しているプロジェクト配下のアプリケーションもここに記載する（例：```'polls.apps.PollsConfig'```）
		- デフォルトでは以下が定義される
		- ```django.contrib.admin``` - 管理（admin）サイト
		- ```django.contrib.auth``` - 認証システム
		- ```django.contrib.contenttypes``` - コンテンツタイプフレームワーク
		- ```django.contrib.sessions``` - セッションフレームワーク
		- ```django.contrib.messages``` - メッセージフレームワーク
		- ```django.contrib.staticfiles``` - 静的ファイルの管理フレームワーク
- ```mysite/urls.py```
	- Django プロジェクトの URL 宣言（URLconf）
		- Django サイトにおける「目次」に相当
	- 詳しくは[こちら](https://docs.djangoproject.com/ja/2.2/topics/http/urls/)
- ```mysite/wsgi.py```
	- プロジェクトをサーブするためのWSGI互換Webサーバーとのエントリーポイント
	- 詳細は[こちら](https://docs.djangoproject.com/ja/2.2/howto/deployment/wsgi/)
- ```polls/views.py```
	- アプリケーションpollsのMVCでViewにあたる部分を担うモジュール
- ```polls/urls.py```
	- アプリケーションpollsのURLconf
	- ```mysite/urls.py``` にここで定義した内容を登録する必要がある
- ```polls/models.py```
	- データベースのレイアウトと、それに付随するメタデータを定義する

### 用語

- WSGI
	- Web Server Gateway Interface (WSGI; ウィズギー) 
	- プログラミング言語Pythonにおいて、WebサーバとWebアプリケーション（もしくはWebアプリケーションフレームワーク）を接続するための、標準化されたインタフェース定義
- DRY原則
	- Don't repeat yourself
	- この哲学は、情報の重複は変更の困難さを増大し透明性を減少させ、不一致を生じる可能性につながるため、重複するべきでないことを強調
	- Once and Only Once 原則はコードの機能的な振る舞いについて言及しており、構造体やオブジェクト指向言語における継承の実現が必要な理由となっている。
	- 引用：[Wikipedia](https://ja.wikipedia.org/wiki/Don%27t_repeat_yourself)

## メモ

* dockerfileで詰まった時に参考にしたページ
  - <https://sleepless-se.net/2018/05/26/docker%E3%81%A7%E8%A4%87%E6%95%B0cmd%E3%82%92%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95/>
* Djangoのチュートリアル
  - <https://docs.djangoproject.com/ja/2.1/intro/tutorial01/>
* Python3.6をpythonで起動できるようにする
  - <http://gamsj2015.hatenablog.com/entry/2018/02/18/110419>
  - yumが2.7で実装されているので注意
* Dockerでロケールを変更する（CentOSで）
  - <https://qiita.com/yuki2006/items/6cea8c352e38f047b52a#comment-8e863c71962008035d0d>