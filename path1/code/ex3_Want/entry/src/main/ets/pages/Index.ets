//import context from '@ohos.app.ability.context';
//应该是HarmonyOS SDK版本升级了，所以原有的模块名称做了变更。估计是OpenHarmony SDK从3.1更新到3.2导致的。
//解决链接：https://waylau.com/cannot-find-module-ohos-application-context/
import common from '@ohos.app.ability.common';

@Entry
@Component
struct Index {
  @State message: string = 'Index'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('启动')
          .fontSize(40)
          .onClick(this.explicitStartAbility)
      }
      .width('100%')
    }
    .height('100%')
  }

  async explicitStartAbility(){
    try{
      let want = {
        deviceId: "",
        bundleName: "com.hmos.myapplication",
        abilityName: "SecondAbility"
      };
      //let context = getContext(this) as context.AbilityContext;
      let context = getContext(this) as common.UIAbilityContext;
      await context.startAbility(want);
      console.info('explicit start ability succeed');
    }catch (error) {
      console.info('explicit start ability faild with ${error.code}');
    }
  }
}