
const printer = () => {

    let sdk = new epson.ePOSDevice();
    let printer = null
    let ip = '192.168.1.14'
    let port = '8008'
    let options = { 
        'crypto': false,
        'buffer': true
    }

    sdk.connect(ip, port, callback_connect)
    
    function callback_connect(result) {
        sdk.createDevice('local_printer', sdk.DEVICE_TYPE_PRINTER, options, callback_createDevice)
    }
    
    function callback_createDevice(obj, err) {
        
        if (obj) {
            printer = obj
            console.log(printer)
        }
    }
}

// export default the printer
export default printer


