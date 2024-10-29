package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Request {
    private float r;
    private float x;
    private float y;
    private Long received;
    private String sent;
}
