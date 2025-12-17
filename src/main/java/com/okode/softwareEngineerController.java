package com.okode;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.awt.*;
import java.util.List;

@RestController
@RequestMapping ("api/v1/software-Engineers")
public class softwareEngineerController {
    @GetMapping
    public List<softwareEngineer> getEngineer(){

        return List.of(
                new softwareEngineer(
                        1,
                        "Moses OKode",
                        "Python, Java, Javascript, Tailwing, Angular"
                ),
                new softwareEngineer(
                        2,
                        "James Mwa",
                        "MERN-STACK, java, Angular, CSS, HTML"
                ),
                new softwareEngineer(
                        3,
                        "Venessa Jomo",
                        "Finance"

                )
        );
    }

}
