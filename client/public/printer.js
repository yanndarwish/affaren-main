const printer = async(arg_1, arg_2, arg_3, arg_4, arg_5) => {

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
            printer = obj
            if (arg_1 === undefined) {
                printer.addPulse(printer.DRAWER_1,printer.PULSE_100)
                printer.send()
            } else if (arg_1 !== undefined && arg_5 === undefined) {
                // arg_1 = products
                // arg_2 = arg_2
                // arg_3 = total
                // arg_4 = time
                printer.addLayout(printer.LAYOUT_RECEIPT, 580,0,50,4,0,0)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addTextFont(printer.FONT_B)
                printer.addText('Bienvenue chez')
                printer.addFeedLine(1)
                printer.addTextSize(2,2)
                printer.addText('AFFÄREN')
                printer.addFeedLine(1)
                printer.addTextSize(1,1)
                printer.addText('Välkommen')
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
                printer.addText(`Date: ${arg_4.day}/${arg_4.month}/${arg_4.year}\t ${getTime()}\n`)
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
            
                for(let i = 0; i < arg_1.length; i++) {
                    printer.addTextAlign(printer.ALIGN_LEFT)
                    printer.addTextPosition(50)
                    printer.addText(i+1)
                    printer.addTextPosition(100)
                    printer.addText(arg_1[i].product_name)
                    printer.addTextPosition(450)
                    printer.addText(arg_1[i].product_quantity)
                    printer.addTextPosition(500)
                    printer.addText(Math.round((arg_1[i].product_price * arg_1[i].product_quantity) *100)/100 + '\n')
                }

                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addTextPosition(100)
                printer.addText(arg_1.length > 1 ? `${arg_1.length} articles\n` : `${arg_1.length} article\n`)
                printer.addTextSize(2,2)
                printer.addTextPosition(100)
                printer.addText('TOTAL À PAYER')
                printer.addTextPosition(400)
                printer.addText(Math.round(arg_3 *100)/100 + ' €' + '\n')
                printer.addTextSize(1,1)
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)

                for (const property in arg_2) {
                    let prop
                    if (arg_2[property] !== 0) {
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
                        printer.addText(Math.round(arg_2[property] *100)/100 + '\n')
                    }
                }
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addText('Merci de votre visite et à bientôt !\n')
                printer.addText('Hejdå !\n')
                printer.addFeedLine(1)
                printer.addCut(printer.CUT_FEED)
                printer.send()
            } else if (arg_5 !== undefined) {
                // arg_1 = filteredSales
                // arg_2 = time
                // arg_3 = todaysTotalCash
                // arg_4 = todaysTotalCard
                // arg_5 = todaysTotalCheck
                let totalAlim = 0
                let totalMag = 0
                let totalDeco = 0
                let totalTva1 = 0
                let totalTva2 = 0
                let totalTva3 = 0
                let totalTva = 0
                let totalHt1 = 0
                let totalHt2 = 0
                let totalHt3 = 0
                let totalHt = 0
                let totalCash = arg_3
                let totalCard = arg_4
                let totalCheck = arg_5
                let total = 0
                for (let i = 0; i < arg_1.length; i++) {
                    totalAlim += Math.round(arg_1[i].total_1 *100)/100
                    totalMag += Math.round(arg_1[i].total_2 *100)/100
                    totalDeco += Math.round(arg_1[i].total_3 *100)/100
                    totalTva1 += Math.round(arg_1[i].tva_1 *100)/100
                    totalTva2 += Math.round(arg_1[i].tva_2 *100)/100
                    totalTva3 += Math.round(arg_1[i].tva_3 *100)/100
                    totalTva += Math.round(arg_1[i].taxe_amount *100)/100
                    totalHt1 += Math.round(arg_1[i].hors_taxe_1 *100)/100
                    totalHt2 += Math.round(arg_1[i].hors_taxe_2 *100)/100
                    totalHt3 += Math.round(arg_1[i].hors_taxe_3 *100)/100
                }
                totalHt += Math.round((totalHt1 + totalHt2 + totalHt3) *100)/100
                total = Math.round((totalHt + totalTva) *100)/100
                printer.addLayout(printer.LAYOUT_RECEIPT, 580,0,50,4,0,0)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addTextFont(printer.FONT_B)
                printer.addText(`TOTAL DU JOUR\n`)
                printer.addText(`${arg_2.day}/${arg_2.month}/${arg_2.year}`)
                printer.addFeedLine(1)
                const getTime = () => {
                    const date = new Date();
                    const time = date.toLocaleTimeString();
                    return time;
                }
                printer.addText(`${getTime()}\n`)
                printer.addFeedLine(1)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addText('Total Alimentation 5.5%\n')
                printer.addText(`${Math.round(totalAlim * 100 ) / 100}\n`)
                printer.addText('Total Magazine 2.1%\n')
                printer.addText(`${Math.round(totalMag * 100 ) / 100}\n`)
                printer.addText('Total Décoration 20%\n')
                printer.addText(`${Math.round(totalDeco * 100 ) / 100}\n`)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addFeedLine(1)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addText('Total HT Alimentation\n')
                printer.addText(`${Math.round(totalHt1 * 100 ) / 100}\n`)
                printer.addText('Total HT Magazine\n')
                printer.addText(`${Math.round(totalHt2 * 100 ) / 100}\n`)
                printer.addText('Total HT Décoration\n')
                printer.addText(`${Math.round(totalHt3 * 100 ) / 100}\n`)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addText('Total TVA 5.5%\n')
                printer.addText(`${Math.round(totalTva1 * 100 ) / 100}\n`)
                printer.addText('Total TVA 2.1%\n')
                printer.addText(`${Math.round(totalTva2 * 100 ) / 100}\n`)
                printer.addText('Total TVA 20%\n')
                printer.addText(`${Math.round(totalTva3 * 100 ) / 100}\n`)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addFeedLine(1)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addText('Total HT\n')
                printer.addText(`${Math.round(totalHt * 100 ) / 100}\n`)
                printer.addText('Total TVA\n')
                printer.addText(`${Math.round(totalTva * 100 ) / 100}\n`)
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addFeedLine(1)
                printer.addText('--------------------------------------\n')
                printer.addFeedLine(1)
                printer.addTextAlign(printer.ALIGN_LEFT)
                printer.addText('Total Cash\n')
                printer.addText(`${Math.round(totalCash * 100 ) / 100}\n`)
                printer.addText('Total Card\n')
                printer.addText(`${Math.round(totalCard * 100 ) / 100}\n`)
                printer.addText('Total Check\n')
                printer.addText(`${Math.round(totalCheck * 100 ) / 100}\n`)
                printer.addFeedLine(1)
                printer.addText('TOTAL\n')
                printer.addTextAlign(printer.ALIGN_CENTER)
                printer.addText(`${Math.round(total * 100 ) / 100}\n`)
                printer.addFeedLine(1)
                printer.addCut(printer.CUT_FEED)
                printer.send()
            }
        }
    }
}

// export default the printer
export default printer


