package com.lin.controller;

import java.io.StringReader;
import java.io.StringWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tautua.markdownpapers.Markdown;
import org.tautua.markdownpapers.parser.ParseException;

import com.lin.entity.Article;
import com.lin.entity.Category;
import com.lin.service.ArticleService;
import com.lin.service.UserService;

@Controller
public class ArticleController {
	@Resource
	private ArticleService articleService;
	@Resource
	private UserService userService;

	@RequestMapping("/")
	public String index(HttpServletRequest request,Model model) {
		//List<Article> articles = articleService.getFirst10Article();
		List<Article> articles=articleService.getArticleByPage(request, model);
		for (Article article : articles) {
			System.out.println(article.getCategory());
		}
		model.addAttribute("articles", articles);
		return "views/index";
	}

	@RequestMapping("/column/{displayName}/{category}")
	public String column(@PathVariable("category") String category, Model model,
			@PathVariable("displayName") String displayName) {
		model.addAttribute("articles", articleService.getArticlesByCategoryName(category));
		model.addAttribute("displayName", displayName);
		return "views/columnPage";
	}

	@RequestMapping("/detail/{id}/{category}")
	public String detail(@PathVariable("id") Long id, Model model) {
		Article article = articleService.getArticleById(id);
		System.out.println(article.getContent());
		Markdown markdown = new Markdown();
		try {
			StringWriter out = new StringWriter();
			markdown.transform(new StringReader(article.getContent()), out);
			out.flush();
			article.setContent(out.toString());
			System.out.println("------------------");
			System.out.println(article.getContent());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("article", article);
		return "views/detail";
	}

	@RequestMapping("/lin/write")
	public String write(Model model) {
		List<Category> categories = articleService.getCategories();
		categories.remove(0);
		model.addAttribute("categories", categories);
		return "admin/write";
	}

	@RequestMapping(value = "/lin/write", method = RequestMethod.POST)
	public String write(Article article,HttpServletRequest request) {
		String content=request.getParameter("editorValue");
		if(content != null){
            //将内容设置进属性
            request.setAttribute("content",content);
            article.setContent(content);
            //转发到content.jsp
            //return "redirect:/lin";
        }

		if (article.getId() == 0) {
			articleService.writeBlog(article);
		} else {
			articleService.updateBlog(article);
		}
		return "redirect:/lin";
	}

	@RequestMapping("/lin/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		articleService.deleteArticleById(id);
		return "redirect:/lin";
	}

	@RequestMapping("/lin/update/{id}")
	public String update(@PathVariable("id") Long id, Model model) {
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		return "admin/write";
	}

}
