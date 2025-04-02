(define (domain sorting-conveyor-loading)
  (:requirements :strips :typing)
  
  (:types 
    block box color arm
  )
  
  (:predicates
    (on-conveyor ?b - block)
    (in-box ?b - block ?box - box)
    (in-storage ?b - block)
    (holding ?a - arm ?b - block)
    (arm-empty ?a - arm)
    (block-color ?b - block ?c - color)
    (box-color ?box - box ?c - color)
    (color-identified ?b - block)
    (conveyor-empty)
    (is-sorting-arm ?a - arm)
    (is-loading-arm ?a - arm)
    (at-scanning-position ?b - block)
  )
  
  (:action scan-color
    :parameters (?b - block ?a - arm ?c - color)
    :precondition (and 
                    (on-conveyor ?b)
                    (is-sorting-arm ?a)
                    (arm-empty ?a)
                    (block-color ?b ?c)
                    (at-scanning-position ?b)
                  )
    :effect (and 
              (color-identified ?b)
            )
  )
  
  (:action pickup-from-conveyor
    :parameters (?a - arm ?b - block ?c - color)
    :precondition (and 
                    (is-sorting-arm ?a)
                    (on-conveyor ?b)
                    (arm-empty ?a)
                    (color-identified ?b)
                    (block-color ?b ?c)
                    (at-scanning-position ?b)
                  )
    :effect (and 
              (holding ?a ?b)
              (not (on-conveyor ?b))
              (not (arm-empty ?a))
              (conveyor-empty)
              (not (at-scanning-position ?b))
            )
  )
  
  (:action put-in-box
    :parameters (?a - arm ?b - block ?box - box ?c - color)
    :precondition (and 
                    (is-sorting-arm ?a)
                    (holding ?a ?b)
                    (block-color ?b ?c)
                    (box-color ?box ?c)
                  )
    :effect (and 
              (in-box ?b ?box)
              (not (holding ?a ?b))
              (arm-empty ?a)
            )
  )
  
  (:action pickup-from-storage
    :parameters (?a - arm ?b - block)
    :precondition (and 
                    (is-loading-arm ?a)
                    (in-storage ?b)
                    (arm-empty ?a)
                    (conveyor-empty)
                  )
    :effect (and 
              (holding ?a ?b)
              (not (in-storage ?b))
              (not (arm-empty ?a))
            )
  )
  
  (:action place-on-conveyor
    :parameters (?a - arm ?b - block)
    :precondition (and 
                    (is-loading-arm ?a)
                    (holding ?a ?b)
                    (conveyor-empty)
                  )
    :effect (and 
              (on-conveyor ?b)
              (not (holding ?a ?b))
              (arm-empty ?a)
              (not (conveyor-empty))
            )
  )
  
  (:action conveyor-transport
    :parameters (?b - block)
    :precondition (and 
                    (on-conveyor ?b)
                  )
    :effect (and 
              (at-scanning-position ?b)
            )
  )
)
