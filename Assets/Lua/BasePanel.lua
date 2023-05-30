   --利用面向对象
Object:subClass("BasePanel")
BasePanel.panelObj = nil
-- 模拟一个字典,键为控件名,值为控件本身
BasePanel.controls = {}
--事件监听标识
BasePanel.isInitEvent =false
function BasePanel:Init(name)
    if self.panelObj == nil then 
        -- 公共的面板实例化方法
        self.panelObj = ABMgr:LoadRes("ui",name,typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas,false)
        --找到所有UI控件的存起来,实际找是的UI控件的父类 UIBehaviour
        local allControls = self.panelObj:GetComponentsInChildren(typeof(UIBehaviour))
        -- 为了避免存入用不上的UI控件,必须制定一个拼面板时给控件命名的规范
        --Button btn开头命名
        --Toggle tog开关命名
        --Image img开关命名
        --ScrollRect sv开关命名
        for i = 0, allControls.Length -1 do   --遍历的C#数组,索引从0开始,右边界值 -1,lua的遍历可以取到右边界值
            local controlName = allControls[i].name
            --按照命名规范找控件,满足命名规则的才存起来
            if string.find(controlName,"btn")~=nil or
                    string.find(controlName,"tog")~=nil or
                    string.find(controlName,"img")~=nil or
                    string.find(controlName,"sv")~=nil or
                    string.find(controlName,"txt")~=nil then
                --为了在取控件的时候,确实控件类型,要存储类型
                --利用反射 Type得到控件的类名
                --最终存储形式：{btnRole = {Immage = 控件,Button = 控件},togItem = {Toggle = 控件}}
                local typeName = allControls[i]:GetType().Name
                if self.controls[controlName]~=nil then
                    self.controls[controlName][typeName] = allControls[i]
                else
                    self.controls[controlName] = {[typeName] = allControls[i]}
                end
            end
        end
    end
end 
--得到控件 根据控件依附对象的名字及控件类型名的字符串 Button Image Toggle
function BasePanel:GetControl(name,typeName)
    if self.controls[name]~=nil then
        local sameNameControls = self.controls[name]
        if sameNameControls[typeName]~=nil then
            return sameNameControls[typeName]
        end
    end
    return nil
end
function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObj:SetActive(true)
end 
function BasePanel:HideMe()
    self.panelObj:SetActive(false)
end 