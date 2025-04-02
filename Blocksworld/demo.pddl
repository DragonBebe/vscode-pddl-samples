(define (problem blocks)(:domain blocksworld)

(:objects
    red green blue brown pink gold - block
    )

; 这个Block world case中，table的容量是没有限制的，与比较著名的汉诺威塔的概念不一样，
; 汉诺威塔仅能容纳三个堆叠
(:init
    ;tower
    (ontable red) ; Block red
    (on green red) ; Block green
    (on blue green)(clear blue) ; Block blue
    ;tower
    (ontable brown) ; Block brown
    (on pink brown) ; Block pink
    (on gold pink)(clear gold) ; Block gold

    (handempty)

)

(:goal (and
    (on red brown)
    (on green red)
    (holding gold)
))
)