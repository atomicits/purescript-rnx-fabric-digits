'use strict';

var rnxFabricDigits = require("react-native-fabric-digits");

exports._login = function(options){
    return function(success_callback){
        return function(error_callback){
            return function(){
                rnxFabricDigits.DigitsManager.launchAuthentication(options).then(function(resData){
                    success_callback(JSON.stringfy(resData))();
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
                    success_callback(JSON.stringfy(sessionDetails))();
                }
            });
        };
    };
};


exports._logout = function(){
    rnxFabricDigits.DigitsManager.logout();
};
