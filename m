Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A06255E26;
	Wed,  9 Apr 2025 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744199132; cv=fail; b=YwPotEjqapJXlc7SXLZCD4mh8aE/4oIM3nU20sVrxoc2J6pPUNK22choLmb/oYruBGJTLfe1YzngzRZol50WbAKZ88iGQWK0+g0/FlkqFlggPaM+22v21/PIz6G3AsvOwCsm49B7nHk62UrBEfyvIQOwgo1yE7zdUVAJU9Pvulc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744199132; c=relaxed/simple;
	bh=UEr8Y8YBQheJXNHdEuKVrwxpydtLNkcqpC/XwML/e48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TTpY/X8jBJktacCbNIbCqmjx/fngZrARP6APl1mbA6VFiQ9oT3CIsR26Yg2haI5AZr08BL0WhuBUtRyPuVWn1ZXujcabG7SbsHqSncx4XSEgNOvj/juN9P7iIgPaXDF54aMa78I7/SYW5NOx+ZJvBLoBW49mWAvWPSQH4EaKotc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cMZVKw7T; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IM5nEEuo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cMZVKw7T";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IM5nEEuo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53950MGL025547;
	Wed, 9 Apr 2025 06:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=67gCw5xr0gYvcYcV
	RK+Eqp20QGguynH+jHyAvg8lBSQ=; b=cMZVKw7Tpl38tGc1z20U77y9lymUW6jk
	H7v/A3gmKwJlZAnk8E6NqyTB4wtku1BJ0mxuB/eK7raPCSRzqxzbDsSAcQAAfSLO
	VwTW1tOancgUvPioiZwgA8XOjpuoF5Po0BJrfaPWlRNfLxLyjsQV+JhvYEGbRN/a
	iB7X9TgYkUoYLiwOvBu9AZQNC4PPPMhx5yytKKMRIxts1cccgkOBmhtMoTd3dobL
	o7wg4HNcb/0EkufXHKMmRcj1g5UGt/RahKk3ncBWOTwXj91OkfDA/innSpAEWOwI
	vldtRkCCI6LTSId4I+qDD+kcva272JusIFOBbI96EyjHzuDRX5PANQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45wf0grjus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:45:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViY54l9TNMBX5uverercCXvrKhkwl1IL8AZ/lF8gvWFBF82AHLiydd+z3+1TzDo2KU8vU1Hpcd4GlRweuYB1VC66fh1hqgj2OMajV4hQHwgy7Q6CiOfvpZgUtXoWEWCRxhDI8s5j8Xa0YXZAD9INADfHaHLg0iDTqchQ2vzY7WCzARRmPiDBoBvvuTJ0MFSCv/fMWurZjgFveAGaEr4Yi2bBl9S69z4c8WmCp6/G3BukjyDmkDVPI60fASc8KHNzpjaCJVg03aQ2MCf3nggcAickvUjnGQ/pqwJBTDOe0YvBhrfC9cgs6VdWTZapHxhQED5jrtbR/2thViBgs6EwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67gCw5xr0gYvcYcVRK+Eqp20QGguynH+jHyAvg8lBSQ=;
 b=phWwhZZrT73pZ41lbOhWhzR+2vvXna36BxMEBFPn2fqwEyw47islsYK8i9utd4jDv8y6Z3+DXV+kI1SqAbGeJtOjVrU0yP3xJqO9dwm8prr5sYpXQ0bErP9RrVJ5rRQNPlYdsdiO8V8FYiGazHdeLXG2Rc+1NSSAS7oZ8Btmv3lDn9FPuWLJYRe3Hta6W4zV0jzp+SOuEnm5G9bD1x2g+kxPKBr7/0rWyZWDtHn1dY6SFGd4IqIgG7yV8WktbGiNagq5TJkdmNKYa0Ss86+3jo1nDy2IRJwaT7Smflj/IzrnWNzYCK8QmVXnhWQej/73F+S+u80GOuWDgBh4Ft1bAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=temperror action=none header.from=opensource.cirrus.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67gCw5xr0gYvcYcVRK+Eqp20QGguynH+jHyAvg8lBSQ=;
 b=IM5nEEuohvdoIaS8bdn1KFVWiFE1gAkAS6j4N79IWFYg2DUpMw3rcPNmZ+wfS1qw0/PY0GP8gbsF9vdSJ68MOgMW7XLAl970DKi3MJkg8Ydm1kBpRV1aSqLiV7B4YCETMg125LwZcGa7cnSu6m6s48uiOhmQb+a63PfUlxfksXA=
Received: from BN7PR02CA0035.namprd02.prod.outlook.com (2603:10b6:408:20::48)
 by SA3PR19MB7447.namprd19.prod.outlook.com (2603:10b6:806:305::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 11:45:23 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:20:cafe::a6) by BN7PR02CA0035.outlook.office365.com
 (2603:10b6:408:20::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 11:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 84.19.233.75) smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=opensource.cirrus.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of cirrus.com: DNS Timeout)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.0
 via Frontend Transport; Wed, 9 Apr 2025 11:45:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B6EB406544;
	Wed,  9 Apr 2025 11:45:20 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8E98F820259;
	Wed,  9 Apr 2025 11:45:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cirrus_scodec_test: Don't select dependencies
Date: Wed,  9 Apr 2025 12:45:20 +0100
Message-Id: <20250409114520.914079-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SA3PR19MB7447:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26f250df-1b40-466e-a2d8-08dd775c02d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vhSmdZyRiAeSB1NkvKqwRTM+3CQ2U00wleKTZX/agJp/CQ3yTxuyREByNitt?=
 =?us-ascii?Q?5YR3HmmxZcSvd9UpnBI4U+Ypfodn4H1hwx6YierjlLx/joY5NuGBE3iMfMBU?=
 =?us-ascii?Q?kBbEgr+0Ta2K8Kgwx848iPL+qjsE0+E2rMLDBedNK1yRSMfOzDURwFED69kv?=
 =?us-ascii?Q?RvgdtHdt7GyZYhkc1hKdjZ0PmlP2vmHzKO8NqbTV5+MK8iTxIKkVL2QRH0fA?=
 =?us-ascii?Q?CqMVsvKWxWuRoi7pM6ueep/IR2ADOLL9xU8lnl2xqVoe1RWGCWGyxGQO29rj?=
 =?us-ascii?Q?lkdWfT3f5XMbyjt8zdfB0Eml4E3MblPsKOoWl12IFHhQy4URn5q6QZhQ9GPx?=
 =?us-ascii?Q?TAi+ilCgXGr7oMnfk/Yy+aVIyo0WU3fwgEicMYEep5CATYAfrA94fIDDCndg?=
 =?us-ascii?Q?oKXVpOxCMEfhXF9SJwDWPRxs7C4tEaknbiBzaPS8KjpzcQwbXxVgoNfA8dhF?=
 =?us-ascii?Q?RgSo1WB45OmZfBIzjL6kiFHFt+NfXRNIilch6bncmjDMkxuzk9gewsXYmIKq?=
 =?us-ascii?Q?Jg9NYpfHU7Fikt72RX/3fe2NS9iUZ3/FSJBhjpoSnihiQCt+jD0y3K9Phuvv?=
 =?us-ascii?Q?wFsnRfGWXk8irDwNAaY46dNmK2vSJatMh5XCkVkSwtck+3HPmSSBqDV8kAok?=
 =?us-ascii?Q?HxK7xt8c/088/aWGfdCQzDKXxvUgrDIclL4bDMhbkZGUh2JiImMJklk77p8p?=
 =?us-ascii?Q?p+1175OHYzwofkDK2914+ZCx0SOA3hkrMM1APKA9H+PqXvZncqxrgpMgnCCq?=
 =?us-ascii?Q?eDe+Uc4GaliZliye/3QQBvUbVYbGCVhteWGosru10MA2JUS7ztKTV8SzMqF1?=
 =?us-ascii?Q?HCCEOxV+M15he1UEjMx8zMYwI23AWxB2usFhy3GhmZ95J4ZdXG1RTZ9VOec8?=
 =?us-ascii?Q?ZSMAoeO6Ufn6OY5sZ66fNsv/X7Try/lz57Yc5zVqHxChsG+Hm/ZtfFLUIC0k?=
 =?us-ascii?Q?oYZtaenR8ysCw574+/Ewqug4Kt5/OcxkLY0rkpSdLAKiWF9HUjgbMPdL+Lur?=
 =?us-ascii?Q?6lqkbbt0SNZsRpNNVnuNPrQWswc1rtdSgF9Zlg+UL4m8lzGckFx0j3p+gbpT?=
 =?us-ascii?Q?J+tcf48p12dr4fXB5EfhR+KroDT0qZH5StLKw1pFF1sBA+R7tah8qZrVF7Qr?=
 =?us-ascii?Q?9AlLCO787Z6j5K3lvoMh+hk2FA640Pp/yKN6sEHwXpQ20WEWugiAbalzVLCE?=
 =?us-ascii?Q?6d4YY89FICtAStvpEkamwBFq4Cio4AeK//otjhHGSVjVV64pCcnD4mtuaq7U?=
 =?us-ascii?Q?P/da0QwaqyYpPQZuCL0Si4ZYloqXxYHUSoW+J0Irdxd2vFgg64/EFHb+vWOe?=
 =?us-ascii?Q?H5HSAHUSn/xUqj+s2omn9AUM0gbGItFT7Q2QYtPlWkAB8Cpd7fxzR95ycG2x?=
 =?us-ascii?Q?+oJ09x689ovXd603SyJTWpe4pugJE0cyw13U7dTJra6po5bVp4NwToPP89Bi?=
 =?us-ascii?Q?Ke5otQ6gGWsWSzYhFGYqnRwIXhoQZrZAfdNIxLbXkXwqnAHBZMCOeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:45:22.2258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f250df-1b40-466e-a2d8-08dd775c02d0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7447
X-Proofpoint-ORIG-GUID: _T0wWLFPtL2ufjueqNlEKksZTaVOdHAV
X-Proofpoint-GUID: _T0wWLFPtL2ufjueqNlEKksZTaVOdHAV
X-Authority-Analysis: v=2.4 cv=A71sP7WG c=1 sm=1 tr=0 ts=67f65dd8 cx=c_pps a=yfraj20uO1EtZH+TM7jpHA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=Gmyiygrw4eWkRMMW2-QA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Depend on SND_HDA_CIRRUS_SCODEC and GPIOLIB instead of selecting them.

KUNIT_ALL_TESTS should only build tests that have satisfied dependencies
and test components that are already being built. It must not cause
other stuff to be added to the build.

Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index fb955a205d50..9c427270ff4f 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -96,9 +96,7 @@ config SND_HDA_CIRRUS_SCODEC
 
 config SND_HDA_CIRRUS_SCODEC_KUNIT_TEST
 	tristate "KUnit test for Cirrus side-codec library" if !KUNIT_ALL_TESTS
-	select SND_HDA_CIRRUS_SCODEC
-	select GPIOLIB
-	depends on KUNIT
+	depends on SND_HDA_CIRRUS_SCODEC && GPIOLIB && KUNIT
 	default KUNIT_ALL_TESTS
 	help
 	  This builds KUnit tests for the cirrus side-codec library.
-- 
2.39.5

