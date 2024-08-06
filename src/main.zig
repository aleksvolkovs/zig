const print = @import("std").debug.print;

pub fn main() !void {
    print("{d:.2}\n", .{ticketCostAfterTax(10)});
}

fn ticketCostAfterTax(cost: f32) f32 {
    const vat: f32 = 1.2; //20% tax
    const final_cost = cost * vat;
    return final_cost;
}
