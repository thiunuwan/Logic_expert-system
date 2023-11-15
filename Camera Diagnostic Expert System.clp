(defrule p1
   ?p1<-(start)=>
   (printout t "====================================================== " crlf)
   (printout t "   Digitle Camera Diagnostic Expert System " crlf)
   (printout t "   An expert system designed to diagnose issues rellated to camera's " crlf)
   (printout t "====================================================== " crlf)
   (printout t " " crlf)
   (printout t"Is the camera turning on? (yes/no) :")
   (assert (turns (read)))
   (retract ?p1))
   
   
(defrule p2
   (turns no)
   =>
   (printout t "Is the battery level sufficient?(yes/no) :")
   (assert (batteryLevel (read))))
   
   
(defrule p3
   (turns no)
   (batteryLevel no)
   =>
   (printout t "Is the charging indicator light blinks?(yes/no) :")
   (assert (chargingIndicator (read))))
   
   
(defrule rule1
  (turns no)
  (batteryLevel yes)
   =>
   (printout t "circuit-related issue" crlf)
   (clear))
   

(defrule rule2
   (turns no)
   (batteryLevel no)
   (chargingIndicator yes)
   =>
   (printout t "Issue in the battery" crlf)
   (clear))
   
   
(defrule rule3
   (turns no)
   (batteryLevel no)
   (chargingIndicator no)
   =>
   (printout t "Issue in the charging cable/port." crlf)
   (clear))
  
   
   
(defrule p4
   (turns yes)
   =>
   (printout t "Is the display is working properly? (yes/no):")
   (assert (display (read))))
   
   
(defrule p5
   (turns yes)
   (display yes)
   =>
   (printout t "Is the camera menu functioning properly? (yes/no):")
   (assert (menu (read))))
     
(defrule p6
   (turns yes)
   (display yes)
   (menu yes)
   =>
   (printout t "Are the objects in front of the camera visible on the display?(yes/no):")
   (assert (objectsVisible (read))))
        
(defrule p7
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   =>
   (printout t "Are the captured images blurry?(yes/no):")
   (assert (blurry (read))))
           
 
(defrule p8
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry yes)
   =>
   (printout t "Is the image stabilizer malfunctioning?(yes/no):")
   (assert (stabilizer (read))))
            
 
(defrule p9
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry no)
   =>
   (printout t "Are the pictures too dark or too bright?(yes/no):")
   (assert (exposure (read))))  
   
   
(defrule p10
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry no)
   (exposure no)
   =>
   (printout t "Any issue with image quality ?(noisy/grainy):")
   (assert (texture(read))))     
   
   
   
  
(defrule rule4
   (turns yes)
   (display no)
   =>
   (printout t "Issue in the camera display." crlf)
   (clear))


(defrule rule5
   (turns yes)
   (display yes)
   (menu no)
   =>
   (printout t "software-related issues." crlf)
   (clear))
   
   
   
(defrule rule6
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible no)
   =>
   (printout t "Lens malfunction(checks camera lens)." crlf)
   (clear))
   
   
(defrule rule7
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry yes)
   (stabilizer yes)
   =>
   (printout t "issue in the image stabilizer." crlf)
   (clear))
   
   
(defrule rule8
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry yes)
   (stabilizer no)
   =>
   (printout t "camera is out of focus." crlf)
   (clear))
   
   
(defrule rule9
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry no)
   (exposure yes)
   =>
   (printout t " problem with the camera's exposure meter." crlf)
   (clear))
   
(defrule rule10
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry no)
   (exposure no)
   (texture noisy)
   =>
   (printout t " camera's sensor issue." crlf)
   (clear))
      
(defrule rule11
   (turns yes)
   (display yes)
   (menu yes)
   (objectsVisible yes)
   (blurry no)
   (exposure no)
   (texture grainy)
   =>
   (printout t " image processing issue." crlf)
   (clear))
      
   
   
   