package com.chen.domain;

import java.io.Serializable;

public class Dept implements Serializable {
    private Integer did;

    private String dname;

    private String dremark;

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getDremark() {
        return dremark;
    }

    public void setDremark(String dremark) {
        this.dremark = dremark == null ? null : dremark.trim();
    }

	@Override
	public String toString() {
		return "Dept [did=" + did + ", dname=" + dname + ", dremark=" + dremark + "]";
	}
    
    
}