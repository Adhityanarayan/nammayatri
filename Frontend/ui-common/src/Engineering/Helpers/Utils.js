const JBridge = window.JBridge;

export const toggleLoaderIOS = function(flag){
  console.log("inside toggle loader")
  return JBridge.toggleLoader(flag);
}

export const loaderTextIOS = function(mainTxt, subTxt){
  console.log("inside loader Text IOS")
  return JBridge.loaderText(mainTxt,subTxt);
}

export const getFromWindow = function (key) {
  if (typeof window[key] !== "undefined") {
    return window[key];
  }
}

export const saveToLocalStoreImpl = function(key) {
  return function (state) {
    window.JBridge.setKeysInSharedPrefs(key, state);
    return function () {
    };
  };
}

export const fetchFromLocalStoreImpl = function(key) {
  return function (just) {
    return function (nothing) {
      return function () {
        const state = JBridge.getFromSharedPrefs(key);
        if (state != "__failed" && state != "(null)") {
          return just(state);
        }
        return nothing;
      };
    };
  };
}
export const reboot = window.JOS.emitEvent("java")("onEvent")(JSON.stringify({event:"reboot"}))()

export const showSplash = window.JOS.emitEvent("java")("onEvent")(JSON.stringify({event:"show_splash"}))()


export const decrementMonth = function (month) {
  return function (year){
    try{
      const date = new Date(year, month-1, 1);
      const d = { utcDate: date.toISOString(), date: date.getDate(), shortMonth: date.toLocaleString("default", { month: "short" }), year: date.getFullYear(), intMonth : date.getMonth(),
        isInRange : false, isStart: false , isEnd: false }
      return d;
    } catch (e) {
      console.log("error in decrementMonth", e);
    }
  }
}

export const incrementMonth = function (month) {
  return function (year){
    try{
      const date = new Date(year, month+1, 1);
      const d= { utcDate: date.toISOString(), date: date.getDate(), shortMonth: date.toLocaleString("default", { month: "short" }), year: date.getFullYear(), intMonth : date.getMonth(),
        isInRange : false, isStart: false , isEnd: false }
      return d;
    } catch (e) {
      console.log("error in incrementMonth", e);
    }
  }
}

export const getWeeksInMonth = function (year) {
  return function (month) {
    try {
      const result = []
      const date = new Date(year, month, 1);
      const diff = date.getDay();

      let startPadding = diff;
      while (date.getMonth() == month){
        const week = [];
        for(let i = 0 ; i < 7; i++){
          if(startPadding){
            const obj = { utcDate: "", date: 0, shortMonth: "", year: year, intMonth: month,
              isInRange : false, isStart: false , isEnd: false }
            week.push(obj);
            startPadding --;
          }else{
            const obj = { utcDate: date.toISOString(), date: date.getDate(), shortMonth: date.toLocaleString("default", { month: "short" }), year: year, intMonth: month,
              isInRange : false, isStart: false , isEnd: false }
            week.push(obj)
            date.setDate(date.getDate() + 1);
          }

          if(date.getMonth() != month) break;
        }
        if(date.getMonth() != month && date.getDay() != 0) {
          let endPadding = 6 - date.getDay() + 1;
          while(endPadding --){
            const obj = { utcDate: "", date: 0, shortMonth: "", year: year, intMonth: month,
              isInRange : false, isStart: false , isEnd: false }
            week.push(obj);
          }
        }
        result.push({week: week})
      }
      return result;
    } catch (e) {
      console.log("error in getWeeksInMonth", e);
    }
  }
};

export const getCurrentDay = function (dummy) {
  const date = new Date();
  return { utcDate: date.toISOString(), date: date.getDate(), shortMonth: date.toLocaleString("default", { month: "short" }), year: date.getFullYear(), intMonth : date.getMonth(),
    isInRange : false, isStart: false , isEnd: false }
}
