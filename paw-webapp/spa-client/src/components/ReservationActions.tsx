import { Button, Stack } from "@mui/material";
import { FC, useState } from "react";
import { useNavigate} from "react-router-dom";
import { handleResponse } from "../Utils";
import useReservationService from "../hooks/serviceHooks/useReservationService";
import { ReservationModel } from "../models"
import { ReservationParams } from "../models/Reservations/ReservationParams";

type Props = {
    reservation: ReservationModel | undefined;
    toggleReload: () => void;
}

const ReservationActions: FC<Props> = ({reservation, toggleReload}) => {


    const reservationService = useReservationService();
    const navigate = useNavigate();

    const seatClient= () => {
        let updateReservation = new ReservationParams();
        updateReservation.securityCode = reservation?.securityCode;
        updateReservation.status = "SEATED";
        handleResponse(
            reservationService.patchReservation(updateReservation),
            (response) => {
                toggleReload()}
        )
    }

    const cancelReservation = () => {
        let updateReservation = new ReservationParams();
        updateReservation.securityCode = reservation?.securityCode;
        updateReservation.status = "CANCELED";
        handleResponse(
            reservationService.patchReservation(updateReservation),
            (response) => {
                toggleReload()}
        )
    }

    const endReservation = () => {
        let updateReservation = new ReservationParams();
        updateReservation.securityCode = reservation?.securityCode;
        updateReservation.status = "FINISHED";
        handleResponse(
            reservationService.patchReservation(updateReservation),
            (response) => {
                toggleReload()}
        )
    }

    return (
        <>
            {reservation?.status === "OPEN" && 
                <Stack direction="row" spacing={2}>
                    <Button variant="outlined" sx={{width:10}} color="success" onClick={seatClient}>SEAT</Button>
                    <Button variant="outlined" sx={{width:10}} color="error" onClick={cancelReservation}>CANCEL RESERVATION</Button>
                </Stack>
            }
            {reservation?.status === "SEATED" && 
                <Stack direction="row" spacing={2}>
                    <Button variant="outlined" sx={{width:200}} color="success" onClick={() => navigate("reservations/"+reservation.securityCode+"/checkOut")}>MAKE CHECK</Button>
                    <Button variant="outlined" sx={{width:200}} color="secondary" onClick={() => navigate("reservations/"+reservation.securityCode)}>ACCESS RESERVATION</Button>
                </Stack>
            }
            {reservation?.status === "CHECK_ORDERED" && 
                <Stack direction="row" spacing={2}>
                    <Button variant="outlined" sx={{width:200}} color="success" onClick={() => navigate("reservations/"+reservation.securityCode+"/checkOut")}>MAKE CHECK</Button>
                    <Button variant="outlined" sx={{width:200}} color="success" onClick={endReservation}>END RESERVATION</Button>
                </Stack>
            }
        </>
    );
}

export default ReservationActions;