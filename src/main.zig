const print = @import("std").debug.print;

//Global
const vat: f32 = 1.2;

pub fn main() !void {
    print("{d:.2}\n", .{ticketCostAfterTax(10)});
}

fn ticketCostAfterTax(cost: f32) f32 {
    const final_cost = cost * vat;
    return final_cost;
}
