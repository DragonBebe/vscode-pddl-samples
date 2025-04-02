(define (domain sorting)
  (:requirements :strips :typing)
  
  (:types 
    block box color - object
  )
  
  (:predicates
    (on-conveyor ?b - block)
    (in-box ?b - block ?box - box)
    (holding ?b - block)
    (handempty)
    (block-color ?b - block ?c - color)
    (box-color ?box - box ?c - color)
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
    :parameters (?b - block ?box - box)
    :precondition (and 
                    (holding ?b)
                    (exists (?c - color)
                      (and 
                        (block-color ?b ?c)
                        (box-color ?box ?c)
                      )
                    )
                  )
    :effect (and 
              (in-box ?b ?box)
              (not (holding ?b))
              (handempty)
            )
  )
)
