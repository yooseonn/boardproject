package com.app.boardproject.dto;

public class SessionInfo {
    private long memberIdx;
    private String userId;
    private String userName;
    private int membership;

    public long getMemberIdx() {
        return memberIdx;
    }

    public void setMemberIdx(long memberIdx) {
        this.memberIdx = memberIdx;
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
