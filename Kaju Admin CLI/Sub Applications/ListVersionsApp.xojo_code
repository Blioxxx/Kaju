#tag Class
Protected Class ListVersionsApp
Inherits SubApplication
	#tag Event
		Sub AddOptions(parser As OptionParser)
		  dim o as new Option( "", kOptionEOL, _
		  "The EOL separator", Option.OptionType.String )
		  o.AddAllowedValue "cr", "lf", "crlf", "null"
		  
		  parser.AddOption o
		End Sub
	#tag EndEvent

	#tag Event
		Function GetDescription() As String
		  return kDescription
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Run(adminFile As FolderItem, options As OptionParser) As Integer
		  dim file as new KajuFile
		  file.Load adminFile
		  
		  dim versions() as string
		  for i as integer = 0 to file.KajuData.Ubound
		    dim data as Kaju.UpdateInformation = file.KajuData( i )
		    versions.Append data.Version
		  next
		  
		  
		  dim eol as string = options.StringValue( kOptionEOL, "" )
		  select case eol
		  case "cr"
		    eol = &u0D
		  case "lf"
		    eol = &u0A
		  case "crlf"
		    eol = &u0D + &u0A
		  case "null"
		    eol = &u00
		  case else
		    eol = EndOfLine
		  end select
		  
		  print join( versions, eol )
		  return App.kErrorNoError
		End Function
	#tag EndEvent


	#tag Constant, Name = kDescription, Type = String, Dynamic = False, Default = \"List the versions in the file", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kOptionEOL, Type = String, Dynamic = False, Default = \"eol", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
