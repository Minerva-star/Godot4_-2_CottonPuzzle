extends CanvasLayer

onready var color_rect = $ColorRect


func change_scene(path:String):
	var tween := create_tween()
	tween.tween_callback(color_rect,"show")
	#把 A通道 从透明 到显示  从0变成1.0  0.2秒内 
	tween.tween_property(color_rect,"color:a",1.0,0.2)
	#然后就是真的去转场
	tween.tween_callback(get_tree(),"change_scene",[path])
	#然后是逆操作  从显示 到完全透明， 然后隐藏 
	tween.tween_property(color_rect,"color:a",0.0,0.3)
	tween.tween_callback(color_rect,"hide")
