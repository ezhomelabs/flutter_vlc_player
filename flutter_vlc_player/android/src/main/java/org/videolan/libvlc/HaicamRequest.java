package org.videolan.libvlc;

public class HaicamRequest {
    public int type;
    public long accountId;
    public long cameraId;

    public HaicamRequest( int type, long accountId, long cameraId) {
        this.type = type;
        this.accountId = accountId;
        this.cameraId = cameraId;
    }
}