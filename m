Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A021D3F4;
	Wed, 16 Apr 2025 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805792; cv=fail; b=pdAvzmjvHHQ+lfH4wZ1KE4qSkA7/JW3g2Si3V07EklaghdTGPUy8V2psvyw4QTPIADWC/oDbG4oHA87PpR/ABZ08XnMWl40Y/EAVcw+KKRMyo+Ea1xa/Oy1Qv+4KHDWlvadVpxaHeUVQndCHcrJiuuY3YrCgwc9Mf7CGhnwNZbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805792; c=relaxed/simple;
	bh=GNZLLj02RfqUbBZApDrPhtldjCsRIwY7airxzhRsUis=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=crD0ybVglko+4W0urmKnxlBmIQA0NfxK0P47zgg0XzFHD6kPLLFkq/oqDUuLH3haW0m3mk/DqqRcVUoU/hxamZB3OlNSBoHPnCG6ehbB5vaXDihQ2zJWPaoakQ+YIdv5858hSlYHcV0CmU3ahXsOwvCRtXiOx/J7NLd3gL2+ALE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ddrkGZJx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LYOoQYkO; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ddrkGZJx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LYOoQYkO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G1vm1Z005669;
	Wed, 16 Apr 2025 07:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=oNZHAELaBrfGxtzH
	dg5tPWqTBSNl1+Olul4Ck1yxP8Q=; b=ddrkGZJx6u1MstFM90pcN087qLmLJHkl
	27Nb7OIpk38H5ousNeiNMUvXO88JxuEFUbl9GeozbBxR/ZoP7Z8+YLF8F1n9xf8L
	SGGoqCmoQ5KGt2fwhZptRDXgE5mfHGPjK6KCt35Wrm+GdcJNS9iPtB+3jYQfAopL
	J3vjkXTXI5NXm8xzzr+kj/B0S45as6s4CN7FsN2EOXUE3c9PStdci3xgf1Ddiq+x
	RUlzTuHri5uEIIxgcLrFo9mw02efiKDrjv9LmZtoZxiaP+2exSRHmB8jA/U3q+km
	1+2SL7n2GkxJnsYKNw7Z/arMVY5wLrdXSgiq3YLp3hRrgc/7bWDiAg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45ymkgw3j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:16:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSfJ5xh8kMXDfn5u+HRZVHZGxc/tHRkCvfGpvoUnCdQKUtD+1hIytnCC0XMkpkrV0WJYxaFkO1+g/kbCzO0/V0iiSk77kcXYqSCxHgQ7+S43CoDgiv//TEoqTIlPczbK6YQfANuQkgIJVzyXdisllOR1EHOtIsm27d7xffWSMEAdCb7B5sgUGeqwLBPsSVh0AL/3GEj+sR2e574k7EtalTF+fvuI1YA0OzzqYA/KyaTWVVqt8JHAU92UtvX1P5wGftdzMv8qpgDFKLRpRpw1HKuoNeS0xKszzFWt92WD3xEkcG8vexooTZ9Eg4fcZl4c+8nKNFjXvCM4ZXyg2UkQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNZHAELaBrfGxtzHdg5tPWqTBSNl1+Olul4Ck1yxP8Q=;
 b=rZJ4CzCr0ZnwlYQSEM/Qo7Z2pB0Qlny4KeugXimA1HJGGoAwA3DyRPdN43SGSU9UklDSR+ZFJZQ0WId0CLQlBMZLrXvBLrPI6HHvextcuZWHa1gk1lnRvPZkChdDyrC994vcI9fNFzugub8RvQW4qSZ+JeREwl06QBvxVsrYCu7mFik4cfHbh0/bRAfrYiNV1E3ASVma55lB2esRDUL8UESppR/fVMcS1+V0DRgd5/Viz3AcxO7c82JebK+9pMZBZYKH6LF+eU/fvSmfO2kMVV6aaSL3HhITLIGSmwXW2JzpLOD1qOO4u6rMq/g1UDrHFxE1RlXNkbGHAIr6kMD6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNZHAELaBrfGxtzHdg5tPWqTBSNl1+Olul4Ck1yxP8Q=;
 b=LYOoQYkOq9R0SK3Tpsd1U8M1bWUI1LSHUO5CXRAE1ye2suuezJO/MMuLRDfdyh8rw9P0BaSWE44H6U3J1JJSNuVcH1gFtemAjoe41lGuGEg96jHWMULnH+8lI3/ykXZKp/9i4EyMjk2WeXzZO8v4F0QtCF/SQlyO2YilqnZHwsQ=
Received: from PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::13)
 by IA0PR19MB7242.namprd19.prod.outlook.com (2603:10b6:208:43c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 12:16:08 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::3f) by PH8P221CA0065.outlook.office365.com
 (2603:10b6:510:349::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 12:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.4
 via Frontend Transport; Wed, 16 Apr 2025 12:16:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9BCCE406541;
	Wed, 16 Apr 2025 12:16:04 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 663A5822563;
	Wed, 16 Apr 2025 12:16:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib-test: Use faux bus instead of creating a dummy platform device
Date: Wed, 16 Apr 2025 13:16:04 +0100
Message-Id: <20250416121604.780220-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|IA0PR19MB7242:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b9295dde-e527-4671-a371-08dd7ce07716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?43xN/3Ea63dw9SOpZXbHOe6rKyAhAqRECbJsLuVEWEom6UmTJ5BQaBgtyDmH?=
 =?us-ascii?Q?WH9yp2qkTwIngh9okGH8/2zHCTMikjC4IUlIgqn/WU5hC+hNAaJQeMemtUyR?=
 =?us-ascii?Q?pBNZACWUVmhVJvo92inZojiDQuahmTd49oVyh7dCnhjbWniyQZ/I7Hx9MuTn?=
 =?us-ascii?Q?x/R66SB/RxZvy2f7/njj0/KMjTBD8Fd8ezdsmFZTgsx8AD7UXqrhj95srKdr?=
 =?us-ascii?Q?7D8IK8K+xGEcqAaWhiTuTJwCLEkw7AHz+Py4/rw439ZJG8+D5XDVfhBdmzXQ?=
 =?us-ascii?Q?9gkiyk8312h/LsxBmc+/p2a63bO+257a3Gt4m7mlhcBCeIVPDrSEqJpJMBSf?=
 =?us-ascii?Q?XnNEE26TOm6FCfXInNpBHfyIDoEXJQ/neN3OGUOYxh2bpMw6cb1AfGgJnMiI?=
 =?us-ascii?Q?inST586JYVzqcD5olKqgt9TsZM/bjavKe25NmV2+nD+++4/6jYDDUApmEWEN?=
 =?us-ascii?Q?IRksVSneV51gzuyMFIDvYd797C/V1JzNnPfDl4rMMIeYohrPkKn4PT2fcmAA?=
 =?us-ascii?Q?Llq1iDV54f6bVJOLkvgQMsxwMf+Wz7GLNcd7y53AIsFc4u3Zrc2gfoNRm6Rw?=
 =?us-ascii?Q?NfT8BJZmw7l4uyRk+Cwf1A9nNAXp2NFBwO2+1xDt2zRhNuFHVXMMHG8a+R76?=
 =?us-ascii?Q?Liesq5LsdO9mHK6NdEp93T6k2LiNczPotsyod1J/f6ffSINWYVFZral6gNnM?=
 =?us-ascii?Q?BCWXrr0VQ3YTSgv2gR+01ovfh9Uo81gvJQspm8AhIftozqs1rdz97sW3H4DL?=
 =?us-ascii?Q?gN3HOlDKBKrGfQz5tS+s4PY1g96JLeauILqansL86Vh7Rst2rF0TTQ2XjT8h?=
 =?us-ascii?Q?aYncz7zFbUGZVmSw6tYMbkJK/M7I1bSzmXmXDl9yK+ekp5M0GNrhcyO90Cqj?=
 =?us-ascii?Q?3TW6e0lpA8JNvxOBfT5SzILZMA2N4a6eOT00pflOLL9IWZ+wctwaPxPo770J?=
 =?us-ascii?Q?SqrlqCc+IEZvuPmv6tpYEX5FFvgx7bN82Yzix6kxfHP6dxL/JGKHbfAq6koJ?=
 =?us-ascii?Q?KA40ZpAfdNeyi3h+leOUy7ZUA02K3x0XHHaUOzFY7pftFZmsmCTeshOv/EDO?=
 =?us-ascii?Q?2oCjn9D9Zbaxjdo2vxR014Xl5cse4kVOfckviLE/2lUXarvgnZ0E72DBg/3q?=
 =?us-ascii?Q?JuoEQcLHTcutv1tWVntAuPVqsI1tFc6c6VmrvvIPTOfB1Gjiiat0Ro8G9IwO?=
 =?us-ascii?Q?jPjrmuOFj/Sh5+pPey4/occ6qXvoJGk2N4xv14T/MZqkcfC3my5iOhz4wXTA?=
 =?us-ascii?Q?8pWid4EeHOk8HB8rTAcDNgXN35LDwoGZV5MvdiSxdfuFLNJZXRoiv1x/biyS?=
 =?us-ascii?Q?awubjK54mh5x2bysMI6wFyIi9fvlyl39Hb0w1ualA5YLVgrJyWtmQxxlPjTs?=
 =?us-ascii?Q?rtklzJldWgXXeY2hrDoOXfZrltFaDyHNq72ctNp/lucVuZjmAu6tI6f54g3g?=
 =?us-ascii?Q?0ihRJdOBmXGyx0rhB69C+W7kZdkWae392bIGQYQpkDXzhoqWKZT9Rkj4MX/Z?=
 =?us-ascii?Q?huzeZ+sOuyh/xV+aUvW+/1FcN41kVmRWfgoe?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:16:06.4056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9295dde-e527-4671-a371-08dd7ce07716
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7242
X-Authority-Analysis: v=2.4 cv=UMDdHDfy c=1 sm=1 tr=0 ts=67ff9f8c cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=y1bKs6f6_Ir5KRW8wggA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: 2XWWjghaIqiW6tZ4zb5N3cw9uXolcAAW
X-Proofpoint-GUID: 2XWWjghaIqiW6tZ4zb5N3cw9uXolcAAW
X-Proofpoint-Spam-Reason: safe

Change the code to use faux bus for the dummy codec driver device instead
of creating a platform device. Also use KUnit automatic resource cleanup to
destroy the device instead of doing it "manually" in a test case exit()
function.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib-test.c | 64 +++++++++++++-----------------
 1 file changed, 28 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 4cac4de39eb6..f53650128fc3 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -5,8 +5,10 @@
 // Copyright (C) 2024 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <kunit/resource.h>
 #include <kunit/test.h>
 #include <kunit/static_stub.h>
+#include <linux/device/faux.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/firmware/cirrus/wmfw.h>
 #include <linux/gpio/driver.h>
@@ -17,8 +19,11 @@
 #include <linux/random.h>
 #include <sound/cs-amp-lib.h>
 
+KUNIT_DEFINE_ACTION_WRAPPER(faux_device_destroy_wrapper, faux_device_destroy,
+			    struct faux_device *)
+
 struct cs_amp_lib_test_priv {
-	struct platform_device amp_pdev;
+	struct faux_device *amp_dev;
 
 	struct cirrus_amp_efi_data *cal_blob;
 	struct list_head ctl_write_list;
@@ -99,7 +104,7 @@ static void cs_amp_lib_test_cal_data_too_short_test(struct kunit *test)
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable_nohead);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 0, &result_data);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 0, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -EOVERFLOW);
 
 	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
@@ -142,7 +147,7 @@ static void cs_amp_lib_test_cal_count_too_big_test(struct kunit *test)
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable_bad_count);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 0, &result_data);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 0, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -EOVERFLOW);
 
 	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
@@ -169,7 +174,7 @@ static void cs_amp_lib_test_no_cal_data_test(struct kunit *test)
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable_none);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 0, &result_data);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 0, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 
 	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
@@ -223,7 +228,7 @@ static void cs_amp_lib_test_get_efi_cal_by_uid_test(struct kunit *test)
 				   cs_amp_lib_test_get_efi_variable);
 
 	target_uid = cs_amp_lib_test_get_target_uid(test);
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid, -1, &result_data);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, target_uid, -1, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
@@ -257,7 +262,7 @@ static void cs_amp_lib_test_get_efi_cal_by_index_unchecked_test(struct kunit *te
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0,
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0,
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -292,7 +297,7 @@ static void cs_amp_lib_test_get_efi_cal_by_index_checked_test(struct kunit *test
 				   cs_amp_lib_test_get_efi_variable);
 
 	target_uid = cs_amp_lib_test_get_target_uid(test);
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid,
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, target_uid,
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -331,7 +336,7 @@ static void cs_amp_lib_test_get_efi_cal_by_index_uid_mismatch_test(struct kunit
 
 	/* Get a target UID that won't match the entry */
 	target_uid = ~cs_amp_lib_test_get_target_uid(test);
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid,
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, target_uid,
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 
@@ -363,7 +368,7 @@ static void cs_amp_lib_test_get_efi_cal_by_index_fallback_test(struct kunit *tes
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, bad_target_uid,
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, bad_target_uid,
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -405,7 +410,7 @@ static void cs_amp_lib_test_get_efi_cal_uid_not_found_noindex_test(struct kunit
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, bad_target_uid, -1,
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, bad_target_uid, -1,
 					      &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 
@@ -436,7 +441,7 @@ static void cs_amp_lib_test_get_efi_cal_uid_not_found_index_not_found_test(struc
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, bad_target_uid, 99,
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, bad_target_uid, 99,
 					      &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 
@@ -460,7 +465,7 @@ static void cs_amp_lib_test_get_efi_cal_no_uid_index_not_found_test(struct kunit
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 99, &result_data);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 99, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 
 	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
@@ -480,7 +485,7 @@ static void cs_amp_lib_test_get_efi_cal_no_uid_no_index_test(struct kunit *test)
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, -1, &result_data);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, -1, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 
 	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
@@ -509,7 +514,7 @@ static void cs_amp_lib_test_get_efi_cal_zero_not_matched_test(struct kunit *test
 				   cs_amp_test_hooks->get_efi_variable,
 				   cs_amp_lib_test_get_efi_variable);
 
-	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, -1, &result_data);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, -1, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 
 	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
@@ -543,14 +548,14 @@ static void cs_amp_lib_test_get_efi_cal_empty_entry_test(struct kunit *test)
 
 	/* Lookup by UID should not find it */
 	KUNIT_EXPECT_EQ(test,
-			cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev,
+			cs_amp_get_efi_calibration_data(&priv->amp_dev->dev,
 							uid, -1,
 							&result_data),
 			-ENOENT);
 
 	/* Get by index should ignore it */
 	KUNIT_EXPECT_EQ(test,
-			cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev,
+			cs_amp_get_efi_calibration_data(&priv->amp_dev->dev,
 							0, 2,
 							&result_data),
 			-ENOENT);
@@ -600,7 +605,7 @@ static void cs_amp_lib_test_write_cal_data_test(struct kunit *test)
 
 	dsp = kunit_kzalloc(test, sizeof(*dsp), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dsp);
-	dsp->dev = &priv->amp_pdev.dev;
+	dsp->dev = &priv->amp_dev->dev;
 
 	get_random_bytes(&data, sizeof(data));
 
@@ -637,14 +642,9 @@ static void cs_amp_lib_test_write_cal_data_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, entry->value, data.calStatus);
 }
 
-static void cs_amp_lib_test_dev_release(struct device *dev)
-{
-}
-
 static int cs_amp_lib_test_case_init(struct kunit *test)
 {
 	struct cs_amp_lib_test_priv *priv;
-	int ret;
 
 	KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
 
@@ -656,23 +656,16 @@ static int cs_amp_lib_test_case_init(struct kunit *test)
 	INIT_LIST_HEAD(&priv->ctl_write_list);
 
 	/* Create dummy amp driver dev */
-	priv->amp_pdev.name = "cs_amp_lib_test_drv";
-	priv->amp_pdev.id = -1;
-	priv->amp_pdev.dev.release = cs_amp_lib_test_dev_release;
-	ret = platform_device_register(&priv->amp_pdev);
-	KUNIT_ASSERT_GE_MSG(test, ret, 0, "Failed to register amp platform device\n");
+	priv->amp_dev = faux_device_create("cs_amp_lib_test_drv", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  faux_device_destroy_wrapper,
+						  priv->amp_dev));
 
 	return 0;
 }
 
-static void cs_amp_lib_test_case_exit(struct kunit *test)
-{
-	struct cs_amp_lib_test_priv *priv = test->priv;
-
-	if (priv->amp_pdev.name)
-		platform_device_unregister(&priv->amp_pdev);
-}
-
 static const struct cs_amp_lib_test_param cs_amp_lib_test_get_cal_param_cases[] = {
 	{ .num_amps = 2, .amp_index = 0 },
 	{ .num_amps = 2, .amp_index = 1 },
@@ -750,7 +743,6 @@ static struct kunit_case cs_amp_lib_test_cases[] = {
 static struct kunit_suite cs_amp_lib_test_suite = {
 	.name = "snd-soc-cs-amp-lib-test",
 	.init = cs_amp_lib_test_case_init,
-	.exit = cs_amp_lib_test_case_exit,
 	.test_cases = cs_amp_lib_test_cases,
 };
 
-- 
2.39.5

