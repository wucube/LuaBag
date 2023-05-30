-- 用到之前的面向对象知识
-- 生成一个table,继承Object,使用其中的继承方法subClass和new方法
Object:subClass("ItemGrid")
--"成员变量"
ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.Text = nil
--成员函数
--实例化格子对象
function ItemGrid:Init(father,posX,posY)
    -- 实例化格子对象
    self.obj = ABMgr:LoadRes("ui","ItemGrid")
    --设置父对象
    self.obj.transform:SetParent(father,false)
    --设置位置
    self.obj.transform.localPosition = Vector3(posX,posY,0);
    --找控件
    self.imgIcon = self.obj.transform:Find("imgIcon"):GetComponent(typeof(Image))
    self.Text = self.obj.transform:Find("txtNum"):GetComponent(typeof(Text));
end

--初始化格子信息
--data 是外面传入的道具信息,其中包含id和num
function ItemGrid:InitData(data)
    --通过道具ID去读取道具配置表得到图标信息
    local itemData = ItemData[data.id]
    --获取data中的图标信息
    --根据名字，先加载图集，再加载图集中的图标信息
    local strs = string.split(itemData.icon,"_")
    --加载图集
    local spriteAtlas = ABMgr:LoadRes("ui",strs[1],typeof(SpriteAtlas))
    --加载图标
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
    --设置数量
    self.Text.text = data.num
end 
-- 添加新的逻辑
function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end 