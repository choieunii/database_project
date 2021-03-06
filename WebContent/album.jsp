<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,project.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
th, td {
	padding: 8px;;
}
tr:hover {
	background-color: #e9ecef;
	border-bottom: 3px solid #337ab7;
}
.name:hover {
color:purple;
font-weight: bold;
}
</style>
<meta charset="utf-8">
<title>앨범정보</title>
</head>
<jsp:useBean id="AlbumMgr" class="project.AlbumMgr"
				scope="page" />
<script type="text/javascript">
function albumid(id){
	location.href="album_comment.jsp?albumid="+id;
}
</script>
<body style="margin:0px; padding:0px; border: 0px;">
	<%@ include file="top.jsp"%>
	<div
		style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
		<form method="post" action="search_album.jsp">
		<div
			style="width: 100%; display: flex; flex-direction: row; justify-content: center; align-content: center; font-size: 30px; font-weight: bold; margin-top: 30px; margin-bottom: 30px;">
			<input type="text" name="search"
				style="width: 350px; height: 30px; border: 1px solid black; border-width: 1px 0 1px 1px; border-radius: 5px 0 0 5px;"></input>
			<button type="submit" 
				style="background-color: #ffffff; border: 0.5px solid black; border-width: 1px 1px 1px 0; border-radius: 0 5px 5px 0;">
				<img src="images/glass.png" style="width: 17px; height: 17px;">
			</button>
		</div>
		</form>
		<table border="0" align="center" width="850"
			border-collapse="collapse">
			<tr>
				<td align="center" bgcolor="#337ab7" width="80"><font
					color=white>No.</font></td>
				<td align="center" bgcolor="#337ab7" width="150"><font
					color=white>앨범</font></td>
				<td align="center" bgcolor="#337ab7" width="140"><font
					color=white>아티스트</font></td>
				<td align="center" bgcolor="#337ab7" width="140"><font
					color=white>출시일</font></td>
				<td align="center" bgcolor="#337ab7" width="130"><font
					color=white>감독</font></td>
				<td align="center" bgcolor="#337ab7" width="130"><font
					color=white>좋아요수</font></td>
			</tr>
			<% 
			Vector vlist = AlbumMgr.getAlbumList();		
			
			for(int i=0; i<vlist.size(); i++) {
				Album A = (Album)vlist.elementAt(i);
				%>
			<tr>
				<td align="center"><%=A.getAlbumId() %></td>
				<td align="center" class="name" id="<%=A.getAlbumId() %>" onclick="albumid(this.id)"><%=A.getAlbumName() %></td>
				<td align="center"><%=A.getArtistName() %></td>
				<td align="center"><%=A.getAlbumBirthdate() %></td>
				<td align="center"><%=A.getAlbumDirector() %></td>
				<td align="center"><%=A.getAlbumLikeCount() %></td>
			</tr>
			<%} %>
		</table>
	</div>
</body>
<%@include file ="footer.jsp" %>
</html>