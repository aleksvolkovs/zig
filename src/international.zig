const print = @import("std").debug.print;

pub const country = struct { name: []const u8, valid: bool };

pub const shipment = struct {
    productName: []const u8,
    price: f32,
    weight: f32,
};

const Error = error{ InvalidSender, InvalidRecipient, InvalidProduct };

pub fn sendShipment(sender: country, recipient: country, product: shipment) Error!void {
    if (!sender.valid) {
        return error.InvalidSender;
    }
    if (!recipient.valid) {
        return error.InvalidRecipient;
    }
    if (product.productName.len == 0 or product.price <= 0 or product.weight <= 0) {
        return error.InvalidProduct;
    }

    if (!recipient.valid) {
        print("Recipient does not take in any shipments!\n", .{});
        return error.InvalidRecipient;
    }

    print("Shipment sent to {s}\n", .{recipient.name});
    print("Product info: Name: {s}, Price: {d:.2}, Weight: {d:.2}\n", .{ product.productName, product.price, product.weight });
}
