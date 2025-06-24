Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53F239E7E;
	Tue, 24 Jun 2025 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769735; cv=fail; b=OEf96t6MDW2pWlj552KlK3hypNldfCdCybxnXssnydTs1tO5jjYHqxMOhF7Qsphqf6J1+/oMSwuHka41DTCDAgQoWDeZbKCvYehPpir2qjGMHdwHPP69/fc1kFRxhnz1CKNeZbDK3R7EvKW0/OjlgyYRdh2kz5Dz80yxFuiodhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769735; c=relaxed/simple;
	bh=90f9nqYUSecDSC9W3CSZILgSOuH2865W5Z5w0LiE+Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=J7L/vdfK374CFKWhLTGPUS2Ef0UmaLZSfNk6o321tDvsrB4qbi2jJRWx+4t51GVGqdp1/1FDIM6qqMbgyELqh+7QzinqzKQa2CDkgv0sp+E1i8J3UDSgcC7JPrARojJXx+GtEIjDh7ZdUwB0saDUsRgvmx7a6jUggqx1yj2RveY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lRBiMfSL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=STAhiLbw; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lRBiMfSL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="STAhiLbw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5NKUH028155;
	Tue, 24 Jun 2025 07:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZBYZT1PDpivkzJjD
	+NXi7eqZ8aPABfMl0+PQV1Gf+l8=; b=lRBiMfSLx8t9xzBPPGWXhH7VNjA8RqUy
	9FomS0U5ctTAwTpeel4hY45odxkcRo60PPk6CpRovtTdLlfRJYOH6Aoqh/DrBNX4
	Qgholsl02Y3VTApOIzBRAR74hRvdb5qHAmb6DwRN07e95qwnzzgDeXcVA3Bsk2L4
	29DCzrdAYn1eTtQvwkAKnz05zHoFpiKxfrFmz5pBQxpgcJ8gl0nRFYl0EqI+BkTK
	uGpKBiaASPvl+ZEcuK7g0C79o0C6UCPD3eoQX3hAMEouYHOw8bbh47q6j+daM061
	2hi1dKP1YZMI1RYkYt6Rl3L4IAf7p1BwbP/CCXPo8Fk00fz0OfiqSQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2092.outbound.protection.outlook.com [40.107.236.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyu5bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:55:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHs7vtxGW9snX3a47MoT2ZnSSIC4/tZg5OItf/ZvNjIMF71yBbkaEIt8zVrMuFNn9cy5ImLURizs2RhUgYbBmUBM7EisxysA8xELUmWunq1thX/M8oY4EClBH4XIsg41pnav0DOVRjw+E6O67HAC6Z73M84tMFgXLBJhMMo9qXCCyKYoS3AgpYIpIZyUzl3Jjx65s4EBcfSUBXmqtlpkqIoucyDTC0FTbjzbvIYFhscT3IbiVQw1kEEMcj5MK7DDhtyiDLOlJTAUipOjd69gVkf4qu0lEG1ZxgXQo53wWpRo2jgiVrnzTyQekk88eaKY58THss2HuuCysFXWhskCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBYZT1PDpivkzJjD+NXi7eqZ8aPABfMl0+PQV1Gf+l8=;
 b=GW+2UajzGJf0wDGBh5N2Q/k/v2j62AG1sSZHbNCqC6Jx0y+DgjvJ80CuUUkziRM991wxI8GnjO4kKcLRtSzsk3CAzPp+mcKcxN6B41/S4D//jfzPTXL/VuS2gP4ZhaBbMYKuWCYapqM0LqzCQeqdZYqdXGNxqfewQLUoX6bNj2mLt05a1VoXBlnPxs6+4De4NCjvRrkn2M0h+6PpN4y6hE7EgF3Zb92+0RyRjdq8pkNU9NJRudcqlDbT0xXYtAwtBSUjAIG3gY1RWVE4/5EJY47xmfV/j0RsItdttb5dImStN0xU3I+icmAjFqVVBEunj2SL/JMAY7Jlt02uJ2uDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBYZT1PDpivkzJjD+NXi7eqZ8aPABfMl0+PQV1Gf+l8=;
 b=STAhiLbwJ1vPigsLjq6b7WQW5TsnTm3wJ2NhwbLBFJjh8Fi3UOGkH8lYK/UGu2C3xSeUf7rV9GTPZN2itqvkHWPjs1XijH/TPHKGCKT+hhl9YCG92KWb+sl+KUYc7wh57LDrbG2Lio/KaxameB0RGkKExuY2E1HEYZ2cPBqv70c=
Received: from SJ0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:a03:2c2::6)
 by DS2PR19MB9125.namprd19.prod.outlook.com (2603:10b6:8:2ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Tue, 24 Jun
 2025 12:55:19 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::c5) by SJ0PR13CA0031.outlook.office365.com
 (2603:10b6:a03:2c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.15 via Frontend Transport; Tue,
 24 Jun 2025 12:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 12:55:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 893FA406540;
	Tue, 24 Jun 2025 12:55:15 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7AC9582024A;
	Tue, 24 Jun 2025 12:55:15 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: Correct some property names
Date: Tue, 24 Jun 2025 13:55:07 +0100
Message-Id: <20250624125507.2866346-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DS2PR19MB9125:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b3663d6-0beb-4616-d891-08ddb31e5e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HKeNOsU7TqymFyW2ZmPuutfgWS04aTl5UcrYQvBI8AYYBTMUGGaLGbf1aUmD?=
 =?us-ascii?Q?f7edXB8c/4iXTHgz3Q4wh92qhlFh+uYmOoCwjutHswB9exAwQnie2i7hfDBp?=
 =?us-ascii?Q?jijSJNHYZliIB1+CW/BlCYmmOm/QBPFQXWHV2RRz9N2zu10yFkegBjzD53NC?=
 =?us-ascii?Q?Bibuc2ihF24StTam32Gf6bOehDRlJdzeQDuN6Vy1yx2aMuJZIfbo5B5B1DYy?=
 =?us-ascii?Q?OdGj3D+fQsz8OkpQH09mT6x1mloBn3Q/q5nUvioZxMt56gsr/9mBeW1khizh?=
 =?us-ascii?Q?hEP+gqsGs12m/FWv1aFhi0+7EVi7VU8T8qX3FQGr8MWRaHv66M/oCb/fDmAl?=
 =?us-ascii?Q?8Gcb2SAvknugEIvEIw8rl3cc3KenyLwmhkwG+/lY2RFm5/6m2Y6PwTI0Vl3z?=
 =?us-ascii?Q?LwSVpNiurF+OrwfNTkXLpAmYncjA9/nwlVnR/7cNJMfyqVTCVfIcSoFM/zmQ?=
 =?us-ascii?Q?9I7iQ5QgejrMeWUw/6SLx8RewcbdfL4+MZnC4uTpNs/qhEFlq3CrT/eTnjx6?=
 =?us-ascii?Q?Hw4SNQaPBEDseY2gYlJkc6zOkgi2i1HWk1FtyKaKI/yfYzdw671GOv58Y/yd?=
 =?us-ascii?Q?EVMMb3mHRcJQ3Y7CDhk+YYS0okU4f967IsJWfBXdRSPovAheVfBnbm4pDaZW?=
 =?us-ascii?Q?0a9N9ftviOoJSESg/LgAl9tL5uDqOpN7Q+zyUCx7zzFaw/miPwRdRUSUHhLU?=
 =?us-ascii?Q?E9J1U0gtWMKaUzsLzSfyulen9exManQ348qBQbWRtIewTgBc657OThn/q7NE?=
 =?us-ascii?Q?oa2avubDc76YLKO+68EdZm8DejxXXO3dO4GomXWf2Ht96cxzD+NkXg+ueOOw?=
 =?us-ascii?Q?EJbtg6Gku3eJrNJ0oUNUINbX5GG9McHo8Kl8/VeGFYEGa/F9isMBM5QzJogI?=
 =?us-ascii?Q?vwFvBg3JAuQwXsfYFqV0arZSlBLTXo5fY97W+XT+LD9jbdJnO9/XmeOtwh23?=
 =?us-ascii?Q?/wJutPoaF1VjUOl1XN2DH1y5H2GxCjXd9VBc8h3z+UuEF2QMkozGd4qwhP+y?=
 =?us-ascii?Q?jJQYiIZO3kEyV3SbkswuzcylE7ArjxQQqtLaMDqv11eqUvwzilb9tddKAB66?=
 =?us-ascii?Q?mrpxDWzkwGw9Dbgd5yQucssLVHw1yWRkGfZS/n8BQoBScF2Sd5bvtrdVLcmN?=
 =?us-ascii?Q?sJ/2IO01OPwYcJQjKwU5HsdHGJb86lyoAxr103ZWKP05V6zeyF4cPieevqvj?=
 =?us-ascii?Q?UUYQ8/IGO1i8xDIz9GKSsIr4oR4rq0yLIyL6Nn1zz6xmnerSxv30wCrReFqm?=
 =?us-ascii?Q?aad50PnqLoRJofDd5jZXfTw7hNtUSuer3NeTWuReLGnLy8h1Dbj9NIsn+6fM?=
 =?us-ascii?Q?wOPmrgVQ1Gn3Xam4b35op11j7n30L4rdc8R3Jp/DOWPNQUj5neiKR+mFCsdl?=
 =?us-ascii?Q?SOC5oan4LOt/JZkXDcOKHTNXPKoMs46plrQ8/qESk4iUWBWgZf0fDjRZdgg0?=
 =?us-ascii?Q?sGBl7A6zWYbeDMFQgMsGGoOqNRslCw/zWxKnEVdSlRgsY5odTgxoVFTr802o?=
 =?us-ascii?Q?0K5GLJpAjVX1GPfQ8ElANQ1Il0FDKUKfz3vI?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:55:17.0241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3663d6-0beb-4616-d891-08ddb31e5e92
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9125
X-Proofpoint-GUID: 4m9C5g88TXowsa6wKtTz7CXUNx9h2FAf
X-Proofpoint-ORIG-GUID: 4m9C5g88TXowsa6wKtTz7CXUNx9h2FAf
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685aa039 cx=c_pps a=ukPxkxUSPpxepupZOhEPAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=RQNzq2AmoFGRCCu33-8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwOSBTYWx0ZWRfX/plFqI3/DOy7 gKWnp7PDiDhBhhS37KuUZ8Q0+4rivDDxTbqyytosnQCKaESya1J62Ny+lIqzCDGjszg6iYag0He uD7Q30fwUaiYZDEaRHPKep7KPP5r4WNi6XoVDdCedynD7ZGdQI8LsT8POwFSMR9G0+0i7zLUTno
 trpPvR+pyZ+ngo/jSA2ygv9Xx4L5nesdbGdvp+tinl80IF0LBvvQ/QGeDIDhSb0OXe8nuw0T0Mv +KrzsZthZWy6HB218txG22KDqnBg7xMmxloskcLKXqOwNrpMSyaNBT/hOLWfLY2x9cc1OI5SYK+ cKbl01uQn9r0+1endkrOuHQPLc8MRDrOFxL96kjlYSBir5olqLmz3gthFwFjBY105vtW0HzSFyt
 msDLPyunShEcVvb9AksLN8/gw+VELxykZIp//CfbyvLyzqsxVGk/nrcHhEIRbqE1JVW6x/Pn
X-Proofpoint-Spam-Reason: safe

The DisCo properties should be mipi-sdw-paging-supported and
mipi-sdw-bank-delay-supported, with an 'ed' on the end. Correct the
property names used in sdw_slave_read_prop().

The internal flag bank_delay_support is currently unimplemented, so that
being read wrong does not currently affect anything. The two existing
users for this helper and the paging_support flag rt1320-sdw.c and
rt721-sdca-sdw.c both manually set the flag in their slave properties,
thus are not affected by this bug either.

Fixes: 56d4fe31af77 ("soundwire: Add MIPI DisCo property helpers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/mipi_disco.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 65afb28ef8fab..c69b78cd0b620 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -451,10 +451,10 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 			"mipi-sdw-highPHY-capable");
 
 	prop->paging_support = mipi_device_property_read_bool(dev,
-			"mipi-sdw-paging-support");
+			"mipi-sdw-paging-supported");
 
 	prop->bank_delay_support = mipi_device_property_read_bool(dev,
-			"mipi-sdw-bank-delay-support");
+			"mipi-sdw-bank-delay-supported");
 
 	device_property_read_u32(dev,
 			"mipi-sdw-port15-read-behavior", &prop->p15_behave);
-- 
2.39.5

