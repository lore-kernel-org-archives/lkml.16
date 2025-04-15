Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8291AB6C8;
	Tue, 15 Apr 2025 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714468; cv=fail; b=RzFg+6ceIyia4r0AN8PQ3nQ1ehtNcyFkF2aJNvMU9I43qiOgEP1n0mYWrkZ5Z2c01nl1fekPTxHUC/B3TBi2Cyck4zYZSTwkfQpeJfrMSMEBneslzX3y/URtA86/wjKhAgxQuVdoLKKxWgGr+uz92ufPIUQOnH+Skd3+/9rlQYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714468; c=relaxed/simple;
	bh=+ehtNOUR16vCg3hixYWmFE9lQkbQBaU1kPrWyEpFEUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U9x9nufwvLAZbXxlq8Q8aZp54KH4TkotXsK4QFlLn60yjanZHrn0txPhhc8Xjze8cbFIQSrCuWizfOhjU0H14yW80NhM9OpXWaD7ZoacXvmQ3D5PI+DKWb8o+/4XBxZ/UG5k3jpZ2qToC2Kx/6JNqqmn5lScvQnO+JtoMoWc/R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RJrNubRe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HEn3T9HP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RJrNubRe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HEn3T9HP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F4xWFg005770;
	Tue, 15 Apr 2025 05:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ipgV1Ds3OLQ/ePUH
	x5T2BZ0SqVBcDgsJl3rt8V3+29g=; b=RJrNubRezaUDG5I19HKx2zyp3TQxJqcC
	KJ0he3Aq614GAKNnYe3XkvbeG9Rp6muf5K0U2snoJ27JgC8F3FXMOLEQnv+mltTR
	414UqpQkr0Cc/qJxVFvuAoXHkrnmFMKLqPL40ZJZtxGtjVgc6PVRWghJJjRMMmiV
	LHFKVw528j/dScZdUq9Fa4pQ3JdCmpU3OQRS3vVq54iG5G/27SKZBohbJHQQVrtk
	CoI5Ni5BhwgRkvkwwHfHJt479X+Ld/vDsWePaTrTNTVtR0h4PWJcoJ5GcFEEYogX
	gL8mQOHgiwpSwpWzkcVvZNpr3Ag3q26OBAY+PZl980llKY9BEhNc1A==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45ymkgue8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 05:54:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzQ816B9bCwrnbBuijYljifGWF2oNwITy6ZCqaB2rUPQ/hncBrBTYVpS9dYvN1a9L/4IE4fYE/F15mBkUYdPTIKXgp7i5x6xcJP4LNKCrzzfp4lSOzbOyGwKARQwNRwD0xyc3TdKsUISo54BrjhIRVuv+ZAN0xm6GNX7AGioGmEcQopXE9BRoEYtPD+3F9DrIuG0TJOjcAdUfEEhwCUBT4HXknbBxb0rHEdpXocqT/Dg7RO/Nk7AJirnFLEnSatLdx7Gz59PVAzzpzL1z8B+CP8WitMESs5O92A0Zb+zDHgJDz0HukPiMWeXwIQMwKVZk6E33U/jCE17PkKMem/7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipgV1Ds3OLQ/ePUHx5T2BZ0SqVBcDgsJl3rt8V3+29g=;
 b=wHj9JyiHIBpfCN5jHqViFzSITf9JLypuyif6Z/yGy3o2VtAUqkL1u75yy7rgiDj8Qug4YrSwSz3TjiWCVJCNmPmgOwTKz5CXXDeJc3fJL0HLzQI9gSuqidfNwj0nZLXSNCvE6PZq/KpQy2RSl06TNLUyEa4MgdIcDTbE/cJArVCwwA41xs5Wz2e91U1mmD9e/LI0ArXQzFqKJbUyA3kJCzYdJT7/ZO32gunR+JpKGbcHhwBCEJKBWNLSy5maL7yBeR7+vuD2gIQugUAsyTeHCqYQLhbZiwTWHnga2tvu5QTLrRRNGu0jW5jqEpmoiDxO3bwV53dSW1no3Eo6WWzrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=opensource.cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipgV1Ds3OLQ/ePUHx5T2BZ0SqVBcDgsJl3rt8V3+29g=;
 b=HEn3T9HPH/hk3ATA+MyY3TMMemw1bs4xCxIgjzmCBrRlyYNGm4YwvdSlHfdHDJqQDCuuzXJQZiu6JHo7pDtepjvpxD+76LdGsymWVxwzNCOtqvO0kHwwzqLJ/zjzg2gCqWJZptwCkJOaGugqboZWFdP2lAUeypW23/BGgXZFoPU=
Received: from PH0PR07CA0055.namprd07.prod.outlook.com (2603:10b6:510:e::30)
 by CO6PR19MB5371.namprd19.prod.outlook.com (2603:10b6:303:146::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Tue, 15 Apr
 2025 10:54:18 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:510:e:cafe::c2) by PH0PR07CA0055.outlook.office365.com
 (2603:10b6:510:e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Tue,
 15 Apr 2025 10:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 10:54:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C88F7406540;
	Tue, 15 Apr 2025 10:54:14 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B3055820259;
	Tue, 15 Apr 2025 10:54:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cirrus_scodec_test: Modernize creation of dummy devices
Date: Tue, 15 Apr 2025 11:54:14 +0100
Message-Id: <20250415105414.471039-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|CO6PR19MB5371:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ac8e223-69ed-4dda-2c50-08dd7c0bde1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IHWZeai9LzvQtMhlUvpuWaV5AgQFotpXr2/mdBGmqxi8XFan2TeoaiSzC2KX?=
 =?us-ascii?Q?Hy4ccTpdpcMcRvbpx18KqINjfstV53iLipbvkusvIhKY5cEva1mB6nx/Q2PI?=
 =?us-ascii?Q?z7oGrHY8+9vrC7S06VMU5B3x9VJb8dCQZa38Sy4qHn9cdpKyI4veC+HQM7Q8?=
 =?us-ascii?Q?H8WDI6fwCN+Pk6zfs/1fxxldOwHWcQNAC+R0ChQaFXx+0moOlkKaByQJZIrD?=
 =?us-ascii?Q?A0p8W9mkoFaNZsdmC4S1g7KK0PcD8rwdTcY1fYotF0y79leMxnbiTRcpZQK3?=
 =?us-ascii?Q?zWZMB+CJ+7JPq4+GblAG4ngKoDIVnitUxqCUonrdU26mjHBOiW8b5VJ0QDyE?=
 =?us-ascii?Q?uoohmDxrXthzTRQoQLXAR/aw4THSWw8RKCUCBH+k532BdMaYPDwVx+f6zdX2?=
 =?us-ascii?Q?q+hWwZTil+GAWpbuCuAeEiUvDksBZ00QIiQvcrqsNJcvIG50i54nOzl2iUqU?=
 =?us-ascii?Q?BJ82ddqLcWSVkaiy3JTS+hQqZJUgr+J/I4eAXRS9blQJvPwTb4vh39zNIy4w?=
 =?us-ascii?Q?hmb4w4gRDSBXEIFRFCUgfQzB8GWtrbvzweUBr+qEPkJCDi+TOsuKMFYWbPmr?=
 =?us-ascii?Q?WlgHmeZXtt+Urjp/QUZSDC2k/SRFJQaoERy/5XaqypDBNRDm3JioFQ4cIBGl?=
 =?us-ascii?Q?RsTFM9m/eOOqxW/oW/Tyj5fh4ktMteor1aYbIgCvFjW28rfgHeAkm3IUclRL?=
 =?us-ascii?Q?bEhVdZeYVS0RuqXv+UypItiixqFKlRPrYM/LDfykUB8SVXpNMsXgc9w6Eeq3?=
 =?us-ascii?Q?64wO4YmQO7HQloccBi2t2+0yg+M41h+ej46mIPZF9QpwVm8bFHeLco8RQxUs?=
 =?us-ascii?Q?cA/KHbdpbvzW9TpmtbWOeNwEYWbORsifGwGQudMC9AmNaXmaNB/pa91ZEYfK?=
 =?us-ascii?Q?Hi4WB5lSoNq9JOrbrrSr9230XdazBkJANj9etPC9kdXRMU8pQ4RWC8Yowq9T?=
 =?us-ascii?Q?fO8uRb/1dXdZOL38gtJudAdhyrxF4+sKr/2SifI66Rdw8telTxSCZSDtLizN?=
 =?us-ascii?Q?xiWrnJs14FPqdMFZfRjt9sr+uVDWrg8zCDPQY3lqWx5HqJGBadY9rgs9bxsx?=
 =?us-ascii?Q?lIr+szKkXMeSQGF/cGTKwLlDOqn9RbzsFkZhK9SpQxG0DI5KAUUTALLbACjG?=
 =?us-ascii?Q?eNeLJ1uSkeVS3m+Kj03VaM570dfHhMF2/J0EXz7WBUb0XDyIf/OfRABYNlBi?=
 =?us-ascii?Q?ZKmgNpNMo8iy7TxYb3uqidaY65sYpC6VlmPRtrv3EMEeE6a1ZOQ11dqazFWu?=
 =?us-ascii?Q?DrfMubvG2hFaN5jCjirYTlzlqGP1PhHwrrgp4vD2KKlRBetaJ66VRdH7oHKn?=
 =?us-ascii?Q?fcnbTgn4Vg24UutnVEGMETtbqWZHBuWxCwEuwhxrV0LYe/4FVhlHlkSzE7Wk?=
 =?us-ascii?Q?HpIOLStBxHavMsn5nQpKTUhn4VQ5lgzAPzii4vrhlpv+izKNffdSxwX5W9py?=
 =?us-ascii?Q?NSWMDy8+zIF6Zu4ptB+vTrH+Vu6oD6Q3nc4/N/Uz6jjQjX1YEr8SE4bp38t2?=
 =?us-ascii?Q?hOlU7lsM/l8vi1jccyXkvxlMAg2sk8WRfC6Q?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 10:54:16.6199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac8e223-69ed-4dda-2c50-08dd7c0bde1e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5371
X-Authority-Analysis: v=2.4 cv=UMDdHDfy c=1 sm=1 tr=0 ts=67fe3adf cx=c_pps a=BfiT+f4K8gVEfImFRIf1tA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=NLbSIG_hurui2wjRRUMA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: z7h9E1FHzFSP5Rge0D1MddjT3hMxwnBi
X-Proofpoint-GUID: z7h9E1FHzFSP5Rge0D1MddjT3hMxwnBi
X-Proofpoint-Spam-Reason: safe

Replace the old direct use of platform_device APIs with newer KUnit APIs
and the faux bus.

The dummy codec driver device doesn't need to be a platform device.
It can be a faux bus device.

The dummy GPIO driver still must be a platform_device so that a
software_node can be added to it before it probes. But use the new
KUnit-managed APIs to create the platform_device and platform_driver.
These will cleanup automatically when a test completes or fails.

Also use KUnit resource cleanup to destroy the faux bus driver and the GPIO
software node instead of doing this "manually" in test exit() functions.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cirrus_scodec_test.c | 110 +++++++++--------------------
 1 file changed, 35 insertions(+), 75 deletions(-)

diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
index 08b0bde1a461..93b9cbf1f08a 100644
--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -5,20 +5,30 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <kunit/platform_device.h>
+#include <kunit/resource.h>
 #include <kunit/test.h>
+#include <linux/device.h>
+#include <linux/device/faux.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
 #include "cirrus_scodec.h"
 
+KUNIT_DEFINE_ACTION_WRAPPER(faux_device_destroy_wrapper, faux_device_destroy,
+			    struct faux_device *)
+KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
+			    device_remove_software_node,
+			    struct device *)
+
 struct cirrus_scodec_test_gpio {
 	unsigned int pin_state;
 	struct gpio_chip chip;
 };
 
 struct cirrus_scodec_test_priv {
-	struct platform_device amp_pdev;
+	struct faux_device *amp_dev;
 	struct platform_device *gpio_pdev;
 	struct cirrus_scodec_test_gpio *gpio_priv;
 };
@@ -104,6 +114,7 @@ static int cirrus_scodec_test_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver cirrus_scodec_test_gpio_driver = {
 	.driver.name	= "cirrus_scodec_test_gpio_drv",
+	.driver.owner	= THIS_MODULE,
 	.probe		= cirrus_scodec_test_gpio_probe,
 };
 
@@ -112,37 +123,28 @@ static const struct software_node cirrus_scodec_test_gpio_swnode = {
 	.name = "cirrus_scodec_test_gpio",
 };
 
-static int cirrus_scodec_test_create_gpio(struct kunit *test)
+static void cirrus_scodec_test_create_gpio(struct kunit *test)
 {
 	struct cirrus_scodec_test_priv *priv = test->priv;
-	int ret;
 
-	priv->gpio_pdev = platform_device_alloc(cirrus_scodec_test_gpio_driver.driver.name, -1);
-	if (!priv->gpio_pdev)
-		return -ENOMEM;
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_platform_driver_register(test, &cirrus_scodec_test_gpio_driver));
 
-	ret = device_add_software_node(&priv->gpio_pdev->dev, &cirrus_scodec_test_gpio_swnode);
-	if (ret) {
-		platform_device_put(priv->gpio_pdev);
-		KUNIT_FAIL(test, "Failed to add swnode to gpio: %d\n", ret);
-		return ret;
-	}
+	priv->gpio_pdev = kunit_platform_device_alloc(test,
+						      cirrus_scodec_test_gpio_driver.driver.name,
+						      PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_NULL(test, priv->gpio_pdev);
 
-	ret = platform_device_add(priv->gpio_pdev);
-	if (ret) {
-		platform_device_put(priv->gpio_pdev);
-		KUNIT_FAIL(test, "Failed to add gpio platform device: %d\n", ret);
-		return ret;
-	}
+	KUNIT_ASSERT_EQ(test, 0, device_add_software_node(&priv->gpio_pdev->dev,
+							  &cirrus_scodec_test_gpio_swnode));
+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
+							   device_remove_software_node_wrapper,
+							   &priv->gpio_pdev->dev));
 
-	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
-	if (!priv->gpio_priv) {
-		platform_device_put(priv->gpio_pdev);
-		KUNIT_FAIL(test, "Failed to get gpio private data\n");
-		return -EINVAL;
-	}
+	KUNIT_ASSERT_EQ(test, 0, kunit_platform_device_add(test, priv->gpio_pdev));
 
-	return 0;
+	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
+	KUNIT_ASSERT_NOT_NULL(test, priv->gpio_priv);
 }
 
 static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *arg,
@@ -192,7 +194,7 @@ static void cirrus_scodec_test_spkid_parse(struct kunit *test)
 	const struct cirrus_scodec_test_spkid_param *param = test->param_value;
 	int num_spk_id_refs = param->num_amps * param->gpios_per_amp;
 	struct software_node_ref_args *refs;
-	struct device *dev = &priv->amp_pdev.dev;
+	struct device *dev = &priv->amp_dev->dev;
 	unsigned int v;
 	int i, ret;
 
@@ -235,21 +237,16 @@ static void cirrus_scodec_test_spkid_parse(struct kunit *test)
 static void cirrus_scodec_test_no_spkid(struct kunit *test)
 {
 	struct cirrus_scodec_test_priv *priv = test->priv;
-	struct device *dev = &priv->amp_pdev.dev;
+	struct device *dev = &priv->amp_dev->dev;
 	int ret;
 
 	ret = cirrus_scodec_get_speaker_id(dev, 0, 4, -1);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
 }
 
-static void cirrus_scodec_test_dev_release(struct device *dev)
-{
-}
-
 static int cirrus_scodec_test_case_init(struct kunit *test)
 {
 	struct cirrus_scodec_test_priv *priv;
-	int ret;
 
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -258,52 +255,18 @@ static int cirrus_scodec_test_case_init(struct kunit *test)
 	test->priv = priv;
 
 	/* Create dummy GPIO */
-	ret = cirrus_scodec_test_create_gpio(test);
-	if (ret < 0)
-		return ret;
+	cirrus_scodec_test_create_gpio(test);
 
 	/* Create dummy amp driver dev */
-	priv->amp_pdev.name = "cirrus_scodec_test_amp_drv";
-	priv->amp_pdev.id = -1;
-	priv->amp_pdev.dev.release = cirrus_scodec_test_dev_release;
-	ret = platform_device_register(&priv->amp_pdev);
-	KUNIT_ASSERT_GE_MSG(test, ret, 0, "Failed to register amp platform device\n");
+	priv->amp_dev = faux_device_create("cirrus_scodec_test_amp_drv", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
+							   faux_device_destroy_wrapper,
+							   priv->amp_dev));
 
 	return 0;
 }
 
-static void cirrus_scodec_test_case_exit(struct kunit *test)
-{
-	struct cirrus_scodec_test_priv *priv = test->priv;
-
-	if (priv->amp_pdev.name)
-		platform_device_unregister(&priv->amp_pdev);
-
-	if (priv->gpio_pdev) {
-		device_remove_software_node(&priv->gpio_pdev->dev);
-		platform_device_unregister(priv->gpio_pdev);
-	}
-}
-
-static int cirrus_scodec_test_suite_init(struct kunit_suite *suite)
-{
-	int ret;
-
-	/* Register mock GPIO driver */
-	ret = platform_driver_register(&cirrus_scodec_test_gpio_driver);
-	if (ret < 0) {
-		kunit_err(suite, "Failed to register gpio platform driver, %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void cirrus_scodec_test_suite_exit(struct kunit_suite *suite)
-{
-	platform_driver_unregister(&cirrus_scodec_test_gpio_driver);
-}
-
 static const struct cirrus_scodec_test_spkid_param cirrus_scodec_test_spkid_param_cases[] = {
 	{ .num_amps = 2, .gpios_per_amp = 1, .num_amps_sharing = 1 },
 	{ .num_amps = 2, .gpios_per_amp = 2, .num_amps_sharing = 1 },
@@ -357,10 +320,7 @@ static struct kunit_case cirrus_scodec_test_cases[] = {
 
 static struct kunit_suite cirrus_scodec_test_suite = {
 	.name = "snd-hda-scodec-cs35l56-test",
-	.suite_init = cirrus_scodec_test_suite_init,
-	.suite_exit = cirrus_scodec_test_suite_exit,
 	.init = cirrus_scodec_test_case_init,
-	.exit = cirrus_scodec_test_case_exit,
 	.test_cases = cirrus_scodec_test_cases,
 };
 
-- 
2.39.5

