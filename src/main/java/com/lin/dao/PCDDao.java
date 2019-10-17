package com.lin.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.lin.entity.PCD;

import java.util.List;

@Repository
public interface PCDDao{
    public List<PCD> findPCDByPid(@Param("pid") Integer pid);
}
