import rospy
import argparse
from std_msgs.msg import Float64
import numpy as np

TOPIC_NAME_SPACE = '/sam/dr/'
TOPICS = ['yaw', 'pitch', 'roll']
PUBLISH_RATE = 10

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--spoof_value', type=float, required=True,
                        help='Spoof value for the messages.')
    parser.add_argument('--noise', type=float, required=True,
                        help='Amount of noise to add to the messages.')
    args = parser.parse_args()

    rospy.init_node("spoof_node", anonymous=True)
    rate = rospy.Rate(PUBLISH_RATE)
    publishers = [rospy.Publisher(TOPIC_NAME_SPACE + topic, Float64, queue_size=10) for topic in TOPICS]
    while not rospy.is_shutdown():
        value = max(0, Float64(np.random.normal(args.spoof_value, args.noise)))
        for publisher in publishers:
            publisher.publish(value)
        rate.sleep()
