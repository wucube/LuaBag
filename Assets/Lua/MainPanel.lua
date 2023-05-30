
--只要是一个对象（面板）就新建一个表
BasePanel:subClass("MainPanel")

--初始化该面板 实例化对象 控件事件监听
function MainPanel:Init(name)
    self.base.Init(self,name)
    if self.isInitEvent ==false then
        print(self:GetControl("btnRole","Image"))
        self:GetControl("btnRole","Button").onClick:AddListener(function()
            self:BtnRoleClick()
        end)
        self.isInitEvent = true
    end
end
function MainPanel:BtnRoleClick()
    --print(123123123)
    --print(self.panelObj)
    BagPanel:ShowMe("BagPanel")
end   