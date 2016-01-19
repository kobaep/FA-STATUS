package com.foamtec.qa.web;
import com.foamtec.qa.domain.TypeOfRequest;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = TypeOfRequest.class)
@Controller
@RequestMapping("/typeofrequests")
@RooWebScaffold(path = "typeofrequests", formBackingObject = TypeOfRequest.class)
public class TypeOfRequestController {
}
