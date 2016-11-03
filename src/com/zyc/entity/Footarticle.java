package com.zyc.entity;

public class Footarticle {
String createrid,creatername,articleid,city,title,content,img;
public Footarticle(){
	
}
public Footarticle(String newid,String newcreaterid,String newcreatername,String newcity,String newtitle,String newcontent,String newimg){
	articleid=newid;
	createrid=newcreaterid;
	creatername=newcreatername;
	city=newcity;
	title=newtitle;
	content=newcontent;
	img=newimg;
}
public void setFootarticle(String newid,String newcreaterid,String newcreatername,String newcity,String newtitle,String newcontent,String newimg){
	articleid=newid;
	createrid=newcreaterid;
	creatername=newcreatername;
	city=newcity;
	title=newtitle;
	content=newcontent;
	img=newimg;
}
public void setImg(String newimg){
	img=newimg;
}
public String getImg(){
	return img;
}
public void setCreaterid(String newid){
	createrid=newid;
}
public String getCreaterid(){
	return createrid;
}
public void setCeaterName(String newname){
	creatername=newname;
}
public String getCreatername(){
	return creatername;
}

public void setArticleid(String newid){
	articleid=newid;
}
public String getArticleid(){
	return articleid;
}
public void setCity(String newcity){
	city=newcity;
}
public String getCity(){
	return city;
}
public void setTitle(String newtitle){
	title=newtitle;
}
public String getTitle(){
	return title;
}
public void setContent(String newcontent){
	content=newcontent;
}
public String getContent(){
	return content;
}
}
