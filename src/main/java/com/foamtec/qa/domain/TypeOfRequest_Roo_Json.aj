// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.TypeOfRequest;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect TypeOfRequest_Roo_Json {
    
    public String TypeOfRequest.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String TypeOfRequest.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static TypeOfRequest TypeOfRequest.fromJsonToTypeOfRequest(String json) {
        return new JSONDeserializer<TypeOfRequest>()
        .use(null, TypeOfRequest.class).deserialize(json);
    }
    
    public static String TypeOfRequest.toJsonArray(Collection<TypeOfRequest> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String TypeOfRequest.toJsonArray(Collection<TypeOfRequest> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<TypeOfRequest> TypeOfRequest.fromJsonArrayToTypeOfRequests(String json) {
        return new JSONDeserializer<List<TypeOfRequest>>()
        .use("values", TypeOfRequest.class).deserialize(json);
    }
    
}
