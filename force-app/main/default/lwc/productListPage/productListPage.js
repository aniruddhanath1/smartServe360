import { LightningElement } from 'lwc';

export default class ProductList extends LightningElement {
   
    products = Array.from({ length: 24 }, (_, i) => ({
        id: i + 1,
        name: `Product ${i + 1}`,
        price: (Math.random() * 100 + 10).toFixed(2),
        image: 'https://via.assets.so/watch.png?id='+this.generateRandomNumber() +'&q=95&w=360&h=360&fit=fill'
 
    }));

    generateRandomNumber() {
        return String(Math.floor(Math.random() * 100) + 1);
    }

    handleAddToCart(event) {
        const productName = event.target.closest('.product-card').querySelector('.product-name').textContent;
        // Simulate a cart action
        console.log(`Added to cart: ${productName}`);
        // Optionally, show a toast or UI feedback
    }
}