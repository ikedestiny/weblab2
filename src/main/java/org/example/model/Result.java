package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Result {
    private boolean inArea;
    private float x;
    private float y;
    private float r;
    private String requestSent;
    private String responseTIme;
}
