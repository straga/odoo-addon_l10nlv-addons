<html>
<head>
    <style type="text/css">
        ${css}
    </style>
</head>
<body>
<% count = 0 %>
%for obj in objects :
	<% setLang(user.lang) %>
	<% count += 1 %>
	%if count > 1 :
	<br/>
	%endif
	<span><b>${_("APPROVED:")}</b></span>
	<br/>
	<span>${_("Manager ________________________")}</span>
	<br/>
	<span>${_("Date: ________________________")}</span>
	<br/>
	<br/>
	<div class="title" style="text-align:center">${_("ACT")}</div>
	<div class="title" style="text-align:center">${_("For the adoption and implementation of fixed assets in service.")}</div>
	<br/>
	<br/>
	<span><b><u>${_("Brief description of goods:")}</u></b></span>
	<br/>
	<br/>
	<table width="100%" border="1">
		<thead>
			<tr>
				<th width="20%">${_("Name")}</th>
				<th width="10%">${_("Acquisition value")}</th>
				<th width="15%">${_("The provision of depreciation deduction (%) / month")}</th>
				<th width="15%">${_("Commissioning (date)")}</th>
				<th width="15%">${_("Full amortization period (months)")}</th>
				<th>${_("Comments")}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${obj.name}</td>
				<td style="text-align:center">${obj.purchase_value}</td>
				<td style="text-align:center">${"%0.2f" % (((obj.purchase_value/((obj.method_period*obj.method_number)/12))*100)/obj.purchase_value) or ''} / ${"%0.2f" % (obj.purchase_value/(obj.method_period*obj.method_number)) or ''}</td>
				<td style="text-align:center">${obj.purchase_date}</td>
				<td style="text-align:center">${obj.method_period*obj.method_number or ''}</td>
				<td>${obj.note or ''}</td>
			</tr>
		</tbody>
	</table>
	<br/>
	<br/>
	<br/>
	<span><b><u>${_("Views of the participants in the following composition:")}</u></b></span>
	<br/>
	<br/>
	<table width="100%">
		<tr>
			<td style="border-bottom:2px solid"><b>${_("Chairman of the committee")}</b></td>
		</tr>
		<tr>
			<td style="border-bottom:thin solid">${_("Committee Members:")}</td>
		</tr>
		<tr>
			<td style="border-bottom:thin solid"><font color="white">...</font></td>
		</tr>
		<tr>
			<td style="border-bottom:thin solid"><font color="white">...</font></td>
		</tr>
		<tr>
			<td style="border-bottom:2px solid"><font color="white">...</font></td>
		</tr>
	</table>
	<br/>
	<br/>
	<br/>
	<span><b><u>${_("Places of participants was the following:")}</u></b></span>
	<br/>
	<br/>
	<table width="100%" border="1">
		<tbody>
			<tr>
				<td width="53%">${_("The material value delivery - at the time of acceptance")}</td>
				<td width="47%"></td>
			</tr>
			<tr>
				<td width="53%">${_("Value of the material and technical provision")}</td>
				<td width="47%"></td>
			</tr>
			<tr>
				<td width="53%">${_("Run-in and do not need; directly:")}</td>
				<td width="47%"></td>
			</tr>
			<tr>
				<td width="53%">${_("Conclusion:")}</td>
				<td width="47%"></td>
			</tr>
			<tr>
				<td width="53%">${_("Added value of materials")}</td>
				<td width="47%"></td>
			</tr>
		</tbody>
	</table>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	%if count == 1 :
	<br/>
	%endif
	<table width="100%">
		<tbody>
			<tr>
				<td width="55%">${_("Accounting mention of the introduction of the object (the movement)")}</td>
				<td width="45%" style="border-bottom:thin solid"></td>
			</tr>
		</tbody>
	</table>
	<p style="page-break-after:always"></p>
%endfor
</body>
</html>
