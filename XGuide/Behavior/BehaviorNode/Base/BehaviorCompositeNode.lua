BehaviorCompositeNode = XClass(BehaveiorNode)

function BehaviorCompositeNode:Ctor(parent,params)
    BehaviorNode.Ctor(self,parent,params)
    self.Children = {}
end

function BehaviorCompositeNode:AddChild(node)
    table.insert(self.Children,node)
end

function BehaviorCompositeNode:GetChildrenCount()
    return #self.Children
end