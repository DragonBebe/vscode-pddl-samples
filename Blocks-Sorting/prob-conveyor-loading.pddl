(define (problem sorting-conveyor-loading-prob)
  (:domain sorting-conveyor-loading)
  
  (:objects
    block1 block2 block3 - block
    red-box blue-box - box
    red blue - color
    sorting-arm1 loading-arm1 - arm
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
    
    (is-sorting-arm sorting-arm1)
    (is-loading-arm loading-arm1)
    
    (arm-empty sorting-arm1)
    (arm-empty loading-arm1)
  )
  
  (:goal
    (and
      (in-box block1 red-box)
      (in-box block2 blue-box)
      (in-box block3 red-box)
    )
  )
)
