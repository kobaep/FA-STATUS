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
        uiModel.addAttribute("appUser", AppUser.findByUserName(faRequest.getCreateBy()));
        return "eng-approve";
    }
}
