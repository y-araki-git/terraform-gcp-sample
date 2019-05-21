# Terraform GCP用サンプル

GCP環境をTerraformで自動構築するための、自分用サンプルです。

  - main.tfを編集する。 ※GCPアカウント系の紐づけ
  - variables.tfで踏み台からSSHするための公開鍵を記載する。
  - cloudsql.tfでgoogle_sql_userのname,passwordを修正する。
  - firewall.tfで必要なIP,ポートについて編集する。
  - instance.tfでプライベートIP含め各項目修正(SSHを22番から22201番に変更しているが必要なければ削除)
  - network.tfでプライベートIPレンジを指定。
  - その他細かい項目について環境に合わせて修正する。
