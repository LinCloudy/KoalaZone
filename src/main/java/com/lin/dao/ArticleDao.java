package com.lin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lin.entity.Article;
import com.lin.entity.Category;

@Repository
public interface ArticleDao {

	public Article getArticleById(@Param("id") Long id);

	public List<Article> getFirst10Article();
	
	public List<Article> getAllArticle();
	
	public long getCount();
	
	public List<Article> getArticleByPage(@Param(value="startPos")long startPos,@Param(value="pageSize")long pageSize);

	public List<Article> getArticlesByCategoryName(Long categoryId);

	public List<Category> getCategories();

	public void writeBlog(Article article);

	public Long getCategoryIdByName(String name);

	public void deleteArticleById(Long id);

	public void updateArticleById(Article article);

	public Category getCategoryById(Long id);

}
