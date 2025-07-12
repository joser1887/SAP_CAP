namespace com.logaligroup;

type u_Decimal : Decimal(5, 3);

entity Products {
    key ID          : UUID;
        Product     : String(8);
        ProductName : String(80);
        Description : LargeString;
        category    : String;
        SubCategory : String;
        Status      : String;
        Price       : Decimal(8, 2);
        Rating      : Decimal(3, 2);
        Currency    : String;
        detail      : Association to ProductDetails;
};

entity ProductDetails {
    key ID         : UUID;
        BaseUnni   : String default 'EA';
        Width      : u_Decimal;
        Height     : u_Decimal;
        Depth      : u_Decimal;
        Weigth     : u_Decimal;
        UnitVolume : String default 'CM';
        UnitWeight : String default 'KG';
        
};

/** Value Helps */
entity Category {
    key ID            : UUID;
        Category      : String(80);
        toSubCategory : Association to many SubCategories
                            on toSubCategory.Category = $self;
};

entity SubCategories {
    key ID          : UUID;
        SubCategory : String(80);
        Category    : Association to Category;
}
