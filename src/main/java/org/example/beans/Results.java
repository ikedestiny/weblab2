package org.example.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.model.Result;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

@Data
@NoArgsConstructor
public class Results {
    private List<Result> sessionResults = Collections.synchronizedList(new LinkedList<>());



    public void addResult(Result result) {
        sessionResults.add(result);
    }

    public void clearAll() {
        sessionResults.clear();
    }

    public List<Result> getSessionResults() {
        return sessionResults;
    }


}
