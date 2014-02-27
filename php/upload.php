<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$content=$_FILES['content'];//flash端的URLVariables实例的content属性,可以自由命名
//用foreach可以遍历多个文件， foreach($_FILES as $key => $details)，其中一个$details就是上面的$content。
$returnAry=  array();//JSON信息数组
$returnAry['status']=FALSE;
//图片的路径
$imgPath = "http://" . $_SERVER ["SERVER_NAME"] . ":" . $_SERVER ["SERVER_PORT"] . dirname ( $_SERVER ["SCRIPT_NAME"] )."/images/";
if($content){
    $returnAry["status"]=true;
    $newName="hehe.jpg";
    //用move_uploaded_file把文件移动到指定位置，$content['tmp_name']是临时文件名，不操作的话脚本执行结束后$content会被删除
    if(move_uploaded_file($content['tmp_name'], './images/'.$newName)){
        $returnAry['isload']=true;
        $returnAry['url']=$imgPath.$newName;
    }else{
        $returnAry['isload']=FALSE;
    }
}
$returnAry['post-Type']=$_POST['type'];//这是传过来的非file类型的变量
print json_encode($returnAry);
?>