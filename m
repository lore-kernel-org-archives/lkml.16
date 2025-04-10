Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00CC280A2C;
	Thu, 10 Apr 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280306; cv=fail; b=S514/miSRW8LD4UlzsepMVZU61xONhdRcl9ooDNO1vf/ORRPFc1XBGAKMSR660BthffWUSLL8GCvKcwLWb6HN7oUviWmjbV7iawTt4iGBk5RU9UmcDtdzFUpqDIgvQGW0WeCGJ9HddYpivHSgT+WjijZa7NkyUCmH5xF3cM+HV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280306; c=relaxed/simple;
	bh=WISWL1jsm+OpKXfkC+2wYzTVwZYUnkglRBSfuO1x7C8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=c3Sq8KN+Aa6Zn3+4PcPBg/4hosdqahDyDBg3RfmYwLGSxMAZQ6CV0ck94pjdEUxsqG/5Hnl7nFMoVTqKvv8GISfaR+FYMkRriD8qbm0vGWtyGg2t3bvR/CcKgC6Az2gI2kDqOIJV3kUs/leOfr+uzYbsU0NXbGknWDlNlnQt+BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JdUSoFCR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ym8gN3Zp; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JdUSoFCR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ym8gN3Zp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A81sqD001182;
	Thu, 10 Apr 2025 05:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=EBXvXtH7UFlwJYJ4
	vwcryComv+iuz1e5zm5Jwl6qjhA=; b=JdUSoFCRfuF4HUmEZECImadt6QakHipo
	mCS3eWI1nzniHkg0iB8ek8uBS/JzBWIQxd1Cfp7DG0hS+jgBTCgLNPMbazeEgDwv
	E/IJTvfAXevMLaX59OFsc0w7EjuwWydHJB4S3NVzJtBQvyS9XA6X35uy/AgJVmGt
	fSYW5hv1g4x7Evxz13ryW5JioNoXl5PfJ1KT3Kel3LRzmfpaA3FCGJxEqg3Zn80y
	2uuZywUOGxGaRJK2TahVUfNDU2NY+gNI5KcX4387eJYG3P92/tSx/6JqSpBM7IKy
	lUnrY/6iPNeTPSaShpnzB6kUwq2wSAqWT9OT7CXaWSXwZ6Fs8DkjYw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45xa4bg555-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 05:18:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y07jLI/ZAxW60jhW2pxmvifej4vSWvH3s27qDnnT3Q/HGTiQnQ2jsYatJ5HC/GwuncdWzqz3m7OtS80YLxLfb7X95Z0f5Jes82+Vw/ltyeJFr76069uR3iYK5ObT4uES41RyvwEcMfbFoNwctfuBF95yJOYQjvClCpjcm1N94klRVcNEZIgo/MF3ejB1oBnd/w7U6HhdqLVFy/H5wAhf0Ee5QUcNrpx4MuhFm/LnSgjQyxcyaxAssCVOhksypTYfalE6eZCy56JQW2MvfNAOV+woW7oLeIQdZw0UIArJ2phnia72H6QumdbttkcCKTJEA25Bvv1M0E2gHRO4I/Ga8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBXvXtH7UFlwJYJ4vwcryComv+iuz1e5zm5Jwl6qjhA=;
 b=YyqFopHpWMw094yErhfjJs4WWx4hefVlq6UuUk4dQi373mBQdeR1onHrdva8l1KnYZqjC0Enhfwf2U03PYb8KDU8+2iX7DE9S3fdjgTwMiij6MC6CUo+Mwrpfl71FRjH6kA3wCo5kdUXmFG9pOcdn/hmprPKyMg9bdJMzSbaFulQ1RAnh1NA8qu+osV4hWhpv4dPbFElBFkM1xHI97qgLOlOzWApsUqm/in2yVMiEkjx5nSVpbMPpHOlzMIX3bjRLoULEp27GJ1aL2UDLXV4gHnlAJYWYt82T/3Gil73PBxQ1rcSovFFDEAP0sujdVGOlvqyvVY5lgWHzy+kHv1ggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBXvXtH7UFlwJYJ4vwcryComv+iuz1e5zm5Jwl6qjhA=;
 b=Ym8gN3Zp/phA4vSjJpUS517Dt/LOBUBK+8Sn1bKOQaubz7q7Yeocv8y99IprHRYVTo7nN79zLKxbCB3jS3uh4coqO1prwzbueDzHpvmWoncYloPKBQUKdNaO9+7ZNAzaZRNlSIr8MHmURsf84aGx2u5F1cQxg+qzgVtx1W0RaWA=
Received: from DM6PR02CA0050.namprd02.prod.outlook.com (2603:10b6:5:177::27)
 by PH7PR19MB8505.namprd19.prod.outlook.com (2603:10b6:510:2fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 10:18:14 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:5:177:cafe::1) by DM6PR02CA0050.outlook.office365.com
 (2603:10b6:5:177::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Thu,
 10 Apr 2025 10:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13 via
 Frontend Transport; Thu, 10 Apr 2025 10:18:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 206D3406540;
	Thu, 10 Apr 2025 10:18:12 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 104D9820259;
	Thu, 10 Apr 2025 10:18:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp: Use vmemdup_user() instead of open-coding
Date: Thu, 10 Apr 2025 11:18:12 +0100
Message-Id: <20250410101812.1180539-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|PH7PR19MB8505:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 842a6c17-fdc0-4544-8083-08dd781900aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nzJ9CfmIm5BLCp31wM23XLU2xdv2/D1KHhQLqey2d6tTU2uls/kKB9Ou8yrj?=
 =?us-ascii?Q?0p+jLZv4c+adHThCQ2ySGB+vsPyCkb6EiRi7xvybx76kr9jf4vMXpodtnCjE?=
 =?us-ascii?Q?sqBG2crj+lV2nRohhxL68KzUU6HYgs4k15x3okc6sceyAoBhu02YCILZIJzb?=
 =?us-ascii?Q?IXligPYyQoNpglpPwHhvH8Wb0uBXe4ixddmLXRg97QmmC8ji80aUc8ybTQR4?=
 =?us-ascii?Q?/iJoY2d0KDP+5wwQeqSc2fJlAXNMMcjr3/EdXoXpqnO7qDDPSzE3migbPtHM?=
 =?us-ascii?Q?gssO7SDiNbUdcCGNzLiBNi/+Hn1uy/N1zVz0tY1f/Qd0xKR6DWCh0pgT5kLK?=
 =?us-ascii?Q?yz2Hiegk7Wuu6AGAw/BvXiHDwXSYrNciIKH0Ev6frEtiBoKDqYinBylBgkjs?=
 =?us-ascii?Q?ns4R1/NcKLQlgIMVUWaxxtWSyy6i2ts6Gdo2I2G7ZytiT+tU9s0c2+BP59Ap?=
 =?us-ascii?Q?daileWSSKqKISvmGogHfQxAWAKaeMw2646ENVOsQvO18ettvOG1pWhIkVAYr?=
 =?us-ascii?Q?gvquT84Xq1eyigFBwC+SgvlMt6M8zSvvTzQJmuqa34A4avF1GJCqNwsvSQwR?=
 =?us-ascii?Q?0CX6JgTn6n5V5jgt3VDE/Ey5QqQ67c48tHA1ufoPo/6Tv4ZsHxdaiynn7WXF?=
 =?us-ascii?Q?ufrweWwmEJzNjzJ9w3B4WGavZw1m9Y47TkOQnTSDT4KCXPKiod8D+eIlibnE?=
 =?us-ascii?Q?MRtWjw6FlTq+lm2wNsAd4J5PiPXChqF8CZQV963FWD/7KGR96fsbXIwWq6y4?=
 =?us-ascii?Q?nSPgV0ZuL85rmXkM8hk0TzcH4xw5UzrUsjxmbgSsoRuI7AP5kOqM3PaU57ov?=
 =?us-ascii?Q?RRegqoRGlwUlWP8GZ1vkIZEixwleYtkfTy5XH8P5keXaypEN2eixhkJw3Evl?=
 =?us-ascii?Q?IPc2mw5mXv4Pv9pTieVv6o8EI1cLoi7EU7Qgcmo9oUc+uXSIqi1PblCkLSqT?=
 =?us-ascii?Q?bo5mEqk2b1OkFrY8VOrRvVwNaSkwm9NMKQzLH6lY4P2tSB8FAywim9cFLvWt?=
 =?us-ascii?Q?ks6iCFvDOr2+b3QF5OTZzqv2j67P0FQsW0Rg2WA1izHW98csWqKO6cEZUX0M?=
 =?us-ascii?Q?472ZoqHSaulfGXl8vqPw90vmAsPs3JOlIpOPNFWPUkPS04i2UYL/NR0ElFkL?=
 =?us-ascii?Q?YOb66T0k2wNfdjBJHlHDbS5qAiPlmfwpk7+Gm76J8ElDtcB9yEcVlV+SATqp?=
 =?us-ascii?Q?+2ljuitZWJJ1LGJIR0/+IF5/97g9qdaucY8vSl4tCfrkFyICvolZ06QrqSed?=
 =?us-ascii?Q?kKPluzYiUaQOau5gRcvLRDtz8pUIPLPgBWf9mGNqlyCs9WrIZO49g7lyNbuC?=
 =?us-ascii?Q?6SnC0mB47MtaSKh86f1z3Cx6KmgNgPf9KhAuudFiL8LMtEjTftgSunP/Lh91?=
 =?us-ascii?Q?tmflJSnCV8GQczE4DdpvrxdCySxpTlKKI/iGJz4RE6OJKdlvhg1MCnKA+rYw?=
 =?us-ascii?Q?+GiUlQcReiJHqavOWtXNRGKwH94EXDVljnmbRnHaCy0Vh0Fe42KoEXFlQWOO?=
 =?us-ascii?Q?7PisMMUpbRQlhkOvUDO/Q6XtwsDoYs2QVP/C?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 10:18:13.4355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842a6c17-fdc0-4544-8083-08dd781900aa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB8505
X-Proofpoint-ORIG-GUID: ca8aIrNjMz6BGd5l6lRh1TlH-nK862Q_
X-Proofpoint-GUID: ca8aIrNjMz6BGd5l6lRh1TlH-nK862Q_
X-Authority-Analysis: v=2.4 cv=B6W50PtM c=1 sm=1 tr=0 ts=67f79aed cx=c_pps a=o9WQ8H7iXVZ6wSn1fOU0uA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=s30H-A08ZOQPxGI4yEgA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Use vmemdup_user() to get a copy of the user buffer in wm_coeff_tlv_put().

Apart from simplifying the code and avoiding open-coding, it means we
also automatically benefit from any security enhancements in the code
behind vmemdup_user().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index ffd826f30e15..a2e9f32209cf 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -19,7 +20,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <linux/vmalloc.h>
+#include <linux/string.h>
 #include <linux/workqueue.h>
 #include <linux/debugfs.h>
 #include <sound/core.h>
@@ -415,21 +416,12 @@ static int wm_coeff_tlv_put(struct snd_kcontrol *kctl,
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
-	void *scratch;
-	int ret = 0;
+	void *scratch __free(kvfree) = vmemdup_user(bytes, size);
 
-	scratch = vmalloc(size);
-	if (!scratch)
-		return -ENOMEM;
+	if (IS_ERR(scratch))
+		return PTR_ERR(no_free_ptr(scratch));
 
-	if (copy_from_user(scratch, bytes, size))
-		ret = -EFAULT;
-	else
-		ret = cs_dsp_coeff_lock_and_write_ctrl(cs_ctl, 0, scratch, size);
-
-	vfree(scratch);
-
-	return ret;
+	return cs_dsp_coeff_lock_and_write_ctrl(cs_ctl, 0, scratch, size);
 }
 
 static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
-- 
2.39.5

