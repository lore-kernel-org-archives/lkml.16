Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A3518035;
	Mon,  9 Jun 2025 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464517; cv=fail; b=hZkEvDijOvC5mCtwgPZREy1r+HRUqdqZR3x8oD9/Sp87DjlnrrLwI8bTku6u9JXBHmi2vWQ8L6JmAsYsuIjFnYQgDtDiDrGWQOra5YRMJTucszeG+fme4k2a9MgMnGAwF2rINGFDptCCA7JsfU5dwQ5TonmAmByM73754uqPhR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464517; c=relaxed/simple;
	bh=8n2vTmfqG3sCn5sokwYF0w9NAG4u6t1qZ6nGF/RWExs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VNz8aDtEoP/7k/Fz1D18IcG1PuC42u4rmCwZs+OnJSA6IWrW64QyAPSS73qe40PfWyZofjlTrJ5aSF6mv/5CMvdXaeLy2A2DsJ6UvaCfBhetpdRzXc+DcQpLsS1nDqO5YKflctN8z9F5X0B8uxcPU5X1c8H6soPsovPZio3A2hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cH/ADj0i; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lXJbV1C6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cH/ADj0i";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lXJbV1C6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5596vGvo015261;
	Mon, 9 Jun 2025 05:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=2E/bHQq+ziDeZS/k
	4hjpadL7fRUD9Fu6gU9Ppvbh/Jc=; b=cH/ADj0ikVkGvMpPeSPvuBUZSgqZqRJr
	WSaodBvhaBjvo3vYU19NBhxbAm4JsA3imyzyoGT4k16urpD4IB3zsRJ2tSSG2738
	88X3LEW44PxlR0BlD0FhouDMqDQiOjdfow7DhwARroOlFa4NyK8AT6afMaO1BCEs
	fTfajaBrbi2vZyRBCNg/111mhX0TPRx5vePA/KVzTbN35NDcF5Sk2ep5SBF6tuzb
	ny67gTOx4bhgy9d7ZvMFZ1b2j3Fz83u2nHBUpuWGDgDHRpud11rP3SOprvHMWFR4
	ThouWftQKp47iWc7MuZ2ohxHM5AvnwkLxTArpO7mCqAT5nfI0gCEZw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2111.outbound.protection.outlook.com [40.107.101.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 474ykthb1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 05:21:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myCh38QeO8pcfGUWO69T1GaRR2A9HbT++IoqAiDgwhQ18Yc3Ys1+QbYlKMGviBwm1NoV1QFBQvBt11mx7lpqdDJWzdFy3TnaYeXYygrXt18mDtZK2fh7GhjX23/Ql+8O3/HfKKM0CamH5ZBxZzqSh3RF+ObaMvg8Y9wtLv3gO+IeOh4qa3nUBNEVjtEaFQyLWni8ikxyZAJ+bQEteecS0/wtM7kzTjaGJRbGM+Ql1M87O6aln8ZmQq9RKm1I2R0OxVhr9jj7fhXXIS4fiwb0gn6v9y8C+PB4yI7aWrDKp5JoAkp5ANX6LH8zvGVa9hhqn9RKLVdje270lFN+3WMCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E/bHQq+ziDeZS/k4hjpadL7fRUD9Fu6gU9Ppvbh/Jc=;
 b=EyUpyEyENNIx0MUZYo7u586cEvTbnP+7WSMNa7cMbZ6HR9bWvTeyJnQKCv5tN4h6+ZRgOVHveaYdjdDgY0MtwoOJf4XC9GBhLZIjaDswWvFoWPAKZ6ojBGXr3BTT+DKxRV9eYqN71w6psau93tJTJnJR5ywdMIisLfnrH0tE8phD2dDxwaewYzuHgnWCuvIW3H63+izFWMUadBCJlqBzylxNpU3KVC+zSoZiK0xaUWPrY/ke3Cb90ZAAiGVXBbMveow9TLZ2Ot0m+l3MsMHl0/0YCjZYTa76G4KvwiMwwItI0SK0Hj4HH7Jw8/eOF9CJElCmmh9IVylCzwat2BWu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E/bHQq+ziDeZS/k4hjpadL7fRUD9Fu6gU9Ppvbh/Jc=;
 b=lXJbV1C6T1cduh/M8uyRIqwgA5+4PqWVnxdKMRSllLj7rTkx/7ftqcL+mkiVhzbIxPtizh86Er8ofzeRIHhGwhKWe2cDSB4jkPrCfv/OZqOWPqPfJLz7OYRp4ZSONO0zHL/XuPfta4JE05ujgO32N2lRW94S+k5ccEYQ8btWi/Q=
Received: from PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::11)
 by PH0PR19MB7317.namprd19.prod.outlook.com (2603:10b6:510:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.16; Mon, 9 Jun
 2025 10:21:28 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::c6) by PH8P221CA0050.outlook.office365.com
 (2603:10b6:510:346::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 10:21:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 10:21:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 09A10406545;
	Mon,  9 Jun 2025 10:21:26 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E769982024A;
	Mon,  9 Jun 2025 10:21:25 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, nick@karaolidis.com
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Asus GU605C
Date: Mon,  9 Jun 2025 11:21:25 +0100
Message-Id: <20250609102125.63196-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|PH0PR19MB7317:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4b8c0299-cfa5-41ab-c484-08dda73f6516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|376014|36860700013|82310400026|61400799027|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kUeOtp47ddCFXlw66Jhb3avIswtokk3MXDjmHxhHMJ+q73vboDozG2hlaNcC?=
 =?us-ascii?Q?URQUhaUPp247ihkLrf6CtowUEN/Nz+GKDElj0Aa/A7ES6VlHELvcivBl3xXl?=
 =?us-ascii?Q?4sGPTIS+TUYxhlAk9wWanZuS8PNKt+PrK7Euqb1ImuaNoRL4TYSZTtAlmptH?=
 =?us-ascii?Q?7nHoag/I+JUBYU5V8Zdon6H+Aaf5mG3pM0sGA8e6wOKqgk6fjU5UODFNlsvg?=
 =?us-ascii?Q?jeASKBgj6tg6e+q7qmaI69lGrbLpsNQxc+yB8ab+DgCAnSU49ydEhXQnwBVa?=
 =?us-ascii?Q?4s4zw7is7fFgoaUEMxfqVYz+RMnPlDz2loCiE5pdja/EiZz+RReOcHSh50je?=
 =?us-ascii?Q?+IEOBAhqqntNoNzgB5HPnFZ4rhOSW6Zm+BbD3lxRD0pM4uIupzO9Ddqz77BI?=
 =?us-ascii?Q?oph4lE5umXpXaQvlbwx4i7L9wXyt/7YJLgiQyohbWLxaLk9tybp6cY3lvxxZ?=
 =?us-ascii?Q?bNswwLggc7+gDfQrhtjIs0bluhIkK2R/3avwgyJDheF7OxGLDzW/od9e7Cmq?=
 =?us-ascii?Q?DYb8FG28g5PjZQZm/p2dOOFjoN/7RYH5DOwaFa8Bbph6blE+m6sdxY1uXXsw?=
 =?us-ascii?Q?k70AYjJYpotT3UIOTjf6okFWsOr93A/bJlyMvKce05uqw5QbZE/NpQ76DNQ+?=
 =?us-ascii?Q?NRR0O/wsvrPuHxW7CUa2ZSB5i+bRhKJHQQU7mcMbjXVLkaqA0wHpCBoDmhTH?=
 =?us-ascii?Q?ujnw2/gBPFEu/zizP3C3jJ0CVcBp5ce/o1b6lcM+ld+gAcp2nePBgn3DyVTh?=
 =?us-ascii?Q?475kx5Rz7KYLSA2A/kS9ZbJlG3uon3PfP3f+Hzl/bX8Ow5ze8CW8QhE403z/?=
 =?us-ascii?Q?2xTd8UvjrQD5pAh7hJfm6PnR4X4aHURk9fGKNdaoJbjRqqK/nGaof/4ZCAIM?=
 =?us-ascii?Q?GYR8inc4qBdHhoW0oYuIzMN5XprYTQ8daQT7vVdvVs4Crdheru0d8w7ZX3NL?=
 =?us-ascii?Q?41NxHs7Bs60ogfT80+N2FAvk1YpqnmCLg0InkuA+F4J0YSsWkCinR8cJzMSN?=
 =?us-ascii?Q?llEuG0yHVoKvxiBJ5xTBY8ZtrGlqWFgTNnad5oS1JeFV9oJ/5681QuNw0Lkh?=
 =?us-ascii?Q?y2u2caO0rGJaQbNJvDmHmWSZ2WUMcYBM7urukCugXM6tzZGSuvTtH7DVH9ZE?=
 =?us-ascii?Q?BZu+MUSVcLM7+konS8W6NxyMqyQJ3pBcQQOSOXYzWsZyIOC0bNqzf7FvlRwS?=
 =?us-ascii?Q?Qi42LyVCJK4jcywitkw/0jN8aYsPqQKDze49cxLs4cXLmAnLQxAuHunnGolK?=
 =?us-ascii?Q?jcPPfV1p45e21BMvi6dYb04QtqHsSTq/YUgSl4F483qnb6Q4vJ+NOVaq3o+s?=
 =?us-ascii?Q?gGa/Rtx9IDfJa2rMxggib2NdkhCOYlGZSpZREXj8r+sXZwrMFIe0BmMMAc6z?=
 =?us-ascii?Q?TaRTjhZ6zeN3g5KKhKrXfVkuj11tlpFcmdNglUM1jyX/ocXlHoWO1INXDOKx?=
 =?us-ascii?Q?7Gd4eL7v/wed+SX3spldoKSnzGKRU1GitdkaJXP3xGho9eKvNcOMs6Heoc7u?=
 =?us-ascii?Q?Y1/pzs6Jbc5/A7HOO3OHeFW4ChXOyeZnTEEc?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(36860700013)(82310400026)(61400799027)(13003099007)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 10:21:27.4489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8c0299-cfa5-41ab-c484-08dda73f6516
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7317
X-Proofpoint-ORIG-GUID: DjG-VFlMXsT3OVY9a2tBqfzx91F_Hkht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA3OSBTYWx0ZWRfX/fvYiaTFm80F btjj7hofx2UEKSV2mCFwVOOzQuW1GlacxE1LE6B9NsThopukZzAAVQ5XDs5bPBMO8LYS7FC8rWq DL40z/DqAmtrUBggizRTfrHteiJXFbwlFUM31GpJXqQbP7YdSoR7hQsd6jVrjs06mW/OIQuYzJ9
 2ll1toqwgiB1nZtVtq73Jlbc693UC2c4hady8/tNgTixhw7Ip3H7n6IO3MtCsnAfMo8ciKUJ5c+ 3ZvygBfHCbV9kgsgv+hGMBumDV5P33Q/tsQ9LuC35f7+ZeiZ7sqS4L98Yp2UXEMr8SD9ObU9yau nfDMHWvuBGw4ihz/8T4Tir7Mooo2vXZDw+N0MPKH31hoo9WHbnQ9rPLGw+Mp/SN0254PHcco+sV
 Nas6Jib8l5gym2jW/YB6rMouLKnx52Vqj6Q3mKTZvIVnbM8pV3dGM82PD5NOP9ID57Uhz8Bn
X-Proofpoint-GUID: DjG-VFlMXsT3OVY9a2tBqfzx91F_Hkht
X-Authority-Analysis: v=2.4 cv=TobmhCXh c=1 sm=1 tr=0 ts=6846b5b1 cx=c_pps a=Gj3jDI2bUA+frsfChNx8EA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=7sjQ802PAAAA:8 a=OC3RGxf-pvtD9Y_FmbgA:9 a=XA-6g1wT9i0TrkpP1d9R:22
X-Proofpoint-Spam-Reason: safe

The GU605C has similar audio hardware to the GU605M so apply the
same quirk.

Note that in the linked bugzilla there are two separate problems
with the GU605C. This patch fixes one of the problems, so I haven't
added a Closes: tag.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reported-by: Nick Karaolidis <nick@karaolidis.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220152
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba7320e..08f14979be0a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10904,6 +10904,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.39.5

