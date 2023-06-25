from datetime import datetime
from sql import MySQL


class ActivityDetailsSitApi:

    def add_activity_sit_details(self, activitydetails):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        t = datetime(activitydetails.timein.year, activitydetails.timein.month, activitydetails.timein.day,
                     activitydetails.timein.hour, activitydetails.timein.minute, activitydetails.timein.second)
        t.strftime(f'%Y%m%d %H:%M:%S')
        t1 = datetime(activitydetails.timeout.year, activitydetails.timeout.month, activitydetails.timeout.day,
                      activitydetails.timeout.hour, activitydetails.timeout.minute, activitydetails.timeout.second)
        t1.strftime(f'%Y%m%d %H:%M:%S')
        cursor.execute(f'''
                INSERT INTO ActivityDetailsSit
                VALUES
                ('{activitydetails.checkTimeID}','{t}','{t1}','{activitydetails.status}')
                ''')

        return {"data": "okay"}
