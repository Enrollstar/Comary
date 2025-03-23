--1 使用delete删数据库数据
--因张三调离，请删除Staff表、Wage表中与张三相关的信息。
delete from Wage where JobNumber='HP006'
delete from Staff  where Name='张三'

--2 使用update 修改数据库数据。
--(1)因刘星从研发部转到学术部，给其加1000工资。
update Wage  set Wage=Wage+1000 
--(2)因工作调动，科尔将籍贯改到了“梧州藤县”。
update Staff set Birthplace where Birthplace='梧州藤县'
--(3)年底，公司在原来工资水平再给每个员工多发2000工资。
update Wage set Wage=Wage+2000
--3 查询staff表获取工龄不是2年的员工的Name、WorkingAge、Birthplace，并分
--别重命名为姓名、工龄、籍贯
select Name 姓名,WorkingAge 工龄,Birthplace 籍贯  from Staff where WorkingAge<2
--4 查询staff 表获取工号为HP002、HP006、HP03、HP05的员工的所有信息
select * from Staff where JobNumber in ('HP002','HP006','HP003','HP005')
--5 查询Staff表获取姓“马”的员工信息。
select * from staff where Name='马'
--6 查询Staff表获取公司总共在职员工总人数。
select count(*) from Staff 
--7 查询 wage表获取3月1日公司支付薪资总金额
select count(Wage) from Wage where ReleaseTime='3-1'
--8 查询 Wage表获取每个部门平均工资，并按照降序排列。
select DepartmentNumber,avg(Wage) from Wage group by DepartmentNumber order by avg(Wage) desc
--9 查询 wage表每个部门平均工资，获得平均工资大于6700 的部门
select DepartmentNumber,avg(Wage) from Wage group by DepartmentNumber having  avg(Wage)>6700
--10内联接查询。
--(1)查询所有员工的薪资及Staff表的基础信息。
select w.DepartmentNumber,s.JobNumber from Wage w inner join Staff s on w.DepartmentNumber=s.JobNumber
--(2)查询周杰伦薪资。
select w.Wage from  Wage w inner join Staff s on w.JobNumber=s.JobNumber where Name='周杰伦'
--(3)查询员工姓名、工龄、薪资。
select s.Name,s.WorkingAge,w.Wage from Wage w inner join Staff s on w.JobNumber=s.JobNumber 
--11 通过左外联接技术联接Wage表和Staff表。
select * from Wage w left join Staff s on w.JobNumber=s.JobNumber
--12 通过右外联接技术联接表Department和Wage表。
select * from Wage w right join Staff s on w.JobNumber=s.JobNumber