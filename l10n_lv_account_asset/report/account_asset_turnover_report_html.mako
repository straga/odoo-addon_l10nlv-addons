<html>
<head>
    <style type="text/css">
        ${css}
    </style>
</head>
<body>
    <% setLang(user.lang) %>
	<span class="title">${_("Asset turnover ")}</span>
	<span>${_("from ")}${data['form']['from_date']}</span>
	<span>${_("to ")}${data['form']['to_date']}</span>
	<br/>
	<br/>
	<table class="list_table"  width="100%">
		<thead>
			<tr>
				<th colspan="3" class>${_("Transaction")}</th>
				<th class>${_("Carrying value")}</th>
				<th class>${_("Depreciation")}</th>
				<th class>${_("Residual value")}</th>
			</tr>
		<thead>
		<tbody>
<%
	purchase_total_amount_1 = 0.0;
	purchase_total_amount_2 = 0.0;
	purchase_total_amount_3 = 0.0;
	depr_total_amount_1 = 0.0;
	depr_total_amount_2 = 0.0;
	depr_total_amount_3 = 0.0;
	left_total_amount_1 = 0.0;
	left_total_amount_2 = 0.0;
	left_total_amount_3 = 0.0;
%>
			%for asset in lines(data['form']) :
			<tr>
				<td style="border-top:none"><b>${asset['account_code']}</b></td>
				<td style="border-top:none"><b>${asset['account_name']}</b></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">${_("Opening balances")}</td>
				<td style="text-align:right">${formatLang(asset['purchase1'])}</td>
				<td style="text-align:right">${formatLang(asset['depr1'])}</td>
				<td style="text-align:right">${formatLang(asset['left1'])}</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">${_("Purchase")}</td>
				<td style="text-align:right">${formatLang(asset['purchase2'])}</td>
				<td style="text-align:right">${formatLang(asset['depr2'])}</td>
				<td style="text-align:right">${formatLang(asset['left2'])}</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">${_("Assets depreciation")}</td>
				<td style="text-align:right">${formatLang(asset['purchase3'])}</td>
				<td style="text-align:right">${formatLang(asset['depr3'])}</td>
				<td style="text-align:right">${formatLang(asset['left3'])}</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">${_("Liquidation")}</td>
				<td style="text-align:right">${formatLang(asset['purchase4'])}</td>
				<td style="text-align:right">${formatLang(asset['depr4'])}</td>
				<td style="text-align:right">${formatLang(asset['left4'])}</td>
			</tr>
			<tr>
				<td>${_("Total:")}</td>
				<td>${asset['account_code']}</td>
				<td>${_("Total change:")}</td>
				<td style="text-align:right">${formatLang(asset['purchase_total1'])}</td>
				<td style="text-align:right">${formatLang(asset['depr_total1'])}</td>
				<td style="text-align:right">${formatLang(asset['left_total1'])}</td>
			</tr>
			<tr>
				<td style="border-style:none" colspan="2"></td>
				<td style="border-style:none">${_("End Period:")}</td>
				<td style="border-style:none;text-align:right">${formatLang(asset['purchase_total2'])}</td>
				<td style="border-style:none;text-align:right">${formatLang(asset['depr_total2'])}</td>
				<td style="border-style:none;text-align:right">${formatLang(asset['left_total2'])}</td>
			</tr>
<%
purchase_total_amount_1 += asset['purchase1'];
depr_total_amount_1 += asset['depr1'];
left_total_amount_1 += asset['left1'];
purchase_total_amount_2 += asset['purchase_total1'];
depr_total_amount_2 += asset['depr_total1'];
left_total_amount_2 += asset['left_total1'];
purchase_total_amount_3 += asset['purchase_total2'];
depr_total_amount_3 += asset['depr_total2'];
left_total_amount_3 += asset['left_total2'];
%>
			%endfor

			<tr>
				<td style="border-top:2px solid"></td>
				<td style="border-top:2px solid;text-align:right"><b>${_("Values for report:")}</b></td>
				<td style="border-top:2px solid"><b>${_("End Period:")}</b></td>
				<td style="border-top:2px solid;text-align:right"><b>${formatLang(purchase_total_amount_1)}</b></td>
				<td style="border-top:2px solid;text-align:right"><b>${formatLang(depr_total_amount_1)}</b></td>
				<td style="border-top:2px solid;text-align:right"><b>${formatLang(left_total_amount_1)}</b></td>
			</tr>
			<tr>
				<td colspan="2" style="border-style:none"></td>
				<td style="border-style:none"><b>${_("Change:")}</b></td>
				<td style="border-style:none;text-align:right"><b>${formatLang(purchase_total_amount_2)}</b></td>
				<td style="border-style:none;text-align:right"><b>${formatLang(depr_total_amount_2)}</b></td>
				<td style="border-style:none;text-align:right"><b>${formatLang(left_total_amount_2)}</b></td>
			</tr>
			<tr>
				<td colspan="2" style="border-style:none"></td>
				<td style="border-style:none"><b>${_("End Period:")}</b></td>
				<td style="border-style:none;text-align:right"><b>${formatLang(purchase_total_amount_3)}</b></td>
				<td style="border-style:none;text-align:right"><b>${formatLang(depr_total_amount_3)}</b></td>
				<td style="border-style:none;text-align:right"><b>${formatLang(left_total_amount_3)}</b></td>
			</tr>
		</tbody>
	</table>
</body>
</html>
