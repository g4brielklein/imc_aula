class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _mensagem= "Por favor informe seus dados";


  void _reset(){
    pesoController.text="";
    alturaController.text="";
    setState(() {
      _mensagem="Por favor informe seus dados";
      _formKey= GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions:[
          IconButton(onPressed: _reset, icon:Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,/// fazer
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_outline, size: 100, color: Colors.blue,),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso em quilos",
                        labelStyle: TextStyle(color: Color(0XFF1921D2), fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                    style: TextStyle (color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                    controller: pesoController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe o seu peso!";
                      }
                    }
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Sua altura em CM",
                        labelStyle: TextStyle(color: Color(0XFF1921D2), fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                    style: TextStyle (color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                    controller: alturaController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe sua altura!";
                      }
                    }
                ),
                
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    height: 60,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          ///executa algo
                          _calcular();
                        }
                      },
                      child: Text("Calcular",
                        style: TextStyle(color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Text(_mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                  
                )
              ],
            )
        ),
      ),
    );
  }
