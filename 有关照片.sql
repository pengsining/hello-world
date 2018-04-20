
--------------------------
    照片表
--------------------------
CREATE TABLE [dbo].[Pictures] (
  [AutoID] int NOT NULL IDENTITY(1,1) ,
  [BillCode] varchar(30) NULL ,
  [BillStatus] tinyint NULL ,
  [BillType] tinyint NULL ,
  [Pic] varbinary(MAX) NULL ,
  [PicType] tinyint NULL ,
  [SnapDate] datetime NULL
)
ALTER TABLE [dbo].[Pictures] ADD PRIMARY KEY ([AutoID])


-----------------------------------
    存储照片
-----------------------------------
create PROC [dbo].[PicturesSav]
   @BillCode VARCHAR (30)     --提货单号
  ,@BillStatus tinyint        --单据状态： 1=皮重  2=毛重
  ,@BillType tinyint          --单据类型:  0=装车  1=卸车
  ,@Pic varbinary (MAX)=NULL  --照片
  ,@PicType tinyint           --照片类型：1车前照片(环境1)；2车后照片(环境2)；3车顶照片(环境3）；4车牌照片；5人脸照片
  ,@SnapDate datetime         --保存时间
  --输出参数
  --return返回 /0=成功  /1..=错误
AS
SET NOCOUNT ON

INSERT Pictures (
	[BillCode],
	[BillStatus],
	[BillType],
	[Pic],
	[PicType],
	[SnapDate])
  VALUES
	(@BillCode ,@BillStatus ,@BillType ,@Pic ,@PicType ,@SnapDate)

return 0

