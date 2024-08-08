const print = @import("std").debug.print;

var tax: f32 = 1.2;

pub const continent = enum {
    NorthAmerica,
    SouthAmerica,
    Europe,
    Asia,
    Africa,
};

pub const country = struct { name: []const u8, continent: continent, valid: bool };

pub const shipment = struct {
    productName: []const u8,
    price: f32,
    weight: f32,
};

const Error = error{ InvalidSender, InvalidRecipient, InvalidProduct };

pub fn sendShipment(sender: country, recipient: country, product: shipment) Error!void {
    var cost: f32 = 0;
    if (sender.continent != recipient.continent) {
        print("The shipment is a international shipment! This costs more!\n", .{});
        cost = costPerGram(product);
    } else {
        cost = costPerGram(product) * 0.5;
    }
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

    cost = tax * cost;

    print("Shipment sent to {s}\n", .{recipient.name});
    print("Product info: Name: {s}, Price: {d:.2}, Weight: {d:.2}\n", .{ product.productName, product.price, product.weight });
    print("Cost of shipping this is: ${d:.2}\n", .{cost});
}

fn costPerGram(product: shipment) f32 {
    return product.weight * 2.5;
}
