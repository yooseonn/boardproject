package com.app.boardproject.DAO;

public abstract class MyUtil {
    /**
     * 전체 페이지수를 구하는 메소드
     *
     * @param dataCount 총 데이터 개수
     * @param size      한 화면에 출력할 데이터 개수
     * @return 총 페이지 수
     */
    public int pageCount(int dataCount, int size) {
        if (dataCount <= 0) {
            return 0;
        }

        return dataCount / size + (dataCount % size > 0 ? 1 : 0);
    }

    public abstract String paging(int current_page, int total_page, String list_url);
}
