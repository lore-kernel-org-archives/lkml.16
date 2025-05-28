Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE9A6AD3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467797; cv=none; b=BE/nmz9jbc2etbZzN3/9/la9ZgIyhCqm0HJ8fLCnngziIMcF9oHz1dC3GW1zDPxgkWN/KWWYwWXvvEHwKXjQVKY/0ZIAFIVQWVpqcN3zMYA0PnpfsqQLDEkEvO8w07vmRzTcd/rOfX+abO2pDUO45dhuzQWsZZf9WccDmzZMxLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467797; c=relaxed/simple;
	bh=6xq/atNqNxSnjs/EFwkGKXlHoqkNTlt4lPuT3xIcHcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dU2ltLVGNiQtJLENC+89EVReOL2uv+dfuIIo3X88S515Mq3CRIpD+wb9MkCzHgt8VISGEF2kV/OAAzJPxow43htqHzzw0Xi1xgonMJG2dHGyDnrAmBY7psRnn/3BSnbOJ+lUVfgq012I71gKczMtKJ9AGMrsA7icI5KmDPMqx8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CInAP+0x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CInAP+0x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SHTTwg022079
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vXZ9SEQrVJeMggNhRwI6U0
	eU9ZVFCs4lqNq+BNKJ4Oo=; b=CInAP+0xzRtTU1ckDbpxX1Zu+YSXvKXUHI7ino
	ngcykDRTglkHKnvraN2yJRJ36IHHg0LfaZrsQ6M01J6zL8Xjy1nAqGiG6DrdlGmW
	ZAdIU7dQt+uLgWUlAjZreMMx8yaJHnHCuHQkN+J1RF0bJD4VtYW2PZ+yjSFjR5Zg
	6PR9cclJYpqi0sR6oBJOGO/+imJ6jG8Sn90bejAbqKhT3JW6bChNQxoaCARL2bq7
	DAQYF4NLB8d0jrjPOI2mz4ANnxhiEUE3BhuduE1kXGA4LHeUTahsFrTp9cEPh7F/
	L4hYU4MurvAMgJ0ENnaoa30UNdKwmyyy/yVJak5tG917zGaQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xc8hva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:29:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fab1bd8a71so5360826d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748467794; x=1749072594;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXZ9SEQrVJeMggNhRwI6U0eU9ZVFCs4lqNq+BNKJ4Oo=;
        b=TWVSigbmSDLMf1up+KYnt4PseH4Z//SjKK88Um42Gk8pDczbDhNpfxK5cb48lt2Ha0
         B3MCI4r2UJowCl+fMUQCroF0X3gzSKZGp1frSGvytoaKCc2hKsduxwa761gc6ZKIrXEg
         KDyIPW/UcSnQ/3P3HL6OxLs4SXVGNTeRk1mis2h0DPCZuqHkBtQRlj2AGFrCEv4Z1R/q
         Bz+Opf86hTawBFtM4vnCf59RwRYhai/oKN9qKrCS2YcXcLqTFk77QzaiJn6ACgPzfTeE
         UCbAaqhRBa7YMjnJn76RvZK0VTaf/HTSibImUaZjEQb51RYhsx2eJAdS3veINfnyX6tD
         x7ng==
X-Forwarded-Encrypted: i=1; AJvYcCWWS3RpLbDDxQMa8R0oRil2vjV8YoFiF40wAWaQ0Yo/1mdPFipb9abYGC6c3jkiCXrS6dNIrm1wjVsnhaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xYBmQVB+Xdc3OhGIvNGyTyckzMsiiKNHcSv6P3zmvX4iO1Mi
	yiZg/srWJZriF9iS5RYDEfzcIMsbcObobjEgP/61dPfBR5MzgMFfVGbXvlgZ/kLWJ9CpcvjT2/L
	YFeaI9KzlZrPtHMQ2jaMh0V4V7pBAvpBQ8JApDneND5C4ylCr+RZ0ayhTaIUV6GC+fO8=
X-Gm-Gg: ASbGncsGYFKkk3t8bWdhoj0Rj4AoGQkL6cSinuVTyMqDFawItTWlMpFm8CByZmpr82z
	5aM9nMUWSSjwIAub3S8m6Kw+ZeFUb/WusnHYirwej/yUeOYmkUpMN7qTg/vOd53tp/oTajL+5ul
	L+lw1aAShOSWhLb1QtfZ5bgRaG2AKSsds3JLouLKiL7/BMKix8lw1CYMJMvW5WjEvYfu5N1xLC/
	TJJtwX5s6SRL5OKExOiL8rWmjf0Z3TIS190CdhuU3W7ZwdeWE8vIWDM/LI3NXZpuQ3zlvI5G8Fn
	QGipx7ttNI/ac1WbkZJfEvCFjiThR5QQbanZuPFczll15P6PNX6GXg7nV1U33WhR0xFaBOI0cDR
	palj9chtZMlEUrgtzfLIQvaN6
X-Received: by 2002:ad4:5fcb:0:b0:6fa:c0c8:4666 with SMTP id 6a1803df08f44-6fac0c84808mr44267086d6.11.1748467793672;
        Wed, 28 May 2025 14:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG74eRX4V7wOqF46HjPJ7kQ9zRJHLqSzFoaXPxT/pacZMHoPveGI47Omklq+TzxGkSyAsptiw==
X-Received: by 2002:ad4:5fcb:0:b0:6fa:c0c8:4666 with SMTP id 6a1803df08f44-6fac0c84808mr44266756d6.11.1748467793230;
        Wed, 28 May 2025 14:29:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791ce4asm18096e87.188.2025.05.28.14.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 14:29:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 29 May 2025 00:29:50 +0300
Subject: [PATCH] phy: use per-PHY lockdep keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-phy-subinit-v1-1-b74cadf366b8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE2AN2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyML3YKMSt3i0qTMvMwSXROjZEsLi0RDoySzZCWgjoKi1LTMCrBp0bG
 1tQCujayIXQAAAA==
X-Change-ID: 20250528-phy-subinit-42c988a12b6c
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.or, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5416;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6xq/atNqNxSnjs/EFwkGKXlHoqkNTlt4lPuT3xIcHcQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoN4BOuoxEflou1iT20hMXUG98t0nm+xS+0aOLe
 vL1DCqR8xmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaDeATgAKCRCLPIo+Aiko
 1WAmB/4w05AbK/CjkUEGEXu/uqwO1UR0X6GWBrhbq4OvUAeghHCnMerhKf5R7Dcwj6vHE/Q7eky
 7IeYPMU74K6rCufSNAtOGw+QUrKIBJ0gVH3Xj9vFOgARVB5SuQ5SEaSBkOST069K83tfouRXlTP
 03hDw6xcEwayOs18+W+W2nPPEcIM1eovb9CWygjvBKOW9pWwKbPNwy1g6YRyg7gvggjkI73NVdQ
 B/NBgf1zNSfWZCiseY/s6oF35ilq7R5jHvUeRZ+ONOmWbYq1Zm5SZPeqA3xl10yb+aaon1auFBw
 AsDzsKc6qJPoW7MuOW4psVuogiFDQIGIhMmgPS9toxNvctDS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE4OCBTYWx0ZWRfX0EuBYuFS4mNp
 PyI4sGw1/VaYaZIeOUK/2DZeZcoVqyxvZLEzHVmnMsClmWOuYvGQ/kviX9Y2qUBU9jmAIjffnmP
 k+Cqry7tDef/2ggpvEj07csx8359Pa4UT3ArUKO2yOxPilLyTFJ6xPIcisPq1S3akVo9BX36wIB
 yMBwWqH4GLtkgaRG7Ns2SOg3IH21ERluxWIYiPELxRiwZfcLBzH5CLKdENGaAiar2FXu265aO85
 6RcsIWiiW2uDHxAfbbQNP/CSUfn1whJ9V/aXOWQ0wd62lQMHbBguhV8aY63PkUSe8qWV3MKQJ++
 szFtVa6rcwK7MmZqA8ipDobvm8h52+v2KGVg5hZRoyft1Br/HgGcLSE/KiMmiiA58gnHw27OkVd
 g0TcnTmsg8iOfH2vj+zy0+G5vnJ+BGCVZKLcQgELoCVpMBC+vqzRIZKmzfDV1R5XVH2q+vx1
X-Proofpoint-GUID: So_kCjSz-Cv3D67TlUFNP0QfngAV0YCE
X-Proofpoint-ORIG-GUID: So_kCjSz-Cv3D67TlUFNP0QfngAV0YCE
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=68378053 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=83vSGatpBiZI-y3EDzYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280188

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
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250528-phy-subinit-42c988a12b6c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

