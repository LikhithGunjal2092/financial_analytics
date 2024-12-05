create function dbo.udf_extractalphabets
(  
  @input varchar(255)  
)  
returns varchar(255)  
as  
begin  
  declare @alphabetindex int = patindex('%[^a-za-z]%', @input)  
  begin  
    while @alphabetindex > 0  
    begin  
      set @input = stuff(@input, @alphabetindex, 1, '' )  
      set @alphabetindex = patindex('%[^a-za-z]%', @input )  
    end  
  end  
  return @input
end;
