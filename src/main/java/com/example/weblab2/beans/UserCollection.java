package com.example.weblab2.beans;

import java.util.ArrayList;
import java.util.List;

public class UserCollection implements java.io.Serializable {
    private List<Hit> collection;

    public UserCollection() {
        collection = new ArrayList<>();
    }

    public List<Hit> getCollection() {
        return collection;
    }

    public void setCollection(List<Hit> collection) {
        this.collection = collection;
    }

    @Override
    public String toString() {
        return "UserCollection{" + "collection=" + collection + '}';
    }

}