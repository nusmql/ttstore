package constvar
const (
	DefaultLimit = 50
)

/**
 * Order flow: place order (1xx) -> payment (2xx) -> shipping (3xx) -> confirm (4xx)
 * Order status:
 * 101 Order created and waiting for payment; 102 failed payment due to user cancelled; 103 payment timeout auto cancelled; 104 admin cancelled order
 * 201 Payment successful; 202 user request to refund; 203 Admin Process refund and refund successful
 * 301 Goods shipped
 * 401 Buyer confirm received Goods
 */
const (
	ORDER_STATUS_CREATE = 101
	ORDER_STATUS_CANCEL = 102
	ORDER_STATUS_AUTO_CANCEL = 103
	ORDER_STATUS_ADMIN_CANCEL = 104
	ORDER_STATUS_PAY = 201
	ORDER_STATUS_REFUND = 202
	ORDER_STATUS_REFUND_CONFIRM = 203
	ORDER_STATUS_SHIP = 301
	ORDER_STATUS_CONFIRM = 401
)