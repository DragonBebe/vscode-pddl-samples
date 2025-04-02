(define (domain sorting-conveyor-loading-temporal)
  (:requirements :strips :typing :durative-actions :numeric-fluents)
  
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
  
  (:functions
    (scan-time)
    (pickup-time)
    (place-time)
    (transport-time)
  )
  
  (:durative-action scan-color
    :parameters (?b - block ?a - arm ?c - color)
    :duration (= ?duration 2.0)
    :condition (and 
                 (at start (on-conveyor ?b))
                 (at start (is-sorting-arm ?a))
                 (over all (arm-empty ?a))
                 (at start (block-color ?b ?c))
                 (at start (at-scanning-position ?b))
               )
    :effect (and 
              (at end (color-identified ?b))
            )
  )
  
  (:durative-action pickup-from-conveyor
    :parameters (?a - arm ?b - block ?c - color)
    :duration (= ?duration 1.5)
    :condition (and 
                 (at start (is-sorting-arm ?a))
                 (at start (on-conveyor ?b))
                 (at start (arm-empty ?a))
                 (at start (color-identified ?b))
                 (at start (block-color ?b ?c))
                 (at start (at-scanning-position ?b))
               )
    :effect (and 
              (at start (not (on-conveyor ?b)))
              (at start (not (arm-empty ?a)))
              (at start (not (at-scanning-position ?b)))
              (at end (holding ?a ?b))
              (at end (conveyor-empty))
            )
  )
  
  (:durative-action put-in-box
    :parameters (?a - arm ?b - block ?box - box ?c - color)
    :duration (= ?duration 1.5)
    :condition (and 
                 (at start (is-sorting-arm ?a))
                 (at start (holding ?a ?b))
                 (at start (block-color ?b ?c))
                 (at start (box-color ?box ?c))
               )
    :effect (and 
              (at start (not (holding ?a ?b)))
              (at end (in-box ?b ?box))
              (at end (arm-empty ?a))
            )
  )
  
  (:durative-action pickup-from-storage
    :parameters (?a - arm ?b - block)
    :duration (= ?duration 1.5)
    :condition (and 
                 (at start (is-loading-arm ?a))
                 (at start (in-storage ?b))
                 (at start (arm-empty ?a))
                 (at start (conveyor-empty))
               )
    :effect (and 
              (at start (not (in-storage ?b)))
              (at start (not (arm-empty ?a)))
              (at end (holding ?a ?b))
            )
  )
  
  (:durative-action place-on-conveyor
    :parameters (?a - arm ?b - block)
    :duration (= ?duration 1.5)
    :condition (and 
                 (at start (is-loading-arm ?a))
                 (at start (holding ?a ?b))
                 (at start (conveyor-empty))
               )
    :effect (and 
              (at start (not (holding ?a ?b)))
              (at end (on-conveyor ?b))
              (at end (arm-empty ?a))
              (at end (not (conveyor-empty)))
            )
  )
  
  (:durative-action conveyor-transport
    :parameters (?b - block)
    :duration (= ?duration 3.0)
    :condition (and 
                 (at start (on-conveyor ?b))
               )
    :effect (and 
              (at end (at-scanning-position ?b))
            )
  )
)
