package com.library.po;

import java.io.Serializable;
import java.util.Date;

public class BookInfo implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.id
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.name
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.author
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private String author;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.publish
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private String publish;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.ISBN
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private String isbn;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.language
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private String language;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.price
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private Double price;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.pub_date
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private Date pubDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.type_id
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private Integer typeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.status
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private Integer status;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column book_info.introduction
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private String introduction;

    private int counts;
    public int getCounts() {
        return counts;
    }

    public void setCounts(int counts) {
        this.counts = counts;
    }

    //添加图书类型对象属性
    private ClassInfo classInfo;

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }


    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table book_info
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.id
     *
     * @return the value of book_info.id
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.id
     *
     * @param id the value for book_info.id
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.name
     *
     * @return the value of book_info.name
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.name
     *
     * @param name the value for book_info.name
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.author
     *
     * @return the value of book_info.author
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public String getAuthor() {
        return author;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.author
     *
     * @param author the value for book_info.author
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.publish
     *
     * @return the value of book_info.publish
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public String getPublish() {
        return publish;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.publish
     *
     * @param publish the value for book_info.publish
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setPublish(String publish) {
        this.publish = publish == null ? null : publish.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.ISBN
     *
     * @return the value of book_info.ISBN
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public String getIsbn() {
        return isbn;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.ISBN
     *
     * @param isbn the value for book_info.ISBN
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.language
     *
     * @return the value of book_info.language
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public String getLanguage() {
        return language;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.language
     *
     * @param language the value for book_info.language
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setLanguage(String language) {
        this.language = language == null ? null : language.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.price
     *
     * @return the value of book_info.price
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public Double getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.price
     *
     * @param price the value for book_info.price
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.pub_date
     *
     * @return the value of book_info.pub_date
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public Date getPubDate() {
        return pubDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.pub_date
     *
     * @param pubDate the value for book_info.pub_date
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.type_id
     *
     * @return the value of book_info.type_id
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public Integer getTypeId() {
        return typeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.type_id
     *
     * @param typeId the value for book_info.type_id
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.status
     *
     * @return the value of book_info.status
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.status
     *
     * @param status the value for book_info.status
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column book_info.introduction
     *
     * @return the value of book_info.introduction
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column book_info.introduction
     *
     * @param introduction the value for book_info.introduction
     *
     * @mbggenerated Sat Mar 02 16:41:46 GMT+08:00 2024
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }
}