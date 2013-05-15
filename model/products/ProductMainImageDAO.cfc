<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.ProductMainImage">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	productImageID, productID, description, location, url, contentType, 
					file, fileName, fileExtension, height, width, 
					fileSize, thumbnailFile, thumbnailFileName, thumbnailHeight, thumbnailWidth
					
			from ts_productMainImages
			where productImageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.ProductMainImage").init();
			obj.setproductImageID(qRead.productImageID);
			obj.setproductID(qRead.productID);
			obj.setdescription(qRead.description);
			obj.setlocation(qRead.location);
			obj.seturl(qRead.url);
			obj.setcontentType(qRead.contentType);
			obj.setfile(qRead.file);
			obj.setfileName(qRead.fileName);
			obj.setfileExtension(qRead.fileExtension);
			obj.setheight(qRead.height);
			obj.setwidth(qRead.width);
			obj.setfileSize(qRead.fileSize);
			obj.setthumbnailFile(qRead.thumbnailFile);
			obj.setthumbnailFileName(qRead.thumbnailFileName);
			obj.setthumbnailHeight(qRead.thumbnailHeight);
			obj.setthumbnailWidth(qRead.thumbnailWidth);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.ProductMainImage">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getproductID()>
		<cfset var local2=arguments.bean.getdescription()>
		<cfset var local3=arguments.bean.getlocation()>
		<cfset var local4=arguments.bean.geturl()>
		<cfset var local5=arguments.bean.getcontentType()>
		<cfset var local6=arguments.bean.getfile()>
		<cfset var local7=arguments.bean.getfileName()>
		<cfset var local8=arguments.bean.getfileExtension()>
		<cfset var local9=arguments.bean.getheight()>
		<cfset var local10=arguments.bean.getwidth()>
		<cfset var local11=arguments.bean.getfileSize()>
		<cfset var local12=arguments.bean.getthumbnailFile()>
		<cfset var local13=arguments.bean.getthumbnailFileName()>
		<cfset var local14=arguments.bean.getthumbnailHeight()>
		<cfset var local15=arguments.bean.getthumbnailWidth()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_productMainImages(productID, description, location, url, contentType, file, fileName, fileExtension, height, width, fileSize, thumbnailFile, thumbnailFileName, thumbnailHeight, thumbnailWidth)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select productImageID
				from ts_productMainImages
				where productID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and description = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and location = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and url = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and contentType = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and file = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and fileName = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and fileExtension = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and height = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and width = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and fileSize = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and thumbnailFile = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />
				  and thumbnailFileName = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and thumbnailHeight = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and thumbnailWidth = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				order by productImageID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setproductImageID(qGetID.productImageID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.ProductMainImage">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_productMainImages
			set productID = <cfqueryparam value="#arguments.bean.getproductID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getproductID() eq ""), de("yes"), de("no"))#" />,
				description = <cfqueryparam value="#arguments.bean.getdescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				location = <cfqueryparam value="#arguments.bean.getlocation()#" cfsqltype="CF_SQL_VARCHAR" />,
				url = <cfqueryparam value="#arguments.bean.geturl()#" cfsqltype="CF_SQL_VARCHAR" />,
				contentType = <cfqueryparam value="#arguments.bean.getcontentType()#" cfsqltype="CF_SQL_VARCHAR" />,
				file = <cfqueryparam value="#arguments.bean.getfile()#" cfsqltype="CF_SQL_VARCHAR" />,
				fileName = <cfqueryparam value="#arguments.bean.getfileName()#" cfsqltype="CF_SQL_VARCHAR" />,
				fileExtension = <cfqueryparam value="#arguments.bean.getfileExtension()#" cfsqltype="CF_SQL_VARCHAR" />,
				height = <cfqueryparam value="#arguments.bean.getheight()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getheight() eq ""), de("yes"), de("no"))#" />,
				width = <cfqueryparam value="#arguments.bean.getwidth()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getwidth() eq ""), de("yes"), de("no"))#" />,
				fileSize = <cfqueryparam value="#arguments.bean.getfileSize()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getfileSize() eq ""), de("yes"), de("no"))#" />,
				thumbnailFile = <cfqueryparam value="#arguments.bean.getthumbnailFile()#" cfsqltype="CF_SQL_VARCHAR" />,
				thumbnailFileName = <cfqueryparam value="#arguments.bean.getthumbnailFileName()#" cfsqltype="CF_SQL_VARCHAR" />,
				thumbnailHeight = <cfqueryparam value="#arguments.bean.getthumbnailHeight()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getthumbnailHeight() eq ""), de("yes"), de("no"))#" />,
				thumbnailWidth = <cfqueryparam value="#arguments.bean.getthumbnailWidth()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getthumbnailWidth() eq ""), de("yes"), de("no"))#" />
			where productImageID = <cfqueryparam value="#arguments.bean.getproductImageID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.ProductMainImage">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_productMainImages
			where productImageID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getproductImageID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>