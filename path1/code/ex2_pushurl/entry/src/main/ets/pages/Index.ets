import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Index页面'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('跳转')
          .fontSize(40)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Second',
              params: {
                src: 'Index传来的数据',
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}