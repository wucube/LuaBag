

--将Json数据读取到Lua表中进行存储

--首先将Json表从AB包中加载出来
--加载的Json文件中的TextAsset对象
local txt = ABMgr:LoadRes("json","ItemData",typeof(TextAsset))

--获取文本信息进行解析
local itemList = Json.decode(txt.text)
--print(itemList[1].id..itemList[1].name)
--加载出来的是类似数组结构的数据
--不方便通过ID获取里面所有的内容，所以使用新表转存一次

--新表在任何地方都能使用，新表用键值对的形式存储，键是道具ID，值是道具表一行的信息
ItemData = {}
for _, value in pairs(itemList) do
    ItemData[value.id] = value
end
