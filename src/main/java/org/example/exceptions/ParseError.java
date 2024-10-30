package org.example.exceptions;

public class ParseError extends RuntimeException {
    public ParseError() {
        super("Params are not properly formed");
    }
}
