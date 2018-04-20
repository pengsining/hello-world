
ALTER proc [dbo].[CarNumberQuery]   --20180404版本新增打印内容

 @CarNum varchar(30)                 --申请查询的车号或卡号
,@QueryType INT                      --查询类型: 0=精确查询；1=模糊查询；2=卡号查询（默认精确查询）
,@DeviceName  varchar(50)            --终端设备名称；判断终端用，单号开头为A/B的为自己的单，只能用终端一
                                                               --单号开头为C/D的为租户的单，只能用终端二
,@BillCode varchar(30) output        --单号
,@BillDate datetime output           --开单时间
,@BillStatus tinyint output          --单据状态 (1=过皮重;2=过毛重;3=未到称重环节;4=叫号超时;5=称重流程已结束;6=订单数据有错误;7货款未到帐)
,@BillType tinyint output            --单据类型（0=装车;1=卸车）
,@CardNum varchar(30) output         --卡号
,@CarNumber varchar(30) output       --车号
,@Customer varchar(50) output        --客户名称
,@TareBody decimal(10, 1) output     --人体皮重（千克，1位小数）
,@TareWeight decimal(10, 3) output   --车辆皮重(吨，3位小数）
,@TareWeightTime datetime output     --过皮时间
,@Preset decimal(20, 3) output       --装车预设量
,@ProductName varchar(30) output     --货物名称
,@LoadingArm int output              --装车位
,@GrossBody decimal(10, 3) output    --人体毛重（千克，1位小数）（卸车用）
,@GrossWeight decimal(10, 3) output  --车辆毛重（吨，3位小数）（卸车用）
,@GrossWeightTime datetime output    --过毛时间（卸车用）

---------20180404版本新增，用于丰富打印内容---------------------

,@ContractNumber varchar(50) output  --合同号
,@Loaded decimal(10, 3) output       --已装量
,@GrossWeightUserName varchar(50) output --毛重司磅员
,@TareWeightUserName varchar(50) output  --皮重司磅员
,@Remark varchar(300) output         --备注
,@SampleNo varchar(50) output        --样品号
,@PrintTitle varchar(50) output      --打印抬头
,@Requisition varchar(50) output     --调拨单号

-- return： 0=查询有结果     1=查询无结果

