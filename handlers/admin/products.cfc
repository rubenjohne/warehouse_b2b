
<cfcomponent extends="coldbox.system.eventhandler">

	<cffunction name="save" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var productGateway = getPlugin("ioc").getBean("ProductGateway")>
		<cfset var product = productGateway.getById(#rc.productID#)>		
		<!--- save product in database --->
		<cfset getPlugin("beanFactory").populateBean(product)>
		<cfset productGateway.save(product)>
		
		<cfset event.noRender()>							
				
	</cffunction>

	<cffunction name="saveMainThumbnail" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var productMainImageGateway = getPlugin("ioc").getBean("ProductMainImageGateway")>

		
		<!--- first check if the product image id exist to delete the old image --->
		<cfif rc.productImageID NEQ 0>
			<cfset productMainImage = productMainImageGateway.getById(#rc.productImageID#)>
			<cfif productMainImage.getThumbnailFile() NEQ ''>
				<cftry>
					<cffile action="delete" file="#ExpandPath('\')#warehouse\uploadedfiles\images\#productMainImage.getThumbnailFile()#"/>					
					<cfcatch type="any">
						<!--- do nothing if file was not deleted --->
					</cfcatch>
				</cftry>
			</cfif>
		<!--- if this is the first time we're uploading the image --->	
		</cfif>
		
		<cftry>
			<cffile action="upload" filefield="filedata" result="image" destination="#ExpandPath('\')#warehouse\uploadedfiles\images\" 
					nameconflict="makeunique"/>
			<cfif image.fileWasSaved>
				<cfif isImageFile("#image.serverdirectory#\#image.serverfile#")>
					<cfimage action="read" source="#image.serverdirectory#\#image.serverfile#" name="thumbnail">

					<cfset productMainImage = getModel('products.productMainImage')>
					<cfset getPlugin("beanFactory").populateBean(productMainImage)>					
					<cfset productMainImage.setProductID(rc.productID)>
					<cfset productMainImage.setThumbnailFile(image.serverFile)>
					<cfset productMainImage.setThumbnailFileName(image.serverFileName)>
					<cfset productMainImage.setThumbnailHeight(thumbnail.height)>
					<cfset productMainImage.setThumbnailWidth(thumbnail.width)>
					
					<cfset productMainImageGateway.save(productMainImage)>									
				</cfif>				
			</cfif>		

		
		<cfcatch type="any">
			<cfdocument format="PDF" overwrite="yes" filename="errordebug.pdf">
				<cfdump var="#cfcatch#"/>
			</cfdocument>				
		</cfcatch>	
		
		</cftry>
							
		
		<cfset event.noRender()>
									
	</cffunction>	
	
	<cffunction name="saveMainImage" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var productMainImageGateway = getPlugin("ioc").getBean("ProductMainImageGateway")>

		
		<!--- first check if the product image id exist to delete the old image --->
		<cfif rc.productImageID NEQ 0>
			<cfset productMainImage = productMainImageGateway.getById(#rc.productImageID#)>
			<cfif productMainImage.getFile() NEQ ''>
				<cftry>
					<cffile action="delete" file="#ExpandPath('\')#warehouse\uploadedfiles\images\#productMainImage.getFile()#"/>
					<cfcatch type="any">
						<cfdocument format="PDF" overwrite="yes" filename="errordebug.pdf">
							<cfdump var="#cfcatch#"/>
						</cfdocument>	
					</cfcatch>
				</cftry>
			</cfif>
		<!--- if this is the first time we're uploading the image --->	
		</cfif>
		
		<cftry>
			<cffile action="upload" filefield="filedata" result="image" destination="#ExpandPath('\')#warehouse\uploadedfiles\images\" 
					nameconflict="makeunique"/>
			<cfif image.fileWasSaved>
				<cfif isImageFile("#image.serverdirectory#\#image.serverfile#")>
					<cfimage action="read" source="#image.serverdirectory#\#image.serverfile#" name="regularImage">
							
					<cfset productMainImage = getModel('products.ProductMainImage')>
					<cfset getPlugin("beanFactory").populateBean(productMainImage)>
					<cfset productMainImage.setLocation(image.serverDirectory)>
					<cfset productMainImage.setUrl(image.serverDirectory)>
					<cfset productMainImage.setContentType(image.contentType)>
					<cfset productMainImage.setFile(image.serverFile)>
					<cfset productMainImage.setFileName(image.serverFileName)>
					<cfset productMainImage.setFileExtension(image.serverFileExt)>
					<cfset productMainImage.setFileSize(image.fileSize)>
					<cfset productMainImage.setHeight(regularImage.height)>
					<cfset productMainImage.setWidth(regularImage.width)>
					
					<cfset productMainImageGateway.save(productMainImage)>									
				</cfif>				
			</cfif>		

		
		<cfcatch type="any">
			<cfdocument format="PDF" overwrite="yes" filename="errordebug.pdf">
				<cfdump var="#cfcatch#"/>
			</cfdocument>				
		</cfcatch>	
		
		</cftry>
						
		
		<cfset event.noRender()>
									
	</cffunction>	
	
	<cffunction name="saveThumbnail" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var productImageGateway = getPlugin("ioc").getBean("ProductImageGateway")>

		
		<!--- first check if the product image id exist to delete the old image --->
		<cfif rc.productImageID NEQ 0>
			<cfset productImage = productImageGateway.getById(#rc.productImageID#)>
			<cfif productImage.getThumbnailFile() NEQ ''>
				<cftry>
					<cffile action="delete" file="#ExpandPath('\')#warehouse\uploadedfiles\images\#productImage.getThumbnailFile()#"/>					
					<cfcatch type="any">
						<!--- do nothing if file was not deleted --->
					</cfcatch>
				</cftry>
			</cfif>
		<!--- if this is the first time we're uploading the image --->	
		</cfif>
		
		<cftry>
			<cffile action="upload" filefield="filedata" result="image" destination="#ExpandPath('\')#warehouse\uploadedfiles\images\" 
					nameconflict="makeunique"/>
			<cfif image.fileWasSaved>
				<cfif isImageFile("#image.serverdirectory#\#image.serverfile#")>
					<cfimage action="read" source="#image.serverdirectory#\#image.serverfile#" name="thumbnail">
							
					<cfset productImage = getModel('products.ProductImage')>
					<cfset getPlugin("beanFactory").populateBean(productImage)>					
					<cfset productImage.setProductImageID(rc.productImageID)>
					<cfset productImage.setProductID(rc.productID)>
					<cfset productImage.setThumbnailFile(image.serverFile)>
					<cfset productImage.setThumbnailFileName(image.serverFileName)>
					<cfset productImage.setThumbnailHeight(thumbnail.height)>
					<cfset productImage.setThumbnailWidth(thumbnail.width)>
					
					<cfset productImageGateway.save(productImage)>									
				</cfif>				
			</cfif>		

		
		<cfcatch type="any">
			<cfdocument format="PDF" overwrite="yes" filename="errordebug.pdf">
				<cfdump var="#cfcatch#"/>
			</cfdocument>				
		</cfcatch>	
		
		</cftry>
							
		
		<cfset event.noRender()>
									
	</cffunction>	
	
	<cffunction name="saveImage" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var productImageGateway = getPlugin("ioc").getBean("ProductImageGateway")>

		
		<!--- first check if the product image id exist to delete the old image --->
		<cfif rc.productImageID NEQ 0>
			<cfset productImage = productImageGateway.getById(#rc.productImageID#)>
			<cfif productImage.getFile() NEQ ''>
				<cftry>
					<cffile action="delete" file="#ExpandPath('\')#warehouse\uploadedfiles\images\#productImage.getFile()#"/>
					<cfcatch type="any">
						<cfdocument format="PDF" overwrite="yes" filename="errordebug.pdf">
							<cfdump var="#cfcatch#"/>
						</cfdocument>	
					</cfcatch>
				</cftry>
			</cfif>
		<!--- if this is the first time we're uploading the image --->	
		</cfif>
		
		<cftry>
			<cffile action="upload" filefield="filedata" result="image" destination="#ExpandPath('\')#warehouse\uploadedfiles\images\" 
					nameconflict="makeunique"/>
			<cfif image.fileWasSaved>
				<cfif isImageFile("#image.serverdirectory#\#image.serverfile#")>
					<cfimage action="read" source="#image.serverdirectory#\#image.serverfile#" name="regularImage">
							
					<cfset productImage = getModel('products.ProductImage')>
					<cfset getPlugin("beanFactory").populateBean(productImage)>
					<cfset productImage.setLocation(image.serverDirectory)>
					<cfset productImage.setUrl(image.serverDirectory)>
					<cfset productImage.setContentType(image.contentType)>
					<cfset productImage.setFile(image.serverFile)>
					<cfset productImage.setFileName(image.serverFileName)>
					<cfset productImage.setFileExtension(image.serverFileExt)>
					<cfset productImage.setFileSize(image.fileSize)>
					<cfset productImage.setHeight(regularImage.height)>
					<cfset productImage.setWidth(regularImage.width)>
					
					<cfset productImageGateway.save(productImage)>									
				</cfif>				
			</cfif>		

		
		<cfcatch type="any">
			<cfdocument format="PDF" overwrite="yes" filename="errordebug.pdf">
				<cfdump var="#cfcatch#"/>
			</cfdocument>				
		</cfcatch>	
		
		</cftry>
						
		
		<cfset event.noRender()>
									
	</cffunction>	
	
	<cffunction name="getMainImage" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset var productMainImageGateway = getPlugin("ioc").getBean("ProductMainImageGateway")>

		<cfset rc.productMainImage = productMainImageGateway.getByProductID(rc.productID)>
	
		<cfset event.noRender()>
		
	</cffunction>
	
	
	<cffunction name="getImages" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfset var productImageGateway = getPlugin("ioc").getBean("ProductImageGateway")>
		<cfset rc.productImages = productImageGateway.getByProductID(rc.productID)>
	
		<cfset event.noRender()>
		
	</cffunction>
	
	
	<cffunction name="deleteImage" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		<cfset var productImageGateway = getPlugin("ioc").getBean("ProductImageGateway")>
		<cfset var productImage = productImageGateway.getById(rc.productImageID)>
		<!--- delete the video in the server --->
		<cftry>
			<cffile action="delete" file="#ExpandPath('\')#speed\uploadedfiles\images\#productImage.getFile()#"/>
			<cffile action="delete" file="#ExpandPath('\')#speed\uploadedfiles\images\#productImage.getThumbnailFile()#"/>
			<cfcatch type="any">
				<!--- do nothing if file was not deleted --->
			</cfcatch>
		</cftry>	
		<cfset rc.productID = productImage.getProductID()>
		
		<cfset productImageGateway.deleteById(rc.productImageID)>
		
	</cffunction>
	
		
</cfcomponent>