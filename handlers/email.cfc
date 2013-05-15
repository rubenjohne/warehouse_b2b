
<cfcomponent extends="coldbox.system.eventhandler">

	<cffunction name="emailProductInquiry" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfmail from="#rc.accountName# <#rc.email#>" to="deborah@tadashishoji.com,rocioo@tadashishoji.com,elizabeth@tadashishoji.com,pablo@tadashishoji.com,customerservice@tadashishoji.com,adrianf@tadashishoji.com"
			    cc="#rc.email#" 
				subject="#rc.accountNumber#:#rc.accountName#  Inventory Inquiry" type="text/html" charset="utf-8">
			<p>Account Number : #rc.accountNumber#</p>
			<p>Account Name : #rc.accountName#</p>	
			
			<p>
			Thank you for your interest. Your request will be sent to you from your customer service representative.
			</p>
			<p>
			Gracias por su interes. Su peticion le sera enviada de su representante/servicio al cliente.			
			</p>
			<table border="1">
				<tr>
					<th>Image</th>
					<th>Style</th>
					<th>Color</th>
					<th>Price</th>
                    <th>Comments</th>
				</tr>
				<cfloop index="x" from="1" to="#arrayLen(rc.products)#">
					<cfmailparam contentid="product#x#" file="#expandPath('\')#\warehouse\uploadedfiles\images\#rc.products[x].getThumbnailFile()#" type="image/gif" disposition="inline">
					<tr>
							<td><img src="cid:product#x#" alt='#rc.products[x].getStyleName()# #rc.products[x].getColorDescription()#'></td>
							<td>#rc.products[x].getStyleName()#</td>
							<td>#rc.products[x].getColorDescription()#</td>						
							<td>#dollarFormat(rc.products[x].getSellingPrice())#</td>						
                            <td></td>
					</tr>				
				</cfloop>				
			</table>			
		</cfmail>
		
		<cfset event.noRender()>
				 
	</cffunction>

	<cffunction name="emailHotSeller" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.customerAccts = getPlugin("ioc").getBean("UserGateway").getAllAsQuery()> 
		
		<cfoutput query="rc.customerAccts">
		
		<cftry>
		
			<cfmail from="Tadashi Shoji <CustomerService@tadashishoji.com>"
	        		to="#rc.customerAccts.email#" 
					subject="Tadashi Shoji Hot Sellers" type="text/html">
				<p>Account Number :  #rc.customerAccts.accountNumber#</p>
				<p>Account Name : #rc.customerAccts.accountName#</p> 
				<table border="1">
					<tr>					
	                	<th>Image</th>
						<th>Style</th>
						<th>Color</th>
						<th>Price</th>
					</tr>
					<cfloop index="x" from="1" to="#arrayLen(rc.products)#">
						<cfmailparam contentid="product#x#" file="#expandPath('\')#\warehouse\uploadedfiles\images\#rc.products[x].getThumbnailFile()#" type="image/gif" disposition="inline">
						<tr>
								<td><img src="cid:product#x#" alt='#rc.products[x].getStyleName()# #rc.products[x].getColorDescription()#'></td>
								<td>#rc.products[x].getStyleName()#</td>
								<td>#rc.products[x].getColorDescription()#</td>						
								<td>#dollarFormat(rc.products[x].getSellingPrice())#</td>						
						</tr>				
					</cfloop>				
				</table>			
	            <!-- <p>For more information on how to use the online catalog please visit the site <a href="http://catalog.tadashishoji.com/warehouse/help/Help.htm">http://catalog.tadashishoji.com/warehouse/help/Help.htm</a></p> -->
                <p>If you are interested in finding out more information on the styles above or would like to place an order, Please feel free to contact the NY sales team.</p>                
		   <ul>
                <li style="list-style-type: none">Alan Geller - <a href="mailto:alang@tadashishoji.com">alang@tadashishoji.com</a></li>
                <li style="list-style-type: none">Dawn Cecero - <a href="mailto:dawn@tadashishoji.com">dawn@tadashishoji.com</a></li>
                <li style="list-style-type: none">Lauren Reiff - <a href="mailto:laurenr@tadashishoji.com">laurenr@tadashishoji.com</a></li>
                <li style="list-style-type: none">Marie Glogau - <a href="mailto:marieg@tadashishoji.com">marieg@tadashishoji.com</a></li>                
                <li style="list-style-type: none">Marie Panariello - <a href="mailto:marie@tadashishoji.com">marie@tadashishoji.com</a></li>                
            </ul>								
			</cfmail>
			
		<cfcatch>
		
			<cfmail from="ruben@tadashishoji.com" to="customerservice@tadashishoji.com" subject="wrong email address">
				wrong email address for account #rc.customerAccts.accountNumber# : #rc.customerAccts.accountName# with email #rc.customerAccts.email#  
			</cfmail>
		
		</cfcatch>	
		
		</cftry>
		
		
		</cfoutput>
					
		<cfset event.noRender()>
				 
	</cffunction>





	<cffunction name="emailTbyTadashiHotSeller" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.customerAccts = getPlugin("ioc").getBean("UserGateway").getAllAsQuery()> 
		
		<cfoutput query="rc.customerAccts">
		
		<cftry>
		
			<cfmail from="Tadashi Shoji <CustomerService@tadashishoji.com>"
	        		to="#rc.customerAccts.email#" 
					subject="T by Tadashi Hot Sellers" type="text/html">
				<p>Account Number :  #rc.customerAccts.accountNumber#</p>
				<p>Account Name : #rc.customerAccts.accountName#</p> 
				<table border="1">
					<tr>					
	                	<th>Image</th>
						<th>Style</th>
						<th>Color</th>
						<th>Price</th>
					</tr>
					<cfloop index="x" from="1" to="#arrayLen(rc.products)#">
						<cfmailparam contentid="product#x#" file="#expandPath('\')#\warehouse\uploadedfiles\images\#rc.products[x].getThumbnailFile()#" type="image/gif" disposition="inline">
						<tr>
								<td><img src="cid:product#x#" alt='#rc.products[x].getStyleName()# #rc.products[x].getColorDescription()#'></td>
								<td>#rc.products[x].getStyleName()#</td>
								<td>#rc.products[x].getColorDescription()#</td>						
								<td>#dollarFormat(rc.products[x].getSellingPrice())#</td>						
						</tr>				
					</cfloop>				
				</table>			
	            <!-- <p>For more information on how to use the online catalog please visit the site <a href="http://catalog.tadashishoji.com/warehouse/help/Help.htm">http://catalog.tadashishoji.com/warehouse/help/Help.htm</a></p> -->
                <p>If you are interested in finding out more information on the styles above or would like to place an order, Please feel free to contact the NY sales team.</p>                
		   <ul>
                <li style="list-style-type: none">Alan Geller - <a href="mailto:alang@tadashishoji.com">alang@tadashishoji.com</a></li>
                <li style="list-style-type: none">Dawn Cecero - <a href="mailto:dawn@tadashishoji.com">dawn@tadashishoji.com</a></li>
                <li style="list-style-type: none">Lauren Reiff - <a href="mailto:laurenr@tadashishoji.com">laurenr@tadashishoji.com</a></li>
                <li style="list-style-type: none">Marie Glogau - <a href="mailto:marieg@tadashishoji.com">marieg@tadashishoji.com</a></li>                
                <li style="list-style-type: none">Marie Panariello - <a href="mailto:marie@tadashishoji.com">marie@tadashishoji.com</a></li>                
            </ul>								
			</cfmail>
			
		<cfcatch>
		
			<cfmail from="ruben@tadashishoji.com" to="customerservice@tadashishoji.com" subject="wrong email address">
				wrong email address for account #rc.customerAccts.accountNumber# : #rc.customerAccts.accountName# with email #rc.customerAccts.email#  
			</cfmail>
		
		</cfcatch>	
		
		</cftry>
		
		
		</cfoutput>
					
		<cfset event.noRender()>
				 
	</cffunction>


<!---	<cffunction name="emailMarkdowns" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
        <cfoutput>
        
			<cfmail from="Tadashi Shoji <CustomerService@tadashishoji.com>"
	        		to="deborah@tadashishoji.com,remic@tadashishoji.com,pablo@tadashishoji.com,ruben@tadashishoji.com,rubenjohne@gmail.com" 
					subject="Tadashi Shoji Sale Items" type="text/html">
<!---				<p>Account Number :  #rc.customerAccts.accountNumber#</p>
				<p>Account Name : #rc.customerAccts.accountName#</p>
--->	            <p>As our valued customer, enjoy 40% off select styles while supplies last</p>
				<table border="1">
					<tr>					
	                	<th>Image</th>
						<th>Style</th>
						<th>Color</th>
						<th>Price</th>
                        <th>Discount</th>
	                    <th>Comments</th>
					</tr>
					<cfloop index="x" from="1" to="#arrayLen(rc.products)#">
						<cfmailparam contentid="product#x#" file="#expandPath('\')#\warehouse\uploadedfiles\images\#rc.products[x].getThumbnailFile()#" type="image/gif" disposition="inline">
						<tr>
								<td><img src="cid:product#x#" alt='#rc.products[x].getStyleName()# #rc.products[x].getColorDescription()#'></td>
								<td>#rc.products[x].getStyleName()#</td>
								<td>#rc.products[x].getColorDescription()#</td>						
								<td>#dollarFormat(rc.products[x].getSellingPrice())#</td>						
								<td><cfif rc.products[x].getDiscountID() NEQ 1>#(rc.products[x].getDiscountID() * 5)#%</cfif></td><!--- quick fix just took the ID of the discount and multiplied by 5--->						
	                            <td></td>
						</tr>				
					</cfloop>				
				</table>			
	            <p>For more information on how to use the online catalog please visit the site <a href="http://catalog.tadashishoji.com/warehouse/help/Help.htm">http://catalog.tadashishoji.com/warehouse/help/Help.htm</a></p>
			</cfmail>
			
		
		</cfoutput>
					
		<cfset event.noRender()>
				 
	</cffunction>
--->    
    
    
	<cffunction name="emailMarkdowns" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.customerAccts = getPlugin("ioc").getBean("UserGateway").getAllAsQuery()> 
		
		<cfoutput query="rc.customerAccts">
		
		<cftry>
		
			<cfmail from="Tadashi Shoji <CustomerService@tadashishoji.com>"
	        		to="#rc.customerAccts.email#" 
					subject="Tadashi Shoji Sale Items" type="text/html">
				<p>Account Number :  #rc.customerAccts.accountNumber#</p>
				<p>Account Name : #rc.customerAccts.accountName#</p>
	             <p>As our valued customer, enjoy 40% off select styles while supplies last</p>
				<table border="1">
					<tr>					
	                	<th>Image</th>
						<th>Style</th>
						<th>Color</th>
						<th>Price</th>
                        <th>Discount</th>
	                    <th>Comments</th>
					</tr>
					<cfloop index="x" from="1" to="#arrayLen(rc.products)#">
						<cfmailparam contentid="product#x#" file="#expandPath('\')#\warehouse\uploadedfiles\images\#rc.products[x].getThumbnailFile()#" type="image/gif" disposition="inline">
						<tr>
								<td><img src="cid:product#x#" alt='#rc.products[x].getStyleName()# #rc.products[x].getColorDescription()#'></td>
								<td>#rc.products[x].getStyleName()#</td>
								<td>#rc.products[x].getColorDescription()#</td>						
								<td>#dollarFormat(rc.products[x].getSellingPrice())#</td>						
								<td><cfif rc.products[x].getDiscountID() NEQ 1>#(rc.products[x].getDiscountID() * 5)#%</cfif></td><!--- quick fix just took the ID of the discount and multiplied by 5--->						
	                            <td></td>
						</tr>				
					</cfloop>				
				</table>			
	            <p>For more information on how to use the online catalog please visit the site <a href="http://catalog.tadashishoji.com/warehouse/help/Help.htm">http://catalog.tadashishoji.com/warehouse/help/Help.htm</a></p>
			</cfmail>
			
		<cfcatch>
		
			<cfmail from="ruben@tadashishoji.com" to="customerservice@tadashishoji.com" subject="wrong email address">
				wrong email address for account #rc.customerAccts.accountNumber# : #rc.customerAccts.accountName# with email #rc.customerAccts.email#  
			</cfmail>
		
		</cfcatch>	
		
		</cftry>
		
		
		</cfoutput>
					
		<cfset event.noRender()>
				 
	</cffunction>

<!---	<cffunction name="intro" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.customerAccts = getPlugin("ioc").getBean("UserGateway").getAllAsQuery()> 
        
        <cfoutput query="rc.customerAccts">
		<cfmail from="CustomerService@tadashishoji.com" to="#rc.customerAccts.email#" charset="us-ascii"
				subject="TADASHI SHOJI ONLINE CATALOG" type="text/html">
			<p><b>#rc.customerAccts.accountName#</b></p>                
            <p>2010 marks the new launch of TADASHI SHOJI ONLINE CATALOG!</p> 
            <p>We are thrilled and enthusiastic and excited to bring this new feature to our world wide customers. This catalog will allow you to view our entire collection online along with our immediate deliveries. We will also alert you on our best retailing styles.</p>
            <p>You can visit our catalog at <a href="http://catalog.tadashishoji.com/index.cfm">http://catalog.tadashishoji.com</a> your email login is <b>#rc.customerAccts.email#</b> and your password is <b>#rc.customerAccts.password#</b>.</p>
            <p>Thank you for your continued support and for being part of this exciting time at Tadashi Shoji.</p>
            <br>
            <p>SPANISH:</p>
            <p>2010 marca el lanzamiento del CATALOGO por INTERNET de TADASHI SHOJI!</p>
            <p>Estamos emocionados y entusiasmados para traerle esta caracteristica, a nuestros clientes leales mundial mente. Este catalogo permitira que usted vea nuestra coleccion entera en linea junto con nuestras entregas inmediatas. Tambien le alertaremos en nuestros mejores estilos que venden al por menor.</p>
          <p>Usted puede visitar nuestro catalogo en <a href="http://catalog.tadashishoji.com/index.cfm">http://catalog.tadashishoji.com</a> su conexion del email es <b>#rc.customerAccts.email#</b> y su contrasena es <b>#rc.customerAccts.password#</b>.</p>
          <p>Gracias por su ayuda continuada y por ser parte de este tiempo emocionante en el Tadashi Shoji.</p>
          <br>
          <p>Tadashi Shoji</p>
		</cfmail>
		</cfoutput>
		<cfset event.noRender()>
				 
	</cffunction>--->


	<cffunction name="emailAccountInfo" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset rc.user = getPlugin("ioc").getBean("UserGateway").getById(#rc.userId#)> 
        
		<cftry>
			<cfmail from="Tadashi Shoji <CustomerService@TadashiShoji.com>" to="#rc.user.getEmail()#" 
					mailerid="Microsoft Outlook, Build 10.0.3416"
					subject="TADASHI SHOJI ONLINE CATALOG" type="text/html">
					<cfmailparam name="Message-Id" value="<#createUUID()#@TadashiShoji.com>">	
					<cfmailparam name="Reply-To" value="CustomerService@TadashiShoji.com">	
					<cfmailparam name="MIME-Version" value="1.0">
					
					<!--- email content --->
					
					<p><b>#rc.user.getAccountName()#</b></p>                
		            <p>2010 marks the new launch of TADASHI SHOJI ONLINE CATALOG!</p> 
		            <p>We are thrilled and enthusiastic and excited to bring this new feature to our world wide customers. This catalog will allow you to view our entire collection online along with our immediate deliveries. We will also alert you on our best retailing styles.</p>
		            <p>You can visit our catalog at <a href="http://catalog.tadashishoji.com/index.cfm">http://catalog.tadashishoji.com</a> your email login is <b>#rc.user.getEmail()#</b> and your password is <b>#rc.user.getPassword()#</b>.</p>
		            <p>Thank you for your continued support and for being part of this exciting time at Tadashi Shoji.</p>
		            <br>
		            <p>SPANISH:</p>
		            <p>2010 marca el lanzamiento del CATALOGO por INTERNET de TADASHI SHOJI!</p>
		            <p>Estamos emocionados y entusiasmados para traerle esta caracteristica, a nuestros clientes leales mundial mente. Este catalogo permitira que usted vea nuestra coleccion entera en linea junto con nuestras entregas inmediatas. Tambien le alertaremos en nuestros mejores estilos que venden al por menor.</p>
		            <p>Usted puede visitar nuestro catalogo en <a href="http://catalog.tadashishoji.com/index.cfm">http://catalog.tadashishoji.com</a> su conexion del email es <b>#rc.user.getEmail()#</b> y su contrasena es <b>#rc.user.getPassword()#</b>.</p>
		            <p>Gracias por su ayuda continuada y por ser parte de este tiempo emocionante en el Tadashi Shoji.</p>
		            <br>
		            <p>Tadashi Shoji</p>
				  			  
			</cfmail>
		
		<cfcatch>
		
			<cfmail from="ruben@tadashishoji.com" to="customerservice@tadashishoji.com" subject="wrong email address">
				wrong email address for account #rc.user.getAccountNumber()# : #rc.user.getAccountName()# with email #rc.user.getEmail()#  
			</cfmail>
		
		</cfcatch>	
		
		
		</cftry>
		
		
		<cfset event.noRender()>	
		
	</cffunction>
	
<!---
	<cffunction name="testMail" access="public" returntype="void" output="false" hint="This will import all customers that have email from AS400 to the online catalog">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
	
		<cfset var rc = event.getCollection()>
		
		<cflock name="setmail-servername" timeout="10" type="EXCLUSIVE">
		
		   <cfscript>
			   sysObj = CreateObject("java", "java.lang.System");
			   // if there is no mail.host set already, this next variable simply won't be created. need to know that for later.    oldmailserver = sysObj.getProperty("mail.host");
			   sysObj.setProperty("mail.host", "customerservice.tadashishoji.com");
		   </cfscript>

			<cfmail from="Ruben <CustomerService@tadashishoji.com>" to="ruben@tadashishoji.com" charset="us-ascii"
					subject="TEST EMAIL" type="text/html">
								
	            <p>2010 marks the new launch of TADASHI SHOJI ONLINE CATALOG!</p> 
	            <p>We are thrilled and enthusiastic and excited to bring this new feature to our world wide customers. This catalog will allow you to view our entire collection online along with our immediate deliveries. We will also alert you on our best retailing styles.</p>
	            <p>Thank you for your continued support and for being part of this exciting time at Tadashi Shoji.</p>
	            <br>
	          <br>
	          <p>Tadashi Shoji</p>
			</cfmail>
		
			<cfscript>
			   // reverse the setting of the mail.host, so as not to affect others on this server    if (not isdefined("oldmailserver")) {
			      // if there was no previously set mail.host, remove the property
			   if (not isdefined("oldmailserver")) {			  
			      sysObj.getProperties().remove("mail.host");
			   }
			   else{
			      // set it back to what it was before
			      sysObj.setProperty("mail.host", oldmailserver);
			   }
		   </cfscript>
		   	   
		</cflock>

		<cfset event.noRender()>	
	
	</cffunction>

	--->
	
</cfcomponent>




















