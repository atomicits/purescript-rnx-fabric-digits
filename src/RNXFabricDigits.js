'use strict';

var rnxFabricDigits = require("react-native-fabric-digits");

exports._login = function(options){
    return function(success_callback){
        return function(error_callback){
            return function(){
                rnxFabricDigits.DigitsManager.launchAuthentication(options).then(function(resData){
                    success_callback(resData)();
                }).catch(function(error){
                    error_callback(error)();
                });
            };
        };
    };
};

exports._getSession = function(success_callback){
    return function(error_callback){
        return function(){
            rnxFabricDigits.DigitsManager.sessionDetails(function(error, sessionDetails){
                if(error){
                    error_callback(error)();
                }else{
                    if(sessionDetails){
                        success_callback(sessionDetails)();
                    }else{
                        error_callback({name: "Session Not Available", message: "session is not avaiable please login"})();
                    }
                }
            });
        };
    };
};


exports._logout = function(success_callback){
    return function(error_callback){
        return function(){
            try{
                var s = rnxFabricDigits.DigitsManager.logout();
                success_callback(true)();
            }catch(error){
                error_callback(error)();
            }
        };
    };
};
