Received: from outbound.pv.icloud.com (p-west1-cluster5-host9-snip4-8.eps.apple.com [57.103.66.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48802BD591
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431318; cv=none; b=C2LLizFFsPjOLQ+vU4pS6vwIVIjDTHzyxTXZy2tFSTghgv+ChAYxoSqDry0t62IQc4DM0D5uN4ch4qlUTrIt0CpGt2EjvhyKRT+kENaqdgFGWtMqQ4FG9dVvOdi7GWiwbkqO6BtX+MwTHqcp58A/WGrDhdHjjvmz176gDC0FQsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431318; c=relaxed/simple;
	bh=+5pngEUzCp9FTAmk1FjJmT5xHZ0x4ywpttSKHWJREQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fOiFDVcFlkKNUR3+6U4D5nEWjOapx/Nj6nH9Pa1KvjgCgl/hglAAHDs12g5bYbtqZxwVtsUmpMv/1kpnkXYluQ7Ehs96okf4Er8v2bSxPBJjhsky5l2wPwZzfIx6X/blnlf4DoyWL45xjxx5m6zwMH4YtrfcWGhrHntgm15169M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=sDo2dPd7; arc=none smtp.client-ip=57.103.66.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="sDo2dPd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=avpJDnO/AQa4L7qlBiS3/0Z2+LJjEKJMMv9hvOgP8e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=sDo2dPd72kGMF4ciENM0KpcCuxImeTRcwTlCVwDaPNtx/lLBQxL3ztW6HLmvXBnOE
	 FGtgHCb719guJfZxCJGfvQjKgO/f5BZoVI3ZYkCPhI2xt7a+sbYx6eUDWYZ1gq5eMC
	 QbLlwzNE2kKsZhJk9UD9AbQiaVoc5oNpi1Su0Fg55iPwW/2q+RJCOAAReLR8vHV5c0
	 oHI9441FSsXmRumghA1GLvQLeIzsko4BgvfVH+bCXAIrzkalCr2rgV779WJSQOUEot
	 WU1eF0v8DtRrS9Ufuo8PpEoHHHWbDB23WikjZxe/g/XAnuC5KDJ7isS0yE776VvV2K
	 /r7fM8GeZob+w==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 716DC1801151;
	Fri, 20 Jun 2025 14:55:11 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id CFEE018029B7;
	Fri, 20 Jun 2025 14:53:55 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Fri, 20 Jun 2025 22:53:32 +0800
Subject: [PATCH RFC] char: misc: Enforce simple minor space division
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-rfc_miscdev-v1-1-fda25d502a37@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOt1VWgC/02OQQrCMBREr1L+2kCTJjbpVvAAbkUkyf/RLNpqU
 osgvbuhiricGWbmvSBTipShq16QaI45jkMRfFOBv9rhQixi0SBqoeqtqFkK/tzH7JFm1mrtAtf
 OWYVQGrdEIT7XtSMc9js4fcxE90dZnr6Js5mYH/s+TuXJiFa4prVWBt14q4TDYDzfokLNHSJvl
 JRGwj9RV/14yuHKc7WJtUYiSaGMMqKbOZyW5Q1WH5z+4QAAAA==
X-Change-ID: 20250620-rfc_miscdev-788bf18bba5d
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNSBTYWx0ZWRfXxFtq5C8afgfi
 VaeraoLBA7stuJN+2S4DnpUPJhnFA+FCBxQhdFcCMS8Odc6HAMWOo5HAWu8SARCoHJp+4HG1eUf
 JRaXE19ydMkDCaZhCl/H2NHNZroF2DQ9zNqYG5klDG7PULWNmMQa6Of66lA2WPWZe8HV56zYu6I
 dPoQrxOiPI4G7w4CPEb8H/AoBQaIrdzYOhDIvKfffrKe3qrkVNMqNTEa6gRzqeZmkGH1dXUYQxx
 aM5OeRILnCVT7nJXb6lZ/iwhAPGaACt+OpgoB9BBZs3TtnNbnoJmZyZXCsIhPnlpN+mmU1Ux8=
X-Proofpoint-GUID: lx9Ek0pTvSeRj_tVpRQHKQI_NZLnX9sL
X-Proofpoint-ORIG-GUID: lx9Ek0pTvSeRj_tVpRQHKQI_NZLnX9sL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506060001 definitions=main-2506200105

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Enforce simple minor space division related to macro MISC_DYNAMIC_MINOR
defined as 255 currently:

<  255 : Fixed minor codes
== 255 : Indicator to request dynamic minor code
>  255 : Dynamic minor codes requested

This enforcing division also solves misc_register() reentry issue below:

// Suppose both static @dev_A and @dev_B want to request dynamic minors.
@dev_A.minor(255) @dev_B.minor(255)

// Register @dev_A then de-register it.
@dev_A.minor(255) -> registered -> @dev_A.minor(500) -> de-registered
-> @dev_A.minor(500)

// Register @dev_B
@dev_B.minor(255) -> registered -> @dev_B.minor(500)

// Register @dev_A again
@dev_A.minor(500) -> encounter -EBUSY error since @dev_B has got 500.

Side effects:
It will be refused to register device whose fixed minor > 255.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/misc.c        | 16 +++++++++++++---
 include/linux/miscdevice.h |  8 ++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index e5ea36bbf6b3d1313eb35d3259617bf90c55727d..e6a5907bbf915b4dd64522ada3024ba163cb7aa3 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -132,7 +132,8 @@ static int misc_open(struct inode *inode, struct file *file)
 		break;
 	}
 
-	if (!new_fops) {
+	/* Only request module for fixed minor code */
+	if (!new_fops && minor < MISC_DYNAMIC_MINOR) {
 		mutex_unlock(&misc_mtx);
 		request_module("char-major-%d-%d", MISC_MAJOR, minor);
 		mutex_lock(&misc_mtx);
@@ -144,10 +145,11 @@ static int misc_open(struct inode *inode, struct file *file)
 			new_fops = fops_get(iter->fops);
 			break;
 		}
-		if (!new_fops)
-			goto fail;
 	}
 
+	if (!new_fops)
+		goto fail;
+
 	/*
 	 * Place the miscdevice in the file's
 	 * private_data so it can be used by the
@@ -210,6 +212,12 @@ int misc_register(struct miscdevice *misc)
 	int err = 0;
 	bool is_dynamic = (misc->minor == MISC_DYNAMIC_MINOR);
 
+	if (misc->minor > MISC_DYNAMIC_MINOR) {
+		pr_err("Invalid fixed minor code %d for misc char device '%s'\n",
+		       misc->minor, misc->name);
+		return -EINVAL;
+	}
+
 	INIT_LIST_HEAD(&misc->list);
 
 	mutex_lock(&misc_mtx);
@@ -282,6 +290,8 @@ void misc_deregister(struct miscdevice *misc)
 	list_del(&misc->list);
 	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
 	misc_minor_free(misc->minor);
+	if (misc->minor > MISC_DYNAMIC_MINOR)
+		misc->minor = MISC_DYNAMIC_MINOR;
 	mutex_unlock(&misc_mtx);
 }
 EXPORT_SYMBOL(misc_deregister);
diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index 3e6deb00fc8535a7571f85489c74979e18385bad..9e19bce981f065ea612da0a330c529e9c044c996 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -71,6 +71,14 @@
 #define USERIO_MINOR		240
 #define VHOST_VSOCK_MINOR	241
 #define RFKILL_MINOR		242
+
+/*
+ * Misc char device minor code space division related to below macro:
+ *
+ * <  255  : Fixed minor codes
+ * == 255  : Indicator to request dynamic minor code
+ * >  255  : Dynamic minor codes requested
+ */
 #define MISC_DYNAMIC_MINOR	255
 
 struct miscdevice {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-rfc_miscdev-788bf18bba5d
prerequisite-change-id: 20250620-fix_mischar-794de4259592:v1
prerequisite-patch-id: 775e6edc4107a26a1fa30fd36315e4862dbc0cde
prerequisite-patch-id: e32024c7470a34eb019af4bf18c08f67c3589d7e
prerequisite-patch-id: 70045b4ad94130f051c314339a58217baed9190a

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>

