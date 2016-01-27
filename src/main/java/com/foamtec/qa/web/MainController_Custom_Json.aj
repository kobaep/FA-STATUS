package com.foamtec.qa.web;

import com.foamtec.qa.domain.DocumentHistory;
import com.foamtec.qa.domain.FaRequest;
import com.foamtec.qa.security.AppUser;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by kopeeno on 1/7/2016 AD.
 */
public aspect MainController_Custom_Json {

    @RequestMapping(value = "/dataT1", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable1() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("engineer","Create");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/dataT2", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable2() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("engineerWork","EngApprove");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/dataT3", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable3() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("FA","engSendWork");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/dataT4", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable4() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("saleApprove","QaApprove");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/dataT5", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable5() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("sale","EngReject");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/dataT6", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable6() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("engineerWork","QaReject");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    private JSONArray MainController.findDataToTable(String flow, String status) {
        List<FaRequest> faRequests = FaRequest.findByWorkFlowAndStatus(flow, status);
        JSONArray dataAllForSend = new JSONArray();
        int i = 1;
        for(FaRequest faRequest : faRequests) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", faRequest.getId());
            jsonObject.put("no", i);
            jsonObject.put("faNo", faRequest.getFaNumber());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(faRequest.getCreateDate());
            int hours = calendar.get(Calendar.HOUR_OF_DAY);
            int minutes = calendar.get(Calendar.MINUTE);
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

            Long dateLong = faRequest.getNeedDate().getTime() - faRequest.getCreateDate().getTime();

            jsonObject.put("requestDate",df.format(faRequest.getCreateDate()) + " " + hours + ":" + String.format("%02d", minutes));
            jsonObject.put("needDate",df.format(faRequest.getNeedDate()));
            jsonObject.put("customer",faRequest.getCustomer());
            jsonObject.put("partNo",faRequest.getPartNumber());
            jsonObject.put("requestBy", faRequest.getCreateBy().getName());
            jsonObject.put("reasonEng",faRequest.getEngReson());
            jsonObject.put("reasonFa",faRequest.getFaReson());
            dataAllForSend.put(jsonObject);
            i++;
        }
        return dataAllForSend;
    }
}
