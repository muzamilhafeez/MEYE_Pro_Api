
from sql import MySQL


class DVRApi:
    def __init__(self,dvr) -> None:
        self.dvr = dvr
        
    def dvr_details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM DVR
                    ''')
        
        lstdvr=[]
        for row in cursor.fetchall():
            lstdvr.append(self.dvr.DVR(id=row.ID,ip=row.IP,channel=row.CHANNEL,host=row.HOST,password=row.PASSWORD,name=row.NAME))
        return lstdvr
    
    def update_dvr_details(self,dvr):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE DVR SET IP = '{dvr.ip}',
                   CHANNEL='{dvr.channel}' ,  HOST='{dvr.host}',
                   PASSWORD='{dvr.password}',NAME='{dvr.name}'
                   WHERE ID ='{dvr.id}' ''')
        
        return {"data":dvr}
    def delete_dvr_details(self,dvr):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   SELECT * FROM CAMERA WHERE DvrID = '{dvr.id}'
                    ''')
        for row in cursor.fetchall():
            cursor.execute(f'''
                   DELETE FROM CAMERA WHERE ID = '{row[0]}'
                    ''')
        cursor.execute(f'''
                   DELETE FROM DVR WHERE ID = '{dvr.id}'
                    ''')

        return {"data":"okay"}
    def add_dvr(self,dvr):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                INSERT INTO DVR
                VALUES
                ('{dvr.ip}','{dvr.name}','{dvr.channel}','{dvr.host}','{dvr.password}')
                ''')
        return {"data":"okay"}