(define (domain sorting)
  (:requirements :strips :typing :negative-preconditions)
  
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
    (color-identified ?b - block)
    (color-matched ?b - block ?box - box)
  )
  
  (:action scan-color
    :parameters (?b - block)
    :precondition (and 
                    (on-conveyor ?b)
                    (not (color-identified ?b))
                  )
    :effect (and 
              (color-identified ?b)
            )
  )
  
  (:action match-color
    :parameters (?b - block ?box - box ?c - color)
    :precondition (and 
                    (color-identified ?b)
                    (block-color ?b ?c)
                    (box-color ?box ?c)
                    (not (color-matched ?b ?box))
                  )
    :effect (and 
              (color-matched ?b ?box)
            )
  )
  
  (:action pickup
    :parameters (?b - block)
    :precondition (and 
                    (on-conveyor ?b)
                    (handempty)
                    (color-identified ?b)
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
                    (color-matched ?b ?box)
                  )
    :effect (and 
              (in-box ?b ?box)
              (not (holding ?b))
              (handempty)
            )
  )
)
