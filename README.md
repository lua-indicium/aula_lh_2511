# aula_lh_2511

Mini projeto de **Analytics Engineering com dbt + Databricks**, desenvolvido para as aulas do Lighthouse.

Este projeto demonstra um pipeline simplificado contendo:

- Camada de staging
- Modelagem dimensional (dimensões e fato)
- Testes de qualidade de dados
- Versionamento de ambiente
- Configuração via variáveis de ambiente

---

## 🏗️ Estrutura do Projeto

```text
aula_lh_2511/
│
├── models/
│   ├── intermediate/
│   │   └── int_order.sql
│   ├── marts/
│   │   ├── dim_customer.sql
│   │   ├── dim_store.sql
│   │   ├── fct_order.sql
│   │   └── fct_order.yml
│   └── staging/
│       ├── _mysql.yml
│       ├── stg_mssql__address.sql
│       ├── stg_mssql__customer.sql
│       ├── stg_mssql__person.sql
│       ├── stg_mssql__sales_order_detail.sql
│       ├── stg_mssql__sales_order_header.sql
│       └── stg_mssql__store.sql
│
├── dbt_project.yml
├── profiles.yml
├── packages.yml
├── requirements.txt
├── .env_example
└── .gitignore
```

### Camadas

- **staging** → padronização e limpeza dos dados raw (`stg_mssql__...`)
- **intermediate** → transformações intermediárias e regras de negócio (`int_order`)
- **marts** → modelos dimensionais finais prontos para consumo (`dim_customer`, `dim_store`, `fct_order`)

---

## 🧱 Tecnologias Utilizadas

- Python 3.10.x  
- dbt-core 1.11.6  
- dbt-databricks 1.11.5  
- Databricks SQL Warehouse  

---

## 🚀 Getting Started

### 1️⃣ Criar ambiente virtual

```bash
python -m venv .venv
source .venv/bin/activate
```

### 2️⃣ Instalar dependências

```bash
pip install -r requirements.txt
```

### 3️⃣ Configurar variáveis de ambiente

Copie o arquivo de exemplo:

```bash
cp .env_example .env
```

Preencha as credenciais do Databricks no arquivo `.env`.

Depois carregue as variáveis:

```bash
source .env
```

### 4️⃣ Instalar pacotes dbt

```bash
dbt deps
```

### 5️⃣ Testar conexão

```bash
dbt debug
```

### 6️⃣ Rodar o projeto

```bash
dbt run
dbt test
```