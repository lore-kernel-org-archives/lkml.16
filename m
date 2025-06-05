Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C431F4631
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749122756; cv=none; b=W2kAnOiC4SvBCqpO69T7Mzijo70piXwmCPZdDxp0q27cdTvwIBQDIybCkld60Quzvs2TjTY2vmqXgv7WLj6sKKTlplo7vVF0G7utAXdrCQdM51czpJqwxNxTs6zeF1Vx5ZV7g2iZchB5JLl/7Axq+YIMQ2dN1WTvDIZdGV+3guM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749122756; c=relaxed/simple;
	bh=5OSX8YQj8LBRkjoMLbB72aagfUyGWFLMgKaB9V8mKvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=if0mQ4NCjzApciLuzk9Oy1ruTMV4WCdBi0k8fJaNE3Br24zrDWMEH92puTRiRBE2pO7yQaZBZoFTtU0QUlkJbkHoxxE+JKCARjN5ky5Oo3runuuMt1u4VVgHkwLzBVGBPdvZPnIz52zhTFD839UW24dlABQpxJ9ux4NN1Iw5+n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvyYOCzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvyYOCzY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AE7ip011697
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 11:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Muh5Ll8OtdunKPtoiiN3qT
	cAf63dr6jLMjW475Agn8I=; b=AvyYOCzYEbCH/u5w7lfSMwWvxgYkzzWT/8upec
	kkCKF2YYoeGXBgJT9Tt4N848G0JI40j0OBLOpwZAmz8y4lFGoQqqfHJ+mD2TgWXV
	AdwV/GOa5ZgaE6LGGBCyuszlXfp4ra8lClR60G1fwgSHxrbVuWqOc9ah+DEJoBVw
	WHtCdmhUxTgsG4ypd4kssu2jR2jnEClqwhtD+bCkOoZn9akfuXogitV+JUEgcLcc
	b8AOYrKTbriZBfbYgkiao/vXW3UL4PN4LF+Jk0wysEqWE922ZK46DNPmFsayYfGp
	n7Zgi/S5ZSQmIkWAeAy1BTCGeer+SYuhfc4kV3H552uUxCOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wer7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:25:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caef20a527so234232285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 04:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122752; x=1749727552;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Muh5Ll8OtdunKPtoiiN3qTcAf63dr6jLMjW475Agn8I=;
        b=twFgD37hcNThWo1+sItCuwISv5CNBENCbaUFyNLnsKafbjOd8Qfj8PPDbsLXgStHY0
         C8ViZA2y9kMcwfntDwH143leJYkikZiBHIAQQx2WFty8TexBNxNVN49ndKxdJyL1RpOb
         RVoralChsyl7CWsw+IortuLk8gOXvMTe61QB1erHXuRuHOJ2jGV6Vqe0+rZ2NknBUF5r
         gEVEaUtHEbFiM3FHP3R7UN8IGq4CRn47AU707NAZ18Kh0hIIk1dDg5DJ5pjdKViZt/cw
         F2CgQdJb7MuOBAQFHrFZ23ABfHAGDXy/hrB9kMz7GiGfpXcnnATuAOhe2uE9uLAWp5sJ
         gz6w==
X-Forwarded-Encrypted: i=1; AJvYcCVCZzqNhregsw6XUz5mnwM7PRWne3nGAJnjmQy7Sz94IOgMiFkeYSooq9rLq9BdObJawgwnLSsKXzu1RUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DVbGSvWNeWzAUwWTFOuJN6Tp+wx7HSW3Iz7GVCt6QAHMLtku
	vXkXxKbayniiY6jf+ER7KfsxTs/05eDf7ioGX6tkj6qtuppCFDVp7BTZHMCz24puRRUiYosM7mu
	1hflIkYNRWLNbvbnG8/9QafTCuL+bVtiKB39oozONGo+zBbKLMvbEI5WeeMeP+gTj9sE=
X-Gm-Gg: ASbGncvplJmSvrV6eeVDtmx50ZVwWfpvYtklRp4NNI7l85ANOw15566OG8cjANiBMRG
	SyqiNjwS7KVCLEPE2qerQhiq4uyaHLfWkN7jI7a0akWQAo2Xl0eDxXqmrNLXXPOTvxnbl2G0dcc
	pDSCUNMBptiIrRGWix4NgGGCqV8oOTlYLjW2cXRdvqMZ6XU/4BArJ6K0TCeUHOz6ogBYL9FHqH5
	N7ZH+qDv6yxxWSb9GYWvn0ramjH2bS0ptxL6vt5hT+p67ix76PUdLMZC3i4H5XM1grD7QSnSnjy
	8zQccRae46cQpVa1BjSGvUyUQjeLHaaeQA6h70Km6wGqN9VBmBcfG981dNagxyYQAwQYPQPuAqU
	clx+4spTk/mmD5J2MRDZzU3Wf
X-Received: by 2002:a05:620a:6890:b0:7c7:827b:46bf with SMTP id af79cd13be357-7d219907d6amr910502285a.39.1749122752186;
        Thu, 05 Jun 2025 04:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYAFJYgNLRu75zOZn+s+HbisknmnkiVqX0CP0iUslKEgB2UseKmGSPrXkSwGkK2+faE9DzMQ==
X-Received: by 2002:a05:620a:6890:b0:7c7:827b:46bf with SMTP id af79cd13be357-7d219907d6amr910496885a.39.1749122751669;
        Thu, 05 Jun 2025 04:25:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533793774asm2592690e87.232.2025.06.05.04.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 04:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 14:25:49 +0300
Subject: [PATCH v3] phy: use per-PHY lockdep keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-phy-subinit-v3-1-1e1e849e10cd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALx+QWgC/23MTQqDMBCG4atI1o0k409jV71H6SKJsQ5UYxMNF
 fHujUKhQjcD78D3LMQbh8aTS7IQZwJ6tH2M7JQQ3cr+YSjWsQkwKFgBgg7tTP2ksMeR5qArISQ
 HVWoSF4MzDb537XaP3aIfrZt3PPDt+3WqgxM45VSdcy3rJitLJa7W+/Q1yae2XZfGQzYuwA+Rs
 SMBkWBV3RjBjAD5j1jX9QNFlF2v8AAAAA==
X-Change-ID: 20250528-phy-subinit-42c988a12b6c
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5OSX8YQj8LBRkjoMLbB72aagfUyGWFLMgKaB9V8mKvs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoQX6+NW1LsRa443FYZdaZnWjlG8DM5pTIQb7rb
 t0n/bC5RLyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEF+vgAKCRCLPIo+Aiko
 1S0ECACMbElPp1hYwsCgLEc+IUqP/E1VMDDT3ow6WxFNKRd0fR+taEspgGreV1nwXXmhLk8N1nT
 EcSdgc23TnESHt9ZAE1z2iMWqEeC0XNZbpS9o5gBigjU6oHhwoBsRj8wnHR93LGu/wsJGZvoKy+
 dOuMHBbkZbxuDNnCcyY/HMM2qmauNUoo/1AafxfB9ILcCF1O7aQzXUdzDOcUQWYS2naeKJ06Tmb
 uXwB9K+miDQ+PzwR5OOhQaFjO7F7N9MSaSpZGWQN4/71/de5oxvF+q6M8IME2oitf+OHjk7mNSN
 Vljb8s8RHxtGX3Peq+72C/Cq6vPcXnyfxIfDjZV0/eW+MJvU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PNCZni_q6Y1NopGo_p0icqTJYr-rdcP-
X-Proofpoint-GUID: PNCZni_q6Y1NopGo_p0icqTJYr-rdcP-
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=68417ec1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=83vSGatpBiZI-y3EDzYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=xwnAI6pc5liRhupp6brZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA5OSBTYWx0ZWRfX4nfrMDDPzN6c
 GRuiGn74Fn/Uux4qCQYNblU9D1maer0YZUaXzBs2nOYmjxrvOWpU0s1+B+zX3Yso35EiDOteaGV
 a9Jw0Fydev/qXtXPb3k4blhZ2YcC1l889N7AcBHIFKm91FsSmdr4AfeRbCbP7wf/lsb/ZBw7PTz
 X0EK7fxod8vuOiVaGF5Gdev/oTlgbt12OjUnbWNxfaiOKcaPUjd2sBqp6lUQlOaYjxtBXmr+/j3
 GaN045idSBOEuOYrNz+pbsW5ee9zqnG2UWdhdVHLia7OSEuJcCnhjMTESwaD8+56cC+iiotmAdc
 DLdQx9NEkCRbWzM6OkfOFP1o1U3VsDsomOinzwuVtQL3+nhtcU7RJaRLgrYGfDoIby9UiOcGAkp
 55Vjn8qrY9Yk6joDKijtEV0TTvdw2Z7cw0bxeyqkYtRFdCKuIXt0LUYmul2ur1LxExlMU6KS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050099

If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
repeaters are represented as PHYs), then it would trigger the following
lockdep splat because all PHYs use a single static lockdep key and thus
lockdep can not identify whether there is a dependency or not and
reports a false positive.

Make PHY subsystem use dynamic lockdep keys, assigning each driver a
separate key. This way lockdep can correctly identify dependency graph
between mutexes.

 ============================================
 WARNING: possible recursive locking detected
 6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 Not tainted
 --------------------------------------------
 kworker/u51:0/78 is trying to acquire lock:
 ffff0008116554f0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c

 but task is already holding lock:
 ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c

 other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&phy->mutex);
   lock(&phy->mutex);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

 4 locks held by kworker/u51:0/78:
  #0: ffff000800010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x18c/0x5ec
  #1: ffff80008036bdb0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1b4/0x5ec
  #2: ffff0008094ac8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x188
  #3: ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c

 stack backtrace:
 CPU: 0 UID: 0 PID: 78 Comm: kworker/u51:0 Not tainted 6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 PREEMPT
 Hardware name: Qualcomm CRD, BIOS 6.0.240904.BOOT.MXF.2.4-00528.1-HAMOA-1 09/ 4/2024
 Workqueue: events_unbound deferred_probe_work_func
 Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  print_deadlock_bug+0x258/0x348
  __lock_acquire+0x10fc/0x1f84
  lock_acquire+0x1c8/0x338
  __mutex_lock+0xb8/0x59c
  mutex_lock_nested+0x24/0x30
  phy_init+0x4c/0x12c
  snps_eusb2_hsphy_init+0x54/0x1a0
  phy_init+0xe0/0x12c
  dwc3_core_init+0x450/0x10b4
  dwc3_core_probe+0xce4/0x15fc
  dwc3_probe+0x64/0xb0
  platform_probe+0x68/0xc4
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0x3c/0x160
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x84/0xe0
  __device_attach+0x9c/0x188
  device_initial_probe+0x14/0x20
  bus_probe_device+0xac/0xb0
  deferred_probe_work_func+0x8c/0xc8
  process_one_work+0x208/0x5ec
  worker_thread+0x1c0/0x368
  kthread+0x14c/0x20c
  ret_from_fork+0x10/0x20

Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
Fixes: e2463559ff1d ("phy: amlogic: Add Amlogic AXG PCIE PHY Driver")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/lkml/ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com/
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: I've used a Fixes tag pointing to the commit which actually
started using nested PHYs. If you think that it's incorrect, I'm fine
with dropping it.

Note2: I've tried using mutex_lock_nested, however that didn't play
well. We can not store nest level in the struct phy (as it can be used
by different drivers), so using mutex_lock_nested() would require us to
change and wrap all PHY APIs which take a lock internally. Using dynamic
lockdep keys looks like a more ellegant solution, especially granted
that there is no extra impact if lockdep is disabled.
---
Changes in v3:
- Collected all the tags in a single run
- Link to v2: https://lore.kernel.org/r/20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com

Changes in v2:
- Fix lamsm ML address
- Link to v1: https://lore.kernel.org/r/20250529-phy-subinit-v1-1-b74cadf366b8@oss.qualcomm.com
---
 drivers/phy/phy-core.c  | 5 ++++-
 include/linux/phy/phy.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8e2daea81666bf8a76d9c936c1a16d6318105c91..04a5a34e7a950ae94fae915673c25d476fc071c1 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -994,7 +994,8 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 	}
 
 	device_initialize(&phy->dev);
-	mutex_init(&phy->mutex);
+	lockdep_register_key(&phy->lockdep_key);
+	mutex_init_with_key(&phy->mutex, &phy->lockdep_key);
 
 	phy->dev.class = &phy_class;
 	phy->dev.parent = dev;
@@ -1259,6 +1260,8 @@ static void phy_release(struct device *dev)
 	dev_vdbg(dev, "releasing '%s'\n", dev_name(dev));
 	debugfs_remove_recursive(phy->debugfs);
 	regulator_put(phy->pwr);
+	mutex_destroy(&phy->mutex);
+	lockdep_unregister_key(&phy->lockdep_key);
 	ida_free(&phy_ida, phy->id);
 	kfree(phy);
 }
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 437769e061b7030105c9ea4e9b0da9d32b6fa158..13add0c2c40721fe9ca3f0350d13c035cd25af45 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -154,6 +154,7 @@ struct phy_attrs {
  * @id: id of the phy device
  * @ops: function pointers for performing phy operations
  * @mutex: mutex to protect phy_ops
+ * @lockdep_key: lockdep information for this mutex
  * @init_count: used to protect when the PHY is used by multiple consumers
  * @power_count: used to protect when the PHY is used by multiple consumers
  * @attrs: used to specify PHY specific attributes
@@ -165,6 +166,7 @@ struct phy {
 	int			id;
 	const struct phy_ops	*ops;
 	struct mutex		mutex;
+	struct lock_class_key	lockdep_key;
 	int			init_count;
 	int			power_count;
 	struct phy_attrs	attrs;

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250528-phy-subinit-42c988a12b6c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

