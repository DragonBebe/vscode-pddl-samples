(define (problem sorting-conveyor-demo)
  (:domain sorting-conveyor)
  
  (:objects
    block1 block2 block3 - block
    red-box blue-box - box
    red blue - color
  )
  
  (:init
    (on-conveyor block1)
    (on-conveyor block2)
    (on-conveyor block3)
    
    (block-color block1 red)
    (block-color block2 blue)
    (block-color block3 red)
    
    (box-color red-box red)
    (box-color blue-box blue)
    
    (handempty)
  )
  
  (:goal
    (and
      (in-box block1 red-box)
      (in-box block2 blue-box)
      (in-box block3 red-box)
    )
  )
)
