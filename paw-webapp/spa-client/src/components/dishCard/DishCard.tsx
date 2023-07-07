import { Typography } from "@mui/material";
import { FC, useContext, useState } from "react";

import DishModel from "../../models/Dishes/DishModel";
import Link from '@mui/material/Link';
import ConfirmDishForm from "../forms/ConfirmDishForm";
import { useNavigate } from "react-router-dom";
import {linkStyle, paths} from "../../constants/constants";
import useAuth from "../../hooks/useAuth";
import './styles.css';
import { ReservationContext } from "../../context/ReservationContext";


type Props = {
  dish: DishModel;
};

const DishCard: FC<Props> = ({
  dish,
}): JSX.Element => {

  const [isCardOpen, setCardOpen] = useState(false);
  let navigate = useNavigate();
  const { auth } = useAuth();
  const { reservation, discount } = useContext(ReservationContext);
  const textDecoration = discount ? 'line-through' : 'none';
  /*const { useDish: { setDish }, useCurrentCategory: { setCategoryId }, useEditDishIsOpen: { setEditDishIsOpen } } = useRestaurantMenuContext();

  const extractCategoryIdFromUrl = (urlCategory: string) => {
    const parts = urlCategory.split('/');
    return parseInt(parts.pop()!);
  }*/

  const handleDishForm = () => {
    if(!reservation){
      navigate(paths.ROOT + "/createReservation");
    } 
    /*else if (auth.roles[0] === "ROLE_RESTAURANT") {
      setDish(dish);
      setCategoryId(extractCategoryIdFromUrl(dish.category));
      setEditDishIsOpen(true);
    } */
    else if (reservation || (reservation && auth.roles[0] === "ROLE_RESTAURANT")) {
      setCardOpen(!isCardOpen);
    }
  };

  return (
  <>
    {reservation?.securityCode && <ConfirmDishForm isOpen={isCardOpen} handleOpen={handleDishForm} dish={dish!}/>}
    <Link className="dishCardHover" style={linkStyle} onClick={handleDishForm} color="inherit" underline="none">
      <img src={dish.image}  alt="la foto del plato" style={{objectFit:"cover", width: 110, borderRadius: ".8rem", aspectRatio: 1, marginRight: 20}}/>
      <div>
        <Typography variant="h6">{dish.name}</Typography>
        <Typography variant="body1">{dish.description}</Typography>
        <Typography variant="caption" style={{textDecoration}} marginRight={discount? 1 : 0}>${dish.price}</Typography>
        {discount && <Typography variant="caption" color="blue">${0.75 * dish.price}</Typography>}
      </div>
    </Link>
  </>
  );
}


export default DishCard;

