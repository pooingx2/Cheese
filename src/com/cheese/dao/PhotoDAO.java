package com.cheese.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cheese.bean.Photo;
import com.cheese.dbconfig.SqlSessionManager;
import com.cheese.mapper.PhotoMapper;


public class PhotoDAO {
	public static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();
	
	public void insertPhoto(Photo photo){
		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			PhotoMapper mapper = session.getMapper(PhotoMapper.class);
			mapper.insertPhoto(photo);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	
	public List<Photo> selectAllPhoto(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Photo> list=null;
		try{
			PhotoMapper mapper = session.getMapper(PhotoMapper.class);
			list = mapper.selectAllPhoto();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public List<Photo> selectGalleryPhoto(int gallery){
		SqlSession session = sqlSessionFactory.openSession();
		List<Photo> list=null;
		try{
			PhotoMapper mapper = session.getMapper(PhotoMapper.class);
			list = mapper.selectGalleryPhoto(gallery);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

}
