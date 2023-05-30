
PlayerData = {}
--目前只做背包功能，只需要它的道具信息即可

PlayerData.equips = {}
PlayerData.items = {}
PlayerData.gems = {}

-- 为玩家数据写一个初始化方法，之后直接改这里的数据来源即可
function PlayerData:Init()
    --道具信息，不管存本地还是服务器，都不会把道具的所有信息存进去，只会存道具ID和道具数量
    
    --目前没有服务器，为了测试，直接写死道具数据作为玩家数据
    table.insert(self.equips,{id = 1,num=1})
    table.insert(self.equips,{id =2,num =1})
    
    table.insert(self.items,{id = 3,num = 50})
    table.insert(self.items,{id = 4,num = 20})
    
    table.insert(self.gems,{id = 5,num = 99})
    table.insert(self.gems,{id = 6,num = 88})
end