package com.app.boardproject.domain;

public class SessionInfo {
    private long userIdx;
    private String userId;
    private String userName;
    private int membership;

    public long getMemberIdx() {
        return userIdx;
    }

    public void setMemberIdx(long userIdx) {
        this.userIdx = userIdx;
    }

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

    public int getMembership() {
        return membership;
    }

    public void setMembership(int membership) {
        this.membership = membership;
    }
}
