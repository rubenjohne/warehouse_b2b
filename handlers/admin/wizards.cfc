<cfcomponent displayname="this is the wizards controller" extends="coldbox.system.eventhandler">

	
	<cffunction name="importInventory" access="public" returntype="void" output="false" hint="This will import the inventory from AS400">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset var divisionID = 0>
		<cfset var classID = 0>
		<cfset var sizeID = 0>
		<cfset var styleID = 0>
		<cfset var colorID = 0>		
		<cfset var invQty = 10>
		
		<!--- get available inventory in as400 from the stock room --->
		<cfquery name="asProductInventory" datasource="as400">
			SELECT PRCD8O, CRCD8O, SUM(TLOH8O) AS TLOH8O
			FROM VPSFILES.FGINSM0 AS FGINSM0 
			WHERE (CONO8O = 1) AND (LCCD8O IN ('STOCK ROOM','3'))  AND (STCD8O = '1') 
			GROUP BY PRCD8O, CRCD8O
			HAVING SUM(TLOH8O) >= #invQty#
		</cfquery>
		
		<cfset rc.asProductInventory = asProductInventory/>
		
		<!--- check if the product information already exists in w db --->
		<cfloop query="asProductInventory">
		
			<cfquery name="tsProduct" datasource="warehouse">
				SELECT ts_products.productID
				FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
				WHERE (ts_styles.styleName = '#asProductInventory.PRCD8O#') AND (ts_colors.colorCode= '#asProductInventory.CRCD8O#') 
			</cfquery>
		
			<!--- if not create it --->
			<cfif tsProduct.recordcount EQ 0>				
				<!--- check if the style already exist in w db --->
				<cfquery name="tsStyles" datasource="warehouse">
					SELECT styleID
					FROM ts_styles 
					WHERE (styleName = '#asProductInventory.PRCD8O#')				
				</cfquery>
			
				<cfif tsStyles.RECORDCOUNT EQ 0>
				<!--- if not get the style info in as400 --->
					<cfquery name="asStyles" datasource="AS400">
						SELECT PRCD3K, PRDS3K, SHDS3K, EXDS3K, CLCD3K, DVNO3K, SZCD3K, SP013K 
						FROM VPSFILES.PRHDMS0 AS PRHDMS0 
						WHERE (PRCD3K = '#asProductInventory.PRCD8O#') AND (CONO3K = 1)				
					</cfquery>
					
					<!--- check if the support information to create the style is already in w db if not create it --->
					<!--- check if division is in the ts database --->
					<cfquery name="tsDivision" datasource="warehouse">
						SELECT divisionID
						FROM ts_divisions
						WHERE divisionNumber = #asStyles.DVNO3K#
					</cfquery>
					
					<!--- if division is not in the database create it --->
					<cfif tsDivision.recordcount EQ 0>
						<cfquery name="asDivisions" datasource="as400">
							SELECT DVNO3C, DVNM3C FROM VPSFILES.DIVNMS0 AS DIVNMS0 
							WHERE (CONO3C = 1) AND (DVNO3C = #asStyles.DVNO3K#) 
						</cfquery>
		
						<cfset division = getModel('products.division')>
						<cfset division.setDivisionNumber(#asDivisions.DVNO3C#)>
						<cfset division.setDivisionName(#asDivisions.DVNM3C#)>
						
						<!--- save division information in the database --->
						<cfset divisionID = getPlugin("ioc").getBean("DivisionGateway").save(division).getDivisionID()>
					<cfelse>
						<cfset divisionID = #tsDivision.divisionID#>
					</cfif>
					
		
		
					<!--- check if class is in the ts database --->
					<cfquery name="tsClass" datasource="warehouse">
						SELECT classID 
						FROM ts_class 
						WHERE classCode = '#asStyles.CLCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsClass.recordcount EQ 0>
						<cfquery name="asClass" datasource="as400">
							SELECT CLCD3D, CLDS3D 
							FROM VPSFILES.PRCLMS0 AS PRCLMS0 
							WHERE (CONO3D = 1) AND (CLCD3D = '#asStyles.CLCD3K#')
						</cfquery>
		
						<cfset class = getModel('products.class')>
						<cfset class.setClassCode(#asClass.CLCD3D#)>
						<cfset class.setClassDescription(#asClass.CLDS3D#)>
						
						<!--- save division information in the database --->
						<cfset classID = getPlugin("ioc").getBean("ClassGateway").save(class).getClassID()>
					<cfelse>
						<cfset classID = #tsClass.classID#>
					</cfif>
					
		
		
		
		
		
					<!--- check if size is in the ts database --->
					<cfquery name="tsSizes" datasource="warehouse">
						SELECT sizeID
						FROM ts_sizes
						WHERE sizeScaleCode = '#asStyles.SZCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsSizes.recordcount EQ 0>
						<cfquery name="asSizes" datasource="as400">
							SELECT SZCD3G, SZDS3G, SZ013G, SZ023G, SZ033G, SZ043G, SZ053G, SZ063G, SZ073G, 
							SZ083G, SZ093G, SZ103G, SZ113G, SZ123G 
							FROM VPSFILES.SZSCMS0 AS SZSCMS0 
							WHERE (CONO3G = 1) AND 	(SZCD3G = '#asStyles.SZCD3K#')			
						</cfquery>
		
						<cfset size = getModel('products.size')>
						<cfset size.setSizeScaleCode(#asSizes.SZCD3G#)>
						<cfset size.setSizeDescription(#asSizes.SZDS3G#)>
						<cfset size.setSizeCode1(#asSizes.SZ013G#)>
						<cfset size.setSizeCode2(#asSizes.SZ023G#)>
						<cfset size.setSizeCode3(#asSizes.SZ033G#)>
						<cfset size.setSizeCode4(#asSizes.SZ043G#)>
						<cfset size.setSizeCode5(#asSizes.SZ053G#)>
						<cfset size.setSizeCode6(#asSizes.SZ063G#)>
						<cfset size.setSizeCode7(#asSizes.SZ073G#)>
						<cfset size.setSizeCode8(#asSizes.SZ083G#)>
						<cfset size.setSizeCode9(#asSizes.SZ093G#)>
						<cfset size.setSizeCode10(#asSizes.SZ103G#)>
						<cfset size.setSizeCode11(#asSizes.SZ113G#)>
						<cfset size.setSizeCode12(#asSizes.SZ123G#)>
						
						<!--- save division information in the database --->
						<cfset sizeID = getPlugin("ioc").getBean("SizeGateway").save(size).getSizeID()>
					<cfelse>
						<cfset sizeID = #tsSizes.sizeID#>
					</cfif>
		
					<!--- save the style in the database --->
					<cfset style = getModel('products.style')>
					
					<cfset style.setStyleName(#asStyles.PRCD3K#)>	
					<cfset style.setDescription(#asStyles.PRDS3K#)>	
					<cfset style.setShortDescription(#asStyles.SHDS3K#)>	
					<cfset style.setExtendedDescription(#asStyles.EXDS3K#)>	
					<cfset style.setClassID(#classID#)>	
					<cfset style.setDivisionID(#divisionID#)>	
					<cfset style.setSizeID(#sizeID#)>	
					<cfset style.setOnWeb(1)>	
					<cfset style.setSellingPrice(#asStyles.SP013K#)>
				
					<!--- save style information from as400 to w db --->
					<cfset styleID = getPlugin("ioc").getBean("StyleGateway").save(style).getStyleID()>
				<cfelse>
					<cfset styleID = #tsStyles.styleID#>						
				</cfif>	
				
				<!--- check if the color information  already exists  in w db --->
				<cfquery name="tsColor" datasource="warehouse">
					SELECT colorID 
					FROM ts_colors 
					WHERE (colorCode = '#asProductInventory.CRCD8O#')								
				</cfquery>				
				<!--- if not get the color info in as400 then save it in w db --->
				<cfif tsColor.recordcount EQ 0>

					<!--- get information from the as400 database --->
					<cfquery name="asColor" datasource="as400">
						SELECT CRCD3J, CDES3J 
						FROM VPSFILES.COLRMS0 AS COLRMS0 
						WHERE (CRCD3J = '#asProductInventory.CRCD8O#')								
					</cfquery>
					
					<!--- then save the color on the ts database --->
					<cfset color = getModel('products.color')>
					
					<cfset color.setColorCode(#asColor.CRCD3J#)>
					<cfset color.setColorDescription(#asColor.CDES3J#)>
					
					<cfset colorID = getPlugin("ioc").getBean("ColorGateway").save(color).getColorID()>
				<cfelse>
					<cfset colorID = #tsColor.colorID#>	
				</cfif>							
				
				<!--- create the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = getModel("Products.Product")>
				
				<cfset product.setStyleID(#styleID#)>
				<cfset product.setColorID(#colorID#)>
				<cfset product.setDiscountID(1)>
				<cfset product.setOnWeb(0)>
				<cfset product.setOnStock(1)>
				<cfset product.setForReview(1)>
				<cfset product.setComments("Product Created")>				
				<cfset product.setStock(#asProductInventory.TLOH8O#)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setCreatedBy("AS400")>
				<cfset product.setCreatedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				
				<!--- to check what product is being created --->
				<cfset rc.product = product>	
				<cfset productGateway.save(product)>
				
				
			<!--- if product does exist update the inventory to reflect --->	
			<cfelse>
			
				<!--- update the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProduct.productID#)>
				
				<cfset product.setDiscountID(1)>
				<cfset product.setOnStock(1)>
				<cfset product.setForReview(1)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setComments("HAS STOCK NOW")>				
				<cfset product.setStock(#asProductInventory.TLOH8O#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
					
				<cfset productGateway.save(product)>
						
			</cfif>
			
		</cfloop>
					
				
				
		<cfset event.noRender()>							
				
	</cffunction>





	<cffunction name="updateInventory" access="public" returntype="void" output="false" hint="This will update the inventory in the online catalog to check if the product is out of stock">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		<cfset var invQty = 10>
		
		<!--- check if the active products info from w db has inventory info  from as400 if not remove it from web and check for review --->		
		<cfquery name="tsProductInventory" datasource="warehouse">
			SELECT ts_products.productID, ts_styles.styleName, ts_colors.colorCode 
			FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
			WHERE (ts_products.archive=0) AND (ts_products.onStock=1) 
		</cfquery>
		
		<cfset rc.tsProductInventory = tsProductInventory>
		
		<cfloop query="tsProductInventory">
		
			
			<cfquery name="asInventoryInfo" datasource="as400">
				SELECT SUM(TLOH8O) AS OnHand 
				FROM VPSFILES.FGINSM0 AS FGINSM0 
				WHERE (CONO8O = 1) AND (LCCD8O IN ('STOCK ROOM', '3'))			
				AND (PRCD8O = '#tsProductInventory.styleName#') AND  (CRCD8O = '#tsProductInventory.colorCode#') 			
			</cfquery>
			
			<cfif asInventoryInfo.OnHand LT invQty>			
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProductInventory.productID#)>
				
				<cfset product.setDiscountID(1)>
				<cfset product.setOnWeb(0)>
				<cfset product.setComments("Out of Stock")>
				<cfset product.setOnStock(0)>
				<cfset product.setStock(0)>
				<cfset product.setForReview(1)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				
				<cfset productGateway.save(product)>
			</cfif>
						
		</cfloop>

		<cfset event.noRender()>							

	</cffunction>
	
	
	
	
	<cffunction name="importOvercuts" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset var divisionID = 0>
		<cfset var classID = 0>
		<cfset var sizeID = 0>
		<cfset var styleID = 0>
		<cfset var colorID = 0>		
		<cfset var deliveryMonth = 0>		
		<cfset var deliveryYear = 0>		
		<cfset var invQty = 10>
		
		<!--- get available inventory in as400 --->
		<cfquery name="asProductInventory" datasource="as400">
			SELECT PRCD5V, CRCD5V, TLAV5V
			FROM VPSFILES.PRDAVL0 AS PRDAVL0
			WHERE (CONO5V = 1) AND 	(TLAV5V >= #invQty#)
		</cfquery>
		
		<cfset rc.asProductInventory = asProductInventory/>
		
		<!--- check if the product information already exists in w db --->
		<cfloop query="asProductInventory">
		
			<!--- get cut ticket information in as400 --->
			<cfquery name="asProductCut" datasource="as400">
				SELECT PRCD8Q, CRCD8Q,  MAX(DUDT8Q)  AS CUTDATE 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (CONO8Q = 1) AND 
				(PRCD8Q = '#asProductInventory.PRCD5V#') AND (CRCD8Q = '#asProductInventory.CRCD5V#') 
				GROUP BY PRCD8Q, CRCD8Q
			</cfquery>	
		
			<cfset deliveryMonth = Mid(ToString(#asProductCut.CUTDATE#),5,2)>	
			<cfset deliveryYear = Mid(ToString(#asProductCut.CUTDATE#),1,4)>	
									
			<cfquery name="tsProduct" datasource="warehouse">
				SELECT ts_products.productID
				FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
				WHERE (((ts_styles.styleName) = '#asProductInventory.PRCD5V#')) AND ((ts_colors.colorCode)= '#asProductInventory.CRCD5V#') 
			</cfquery>
		
			<!--- if not create it --->
			<cfif tsProduct.recordcount EQ 0>				
				<!--- check if the style already exist in w db --->
				<cfquery name="tsStyles" datasource="warehouse">
					SELECT styleID
					FROM ts_styles 
					WHERE (styleName = '#asProductInventory.PRCD5V#')				
				</cfquery>
			
				<cfif tsStyles.RECORDCOUNT EQ 0>
				<!--- if not get the style info in as400 --->
					<cfquery name="asStyles" datasource="AS400">
						SELECT PRCD3K, PRDS3K, SHDS3K, EXDS3K, CLCD3K, DVNO3K, SZCD3K, SP013K 
						FROM VPSFILES.PRHDMS0 AS PRHDMS0 
						WHERE (PRCD3K = '#asProductInventory.PRCD5V#') AND (CONO3K = 1)				
					</cfquery>
					
					<!--- check if the support information to create the style is already in w db if not create it --->
					<!--- check if division is in the ts database --->
					<cfquery name="tsDivision" datasource="warehouse">
						SELECT divisionID
						FROM ts_divisions
						WHERE divisionNumber = #asStyles.DVNO3K#
					</cfquery>
					
					<!--- if division is not in the database create it --->
					<cfif tsDivision.recordcount EQ 0>
						<cfquery name="asDivisions" datasource="as400">
							SELECT DVNO3C, DVNM3C FROM VPSFILES.DIVNMS0 AS DIVNMS0 
							WHERE (CONO3C = 1) AND (DVNO3C = #asStyles.DVNO3K#) 
						</cfquery>
		
						<cfset division = getModel('products.division')>
						<cfset division.setDivisionNumber(#asDivisions.DVNO3C#)>
						<cfset division.setDivisionName(#asDivisions.DVNM3C#)>
						
						<!--- save division information in the database --->
						<cfset divisionID = getPlugin("ioc").getBean("DivisionGateway").save(division).getDivisionID()>
					<cfelse>
						<cfset divisionID = #tsDivision.divisionID#>
					</cfif>
					
		
		
					<!--- check if class is in the ts database --->
					<cfquery name="tsClass" datasource="warehouse">
						SELECT classID 
						FROM ts_class 
						WHERE classCode = '#asStyles.CLCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsClass.recordcount EQ 0>
						<cfquery name="asClass" datasource="as400">
							SELECT CLCD3D, CLDS3D 
							FROM VPSFILES.PRCLMS0 AS PRCLMS0 
							WHERE (CONO3D = 1) AND (CLCD3D = '#asStyles.CLCD3K#')
						</cfquery>
		
						<cfset class = getModel('products.class')>
						<cfset class.setClassCode(#asClass.CLCD3D#)>
						<cfset class.setClassDescription(#asClass.CLDS3D#)>
						
						<!--- save division information in the database --->
						<cfset classID = getPlugin("ioc").getBean("ClassGateway").save(class).getClassID()>
					<cfelse>
						<cfset classID = #tsClass.classID#>
					</cfif>
					
		
					<!--- check if size is in the ts database --->
					<cfquery name="tsSizes" datasource="warehouse">
						SELECT sizeID
						FROM ts_sizes
						WHERE sizeScaleCode = '#asStyles.SZCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsSizes.recordcount EQ 0>
						<cfquery name="asSizes" datasource="as400">
							SELECT SZCD3G, SZDS3G, SZ013G, SZ023G, SZ033G, SZ043G, SZ053G, SZ063G, SZ073G, 
							SZ083G, SZ093G, SZ103G, SZ113G, SZ123G 
							FROM VPSFILES.SZSCMS0 AS SZSCMS0 
							WHERE (CONO3G = 1) AND 	(SZCD3G = '#asStyles.SZCD3K#')			
						</cfquery>
		
						<cfset size = getModel('products.size')>	
						<cfset size.setSizeScaleCode(#asSizes.SZCD3G#)>
						<cfset size.setSizeDescription(#asSizes.SZDS3G#)>
						<cfset size.setSizeCode1(#asSizes.SZ013G#)>
						<cfset size.setSizeCode2(#asSizes.SZ023G#)>
						<cfset size.setSizeCode3(#asSizes.SZ033G#)>
						<cfset size.setSizeCode4(#asSizes.SZ043G#)>
						<cfset size.setSizeCode5(#asSizes.SZ053G#)>
						<cfset size.setSizeCode6(#asSizes.SZ063G#)>
						<cfset size.setSizeCode7(#asSizes.SZ073G#)>
						<cfset size.setSizeCode8(#asSizes.SZ083G#)>
						<cfset size.setSizeCode9(#asSizes.SZ093G#)>
						<cfset size.setSizeCode10(#asSizes.SZ103G#)>
						<cfset size.setSizeCode11(#asSizes.SZ113G#)>
						<cfset size.setSizeCode12(#asSizes.SZ123G#)>
						
						<!--- save division information in the database --->
						<cfset sizeID = getPlugin("ioc").getBean("SizeGateway").save(size).getSizeID()>
					<cfelse>
						<cfset sizeID = #tsSizes.sizeID#>
					</cfif>
		
					<!--- save the style in the database --->
					<cfset style = getModel('products.style')>
					
					<cfset style.setStyleName(#asStyles.PRCD3K#)>	
					<cfset style.setDescription(#asStyles.PRDS3K#)>	
					<cfset style.setShortDescription(#asStyles.SHDS3K#)>	
					<cfset style.setExtendedDescription(#asStyles.EXDS3K#)>	
					<cfset style.setClassID(#classID#)>	
					<cfset style.setDivisionID(#divisionID#)>	
					<cfset style.setSizeID(#sizeID#)>	
					<cfset style.setOnWeb(1)>	
					<cfset style.setSellingPrice(#asStyles.SP013K#)>
				
					<!--- save style information from as400 to w db --->
					<cfset styleID = getPlugin("ioc").getBean("StyleGateway").save(style).getStyleID()>
				<cfelse>
					<cfset styleID = #tsStyles.styleID#>						
				</cfif>	
				
				<!--- check if the color information  already exists  in w db --->
				<cfquery name="tsColor" datasource="warehouse">
					SELECT colorID 
					FROM ts_colors 
					WHERE (colorCode = '#asProductInventory.CRCD5V#')								
				</cfquery>				
				<!--- if not get the color info in as400 then save it in w db --->
				<cfif tsColor.recordcount EQ 0>

					<!--- get information from the as400 database --->
					<cfquery name="asColor" datasource="as400">
						SELECT CRCD3J, CDES3J 
						FROM VPSFILES.COLRMS0 AS COLRMS0 
						WHERE (CRCD3J = '#asProductInventory.CRCD5V#')								
					</cfquery>
					
					<!--- then save the color on the ts database --->
					<cfset color = getModel('products.color')>
					
					<cfset color.setColorCode(#asColor.CRCD3J#)>
					<cfset color.setColorDescription(#asColor.CDES3J#)>
					
					<cfset colorID = getPlugin("ioc").getBean("ColorGateway").save(color).getColorID()>
				<cfelse>
					<cfset colorID = #tsColor.colorID#>	
				</cfif>							
				
				<!--- create the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = getModel("Products.Product")>
				
				<cfset product.setStyleID(#styleID#)>
				<cfset product.setColorID(#colorID#)>
				<cfset product.setDiscountID(1)>
				<cfset product.setOnWeb(0)>
				<cfset product.setOnStock(0)>
				<cfset product.setForReview(1)>
				<cfset product.setComments("Product Created")>				
				<cfset product.setWip(#asProductInventory.TLAV5V#)>
				<cfset product.setDeliveryMonth(#deliveryMonth#)>
				<cfset product.setDeliveryYear(#deliveryYear#)>
				<cfset product.setCreatedBy("AS400")>
				<cfset product.setCreatedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
					
				<cfset productGateway.save(product)>
			<!--- if product does exist update the inventory to reflect --->	
			<cfelse>
			
				<!--- update the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProduct.productID#)>
								
				<cfif product.getOnStock() NEQ 1>
					<cfset product.setDiscountID(1)>
					<cfset product.setForReview(1)>
					<cfset product.setComments("HAS OVERCUTS")>				
					<cfset product.setWip(#asProductInventory.TLAV5V#)>
					<cfset product.setDeliveryMonth(#deliveryMonth#)>
					<cfset product.setDeliveryYear(#deliveryYear#)>
					<cfset product.setLastMaintainedBy("AS400")>
					<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
									
					<cfset productGateway.save(product)>					
				</cfif>			
			</cfif>
			
		</cfloop>
					
				
				
		<cfset event.noRender()>							
				
	</cffunction>



	
	
	<cffunction name="updateOvercuts" access="public" returntype="void" output="false" hint="This will update the products that are in production but less than the required availability to out of stock">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var tsProduct = ""/>
		<cfset var invQty = 10>

		<!--- query all the products in the web that are in production  --->
		<cfquery name="tsProduct" datasource="warehouse">
			SELECT ts_products.productID, ts_styles.styleName, ts_colors.colorCode, ts_products.wip 
			FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
			WHERE (ts_products.deliveryMonth <> 0) AND (ts_products.onStock = 0)
		</cfquery>
		
		<cfset rc.tsProduct = tsProduct/>
		
		<cfloop query="tsProduct">

			<!--- get available inventory in as400 for production styles in the warehouse database --->
			<cfquery name="asProductInventory" datasource="as400">
				SELECT PRCD5V, CRCD5V, TLAV5V, (TLWP5V + TLPO5V) AS WIP
				FROM VPSFILES.PRDAVL0 AS PRDAVL0
				WHERE (CONO5V = 1) AND (PRCD5V = '#tsProduct.styleName#')	AND (CRCD5V = '#tsProduct.colorCode#')
			</cfquery>

			<!--- update the product if only if there is record count and there are cuts and if the available to sell is less than required inventory qty --->
			<cfif asProductInventory.recordcount GT 0 AND (asProductInventory.WIP EQ 0 OR asProductInventory.TLAV5V LT invQty)>			
				<!--- update the product in the w db if there is less than the required availability --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProduct.productID#)>
				
				<cfset product.setDiscountID(1)>
				<cfset product.setForReview(1)>
				<cfset product.setComments("Out of Stock")>				
				<cfset product.setOnWeb(0)>
				<cfset product.setWip(0)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
								
				<cfset productGateway.save(product)>													
			</cfif>		
			
		</cfloop>

		<cfset event.noRender()>							
	
	</cffunction>
	
	<cffunction name="importMarkdowns" access="public" returntype="void" output="false" hint="This will import the inventory from AS400">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset var divisionID = 0>
		<cfset var classID = 0>
		<cfset var sizeID = 0>
		<cfset var styleID = 0>
		<cfset var colorID = 0>		
		<cfset var invQty = 10>
		
		<!--- get available inventory in as400 from the stock room --->
		<cfquery name="asProductInventory" datasource="as400">
			SELECT PRCD8O, CRCD8O, SUM(TLOH8O) AS TLOH8O
			FROM VPSFILES.FGINSM0 AS FGINSM0 
			WHERE (CONO8O = 1) AND (LCCD8O IN ('STOCK ROOM','3'))  AND (STCD8O = '1') 
			GROUP BY PRCD8O, CRCD8O
			HAVING SUM(TLOH8O) < #invQty#
		</cfquery>
		
		<cfset rc.asProductInventory = asProductInventory/>
		
		<!--- check if the product information already exists in w db --->
		<cfloop query="asProductInventory">
		
			<cfquery name="tsProduct" datasource="warehouse">
				SELECT ts_products.productID
				FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
				WHERE (ts_styles.styleName = '#asProductInventory.PRCD8O#') AND (ts_colors.colorCode= '#asProductInventory.CRCD8O#') 
			</cfquery>
		
			<!--- if not create it --->
			<cfif tsProduct.recordcount EQ 0>				
				<!--- check if the style already exist in w db --->
				<cfquery name="tsStyles" datasource="warehouse">
					SELECT styleID
					FROM ts_styles 
					WHERE (styleName = '#asProductInventory.PRCD8O#')				
				</cfquery>
			
				<cfif tsStyles.RECORDCOUNT EQ 0>
				<!--- if not get the style info in as400 --->
					<cfquery name="asStyles" datasource="AS400">
						SELECT PRCD3K, PRDS3K, SHDS3K, EXDS3K, CLCD3K, DVNO3K, SZCD3K, SP013K 
						FROM VPSFILES.PRHDMS0 AS PRHDMS0 
						WHERE (PRCD3K = '#asProductInventory.PRCD8O#') AND (CONO3K = 1)				
					</cfquery>
					
					<!--- check if the support information to create the style is already in w db if not create it --->
					<!--- check if division is in the ts database --->
					<cfquery name="tsDivision" datasource="warehouse">
						SELECT divisionID
						FROM ts_divisions
						WHERE divisionNumber = #asStyles.DVNO3K#
					</cfquery>
					
					<!--- if division is not in the database create it --->
					<cfif tsDivision.recordcount EQ 0>
						<cfquery name="asDivisions" datasource="as400">
							SELECT DVNO3C, DVNM3C FROM VPSFILES.DIVNMS0 AS DIVNMS0 
							WHERE (CONO3C = 1) AND (DVNO3C = #asStyles.DVNO3K#) 
						</cfquery>
		
						<cfset division = getModel('products.division')>
						<cfset division.setDivisionNumber(#asDivisions.DVNO3C#)>
						<cfset division.setDivisionName(#asDivisions.DVNM3C#)>
						
						<!--- save division information in the database --->
						<cfset divisionID = getPlugin("ioc").getBean("DivisionGateway").save(division).getDivisionID()>
					<cfelse>
						<cfset divisionID = #tsDivision.divisionID#>
					</cfif>
					
		
		
					<!--- check if class is in the ts database --->
					<cfquery name="tsClass" datasource="warehouse">
						SELECT classID 
						FROM ts_class 
						WHERE classCode = '#asStyles.CLCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsClass.recordcount EQ 0>
						<cfquery name="asClass" datasource="as400">
							SELECT CLCD3D, CLDS3D 
							FROM VPSFILES.PRCLMS0 AS PRCLMS0 
							WHERE (CONO3D = 1) AND (CLCD3D = '#asStyles.CLCD3K#')
						</cfquery>
		
						<cfset class = getModel('products.class')>
						<cfset class.setClassCode(#asClass.CLCD3D#)>
						<cfset class.setClassDescription(#asClass.CLDS3D#)>
						
						<!--- save division information in the database --->
						<cfset classID = getPlugin("ioc").getBean("ClassGateway").save(class).getClassID()>
					<cfelse>
						<cfset classID = #tsClass.classID#>
					</cfif>
					
		
		
		
		
		
					<!--- check if size is in the ts database --->
					<cfquery name="tsSizes" datasource="warehouse">
						SELECT sizeID
						FROM ts_sizes
						WHERE sizeScaleCode = '#asStyles.SZCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsSizes.recordcount EQ 0>
						<cfquery name="asSizes" datasource="as400">
							SELECT SZCD3G, SZDS3G, SZ013G, SZ023G, SZ033G, SZ043G, SZ053G, SZ063G, SZ073G, 
							SZ083G, SZ093G, SZ103G, SZ113G, SZ123G 
							FROM VPSFILES.SZSCMS0 AS SZSCMS0 
							WHERE (CONO3G = 1) AND 	(SZCD3G = '#asStyles.SZCD3K#')			
						</cfquery>
		
						<cfset size = getModel('products.size')>
						<cfset size.setSizeScaleCode(#asSizes.SZCD3G#)>
						<cfset size.setSizeDescription(#asSizes.SZDS3G#)>
						<cfset size.setSizeCode1(#asSizes.SZ013G#)>
						<cfset size.setSizeCode2(#asSizes.SZ023G#)>
						<cfset size.setSizeCode3(#asSizes.SZ033G#)>
						<cfset size.setSizeCode4(#asSizes.SZ043G#)>
						<cfset size.setSizeCode5(#asSizes.SZ053G#)>
						<cfset size.setSizeCode6(#asSizes.SZ063G#)>
						<cfset size.setSizeCode7(#asSizes.SZ073G#)>
						<cfset size.setSizeCode8(#asSizes.SZ083G#)>
						<cfset size.setSizeCode9(#asSizes.SZ093G#)>
						<cfset size.setSizeCode10(#asSizes.SZ103G#)>
						<cfset size.setSizeCode11(#asSizes.SZ113G#)>
						<cfset size.setSizeCode12(#asSizes.SZ123G#)>
						
						<!--- save division information in the database --->
						<cfset sizeID = getPlugin("ioc").getBean("SizeGateway").save(size).getSizeID()>
					<cfelse>
						<cfset sizeID = #tsSizes.sizeID#>
					</cfif>
		
					<!--- save the style in the database --->
					<cfset style = getModel('products.style')>
					
					<cfset style.setStyleName(#asStyles.PRCD3K#)>	
					<cfset style.setDescription(#asStyles.PRDS3K#)>	
					<cfset style.setShortDescription(#asStyles.SHDS3K#)>	
					<cfset style.setExtendedDescription(#asStyles.EXDS3K#)>	
					<cfset style.setClassID(#classID#)>	
					<cfset style.setDivisionID(#divisionID#)>	
					<cfset style.setSizeID(#sizeID#)>	
					<cfset style.setOnWeb(1)>	
					<cfset style.setSellingPrice(#asStyles.SP013K#)>
				
					<!--- save style information from as400 to w db --->
					<cfset styleID = getPlugin("ioc").getBean("StyleGateway").save(style).getStyleID()>
				<cfelse>
					<cfset styleID = #tsStyles.styleID#>						
				</cfif>	
				
				<!--- check if the color information  already exists  in w db --->
				<cfquery name="tsColor" datasource="warehouse">
					SELECT colorID 
					FROM ts_colors 
					WHERE (colorCode = '#asProductInventory.CRCD8O#')								
				</cfquery>				
				<!--- if not get the color info in as400 then save it in w db --->
				<cfif tsColor.recordcount EQ 0>

					<!--- get information from the as400 database --->
					<cfquery name="asColor" datasource="as400">
						SELECT CRCD3J, CDES3J 
						FROM VPSFILES.COLRMS0 AS COLRMS0 
						WHERE (CRCD3J = '#asProductInventory.CRCD8O#')								
					</cfquery>
					
					<!--- then save the color on the ts database --->
					<cfset color = getModel('products.color')>
					
					<cfset color.setColorCode(#asColor.CRCD3J#)>
					<cfset color.setColorDescription(#asColor.CDES3J#)>
					
					<cfset colorID = getPlugin("ioc").getBean("ColorGateway").save(color).getColorID()>
				<cfelse>
					<cfset colorID = #tsColor.colorID#>	
				</cfif>							
				
				<!--- create the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = getModel("Products.Product")>
				
				<cfset product.setStyleID(#styleID#)>
				<cfset product.setColorID(#colorID#)>
				<cfset product.setDiscountID(1)>
				<cfset product.setOnWeb(0)>
				<cfset product.setOnStock(1)>
				<cfset product.setForReview(1)>
				<cfset product.setComments("Product Created")>				
				<cfset product.setStock(#asProductInventory.TLOH8O#)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setCreatedBy("AS400")>
				<cfset product.setCreatedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				
				<!--- to check what product is being created --->
				<cfset rc.product = product>	
				<cfset productGateway.save(product)>
				
				
			<!--- if product does exist update the inventory to reflect --->	
			<cfelse>
			
				<!--- update the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProduct.productID#)>
				
				<cfset product.setDiscountID(1)>
				<cfset product.setOnStock(1)>
				<cfset product.setForReview(1)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setComments("HAS STOCK NOW")>				
				<cfset product.setStock(#asProductInventory.TLOH8O#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
					
				<cfset productGateway.save(product)>
						
			</cfif>
			
		</cfloop>
					
				
				
		<cfset event.noRender()>							
				
	</cffunction>
    
    
	<cffunction name="importCustomers" access="public" returntype="void" output="false" hint="This will import all customers that have email from AS400 to the online catalog">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		<cfset var userGateway = getPlugin("ioc").getBean("UserGateway")>

		<!--- get all the active customers since 1/1/2009 that have email information in as400  --->
		<cfquery datasource="as400" name="qCustAccts">
			SELECT DISTINCT CUSTMS0.CSNO2S, CUSTMS0.FLNM2S, CUSTMS0.EMAL2S 
			FROM VPSFILES.CUSTMS0 AS CUSTMS0, VPSFILES.ORDHDR0 AS ORDHDR0 
			WHERE (CUSTMS0.CONO2S = ORDHDR0.CONO2Y) AND (CUSTMS0.CSNO2S = ORDHDR0.CSNO2Y) 
			AND (ORDHDR0.ORDT2Y > 20090101) AND (CUSTMS0.EMAL2S <> '')  AND (CUSTMS0.CLCD2S <> 'DEP') 
			AND (CUSTMS0.CONO2S = 1)
		</cfquery>
		
		<cfset rc.customersAS400 = qCustAccts/>
        
		<!--- check if the user is already in the database and if the record is the same still --->
		
		<cfloop query="qCustAccts">
			<cfquery name="qWAcct" datasource="warehouse">
				SELECT userID
				FROM ts_users
				WHERE accountNumber = #qCustAccts.CSNO2S#
			</cfquery>
			
			<!--- check if the record is still the same if not update it --->
			<cfif qWAcct.recordcount NEQ 0>
				<!--- check if the email is valid first --->
				<cfif isValid("email",#qCustAccts.EMAL2S#)>
					<cfset user = userGateway.getById(#qWAcct.userID#)>
					<!--- check if the account name or email has changed then update the warehouse database --->
					<cfif user.getEmail() NEQ qCustAccts.EMAL2S>				
						<cfset user.setEmail(#qCustAccts.EMAL2S#)>
						<cfif user.getAccountName() NEQ qCustAccts.FLNM2S>
							<cfset user.setAccountName(#qCustAccts.FLNM2S#)>
						</cfif>
						<cfset userGateway.save(user)>
					</cfif>
				<!--- if the email is not valid  --->	
				<cfelse>
					<!--- DONT DO ANYTHING --->
				</cfif>		  
			<!--- if the user is not in the database yet create a new record and save it --->			
			<cfelse>
				<cfset user = getModel('users.user')>
				<cfset user.setUserID(0)>				
				<cfset user.setAccountNumber(#qCustAccts.CSNO2S#)>				
				<cfset user.setAccountName(#qCustAccts.FLNM2S#)>				
				<cfset user.setEmail(#qCustAccts.EMAL2S#)>				
				<cfset user.setPassword(#qCustAccts.CSNO2S#)>				
				<cfset user.setRoleID(2)>				
				<cfset userGateway.save(user)>
			</cfif>
		</cfloop>

		<cfset event.noRender()>
		
	</cffunction>	
	
	
	<!--- T by Tadashi functions --->
	
		
	<cffunction name="importInventoryTbyTadashi" access="public" returntype="void" output="false" hint="This will import the inventory from AS400">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset var divisionID = 0>
		<cfset var classID = 0>
		<cfset var sizeID = 0>
		<cfset var styleID = 0>
		<cfset var colorID = 0>		
		<cfset var invQty = 10>
		
		<!--- get available inventory in as400 from the stock room --->
		<cfquery name="asProductInventory" datasource="as400">
			SELECT PRCD8O, CRCD8O, SUM(TLOH8O) AS TLOH8O
			FROM VPSFILES.FGINSM0 AS FGINSM0 
			WHERE (CONO8O = 4) AND (LCCD8O IN ('STOCK ROOM','3'))  AND (STCD8O = '1') 
			GROUP BY PRCD8O, CRCD8O
			HAVING SUM(TLOH8O) >= #invQty#
		</cfquery>
		
		<cfset rc.asProductInventory = asProductInventory/>
		
		<!--- check if the product information already exists in w db --->
		<cfloop query="asProductInventory">
		
			<cfquery name="tsProduct" datasource="warehouse">
				SELECT ts_products.productID
				FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
				WHERE (ts_styles.styleName = '#asProductInventory.PRCD8O#') AND (ts_colors.colorCode= '#asProductInventory.CRCD8O#') 
			</cfquery>
		
			<!--- if not create it --->
			<cfif tsProduct.recordcount EQ 0>				
				<!--- check if the style already exist in w db --->
				<cfquery name="tsStyles" datasource="warehouse">
					SELECT styleID
					FROM ts_styles 
					WHERE (styleName = '#asProductInventory.PRCD8O#')				
				</cfquery>
			
				<cfif tsStyles.RECORDCOUNT EQ 0>
				<!--- if not get the style info in as400 --->
					<cfquery name="asStyles" datasource="AS400">
						SELECT PRCD3K, PRDS3K, SHDS3K, EXDS3K, CLCD3K, DVNO3K, SZCD3K, SP013K 
						FROM VPSFILES.PRHDMS0 AS PRHDMS0 
						WHERE (PRCD3K = '#asProductInventory.PRCD8O#') AND (CONO3K = 4)				
					</cfquery>
					
					<!--- check if the support information to create the style is already in w db if not create it --->
					<!--- check if division is in the ts database --->
					<cfquery name="tsDivision" datasource="warehouse">
						SELECT divisionID
						FROM ts_divisions
						WHERE divisionNumber = #asStyles.DVNO3K#
					</cfquery>
					
					<!--- if division is not in the database create it --->
					<cfif tsDivision.recordcount EQ 0>
						<cfquery name="asDivisions" datasource="as400">
							SELECT DVNO3C, DVNM3C FROM VPSFILES.DIVNMS0 AS DIVNMS0 
							WHERE (CONO3C = 4) AND (DVNO3C = #asStyles.DVNO3K#) 
						</cfquery>
		
						<cfset division = getModel('products.division')>
						<cfset division.setDivisionNumber(#asDivisions.DVNO3C#)>
						<cfset division.setDivisionName(#asDivisions.DVNM3C#)>
						
						<!--- save division information in the database --->
						<cfset divisionID = getPlugin("ioc").getBean("DivisionGateway").save(division).getDivisionID()>
					<cfelse>
						<cfset divisionID = #tsDivision.divisionID#>
					</cfif>
					
		
		
					<!--- check if class is in the ts database --->
					<cfquery name="tsClass" datasource="warehouse">
						SELECT classID 
						FROM ts_class 
						WHERE classCode = '#asStyles.CLCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsClass.recordcount EQ 0>
						<cfquery name="asClass" datasource="as400">
							SELECT CLCD3D, CLDS3D 
							FROM VPSFILES.PRCLMS0 AS PRCLMS0 
							WHERE (CONO3D = 4) AND (CLCD3D = '#asStyles.CLCD3K#')
						</cfquery>
		
						<cfset class = getModel('products.class')>
						<cfset class.setClassCode(#asClass.CLCD3D#)>
						<cfset class.setClassDescription(#asClass.CLDS3D#)>
						
						<!--- save division information in the database --->
						<cfset classID = getPlugin("ioc").getBean("ClassGateway").save(class).getClassID()>
					<cfelse>
						<cfset classID = #tsClass.classID#>
					</cfif>
					
		
		
		
		
		
					<!--- check if size is in the ts database --->
					<cfquery name="tsSizes" datasource="warehouse">
						SELECT sizeID
						FROM ts_sizes
						WHERE sizeScaleCode = '#asStyles.SZCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsSizes.recordcount EQ 0>
						<cfquery name="asSizes" datasource="as400">
							SELECT SZCD3G, SZDS3G, SZ013G, SZ023G, SZ033G, SZ043G, SZ053G, SZ063G, SZ073G, 
							SZ083G, SZ093G, SZ103G, SZ113G, SZ123G 
							FROM VPSFILES.SZSCMS0 AS SZSCMS0 
							WHERE (CONO3G = 4) AND 	(SZCD3G = '#asStyles.SZCD3K#')			
						</cfquery>
		
						<cfset size = getModel('products.size')>
						<cfset size.setSizeScaleCode(#asSizes.SZCD3G#)>
						<cfset size.setSizeDescription(#asSizes.SZDS3G#)>
						<cfset size.setSizeCode1(#asSizes.SZ013G#)>
						<cfset size.setSizeCode2(#asSizes.SZ023G#)>
						<cfset size.setSizeCode3(#asSizes.SZ033G#)>
						<cfset size.setSizeCode4(#asSizes.SZ043G#)>
						<cfset size.setSizeCode5(#asSizes.SZ053G#)>
						<cfset size.setSizeCode6(#asSizes.SZ063G#)>
						<cfset size.setSizeCode7(#asSizes.SZ073G#)>
						<cfset size.setSizeCode8(#asSizes.SZ083G#)>
						<cfset size.setSizeCode9(#asSizes.SZ093G#)>
						<cfset size.setSizeCode10(#asSizes.SZ103G#)>
						<cfset size.setSizeCode11(#asSizes.SZ113G#)>
						<cfset size.setSizeCode12(#asSizes.SZ123G#)>
						
						<!--- save division information in the database --->
						<cfset sizeID = getPlugin("ioc").getBean("SizeGateway").save(size).getSizeID()>
					<cfelse>
						<cfset sizeID = #tsSizes.sizeID#>
					</cfif>
		
					<!--- save the style in the database --->
					<cfset style = getModel('products.style')>
					
					<cfset style.setStyleName(#asStyles.PRCD3K#)>	
					<cfset style.setDescription(#asStyles.PRDS3K#)>	
					<cfset style.setShortDescription(#asStyles.SHDS3K#)>	
					<cfset style.setExtendedDescription(#asStyles.EXDS3K#)>	
					<cfset style.setClassID(#classID#)>	
					<cfset style.setDivisionID(#divisionID#)>	
					<cfset style.setSizeID(#sizeID#)>	
					<cfset style.setOnWeb(1)>	
					<cfset style.setSellingPrice(#asStyles.SP013K#)>
				
					<!--- save style information from as400 to w db --->
					<cfset styleID = getPlugin("ioc").getBean("StyleGateway").save(style).getStyleID()>
				<cfelse>
					<cfset styleID = #tsStyles.styleID#>						
				</cfif>	
				
				<!--- check if the color information  already exists  in w db --->
				<cfquery name="tsColor" datasource="warehouse">
					SELECT colorID 
					FROM ts_colors 
					WHERE (colorCode = '#asProductInventory.CRCD8O#')								
				</cfquery>				
				<!--- if not get the color info in as400 then save it in w db --->
				<cfif tsColor.recordcount EQ 0>

					<!--- get information from the as400 database --->
					<cfquery name="asColor" datasource="as400">
						SELECT CRCD3J, CDES3J 
						FROM VPSFILES.COLRMS0 AS COLRMS0 
						WHERE (CRCD3J = '#asProductInventory.CRCD8O#')								
					</cfquery>
					
					<!--- then save the color on the ts database --->
					<cfset color = getModel('products.color')>
					
					<cfset color.setColorCode(#asColor.CRCD3J#)>
					<cfset color.setColorDescription(#asColor.CDES3J#)>
					
					<cfset colorID = getPlugin("ioc").getBean("ColorGateway").save(color).getColorID()>
				<cfelse>
					<cfset colorID = #tsColor.colorID#>	
				</cfif>							
				
				<!--- create the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = getModel("Products.Product")>
				
				<cfset product.setStyleID(#styleID#)>
				<cfset product.setColorID(#colorID#)>
				<cfset product.setDiscountID(1)>
				<cfset product.setOnWeb(0)>
				<cfset product.setOnStock(1)>
				<cfset product.setForReview(1)>
				<cfset product.setComments("Product Created")>				
				<cfset product.setStock(#asProductInventory.TLOH8O#)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setCreatedBy("AS400")>
				<cfset product.setCreatedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				
				<!--- to check what product is being created --->
				<cfset rc.product = product>	
				<cfset productGateway.save(product)>
				
				
			<!--- if product does exist update the inventory to reflect --->	
			<cfelse>
			
				<!--- update the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProduct.productID#)>
				
				<cfset product.setDiscountID(1)>
				<cfset product.setOnStock(1)>
				<cfset product.setForReview(1)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setComments("HAS STOCK NOW")>				
				<cfset product.setStock(#asProductInventory.TLOH8O#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
					
				<cfset productGateway.save(product)>
						
			</cfif>
			
		</cfloop>
					
				
				
		<cfset event.noRender()>							
				
	</cffunction>





	<cffunction name="updateInventoryTbyTadashi" access="public" returntype="void" output="false" hint="This will update the inventory in the online catalog to check if the product is out of stock">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		<cfset var invQty = 10>
		
		<!--- check if the active products info from w db has inventory info  from as400 if not remove it from web and check for review --->		
		<cfquery name="tsProductInventory" datasource="warehouse">
			SELECT ts_products.productID, ts_styles.styleName, ts_colors.colorCode 
			FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
			WHERE (ts_products.archive=0) AND (ts_products.onStock=1) 
		</cfquery>
		
		<cfset rc.tsProductInventory = tsProductInventory>
		
		<cfloop query="tsProductInventory">
		
			
			<cfquery name="asInventoryInfo" datasource="as400">
				SELECT SUM(TLOH8O) AS OnHand 
				FROM VPSFILES.FGINSM0 AS FGINSM0 
				WHERE (CONO8O = 4) AND (LCCD8O IN ('STOCK ROOM', '3'))			
				AND (PRCD8O = '#tsProductInventory.styleName#') AND  (CRCD8O = '#tsProductInventory.colorCode#') 			
			</cfquery>
			
			<cfif asInventoryInfo.OnHand LT invQty>			
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProductInventory.productID#)>
				
				<cfset product.setDiscountID(1)>
				<cfset product.setOnWeb(0)>
				<cfset product.setComments("Out of Stock")>
				<cfset product.setOnStock(0)>
				<cfset product.setStock(0)>
				<cfset product.setForReview(1)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>				
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				
				<cfset productGateway.save(product)>
			</cfif>
						
		</cfloop>

		<cfset event.noRender()>							

	</cffunction>
	
	
	
	
	<cffunction name="importOvercutsTbyTadashi" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset var divisionID = 0>
		<cfset var classID = 0>
		<cfset var sizeID = 0>
		<cfset var styleID = 0>
		<cfset var colorID = 0>		
		<cfset var deliveryMonth = 0>		
		<cfset var deliveryYear = 0>		
		<cfset var invQty = 10>
		
		<!--- get available inventory in as400 --->
		<cfquery name="asProductInventory" datasource="as400">
			SELECT PRCD5V, CRCD5V, TLAV5V
			FROM VPSFILES.PRDAVL0 AS PRDAVL0
			WHERE (CONO5V = 4) AND 	(TLAV5V >= #invQty#)
		</cfquery>
		
		<cfset rc.asProductInventory = asProductInventory/>
		
		<!--- check if the product information already exists in w db --->
		<cfloop query="asProductInventory">
		
			<!--- get cut ticket information in as400 --->
			<cfquery name="asProductCut" datasource="as400">
				SELECT PRCD8Q, CRCD8Q,  MAX(DUDT8Q)  AS CUTDATE 
				FROM VPSFILES.JOBSUM0 AS JOBSUM0 
				WHERE (CONO8Q = 4) AND 
				(PRCD8Q = '#asProductInventory.PRCD5V#') AND (CRCD8Q = '#asProductInventory.CRCD5V#') 
				GROUP BY PRCD8Q, CRCD8Q
			</cfquery>	
		
			<cfset deliveryMonth = Mid(ToString(#asProductCut.CUTDATE#),5,2)>	
			<cfset deliveryYear = Mid(ToString(#asProductCut.CUTDATE#),1,4)>	
									
			<cfquery name="tsProduct" datasource="warehouse">
				SELECT ts_products.productID
				FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
				WHERE (((ts_styles.styleName) = '#asProductInventory.PRCD5V#')) AND ((ts_colors.colorCode)= '#asProductInventory.CRCD5V#') 
			</cfquery>
		
			<!--- if not create it --->
			<cfif tsProduct.recordcount EQ 0>				
				<!--- check if the style already exist in w db --->
				<cfquery name="tsStyles" datasource="warehouse">
					SELECT styleID
					FROM ts_styles 
					WHERE (styleName = '#asProductInventory.PRCD5V#')				
				</cfquery>
			
				<cfif tsStyles.RECORDCOUNT EQ 0>
				<!--- if not get the style info in as400 --->
					<cfquery name="asStyles" datasource="AS400">
						SELECT PRCD3K, PRDS3K, SHDS3K, EXDS3K, CLCD3K, DVNO3K, SZCD3K, SP013K 
						FROM VPSFILES.PRHDMS0 AS PRHDMS0 
						WHERE (PRCD3K = '#asProductInventory.PRCD5V#') AND (CONO3K = 4)				
					</cfquery>
					
					<!--- check if the support information to create the style is already in w db if not create it --->
					<!--- check if division is in the ts database --->
					<cfquery name="tsDivision" datasource="warehouse">
						SELECT divisionID
						FROM ts_divisions
						WHERE divisionNumber = #asStyles.DVNO3K#
					</cfquery>
					
					<!--- if division is not in the database create it --->
					<cfif tsDivision.recordcount EQ 0>
						<cfquery name="asDivisions" datasource="as400">
							SELECT DVNO3C, DVNM3C FROM VPSFILES.DIVNMS0 AS DIVNMS0 
							WHERE (CONO3C = 4) AND (DVNO3C = #asStyles.DVNO3K#) 
						</cfquery>
		
						<cfset division = getModel('products.division')>
						<cfset division.setDivisionNumber(#asDivisions.DVNO3C#)>
						<cfset division.setDivisionName(#asDivisions.DVNM3C#)>
						
						<!--- save division information in the database --->
						<cfset divisionID = getPlugin("ioc").getBean("DivisionGateway").save(division).getDivisionID()>
					<cfelse>
						<cfset divisionID = #tsDivision.divisionID#>
					</cfif>
					
		
		
					<!--- check if class is in the ts database --->
					<cfquery name="tsClass" datasource="warehouse">
						SELECT classID 
						FROM ts_class 
						WHERE classCode = '#asStyles.CLCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsClass.recordcount EQ 0>
						<cfquery name="asClass" datasource="as400">
							SELECT CLCD3D, CLDS3D 
							FROM VPSFILES.PRCLMS0 AS PRCLMS0 
							WHERE (CONO3D = 4) AND (CLCD3D = '#asStyles.CLCD3K#')
						</cfquery>
		
						<cfset class = getModel('products.class')>
						<cfset class.setClassCode(#asClass.CLCD3D#)>
						<cfset class.setClassDescription(#asClass.CLDS3D#)>
						
						<!--- save division information in the database --->
						<cfset classID = getPlugin("ioc").getBean("ClassGateway").save(class).getClassID()>
					<cfelse>
						<cfset classID = #tsClass.classID#>
					</cfif>
					
		
					<!--- check if size is in the ts database --->
					<cfquery name="tsSizes" datasource="warehouse">
						SELECT sizeID
						FROM ts_sizes
						WHERE sizeScaleCode = '#asStyles.SZCD3K#'
					</cfquery>
					
					<!--- if class is not in the database create it --->
					<cfif tsSizes.recordcount EQ 0>
						<cfquery name="asSizes" datasource="as400">
							SELECT SZCD3G, SZDS3G, SZ013G, SZ023G, SZ033G, SZ043G, SZ053G, SZ063G, SZ073G, 
							SZ083G, SZ093G, SZ103G, SZ113G, SZ123G 
							FROM VPSFILES.SZSCMS0 AS SZSCMS0 
							WHERE (CONO3G = 4) AND 	(SZCD3G = '#asStyles.SZCD3K#')			
						</cfquery>
		
						<cfset size = getModel('products.size')>	
						<cfset size.setSizeScaleCode(#asSizes.SZCD3G#)>
						<cfset size.setSizeDescription(#asSizes.SZDS3G#)>
						<cfset size.setSizeCode1(#asSizes.SZ013G#)>
						<cfset size.setSizeCode2(#asSizes.SZ023G#)>
						<cfset size.setSizeCode3(#asSizes.SZ033G#)>
						<cfset size.setSizeCode4(#asSizes.SZ043G#)>
						<cfset size.setSizeCode5(#asSizes.SZ053G#)>
						<cfset size.setSizeCode6(#asSizes.SZ063G#)>
						<cfset size.setSizeCode7(#asSizes.SZ073G#)>
						<cfset size.setSizeCode8(#asSizes.SZ083G#)>
						<cfset size.setSizeCode9(#asSizes.SZ093G#)>
						<cfset size.setSizeCode10(#asSizes.SZ103G#)>
						<cfset size.setSizeCode11(#asSizes.SZ113G#)>
						<cfset size.setSizeCode12(#asSizes.SZ123G#)>
						
						<!--- save division information in the database --->
						<cfset sizeID = getPlugin("ioc").getBean("SizeGateway").save(size).getSizeID()>
					<cfelse>
						<cfset sizeID = #tsSizes.sizeID#>
					</cfif>
		
					<!--- save the style in the database --->
					<cfset style = getModel('products.style')>
					
					<cfset style.setStyleName(#asStyles.PRCD3K#)>	
					<cfset style.setDescription(#asStyles.PRDS3K#)>	
					<cfset style.setShortDescription(#asStyles.SHDS3K#)>	
					<cfset style.setExtendedDescription(#asStyles.EXDS3K#)>	
					<cfset style.setClassID(#classID#)>	
					<cfset style.setDivisionID(#divisionID#)>	
					<cfset style.setSizeID(#sizeID#)>	
					<cfset style.setOnWeb(1)>	
					<cfset style.setSellingPrice(#asStyles.SP013K#)>
				
					<!--- save style information from as400 to w db --->
					<cfset styleID = getPlugin("ioc").getBean("StyleGateway").save(style).getStyleID()>
				<cfelse>
					<cfset styleID = #tsStyles.styleID#>						
				</cfif>	
				
				<!--- check if the color information  already exists  in w db --->
				<cfquery name="tsColor" datasource="warehouse">
					SELECT colorID 
					FROM ts_colors 
					WHERE (colorCode = '#asProductInventory.CRCD5V#')								
				</cfquery>				
				<!--- if not get the color info in as400 then save it in w db --->
				<cfif tsColor.recordcount EQ 0>

					<!--- get information from the as400 database --->
					<cfquery name="asColor" datasource="as400">
						SELECT CRCD3J, CDES3J 
						FROM VPSFILES.COLRMS0 AS COLRMS0 
						WHERE (CRCD3J = '#asProductInventory.CRCD5V#')								
					</cfquery>
					
					<!--- then save the color on the ts database --->
					<cfset color = getModel('products.color')>
					
					<cfset color.setColorCode(#asColor.CRCD3J#)>
					<cfset color.setColorDescription(#asColor.CDES3J#)>
					
					<cfset colorID = getPlugin("ioc").getBean("ColorGateway").save(color).getColorID()>
				<cfelse>
					<cfset colorID = #tsColor.colorID#>	
				</cfif>							
				
				<!--- create the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = getModel("Products.Product")>
				
				<cfset product.setStyleID(#styleID#)>
				<cfset product.setColorID(#colorID#)>
				<cfset product.setDiscountID(1)>
				<cfset product.setOnWeb(0)>
				<cfset product.setOnStock(0)>
				<cfset product.setForReview(1)>
				<cfset product.setComments("Product Created")>				
				<cfset product.setWip(#asProductInventory.TLAV5V#)>
				<cfset product.setDeliveryMonth(#deliveryMonth#)>
				<cfset product.setDeliveryYear(#deliveryYear#)>
				<cfset product.setCreatedBy("AS400")>
				<cfset product.setCreatedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
					
				<cfset productGateway.save(product)>
			<!--- if product does exist update the inventory to reflect --->	
			<cfelse>
			
				<!--- update the product in the w db --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProduct.productID#)>
								
				<cfif product.getOnStock() NEQ 1>
					<cfset product.setDiscountID(1)>
					<cfset product.setForReview(1)>
					<cfset product.setComments("HAS OVERCUTS")>				
					<cfset product.setWip(#asProductInventory.TLAV5V#)>
					<cfset product.setDeliveryMonth(#deliveryMonth#)>
					<cfset product.setDeliveryYear(#deliveryYear#)>
					<cfset product.setLastMaintainedBy("AS400")>
					<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
									
					<cfset productGateway.save(product)>					
				</cfif>			
			</cfif>
			
		</cfloop>
					
				
				
		<cfset event.noRender()>							
				
	</cffunction>



	
	
	<cffunction name="updateOvercutsTbyTadashi" access="public" returntype="void" output="false" hint="This will update the products that are in production but less than the required availability to out of stock">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		<cfset var tsProduct = ""/>
		<cfset var invQty = 10>

		<!--- query all the products in the web that are in production  --->
		<cfquery name="tsProduct" datasource="warehouse">
			SELECT ts_products.productID, ts_styles.styleName, ts_colors.colorCode, ts_products.wip 
			FROM (ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID
			WHERE (ts_products.deliveryMonth <> 0) AND (ts_products.onStock = 0)
		</cfquery>
		
		<cfset rc.tsProduct = tsProduct/>
		
		<cfloop query="tsProduct">

			<!--- get available inventory in as400 for production styles in the warehouse database --->
			<cfquery name="asProductInventory" datasource="as400">
				SELECT PRCD5V, CRCD5V, TLAV5V, (TLWP5V + TLPO5V) AS WIP
				FROM VPSFILES.PRDAVL0 AS PRDAVL0
				WHERE (CONO5V = 4) AND (PRCD5V = '#tsProduct.styleName#')	AND (CRCD5V = '#tsProduct.colorCode#')
			</cfquery>

			<!--- update the product if only if there is record count and there are cuts and if the available to sell is less than required inventory qty --->
			<cfif asProductInventory.recordcount GT 0 AND (asProductInventory.WIP EQ 0 OR asProductInventory.TLAV5V LT invQty)>			
				<!--- update the product in the w db if there is less than the required availability --->
				<cfset productGateway = getPlugin("ioc").getBean("ProductGateway")>
				<cfset product = productGateway.getById(#tsProduct.productID#)>
				
				<cfset product.setDiscountID(1)>
				<cfset product.setForReview(1)>
				<cfset product.setComments("Out of Stock")>				
				<cfset product.setOnWeb(0)>
				<cfset product.setWip(0)>
				<cfset product.setDeliveryMonth(0)>
				<cfset product.setDeliveryYear(0)>
				<cfset product.setLastMaintainedBy("AS400")>
				<cfset product.setLastMaintainedDate(#DateFormat(CreateODBCDate(Now()),"short")#)>
								
				<cfset productGateway.save(product)>													
			</cfif>		
			
		</cfloop>

		<cfset event.noRender()>							
	
	</cffunction>
	
		
	
	<cffunction name="archiveOldStyles" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
        
		<cfquery name="tsProduct" datasource="warehouse">
			UPDATE ts_products
            SET ts_products.archive = 1
			WHERE (ts_products.lastMaintainedDate < DATE '2011-12-31') AND (ts_products.onStock = 0)
		</cfquery>

		<cfset event.noRender()>
        
	</cffunction>        		

		
		
</cfcomponent>