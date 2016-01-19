package com.foamtec.qa.web;

import com.foamtec.qa.domain.*;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

import org.json.JSONObject;
import org.json.JSONArray;

/**
 * Created by kopeeno on 1/5/2016 AD.
 */
public aspect FaRequestController_Custom_Controller_Json {

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FaRequestController.save(@RequestParam("data") String data, Principal principal) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            FaRequest faRequest = putData(data, principal);
            faRequest.persist();
            faRequest.setFaNumber("FA" + String.format("%05d", faRequest.getId()));
            faRequest.persist();
            return new ResponseEntity<String>(faRequest.toJson(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    private FaRequest FaRequestController.putData(String data, Principal principal) {
        FaRequest faRequest = new FaRequest();
        JSONObject jsonObject = new JSONObject(data);
        String[] customer = jsonObject.getString("customer").split("_");
        if(customer.length == 1) {
            faRequest.setCustomer(customer[0]);
        } else {
            faRequest.setCustomer(customer[1]);
        }
        String[] projectOwner = jsonObject.getString("projectOwner").split("_");
        if(projectOwner.length == 1) {
            faRequest.setProjectOwner(projectOwner[0]);
        } else {
            faRequest.setProjectOwner(projectOwner[1]);
        }
        String[] partNumber = jsonObject.getString("partNumber").split("_");
        if(partNumber.length == 1) {
            faRequest.setPartNumber(partNumber[0]);
        } else {
            faRequest.setPartNumber(partNumber[1]);
        }
        String[] revision = jsonObject.getString("revision").split("_");
        if(revision.length == 1) {
            faRequest.setRevision(revision[0]);
        } else {
            faRequest.setRevision(revision[1]);
        }
        String[] apqpNumber = jsonObject.getString("apqpNumber").split("_");
        if(apqpNumber.length == 1) {
            faRequest.setApqpNumber(apqpNumber[0]);
        } else {
            faRequest.setApqpNumber(apqpNumber[1]);
        }
        String[] quatationWorkSheet = jsonObject.getString("quatationWorkSheet").split("_");
        if(quatationWorkSheet.length == 1) {
            faRequest.setQuatationWorkSheet(quatationWorkSheet[0]);
        } else {
            faRequest.setQuatationWorkSheet(quatationWorkSheet[1]);
        }
        String[] needDate = jsonObject.getString("needDate").split("_");
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date startDate = df.parse(needDate[1]);
            faRequest.setNeedDate(startDate);
        } catch (ParseException e) {
            faRequest.setNeedDate(null);
        }
        String produtGroup = jsonObject.getString("produtGroup");
        faRequest.setProductGroup(produtGroup);
        String documentRequest = jsonObject.getString("documentRequest");
        faRequest.setDocumentRequest(documentRequest);

        String[] mat1 = jsonObject.getString("mat1").split("_");
        String[] mat2 = jsonObject.getString("mat2").split("_");
        String[] mat3 = jsonObject.getString("mat3").split("_");

        if(mat1.length != 1) {
            faRequest.setMat1(mat1[1]);
        } else {
            faRequest.setMat1(mat1[0]);
        }
        if(mat2.length != 1) {
            faRequest.setMat2(mat2[1]);
        } else {
            faRequest.setMat2(mat2[0]);
        }
        if(mat3.length != 1) {
            faRequest.setMat3(mat3[1]);
        } else {
            faRequest.setMat3(mat3[0]);
        }
        

        String[] faApproveQty = jsonObject.getString("faApproveQty").split("_");
        String[] faaForSellQty = jsonObject.getString("faaForSellQty").split("_");
        String[] sampleForTestQty = jsonObject.getString("sampleForTestQty").split("_");
        String[] sampleForPccQty = jsonObject.getString("sampleForPccQty").split("_");

        Set<TypeOfRequest> typeOfRequests = new HashSet<TypeOfRequest>();
        if(faApproveQty.length != 1) {
            TypeOfRequest typeOfRequest = new TypeOfRequest();
            typeOfRequest.setName("FA Approve");
            typeOfRequest.setQty(Integer.parseInt(faApproveQty[1]));
            typeOfRequest.setFaRequest(faRequest);
            typeOfRequests.add(typeOfRequest);
        }
        if(faaForSellQty.length != 1) {
            TypeOfRequest typeOfRequest = new TypeOfRequest();
            typeOfRequest.setName("FA For Sell");
            typeOfRequest.setQty(Integer.parseInt(faaForSellQty[1]));
            typeOfRequest.setFaRequest(faRequest);
            typeOfRequests.add(typeOfRequest);
        }
        if(sampleForTestQty.length != 1) {
            TypeOfRequest typeOfRequest = new TypeOfRequest();
            typeOfRequest.setName("Sample For Test");
            typeOfRequest.setQty(Integer.parseInt(sampleForTestQty[1]));
            typeOfRequest.setFaRequest(faRequest);
            typeOfRequests.add(typeOfRequest);
        }
        if(sampleForPccQty.length != 1) {
            TypeOfRequest typeOfRequest = new TypeOfRequest();
            typeOfRequest.setName("Sample For Pcc");
            typeOfRequest.setQty(Integer.parseInt(sampleForPccQty[1]));
            typeOfRequest.setFaRequest(faRequest);
            typeOfRequests.add(typeOfRequest);
        }
        faRequest.setTypeOfRequest(typeOfRequests);

        String tools = jsonObject.getString("tools");
        Tooling tooling = new Tooling();
        tooling.setToolingType(tools);
        tooling.persist();

        faRequest.setTooling(tooling);
        faRequest.setCreateBy(principal.getName());
        faRequest.setCreateDate(new Date());
        faRequest.setFlow("engineer");
        faRequest.setStatus("Create");

        Set<DocumentHistory> documentHistorys = new HashSet<DocumentHistory>();
        DocumentHistory documentHistory = new DocumentHistory();
        documentHistory.setActionType("C");
        documentHistory.setCreateBy(principal.getName());
        documentHistory.setCreateDate(new Date());
        documentHistory.setStatus("Create");
        documentHistory.setFaRequest(faRequest);
        documentHistorys.add(documentHistory);

        faRequest.setDocumentHistorys(documentHistorys);

        return faRequest;
    }
}
