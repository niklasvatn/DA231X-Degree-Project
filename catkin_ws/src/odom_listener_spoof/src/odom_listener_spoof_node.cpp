#include <ros/ros.h>
#include <std_msgs/Float64.h>


int main(int argc, char* argv[])
{
	std::string node_name = "odom_listener";
  	ros::init(argc, argv, node_name);
	std_msgs::Float64 depth;
	depth.data = 3.0;

	double freq = 10;
  	ros::NodeHandle node;

	ros::Publisher feedback_depth = node.advertise<std_msgs::Float64>("depth", freq);
	ros::Rate rate(10.0);
  	while (node.ok()){
		feedback_depth.publish(depth);
		rate.sleep();
		ros::spinOnce();
	}
	return 0;
}

