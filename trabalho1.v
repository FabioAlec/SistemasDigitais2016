module Value(
    input pulso,
    output ligado 
);
    
    assign ligado = pulso; 

endmodule

module liga_desliga;
    reg pulso; 
    wire ligado; 

    Value inicio(pulso, ligado);    
    always #1 pulso = ~pulso;
    initial begin 
        $dumpvars(0,inicio); 
        #0
        pulso <= 1;
        #20;
        $finish;
    end

endmodule
