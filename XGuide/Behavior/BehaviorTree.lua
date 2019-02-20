BehaviorTree = XClass(BehaviorNode)

function BehaviorTree:Ctor()

end

function BehaviorTree:Tick()

    if self.Root == nil then
        return Behavior.Status.ERROR
    end

   return self.Root:Execute()
end
