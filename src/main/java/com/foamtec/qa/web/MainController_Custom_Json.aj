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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
            JSONArray dataJson = findDataToTable("saleCoApprove","QaApprove");
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

    @RequestMapping(value = "/dataWait", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataWait() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("engineerWork","EngWait");
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

    @RequestMapping(value = "/dataT7", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable7() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("FA","QaWait");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/dataT8", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.dataTable8() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray dataJson = findDataToTable("SaleOut","saleCoApprove");
            return new ResponseEntity<String>(dataJson.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/searchdata", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> MainController.search(@RequestParam("data") String data) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONObject jsonObject = new JSONObject(data);
            String startDateSt = jsonObject.getString("startDate");
            String endDateSt = jsonObject.getString("endDate");
            String status = jsonObject.getString("status");

            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Date startDate = df.parse(startDateSt);

            Calendar endDateCalendar = Calendar.getInstance();
            endDateCalendar.setTime(df.parse(endDateSt));
            endDateCalendar.set(Calendar.HOUR_OF_DAY, 23);
            endDateCalendar.set(Calendar.MINUTE, 59);
            endDateCalendar.set(Calendar.SECOND, 59);
            Date endDate = endDateCalendar.getTime();

            String[] partNumber = jsonObject.getString("status").split("_");
            String statusSearch = "%";
            if(partNumber.length == 2) {
                statusSearch = "%" + partNumber[1] + "%";
            }

            JSONArray dataAllForSend = new JSONArray();
            List<FaRequest> faRequests = FaRequest.findByStartDateEndDateAndStatus(startDate, endDate, statusSearch);
            int i = 1;
            for(FaRequest faRequest : faRequests) {
                JSONObject jsonObject1 = new JSONObject();
                jsonObject1.put("id", faRequest.getId());
                jsonObject1.put("no", i);
                jsonObject1.put("faNo", faRequest.getFaNumber());

                Calendar calendar = Calendar.getInstance();
                calendar.setTime(faRequest.getCreateDate());
                int hours = calendar.get(Calendar.HOUR_OF_DAY);
                int minutes = calendar.get(Calendar.MINUTE);
                jsonObject1.put("requestDate",df.format(faRequest.getCreateDate()) + " " + hours + ":" + String.format("%02d", minutes));
                jsonObject1.put("needDate",df.format(faRequest.getNeedDate()));
                jsonObject1.put("customer",faRequest.getCustomer());
                jsonObject1.put("partNo",faRequest.getPartNumber());
                jsonObject1.put("requestBy", faRequest.getCreateBy().getName());
                jsonObject1.put("reasonEng",faRequest.getEngReson());
                jsonObject1.put("reasonFa",faRequest.getFaReson());
                jsonObject1.put("projectOwner",faRequest.getProjectOwner());
                dataAllForSend.put(jsonObject1);
                i++;
            }

            return new ResponseEntity<String>(dataAllForSend.toString(), headers, HttpStatus.OK);
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

            Calendar calendarCreateDate = Calendar.getInstance();
            calendarCreateDate.setTime(faRequest.getCreateDate());
            Calendar calendarNeedDate = Calendar.getInstance();
            calendarNeedDate.setTime(faRequest.getNeedDate());

            Calendar calendarNow = Calendar.getInstance();
            calendarNow.setTime(new Date());

            if (daysBetween(calendarCreateDate, calendarNeedDate) < 2 || calendarNow.after(calendarNeedDate)) {
                jsonObject.put("day", true);
            } else {
                jsonObject.put("day", false);
            }

            jsonObject.put("requestDate",df.format(faRequest.getCreateDate()) + " " + hours + ":" + String.format("%02d", minutes));
            jsonObject.put("needDate",df.format(faRequest.getNeedDate()));
            jsonObject.put("customer",faRequest.getCustomer());
            jsonObject.put("partNo",faRequest.getPartNumber());
            jsonObject.put("projectOwner",faRequest.getProjectOwner());
            jsonObject.put("requestBy", faRequest.getCreateBy().getName());
            jsonObject.put("reasonEng",faRequest.getEngReson());
            jsonObject.put("reasonFa",faRequest.getFaReson());
            dataAllForSend.put(jsonObject);
            i++;
        }
        return dataAllForSend;
    }

    private long MainController.daysBetween(Calendar startDate, Calendar endDate) {
        Calendar date = (Calendar) startDate.clone();
        long daysBetween = 0;
        while (date.before(endDate)) {
            date.add(Calendar.DAY_OF_MONTH, 1);
            daysBetween++;
        }
        return daysBetween;
    }
}
