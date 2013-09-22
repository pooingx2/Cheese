package com.cheese.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cheese.bean.Gallery;
import com.cheese.dbconfig.SqlSessionManager;
import com.cheese.mapper.GalleryMapper;


public class GalleryDAO {
	public static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();
	
	public void insertGallery(Gallery gallery){
		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			GalleryMapper mapper = session.getMapper(GalleryMapper.class);
			mapper.insertGallery(gallery);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public List<Gallery> selectAllGallery(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Gallery> list=null;
		try{
			GalleryMapper mapper = session.getMapper(GalleryMapper.class);
			list = mapper.selectAllGallery();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public Gallery selectOneGallery(int gid){
		SqlSession session = sqlSessionFactory.openSession();
		Gallery gallery=null;
		try{
			GalleryMapper mapper = session.getMapper(GalleryMapper.class);
			gallery = mapper.selectOneGallery(gid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return gallery;
	}
}
