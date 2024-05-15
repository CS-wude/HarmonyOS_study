import router from '@ohos.router';

@Entry
@Component
struct Second {
  @State message: string = 'Second页面'
  @State src: string = router.getParams()?.['src'];

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text(this.src)
          .fontSize(30)

        Button('返回')
          .fontSize(40)
          .onClick(() => {
            router.back();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}