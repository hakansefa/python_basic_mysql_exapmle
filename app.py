import mysql.connector
from flask import Flask, render_template

app = Flask(__name__)

db = mysql.connector.connect(
	host="localhost",
	user="root",
	passwd="15741520",
	database="yurtdb",
    auth_plugin = 'mysql_native_password'
)


@app.route("/")
def index():

			return "<marquee><h1>Hakan Sefa ÖZKOÇ Veritabanı Ödevi</h1></marquee>" \
	       "<br><h2><a href='/1/sorgu1'>Sorgu 1</a></h2>" \
	       "<br><h2><a href='/sorgu2/sorgu2'>Sorgu 2</a color=red></h2>" \
	       "<br><h2><a href='/sorgu3/sorgu3'>Sorgu 3</a></h2>" \
	       "<br><h2><a href='/sorgu4/sorgu4'>Sorgu 4</a></h2>" \
	       "<br><h2><a href='/sorgu5/sorgu5'>Sorgu 5</a></h2>" \
	       "<br><h2><a href='/sorgu6/sorgu6'>Sorgu 6</a></h2>" \




@app.route("/1/<shipname>")
def tonnage(shipname):
	cursor = db.cursor()
	sql = "select ogr_tc,ogr_ad from ogrenciler as ogr inner join universite as uni on ogr.universite_uni_id=uni.uni_id inner join bolumler as bol on ogr.Bolumler_bolum_id=bol.bolum_id inner join siniflar as s on ogr.siniflar_sinif_id=s.sinif_id where uni_ad='Necmettin Erbakan Üniversitesi' and sinif=1 and bolum_ad='Yönetim Bilişim Sistemleri'"
	cursor.execute(sql)
	result = cursor.fetchall()
	return render_template("1.html", data=result)


@app.route("/sorgu2/<customername>")
def address(customername):
	cursor = db.cursor()
	sql = "select ogr_ad,ogr_tel,ogr_email,oda_kod,odeme_aciklama,odeme_tut from ogrenciler inner join odalar on ogrenciler.Odalar_oda_id=odalar.oda_id inner join odeme on ogrenciler.ogr_id=odeme.ogrenciler_ogr_id where odeme_tarih='26/05/2019'"
	cursor.execute(sql)
	result = cursor.fetchall()
	return render_template("sorgu2.html", data=result)


@app.route("/sorgu3/<speciesname>")
def site2find(speciesname):
	cursor = db.cursor()
	sql = "select ogr_ad,oda_kod,ana_yemek,tatli,icecek from ogrenciler as o inner join yemek_say on o.ogr_id=yemek_say.ogrenciler_ogr_id inner join yemek on yemek.yemek_id=yemek_say.yemek_yemek_id inner join odalar on o.Odalar_oda_id=odalar.oda_id where yemek_tarih='25/05/2019'"
	cursor.execute(sql)
	result = cursor.fetchall()
	return render_template("sorgu3.html", data=result)


@app.route("/sorgu4/<destname>")
def sitesdestination(destname):
	cursor = db.cursor()
	sql = "select  ogr_ad,ogr_tel,etkinlik_ad,etkinlik_acıklama from ogrenciler as ogr inner join etk_say on ogr.ogr_id=etk_say.ogrenciler_ogr_id inner join etkinlik as etk on etk.etkinlik_id=etk_say.etkinlik_etkinlik_id inner join izinler on ogr.ogr_id=izinler.izin_id where izin_tarihi='26/05/2019'"
	cursor.execute(sql)
	result = cursor.fetchall()
	return render_template("sorgu4.html", data=result)


@app.route("/sorgu5/<custname>")
def custsites(custname):
	cursor = db.cursor()
	sql = "Select odeme_tut,kart_no from odeme as s inner join ogrenciler as o on s.ogrenciler_ogr_id=o.ogr_id inner join kredikart on s.kredikart_kart_id=kredikart.kart_id where ogr_ad like 'hakan sefa%'"

	cursor.execute(sql)
	result = cursor.fetchall()
	return render_template("sorgu5.html", data=result)


@app.route("/sorgu6/<custname>")
def didseenship(custname):
	cursor = db.cursor()
	sql = "Select distinct ogr_tc,ogr_ad,personel_ad from ogrenciler  as o inner join odeme as s on o.ogr_id=s.ogrenciler_ogr_id inner join msjogrtopers on o.ogr_id=msjogrtopers.ogrenciler_ogr_id  inner join personel on personel.personel_id=msjogrtopers.ogrenciler_ogr_id inner join izinler on izinler.ogrenciler_ogr_id= o.ogr_id where izinler.izin_tarihi='26/05/2019' and s.odeme_tarih='25/05/2019'"
	cursor.execute(sql)
	result = cursor.fetchall()
	if len(result) > 0:
		return render_template("sorgu6.html", data=result)
	else:
		return "<h1>Kayıt Bulunamadı...</h1>"



if __name__ == "__main__":
	app.run(port=80, debug=True)
