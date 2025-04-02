(define (problem sorting-conveyor-loading-prob-temporal)
  (:domain sorting-conveyor-loading-temporal)
  
  (:objects
    block1 block2 block3 - block
    red-box blue-box - box
    red blue - color
    sorting-arm loading-arm - arm
  )
  
  (:init
    (conveyor-empty)
    
    (in-storage block1)
    (in-storage block2)
    (in-storage block3)
    
    (block-color block1 red)
    (block-color block2 blue)
    (block-color block3 red)
    
    (box-color red-box red)
    (box-color blue-box blue)
    
    (is-sorting-arm sorting-arm)
    (is-loading-arm loading-arm)
    
    (arm-empty sorting-arm)
    (arm-empty loading-arm)
    
    (= (scan-time) 2.0)
    (= (pickup-time) 1.5)
    (= (place-time) 1.5)
    (= (transport-time) 3.0)
  )
  
  (:goal
    (and
      (in-box block1 red-box)
      (in-box block2 blue-box)
      (in-box block3 red-box)
    )
  )
  
  (:metric minimize (total-time))
)
