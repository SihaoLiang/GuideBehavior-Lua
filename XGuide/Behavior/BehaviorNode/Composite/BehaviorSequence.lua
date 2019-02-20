BehaviorSequence = XClass(BehaviorCompositeNode)

function BehaviorSequence:Ctor(parent,params)
    BehaviorCompositeNode.Ctor(self,parent,params)
    self.CurRunningIndex = 1
end

function BehaviorSequence:Tick()
    
    local childrenCount = self:GetChildrenCount()

    if childrenCount <= 0 then
        return Behaveior.Status.ERROR
    end

    local childNode = self.Children[self.CurRunningIndex]
    local status = childNode:Tick()

    if status ==  Behaveior.Status.FAILURE then
        self.Status = Behaveior.Status.FAILURE 
    end

    if status ==  Behaveior.Status.ERROR then
        self.Status = Behaveior.Status.ERROR 
    end

    if self.CurRunningIndex ==childrenCount then
        self.Status = Behaveior.Status.SUCCESS
    end

    if status == Behaveior.Status.SUCCESS then
        self.CurRunningIndex = self.CurRunningIndex + 1
    end

    return self.Status
end

function BehaviorSequence:Reset()
    BehaviorCompositeNode.Reset(self)
    self.CurRunningIndex = 1
end