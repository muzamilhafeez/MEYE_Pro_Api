    
from sql import MySQL


class SectionApi:
    def __init__(self,section) -> None:
        self.section = section
        
    def section_details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM SECTION
                    ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append(self.section.Section(name = row.NAME,id=row.ID))
        
        return {"data":lst
               }
    def update_section_details(self,section):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE SECTION SET ID = '{section.id}',
                   NAME='{section.name}'
                   WHERE  ID='{section.id}'
                   ''')
    
        return {
                "data":section
                }
    def delete_section_details(self,section):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM SECTION WHERE ID = '{section.id}'
                    ''')
    
        return {"data":"okay"}
    def add_section(self,section):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                INSERT INTO SECTION
                VALUES
                ('{section.name}')
                ''')

        return {"data":"okay"}
