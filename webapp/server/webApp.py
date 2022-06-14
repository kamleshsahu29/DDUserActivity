import cherrypy
import boto3
import json
import sys

profileStream = "dd-kf-profile"
aliasStream = "dd-kf-alias"
trackStream = "dd-kf-track"
kinesis_client = boto3.client('firehose')
cherrypy.config.update({'server.socket_host': '0.0.0.0'})
cherrypy.config.update({'server.socket_port': 80})


class UserActivity(object):

    def postKinesisFirehose(self, stream, data):
        return kinesis_client.put_record(DeliveryStreamName=stream, Record={'Data': data})

    @cherrypy.expose
    def index(self):
        return "Tracking now..."

    @cherrypy.expose
    def profile(self, userId, attributes, timeStampUTC):
        data = json.dumps({'userId': userId, 'attributes': attributes, 'timeStampUTC': timeStampUTC})
        self.postKinesisFirehose(profileStream, data)

    @cherrypy.expose
    def track(self, userId, events):
        data = json.dumps({'userId': userId, 'events': events})
        self.postKinesisFirehose(trackStream, data)

    @cherrypy.expose
    def alias(self, newUserId, originalUserId, timeStampUTC):
        data = json.dumps({'newUserId': newUserId, 'originalUserId': originalUserId, 'timeStampUTC': timeStampUTC})
        self.postKinesisFirehose(aliasStream, data)

    @cherrypy.expose
    def test(self, userID):
        data = json.dumps({"UserID": userID})
        self.postKinesisFirehose(profileStream, data)


if __name__ == '__main__':
    cherrypy.quickstart(UserActivity())
