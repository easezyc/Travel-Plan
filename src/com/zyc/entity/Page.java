package com.zyc.entity;

import java.util.ArrayList;

public class Page {
	  private int currentpage;
	  private int pagesize;
	  private int maxpage;
	  private ArrayList list;
	  public Page(){
		  pagesize=9;
	  }
	  public Page(int newcurrentpage,int newmaxpage,ArrayList newlist){
		  currentpage=newcurrentpage;
		  maxpage=newmaxpage;
		  list=newlist;
	  }
	  public void setCurrentpage(int newcurrentpage){
		  currentpage=newcurrentpage;
	  }
	  public int getCurrentpage(){
		  return currentpage;
	  }
	  public void setPagesize(int newsize){
		  pagesize=newsize;
	  }
	  public int getPagesize(){
		  return pagesize;
	  }
	  public void setMaxpage(int newmax){
		  maxpage=newmax;
	  }
	  public void setList(ArrayList newlist){
		  list=newlist;
	  }
	  public int getMaxpage(){
		  return maxpage;
	  }
	  public ArrayList getList(){
		  return list;
	  }
}
