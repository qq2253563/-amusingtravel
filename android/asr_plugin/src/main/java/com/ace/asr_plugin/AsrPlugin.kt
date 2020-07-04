package com.ace.asr_plugin

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AsrPlugin(val context: Context) : MethodChannel.MethodCallHandler , FlutterPlugin{

    private var asrManager: AsrManager? = null
    private var resultStateful: ResultStateful? = null
    companion object{
        val TAG = "AsrPlugin"
        fun registerWith(flutterEngine: FlutterEngine, context:  Context){
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "asr_plugin").run {
                setMethodCallHandler(AsrPlugin(context))
            }
        }
    }
    
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        resultStateful = ResultStateful.of(result)
        when(call.method){
            "start" -> start(call,resultStateful)
            "stop" -> stop(call,resultStateful)
            "cancel" -> cancel(call,resultStateful)
            else -> result.notImplemented()
        }
    }

    private fun start(call: MethodCall, resultStateful: ResultStateful?) {
        getAsrManage()?.start(if(call.arguments is Map<*, *>) call.arguments as MutableMap<String, Any> else null)
    }

    private fun stop(call: MethodCall, resultStateful: ResultStateful?){
        getAsrManage()?.stop()
    }

    private fun cancel(call: MethodCall, resultStateful: ResultStateful?){
        getAsrManage()?.cancel()
    }

    private fun getAsrManage():AsrManager?{
        if (asrManager == null){
            asrManager = AsrManager(context,onAsrListener)
        }
        return asrManager
    }

    private val onAsrListener = object : OnAsrListener{
        override fun onOfflineLoaded() {
        }

        override fun onAsrEnd() {
        }

        override fun onAsrOnlineNluResult(nluResult: String?) {
        }

        override fun onAsrFinishError(errorCode: Int, subErrorCode: Int, descMessage: String?, recogResult: RecogResult?) {
            resultStateful?.error(descMessage,null,null)
        }

        override fun onAsrExit() {
        }

        override fun onAsrFinalResult(results: Array<out String>?, recogResult: RecogResult?) {
            resultStateful?.success(results?.get(0))
        }

        override fun onOfflineUnLoaded() {
        }

        override fun onAsrPartialResult(results: Array<out String>?, recogResult: RecogResult?) {
        }

        override fun onAsrReady() {

        }

        override fun onAsrFinish(recogResult: RecogResult?) {

        }

        override fun onAsrVolume(volumePercent: Int, volume: Int) {

        }

        override fun onAsrAudio(data: ByteArray?, offset: Int, length: Int) {

        }

        override fun onAsrBegin() {

        }

        override fun onAsrLongFinish() {

        }

    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        MethodChannel(binding.binaryMessenger, "asr_plugin").run {
            setMethodCallHandler(AsrPlugin(binding.applicationContext))
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }
}