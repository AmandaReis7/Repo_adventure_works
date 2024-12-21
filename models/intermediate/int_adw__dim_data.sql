with 
    raw_generated_data as (
        {{ dbt_date.get_date_dimension("2011-01-01", "2050-12-31") }}
),
    base_data as (
        select
            date_day as fk_data,
            prior_date_day as data_anterior,
            next_date_day as data_proxima,
            day_of_week as dia_da_semana,
            day_of_week_name as dsc_dia_da_semana,
            day_of_month as dia_do_mes,
            day_of_year as dia_do_ano,
            week_of_year as semana_do_ano,
            month_of_year as mes_do_ano,
            month_name_short as dsc_mes_do_ano,
            quarter_of_year as quadrimestre,
            year_number as ano,
        from 
     raw_generated_data
)
select *
from base_data