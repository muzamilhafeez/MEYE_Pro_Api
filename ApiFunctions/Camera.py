
from sql import MySQL


class CameraApi:
    def __init__(self,cam) -> None:
        self.cam = cam
        
    def camera_details(self,dvrID):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT c.*,v.Name FROM CAMERA c INNER JOIN DVR d ON d.ID=c.DvrID INNER JOIN VENUE v On v.ID=c.VenueId WHERE c.DvrID ='{dvrID}' 
                    ''')
        lst=[]
        for row in cursor.fetchall():
           lst.append(self.cam.Camera(id=row.ID,dvrID=row.DvrID,venueID=row.VenueId,portNumber=row.PortNumber,
                                      venueName=row.Name))
        
        return {"data":lst}
        
    def update_camera_details(self,camera):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE CAMERA SET DvrID = '{camera.dvrID}',
                   PortNumber='{camera.portNumber}' ,  VenueID='{camera.venueID}'
                   WHERE ID ='{camera.id}'
                   ''')
    
        return {"data":camera}
    def delete_camera_details(self,camera):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM CAMERA WHERE ID = '{camera.id}'
                    ''')
    
        return {"data":"okay"}
    def add_camera(self,camera):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                INSERT INTO CAMERA
                VALUES
                ('{camera.dvrID}','{camera.venueID}','{camera.portNumber}','Front')
                ''')
        return {"data":"okay"}
