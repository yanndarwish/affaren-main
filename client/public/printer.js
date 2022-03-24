
const printer = async(products, taxes, total ) => {

    let sdk = new epson.ePOSDevice();
    let printer = null
    let ip = '192.168.1.14'
    let port = '8008'
    let options = { 
        'crypto': false,
        'buffer': true
    }
    let phone = '0142819175'
    let address = '3bis rue Léon Jost 75017 Paris'
    let mail = 'svenskaaffarenparis@gmail.com'

    await sdk.connect(ip, port, callback_connect)
    
    async function callback_connect(result) {
        await sdk.createDevice('local_printer', sdk.DEVICE_TYPE_PRINTER, options, callback_createDevice)
    }
    
    function callback_createDevice (obj, err) {
        
        if (obj) {
            printer = obj
            console.log(printer)
            printer.addLayout(printer.LAYOUT_RECEIPT, 580,0,50,4,0,0)
            printer.addTextAlign(printer.ALIGN_CENTER)
            printer.addTextFont(printer.FONT_B)
            printer.addText('AFFÄREN')
            printer.addFeedLine(2)
            printer.addText(address + '\n')
            printer.addText(mail + '\n')
            printer.addText(phone + '\n')
            printer.addFeedLine(2)
            printer.addText('--------------------------------------\n')
            printer.addFeedLine(1)
            
            for(let i = 0; i < products.length; i++) {
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addTextPosition(20)
                printer.addText(i+1)
                printer.addTextPosition(100)
                printer.addText(products[i].product_name)
                printer.addTextPosition(500)
                printer.addText(Math.round(products[i].product_price *100)/100 + '\n')
            }
            printer.addFeedLine(1)
            printer.addTextAlign(printer.ALIGN_CENTER)
            printer.addText('--------------------------------------\n')
            printer.addFeedLine(1)
            printer.addTextAlign(printer.ALIGN_LEFT)
            printer.addTextPosition(100)
            printer.addTextSize(2,2)
            printer.addText('TOTAL')
            printer.addTextPosition(400)
            printer.addText(Math.round(total *100)/100 + ' €' + '\n')
            printer.addTextSize(1,1)
            printer.addFeedLine(1)
            printer.addTextAlign(printer.ALIGN_CENTER)
            printer.addText('--------------------------------------\n')
            printer.addFeedLine(1)

            for (const property in taxes) {
                let prop
                if (taxes[property] !== 0) {
                    if (property === 'total_1') {
                    prop = 'Total alimentation'
                    } else if (property === 'total_2') {
                        prop = 'Total magazine'
                    } else if (property === 'total_3') {
                        prop = 'Total décoration'
                    }
                    if (property === 'ht_1') {
                        prop = 'HT alimentation'
                    } else if (property === 'ht_2') {
                        prop = 'HT magazine'
                    } else if (property === 'ht_3') {
                        prop = 'HT décoration'
                    }
                    if (property === 'tva_1') {
                        prop = 'TVA 5.5%'
                    } else if (property === 'tva_2') {
                        prop = 'TVA 2.1%'
                    } else if (property === 'tva_3') {
                        prop = 'TVA 20%'
                    }
                    if (property === 'total_tva') {
                        prop = 'Total TVA'
                    }


                    printer.addTextAlign(printer.ALIGN_LEFT)
                    printer.addTextPosition(100)
                    printer.addText(prop)
                    printer.addTextPosition(500)
                    printer.addText(Math.round(taxes[property] *100)/100 + '\n')
                }
            }
            printer.addFeedLine(1)

            printer.addCut(printer.CUT_FEED)
            printer.send()
        }
    }


}

// export default the printer
export default printer


