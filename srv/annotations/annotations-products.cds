using {ProductSRV as service} from '../service';

annotate service.Product with {
    Product     @title: 'Product';
    ProductName @title: 'Producto Name';
    Description @title: 'Description';
    category    @title: 'Category';
    SubCategory @title: 'Sub Category';
    Status      @title: 'Estatus';
    Price       @title: 'Price'     @Measures.ISOCurrency: Currency;
    Rating      @title: 'Rating';
    Currency    @title: 'Currency'  @Common.IsCurrency;
    supplier    @title: 'Supplier';
};

annotate service.Product with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: Product
    },
    {
        $Type: 'UI.DataField',
        Value: ProductName
    },
    {
        $Type: 'UI.DataField',
        Value: supplier_ID
    },
    {
        $Type: 'UI.DataField',
        Value: category_ID
    },
    {
        $Type: 'UI.DataField',
        Value: SubCategory_ID
    },

    {
        $Type: 'UI.DataField',
        Value: Rating
    },
    {
        $Type      : 'UI.DataField',
        Value      : Status_Code,
        Criticality: Status.criticality
    },
    {
        $Type                : 'UI.DataField',
        Value                : Price,
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '10rem'
        }
    }
], );
