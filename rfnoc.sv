
package rfnoc_helpers;
    class Rand #(WIDTH = 32);
        static function logic [WIDTH-1:0] rand_logic();
            logic [WIDTH-1:0] result;
            int num_rand32 = (WIDTH + 21) / 32;
            for (int i = 0; i < num_rand32; i++) begin
                result = {result, $urandom()};
            end
            return result;
        endfunction : rand_logic

    endclass : Rand



endpackage : rfnoc_helpers