// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.Material;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Material_Roo_Json {
    
    public String Material.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Material.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Material Material.fromJsonToMaterial(String json) {
        return new JSONDeserializer<Material>()
        .use(null, Material.class).deserialize(json);
    }
    
    public static String Material.toJsonArray(Collection<Material> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Material.toJsonArray(Collection<Material> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Material> Material.fromJsonArrayToMaterials(String json) {
        return new JSONDeserializer<List<Material>>()
        .use("values", Material.class).deserialize(json);
    }
    
}