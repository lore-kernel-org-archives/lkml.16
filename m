Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F1E298CA6;
	Thu, 12 Jun 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744056; cv=fail; b=gOktjuFnIJbtDbSFwIfymFTIEtx89cJZnxT4NYMwYbsk0/K4diUZB83fNYjaP9CKR/uLSn4GZr3w9FJs7nbIEhpr2LsOa8ELz2P13KH5FJuzOpQR8Ci1pBrQkKqbrY2FgDtcKTFJxlWJocdT6NViVyDuABs2QRIqGHVrPdjpcbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744056; c=relaxed/simple;
	bh=a/fPeaMfVirCd3f2o7EQ4pOPY90+jJ3Zs7+u9SYvEAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFR0JN68PFk45/2Xmey8ha+VEMistdHrkikp48RrPFKmdeiLVPcBDqd0tPXn8H/KxPAeluw5MUM/WGq2i4NS0r6Dyar1y8y7W6NYRoCXfFM9AipULbZQvAkmcxibOvRFJEkOdnZ3v9TustCUlEJ9XOxLKzc9Rl31SrSeo7aWu8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OZ7kbcE9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ui8Jxn8h; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OZ7kbcE9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ui8Jxn8h"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C5a2KS001079;
	Thu, 12 Jun 2025 11:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wHwE8tnNoDaYUFLfqUiUDIgiCdUKEU/XvOkZMAAqujo=; b=
	OZ7kbcE9qs2QfO1+6ReDDJ61ARBvbXm2UlbN2EwsNkxRXwOtMBw0VrBWOhB+fKQ9
	rFpXLMybJqz+aFtzaq9qDohor8y0IDnAaTMbHzOCfPFycFP82OsX1A4VN+z++y0A
	E7jKmSgBBFkP0q/RXP8hxvSetBk4N2JT2sv+jUFZRITdyDPS0wzrHczWYIaH+2Mf
	WB7K+y24R5B81pOpQS3LzXLfZ+/hzvNP+G/LIp5bwVLFnGWuQ/63+m6+KIC1TwaC
	UwJTuEH0MOD8a4Wrg33bxz+qkLTFu7GAyfMvF7gc1oZ8deE572bQBLRbXBP8YgDe
	na2VceAy1MuFNFauPLGjwA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2127.outbound.protection.outlook.com [40.107.100.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdc4tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 11:00:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+0fiTZcFvPbb7xnxw9zay9wRIeCqBzMativSHA5Og5cCGt9XRs8Nar0SS9qZB5ghKkAGc6hVzXN3FfhKagy8yrjWf8Aib5Dbd2KjQy96Qu6ZSslo+34TMQIO3ShWe6lxEundwnFgV6VuhSonEdypa1en1aIp4jR6EBe/gpCiU2s2JtqWmrfU+pZ3LnDtCVUk4DrlTjlBZn30Cw2eRF9nw2fZfsSCafRTsN68MAp/umB7SON7cB1KLXZc4anR9jMt6CCylsgD7a4mtPlBlEuJItY5dFlKT5zJE8n+HOOKvbeFYIR3SfRv+woXHmpCB3MGVdSzAC+Q4Ia96MC1FpYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHwE8tnNoDaYUFLfqUiUDIgiCdUKEU/XvOkZMAAqujo=;
 b=ewoS+AHgSYWvDU61La8/Wjm/DRAosmRpfhEZQZNwu1zM5I8nneak0qhRfvfqKkEpEeS/IEsX6qRpOZFt0tiElAxaHaHHshFdbDiOi4OJ5lUgrZkNmKan2mEeFIsvce//YjRlGaKNjCOn7O8o3aQOdqC2jteUAcYM3i95ebJBelgwE6iZ49wIfs8IBDb4fU38OxcgDc+HkPkZBnK3mMW+oLGWcANO2xuG1ydYNL1WsdrKc0rOpylHptXL4cRLcH/8Vm49/K8R9R+QnA6FoKfdb21ji3VdrMUATgjnYTEcuumQOuucIdNgbk1gh7D3reTx297MzyMZmPbHBQa4rlWKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHwE8tnNoDaYUFLfqUiUDIgiCdUKEU/XvOkZMAAqujo=;
 b=ui8Jxn8hRcc+VCCMDJfnVBFAft4CpycpAhkEpSpZiLWuHjceWXnnnAruABqvWV8BzPRz9HW8EGhrFbmMgKrlcme2O+/I+l+5tydWlZXPrHzHRufc1VS32uRkTUXwcLh1GpUJ010zCWHzsCXeqXeP33i30pqvCOnv+EZ4nRDyarU=
Received: from BN0PR04CA0113.namprd04.prod.outlook.com (2603:10b6:408:ec::28)
 by CY8PR19MB7083.namprd19.prod.outlook.com (2603:10b6:930:55::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 16:00:42 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::da) by BN0PR04CA0113.outlook.office365.com
 (2603:10b6:408:ec::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Thu,
 12 Jun 2025 16:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 16:00:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44DEA406541;
	Thu, 12 Jun 2025 16:00:41 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 16814820258;
	Thu, 12 Jun 2025 16:00:41 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ALSA: hda: cs35l41: Add support for center channel in CS35L41 HDA
Date: Thu, 12 Jun 2025 17:00:22 +0100
Message-ID: <20250612160029.848104-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612160029.848104-1-sbinding@opensource.cirrus.com>
References: <20250612160029.848104-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CY8PR19MB7083:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 11d885cf-21c8-4aaa-ad99-08dda9ca489a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vasb/9HLhTXibTh29yihnc0dQ36Puv6HaMOTUU8M1fHQBVevVl9UOGL81p0I?=
 =?us-ascii?Q?v50YkMwCVa8AxJ6GycijHQpSB8I3WAi7Ax/xn4Y8O7SrANc8hmzrvld+MnAQ?=
 =?us-ascii?Q?Rx+cqcjwJxvBzqK5A30pZ3jAT0ekrGk1+A4WP3bja1A+mHM0t2xNNqP6KG+/?=
 =?us-ascii?Q?r3lDU/jFCLpvPJZ1RLTrfyq3FJTve79ROCh9HnpdWZ9HuoUiggezkKIJCaoc?=
 =?us-ascii?Q?GHEByW5vluxCsD02nw1S1PMf/LD8Fca5s5F5K5F7DrM435Lj05EOq7HWVJAk?=
 =?us-ascii?Q?cnEhlr1Js96GCPoIKpzUGpoWRFbc9OL+p7bl4sxewo5QCaftOm55TldBNxbi?=
 =?us-ascii?Q?rvQiakmShJOujWiELjWYhsMzkoUfaiF/3Q2u4jtNjJ5ol/RELuNzCCcm6eAo?=
 =?us-ascii?Q?xxuPTh8dYHgWumYMGUjNgOuF3foTkO02fXcvxxbZJOBU+84B+ImZodFgm6FB?=
 =?us-ascii?Q?Wl7HPRTdVqeeqnkS2eAZ6+sa8tXYbxIDtT8BuQOX10EyuRuQEwTwhGxShmX4?=
 =?us-ascii?Q?WJv1IPYWUtjxs+oPHuyt4rdGb2RL7L+GFU7ZXEcIbTQotnGgSFEpyPk3fUAc?=
 =?us-ascii?Q?PxLFAlK+z5O31lGocwnUf6X0GpbXGAxv0efNU7MRQqVNt+Qomqgs2ym4I4XD?=
 =?us-ascii?Q?5ftMQEsrI0ocF/sJLIrVFHoj7/JDsZ0H6PxzL1ZyWCAeD/4ubSVWYDYfp3Cq?=
 =?us-ascii?Q?pfqTmM81XF2WFBQCYD7fieqfVG5mRIp8eaGb2iP9QcfDQa9FA+H0fYDa+jWV?=
 =?us-ascii?Q?Anral6mSfSEki+0IFyM4GtEYtT+JZQni+IwzlQTtLZpdiRpwwGd80nmYalnK?=
 =?us-ascii?Q?5/+Kb1/9xLlE/UI5eVUNApzMRzadtnSx/XK8WqkwVKEL/ePxWpcPhWAyXbB0?=
 =?us-ascii?Q?Yk+Z2Co5XISwDZNbWHhlB35amkBLLPvkE5StiZsfjPb0fk/wmmdXTKU+2NLO?=
 =?us-ascii?Q?H7bN37zbO2Pv6OekBk7pQmc7PdANqfprYmbNnFIwN+AmHjVBYiwtyjVDLIpV?=
 =?us-ascii?Q?cvPAfoozbzNQjNiqDSeVQx52CZfnCTOzv+fgIScwmtBviilSJYJQFn97CQv+?=
 =?us-ascii?Q?maivqIrdQ8PB/X72aV72u1olA4as/Q4xjsDciDOKPfFMrkP7xMjhlKcssogU?=
 =?us-ascii?Q?BO+U7kK0FKpSQ+vESHA3utay9iPLuX+M3PcTe0Ckqdtxe/mECJ5S0CmUQSrV?=
 =?us-ascii?Q?TukmN9gKXZwRPCLQCYm98fPKjrbq3LSK5M5PbgLuSjwI24ta7EUPi+mYI9NL?=
 =?us-ascii?Q?G3tyHy2diKT4ZhHZ6SF9v2cjPbxLNnfhIx7juRYHhqj/8poDVtriOzlbFtCd?=
 =?us-ascii?Q?FK6ciPRgLOCDrbhBzCAk9uj0dhKB5K/xoeTBwY3oE1sEZQjRMwKnNQzehcJT?=
 =?us-ascii?Q?N1eRyHgzwWBZ0i7y61MtvgaQVRXZJmObMzIfiZApM8Xh4+nLSuCPwdTTaXvJ?=
 =?us-ascii?Q?UUVetB5ILdz3XmspzQqxMSlbiJzJx0jI2hob0eq/SH5REn5g3oZvLxD6ICfB?=
 =?us-ascii?Q?eifX0fhyu2emU699jEZMYn/C9l/6G1ZNcFck?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:00:42.0909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d885cf-21c8-4aaa-ad99-08dda9ca489a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7083
X-Proofpoint-GUID: YNvKrb5iuyPP4qZVgoI-TboP1ruvqlrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyMyBTYWx0ZWRfX1/PBkq4iSiZH OnW6EGKRYcZJhZjFbSUJFK4CPbzlxjsWeUERZ9DBsQKJvcvWsBnme57KAsQMuLRBx+SfSeuEV/T 3V0kUzdjFjdCJnjQwfqz/YRqeX71Kx3sdOm9sJdKJGIe/5HaoFaKbRao4+aJgCA1Gbyc8vg4byf
 om9fLLBQGqIQYA1WxYzLKR0ivD/mYymaAAdqiWBs5nQ6Fy3ki4pGjGPEAVrAp1ptAmMG7M/IUHw B+OP0xrcmwkkC3r3GNkjdufUsEOp+CpbrOHYWmcUTxAR9gDUiEINLVCdG6bke/Xlr5bhfi4+HUH L9RxKfUhyJ9IUpINEr/e9NuGAXpipbl1KiirGW231wuDLdCadqB++bQiAdDUqcqMjUNH9NhBjJ0
 kpjjFoymDtIwyPKPrIvhcoWF3C9GjIET0n9PjOGMWb4CYKgUn5qxJwqG+ebKMsKnAUACOj72
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684af9ae cx=c_pps a=RHCyCMrrLXgv8JsqJhyQhg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=2DsETvQBno8s4t019a8A:9
X-Proofpoint-ORIG-GUID: YNvKrb5iuyPP4qZVgoI-TboP1ruvqlrG
X-Proofpoint-Spam-Reason: safe

Currently only left and right channels are supported for each amp.
Support is needed for a center channel, using both left and right
channel audio.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l41.h     |  12 +++++
 sound/pci/hda/cs35l41_hda.c | 103 +++++++++++++++++++++++-------------
 sound/pci/hda/cs35l41_hda.h |   1 +
 3 files changed, 78 insertions(+), 38 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 43c6a9ef8d9f..7542cabfa726 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -609,6 +609,18 @@
 #define CS35L41_DSP_NG_DELAY_MASK	0x0F00
 #define CS35L41_DSP_NG_DELAY_SHIFT	8
 
+#define CS35L41_ASP_RX1_EN_MASK		0x00010000
+#define CS35L41_ASP_RX1_EN_SHIFT	16
+#define CS35L41_ASP_RX2_EN_MASK		0x00020000
+#define CS35L41_ASP_RX2_EN_SHIFT	17
+#define CS35L41_ASP_TX1_EN_MASK		0x00000001
+#define CS35L41_ASP_TX1_EN_SHIFT	0
+#define CS35L41_ASP_TX2_EN_MASK		0x00000002
+#define CS35L41_ASP_TX2_EN_SHIFT	1
+#define CS35L41_ASP_TX3_EN_MASK		0x00000004
+#define CS35L41_ASP_TX3_EN_SHIFT	2
+#define CS35L41_ASP_TX4_EN_MASK		0x00000008
+#define CS35L41_ASP_TX4_EN_SHIFT	3
 #define CS35L41_ASP_FMT_MASK		0x0700
 #define CS35L41_ASP_FMT_SHIFT		8
 #define CS35L41_ASP_DOUT_HIZ_MASK	0x03
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d5bc81099d0d..c2cf3813872a 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -93,47 +93,36 @@ module_param(firmware_autostart, bool, 0444);
 MODULE_PARM_DESC(firmware_autostart, "Allow automatic firmware download on boot"
 			     "(0=Disable, 1=Enable) (default=1); ");
 
+static const char channel_name[3] = { 'L', 'R', 'C' };
+
 static const struct reg_sequence cs35l41_hda_config[] = {
 	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3072000Hz, BCLK Input, PLL_REFCLK_EN = 1
 	{ CS35L41_DSP_CLK_CTRL,		0x00000003 }, // DSP CLK EN
 	{ CS35L41_GLOBAL_CLK_CTRL,	0x00000003 }, // GLOBAL_FS = 48 kHz
-	{ CS35L41_SP_ENABLES,		0x00010000 }, // ASP_RX1_EN = 1
 	{ CS35L41_SP_RATE_CTRL,		0x00000021 }, // ASP_BCLK_FREQ = 3.072 MHz
 	{ CS35L41_SP_FORMAT,		0x20200200 }, // 32 bits RX/TX slots, I2S, clk consumer
-	{ CS35L41_SP_HIZ_CTRL,		0x00000002 }, // Hi-Z unused
 	{ CS35L41_SP_TX_WL,		0x00000018 }, // 24 cycles/slot
 	{ CS35L41_SP_RX_WL,		0x00000018 }, // 24 cycles/slot
-	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, // DACPCM1_SRC = ASPRX1
 	{ CS35L41_ASP_TX1_SRC,		0x00000018 }, // ASPTX1 SRC = VMON
 	{ CS35L41_ASP_TX2_SRC,		0x00000019 }, // ASPTX2 SRC = IMON
-	{ CS35L41_ASP_TX3_SRC,		0x00000032 }, // ASPTX3 SRC = ERRVOL
-	{ CS35L41_ASP_TX4_SRC,		0x00000033 }, // ASPTX4 SRC = CLASSH_TGT
-	{ CS35L41_DSP1_RX1_SRC,		0x00000008 }, // DSP1RX1 SRC = ASPRX1
-	{ CS35L41_DSP1_RX2_SRC,		0x00000009 }, // DSP1RX2 SRC = ASPRX2
 	{ CS35L41_DSP1_RX3_SRC,         0x00000018 }, // DSP1RX3 SRC = VMON
 	{ CS35L41_DSP1_RX4_SRC,         0x00000019 }, // DSP1RX4 SRC = IMON
+};
+
+static const struct reg_sequence cs35l41_hda_config_no_dsp[] = {
+	{ CS35L41_SP_HIZ_CTRL,		0x00000002 }, // Hi-Z unused
+	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, // DACPCM1_SRC = ASPRX1
+	{ CS35L41_ASP_TX3_SRC,		0x00000000 }, // ASPTX3 SRC = ZERO FILL
+	{ CS35L41_ASP_TX4_SRC,		0x00000000 }, // ASPTX4 SRC = ZERO FILL
 	{ CS35L41_DSP1_RX5_SRC,         0x00000020 }, // DSP1RX5 SRC = ERRVOL
+	{ CS35L41_DSP1_RX6_SRC,         0x00000021 }, // DSP1RX6 SRC = CLASSH_TGT
 };
 
 static const struct reg_sequence cs35l41_hda_config_dsp[] = {
-	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3072000Hz, BCLK Input, PLL_REFCLK_EN = 1
-	{ CS35L41_DSP_CLK_CTRL,		0x00000003 }, // DSP CLK EN
-	{ CS35L41_GLOBAL_CLK_CTRL,	0x00000003 }, // GLOBAL_FS = 48 kHz
-	{ CS35L41_SP_ENABLES,		0x00010001 }, // ASP_RX1_EN = 1, ASP_TX1_EN = 1
-	{ CS35L41_SP_RATE_CTRL,		0x00000021 }, // ASP_BCLK_FREQ = 3.072 MHz
-	{ CS35L41_SP_FORMAT,		0x20200200 }, // 32 bits RX/TX slots, I2S, clk consumer
 	{ CS35L41_SP_HIZ_CTRL,		0x00000003 }, // Hi-Z unused/disabled
-	{ CS35L41_SP_TX_WL,		0x00000018 }, // 24 cycles/slot
-	{ CS35L41_SP_RX_WL,		0x00000018 }, // 24 cycles/slot
 	{ CS35L41_DAC_PCM1_SRC,		0x00000032 }, // DACPCM1_SRC = DSP1TX1
-	{ CS35L41_ASP_TX1_SRC,		0x00000018 }, // ASPTX1 SRC = VMON
-	{ CS35L41_ASP_TX2_SRC,		0x00000019 }, // ASPTX2 SRC = IMON
 	{ CS35L41_ASP_TX3_SRC,		0x00000028 }, // ASPTX3 SRC = VPMON
 	{ CS35L41_ASP_TX4_SRC,		0x00000029 }, // ASPTX4 SRC = VBSTMON
-	{ CS35L41_DSP1_RX1_SRC,		0x00000008 }, // DSP1RX1 SRC = ASPRX1
-	{ CS35L41_DSP1_RX2_SRC,		0x00000008 }, // DSP1RX2 SRC = ASPRX1
-	{ CS35L41_DSP1_RX3_SRC,         0x00000018 }, // DSP1RX3 SRC = VMON
-	{ CS35L41_DSP1_RX4_SRC,         0x00000019 }, // DSP1RX4 SRC = IMON
 	{ CS35L41_DSP1_RX6_SRC,         0x00000029 }, // DSP1RX6 SRC = VBSTMON
 };
 
@@ -657,6 +646,41 @@ static void cs35l41_irq_release(struct cs35l41_hda *cs35l41)
 	cs35l41->irq_errors = 0;
 }
 
+static void cs35l41_update_mixer(struct cs35l41_hda *cs35l41)
+{
+	struct regmap *reg = cs35l41->regmap;
+	unsigned int asp_en = 0;
+	unsigned int dsp1rx2_src = 0;
+
+	regmap_multi_reg_write(reg, cs35l41_hda_config, ARRAY_SIZE(cs35l41_hda_config));
+
+	if (cs35l41->cs_dsp.running) {
+		asp_en |= CS35L41_ASP_TX1_EN_MASK; // ASP_TX1_EN = 1
+		regmap_multi_reg_write(reg, cs35l41_hda_config_dsp,
+				       ARRAY_SIZE(cs35l41_hda_config_dsp));
+		if (cs35l41->hw_cfg.bst_type == CS35L41_INT_BOOST)
+			regmap_write(reg, CS35L41_DSP1_RX5_SRC, CS35L41_INPUT_SRC_VPMON);
+		else
+			regmap_write(reg, CS35L41_DSP1_RX5_SRC, CS35L41_INPUT_SRC_VBSTMON);
+	} else {
+		regmap_multi_reg_write(reg, cs35l41_hda_config_no_dsp,
+				       ARRAY_SIZE(cs35l41_hda_config_no_dsp));
+	}
+
+	if (cs35l41->hw_cfg.spk_pos == CS35L41_CENTER) {
+		asp_en |= CS35L41_ASP_RX2_EN_MASK; // ASP_RX2_EN = 1
+		dsp1rx2_src = 0x00000009; // DSP1RX2 SRC = ASPRX2
+	} else {
+		dsp1rx2_src = 0x00000008; // DSP1RX2 SRC = ASPRX1
+	}
+
+	asp_en |= CS35L41_ASP_RX1_EN_MASK; // ASP_RX1_EN = 1
+
+	regmap_write(reg, CS35L41_SP_ENABLES, asp_en);
+	regmap_write(reg, CS35L41_DSP1_RX1_SRC, 0x00000008); // DSP1RX1 SRC = ASPRX1
+	regmap_write(reg, CS35L41_DSP1_RX2_SRC, dsp1rx2_src);
+}
+
 static void cs35l41_hda_play_start(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -671,19 +695,13 @@ static void cs35l41_hda_play_start(struct device *dev)
 
 	cs35l41->playback_started = true;
 
+	cs35l41_update_mixer(cs35l41);
+
 	if (cs35l41->cs_dsp.running) {
-		regmap_multi_reg_write(reg, cs35l41_hda_config_dsp,
-				       ARRAY_SIZE(cs35l41_hda_config_dsp));
-		if (cs35l41->hw_cfg.bst_type == CS35L41_INT_BOOST)
-			regmap_write(reg, CS35L41_DSP1_RX5_SRC, CS35L41_INPUT_SRC_VPMON);
-		else
-			regmap_write(reg, CS35L41_DSP1_RX5_SRC, CS35L41_INPUT_SRC_VBSTMON);
 		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
 				   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
 				   1 << CS35L41_VMON_EN_SHIFT | 1 << CS35L41_IMON_EN_SHIFT);
 		cs35l41_set_cspl_mbox_cmd(cs35l41->dev, reg, CSPL_MBOX_CMD_RESUME);
-	} else {
-		regmap_multi_reg_write(reg, cs35l41_hda_config, ARRAY_SIZE(cs35l41_hda_config));
 	}
 	regmap_update_bits(reg, CS35L41_PWR_CTRL2, CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
 	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
@@ -841,22 +859,31 @@ static void cs35l41_hda_post_playback_hook(struct device *dev, int action)
 	}
 }
 
-static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsigned int *tx_slot,
-				    unsigned int rx_num, unsigned int *rx_slot)
+static int cs35l41_hda_channel_map(struct cs35l41_hda *cs35l41)
 {
-	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
-	static const char * const channel_name[] = { "L", "R" };
+	unsigned int tx_num = 0;
+	unsigned int *tx_slot = NULL;
+	unsigned int rx_num;
+	unsigned int *rx_slot;
+	unsigned int mono = 0;
 
 	if (!cs35l41->amp_name) {
-		if (*rx_slot >= ARRAY_SIZE(channel_name))
+		if (cs35l41->hw_cfg.spk_pos >= ARRAY_SIZE(channel_name))
 			return -EINVAL;
 
-		cs35l41->amp_name = devm_kasprintf(cs35l41->dev, GFP_KERNEL, "%s%d",
-						   channel_name[*rx_slot], cs35l41->channel_index);
+		cs35l41->amp_name = devm_kasprintf(cs35l41->dev, GFP_KERNEL, "%c%d",
+						   channel_name[cs35l41->hw_cfg.spk_pos],
+						   cs35l41->channel_index);
 		if (!cs35l41->amp_name)
 			return -ENOMEM;
 	}
 
+	rx_num = 1;
+	if (cs35l41->hw_cfg.spk_pos == CS35L41_CENTER)
+		rx_slot = &mono;
+	else
+		rx_slot = &cs35l41->hw_cfg.spk_pos;
+
 	return cs35l41_set_channels(cs35l41->dev, cs35l41->regmap, tx_num, tx_slot, rx_num,
 				    rx_slot);
 }
@@ -1495,7 +1522,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
 		 cs35l41->acpi_subsystem_id, cs35l41->hw_cfg.bst_type,
 		 cs35l41->hw_cfg.gpio1.func == CS35l41_VSPK_SWITCH,
-		 cs35l41->hw_cfg.spk_pos ? 'R' : 'L',
+		 channel_name[cs35l41->hw_cfg.spk_pos],
 		 cs35l41->cs_dsp.running, cs35l41->speaker_id);
 
 	return ret;
@@ -1709,7 +1736,7 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 	if (using_irq)
 		cs35l41_configure_interrupt(cs35l41, irq_pol);
 
-	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, &hw_cfg->spk_pos);
+	return cs35l41_hda_channel_map(cs35l41);
 }
 
 int cs35l41_get_speaker_id(struct device *dev, int amp_index, int num_amps, int fixed_gpio_id)
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index c730b3351589..7d003c598e93 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -42,6 +42,7 @@ struct cs35l41_amp_efi_data {
 enum cs35l41_hda_spk_pos {
 	CS35L41_LEFT,
 	CS35L41_RIGHT,
+	CS35L41_CENTER,
 };
 
 enum cs35l41_hda_gpio_function {
-- 
2.43.0

