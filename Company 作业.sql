--1 ʹ��deleteɾ���ݿ�����
--���������룬��ɾ��Staff��Wage������������ص���Ϣ��
delete from Wage where JobNumber='HP006'
delete from Staff  where Name='����'

--2 ʹ��update �޸����ݿ����ݡ�
--(1)�����Ǵ��з���ת��ѧ�����������1000���ʡ�
update Wage  set Wage=Wage+1000 
--(2)�����������ƶ�������ĵ��ˡ��������ء���
update Staff set Birthplace where Birthplace='��������'
--(3)��ף���˾��ԭ������ˮƽ�ٸ�ÿ��Ա���෢2000���ʡ�
update Wage set Wage=Wage+2000
--3 ��ѯstaff���ȡ���䲻��2���Ա����Name��WorkingAge��Birthplace������
--��������Ϊ���������䡢����
select Name ����,WorkingAge ����,Birthplace ����  from Staff where WorkingAge<2
--4 ��ѯstaff ���ȡ����ΪHP002��HP006��HP03��HP05��Ա����������Ϣ
select * from Staff where JobNumber in ('HP002','HP006','HP003','HP005')
--5 ��ѯStaff���ȡ�ա�����Ա����Ϣ��
select * from staff where Name='��'
--6 ��ѯStaff���ȡ��˾�ܹ���ְԱ����������
select count(*) from Staff 
--7 ��ѯ wage���ȡ3��1�չ�˾֧��н���ܽ��
select count(Wage) from Wage where ReleaseTime='3-1'
--8 ��ѯ Wage���ȡÿ������ƽ�����ʣ������ս������С�
select DepartmentNumber,avg(Wage) from Wage group by DepartmentNumber order by avg(Wage) desc
--9 ��ѯ wage��ÿ������ƽ�����ʣ����ƽ�����ʴ���6700 �Ĳ���
select DepartmentNumber,avg(Wage) from Wage group by DepartmentNumber having  avg(Wage)>6700
--10�����Ӳ�ѯ��
--(1)��ѯ����Ա����н�ʼ�Staff��Ļ�����Ϣ��
select w.DepartmentNumber,s.JobNumber from Wage w inner join Staff s on w.DepartmentNumber=s.JobNumber
--(2)��ѯ�ܽ���н�ʡ�
select w.Wage from  Wage w inner join Staff s on w.JobNumber=s.JobNumber where Name='�ܽ���'
--(3)��ѯԱ�����������䡢н�ʡ�
select s.Name,s.WorkingAge,w.Wage from Wage w inner join Staff s on w.JobNumber=s.JobNumber 
--11 ͨ���������Ӽ�������Wage���Staff��
select * from Wage w left join Staff s on w.JobNumber=s.JobNumber
--12 ͨ���������Ӽ������ӱ�Department��Wage��
select * from Wage w right join Staff s on w.JobNumber=s.JobNumber