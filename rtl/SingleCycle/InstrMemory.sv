module InstrMemory #(
    parameter A_WIDTH = 32,
    D_WIDTH = 8
) (
    input  logic [  A_WIDTH-1:0] A,
    output logic [4*D_WIDTH-1:0] RD
);

  // ROM Array
  logic [D_WIDTH-1:0] ROM[32'hbfc00fff:32'hbfc00000];

  // Load ROM from mem file
  initial begin
    $display("Loading ROM");
    $readmemh("./test/Memory/pdf.mem", ROM);
    $display("Instructions written to ROM successfully");
  end

  // Assign Output
  assign RD = {{ROM[A+3]}, {ROM[A+2]}, {ROM[A+1]}, {ROM[A]}};

endmodule
