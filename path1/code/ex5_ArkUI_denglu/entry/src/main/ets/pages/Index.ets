@Entry
@Component
struct Index {
  //@State message: string = 'Hello World'

  build() {
    /*Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')*/
    Column(){
      Image($r('app.media.app_icon'))
        .width(181)
        .height(181)
        .margin({top: 80, bottom: 80})

      TextInput({ placeholder: '请输入账号'})
        .maxLength(80)
        .type(InputType.Number)

      TextInput({ placeholder: '请输入密码'})
        .maxLength(80)
        .type(InputType.Password)

      Button(('登录'), {type: ButtonType.Capsule})
        .width(140)
        .fontSize(40)
        .fontWeight(FontWeight.Medium)
        .margin({top: 80, bottom: 20})

      Text('注册')
        .fontColor(Color.Blue)
        .fontSize(40)
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
  }
}