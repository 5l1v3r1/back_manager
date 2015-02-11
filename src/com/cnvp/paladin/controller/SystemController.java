package com.cnvp.paladin.controller;

import java.util.List;

import com.cnvp.paladin.core.BaseController;
import com.cnvp.paladin.kit.PropertyKit;
import com.cnvp.paladin.kit.StringKit;
import com.cnvp.paladin.model.SysNav;
import com.cnvp.paladin.service.NavService;

public class SystemController extends BaseController {
	public void index(){
		if("POST".equals(getRequest().getMethod())){
			if (!StringKit.isBlank(getPara("app_name"))) 
				PropertyKit.set("app_name", getPara("app_name"));
			if (!StringKit.isBlank(getPara("app_status"))) 
				PropertyKit.set("app_status", getPara("app_status"));
			if (!StringKit.isBlank(getPara("app_devModel"))) 
				PropertyKit.set("app_devModel", getPara("app_devModel"));
			if (!StringKit.isBlank(getPara("app_remark"))) 
				PropertyKit.set("app_remark", getPara("app_remark"));
				
		}
		setAttr("app_name", PropertyKit.get("app_name"));
		setAttr("app_status", PropertyKit.get("app_status"));
		setAttr("app_devModel", PropertyKit.get("app_devModel"));
		setAttr("app_remark", PropertyKit.get("app_remark"));
	}
	public void nav(){
		List<SysNav> tree = NavService.getTreeMap(0);
		setAttr("test", tree);
	}
	public void nav_create(){
		if("POST".equals(getRequest().getMethod())){
			if(getModel(SysNav.class,"sysnav").save())
				redirect(getControllerKey()+"/nav");
				return;
		}
		setAttr("data", SysNav.dao.set("pid", getParaToInt()));
		render("nav_form.html");
	}
	public void nav_update(){
		if("POST".equals(getRequest().getMethod())){
			getModel(SysNav.class,"sysnav").set("id",getParaToInt()).update();
			redirect(getControllerKey()+"/nav");
			return;
		}
		setAttr("data", SysNav.dao.findById(getParaToInt()));
		render("nav_form.html");
	}
	public void nav_delete(){
		if (SysNav.dao.findById(getParaToInt()).delete()) 
			redirect(getControllerKey()+"/nav");
		else
			renderText("删除失败");
	}
	public void save_order(){
		String[] vals = getParaValues("orderV");
		String[] keys = getParaValues("orderK");
		for (int i = 0; i < keys.length; i++) {
			SysNav.dao.findById(Integer.parseInt(keys[i])).set("orderid", Integer.parseInt(vals[i])).update();
		}
		redirect(getControllerKey()+"/nav");
	}
}
