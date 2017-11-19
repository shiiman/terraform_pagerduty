# PagerDutyで使用するterraformコードのテンプレート

terraform version: 0.11.0


## 実行方法

実行はトップにある`terraform_execute.sh`を利用して実行します。

実行例:
```shell
./terraform_execute.sh plan
./terraform_execute.sh plan upgrade
./terraform_execute.sh apply
./terraform_execute.sh destroy
```

## 現在のディレクトリ構造
```
├── README.md
├── main.tf
├── modules
│   ├── escalation_policy
│   │   └── escalation_policy.tf
│   ├── service
│   │   └── service.tf
│   ├── service_integration_mackerel
│   │   └── service_integration_mackerel.tf
│   ├── team
│   │   └── team.tf
│   └── user
│       └── user.tf
├── provider.tf
├── terraform.tfvars
└── terraform_execute.sh
```
