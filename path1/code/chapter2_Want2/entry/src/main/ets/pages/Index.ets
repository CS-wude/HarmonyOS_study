import common from '@ohos.app.ability.common';
import wantConstant from '@ohos.ability.wantConstant';

@Entry
@Component
struct Index {
  //@State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
      //   Text(this.message)
      //     .fontSize(50)
      //     .fontWeight(FontWeight.Bold)
      //
        Button('启动')
          .fontSize(40)
          .onClick(this.implicitStartAbility)
      }
      .width('100%')
    }
    .height('100%')
  }

  async implicitStartAbility(){
    try {
      let want = {
        //"action": wantConstant.Action.ACTION_MANAGE_APPLICATIONS_SETTINGS
        action: "ohos.want.action.viewData"
      }
      let context = getContext(this) as common.UIAbilityContext;
      await context.startAbility(want)
      console.info('implicit start ability succeed')
    } catch (error){
      console.info('implicit start ability failed with ${error.code}')
    }
  }
}