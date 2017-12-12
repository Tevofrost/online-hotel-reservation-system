<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm rooms</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<style>
.room{
	border-style:solid;
	border-color:green;
	border-radius:25px;
}
</style>
</head>
<body>
	<form method="post" action="ReservedRoomSummary">
		<input type="hidden" name="hotel_id" value="${hotel_id}">
		<input type="hidden" name="in_date" value="${in_date}">
		<input type="hidden" name="out_date" value="${out_date}">
		<input type="hidden" name="req_room_string" value='${req_room_string}'>
		<div id="req_rooms" class="container-fluid">
		Please look over the rooms you have selected and proceed to purchase <br>
			Displaying selected rooms for ${hotel_name} <br>
			<c:if test="${empty req_rooms}">
				<div id="msg">
					No rooms were selected!
				</div>
			</c:if>
			<c:forEach items="${req_rooms}" var="room">
				<div class="row">
					<div id="${room.getRoomNum()}" data-hotel_id="${hotel_id}"data-hotel_name="${hotel_name}"class="col-4 room" >
						Room ${room.getRoomNum()}: <br>
						Floor: ${room.getFloorNum()} <br>
						Description: ${room.getDescription()} <br>
						Type: ${room.getType()} <br>
						Capacity: ${room.getCapacity()} <br>
						Price: $${room.getPrice()} <br>
					</div> 
				</div>
				<br>
			</c:forEach>
		</div>
		<div id="credit_cards">
		Select a credit card:
		<select name="credit_card" id="card_choice">
			<option value="">Add a new card</option>
			<c:forEach items="${cards}" var="card">
				<option value="${card.getCardId()}">${card.getName()} ${card.getType()} ${card.getCardId()}</option>
			</c:forEach>
		</select>
		</div>
		<div id="card_form">
			Name: <input type="text" name="card_name" required> <br>
			Billing Address: <input type="text" name="card_addr" required> <br>
			Card Number: <input type="text" name="card_num" minlength="16" required> <br>
			Security Code: <input type="text" name="card_sec" required> <br>
			Card Type: <input type="text" name="card_type" required> <br> 
			Expiration Date: <input type="Date" name="card_exp_date" required> <br>
		</div>
		<input type="submit">
	</form>
</body>
<script>
	$(document).ready(function(){
		$("#card_choice").change(function(){
			console.log($(this).val());
			if($(this).val() !== ''){
				$("#card_form").remove();
			}
			else{
				$("#credit_cards").append('<div id="card_form">Name: <input type="text" name="card_name" required> <br>Billing Address: <input type="text" name="card_addr" required> <br>Card Number: <input type="text" name="card_num" minlength="16" required> <br>Security Code: <input type="text" name="card_sec" required> <br>Card Type: <input type="text" name="card_type" required> <br> Expiration Date: <input type="Date" name="card_exp_date" required> <br></div>');
			}
		});
	});
</script>
</html>