BehaviorParallelNode = XClass(BehaviorCompositeNode)
--并行节点
--由于是用于新手引导，所以全部子节点成功才算成功
function BehaviorParallelNode:Ctor(parent,params)
    BehaviorCompositeNode.Ctor(self,parent,params)
    self.SuccCount = 0
end

function BehaviorParallelNode:Tick()
    
    local childrenCount = self:GetChildrenCount()

    if childrenCount <= 0 then
        return Behaveior.Status.ERROR
    end

    for index = 1, childrenCount do
        
        local childNode = self.Children[index]

        local status = childNode:Tick()

        if status ==  Behaveior.Status.FAILURE then
            self.Status = Behaveior.Status.FAILURE 
        end
    
        if status ==  Behaveior.Status.ERROR then
            self.Status = Behaveior.Status.ERROR 
        end
    
        if(status == Behaveior.Status.SUCCESS) then
            self.SuccCount = self.SuccCount + 1
        end

        if self.SuccCount == childrenCount then
            self.Status = Behaveior.Status.SUCCESS
        end
    end

    return self.Status
end