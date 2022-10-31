class Jobs {
  String? jobChannel;
  String? jobHeading;
  String? jobDescription;
  String? jobSalary;
  String? jobLocation;
  String? jobDate;
  String? id;

  Jobs(
      {this.jobChannel,
      this.jobHeading,
      this.jobDescription,
      this.jobSalary,
      this.jobLocation,
      this.jobDate,
      this.id});

  Jobs.fromJson(Map<String, dynamic> json) {
    jobChannel = json['jobChannel'];
    jobHeading = json['jobHeading'];
    jobDescription = json['jobDescription'];
    jobSalary = json['jobSalary'];
    jobLocation = json['jobLocation'];
    jobDate = json['jobDate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobChannel'] = jobChannel;
    data['jobHeading'] = jobHeading;
    data['jobDescription'] = jobDescription;
    data['jobSalary'] = jobSalary;
    data['jobLocation'] = jobLocation;
    data['jobDate'] = jobDate;
    data['id'] = id;
    return data;
  }
}
