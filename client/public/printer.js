
const printer = async(products, taxes, total, time ) => {

    let sdk = new epson.ePOSDevice();
    let printer = null
    let ip = '192.168.1.14'
    let port = '8008'
    let options = { 
        'crypto': false,
        'buffer': true
    }
    let phone = '0142819175'
    let address = '3 bis rue Léon Jost 75017 Paris'
    let mail = 'svenskaaffarenparis@gmail.com'

    await sdk.connect(ip, port, callback_connect, {"eposprint": true})
    
    async function callback_connect(result) {
        await sdk.createDevice('local_printer', sdk.DEVICE_TYPE_PRINTER, options, callback_createDevice)
    }
    
    function callback_createDevice (obj, err) {
        
        if (obj) {
            console.log(products === undefined)
            console.log(arguments.length)
            printer = obj
            if (products === undefined) {
                printer.addPulse(printer.DRAWER_1,printer.PULSE_100)
                printer.send()
            } else {
                printer.addLayout(printer.LAYOUT_RECEIPT, 580,0,50,4,0,0)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addTextFont(printer.FONT_B)
                printer.addText('Bienvenue chez')
                printer.addFeedLine(1)
                printer.addTextSize(2,2)
                printer.addText('AFFÄREN')
                printer.addTextSize(1,1)
                printer.addFeedLine(2)
                printer.addText(address + '\n')
                printer.addText(mail + '\n')
                printer.addText(phone + '\n')
                printer.addText('Mardi au samedi de 11h à 18h30\n')
                printer.addText('Dimanche de 12h à 17h\n')
                printer.addFeedLine(2)
                const getTime = () => {
                    const date = new Date();
                    const time = date.toLocaleTimeString();
                    return time;
                }
                printer.addText(`Date: ${time.day}/${time.month}/${time.year}\t ${getTime()}\n`)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addTextPosition(50)
                printer.addText('n°')
                printer.addTextPosition(100)
                printer.addText('Produit')
                printer.addTextPosition(450)
                printer.addText('Qté')
                printer.addTextPosition(500)
                printer.addText('Prix\n')
                printer.addFeedLine(1)
            
                for(let i = 0; i < products.length; i++) {
                    printer.addTextAlign(printer.ALIGN_LEFT)
                    printer.addTextPosition(50)
                    printer.addText(i+1)
                    printer.addTextPosition(100)
                    printer.addText(products[i].product_name)
                    printer.addTextPosition(450)
                    printer.addText(products[i].product_quantity)
                    printer.addTextPosition(500)
                    printer.addText(Math.round((products[i].product_price * products[i].product_quantity) *100)/100 + '\n')
                }

                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addTextPosition(100)
                printer.addText(products.length > 1 ? `${products.length} articles\n` : `${products.length} article\n`)
                printer.addTextSize(2,2)
                printer.addTextPosition(100)
                printer.addText('TOTAL À PAYER')
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
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addText('Merci de votre visite et à bientôt !\n')
                printer.addFeedLine(1)
                printer.addCut(printer.CUT_FEED)
                printer.addPulse(printer.DRAWER_1,printer.PULSE_100)
                printer.send()
            }
        }
    }
}

// export default the printer
export default printer


