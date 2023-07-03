export const TRANSLATIONS_EN = {
    navBar: {
        customerPages:{
            reservations: "Reservations",
            profile: "Profile"
        },
        restaurantPages:{
            menu: "Menu",
            kitchen: "Kitchen",
            reservations: "Reservations"
        },
        loginButton: "Login",
        registerButton: "Register",
        logoutButton: "Logout"
    },
    restaurantHeader:{
        menuHeader: "Menu",
        makeReservation: "Make reservation",
        haveReservation: "Have reservation",
        myReservation: "My reservation",
        createCategory: "Create category"
    },
    loginPage: {
        loginTitle: "Login",
        usernameInput: "Username",
        label:{
            username: "Username",
            password: "Password"
        },
        formSubmit:{
            login: "Login",
            loading: "Loading"
        },
        rememberMe: "Remember me",
        forgotPassword: "Forgot password?",
        registerCallToAction: "Don't have an account? Sign Up!"
    },
    validationSchema:{
        required: "Required",
        mailValidation: "Enter valid email",
        passwordMatch: "Password must match",
        passwordLength: "Minimun {{length}} caracters long",
        positiveValidation: "Must be greater than 0",
        dateValidation: "Date cannot be in the past",
        secCodeValidation: "Must be {{length}} characters long"
    },
    createReservation:{
        pageTitle: "Create reservation",
        step1:{
            stepTitle: "How many?",
            stepDescription: "How many people will come?"
        },
        step2:{
            stepTitle: "Date?",
            stepDescription: "Which day do you want to come?"
        },
        step3:{
            stepTitle: "Hour?",
            stepDescription: "At what time do you wish to attend? sittings last 1 hour.",
            selectLabel: "Select one"
        },
        step4:{
            stepTitle: "Contact info",
            stepDescription: "We need some info to confirm your reservation",
            firstName: "First name",
            lastName: "Last name",
            mail: "Mail",
            phone: "Phone",
        },
        step5:{
            stepTitle: "Done!",
            stepDescription: "You made a reservation on Atuel, for {{date}} at {{hour}}hs for {{qPeople}} people. Your reservation code is: {{secCode}}"
        },
        next: "Next",
        back: "Back",
        makeReservaton: "Place reservation",
        continueWithoutSigning: "Continue without signing up",
        signUp: "Sign up",
        goToReservation: "Continue to reservation",

    },
    reservationData:{
        title: "My reservation",
        customer: "Customer: {{customer}}",
        code: "Code: {{code}}",
        date: "Date: ",
        hour: "Hour: {{hour}}:00",
        table: "Table: {{table}}"
    },
    reservationsPage:{
        tabs:{
            all: "All",
            open: "Open",
            seated: "Seated",
            checkOrdered: "Check Ordered",
            finished: "Finished",
            cancelled: "Cancelled"
        },
        tableHeaders:{
            code: "Code",
            customer: "Customer",
            date: "Date",
            hour: "Hour",
            table: "Table",
            people: "People"
        },
        sortBy: "Sort By:",
    },
    shoppingCart:{
        cartPanel:{
            title: "Shopping Cart",
            recommendationTitle: "Other people also ordered:",
            noRecommendation: "We can't recommend anything",
            orderItems: "Order items",
            clearItems: "Clear items"
        },
        ordersPanel:{
            title: "Orders",
            disclaimer: "Your orders status will be seen when you arrive at the restaurants",
            orderedStatus: "Ordered",
            cookingStatus: "Cooking",
            deliveringStatus: "Delivering"
        },
        checkPanel:{
            title: "Summary",
            orderCheck: "Order Check"
        },
        tableHeaders:{
            dish: "Dish",
            qty: "Qty",
            subtotal: "Subtotal",
            status: "Status"
        }
    },
    restaurantMenu:{
        editCategory: "Edit category",
        deleteCategory: "Delete category"
    },
    dishDisplay:{
        createDish: "Create dish"
    },
    kitchenPage:{
        orderedTitle: "Ordered",
        cookingTitle: "Cooking",
        deliveredTitle: "Delivered",
        kitchenHeaders:{
            dish: "Dish",
            qty: "Quantity",
            table: "Table"
        },
        cookAction: "Cook",
        deliverAction: "Deliver",
        doneAction: "Done",
        emptyTable: "There are no orders here"

    },
    customerReservations:{
        points: "Points: {{points}}",
        activeReservationsTitle: "Active Reservations",
        oldReservationsTitle: "Reservation history",
        reservationCard:{
            date: "date: ",
            hour: "hour: {{hour}}:00",
            code: "code: {{code}}",
            people: "people: {{people}}"
        },
        enterButton: "Enter"
    },
    registerPage:{
        registerTitle: "Sign up",
        registerButton: "sign up",
        loginCallToAction: "Already have an account? login!",
        label:{
            mail: "Mail",
            name: "Name",
            username: "Username",
            phone: "Phone",
            password: "Password",
            passwordRepeat: "Repeat password"
        }
    },
    profilePage: {
        title: "Profile",
        accountInfo:{
            title: "Account info:",
            restaurantName: "Restaurant name: {{name}}",
            username: "Username: {{username}}",
            mail: "Mail: {{mail}}",
            phone: "Phone: {{phone}}",
            clientName: "Name: {{customer}}",
            points: "Points: {{points}}"
        },
        restaurantInfo:{
            title: "Restaurant info:",
            chairs: "Chairs: {{chairs}}",
            openHours: "Open hour: {{hour}}:00",
            closeHours: "Close hour: {{hour}}:00"
        },
        editButton: "Edit"
    },
    forms:{
        accountInfo:{
            title: "Account info",
            description: "Write the fields you want to be modified",
            restaurantName: "Restaurant Name",
            customerName: "Customer Name",
            username: "Username",
            mail: "Mail",
            phone: "Phone",
            password: "Password",
            passwordRepeat: "Repeat password"
        },
        authReservation:{
            title: "Reservation security code",
            description: "Enter the security code given in the email we sent you.",
            label: "Reservation Code",
        },
        createCategory:{
            title: "Create category",
            description: "Enter the name of the new category",
            label: "Enter new category name"
        },
        confirmDish:{
            dishPrice: "Price: ${{price}}",
            subtotal: "Subtotal: ${{subtotal}}",
            addToCart: "Add to cart"
        },
        createDish:{
            title: "Create Dish",
            createButton: "Create",
            name: "Name",
            price: "Price",
            description: "Description",
            category: "Category",
        },
        editCategory:{
            title: "Edit category",
            description: "Enter the new name of the category",
            label: "Category name"
        },
        editDish:{
            title: "Dish edition",
            description: "Edit any or all the fields you want changed",
            name: "Name",
            dishDescription: "Description",
            price: "Price",
            category: "Category",
        },
        restaurantInfo:{
            title: "Restaurant info",
            description: "Write the fields you want to be modified",
            openHour: "Open hour",
            closeHour: "Close hour",
            chairs: "Chairs"
        },
        confirmButton: "Confirm",
        select: "Select one",
        cancelButton: "Cancel"
    },
    systemError: "There was an error in the system. Try again later."
}