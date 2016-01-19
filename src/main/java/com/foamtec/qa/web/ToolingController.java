package com.foamtec.qa.web;
import com.foamtec.qa.domain.Tooling;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Tooling.class)
@Controller
@RequestMapping("/toolings")
@RooWebScaffold(path = "toolings", formBackingObject = Tooling.class)
public class ToolingController {
}
