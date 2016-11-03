package com.zyc.entity;

public class Admin {
String id,pwd;
int sup;
public Admin(){
	
}
public Admin(String newid,String newpwd){
	id=newid;
	pwd=newpwd;
}
public Admin(String newid,String newpwd,int newsup){
	id=newid;
	pwd=newpwd;
	sup=newsup;
}
public void setId(String newid){
	id=newid;
}
public String getId(){
	return id;
}
public void setPwd(String newpwd){
	pwd=newpwd;
}
public String getPwd(){
	return pwd;
}
public void setSup(int newsup){
	sup=newsup;
}
public int getSup(){
	return sup;
}
}
