/**
* 1. 删除变速箱检查状态
*/
drop trigger tri_gearbox_del
go
create trigger tri_gearbox_del
on t_ats_gearbox
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end


go
/**
* 1. 删除车辆分类检查状态
*/
drop trigger tri_carType_del
go
create trigger tri_carType_del
on t_ats_cartype
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end

go
/**
* 1. 删除车辆来源检查状态
*/
drop trigger tri_carSource_del
go
create trigger tri_carSource_del
on T_ATS_CarSource
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end
go
/**
* 1. 删除动力形式检查状态
*/
drop trigger tri_powerForm_del
go
create trigger tri_powerForm_del
on T_ATS_PowerForm
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end
go
/**
* 1. 删除排量检查状态
*/
drop trigger tri_displacement_del
go
create trigger tri_displacement_del
on T_ATS_Displacement
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end

go
/**
* 1. 删除品牌检查状态
*/
drop trigger tri_brand_del
go
create trigger tri_brand_del
on T_ATS_Brand
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end


go
/**
* 1. 删除驱动形式检查状态
*/
drop trigger tri_driverform_del
go
create trigger tri_driverform_del
on T_ATS_DriverForm
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end

go
/**
* 1. 删除车系检查状态
*/
drop trigger tri_series_del
go
create trigger tri_series_del
on T_ATS_series
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end
go
/**
* 1. 删除车型检查状态
*/
drop trigger tri_series_del
go
create trigger tri_series_del
on T_ATS_Series
for delete
as
begin
	set nocount on;
	declare @number varchar(50);
	declare @status int;
	declare cur cursor local for select FNumber,FStatus from deleted;
	open cur;
	fetch cur into @number,@status
	while(@@FETCH_STATUS=0)
	begin
		if (@status >= 2) 
		begin
			raiserror('已启用或已禁用不允许删除',16,1)
		end
		fetch next from cur into @number,@status
	end
	close cur;
	deallocate cur;
end


go