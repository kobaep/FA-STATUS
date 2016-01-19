package com.foamtec.qa.web;
import com.foamtec.qa.domain.Material;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Material.class)
@Controller
@RequestMapping("/materials")
@RooWebScaffold(path = "materials", formBackingObject = Material.class)
public class MaterialController {
}
