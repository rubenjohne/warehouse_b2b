<cfoutput>
	<h4 align="right">#getPlugin("paging").renderit(rc.products.RecordCount,event.buildLink('catalog.index.@page@'))#</h4>
	<cfform action="#event.buildLink('catalog.updateProducts')#" method="post" >
    <table width="85%" border="0" cellspacing="0" cellpadding="2">
      <tr>
      	<th scope="col">Images</th>
        <th scope="col">Style</th>
        <th scope="col">Color</th>
        <th scope="col">Description</th>
        <th scope="col">Division</th>
        <th scope="col">Size Desc</th>
        <th scope="col">Delivery</th>
        <th scope="col">Hot Seller</th>
        <th scope="col">On Web</th>
        <th scope="col">Archived</th>
      </tr>
		<cfloop query="rc.products" startRow="#rc.boundaries.startrow#" endRow="#rc.boundaries.maxrow#">
		      <tr>
		      	<td><img src="/warehouse/uploadedfiles/images/#thumbnailFile#" alt="Picture"></td>
		        <td>#styleName#</td>
		        <td>#colorDescription#</td>
		        <td>#extendedDescription#</td>
		        <td>#divisionName#</td>
		        <td>#sizeDescription#</td>				
		        <td>#deliveryMonth#/#deliveryYear#</td>
		        <td><cfinput name="cbHotSeller" type="checkbox" checked="#hotSeller#" value="#productId#"/></td>
		        <td><cfinput name="cbOnWeb" type="checkbox" checked="#onWeb#" value="#productId#"/></td>
		        <td><cfinput name="cbArchive" type="checkbox" checked="#archive#" value="#productId#"/></td>
		      </tr>
		</cfloop>		
	</table>
	<cfinput name="submit" type="submit" value="Update Products"/>
	</cfform>
</cfoutput>