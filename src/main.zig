const print = @import("std").debug.print;
const international = @import("international.zig");

//Global vairables
const vat: f32 = 1.2;

pub fn main() !void {
    const sender = international.country{ .name = "USA", .valid = true };
    const reciepient = international.country{ .name = "Germany", .valid = true };
    const product = international.shipment{ .productName = "iPhone 14 Pro Max", .price = 1099.99, .weight = 0.25 };
    try international.sendShipment(sender, reciepient, product);
}

fn ticketCostAfterTax(cost: f32) f32 {
    const final_cost = cost * vat;
    return final_cost;
}
