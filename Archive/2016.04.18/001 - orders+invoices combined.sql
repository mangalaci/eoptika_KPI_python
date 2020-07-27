
DROP TABLE IF EXISTS BASE_001_TABLE;
CREATE TABLE BASE_001_TABLE
SELECT 	DISTINCT 
		r.sql_id, 
		r.erp_id, 
		r.reference_id, 
		r.created, 
		NULL AS fulfillment_date,
		NULL AS due_date,
		NULL AS billing_method,
		r.shipping_method,
		NULL AS our_bank_account_number,
		packaging_deadline,
		r.related_division,
		r.related_email,
		r.billing_name,
		r.billing_country,
		r.billing_zip_code,
		r.billing_city,
		r.billing_address,
		r.related_department,
		r.shipping_name,
		r.shipping_country,
		r.shipping_zip_code,
		r.shipping_city,
		shipping_address,
		shipping_phone,
		related_customer_group,
		related_warehouse,
		related_webshop,
		currency,
		exchange_rate_of_currency,
		related_comment,
		item_sku,
		item_name_hun,
		item_name_eng,
		item_group_name,
		item_type,
		item_note AS item_comment,
		item_vat_rate,
		NULL AS lot_number,
		NULL AS item_net_purchase_price_in_base_currency,
		NULL AS item_net_registered_price_in_base_currency,
		NULL AS item_net_clearing_price_in_base_currency,
		item_net_sale_price_in_currency,
		item_gross_sale_price_in_currency,
		item_net_sale_price_in_base_currency,
		item_gross_sale_price_in_base_currency,		
		item_quantity,
		unit_of_quantity_hun,
		unit_of_quantity_eng,
		item_net_value_in_currency,
		item_vat_value_in_currency,
		item_gross_value_in_currency,
		item_net_value,
		item_vat_value,
		item_gross_value,
		NULL AS item_weight_in_kg,
		NULL AS packaging_weight_in_kg,
		quantity_booked,
		quantity_delivered,
		quantity_billed,
		quantity_marked_as_fulfilled,
		erp_id_of_delivery_note,
		erp_id_of_bill,
		NULL AS connected_order_erp_id,
		NULL AS connected_delivery_note_erp_id,
		item_is_deleted AS item_is_canceled,
		NULL AS cancelled_bill_erp_id,
		deletion_comment AS cancellation_comment,
		is_deleted AS is_canceled,
		processed,
		user,
		'orders' AS origin 
FROM incoming_orders2 r /*13.467*/ 
WHERE r.deletion_comment NOT IN ('Automatikus törlés módosítás miatt', '5) Egyéb: 2x') 
AND LOWER(r.deletion_comment) NOT LIKE '%dupl%' 
AND LOWER(r.deletion_comment) NOT LIKE '%teszt%' 
AND r.is_deleted = 'yes'

UNION

SELECT 	DISTINCT
		sz.sql_id, 
		sz.erp_id, 
		sz.reference_id, 
		sz.created,
		sz.fulfillment_date,
		sz.due_date, 
		sz.billing_method,
		sz.shipping_method,
		sz.our_bank_account_number,
		NULL AS packaging_deadline,
		sz.related_division,
		sz.related_email,
		sz.billing_name,
		sz.billing_country,
		sz.billing_zip_code,
		sz.billing_city,
		sz.billing_address,
		sz.related_department,
		sz.shipping_name,
		sz.shipping_country,
		sz.shipping_zip_code,
		sz.shipping_city,
		shipping_address,
		shipping_phone,
		related_customer_group,
		related_warehouse,
		related_webshop,
		currency,
		exchange_rate_of_currency,
		related_comment,
		item_sku,
		item_name_hun,
		item_name_eng,
		item_group_name,
		item_type,
		item_comment,
		item_vat_rate,
		lot_number,
		item_net_purchase_price_in_base_currency,
		item_net_registered_price_in_base_currency,
		item_net_clearing_price_in_base_currency,
		item_net_sale_price_in_currency,
		item_gross_sale_price_in_currency,
		item_net_sale_price_in_base_currency,
		item_gross_sale_price_in_base_currency,
		item_quantity,
		unit_of_quantity_hun,
		unit_of_quantity_eng,
		item_net_value_in_currency,
		item_vat_value_in_currency,
		item_gross_value_in_currency,
		item_net_value,
		item_vat_value,
		item_gross_value,
		item_weight_in_kg,
		packaging_weight_in_kg,
		NULL AS quantity_booked,
		NULL AS quantity_delivered,
		NULL AS quantity_billed,
		NULL AS quantity_marked_as_fulfilled,
		connected_order_erp_id,
		connected_delivery_note_erp_id,
		NULL AS erp_id_of_delivery_note,
		NULL AS erp_id_of_bill,
		item_is_canceled,
		cancelled_bill_erp_id,
		cancellation_comment,
		is_canceled,
		processed,
		user,
		'invoices' AS origin 
FROM outgoing_bills sz
;