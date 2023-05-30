using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class LuaCopyEditor : Editor
{
    [MenuItem("XLua/Copy Lua To Txt")]
    public static void CopyLuaToTxt()
    {
        //首先找到所有的Lua文件
        string path = Application.dataPath + "/Lua/";
        // 判断路径是否存在
        if(!Directory.Exists(path))
            return;
        //得到每个Lua文件的路径,才能进行迁移拷贝
        string[] strs = Directory.GetFiles(path, "*.lua");
        //再把Lua文件拷贝到一个新的文件夹中
        //首先判断新路径文件夹是否存在
        string newPath = Application.dataPath + "/LuaTxt/";
        //为避免一些被删除的Lua文件再被使用, 应该先清空目标路径
        //判断路径文件夹是否存在
        if (!Directory.Exists(newPath))
            Directory.CreateDirectory(newPath);
        else
        {
            //得到该路径中所有后缀.txt的文件,将它们全部删除
            string[] oldFileStrs = Directory.GetFiles(newPath, "*.txt");
            for (int i = 0; i < oldFileStrs.Length; i++)
            {
                File.Delete(oldFileStrs[i]);
            }
        }

        List<string> newFileNames = new List<string>();
        string fileName;
        for (int i = 0; i < strs.Length; i++)
        {
            // 得到新的文件路径,再拷贝
            fileName = newPath + strs[i].Substring(strs[i].LastIndexOf("/") + 1)+".txt";
            newFileNames.Add(fileName);
            File.Copy(strs[i],fileName);
        }
        AssetDatabase.Refresh();
        //刷新过后再来改指定包,如果不刷新,第一次改变没有作用
        for (int i = 0; i < newFileNames.Count; i++)
        {
            //Unity API
            //改API传入的路径,必须用 Assets/...../......格式的
            AssetImporter importer = AssetImporter.GetAtPath(newFileNames[i].Substring(newFileNames[i].IndexOf("Assets")));
            if (importer != null)
                importer.assetBundleName = "lua";
        }
        
    }
}
