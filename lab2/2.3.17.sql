CREATE VIEW TOPTEN (BID,TITLE,[UID],UNAME,LIKENUM,TYEEAR,TMONTH,TDAY)
AS 
(	
	SELECT MBLOG.BID,MBLOG.TITLE,MBLOG.UID,[USER].NAME,TOPTENBID.LIKENUM,MBLOG.PYEAR,MBLOG.PMONTH,MBLOG.PDAY
	FROM  MBLOG,[USER],(SELECT TOP(10) BID,COUNT(*)AS LIKENUM FROM THUMB GROUP BY BID ORDER BY COUNT(*)) AS TOPTENBID
	WHERE MBLOG.BID = TOPTENBID.BID AND MBLOG.UID = [USER].UID 
)
