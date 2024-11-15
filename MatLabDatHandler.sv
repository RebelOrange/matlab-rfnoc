package MatLabDatHandler;

    typedef struct{shortint I, Q;} IQPair;
    typedef struct{longint I, Q;} WeightPair;

    function int OpenFile(string filePath, string mode="r");
		int res;
    
		$display($sformatf("Opening file: %s",filePath));
		
		res =  $fopen(filePath,mode);
		//$display($sformatf("Opening file descriptor: %d",res));
		
		if (mode=="w") begin
		  $fclose(res);
		  res = $fopen(filePath,"wb"); //create new file
		  $fclose(res);
		  res =$fopen(filePath,"a"); //reaopen with append option
		end
        return res;
    endfunction 
    
    function IQPair ReadIQSamples(int fileDescriptor);
        IQPair IQResult;
        int res;
		//$display($sformatf("Opening file descriptor: %d",fileDescriptor));
        
        res = $fscanf(fileDescriptor, "%d, %d", IQResult.I, IQResult.Q);
        return IQResult;
    endfunction 
    
    function shortint ReadSingleVal(int fileDescriptor);
        shortint value;
        int res;
        res = $fscanf(fileDescriptor, "%d", value);
        return value;
    endfunction
    
    function void WriteIQSamples(int fileDescriptor, IQPair iqPair);    
        int res;
        string data;
        $sformat(data, "%d, %d", iqPair.I, iqPair.Q);
        $fdisplay(fileDescriptor, data);
    endfunction

    function void WriteWeightSamples(int fileDescriptor, WeightPair weightPair);
        int res;
        string data;
        $sformat(data,"%d, %d", weightPair.I, weightPair.Q);
        $fdisplay(fileDescriptor, data);
    endfunction
    
    function void CloseFile(int fileDescriptor);
		$display($sformatf("Closing file id: %d", fileDescriptor));
        $fclose(fileDescriptor);
    endfunction
    
    function string GetPwd(string tb_file);
        int i;
        int str_index;
        logic found_path;
        string ret="";
    
        for (i = tb_file.len()-1; i>0; i=i-1) begin
            if (tb_file[i] == "/") begin
                found_path=1;
                str_index=i;
                break;
            end
        end
        if (found_path==1) begin
            ret=tb_file.substr(0,str_index);
            return ret;   
        
        end
        return ret;
    
    endfunction
        
endpackage : MatLabDatHandler

