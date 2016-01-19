// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.web;

import com.foamtec.qa.domain.DocumentHistory;
import com.foamtec.qa.domain.FaRequest;
import com.foamtec.qa.domain.Material;
import com.foamtec.qa.domain.Tooling;
import com.foamtec.qa.domain.TypeOfRequest;
import com.foamtec.qa.web.FaRequestController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect FaRequestController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FaRequestController.create(@Valid FaRequest faRequest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, faRequest);
            return "farequests/create";
        }
        uiModel.asMap().clear();
        faRequest.persist();
        return "redirect:/farequests/" + encodeUrlPathSegment(faRequest.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FaRequestController.createForm(Model uiModel) {
        populateEditForm(uiModel, new FaRequest());
        return "farequests/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FaRequestController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("farequest", FaRequest.findFaRequest(id));
        uiModel.addAttribute("itemId", id);
        return "farequests/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FaRequestController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("farequests", FaRequest.findFaRequestEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) FaRequest.countFaRequests() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("farequests", FaRequest.findAllFaRequests(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "farequests/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FaRequestController.update(@Valid FaRequest faRequest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, faRequest);
            return "farequests/update";
        }
        uiModel.asMap().clear();
        faRequest.merge();
        return "redirect:/farequests/" + encodeUrlPathSegment(faRequest.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FaRequestController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, FaRequest.findFaRequest(id));
        return "farequests/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FaRequestController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FaRequest faRequest = FaRequest.findFaRequest(id);
        faRequest.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/farequests";
    }
    
    void FaRequestController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("faRequest_createdate_date_format", "dd/MM/yyyy hh:mm:ss");
        uiModel.addAttribute("faRequest_needdate_date_format", "dd/MM/yyyy hh:mm:ss");
        uiModel.addAttribute("faRequest_engworkcommitdate_date_format", "dd/MM/yyyy hh:mm:ss");
        uiModel.addAttribute("faRequest_engsendworkdate_date_format", "dd/MM/yyyy hh:mm:ss");
    }
    
    void FaRequestController.populateEditForm(Model uiModel, FaRequest faRequest) {
        uiModel.addAttribute("faRequest", faRequest);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("documenthistorys", DocumentHistory.findAllDocumentHistorys());
        uiModel.addAttribute("materials", Material.findAllMaterials());
        uiModel.addAttribute("toolings", Tooling.findAllToolings());
        uiModel.addAttribute("typeofrequests", TypeOfRequest.findAllTypeOfRequests());
    }
    
    String FaRequestController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}