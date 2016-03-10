package com.foamtec.qa.web;

import com.foamtec.qa.domain.FaRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

/**
 * Created by kopeeno on 1/5/2016 AD.
 */
@Controller
public class MainController {
    @RequestMapping(value = "/", produces = "text/html")
    public String saleRequest(Model uiModel) {
        return "foamtec-index";
    }

    @RequestMapping(value = "/engapprove/{id}", produces = "text/html")
    public String engViewApprove(@PathVariable("id") Long id, Model uiModel) {
        FaRequest faRequest = FaRequest.findFaRequest(id);
        uiModel.addAttribute("farequest", faRequest);
        return "main-eng-approve";
    }

    @RequestMapping(value = "/search", produces = "text/html")
    public String search(Model uiModel) {
        return "search";
    }

    @RequestMapping(value = "/searchoption", produces = "text/html")
    public String searchOption(Model uiModel) {
        return "search-sumary";
    }
}
