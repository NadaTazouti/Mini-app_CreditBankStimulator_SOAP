package creditclient;
public class Credit {
		private int numCre;
		private double monCre;
		private int durCre;
		private double tauCre;
		private double annCre;
		private int numCli;
		
		public Credit() {}

		public Credit(int numCre, double monCre, int durCre, double tauCre, double annCre, int numCli) {
			super();
			this.numCre = numCre;
			this.monCre = monCre;
			this.durCre = durCre;
			this.tauCre = tauCre;
			this.annCre = annCre;
			this.numCli = numCli;
		}


		
		public int getNumCre() {
			return numCre;
		}



		public void setNumCre(int numCre) {
			this.numCre = numCre;
		}



		



		public double getMonCre() {
			return monCre;
		}



		public void setMonCre(double monCre) {
			this.monCre = monCre;
		}



		public int getDurCre() {
			return durCre;
		}



		public void setDurCre(int durCre) {
			this.durCre = durCre;
		}



		public double getTauCre() {
			return tauCre;
		}



		public void setTauCre(double tauCre) {
			this.tauCre = tauCre;
		}



		public double getAnnCre() {
			return annCre;
		}



		public void setAnnCre(double annCred) {
			this.annCre = annCred;
		}



		


		public int getNumCli() {
			return numCli;
		}



		public void setNumCli(int numCli) {
			this.numCli = numCli;
		}



		@Override
		public String toString() {
			return "Credit [numero=" + numCre + ", clientnum=" + numCli+ ", annuite=" + annCre + ", capital=" + monCre
					+ ", taux=" + tauCre + ", duree=" + durCre + ", date=" +  "]";
		}
		
}
