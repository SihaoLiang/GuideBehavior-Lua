Behaveior = {}

--节点类型
Behaveior.BTNodeType =
{
    BEHAVEIOR_BASE_NODE = 1,
}


Behaveior.SuccessProlicy =
{
    SUCCESS_ALL,
    SUCCESS_ONE,
}

--节点状态
Behaveior.Status =
{
    READY   = 0,   --READY: 准备状态，节点还没有被调用过。或者已经调用结束被Reset之后的状态
    SUCCESS = 1,   --SUCCESS: 运行成功
	FAILURE = 2,   --FAILURE: 运行失败
	RUNNING = 3,   --RUNNING: 正在运行的状态，通常父节点会等待子节点Runing结束才会将自己的状态标示为结束，当然部分节点不会理会子节点的Runing状态
	ERROR 	= 4,   --FAILURE: 运行出错
}

--生成ID
Behaveior.GetUUID = function()
    local seed = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'}
    local tb = {}
    for i =1,32 do
        table.insert(tb, seed[math.random(1,16)])
    end
    return  table.concat(tb)
end

return Behaveior