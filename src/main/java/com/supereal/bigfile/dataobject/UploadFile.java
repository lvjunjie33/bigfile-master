package com.supereal.bigfile.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

/**
 * Create by tianci
 * 2019/1/10 14:38
 */

@Entity
@Data
public class UploadFile {

    /* 主键 */
    @Id
    private int fileId;
    /* 文件分片序列号 */
    private int fileIndex;
    /*文件总分片 */
    private int fileTotal;
    /*文件存储路径*/
    private String filePath;
    /* 文件大小 */
    private long fileSize;
    /* 文件名字 */
    private String fileName;
    /* 创建时间 */
    private Date createTime;
    /* 跟新时间 */
    private Date updateTime;
    /* 文件上传状态 */
    private int fileStatus;
    /* SN号 */
    private String sn;
    /* 设备名称 */
    private String deviceName;
    
    
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	

	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileIndex() {
		return fileIndex;
	}
	public void setFileIndex(int fileIndex) {
		this.fileIndex = fileIndex;
	}
	public int getFileTotal() {
		return fileTotal;
	}
	public void setFileTotal(int fileTotal) {
		this.fileTotal = fileTotal;
	}

	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public void setFileStatus(int fileStatus) {
		this.fileStatus = fileStatus;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(Integer fileStatus) {
		this.fileStatus = fileStatus;
	}

  
    

	
}
