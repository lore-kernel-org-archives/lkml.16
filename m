Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823C5242D8A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277081; cv=none; b=Yw7PgaZOMT4w36QC+HEMv2YnlRSfh/nm3exfnz0EWLUlcyY5vuQyYoQ4/XJ1UICNWE3Yxtf6HamfRDExiIiaPfjpdJD2j1YevzHpW/PHtcTP42Cj27sDzPdRo7UuCc6erl9RJ+qD5lwBCvZ2m7bgvCx3xoRquxpvO2cVip1BdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277081; c=relaxed/simple;
	bh=iqcbsqqx91hRFW3nOeQh2fCgpjZp4yNOzZLmUmGbW98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+4Do0BnoN+/A2UOr4xZ1j0SEqwnPccZHVWb/eW3VFa/Ryc6jfk8wx14+G9xnrpIwUD2Ep2BkXh0hpm3y/Ls3z8j/HoW+5jIek0vnoSyFVgSFpngeqXmMQnuWmeIvQLKe+v3j1Mj96usAL2ERLtDjloJNhbAmCL4phzG4VQwj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VYBsmTf4; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VYBsmTf4"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso846383a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751277077; x=1751881877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1axG9UN4guwGf2MhIje1rzGErylNfM2qtIpn5Wq0YrA=;
        b=VYBsmTf47dKbSkUhsOd2ZIbuVW56Xaek8A1Qiuhql52Tu/sQEOLBS46O/B15SRAIaz
         HcFpPz+RuzK5JWARO+aTjjhNCZYhDpUKv49gKC9zPlCIj1179jh10LHDTwV/c5YdNnb1
         f3QoxeL9NMklZTjw4BWw01oDyb23qkkfsn6RmUKPliepRsinYvkJHElypZhEhu2M93Zo
         qIv3a13Va+ANZowf9zOCi78KrcxaS9CECPYuQUubLYI0AxaRBmpJlbJqR5hx/swV2aYv
         VEwCV7Scz3h5bumsjp5J06zu5dNiOv9yPC6X3QuedX45X+ywrjL0VgzeSuHKmeTUvnXI
         7u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277077; x=1751881877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1axG9UN4guwGf2MhIje1rzGErylNfM2qtIpn5Wq0YrA=;
        b=qrixs5gnhtVHE++rAttVMJQDoHokYdtu0NaKrZUsfhjLjJJyhr5BDfwofBk5wz5T2C
         l4CrqBgpajw7L3I1l0Lkf/hNVKT6pYXVIcNhkrgCPpEXGAY9MyB67U3+AQRpLxbeEDW2
         C+wX6Ste1Ty6Ad9YejHHAgOG/Jhoc1hnE7BuAPPsY63t7pSVbcXLS+aUZaLfnpnAbqCV
         81hPOCWmg7J+oo7cb7HrxVim8I9TloBc6S7r3C1ByAMy0/DukkEhr0barLOjKTME28eB
         yr9/oUxhYD+FpMY2RAPIqyz/yb7hRhWjNPOlvsdQ6L3axLzWGejwLV8eJTobh+9i4iQR
         6ULA==
X-Forwarded-Encrypted: i=1; AJvYcCWjFlm0Jwc3WjQEQEtPgOvgsR/3GtRZBmcspNMNnLAlk6e6uGLDKcEP6DS/IcWa4AaGDnOmfJqFD2uKFLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4BIKp65zOOqcnATrKeUHQ6zg9SB3FqW6YpJORc0Zd+ECfP3r+
	97RVR+2nBnBLEoEdHJ/z16It//pzddOzHXsAj3vKgiV0f+C/foaCQce1QK6gb7IMGHA=
X-Gm-Gg: ASbGncvrO+B+5zX2W6uX0rJ2ed3zpUtgpDDIwhYuKOQU8452YZYnkNOLU4MKOYEL3ao
	sNXqJZqkkVi9mr8YmcL2rf5QUUWSmLujsXQz+Oo9aw4IP2TKD/SyDIjI+MmENTyw6oG7RR9x9Pi
	5uxUWdVtVdFaUXthWuXBZXsc49x/L8RH3jGXnSV2rzCJLHlbyFTlXsBRS7XA3KAwFfIy1P77WqQ
	DV1oxFiD+FNfHr7eMqucm+koo6AIufFIokXByAV4dKAltrwHpkDmmZBonpPvhcwHo/49WV9qROY
	zqqO3gqrSSkFJfwWfqoIWzMUb7L4MwyxJtPfhkChe5H5/CJJzk3OrA9RU91Y/qxJLTg6BP23
X-Google-Smtp-Source: AGHT+IHPgTj4lH/A7AaOqx4zS1bLYGSTxDSUFaa71SvEDg6oNnPYe86WGVy9RGJSkXmiLAkS60LykA==
X-Received: by 2002:a17:90b:35ce:b0:312:db8:dbdd with SMTP id 98e67ed59e1d1-318c925a50fmr17658008a91.28.1751277077433;
        Mon, 30 Jun 2025 02:51:17 -0700 (PDT)
Received: from vexas.. ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14e18bbsm8409468a91.23.2025.06.30.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:51:17 -0700 (PDT)
From: Zigit Zo <zuozhijie@bytedance.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com
Cc: zuozhijie@bytedance.com,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] virtio-net: fix a rtnl_lock() deadlock during probing
Date: Mon, 30 Jun 2025 17:51:09 +0800
Message-ID: <20250630095109.214013-1-zuozhijie@bytedance.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This bug happens if the VMM sends a VIRTIO_NET_S_ANNOUNCE request while
the virtio-net driver is still probing with rtnl_lock() hold, this will
cause a recursive mutex in netdev_notify_peers().

Fix it by skip acking the annouce in virtnet_config_changed_work() when
probing. The annouce will still get done when ndo_open() enables the
virtio_config_driver_enable().

We've observed a softlockup with Ubuntu 24.04, and can be reproduced with
QEMU sending the announce_self rapidly while booting.

[  494.167473] INFO: task swapper/0:1 blocked for more than 368 seconds.
[  494.167667]       Not tainted 6.8.0-57-generic #59-Ubuntu
[  494.167810] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  494.168015] task:swapper/0       state:D stack:0     pid:1     tgid:1     ppid:0      flags:0x00004000
[  494.168260] Call Trace:
[  494.168329]  <TASK>
[  494.168389]  __schedule+0x27c/0x6b0
[  494.168495]  schedule+0x33/0x110
[  494.168585]  schedule_preempt_disabled+0x15/0x30
[  494.168709]  __mutex_lock.constprop.0+0x42f/0x740
[  494.168835]  __mutex_lock_slowpath+0x13/0x20
[  494.168949]  mutex_lock+0x3c/0x50
[  494.169039]  rtnl_lock+0x15/0x20
[  494.169128]  netdev_notify_peers+0x12/0x30
[  494.169240]  virtnet_config_changed_work+0x152/0x1a0
[  494.169377]  virtnet_probe+0xa48/0xe00
[  494.169484]  ? vp_get+0x4d/0x100
[  494.169574]  virtio_dev_probe+0x1e9/0x310
[  494.169682]  really_probe+0x1c7/0x410
[  494.169783]  __driver_probe_device+0x8c/0x180
[  494.169901]  driver_probe_device+0x24/0xd0
[  494.170011]  __driver_attach+0x10b/0x210
[  494.170117]  ? __pfx___driver_attach+0x10/0x10
[  494.170237]  bus_for_each_dev+0x8d/0xf0
[  494.170341]  driver_attach+0x1e/0x30
[  494.170440]  bus_add_driver+0x14e/0x290
[  494.170548]  driver_register+0x5e/0x130
[  494.170651]  ? __pfx_virtio_net_driver_init+0x10/0x10
[  494.170788]  register_virtio_driver+0x20/0x40
[  494.170905]  virtio_net_driver_init+0x97/0xb0
[  494.171022]  do_one_initcall+0x5e/0x340
[  494.171128]  do_initcalls+0x107/0x230
[  494.171228]  ? __pfx_kernel_init+0x10/0x10
[  494.171340]  kernel_init_freeable+0x134/0x210
[  494.171462]  kernel_init+0x1b/0x200
[  494.171560]  ret_from_fork+0x47/0x70
[  494.171659]  ? __pfx_kernel_init+0x10/0x10
[  494.171769]  ret_from_fork_asm+0x1b/0x30
[  494.171875]  </TASK>

Fixes: df28de7b0050 ("virtio-net: synchronize operstate with admin state on up/down")
Signed-off-by: Zigit Zo <zuozhijie@bytedance.com>
---
 drivers/net/virtio_net.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index e53ba600605a..0290d289ebee 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -6211,7 +6211,8 @@ static const struct net_device_ops virtnet_netdev = {
 	.ndo_tx_timeout		= virtnet_tx_timeout,
 };
 
-static void virtnet_config_changed_work(struct work_struct *work)
+static void __virtnet_config_changed_work(struct work_struct *work,
+					  bool check_announce)
 {
 	struct virtnet_info *vi =
 		container_of(work, struct virtnet_info, config_work);
@@ -6221,7 +6222,7 @@ static void virtnet_config_changed_work(struct work_struct *work)
 				 struct virtio_net_config, status, &v) < 0)
 		return;
 
-	if (v & VIRTIO_NET_S_ANNOUNCE) {
+	if (check_announce && (v & VIRTIO_NET_S_ANNOUNCE)) {
 		netdev_notify_peers(vi->dev);
 		virtnet_ack_link_announce(vi);
 	}
@@ -6244,6 +6245,11 @@ static void virtnet_config_changed_work(struct work_struct *work)
 	}
 }
 
+static void virtnet_config_changed_work(struct work_struct *work)
+{
+	__virtnet_config_changed_work(work, true);
+}
+
 static void virtnet_config_changed(struct virtio_device *vdev)
 {
 	struct virtnet_info *vi = vdev->priv;
@@ -7030,7 +7036,10 @@ static int virtnet_probe(struct virtio_device *vdev)
 	   otherwise get link status from config. */
 	netif_carrier_off(dev);
 	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_STATUS)) {
-		virtnet_config_changed_work(&vi->config_work);
+		/* The check_annouce work will get scheduled when ndo_open()
+		 * doing the virtio_config_driver_enable().
+		 */
+		__virtnet_config_changed_work(&vi->config_work, false);
 	} else {
 		vi->status = VIRTIO_NET_S_LINK_UP;
 		virtnet_update_settings(vi);

base-commit: 2def09ead4ad5907988b655d1e1454003aaf8297
-- 
2.49.0

