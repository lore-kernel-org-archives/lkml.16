Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5958920AF63
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269393; cv=none; b=FlSoxq+qc4LcO720UUcBRP7LqbMo83hD82evfE391MnQDntp0TDuHT5uex8+l5ePvcPLpmx3qjP66NUpgLZ02b68sfutpnlyBwNzuyzL30je6ett42fdlBKdaRrdp3umwka/jzC0yr601uGu7QnwEX2xmGejnCVUcSKoZGWZJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269393; c=relaxed/simple;
	bh=DWJqDuFLFEmDPJ8gwq/JsDaJXbiRtVjy7R2D36j+Is4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gMiL44FB3e97CI+KtYAGRm7xaWnldXx4rNICJh+eT7zFPtJ5YazVRBeZuGCeOyS87h68M+Bl+FpqPOkphPmX6gdtTIkC4vSS7/DO47Q40g4ts14THf/MFnWg5TvpeyPssID/HXhkidT2EptAlXENk0uYWAbNa4rMJKHD878C6J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNK4epLL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNK4epLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744269389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=6R44ld/h956BiJzb58h4KVMiVAfBocZh3TDDiO+bD6M=;
	b=GNK4epLLba5pwIKnaeRNKc3jid47prkLlcuiwFsjk6p9qYnG4TeAZe7kpkW4SmheC17lqP
	dYj34uiit3qJz+gul8ZScvhSVY4ufWVmnORRNa6jGQ05zUdb/GNTzl8a5BWiZhFJ3YqfgJ
	t72zByOvOE8hK05qQ7y5N1F4PwgWM/g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-GNZILpceMWutVxucx_-wuQ-1; Thu, 10 Apr 2025 03:16:28 -0400
X-MC-Unique: GNZILpceMWutVxucx_-wuQ-1
X-Mimecast-MFC-AGG-ID: GNZILpceMWutVxucx_-wuQ_1744269387
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so2865885e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269386; x=1744874186;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6R44ld/h956BiJzb58h4KVMiVAfBocZh3TDDiO+bD6M=;
        b=lICnVbvfjvdhtgCAZIWy5Q/x+w140CNZf64TwCmNRt+vsZwSB/j9LnuKlswIj99Htv
         bZXsDKyLz+3CyrqogYX4XoMTnoMGVLRYbWQ+jvvNz8hV6RVPi61JbYaA98egKaIh+ObU
         G3fwkXOcIMBPfr19ajfyUiknOWbGN7r6e/v5VYv2G+cl7XMJk8h8wyQ1Ox3r9Y9HawNr
         rO3ohQyqcmpk0gKYAvQERVkcki+zyRJha6XPq6DZDNZFbhyb+WsPW3xouN6u3jjUp51/
         ajsMGHRpc7SeS25Ee2F8Ob8OIp1Vla37x3vmKVpJ4u0PFX7/YDNsMTVrogn/0fu71YvI
         MFVA==
X-Gm-Message-State: AOJu0YyEyBSgs+yfMO0Q3PHS6MS0El0R042Op7MQsnHFIRkxsl//CVvI
	FE9R3tATVMJ3yCHH9zezYdEqftwON9TzDC/x1sNOiwcBmss+zpYyua0eJhoILaSBtFPw5IomnY7
	A31hLI7Y57RoYYdVHxMXq61H8asZnYLJLNLNBHAR5zlRrHIgTfcjsbEZD0Ny+DHUIuATHVaO3Pg
	SaoLUxCgCiWEMgyVoiX0em3jyT09Rx5K6krvlGuCY=
X-Gm-Gg: ASbGncsIVb7EjNoKLFARlNoqdQn+Lo4/96rQs473CcpgK4GOhiNN872PW5GbQLpWuqp
	uO2h8AHD0YmDa1DPv5G3Llakgm+stzbryXagCllNlHCiFfLbpoVvWGLn12y0tD3vsoqluIxTo3e
	mmUp0bkU+npsUMk6InpE8AaPQgSSLUDSYiwqD6iIwm3b8lWEODtVDEYJNf7lcqkaCl2dCS+4dWs
	i5JNjZCXv3/8jdxa7DApcKlzb6euKXTpnKXIUk3h5uP4CrGvRpLSPlS30EQwm5HNURVgjE4iNSP
	FsMVAA==
X-Received: by 2002:a05:600c:3b97:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43f2d97d396mr16867935e9.27.1744269386406;
        Thu, 10 Apr 2025 00:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVw89TBejdu5GPJZ91rMxmsgBH/9ykh21mIbBEwr/VYv9hjRAWTwakBafyL5D10YIpq6z9LA==
X-Received: by 2002:a05:600c:3b97:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43f2d97d396mr16867065e9.27.1744269385275;
        Thu, 10 Apr 2025 00:16:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893630fbsm3912153f8f.15.2025.04.10.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:16:24 -0700 (PDT)
Date: Thu, 10 Apr 2025 03:16:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH RFC] virtgpu: don't reset on shutdown
Message-ID: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

It looks like GPUs are used by panic after shutdown is invoked.
Thus, breaking virtio gpu in the shutdown callback is not a good idea -
guest hangs attempting to flush out the panics, with this warnings:

[   20.504464] WARNING: CPU: 0 PID: 568 at drivers/gpu/drm/virtio/virtgpu_vq.c:358 virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
[   20.505685] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink vfat fat intel_rapl_msr intel_rapl_common intel_uncore_frequency_common nfit libnvdimm kvm_intel kvm rapl iTCO_wdt iTCO_vendor_support virtio_gpu virtio_dma_buf pcspkr drm_shmem_helper i2c_i801 drm_kms_helper lpc_ich i2c_smbus virtio_balloon joydev drm fuse xfs libcrc32c ahci libahci crct10dif_pclmul crc32_pclmul crc32c_intel libata virtio_net ghash_clmulni_intel net_failover virtio_blk failover serio_raw dm_mirror dm_region_hash dm_log dm_mod
[   20.511847] CPU: 0 PID: 568 Comm: kworker/0:3 Kdump: loaded Tainted: G        W         -------  ---  5.14.0-578.6675_1757216455.el9.x86_64 #1
[   20.513157] Hardware name: Red Hat KVM/RHEL, BIOS edk2-20241117-3.el9 11/17/2024
[   20.513918] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
[   20.514626] RIP: 0010:virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
[   20.515332] Code: 00 00 48 85 c0 74 0c 48 8b 78 08 48 89 ee e8 51 50 00 00 65 ff 0d 42 e3 74 3f 0f 85 69 ff ff ff 0f 1f 44 00 00 e9 5f ff ff ff <0f> 0b e9 3f ff ff ff 48 83 3c 24 00 74 0e 49 8b 7f 40 48 85 ff 74
[   20.517272] RSP: 0018:ff34f0a8c0787ad8 EFLAGS: 00010282
[   20.517820] RAX: 00000000fffffffb RBX: 0000000000000000 RCX: 0000000000000820
[   20.518565] RDX: 0000000000000000 RSI: ff34f0a8c0787be0 RDI: ff218bef03a26300
[   20.519308] RBP: ff218bef03a26300 R08: 0000000000000001 R09: ff218bef07224360
[   20.520059] R10: 0000000000008dc0 R11: 0000000000000002 R12: ff218bef02630028
[   20.520806] R13: ff218bef0263fb48 R14: ff218bef00cb8000 R15: ff218bef07224360
[   20.521555] FS:  0000000000000000(0000) GS:ff218bef7ba00000(0000) knlGS:0000000000000000
[   20.522397] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   20.522996] CR2: 000055ac4f7871c0 CR3: 000000010b9f2002 CR4: 0000000000771ef0
[   20.523740] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   20.524477] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
[   20.525223] PKRU: 55555554
[   20.525515] Call Trace:
[   20.525777]  <TASK>
[   20.526003]  ? show_trace_log_lvl+0x1c4/0x2df
[   20.526464]  ? show_trace_log_lvl+0x1c4/0x2df
[   20.526925]  ? virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
[   20.527643]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
[   20.528282]  ? __warn+0x7e/0xd0
[   20.528621]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
[   20.529256]  ? report_bug+0x100/0x140
[   20.529643]  ? handle_bug+0x3c/0x70
[   20.530010]  ? exc_invalid_op+0x14/0x70
[   20.530421]  ? asm_exc_invalid_op+0x16/0x20
[   20.530862]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
[   20.531506]  ? virtio_gpu_queue_ctrl_sgs+0x174/0x290 [virtio_gpu]
[   20.532148]  virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
[   20.532843]  virtio_gpu_primary_plane_update+0x3e2/0x460 [virtio_gpu]
[   20.533520]  drm_atomic_helper_commit_planes+0x108/0x320 [drm_kms_helper]
[   20.534233]  drm_atomic_helper_commit_tail+0x45/0x80 [drm_kms_helper]
[   20.534914]  commit_tail+0xd2/0x130 [drm_kms_helper]
[   20.535446]  drm_atomic_helper_commit+0x11b/0x140 [drm_kms_helper]
[   20.536097]  drm_atomic_commit+0xa4/0xe0 [drm]
[   20.536588]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
[   20.537162]  drm_atomic_helper_dirtyfb+0x192/0x270 [drm_kms_helper]
[   20.537823]  drm_fbdev_shmem_helper_fb_dirty+0x43/0xa0 [drm_shmem_helper]
[   20.538536]  drm_fb_helper_damage_work+0x87/0x160 [drm_kms_helper]
[   20.539188]  process_one_work+0x194/0x380
[   20.539612]  worker_thread+0x2fe/0x410
[   20.540007]  ? __pfx_worker_thread+0x10/0x10
[   20.540456]  kthread+0xdd/0x100
[   20.540791]  ? __pfx_kthread+0x10/0x10
[   20.541190]  ret_from_fork+0x29/0x50
[   20.541566]  </TASK>
[   20.541802] ---[ end trace 0000000000000000 ]--- 

The warning is from here:

/* For drm_panic */
static int virtio_gpu_panic_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
                                           struct virtio_gpu_vbuffer *vbuf,
                                           int elemcnt,
                                           struct scatterlist **sgs,
                                           int outcnt,
                                           int incnt)
{
        struct virtqueue *vq = vgdev->ctrlq.vq;
        int ret;

        if (vgdev->has_indirect)
                elemcnt = 1;

        if (vq->num_free < elemcnt)
                return -ENOMEM;

        ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
        WARN_ON(ret);

        vbuf->seqno = ++vgdev->ctrlq.seqno;
        trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);

        atomic_inc(&vgdev->pending_commands);

        return 0;
}


Add an option for drivers to bypass the common break+reset handling.
As DRM is careful to flush/synchronize outstanding buffers, it looks like
GPU can just have a NOP there.

Fixes: 8bd2fa086a04 ("virtio: break and reset virtio devices on device_shutdown()")
Cc: Eric Auger <eauger@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Can someone who knows more about DRM and shutdown please tell me if this
is a good idea?  Posting for testing and early feedback, completely
untested.



 drivers/gpu/drm/virtio/virtgpu_drv.c | 9 +++++++++
 drivers/virtio/virtio.c              | 6 ++++++
 include/linux/virtio.h               | 3 +++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 2d88e390feb4..210464146a9c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -128,6 +128,14 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
 	drm_dev_put(dev);
 }
 
+static void virtio_gpu_shutdown(struct virtio_device *vdev)
+{
+	/*
+	 * GPU is used by drm panic after shutdown.
+	 * Do nothing here, opt out of device reset.
+	 */
+}
+
 static void virtio_gpu_config_changed(struct virtio_device *vdev)
 {
 	struct drm_device *dev = vdev->priv;
@@ -162,6 +170,7 @@ static struct virtio_driver virtio_gpu_driver = {
 	.id_table = id_table,
 	.probe = virtio_gpu_probe,
 	.remove = virtio_gpu_remove,
+	.shutdown = virtio_gpu_shutdown,
 	.config_changed = virtio_gpu_config_changed
 };
 
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index 150753c3b578..95d5d7993e5b 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -407,6 +407,12 @@ static void virtio_dev_shutdown(struct device *_d)
 	if (!drv)
 		return;
 
+	/* If the driver has its own shutdown method, use that. */
+	if (drv->shutdown) {
+		drv->shutdown(dev);
+		return;
+	}
+
 	/*
 	 * Some devices get wedged if you kick them after they are
 	 * reset. Mark all vqs as broken to make sure we don't.
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 4d16c13d0df5..64cb4b04be7a 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -220,6 +220,8 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
  *    occurs.
  * @reset_done: optional function to call after transport specific reset
  *    operation has finished.
+ * @shutdown: synchronize with the device on shutdown. If provided, replaces
+ *    the virtio core implementation.
  */
 struct virtio_driver {
 	struct device_driver driver;
@@ -237,6 +239,7 @@ struct virtio_driver {
 	int (*restore)(struct virtio_device *dev);
 	int (*reset_prepare)(struct virtio_device *dev);
 	int (*reset_done)(struct virtio_device *dev);
+	void (*shutdown)(struct virtio_device *dev);
 };
 
 #define drv_to_virtio(__drv)	container_of_const(__drv, struct virtio_driver, driver)
-- 
MST

