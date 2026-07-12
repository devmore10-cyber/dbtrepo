create or replace procedure pr_cal_gratuity (p_empno number)
returns varchar  
language sql
as 
$$  
declare  
    v_name varchar;
    v_Sal number;
    v_gratuity number;
begin

 select  ename,sal,(sal * datediff('years',hiredate,dor) * 15) / 26 as gratuity 
 into v_name,v_Sal,v_gratuity
 from emp where empno=:p_empno;

 update emp set gratuity=:v_gratuity where empno=:p_empno;
 
  return 'Gratuty updated for '||v_name;
end;
$$;
