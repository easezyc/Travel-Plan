package com.zyc.entity;

public class User {
String name,pwd,phone,id,image;
public User(){
	
}
public User(String newid,String newpwd){
	id=newid;
	pwd=newpwd;
}
public User(String newid,String newname,String newpwd,String newphone){
	id=newid;
	name=newname;
	pwd=newpwd;
	phone=newphone;
}
public User(String newname,String newpwd,String newphone,String newid,String newimage){
	id=newid;
	name=newname;
	pwd=newpwd;
	phone=newphone;
	image=newimage;
}
public String getImage(){
	return image;
}
public void setImage(String newimage){
	image=newimage;
}
public String getId(){
	return id;
}
public void setId(String newid){
	id=newid;
}
public String getName(){
	return name;
}
public void setName(String newname){
	name=newname;
}
public String getPwd(){
	return pwd;
}
public void setPwd(String newpwd){
	pwd=newpwd;
}
public String getPhone(){
	return phone;
}
public void setPhone(String newphone){
	phone=newphone;
}
}

