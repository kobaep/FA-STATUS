package com.foamtec.qa.web;

/**
 * Created by kopeeno on 1/5/2016 AD.
 */

import com.foamtec.qa.security.AppUser;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;
import com.foamtec.qa.domain.FaRequest;

public aspect FaRequestController_Custom_Controller {

    @RequestMapping(value = "/salerequest", produces = "text/html")
    public String FaRequestController.saleRequest(Principal principal) {
        return "sale-request";
    }

    @RequestMapping(value = "/engreview", produces = "text/html")
    public String FaRequestController.engReview(Principal principal) {
        return "eng-review";
    }

    @RequestMapping(value = "/engviewapprove/{id}", produces = "text/html")
    public String FaRequestController.engViewApprove(@PathVariable("id") Long id, Model uiModel, Principal principal) {
        FaRequest faRequest = FaRequest.findFaRequest(id);
        uiModel.addAttribute("farequest", faRequest);
        return "eng-approve";
    }

    @RequestMapping(value = "/englistviewwork", produces = "text/html")
    public String FaRequestController.engListViewWork(Principal principal) {
        return "eng-list-work";
    }

    @RequestMapping(value = "/engsendwork/{id}", produces = "text/html")
    public String FaRequestController.engSendWork(@PathVariable("id") Long id, Model uiModel, Principal principal) {
        FaRequest faRequest = FaRequest.findFaRequest(id);
        uiModel.addAttribute("farequest", faRequest);
        return "eng-send-work";
    }

    @RequestMapping(value = "/faqalist", produces = "text/html")
    public String FaRequestController.faQaDataList(Principal principal) {
        return "fa-qa-list";
    }

    @RequestMapping(value = "/salefollowlist", produces = "text/html")
    public String FaRequestController.saleFollowList(Principal principal) {
        return "sale-list-follow";
    }

    @RequestMapping(value = "/faqaapprove/{id}", produces = "text/html")
    public String FaRequestController.faQaApprove(@PathVariable("id") Long id, Model uiModel, Principal principal) {
        FaRequest faRequest = FaRequest.findFaRequest(id);
        uiModel.addAttribute("farequest", faRequest);
        return "fa-qa-approve";
    }

    @RequestMapping(value = "/salefollow/{id}", produces = "text/html")
    public String FaRequestController.saleApprove(@PathVariable("id") Long id, Model uiModel, Principal principal) {
        FaRequest faRequest = FaRequest.findFaRequest(id);
        uiModel.addAttribute("farequest", faRequest);
        return "sale-approve";
    }

    @RequestMapping(value = "/salefollowengreject/{id}", produces = "text/html")
    public String FaRequestController.saleEngReject(@PathVariable("id") Long id, Model uiModel, Principal principal) {
        FaRequest faRequest = FaRequest.findFaRequest(id);
        uiModel.addAttribute("farequest", faRequest);
        return "sale-cancel";
    }
}
