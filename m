Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADE61F94A;
	Wed,  9 Apr 2025 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195556; cv=fail; b=MrXZuPVcCnqfy0/IGhvC20MJnunev0srByyW5QiFZymfnBuYTEQNzMw/MPZj8w/5oc+vALBS+BYY/D1M/QaK4CVwvF4AWhClUbe2vYjWlzWXK9Ez+zb7FxoRJl8HECHtp1x7p3O10O0v0E+vsKOHWIAtySVdRaSlpl/yxesxlvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195556; c=relaxed/simple;
	bh=tUn5nEs9ZmeCrE2TU5aYvECO4V3zClrQHa4/W6NwyII=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=X9eFZl55+cUbE4kgBApucoaLra1ByIEJFAsKAtmh7yiCxPasOcoEwra3TlIj53NFfqcBM4bDJh1lVQB4FnMHM9AE49tXmLQiTs5k1ZEBhZzaTR/peqr0GciGZPU3Cy5l2DxJX5FmJt5969JMuTE3jaiZWcWEnt5gqJWb+9gbx8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oIARV3Ig; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KqYV4ifd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oIARV3Ig";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KqYV4ifd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5396PsVx006541;
	Wed, 9 Apr 2025 05:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=98kG0HoXsQR7C8ZS
	udSvWpytd7jX9Y1AiIMYSRU8Jhs=; b=oIARV3IgXNJdeShbi4EYIXzMiPH4j1YG
	gVsl4woZIoQ5mY179EmlIdXDevDOM2MRBWg0OmCi71Pav9NkIKgUu3quD+poGX01
	QR/+CfpbBYLOWUvYMRJcKJgVJyiIKL9+IsPbPfy8uJdeJePcdTUeA54EIq2ek+Oz
	33fwauc54pq4fWUsmA+VhDlBsuVsHrB20mLWVqvQtPHZTbV8xXY+3lMbMjHs2H4M
	2E7QXhxj3MYw2NX6QsOtFUPSjEJbm48Li7PMWrPFn0x6Ptl2UuxGJgCazhMsphBQ
	gaTbMhu5BMe9rrpQAmg+9EyDRjNpnpHUCuKyqXN99FVwvUmTvzU1OA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwkya7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:45:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ejr2Ir0ph/A3HHgl2sawlqaADFEcsD9augY+AeI0srk+IGMGyXwOsGnZhXuL1nMiRValH5Jampv6SqsgzEMPltK8ShKAOtR1s0GUYGUaTg4KH6EpuSrO9HMczl+QABNbeYItT6A5Dr5JlwZSQVunhYQlnHpsx+KJtfhrbLzVrQWUhGJl3Pekj2AabrtMaDd+72keaVUvfOWcBvdcgawsLxfflR4Da0KzHpChelVIcVHxEF1+J6Ub5Z8tKdmelMTV5OIaZFkkq9d0H7BLDtT/j3gGdXK8s4ZsZArFndEgnuMfVG9oHocXIJiP+dDqfrV+9se9rrFA1JhR7d1muYMrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98kG0HoXsQR7C8ZSudSvWpytd7jX9Y1AiIMYSRU8Jhs=;
 b=WkGJ1hsEQDhCeYkIQWipFZVz+g53PYtj7kcvOaxmA1MkZRSo3/owkszQq2DYjB3OhdsieCa+tQ2Cy6AjKbQCyIXsA8Pc8rsJzmQSJ1JvXBB7Kg8DTgtfB0Yh/oQJpcvDateB1bevMtLMsslL5npiLf1B4Jpx5jpKfYBHJorV+LBvduWrzZfEhNaBhwBEPuz2reejUS3Sc3/lJUyujbnFVy36mZZfjHjS6iNffMyemfkzMFNz8h7NdCQrUsu8bR65aND+OeZbY366OPIevpWQ7yB840IIP43ocdrJb56wegTWNbftFjqDftM5Ki09CwBGqimXWGPMYo3xdu+GJfmoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=temperror action=none header.from=opensource.cirrus.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98kG0HoXsQR7C8ZSudSvWpytd7jX9Y1AiIMYSRU8Jhs=;
 b=KqYV4ifd9UsH1v6YLyYKdoxXf4NWFWOvwrF3oMmBLrnW9kioHpko2pHtMoI2gU2TVsuUhGkhcp4O+LLLMy7G2jCrx8FbJjsYi3aZNPM/HrO/fU1oYYt4gCo1q2/U+b5P3+fxWpmPEcFP8NCIPGLSIsAg94/I/qm87fRZkCdhIP4=
Received: from BYAPR07CA0034.namprd07.prod.outlook.com (2603:10b6:a02:bc::47)
 by SA3PR19MB7588.namprd19.prod.outlook.com (2603:10b6:806:31f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 10:45:47 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::b0) by BYAPR07CA0034.outlook.office365.com
 (2603:10b6:a02:bc::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 10:45:47 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 84.19.233.75) smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=opensource.cirrus.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of cirrus.com: DNS Timeout)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Wed, 9 Apr 2025 10:45:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B11D9406544;
	Wed,  9 Apr 2025 10:45:44 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 94380820259;
	Wed,  9 Apr 2025 10:45:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
Date: Wed,  9 Apr 2025 11:45:44 +0100
Message-Id: <20250409104544.878475-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SA3PR19MB7588:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d78dcf34-32b9-47e7-c0bb-08dd7753af4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zgaPaV3GHS3mC6tiaB3rPpbB6Q9DVwdf8lMAaXBTiEQFHLUio7KN/HfmBrAI?=
 =?us-ascii?Q?kOxz054hBDhWnquq4W4h1fI2DrXBuYRcJTVFX3HkMW/o8HlDxkhUNX+omytb?=
 =?us-ascii?Q?8BF/jn/FzIYsiDOPNDBi9TdMojeEWaeFnmaJNBSZTvqjYTufPLLANeaKQiZo?=
 =?us-ascii?Q?4VpuC1rHcdSWnsCesTSte20cLexekHf7703IhDg9vxorKFir0OS0D+uG6Y1H?=
 =?us-ascii?Q?dWirkpJ6my5hxmMSB+z3FSYGJ1XqYc0I2ONWPyWbrhiN8bhDOuWRRqaERZxn?=
 =?us-ascii?Q?MWOgldjuUT0urWNxJ4PF7CNzDgcdMVJmRIRYPHJlK4MQdoZIwZtTvYaQCecZ?=
 =?us-ascii?Q?SXV56CRGVoTUmtpUpR0NSMzJw0yj9JojyQ+/L3DvsZVV0kHPy2kx9T7xWaqo?=
 =?us-ascii?Q?mSgiDxvnfa96nHubPJMxX8PwKNI9J5IaxvkMmk0ZFjm56ya5McOEBp11eSXk?=
 =?us-ascii?Q?LmlPQn7JO2DJW3a5JmnYZCJQ2m9iEoncIJwDJ6igMkytRfXEveaiAn0xErHA?=
 =?us-ascii?Q?oa1WkAwafGuD8S5tlKi3tuLGAYJLUM2Brpj1RTjrBJGyFO5u0bwxSVE80I3t?=
 =?us-ascii?Q?jVu1FSceYIvkwOvYloilDWQaK5QTW0zM4NvR+DRWMZMKApKXk++KS/yCQ/kV?=
 =?us-ascii?Q?xI5/zzUVdMfH8BvzjXIypxw3tz0tOmNOsCnW2MwCF+yHGA7C54GNPebaNpxY?=
 =?us-ascii?Q?dDnYz5TTpG3nCgeb5nspZlcWETtenuaJFYd8PDk3kP71hIKnClaBxQY/TQl7?=
 =?us-ascii?Q?QsfXjqPdp0HlUYdMKTabOvazr21d9Yf7Od+wCliB/0pSNDT69+MBAdOyHqTb?=
 =?us-ascii?Q?Ie5Hn6Hf/W/jYWiF/Jk4LmE4apgCPpR5BL6pkoKpcCR8v3/TPv4ZQ4mBsj4k?=
 =?us-ascii?Q?6zqCqKydIHaGcpGunH7hlFNFmKOboV1iVUknXB/cZMgiSrTT6IoNPq8QoupZ?=
 =?us-ascii?Q?IxobJ7sPFtjqKCoNnOSYPDxf1qx48NvkUyyqyh/OK0Zn3sogOs73Y7+92WpH?=
 =?us-ascii?Q?UmxC9bhQYKizi95GIy36R9wuA7NHdD7IyAVot1W7cnwhI0fZEo3bUpQTOrmw?=
 =?us-ascii?Q?jodOfhSdhrzNSYwXDLMS6z4h93AXlC81U6WYbzwajtXXTXown24IA1rMqwNN?=
 =?us-ascii?Q?sUxVYpPSxm7CbdrCFJQCX7UGl38JrrthJiUo9c71hhmNXgWFTN7YRZ6/bVpJ?=
 =?us-ascii?Q?VNYrMthPOwi1mc+NLz9/FY61B6Ae9eoDZ98Y8GivQTSWUZURqeDospfWtHIr?=
 =?us-ascii?Q?qHzumvkKfHAhG19nl91Og93T+PlsCqTgqy0xaNsNFgeGDrJou5Wcrcezkps1?=
 =?us-ascii?Q?3Lm5bL4qyBd2IinFHBfd+aaewDSAPFa+GoJQpibSlzF9+QhGTP/dsOAAD2fH?=
 =?us-ascii?Q?I+5fQ7ZxYL0oOLaz2xRpT7lMKuiWSTwRruY6C3zJ5ybCHw62zUYekcRxcmoB?=
 =?us-ascii?Q?027HkbwHB3dKDm5JcxZNHFmK9TyC6xLzg841gPFsBQQ9EocJbYGEzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:45:46.0987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d78dcf34-32b9-47e7-c0bb-08dd7753af4e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7588
X-Proofpoint-GUID: tTjtRbP6GGHV-yKSXN_PW1VsFtXGkBwA
X-Proofpoint-ORIG-GUID: tTjtRbP6GGHV-yKSXN_PW1VsFtXGkBwA
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f64fdf cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=23dBHJebA2L0dVjFQOcA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Depend on SND_SOC_CS_AMP_LIB instead of selecting it.

KUNIT_ALL_TESTS should only build tests for components that are
already being built, it should not cause other stuff to be added
to the build.

Fixes: 177862317a98 ("ASoC: cs-amp-lib: Add KUnit test for calibration helpers")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 083e8db05b9f..3eb9af28b53a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -779,10 +779,9 @@ config SND_SOC_CS_AMP_LIB
 	tristate
 
 config SND_SOC_CS_AMP_LIB_TEST
-	tristate "KUnit test for Cirrus Logic cs-amp-lib"
-	depends on KUNIT
+	tristate "KUnit test for Cirrus Logic cs-amp-lib" if !KUNIT_ALL_TESTS
+	depends on SND_SOC_CS_AMP_LIB && KUNIT
 	default KUNIT_ALL_TESTS
-	select SND_SOC_CS_AMP_LIB
 	help
 	  This builds KUnit tests for the Cirrus Logic common
 	  amplifier library.
-- 
2.39.5

