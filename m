Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CCD21506B;
	Thu, 27 Mar 2025 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080446; cv=fail; b=L74Z8oCvigJvyZ0Xn1F03hI4MrubKD5WTBcD3xLqpy6dFr7WLSSoPrX5kZGIxgnKrDuVW2ltpiWPoLHukOQiDiC45peDTaq0DpPWv43mkfQYlxQ5Up3qCB8wloclkb4I7jEgES5Izxgb35lMOUAwyFRhRdw1X/zazqLp88CDnAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080446; c=relaxed/simple;
	bh=fFZ6Ba+BuZOQZbaaIodywclZxE6ka1V6S/7pBLHEbi4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=t6TJBxFTAQrPJC3sztXZ7WgTsQGN74PBuMwPRN10nevJBGa8AfTyMB9qR7Cyzf0JCJxGsdJ8tSeBMvrvCjjlN1k6sMK/6Yv+UcL/ZIdc20lBXF+sDlKQYKvOFMnRSc+VsAwMt8809ea9NnlrqF5l3osC/5Wxbkxzyd4MxrUKMNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oVON3X5s; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UkchZzBr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oVON3X5s";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UkchZzBr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R69t74022135;
	Thu, 27 Mar 2025 08:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=SUe/jhOuz43ZZtNE
	6u0+38/uQueTmFMPgybl8E72Rzo=; b=oVON3X5s9Z0ogzAsOQxJ3gvVhOT/of4u
	SZJuVH8MwByVTmTv8rO6+VLoxm9LcRP1Pw0DUlJ5dlYBxuIWD0g5rRLXw5Zkr9+w
	UZQ0wjcNB3Qmgm8qp+EtP6B6bM5gx7oBMFzQ9Ov3ybWZBm83cF2rIzar0yzYz8pP
	lLVZEDx0kNDhs1PZLm5ahmblvJACXFnqrA30u1zQDJa5Ky0HOFAz0AOrua9sWo3q
	WW/nXKpfskQBbSsOf8KaNZ2Y4OKUTRNMVzGe+WC88wBTxB0mac98YQKN6i2kv7ty
	OChq2wVpaU+Yos1OXORp7LVmA/7AnPP0NPM6aiyYzFQcTSLMFhfTSg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45kmrgvq4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 08:00:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv9bZcdqS2Uhw935x47HWJRXFagZ++L3excS4yD6tVjroFyCCPhj5wbWOdZPT+/E8bKWXzsFlqEFs9h+bblrJ3BV0xnJobAsxZpXdrbLFfCethMTGJEn1pYkZd8je9Ilt9XKodfN5LZRSTYW1qsaEAt5eWCezdZA7WOQJGQSSe6cAoiIWYIFiZZ5PyQW4NWHl8aTVI4jxQkVtlBf4jnsxjMsGIuiqAUWiR3zG+TRWRLQ37vZTDQIJZQU/0hm2ICg81BYIsoRnfS4Zv+IP21ZJlACnt8DLew2Xfb7PH4e3R+cSDC04Dlw9KtY88QkRXPJzTu76A9Soi6UhIQrGgGzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUe/jhOuz43ZZtNE6u0+38/uQueTmFMPgybl8E72Rzo=;
 b=cA2xmXPL4CeY1ncvsNN1Km/QRc7BU/2/t50nm3PffvljiWJ2NZ31rEybdtGdA/MP2tq1wCOzvdoZjme5m4iVvrpxH8EB5lbUmWCa/4BQ5Qggu7nc6DZu5+ArWexaaerFa/inKGi5I34zuYSDtigednL96OXSVazXe7+WD7j6ic2WJHjRsJO9r0PRPJXXvZz1KpyMd2+o6nF4EqzNwNnGmnGUXb+9p7kW8G+aDgzDUJBilTiOvYtTG+DvrGmqgMcD18z0Hze8Lx6Bf93FCf0L9oSa6q3OOH8uM8ZRaSqRTZhfFH4G0xU3qm5dXZVfNbL/VUHawDosivQT8ewXwzMLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUe/jhOuz43ZZtNE6u0+38/uQueTmFMPgybl8E72Rzo=;
 b=UkchZzBrquQjUDzCHHVPwBpiSdZKrCDcfO4NQ5Jg7i7I1gFLV9zPD1oW0xpQvl+K9orhgqdJ31YVpDSuAgPaaugcoVBzaf95YdFtza1LwY1m2CuWQcBmcPQaQWrUvLL2l8ELFi52GEu9CRhN0p0Neo9fb6ty8hxwVqXp9xCe/YM=
Received: from MN2PR15CA0038.namprd15.prod.outlook.com (2603:10b6:208:237::7)
 by SA0PR19MB4351.namprd19.prod.outlook.com (2603:10b6:806:85::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:00:14 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:237:cafe::ac) by MN2PR15CA0038.outlook.office365.com
 (2603:10b6:208:237::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 13:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 13:00:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E776E406541;
	Thu, 27 Mar 2025 13:00:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C2385820244;
	Thu, 27 Mar 2025 13:00:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] Add DAPM/ASoC helpers to create SDCA drivers
Date: Thu, 27 Mar 2025 13:00:09 +0000
Message-Id: <20250327130012.3378732-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SA0PR19MB4351:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea06b627-c84d-4d1b-fd00-08dd6d2f50be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U6RLdXjHRn1VZJGza0F/mpZ9ENaXDRAOrYiriKWwogis4uoL3nOGAtezl4cV?=
 =?us-ascii?Q?ITCcyAelJlSjEMd+Eqquwr9P/mr+95Dfq/I9x6iULC9XUiyhQlbft4Yv2Ktd?=
 =?us-ascii?Q?lYAA6MUo2kvALnbXeB+yaWAl7FwzoSWiBlNPktE+KJHgjixGFEv5nYJryzOR?=
 =?us-ascii?Q?2B60M6YbTJBnpPIb8lxFCGdJUMfkE5KOCMPiXKwonNNxayo89Bnx4g8NsX3p?=
 =?us-ascii?Q?dFng4P6BUvu75ZkVM22Os1N/3HZuyaKbt9cbFA+kujN0SlvE/2gzmBPSf2K7?=
 =?us-ascii?Q?g3pCjk8YqlrfZA5cQgbzepFHbe9Lj3K5QeaVCLSCBuRtEKCymCgf2NB3ghIu?=
 =?us-ascii?Q?KAsV5VcI8QGdprl8ZeTtNck09ZzZ5QXGmDy3L3ILuJSgnaWRLKFZA2r3egLQ?=
 =?us-ascii?Q?GjGXw53MQhFTCMdhdiAEVrbHzPm2mU/Eu87RLtCwsHcC9rkiBaGIMWFrtjlf?=
 =?us-ascii?Q?OmfoQwUO5RoRrOD7CqjCoPu1KSNKVAxL6UuyvbIbcHVdyKSDJY3OglSkFiE0?=
 =?us-ascii?Q?yMj6R9T/HDTOWU0JsQJYAAppSU93Sze7e9n3b8HQl9edxDoEqUFQHPkku+nh?=
 =?us-ascii?Q?YJLJt2AYgtKqqaBIcIaMdbcMIHTCCU/Y5rZMbdVO+033Y3XPkbA0MhRwUfSo?=
 =?us-ascii?Q?7FvWOKNrH/pjdxrbVGsP9PwUC3oxbIbPzQ/So/4PnSS3eDoFg6djF4IAdKo/?=
 =?us-ascii?Q?iKwrwBe4wYgztWCgmY5oibKymmEejt9AHuqYBAHKxzy5NJS2qV6cjN5nZZRp?=
 =?us-ascii?Q?H4Pz1r5gZoRPAv4ZiZ1p6j32W0bu7mOkVNJOsp/G9jQ3WxTwYdN28CkW9sce?=
 =?us-ascii?Q?V+Mg1Q4lXzp93kfEyqHi8Z/Z8itquNsqp2X0hZsZhi1W3SeBpzwm5RwExiKK?=
 =?us-ascii?Q?W32K4tNT4ntgElfpYPTLePAKVdr1xF2kH4xEOHt/iYnr2j/oRWYRgkFakcvU?=
 =?us-ascii?Q?HjMz3amUxdFFFW2GLNP3HWeePEVkG+taw8s8TIhjKndsaGBvD2lwpppw0yxq?=
 =?us-ascii?Q?ZmeZoRPV66jxTbnuevWPJEixL6rMQW8ssyXF+acrR97TWwMOy2zqEIACo/U4?=
 =?us-ascii?Q?gw3y1peh0sqfZXzSBz50Zwx6eGAhjHd89D0T7m6Pc+NbfKEm5C4ozXsdpG9c?=
 =?us-ascii?Q?X/2gPYBqvKd3GwWCNajXEbK3KpIoGX067kwXsiGSCYoa7x9u+wq9OaorCGvU?=
 =?us-ascii?Q?43CnX7Dsdsx/ku8OGtD3xhG7bmYbVeAeyauAn2dzLcSkI4HpES/o6bLxH3Ot?=
 =?us-ascii?Q?b/UYDz2BM7/ve50/c5gdFdBn4ybiWyrAMAY3oWTJVuMp+hYmuH+oD0zlTlxC?=
 =?us-ascii?Q?e5NCPyk+kposoYl8Hkr6flL7QOdACGaUK2MK6XBKewfrISWQ7yM9a3Nvi8cb?=
 =?us-ascii?Q?wqC70srmpR3Q/q6m9vt9oRefR6C3sbNqLFDQGbtxVnA7eoV4oWqq6fQ86VgP?=
 =?us-ascii?Q?ZwDGIytFVgUoBeFVB9C7zfHBJUQghSUeUUodi2ckXTX5IgHz80sSGHw5m0Qh?=
 =?us-ascii?Q?POkjE1uP7+DgOIo=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:00:13.9876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea06b627-c84d-4d1b-fd00-08dd6d2f50be
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4351
X-Authority-Analysis: v=2.4 cv=GrdC+l1C c=1 sm=1 tr=0 ts=67e54be2 cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Vs1iUdzkB0EA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=hulU0MfjRZACQXYr7gAA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: PrWfN6rhneF3-F4H4xU0Cka_Ns8J1xxD
X-Proofpoint-ORIG-GUID: PrWfN6rhneF3-F4H4xU0Cka_Ns8J1xxD
X-Proofpoint-Spam-Reason: safe

Add helper functions to add DAPM widgets, routes, ALSA controls,
and DAI drivers, these will be used to create SDCA function device
drivers.

This series should provide most of the core functionality needed to
get a device registered and have a working DAPM graph within the
device. There are some features that still need additional work, these
are marked with FIXMEs in the code. The two main things are SDCA
Clock Muxes (not used in our devices and needs some ASoC core work),
and better support for more complex SDCA volume control definitions
(our parts have fairly simple volumes, and SDCA has a large amount of
flexibility in how the volume control is specified).

The next steps in the process are to add helpers for the DAI ops
themselves, some IRQ handling, and firmware download. And finally we
should be able to actually add the SDCA class driver itself.

Thanks,
Charles

Changes since v1:
 - Minor tweaks to commit messages
 - Fixed typo in "Microphone " string
 - Changed GE widget to a supply widget and linked it to the controlled
   SU widgets. This is nice than before when it was a kinda redundant
   unconnected widget and better matches the SDCA topology diagrams.

Charles Keepax (3):
  ASoC: SDCA: Create DAPM widgets and routes from DisCo
  ASoC: SDCA: Create ALSA controls from DisCo
  ASoC: SDCA: Create DAI drivers from DisCo

 include/sound/sdca_asoc.h     |   42 ++
 include/sound/sdca_function.h |   69 ++
 sound/soc/sdca/Makefile       |    2 +-
 sound/soc/sdca/sdca_asoc.c    | 1193 +++++++++++++++++++++++++++++++++
 4 files changed, 1305 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sdca_asoc.h
 create mode 100644 sound/soc/sdca/sdca_asoc.c

-- 
2.39.5

