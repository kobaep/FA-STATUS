package com.foamtec.qa.web;
import com.foamtec.qa.domain.FaRequest;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = FaRequest.class)
@Controller
@RequestMapping("/farequests")
@RooWebScaffold(path = "farequests", formBackingObject = FaRequest.class)
public class FaRequestController {
}
