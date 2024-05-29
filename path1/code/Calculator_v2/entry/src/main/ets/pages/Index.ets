@Entry
@Component
struct Index {

  private btTexts: string[]=[
    'ce','c','x','÷',
    '7','8','9','+',
    '4','5','6','-',
    '1','2','3','=',
    '0','.'
  ]
  @State input: string = ''

  build() {

    Column() {
      Text(this.input)
        .fontSize(30)
        .width('100%')
        .height(80)
        .backgroundColor(Color.Orange)
      Grid(){
        ForEach(this.btTexts,(value)=>{
          GridItem(){
            this.BtItem(value)
          }
          .backgroundColor(Color.Gray)
          .rowStart(value == '=' ? 3:null)
          .rowEnd(value == '=' ? 4:null)
          .columnStart(value == '0' ? 0:null)
          .columnEnd(value == '0' ? 1:null)
          .onClick(() => {
            this.onBtClick(value)
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(2)
      .rowsGap(2)
      .aspectRatio(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)


  }
  @Builder BtItem(btInfo:string){
    Text(btInfo)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }

  onBtClick(value: string){
    //var split=[]
    switch(value){
      case 'ce':
        this.input = ''
        break;
      case 'c':
        this.input = this.input.substring(0, this.input.length - 1)
        break;
      case '=':
        this.input = this.calculate(this.transInputToSplit(this.input))
        break;
      default:
        this.input = this.input + value
        break;
    }
  }

  transInputToSplit(input:string):string[]{
    var index=[0];
    var split=[]

    for(let i = 0; i < input.length; i++){
      if(input[i].match(RegExp('(\\+|-|x|÷)'))){
        index.push(i)
        index.push(i+1)
      }
    }
    index.push(input.length)
    for(let j = 0; j < index.length-1; j++){
      split.push(input.slice(index[j],index[j+1]))
    }
    return split
  }
  calculate(split:string[]):string{
    var num1:number
    var num2:number
    var result:number=0
    var symbol:string
    var symbolIndex:number
    for(let i = 0; i < split.length; i++){
      if(split[i].match(RegExp('^(x|÷)$'))){
        symbolIndex=i
        break;
      }
    }
    if(symbolIndex==null){
      for(let i = 0; i < split.length; i++){
        if(split[i].match(RegExp('^(\\+|-)$'))){
          symbolIndex=i
          break;
        }
      }
    }
    if(symbolIndex==null){
      return split[0]
    }else{
      num1 = +split[symbolIndex-1]
      num2 = +split[symbolIndex+1]
      symbol=split[symbolIndex]
      switch (symbol){
        case '+':
          result=num1+num2
          break;
        case '-':
          result=num1-num2
          break;
        case 'x':
          result=num1*num2
          break;
        case '÷':
          result=num1/num2
          break;
      }
      split=split.slice(0,symbolIndex-1).concat(`${result}`).concat(split.slice(symbolIndex+2))
      return this.calculate(split)
    }
  }
}