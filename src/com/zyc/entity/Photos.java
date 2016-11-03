package com.zyc.entity;

public class Photos {
String id,url;
public Photos(String newid,String newurl){
	id=newid;
	url=newurl;
}
public void setId(String newid){
	id=newid;
}
public String getId(){
	return id;
}
public void setUrl(String newurl){
	url=newurl;
}
public String getUrl(){
	return url;
}
}
