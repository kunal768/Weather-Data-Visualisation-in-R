import os
import time
from flask import *
app = Flask(__name__)
@app.route('/')
def index():
	return render_template("main.html")


@app.route('/station/<date>' ,methods= ['GET'])
def station(date):
	os.system("Rscript RlabJ.R %s"%date)
	time.sleep(2)
	return render_template("dashboard.html") # sends it to dashboard page



# when we get back after veiwing weather of a particular dataset so the temporary files created while running Rscript must be destroyed to save up space 
@app.route('/back' , methods = ['GET'])
def back():
	#newPath = "static"
	os.chdir("static")
	os.system("dir")
	#os.system("mkdir hi")
	os.system("del high.png")
	os.system("del low.png")
	os.system("del cluster.png")
	#oldPath = "C:\\Users\\Kunal K.S. Sahni\\Desktop\\RLAB-J"
	os.chdir("C:\\Users\\Kunal K.S. Sahni\\Desktop\\RLAB-J")

	return redirect(url_for("index"))




# runs the app
if __name__ == "__main__":
        app.run(debug = True)
