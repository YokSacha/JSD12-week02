let pricePackage = [
    { id: "PKG_10", name: "Basic Pack", quantity: 10, price: 1000 },
    { id: "PKG_20", name: "Growth Pack", quantity: 20, price: 1500 }
]

let employer = {
    companyName: "ABC Co Ltd",
    employerID: "202601001",
    taxID: "1234567890",
    serviceType: "Basic Pack",
    creditsRemaining: "0",
    totalSpent: "0",
    JobID: "0010024",
}

function buyPackage (employer,pricePackage) {
    const vatRate = 1.07;
    const totalVat = pricePackage.price*vatRate;
}

employer.creditsRemaining += pricePackage;
employer.totalSpent += totalVat;


console.log(Employer);










/*class Transaction {
    constructor(transactionID,employerID,amount,serviceType,JobID){
        this.transactionID = transactionID;
        this.employerID = employerID;
        this.amount = amount;
        this.serviceType = serviceType;
        this.JobID = JobID;
        this.payDate = new Date();
    }
}*/



/*let productList = ["product_id_1","product_id_2","product_id_3"];

const product_A = {
    productID: "product_id_1",
    productName: "Macbook",
    price: 199
}

let cart = [
    {
        productId: "product_id_1",
        quantity: 10,
    }
]

product_A = {
    productID: "product_id_1",
    productName: "Macbook",
    price: 199
};

console.log(productList);
console.log(product_A);
console.log(cart);
*/