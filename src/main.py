# import math
import sys

import cv2 as cv

#   import cvzone
#   import ultra
# from ultralytics import YOLO

cap = cv.VideoCapture(0)
cap.set(3, 1280)
cap.set(4, 720)

# model

if not cap.isOpened():
    print("Cannot open camera")
    sys.exit()
while True:
    ret, frame = cap.read()

    if not ret:
        print("Can't receive frame...exiting")
        break

    gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    cv.imshow("frame", gray)
    if cv.waitKey(1) == ord("q"):
        break

cap.release()
cv.destroyAllWindows()
