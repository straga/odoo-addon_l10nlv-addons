<html>
<head>
    <style type="text/css">
        ${css}
    </style>
</head>
<body>
<%import time%>
<% count = 0 %>
%for obj in objects :
    <% setLang(user.lang) %>
	<% count +=1 %>
	%if count > 1 :
	<br/>
	%endif
    <span class="title">${_("Asset Tracking")}${obj.code}</span>
    <br/>
	<br/>
	<table width=100%>
		<tbody>
			<tr>
				<td colspan="2">${_("Asset Name")}</td>
				<td>${_("Code")}</td>
				<td style="text-align:center;border:thin solid">${obj.code}</td>
				<td>${_("Depreciation Code")}</td>
				<td style="text-align:center;border:thin solid">${obj.category_id.name}</td>
			</tr>
			<tr>
				<td colspan="2" style="border:thin solid">${obj.name}</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2">${_("Location")}</td>
				<td>${_("Number")}</td>
				<td style="border:thin solid;text-align:center">${_("1")}</td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" style="border:thin solid"></td>
				<td colspan="2"></td>
				<td>${_("Depreciation rate for the year, %")}</td>
				<td style="border:thin solid;text-align:right">${"%0.2f" % (((obj.purchase_value/((obj.method_period*obj.method_number)/12))*100)/obj.purchase_value) or ''}</td>
			</tr>
			<tr>
				<td>${_("Date of Commissioning")}</td>
				<td style="border:thin solid;text-align:center">${obj.purchase_date}</td>
				<td>${_("Initial value")}</td>
				<td style="border:thin solid;text-align:right">${formatLang(obj.purchase_value)}</td>
				<td style="text-align:right">${_("Year Amount")}</td>
				<td style="border:thin solid;text-align:right">${formatLang(obj.purchase_value/((obj.method_period*obj.method_number)/12)) or ''}</td>
			</tr>
			<tr>
				<td>${_("Useful life (years)")}</td>
				<td style="border:thin solid;text-align:center">${"%0.2f" % ((obj.method_period*obj.method_number)/12) or ''}</td>
				<td>${_("Clearance (scrap) value")}</td>
				<td style="border:thin solid;text-align:right">${formatLang(obj.salvage_value)}</td>
				<td>${_("This month, %")}</td>
				<td style="border:thin solid;text-align:right">${formatLang(((obj.purchase_value/(obj.method_period*obj.method_number))*100)/obj.purchase_value) or ''}</td>
			</tr>
			<tr>
				<td>${_("Useful life (months)")}</td>
				<td style="border:thin solid;text-align:center">${obj.method_period*obj.method_number or ''}</td>
				<td>${_("Within the month following the depreciation")}</td>
				<td style="border:thin solid"></td>
				<td style="text-align:right">${_("Amount")}</td>
				<td style="border:thin solid;text-align:right">${formatLang(obj.purchase_value/(obj.method_period*obj.method_number)) or ''}</td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="2">${_("Comments ")}</td>
			</tr>
			<tr>
				<td>${_("Date off")}</td>
				<td style="border:thin solid"></td>
				<td colspan="2"></td>
				<td colspan="2" style="border:thin solid"></td>
			</tr>
			<tr>
				<td colspan="2">${_("and motivation")}</td>
				<td colspan="2"></td>
				<td colspan="2" style="border:thin solid"></td>
			</tr>
			<tr>
				<td colspan="2" style="border:thin solid"><font color="white">${_("basic.")}</font></td>
				<td colspan="2"></td>
				<td colspan="2" style="border:thin solid"></td>
			</tr>
		</tbody>
	</table>
	<br/>
	% if obj.state not in 'draft' :
	<table width="100%" border="1">
		<thead>
			<tr>
				<th rowspan="2" width="8%">${_("Date")}</th>
				<th rowspan="2">${_("Economic description of the transaction and the document number")}</th>
				<th rowspan="2">${_("Cost of acquisition or production")}</th>
				<th rowspan="2">${_("Rehabilitation")}</th>
				<th colspan="2">${_("Revaluation")}</th>
				<th rowspan="2">${_("Carrying value")}</th>
				<th rowspan="2">${_("Depreciation")}</th>
				<th rowspan="2">${_("Residual value")}</th>
			</tr>
			<tr>
				<th width="10%">${_("increase")}</th>
				<th width="10%">${_("decrease")}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${obj.purchase_date}</td>
				<td>${_("Asset commissioning")}</td>
				<td style="text-align:right">${formatLang(obj.purchase_value)}</td>
				<td></td>
				<td></td>
				<td></td>
				<td style="text-align:right">${formatLang(obj.purchase_value)}</td>
				<td></td>
				<td style="text-align:right">${formatLang(obj.purchase_value)}</td>
			</tr>
			%for line in obj.depreciation_line_ids :
			%if (line.move_check == True or line.init_entry == True):
			<tr>
				<td>${line.depreciation_date}</td>
				<td>${_("Depreciation")}</td>
				<td style="text-align:right">${formatLang(line.asset_id.purchase_value)}</td>
				<td></td>
				<td></td>
				<td></td>
				<td style="text-align:right">${formatLang(line.remaining_value + line.amount)}</td>
				<td style="text-align:right">${formatLang(line.amount)}</td>
				<td style="text-align:right">${formatLang(line.remaining_value)}</td>
			</tr>
			%endif
			%endfor
		</tbody>
	</table>
	%endif
	<p style="page-break-after:always"></p>
%endfor
</body>
</html>
