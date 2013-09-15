package com.cheese.dbconfig;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	public static SqlSessionFactory sqlSession=null;
	
	public static SqlSessionFactory getInstance(){
		if(sqlSession == null){
			String resource = "com/cheese/dbconfig/mybatis-config.xml";
			try{
				Reader reader = Resources.getResourceAsReader(resource);
				sqlSession = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sqlSession;
	}
}
