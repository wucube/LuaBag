BasePanel:subClass("BagPanel")
BagPanel.Content = nil --Content没有挂UI控件,需要手动获取
--用来存储当前显示的格子
BagPanel.items = {}
--存储当前显示的页签类型，避免重复刷新
BagPanel.nowType = -1

function BagPanel:Init(name)
    self.base.Init(self,name)
    if self.isInitEvent ==false then
        --获取没有挂载UI的控件,还是要手动得到
        self.Content = self:GetControl("svBag","ScrollRect").transform:Find("Viewport"):Find("Content")
        self:GetControl("btnClose","Button").onClick:AddListener(function()
            self:HideMe()
        end)

        self:GetControl("togItem","Toggle").onValueChanged:AddListener(function(value)
            if value==true then
                self:ChangeType(2)
            end
        end)

        self:GetControl("togGem","Toggle").onValueChanged:AddListener(function(value)
            if value==true then
                self:ChangeType(3)
            end
        end)

        self:GetControl("togEquip","Toggle").onValueChanged:AddListener(function(value)
            if value ==true then
                self:ChangeType(1)
            end
        end)
        self.isInitEvent = true
    end
end

function BagPanel:ShowMe(name)
    self.base.ShowMe(self,name)
    -- 第一次打开时，更新数据
    if self.nowType ==-1 then
        self:ChangeType(1)
    end
end

--逻辑处理函数，用来切页签
--type 1装备 2道具 3宝石
function BagPanel:ChangeType(type)
    --判断如果已经是该页签，就不用更新
    print("当前类型为"..type)
    if self.nowType==type then
        print("nowType值"..self.nowType)
        return
    else
        self.nowType = type
    end
    --切页，根据玩家信息 创建格子
    
    --删除格子之前，如果没有格子要先创建格子
    --再根据当前选择的类型 创建新的格子 BagPanel.items
    --根据传入的type选择显示的数据
    local nowItems = nil
    if type ==1 then
        nowItems = PlayerData.equips
    elseif type==2 then
        nowItems = PlayerData.items
    else
        nowItems = PlayerData.gems
    end
    --更新之前，先删除老的格子，BagPanel.items
    for i = 1, #self.items do
        --销毁格子对象
       self.items[i]:Destroy()
    end
    self.items = {} --清除表中存储的格子内容
    --创建格子
    for i = 1, #nowItems do
        -- 根据数据创建一个格子对象
        local grid = ItemGrid:new()
        -- 要实例化对象,设置位置
        grid:Init(self.Content,(i-1)%4*175,math.floor((i-1)/4)*175)
        -- 初始化格子的信息,数量和图标
        grid:InitData(nowItems[i])
        -- 将创建的格子存起来
        table.insert(self.items,grid)
    end
end 