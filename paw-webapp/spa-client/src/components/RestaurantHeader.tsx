import { Box, Button, Grid, Skeleton, Typography } from "@mui/material";
import { FC, useContext, useState } from "react";
import { themePalette } from "../config/theme.config";
import { OrderItemModel, ReservationModel, RestaurantModel } from "../models";
import AuthReservationForm from "./forms/AuthReservationForm";
import ReservationData from "./ReservationData";
import ShoppingCartIcon from '@mui/icons-material/ShoppingCart';
import ShoppingCart from "./shoppingCart/ShoppingCart";
import {useNavigate} from "react-router-dom";
import CategoryForm from "./forms/CategoryForm";
import { ReservationContext } from "../context/ReservationContext";
import { paths } from "../constants/constants";

type Props = {
    restaurant?: RestaurantModel | undefined;
    role: string;
    toggleReload?: () => void;
};

const RestaurantHeader: FC<Props> = ({
    restaurant,
    role,
    toggleReload
  }): JSX.Element => {

    const [authIsOpen, setAuthOpen] = useState(false);
    const [state, setState] = useState(false);
    const [shoppingCartOpen, setShoppingCart] = useState(false);
    let navigate = useNavigate();
    const [createIsOpen, setIsOpen] = useState(false);
    const { reservation } = useContext(ReservationContext);


    const toggleDrawer = () => {
      setState(!state);
    };

    const toggleShoppingCart = () => {
      setShoppingCart(!shoppingCartOpen);
    };

    const handleAuthReservation = () => {
        setAuthOpen(!authIsOpen);
    };

    const toggleCreateCategoryForm = () => {
      setIsOpen(!createIsOpen);
    }

    return (
        <Grid
        item
        container
        xs={11}
        component={Box}
        marginTop={3}
        borderRadius={3}
        justifyContent="space-between"
        padding={1}
        sx={{
          background: themePalette.PURPLE,
          display: "flex",
          alignItems:"center"
        }}
      >
        <AuthReservationForm handleOpen={handleAuthReservation} isOpen={authIsOpen} />
        <CategoryForm isOpen={createIsOpen} handleOpen={toggleCreateCategoryForm} canReload={toggleReload}/>
        <Grid item component={Typography} variant="h2" sx={{ color: "white" }}>
          {role === "ROLE_RESTAURANT" ? "Menu" : restaurant?  restaurant.name : <Skeleton  variant="rounded" animation="wave" width={410} height={50} />}
        </Grid>
        {reservation? 
            <Grid item>
            <ReservationData toggleDrawer={toggleDrawer} state={state} reservation={reservation}/>
            <ShoppingCart toggleCart={toggleShoppingCart} isOpen={shoppingCartOpen} toggleReload={toggleReload}/>
            <Button sx={{margin: 1}} variant="contained" color="success" onClick={toggleShoppingCart}><ShoppingCartIcon/></Button>
            <Button sx={{margin: 1}} variant="contained" color="secondary" onClick={toggleDrawer}>My reservation</Button>
            </Grid>
            :
            role === "ROLE_ANONYMOUS"?
            <Grid item>
            <Button sx={{margin: 1}} variant="contained" color="success" onClick={() => navigate(paths.ROOT + "/createReservation")}>Make reservation</Button>
            <Button sx={{margin: 1}} variant="contained" color="secondary" onClick={handleAuthReservation}> Have reservation</Button>
            </Grid>
            :
            <Grid item xs={1}>
              <Button onClick={toggleCreateCategoryForm} variant="contained" fullWidth color="success">Create category</Button>
            </Grid>
        }
      </Grid>
    );
  }


export default RestaurantHeader;