package org.example.utils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ran {
    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);
        int count = scanner.nextInt();
        scanner.nextLine();
        List<String> allStrings = new ArrayList<>();

        for (int curr  = 0 ; curr<count; curr++){
            allStrings.add(scanner.nextLine());
        }

        for(int currx = 0; currx< allStrings.size(); currx++){
        String[] strings = allStrings.get(currx).split(" ");
        List<Integer> numbers = new ArrayList<>();
        for (String s : strings){
            numbers.add(Integer.parseInt(s));
        }

        int hcf = getHCF(numbers.get(0), numbers.get(1));
        var aprime = getPrimeFactors(numbers.get(0));
        var bprime = getPrimeFactors(numbers.get(1));

        int amax = hcf;
        int bmax = hcf;
        for (int i : aprime){
             if (hcf*i>bmax){
                 bmax = hcf*i;
             }
        }

        for (int i : bprime){
            if (hcf*i>amax){
                amax = hcf*i;
            }
        }


        System.out.println(amax > bmax ? amax : bmax);}
    }

    static int getHCF(int a, int b){
        ArrayList<Integer> fators = new ArrayList<>();
       List<Integer> afactors = getFactors(a);
       List<Integer> bfactors = getFactors(b);
       int hcf = 1;
       for (var af : afactors){
           if (bfactors.contains(af) && (af > hcf)) hcf = af;
       }
       return hcf;
    }

    public static List<Integer> getPrimeFactors(int number) {
        List<Integer> primeFactors = new ArrayList<>();

        // Divide out the factor 2 until the number is odd
        while (number % 2 == 0) {
            primeFactors.add(2);
            number /= 2;
        }

        // For odd factors, start from 3 and check up to the square root of the number
        for (int i = 3; i <= Math.sqrt(number); i += 2) {
            while (number % i == 0) {
                primeFactors.add(i);
                number /= i;
            }
        }

        // If number is still greater than 2, then it is prime
        if (number > 2) {
            primeFactors.add(number);
        }

        return primeFactors;
    }

    public static List<Integer> getFactors(int number) {
        List<Integer> factors = new ArrayList<>();

        for (int i = 1; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                factors.add(i); // i is a factor
                if (i != number / i) { // Avoid adding the square root twice if it's a perfect square
                    factors.add(number / i);
                }
            }
        }

        // Optional: Sort the factors (if needed)
        factors.sort(Integer::compareTo);

        return factors;
    }


}
