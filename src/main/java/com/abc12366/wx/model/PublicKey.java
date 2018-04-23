package com.abc12366.wx.model;

/**
 * @author lijun <ljun51@outlook.com>
 * @create 2017-09-13 9:08 AM
 * @since 1.0.0
 */
public class PublicKey extends Result{

    public byte[] pk;

    public byte[] getPk() {
        return pk;
    }

    public void setPk(byte[] pk) {
        this.pk = pk;
    }
}
