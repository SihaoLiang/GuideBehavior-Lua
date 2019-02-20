local BehaviorNode = XClass()

function BehaviorNode:Ctor(parent,params)
    self.Id = Behavior.GetUUID()
    self.Name = 'Behavior' 
    self.Status = Behavior.Status.READY
    self.Parameters = params
    self.Parent = parent
    self.Description = ""
end

function BehaviorNode:Init()
   
end

function BehaveiorNode:Tick()
   return Behavior.Status.ERROR
end

function BehaviorNode:Execute()

    if self.Status == Behavior.Status.READY then
        self:Init()
    end

    self.Status = Behavior.Status.RUNNING

    self.Status = self:Tick()
    
    return self.Status
end

function BehaviorNode:Reset()
    self.Status = Behavior.Status.READY
end

return BehaviorNode