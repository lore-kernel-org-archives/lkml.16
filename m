Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC602918D2;
	Tue, 13 May 2025 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143595; cv=fail; b=DdS5Fr4MnE6uAdzRh8KardscAl9v663/7sCGAKCimPJE82C1ahYBuKsleDrWEOO3YBjQxajeGzcC95aJ5fXp9Dz9Pxs64Qh4aW+PjwSh+y0V5PFY2JHzxRQ49LslsFtsI/3ub9RanaR4voxs08zYAqoXkof8I3fi6VqEnMuIE0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143595; c=relaxed/simple;
	bh=iLbCBsLR3bZ6jUyBuz0gGaCyAalPvKBWX8YXnLfw+78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nW43eap4jxXozCPV4bzwQJkVRqn7E9Ubys16Kls9hUKKPsDMXJ7zRa7B2cZ8pwNvHmGgATasNcD3WoyOA105i9g5vLtfMG+3NCth4gfXrjnCkHLpin2kaWDLpivG91AGsc+kDGQ0L0lEk7E+YAOXRPYpXoInjHsyCPc6DX3Hbrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DnF4P2sL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=py5UJwhW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DnF4P2sL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="py5UJwhW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D5Ibkb031225;
	Tue, 13 May 2025 08:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5ib2nHmC/+FXkeN8CJQsXSRpAzNva1fA7CuhbMBGoKk=; b=
	DnF4P2sLImd6f23t+Pod6C9lNM1OD6pdFBV2UHIHSRHQewIcZAm1brehk0vFRbF9
	ep5fS9oukUclMeB4CK5Qnb+8F2v+LY+Ir1+f3qHrwPVWuDobL1Ipw5ev6h8gEn71
	pLBFM2Vx53VtgiQqzFOMAklH9qznypTPGTHIwrig4mrDBBZs6vynw89oKHQOFuS+
	WW9MQSf7GuZ7sfutj/U01pzb9jKxLKIEwbbRwr3m+bMyWSBxYgMv3PuGfN0uk9JI
	KraOXJv4EZM6gJg5FfRcZR8hJblBLSfR0Z2rFmQwehqa7FgsIO4iQzjmoDuE4kvu
	vy48mNAeYuNILdwsOlaSnA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46j37gc2da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:39:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhfzsz7Ej1k+TxLP1kuha5Qj1yMwH9AQXdXFbmeNzuLDic5bYWlCrQjFS3I+eMXzqF7vjoL3KDYOrRuQnWlINu1UXamqfEt3J34y2Eopj2WzY/uAqOKVeuUn1kgmY7RJ6sXjz0YZ+CBudxmCwCeJisyawWn5SGYa6XMzqzve7j3Z5ePUDGkAhm/y4LMw8ZKSeLdhZFu8TuYQOLYG1ooctDugiJj9rnNJITu9VPNbm0Vvh0oDQQD34v6VRRnKdk4Y91XqFro63PMVTytba9eZetjik0rbnrqyvfq5Jmq9fD73rOnMNpIse3scmFZCBCaljWSw19vkoLymykhJ3ocQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ib2nHmC/+FXkeN8CJQsXSRpAzNva1fA7CuhbMBGoKk=;
 b=gj5ZWR1w7vn4vrqHKzkO6jmUZ7xEuzrw+IiE/m8BPQBFirKZc6V3pGxpscF3oHIKNBeEF0AkgE7bBfLd6xCI3AwMcCpCdXnYyUZBSGyENKrh6UlHbNyoDv7iEppRQjuVz6bqIsx97FtoIqVo/5gd3/JP0YS/r4yjVJoXJHVSljiaWt2bWhZA06ucf/2gf0t8lqqK2imO4UbNvmBjvb/INT2/oU+w9nyrp57omgOy4KVrFGl1al9VmepjaA7UyNBJv5uiH4vh2SrQ0fVFFgotkRFKMfsmwVm/8UKSb+18yfaQlQjbwdMzTwqZIlYwgFtA+Wtuw98AptrdyfYwQ3j0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ib2nHmC/+FXkeN8CJQsXSRpAzNva1fA7CuhbMBGoKk=;
 b=py5UJwhWlhXJEVmjqeetP5UsvRPT6qbzQFL4+e1g5Uai7djoy+QNhrfuFO4S8OZ3F90V7AfGCj94zokAYYIz8ws0YAuzOr7HZKM8/AELIOM5Gbcy/K5ciC9XEbNVZ5WlTu0eBtqejGQko1z7z4Ff15xEvEztmdHAiHWv1UJ7LFA=
Received: from DM6PR03CA0088.namprd03.prod.outlook.com (2603:10b6:5:333::21)
 by LV1PR19MB8869.namprd19.prod.outlook.com (2603:10b6:408:2b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 13:39:32 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::4) by DM6PR03CA0088.outlook.office365.com
 (2603:10b6:5:333::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 13 May 2025 13:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 13:39:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0067640654A;
	Tue, 13 May 2025 13:39:30 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C3953820244;
	Tue, 13 May 2025 13:39:29 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 2/2] ALSA: hda: cs35l56: Log tuning unique identifiers during firmware load
Date: Tue, 13 May 2025 13:39:24 +0000
Message-ID: <2fcc0e6fc5b8669acb026bebe44a4995ac83b967.1747142267.git.simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747142267.git.simont@opensource.cirrus.com>
References: <cover.1747142267.git.simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|LV1PR19MB8869:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cfb82ec8-92af-4863-0bd8-08dd92239726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rljpxwJ9/mIkPoaFnv88OvBaowg7KoNdex+N27tCLAbbFTXVwfohqRti7Iro?=
 =?us-ascii?Q?yKISXSoNSNuLTsjK4QIJMtWhU82nuawx6EWsTVdRXbLk7mSPQHsEY0V2/LQG?=
 =?us-ascii?Q?hiA46hdPhFerVp6MPLQnVR5W4gt5/WiyOW5GpQy+Ea4QP6IB6Gr6N2VUAr/4?=
 =?us-ascii?Q?iTby5uGmRBc2bC+Uuhi5F3+pFjIpRGE8c98by4mE5IcceCt/c52wH2Wzm38Q?=
 =?us-ascii?Q?Jp56eEaKe/e4J5oV/EIcydrD2nfKwVRHH6DqZ5jkcyuThENyN8s0ho9w41GV?=
 =?us-ascii?Q?q8Y26WG4iVUqYrX55ebVEESu34bixzY04145mlYhEKmOxMKdkL2upICuN3II?=
 =?us-ascii?Q?u5lr3fpSADTMpnQOwU0FM0JROnzkozjp9FcJsmil5mXcHzw9QCDnnFG98MRe?=
 =?us-ascii?Q?J1Qio0p62jD/owoLGn+vfm2X6xez7kfbEfEQL44a/eB9zmkRg2eRe1UhgBB+?=
 =?us-ascii?Q?zskqvnMP18sOfvf13S2JcGTWjB+GaOgYoy49obwYNY7WfzSAIa/QTXY4NEsl?=
 =?us-ascii?Q?Pb3g7qxTHTm7bIbYyV0NLGhxBlwU44dIV/haimRv2ti2AA7XuJKlpYDA1ZXf?=
 =?us-ascii?Q?T5FA2EF/TCBnMID2WBibQTNtLx1CQd5r4lw04011hzZRDrGKw1za7owqAKF0?=
 =?us-ascii?Q?IFFT+6rPY5dxcOWBdzzm2cITAtRBTGEC53oPphwNAyOLchqgMLP16Z79yrfc?=
 =?us-ascii?Q?tQE9PxdpHG2JnleIrscG3CRjAoh+HlMA13I0jl/ezegQE/JNYB5M/vTfMY/Z?=
 =?us-ascii?Q?PRoAm6v14IQgJo0Wglfm218hcD9fJmHpKJ71Apl3mq0F/NmL3CG2UfFS5zt6?=
 =?us-ascii?Q?TiJ8EkXIqNjgzeNhKJnKh5ee3iI69wJ67ITp/iigj5HsCCvtYsYEPBq/mvcK?=
 =?us-ascii?Q?TRTpDyEzLhKZTzOUSTHIOzsPELjyRn0K1NkQ5PrMY2MXFaAis6Z+dZB+E+Q8?=
 =?us-ascii?Q?tDyJcxuN2TH4Zs7Ggc+AVe+7D/4oVGUU08mK2c6YunNaPmiq6zykQC+68LqT?=
 =?us-ascii?Q?4RWUCqDQxzEFC9+Hc+QOVsitnIwpzF+E0otu2iWQf5y8Wz/Y+Jn+n7KDPGvb?=
 =?us-ascii?Q?/L0Uwgk7uyqKy4DJAQLiVK5G1iY2EzXbEur6/tTAP6nGpvg0/MK1UNf8uQiu?=
 =?us-ascii?Q?YaHRHDJg5estcB+9l+BkGlW9xo5WwDNLIyrRObTaLEC4ugi9/ggKxJTxlDA1?=
 =?us-ascii?Q?Mi+wwN/gaDyOOqlkKo909HnOPPidV4BE/9S4QZYX5ppgoGg/CAHhHjJoULHf?=
 =?us-ascii?Q?IrE5hgy/CUgMh0Nirh2lPQm5GMJSsYoC2hQKLCDbfISgUwJcgodc7CNfchCG?=
 =?us-ascii?Q?iL5bFsgU8QhXo7QowWHlKs2uHuOJ2wuFeaxxwbElMEURBQu2FR2l93POtqGU?=
 =?us-ascii?Q?UlFsu+6miL6lhC1Cyp260W1y6q+ElGYVJRPcDNm/hOnj7YLq7xAgK3eECekI?=
 =?us-ascii?Q?epdpm1yKC2rPIKHPgww9hYkXP0pxcfbiI5ittzpWcrPOngwEt/hHT2f2q9hy?=
 =?us-ascii?Q?hbo84AnidARM62HaFdgGKeJljw0xSTjS26AY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:39:31.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb82ec8-92af-4863-0bd8-08dd92239726
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8869
X-Proofpoint-GUID: Q0e8o-3K7uUYpqZVvz1VUKyjW401lFwl
X-Authority-Analysis: v=2.4 cv=BOazrEQG c=1 sm=1 tr=0 ts=68234b9a cx=c_pps a=OxY2RB2sa7x8oI2LU21LDQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=wifZLRR8qKOFN26rLuYA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: Q0e8o-3K7uUYpqZVvz1VUKyjW401lFwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEzMCBTYWx0ZWRfX7izmffQtR0Sr m8hNPMZeLed6aVgEUGlygq4U2LclnuxAmGRlr9f/F+P6ZXahQCU1aRkSm8w11T+IIGwyQXzIkxK +/4BovIWnhQiuevlbEHBZ5OPMjBPZ6ubKLk7IcLFEsmzoAuAQxosoXTY+6Qkwq1wwYMW/ApymKD
 CKoLGFYAQw+Fv7oQhkJO/c2c2ouOwEYHgYFI2jKUO0HyeoMqDV44uUI4q4U+W4hRmRPPdxqAcPA 2f3G6GqSm+nNEjlQKIO9E2a//CsPHHiqbIUDF9gkaAeM3EQDGPQpXTbSZwulIKbJ6wrkIsnNNdZ 1C7SHqhIEeRDnWgm4V8UsMKC5kOjfpCECDK7aBPoP3y+ZJa+o5ZEK4rexC/ZTg2A9yAg5n5inG8
 gIfT6layBJWIC/apHkE5TuVqEQJuzfmG1FoALwlh4XDoAuSHmxe9+nHY7yqhwYSmJRwFG+CO
X-Proofpoint-Spam-Reason: safe

The cs35l56 smart amplifier has some informational firmware controls
that are populated by a tuning bin file to unique values - logging these
during firmware load identifies the specific configuration being used on
that device instance.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index b6fecf119261..aed7d7284231 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -676,6 +676,8 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (ret)
 		cs_dsp_stop(&cs35l56->cs_dsp);
 
+	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
+
 err_powered_up:
 	if (!cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
-- 
2.43.0

