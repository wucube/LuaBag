--常用别名都在这里定位
--加载之前准备的脚本
--面向对象
require("Object")
--字符串解拆分
require("SplitTools")
--Json解析
Json = require("JsonUtility")

--Unity相关
GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
TextAsset = CS.UnityEngine.TextAsset
--图集对象
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas
--向量相关
Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2
--Canvas 对于该项目来说，找一次便可，不需要切换场景
Canvas = GameObject.Find("Canvas").transform
--UI相关
UI = CS.UnityEngine.UI
Image = UI.Image
Text = UI.Text
Button =UI.Button
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect
UIBehaviour = CS.UnityEngine.EventSystems.UIBehaviour

--自己写的C#脚本相关
--直接得到AB包资源管理器的 单例对象
ABMgr = CS.ABMgr.GetInstance()
