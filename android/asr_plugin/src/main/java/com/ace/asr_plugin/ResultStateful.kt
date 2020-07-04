package com.ace.asr_plugin

import android.util.Log
import io.flutter.plugin.common.MethodChannel

class ResultStateful(val result: MethodChannel.Result) : MethodChannel.Result{



    companion object{
        val TAG = "ResultStateful"
        fun of(result:MethodChannel.Result):ResultStateful{
            return ResultStateful(result)
        }
    }

    override fun notImplemented() {
        result.notImplemented()
    }

    override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
        Log.d(TAG,"errorCode=$errorCode---errorMessage=$errorMessage")
        result.error(errorCode,errorMessage,errorDetails)
    }

    override fun success(o: Any?) {
       result.success(o)
    }

}