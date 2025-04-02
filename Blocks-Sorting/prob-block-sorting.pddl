(define (problem sorting-simple)
  (:domain block-sorting)
  
  (:objects
    block1 - block
    red-box blue-box - box
    red blue - color
  )
  
  (:init
    (on-conveyor block1)
    (block-color block1 red)
    (box-color red-box red)
    (box-color blue-box blue)
    (handempty)
  )
  
  (:goal
    (in-box block1 red-box)
  )
)
