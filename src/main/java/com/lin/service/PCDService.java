package com.lin.service;

import com.lin.dao.PCDDao;
import com.lin.entity.PCD;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PCDService {
    @Resource
    private PCDDao pcdDao;
    public List<PCD> findPCDByPid(Integer pid){
        return pcdDao.findPCDByPid(pid);
    }
}
