package com.app.boardproject.domain;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class Board {
    private long num;
    private String userId;
    private String userName;

    private String subject;
    private String content;

    private String regDate;

    private int hitCount;

    public int getBoardlikeCount() {
        return boardlikeCount;
    }

    public void setBoardlikeCount(int boardlikeCount) {
        this.boardlikeCount = boardlikeCount;
    }

    public int getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(int replyCount) {
        this.replyCount = replyCount;
    }

    private int boardlikeCount;

    //답변 수
    private int replyCount;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public int getHitCount() {
        return hitCount;
    }

    public void setHitCount(int hitCount) {
        this.hitCount = hitCount;
    }

    public int getLikeCount() {
        return boardlikeCount;
    }

    public void setLikeCount(int likeCount) {
        this.boardlikeCount = likeCount;
    }

    public long getFileNum() {
        return fileNum;
    }

    public void setFileNum(long fileNum) {
        this.fileNum = fileNum;
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public void setOriginalFilename(String originalFilename) {
        this.originalFilename = originalFilename;
    }

    public String getSaveFilename() {
        return saveFilename;
    }

    public void setSaveFilename(String saveFilename) {
        this.saveFilename = saveFilename;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public int getFileCount() {
        return fileCount;
    }

    public void setFileCount(int fileCount) {
        this.fileCount = fileCount;
    }

    public List<MultipartFile> getSelectFile() {
        return selectFile;
    }

    public void setSelectFile(List<MultipartFile> selectFile) {
        this.selectFile = selectFile;
    }

    //혹시 파일 하게될까...
    private long fileNum;
    private String originalFilename;
    private String saveFilename;
    private long fileSize;
    private int fileCount;

    // 파일받기
    private List<MultipartFile> selectFile;

    public long getNum() {
        return num;
    }


    public void setNum(long num) {
        this.num = num;
    }
}
