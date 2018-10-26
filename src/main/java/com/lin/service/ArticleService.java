package com.lin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lin.dao.ArticleDao;
import com.lin.entity.Article;
import com.lin.entity.Category;
import com.lin.util.PageUtil;
import com.lin.util.TextUtil;

@Service
public class ArticleService {
	@Resource
	private ArticleDao articleDao;
	TextUtil textUtil=new TextUtil();
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	public Article getArticleById(Long id) {
		Article article = articleDao.getArticleById(id);
		article.setCategory(articleDao.getCategoryById(article.getCategoryId()).getDisplayName());
		return article;
	}

	public List<Article> getFirst10Article() {
		return articleDao.getFirst10Article();
	}

	public List<Article> getAllArticle() {
		return articleDao.getAllArticle();
	}

	public List<Category> getCategories() {
		return articleDao.getCategories();
	}

	public void writeBlog(Article article) {
		Long categoryId = articleDao.getCategoryIdByName(article.getCategory());
		article.setCategoryId(categoryId);
		article.setDate(sdf.format(new Date()));
		if (article.getSummary() == null || "".equals(article.getSummary())) {
			if (article.getContent().length() > 50) {
				//System.out.println(article.getContent().substring(0, 50));
				//System.out.println(textUtil.HtmltoText(article.getContent().substring(0, 50)));
				article.setSummary(textUtil.HtmltoText(article.getContent().substring(0, 50)));
				//article.setSummary(article.getContent().substring(0, 50));
			} else {
				//System.out.println(article.getContent().substring(0, article.getContent().length()));
				//System.out.println(textUtil.HtmltoText(article.getContent().substring(0, article.getContent().length())));
				article.setSummary(textUtil.HtmltoText(article.getContent().substring(0, article.getContent().length())));
				//article.setSummary(article.getContent().substring(0, article.getContent().length()));
			}
		}
		articleDao.writeBlog(article);
	}

	public void deleteArticleById(Long id) {
		articleDao.deleteArticleById(id);
	}

	public void updateBlog(Article article) {
		article.setDate(sdf.format(new Date()));
		if (article.getSummary() == null || "".equals(article.getSummary())) {
			if (article.getContent().length() > 50) {
				article.setSummary(textUtil.HtmltoText(article.getContent().substring(0, 50)));
				//article.setSummary(article.getContent().substring(0, 50));
			} else {
				article.setSummary(textUtil.HtmltoText(article.getContent().substring(0, article.getContent().length())));
				//article.setSummary(article.getContent().substring(0, article.getContent().length()));
			}
		}
		articleDao.updateArticleById(article);
	}

	public List<Article> getArticlesByCategoryName(String name) {
		Long categoryId = articleDao.getCategoryIdByName(name);
		List<Article> articles = articleDao.getArticlesByCategoryName(categoryId);
		return articles;
	}

	public List<Article> getArticleByPage(HttpServletRequest request, Model model) {
		String pageNow = request.getParameter("pageNow");
		String searchNum=request.getParameter("searchNum");//获取搜索分页传入数据
		if (searchNum!=null && !("".equals(searchNum))) {
			pageNow=searchNum;
		}
		PageUtil page = null;
		List<Article> articles = new ArrayList<Article>();
		long totalCount = articleDao.getCount();
		if (pageNow != null) {
			page = new PageUtil(totalCount, Integer.parseInt(pageNow));
			articles = this.articleDao.getArticleByPage(page.getStartPos(), page.getPageSize());
		} else {
			page = new PageUtil(totalCount, 1);
			articles = this.articleDao.getArticleByPage(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("articles", articles);
		model.addAttribute("page", page);
		return articles;
	}
	
	

	


	//存在数据重叠的问题
//	public List<Article> getArticleBySearchPage(HttpServletRequest request, Model model) {
//
//		return null;
//
//	}

}
