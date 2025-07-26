namespace com.logaligroup;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

type u_Decimal : Decimal(5, 3);

entity Products : cuid, managed {
    key Product       : String(8);
        ProductName   : String(80);
        Description   : LargeString;
        category      : Association to Category;
        SubCategory   : Association to SubCategories;
        Status        : Association to Status; // Status statu_code
        Price         : Decimal(8, 2);
        Rating        : Decimal(3, 2);
        Currency      : String;
        detail        : Association to ProductDetails;
        supplier      : Association to Suppliers;
        toReviews     : Association to Reviews
                            on toReviews.Product = $self;
        toInventories : Association to Inventories
                            on toInventories.Product = $self;
        toSales       : Association to Sales
                            on toSales.product = $self;
};

entity Suppliers : cuid {
    supplier     : String(10);
    supplierName : String(40);
    webAddress   : String(250);
    contact      : Association to Contacts;
};

entity Contacts : cuid {
    fullName    : String(40);
    email       : String(80);
    phoneNumber : String(14);
};

entity Reviews : cuid {
    rating     : Decimal(3, 2);
    date       : Date;
    reviewText : LargeString;
    User : String(20);
    Product    : Association to Products;
};

entity Inventories : cuid {
    stockNumber : String(7);
    deparment   : Association to Departments;
    min         : Integer;
    max         : Integer;
    target      : Integer;
    quantiti    : Decimal(4, 3);
    baseUnit    : String default 'EA';
    Product     : Association to Products;
};

entity Sales : cuid {
    moth          : String(3);
    monthName     : String(20);
    quantitySales : Integer;
    year          : String(4);
    product       : Association to Products;
}


entity ProductDetails : cuid {
    BaseUnni   : String default 'EA';
    Width      : u_Decimal;
    Height     : u_Decimal;
    Depth      : u_Decimal;
    Weigth     : u_Decimal;
    UnitVolume : String default 'CM';
    UnitWeight : String default 'KG';

};

/** Code List */
//1 = Rojo
//2 = Amarillo
//3 = Verde
entity Status : CodeList {
    key Code       : String(20) enum {
            InStock = 'In Stock';
            OutStock = 'Out of Stock';
            LowAvailability = 'Low Availability';
        };
        criticality : Int16;
}

/** Value Helps */
entity Category : cuid {
    Category      : String(80);
    toSubCategory : Association to many SubCategories
                        on toSubCategory.Category = $self;
};

entity SubCategories : cuid {
    SubCategory : String(80);
    Category    : Association to Category;
};

entity Departments : cuid {
    deparment : String(40);
}
