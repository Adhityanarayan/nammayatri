
export const getSubsRemoteConfig = function (config) {
  try {
    const parsedConfig = JSON.parse(config);
    const clientId = window.__payload.payload.clientId;
    if (clientId in parsedConfig){
      return parsedConfig[clientId];
    }
  }catch (e){
    console.error("Error in parsing remote config", e);
  }
  return "";
}

export const getReelsData = function (reelsData) {
  try {
    return JSON.parse(reelsData);
  }catch (e){
    console.error("Error in parsing remote config", e);
  }
  return "[]";
}