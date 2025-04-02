(define (domain sorting-conveyor)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types 
    block box color position - object
  )
  
  (:predicates
    (on-conveyor ?b - block)                    ; 方块在传送带上
    (in-box ?b - block ?box - box)              ; 方块在盒子里
    (holding ?b - block)                        ; 机械臂抓住方块
    (handempty)                                 ; 机械臂空闲
    (block-color ?b - block ?c - color)         ; 方块颜色
    (box-color ?box - box ?c - color)           ; 盒子颜色
    (robot-position ?p - position)              ; 机械臂所在位置
  )
  
  (:action pickup
    :parameters (?b - block)
    :precondition (and 
                    (on-conveyor ?b)
                    (handempty)
                  )
    :effect (and 
              (holding ?b)
              (not (on-conveyor ?b))
              (not (handempty))
            )
  )
  
  (:action put-in-box
    :parameters (?b - block ?box - box ?c - color)
    :precondition (and 
                    (holding ?b)
                    (block-color ?b ?c)
                    (box-color ?box ?c)
                  )
    :effect (and 
              (in-box ?b ?box)
              (not (holding ?b))
              (handempty)
            )
  )
)
