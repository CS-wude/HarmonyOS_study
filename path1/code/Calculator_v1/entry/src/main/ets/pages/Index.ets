@Entry
@Component
struct Index {
  private btTexts: string[]=[
    'ce','c','x','/',
    '7','8','9','+',
    '4','5','6','-',
    '1','2','3','=',
    '0','.'
  ]

  build() {

      Column() {
        Text()
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
}