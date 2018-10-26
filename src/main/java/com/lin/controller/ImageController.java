package com.lin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lin.entity.Image;
import com.lin.service.ImageService;

@Controller
public class ImageController {

	@Resource
	private ImageService imageService;

	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> uploadFile(@RequestParam(value = "upfile", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String realName = null;
		String uuidName = null;
		String realPath = null;
		try {
			Image image = new Image();//--------
			// 文件原来的名称
			realName = file.getOriginalFilename();
			// 得到这个文件的uuidname
			uuidName = this.getUUIDFileName(file.getOriginalFilename());
			// 图片保存的工程
			realPath = request.getServletContext().getRealPath("/images");
			// 真实路径
			String roolPath = request.getSession().getServletContext().getRealPath("/");
			image.setName(realName);
			image.setUrl(roolPath);
			image.setUuidName(uuidName);
			// 得到文件的输入流
			InputStream in = new BufferedInputStream(file.getInputStream());
			// 获得文件的输出流
			OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(realPath, uuidName)));
			IOUtils.copy(in, out);
			in.close();
			out.close();
			// 将图片信息传递到我的数据库当中
			int flag = imageService.insertImage(image);
			if (flag != 0) {
				map.put("state", "SUCCESS");// UEDITOR的规则:不为SUCCESS则显示state的内容
				map.put("url", "/images/" + uuidName); // 能访问到你现在图片的路径
				map.put("title", "");
				map.put("original", "realName");
			}
		} catch (IOException e) {
			map.put("state", "文件上传失败!"); // 在此处写上错误提示信息，这样当错误的时候就会显示此信息
			map.put("url", "");
			map.put("title", "");
			map.put("original", "");
			e.printStackTrace();
		}
		return map;
	}

	// 下面是我的两个方法，取的uuidname防止文件同名问题
	private String getExtName(String s, char split) {
		int i = s.lastIndexOf(split);
		int leg = s.length();
		return i > 0 ? (i + 1) == leg ? " " : s.substring(i + 1, s.length()) : " ";
	}

	private String getUUIDFileName(String fileName) {
		UUID uuid = UUID.randomUUID();
		StringBuilder sb = new StringBuilder(100);
		sb.append(uuid.toString()).append(".").append(this.getExtName(fileName, '.'));
		return sb.toString();
	}

}
