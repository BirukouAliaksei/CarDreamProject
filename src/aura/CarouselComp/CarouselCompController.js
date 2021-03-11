({
    listAction: function (component, event, helper) {

        let name = ["Carousel1", "Carousel2", "Carousel3"];
        let header = ["Card1", "Card2", "Card3"];
        let AlternativeText = ["Text1", "Text2", "Text3"];
        let ImageUrl = ["https://www.salesforce.com’,’https://www.salesforce.com’,’https://www.salesforce.com"];
        let b = ["1", "2", "3", "4", "5"];
        let list1 = [];
        let a = name.length;

        for (let i = 0; i < a; i++) {
            list1.push({
                image: $A.get('$Resource.' + name[i]),
                Header: header[i],
                AlterText: AlternativeText[i],
                imgUrl: ImageUrl[i]
            });
        }
        component.set("v.listsOfImg", list1);
    }
})