import rospy
from std_msgs.msg import Float64
import numpy as np

TOPIC_NAME_SPACE = '/sam/dr/'
TOPICS = ['yaw', 'pitch', 'roll']
PUBLISH_RATE = 10

if __name__ == '__main__':
    rospy.init_node("spoof_node", anonymous=True)
    rate = rospy.Rate(PUBLISH_RATE)
    [yaw_publisher, pitch_publisher, roll_publisher] = [rospy.Publisher(TOPIC_NAME_SPACE + topic, Float64, queue_size=10) for topic in TOPICS]
    while not rospy.is_shutdown():
        [y, p, r] = [Float64(x) for x in np.random.normal(0, 1, 3)]
        yaw_publisher.publish(y)
        roll_publisher.publish(r)
        pitch_publisher.publish(p)
        rate.sleep()
