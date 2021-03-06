package com.lin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.alibaba.fastjson.JSON;
import com.lin.entity.PCD;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lin.service.PCDService;

import java.io.IOException;
import java.util.List;

@Controller
public class PCDController {
    @Resource
    private PCDService pcdService;

    @RequestMapping("/lin/testPCD")
    public List<PCD> testPCD(HttpServletRequest request,Model model) throws IOException {
        System.out.println(request.getParameter("pid"));
        List<PCD> pcdList = pcdService.findPCDByPid(0);
        System.out.println(pcdList);
        model.addAttribute("pcdList", pcdList);
       /* response.setContentType("text/xml;Charset=UTF-8");
        int pid = Integer.parseInt(request.getParameter("pid"));
        List<PCD> pcdList = pcdService.findPCDByPid(pid);
        String json = JSON.toJSONString(pcdList);
        response.getWriter().write(json);
        */
        return pcdList;
    }


}
