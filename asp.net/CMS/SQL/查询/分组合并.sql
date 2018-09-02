select GroupID,ÓµÓÐÕß=stuff((select ','+[UserName] from CutterUsersGroup t where GroupID=CutterUsersGroup.GroupID for xml path('')), 1, 1, ''),
ID=stuff((select top 1 [ID]+0 from CutterUsersGroup t where GroupID=CutterUsersGroup.GroupID for xml path('')), 1, 0, '')
from CutterUsersGroup 
group by GroupID