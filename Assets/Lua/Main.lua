 print("准备就绪")
--初始化所有准备好的类别名
require("InitClass")
--初始化道具表信息
require("ItemData")
require("PlayerData")
PlayerData:Init()
require("BasePanel")
require("MainPanel")
require("BagPanel")
require("ItemGrid")
MainPanel:ShowMe("MainPanel")

