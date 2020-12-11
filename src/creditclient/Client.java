package creditclient;
import java.io.Serializable;

public class Client implements Serializable {
	
	private int numCli;
	private String nomCli;
	private String preCli;
	private String adrCli;
	private String vilCli;
	private String telCli;
	private String mailCli ;
	private String mdpCli;
	
	public Client() {
			
		
	}
	
	
	public Client(int numCli,String nomCli, String preCli,String adrCli,String vilCli,String telCli,String mailCli,String mdpCli)
	{
		
		this.numCli=numCli;
		this.nomCli=nomCli;
		this.preCli=preCli;
		this.adrCli=adrCli;
		this.vilCli=vilCli;
		this.telCli=telCli;
		this.mailCli=mailCli;
		this.mdpCli=mdpCli;
	}
	
	public Client(String nomCli, String preCli,String adrCli,String vilCli,String telCli,String mailCli,String mdpCli)
	{
		
		this.nomCli=nomCli;
		this.preCli=preCli;
		this.adrCli=adrCli;
		this.vilCli=vilCli;
		this.telCli=telCli;
		this.mailCli=mailCli;
		this.mdpCli=mdpCli;
	}
	
	


	public int getNumCli() {
		return numCli;
	}


	public void setNumCli(int numCli) {
		this.numCli = numCli;
	}


	public String getNomCli() {
		return nomCli;
	}


	public void setNomCli(String nomCli) {
		this.nomCli = nomCli;
	}


	public String getPreCli() {
		return preCli;
	}


	public void setPreCli(String preCli) {
		this.preCli = preCli;
	}


	public String getAdrCli() {
		return adrCli;
	}


	public void setAdrCli(String adrCli) {
		this.adrCli = adrCli;
	}


	public String getVilCli() {
		return vilCli;
	}


	public void setVilCli(String vilCli) {
		this.vilCli = vilCli;
	}


	public String getTelCli() {
		return telCli;
	}


	public void setTelCli(String telCli) {
		this.telCli = telCli;
	}


	public String getMailCli() {
		return mailCli;
	}


	public void setMailCli(String mailCli) {
		this.mailCli = mailCli;
	}


	public String getMdpCli() {
		return mdpCli;
	}


	public void setMdpCli(String mdpCli) {
		this.mdpCli = mdpCli;
	}


	@Override
	public String toString() {
		return "Client [numeroClient=" + numCli + ", prenom=" + preCli + ", adresse=" + adrCli + ", ville="
				+ vilCli + ", telephone=" + telCli + ", mail=" + mailCli + "]";
	}
	
	
	
	

}
