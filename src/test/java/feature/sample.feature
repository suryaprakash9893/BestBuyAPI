Feature: print hello world

Scenario: Hello world scenario

* print 'hello'
* print 'My first karate'

Scenario: Calculator

* def price = 200
* def fee = 20
* def total = (price + fee)
* print 'Total amount=' + total


Scenario: parse json reader
* def jsonObject =
"""
{
    "total": 51961,
    "limit": 1,
    "skip": 5190,
    "data": [
        {
            "id": 2158086,
            "name": "Emtec - Swivel Series 8GB USB 2.0 Flash Drive - Black",
            "type": "HardGood",
            "price": 8.99,
            "upc": "846143002668",
            "shipping": 0,
            "description": "EMTEC Swivel Series 8GB USB 2.0 Flash Drive: Read speeds up to 18MB/sec.; write speeds up to 8MB/sec.; works with PC, Mac and Linux; capless swivel design; rubber-coated finish; mustache pattern",
            "manufacturer": "Emtec",
            "model": "EKMMD8GM434",
            "url": "http://www.bestbuy.com/site/emtec-swivel-series-8gb-usb-2-0-flash-drive-black/2158086.p?id=1219530049467&skuId=2158086&cmp=RMXCC",
            "image": "http://img.bbystatic.com/BestBuy_US/images/products/2158/2158086_sa.jpg",
            "createdAt": "2016-11-17T17:59:24.820Z",
            "updatedAt": "2016-11-17T17:59:24.820Z",
            "categories": [
                {
                    "id": "abcat0500000",
                    "name": "Computers & Tablets",
                    "createdAt": "2016-11-17T17:57:04.285Z",
                    "updatedAt": "2016-11-17T17:57:04.285Z"
                },
                {
                    "id": "abcat0504010",
                    "name": "USB Flash Drives",
                    "createdAt": "2016-11-17T17:57:04.285Z",
                    "updatedAt": "2016-11-17T17:57:04.285Z"
                },
                {
                    "id": "abcat0515000",
                    "name": "Computer Accessories & Peripherals",
                    "createdAt": "2016-11-17T17:57:04.285Z",
                    "updatedAt": "2016-11-17T17:57:04.285Z"
                }
            ]
        }
    ]
}
"""

* print jsonObject.data[0].categories[1].name
