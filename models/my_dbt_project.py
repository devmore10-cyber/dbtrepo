def model(dbt, session):

    dbt.config(materialized="table")

    df = session.table("SBI_DB.SBI_SCHEMA.CUSTOMER")

    return df.filter(df["FIRSTNAME"] == "Priya")