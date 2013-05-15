<cfcomponent output="false" alias="warehouse.model.products.ProductImage">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="productImageID" type="numeric" default="0">
	<cfproperty name="productID" type="numeric" default="0">
	<cfproperty name="description" type="string" default="">
	<cfproperty name="location" type="string" default="">
	<cfproperty name="url" type="string" default="">
	<cfproperty name="contentType" type="string" default="">
	<cfproperty name="file" type="string" default="">
	<cfproperty name="fileName" type="string" default="">
	<cfproperty name="fileExtension" type="string" default="">
	<cfproperty name="height" type="numeric" default="0">
	<cfproperty name="width" type="numeric" default="0">
	<cfproperty name="fileSize" type="numeric" default="0">
	<cfproperty name="thumbnailFile" type="string" default="">
	<cfproperty name="thumbnailFileName" type="string" default="">
	<cfproperty name="thumbnailHeight" type="numeric" default="0">
	<cfproperty name="thumbnailWidth" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.productImageID = 0;
		variables.productID = 0;
		variables.description = "";
		variables.location = "";
		variables.url = "";
		variables.contentType = "";
		variables.file = "";
		variables.fileName = "";
		variables.fileExtension = "";
		variables.height = 0;
		variables.width = 0;
		variables.fileSize = 0;
		variables.thumbnailFile = "";
		variables.thumbnailFileName = "";
		variables.thumbnailHeight = 0;
		variables.thumbnailWidth = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="ProductImage">
		<cfreturn this>
	</cffunction>
	<cffunction name="getProductImageID" output="false" access="public" returntype="any">
		<cfreturn variables.ProductImageID>
	</cffunction>

	<cffunction name="setProductImageID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ProductImageID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getProductID" output="false" access="public" returntype="any">
		<cfreturn variables.ProductID>
	</cffunction>

	<cffunction name="setProductID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ProductID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>

	<cffunction name="getLocation" output="false" access="public" returntype="any">
		<cfreturn variables.Location>
	</cffunction>

	<cffunction name="setLocation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Location = arguments.val>
	</cffunction>

	<cffunction name="getUrl" output="false" access="public" returntype="any">
		<cfreturn variables.Url>
	</cffunction>

	<cffunction name="setUrl" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Url = arguments.val>
	</cffunction>

	<cffunction name="getContentType" output="false" access="public" returntype="any">
		<cfreturn variables.ContentType>
	</cffunction>

	<cffunction name="setContentType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ContentType = arguments.val>
	</cffunction>

	<cffunction name="getFile" output="false" access="public" returntype="any">
		<cfreturn variables.File>
	</cffunction>

	<cffunction name="setFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.File = arguments.val>
	</cffunction>

	<cffunction name="getFileName" output="false" access="public" returntype="any">
		<cfreturn variables.FileName>
	</cffunction>

	<cffunction name="setFileName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FileName = arguments.val>
	</cffunction>

	<cffunction name="getFileExtension" output="false" access="public" returntype="any">
		<cfreturn variables.FileExtension>
	</cffunction>

	<cffunction name="setFileExtension" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FileExtension = arguments.val>
	</cffunction>

	<cffunction name="getHeight" output="false" access="public" returntype="any">
		<cfreturn variables.Height>
	</cffunction>

	<cffunction name="setHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Height = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWidth" output="false" access="public" returntype="any">
		<cfreturn variables.Width>
	</cffunction>

	<cffunction name="setWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Width = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFileSize" output="false" access="public" returntype="any">
		<cfreturn variables.FileSize>
	</cffunction>

	<cffunction name="setFileSize" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.FileSize = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThumbnailFile" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailFile>
	</cffunction>

	<cffunction name="setThumbnailFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ThumbnailFile = arguments.val>
	</cffunction>

	<cffunction name="getThumbnailFileName" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailFileName>
	</cffunction>

	<cffunction name="setThumbnailFileName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ThumbnailFileName = arguments.val>
	</cffunction>

	<cffunction name="getThumbnailHeight" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailHeight>
	</cffunction>

	<cffunction name="setThumbnailHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ThumbnailHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThumbnailWidth" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailWidth>
	</cffunction>

	<cffunction name="setThumbnailWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ThumbnailWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>