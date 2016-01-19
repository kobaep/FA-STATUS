// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.web;

import com.foamtec.qa.domain.Tooling;
import com.foamtec.qa.web.ToolingController;
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

privileged aspect ToolingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ToolingController.create(@Valid Tooling tooling, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tooling);
            return "toolings/create";
        }
        uiModel.asMap().clear();
        tooling.persist();
        return "redirect:/toolings/" + encodeUrlPathSegment(tooling.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ToolingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Tooling());
        return "toolings/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ToolingController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("tooling", Tooling.findTooling(id));
        uiModel.addAttribute("itemId", id);
        return "toolings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ToolingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("toolings", Tooling.findToolingEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Tooling.countToolings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("toolings", Tooling.findAllToolings(sortFieldName, sortOrder));
        }
        return "toolings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ToolingController.update(@Valid Tooling tooling, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tooling);
            return "toolings/update";
        }
        uiModel.asMap().clear();
        tooling.merge();
        return "redirect:/toolings/" + encodeUrlPathSegment(tooling.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ToolingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Tooling.findTooling(id));
        return "toolings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ToolingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Tooling tooling = Tooling.findTooling(id);
        tooling.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/toolings";
    }
    
    void ToolingController.populateEditForm(Model uiModel, Tooling tooling) {
        uiModel.addAttribute("tooling", tooling);
    }
    
    String ToolingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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