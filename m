Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9824B26;
	Thu,  3 Jul 2025 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539381; cv=fail; b=rExvwwi4nak1pcoc/Mba/J38dhgn1duWhpZd+VGIxHoIu0SGSWsYIxsRHdZiPHdgYdPnu2VRs7PMp9dQ2hb8+O5TQgu3leVnl37ekD4K2d8RN6H/e8q74kPOx3TL7CA34moJzPu6kuZlorBn2A8yhU5y1rOeH5YRPRvEvneigIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539381; c=relaxed/simple;
	bh=t0dXQR3PnMq3+R0Qu8NXWk3s0NMJp6dgmz22aIGPBdg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nvoFu/TEZbZEWxn+UmMEbcXvXL8wjovgEwBvDWqoO0hQd8w4MUVgRlo4CyM549A01Qs3R51PhhnbF0AY13yjRgL6b88/zhjLJmKPGWvE574o7/R1Xzdwx8CbgHHoJJ+Dvne5cQ7rGVu7/WphWN5A8CIexi9iLIU+USvdaNDfDu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AxizxrIA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pFS3mBIc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AxizxrIA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pFS3mBIc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56358Mn4014915;
	Thu, 3 Jul 2025 05:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=7j4jjd3otheQfuEJ
	UMAIuuF9lQiPK76FyxZnRVYuIPI=; b=AxizxrIArOmZuEtwJ/x4mFUssWuEu+sB
	xOUUP6P8JvZoUVNY9rycK0wXBqpeAJEY4/jLPzUWNy3Nz+EmxS7WgVAGeaw/TfCI
	HiOF3FrXdWy3ONUo5WdiY4mh7/b+KO8hJcpfun1FVCHmwOMqFiVU4u8S7B8B2TQf
	cDgFuYxcBnfAvgj7T5/Zsb2qRX2b78jlkW1sRtKpLkbJ87kFx/X0XVbPtJvRfjV+
	jI/aSUjExHx72taA2pPd0Gdqohhbu+fwyLanK0WN/2+Ich2tPPRnWG/89RzXUqJ9
	pcPUGaJGa8nsvdI0otCBHc+M3zM3QvqtCC8PIEFGKqdn0sqGlU8rTw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2127.outbound.protection.outlook.com [40.107.93.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47n0wp9vnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 05:25:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smD0pIf0PD3RVl0+e7O4JUxldbYwsQlNVXyNZ2E5PpgPsK2b17qmK64cA3JAwz5/OOXLpezzITvmiDNrkk3VCh25ItcgJE74JN4QfDUKv9nLL9zC5DZrkdOHEXuHjV3qGRkbobcDuLN07guZYIPr4kTckVgJryLE7LKDwNbD+q0qR6aBsXskRzuQtk1yre4wNa4kPP+33LflIoJMzvEh5uK7qIX9ehwz2blRaFBb4Dl7EPWdK7nzKi4D4XiY/JN5ZEOJYfWz8K6gnuqFsBrEdB/IGU5Le/nCYbT3QDqGDCr+wAcdxzW/cedVwSfORc6UTHA32f08lPBac91K98B99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j4jjd3otheQfuEJUMAIuuF9lQiPK76FyxZnRVYuIPI=;
 b=eUYkAsun/qCKUgN0j3IsWNUX7pCdBrk7ikjw4pCQWwFVBAbOJAYDbRzpjRo0LpJPLNydhtb7VRuctVD/9XQrX9+YWtRafKBoTUODCU3ZgWYg3fgyuy9Lbfq1qqz8yOM8/XMs4kyquxtlCH/tkj3xBrIVgCcVMt4FWSYRu5u8gmtbW3RsKWuhllE9SJF77mz0R2PEtwAmPRdNU1jpUl3BFZAi17YhNulTHpwrK4EfEBGesYmrkMUyJooB1rBBsi3V2NC5Xw+4Qg3Vj+8toUTbPGpAyA7GUKHlM6Zv+VYA9GN0TiVpphH58XOU1J8f7dAIve1PaWO19GwmaTGZ4LGFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j4jjd3otheQfuEJUMAIuuF9lQiPK76FyxZnRVYuIPI=;
 b=pFS3mBIc+EY1B9wA3C6FQVIvY+bgp1mC6b13zbw0d7foOfvsZizqCM5nsyO0zuH44anVNjURcZUwe9psnsbK6AgLDCzVfwXO2RNZ+80wywr9I3yON1XNLNNjXaZQA3iCBl5rNaJiHj5uK3kqc/APH70titEaX0PP1XsJPPWCvxg=
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by IA1PR19MB6449.namprd19.prod.outlook.com (2603:10b6:208:38b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Thu, 3 Jul
 2025 10:25:24 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::d5) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 10:25:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 10:25:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AB4A3406541;
	Thu,  3 Jul 2025 10:25:21 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 90DC882024B;
	Thu,  3 Jul 2025 10:25:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: probe() should fail if the device ID is not recognized
Date: Thu,  3 Jul 2025 11:25:21 +0100
Message-Id: <20250703102521.54204-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|IA1PR19MB6449:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e266911c-8bb6-4052-5a81-08ddba1beb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4a6BTxXcfMGOVSSpz0NCZ9BbVV1AEIIxf6Ggjh52cKbIddE2VAqk+Don1IgV?=
 =?us-ascii?Q?VIkQzqN/j/daAgrY7+dlmUCxe6bEaWDIF8fZolb9zWzVn5PMsmJwUMm6ABgl?=
 =?us-ascii?Q?7H6C56f3qfWSj9YEQkg3kaF2w7ryKwKsu6VIDonslRwDWBk2uYTWNEK9aBEv?=
 =?us-ascii?Q?T3Lo8m2yyKsiVgdEZCJDg+vvEs3mekIIEPrJXysOp4QbPypQSzKWRXQs8Ajk?=
 =?us-ascii?Q?iaSp9yflgzMeTSmV8tv2OX8JZvQiAR2/xXLqAI4OtVMkEPmLmQAnqq6jLCgy?=
 =?us-ascii?Q?FV6o2Dwnd5jbCVMBXkzSXOSFu4ZDXg7dWf/HdT981lMy3/TInvNstMmTPhNg?=
 =?us-ascii?Q?UmazPSipfwdX25iQXsIO3RTYMgZAdQSvNtCPl4J2pVt8JLm91TF3uWqCgolL?=
 =?us-ascii?Q?vNc8giNa8TBwxLg9zY5e5TM/1uUwE4kGhpFzl1nhO/3Tg/RmyDJIO9DR4EjN?=
 =?us-ascii?Q?0XPPwD8zthe6nRggY6Osmtmc/F6J8Cy7STsX+d/oGxf73sB1AyHP5bGuOErr?=
 =?us-ascii?Q?5CiODS0nPTY2O32IQNkB1gqtEZO635zSihxMezyAZop5CuiTht1Tmk07nM8j?=
 =?us-ascii?Q?ktSoay/nYcrCfknujK5aRt8Ofq8dag+qNbiQUcRFf5rTSFlPUQjo6wbmFb/C?=
 =?us-ascii?Q?Ba403AeYSP+5i1jgf62Zt40tXgH6Y331eeURqpQe11eBbc9gspEpiQv4OIjd?=
 =?us-ascii?Q?fvpUeOlGSTpyp8q1i+hNq6kupFz+IZOvebiN0gUzcAgBT4vMYDuvTiL45hHI?=
 =?us-ascii?Q?Kjllcm4ruPEMWFZ5pz26/6NgDrdUhtYRyECVIpFjVxEZLbxMaxLyeeNI9Tqa?=
 =?us-ascii?Q?4AOFhDyc22bBoD2ysz4U6p4UU/8ZKacqPnmVsDL5+fTkpl5+VLxYLiVnNBkU?=
 =?us-ascii?Q?QQsHoqrzoVAORvWwCjJwP+4dckvnJ3+l+/K3FLmhbok8VQ1374cAjQcXINUg?=
 =?us-ascii?Q?YUC+bE3gsCO8/bVlMoOZMj93uWwCOmaFX7QeJiarOvA+qjnogc7+5EFvV83y?=
 =?us-ascii?Q?4uUTBAPurWGG2dWcD7WdGdu/5FYHpjscPWH7ps9kZzIKXZMcK5pGRmycJlJ5?=
 =?us-ascii?Q?qvzF6MMbt52vFOgaQKSE5FYDCSd7EcTZBtMZUkD7ySS6cODheE00HC8mkBgn?=
 =?us-ascii?Q?OexioV7zLYjE7WOnfxzK55hDsfEUi5OH0FZ/u0VeWoZdaQCaxrDFMTwsO3RC?=
 =?us-ascii?Q?hnVfY+Dqb7QhKifWDUyTrovvUst+lwVATVmhpQa+Ym/+wQ87lfSmRuTJ0QF2?=
 =?us-ascii?Q?R3LZ8xRi7IvpFcdmJiWr9BLpgf/8c+WmkOkiXYmYmeW2x7zXxDGnaFWF/+5G?=
 =?us-ascii?Q?K/FJYDo+/pMgfm9f1fxTyssy9HBnWvwnts+4op2c18uPmMJIy33xTaD1tg01?=
 =?us-ascii?Q?kTEwZ2ao4SXi7YCnuX+nL+E6tnSh7Mb44X+txDpBTxy0TfjMtBvo6Lt9YhLr?=
 =?us-ascii?Q?8lxYClQk2DZzRW85mXNGQGbaU+7mNyr3OZ8dn95M82aZgZe2oPWuHQ66Te4z?=
 =?us-ascii?Q?4fvgQfGfve3DAaAtX9jkeyP8Z1+6clDQrgK4?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:25:23.0817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e266911c-8bb6-4052-5a81-08ddba1beb7c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6449
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4NiBTYWx0ZWRfX0LHTkHbMoVzq RJc+BmhfGdegM6dXuLOKOQtRoeqJkfyz6aOWGrkXtmI4jl1FSfYvbn1T2bO29cp/4n/uh2JOthb f5z9OVNRVPy5L0w5Kj1XMEu4Xm2VdQKm83FPnm2te9nEPmyqwsm/hD328011az37ujFmwFHbiAi
 egiIzr+ur0kkZP2KgRkl6bLfjOPoik7MMqu37kC7vLMBoDiJhtL90Ruf88DLulMZy5dK/F0d27/ OM1wJiSRgqTA6aVXP2Atq6lm2z9YIXudEWT5iy07x/0LRV5q5VGwCBfZFhMm/O2L4GgxuwCURR0 Rux0lStZGiu6zs9DGlw4X/bvYXIG9ky+d1ZFdirjoPcP52ef/2xXVqmYhhU3DHDVacH1R6pzJNv
 KQubXEXVJq8s+Yom+9zFTchNYkTegMApBWAn3P2iFvbeRg8oHqnPT3+LWEB7YbVVMn03ankK
X-Authority-Analysis: v=2.4 cv=JqDxrN4C c=1 sm=1 tr=0 ts=68665a9a cx=c_pps a=Vdqx4uI7DVh9toom6gpoiQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=Ao4FivaNkqHHK5zEjocA:9 a=0lgtpPvCYYIA:10
X-Proofpoint-GUID: B-_trTgdaxOMdxvod4upnswWV4fGoCHV
X-Proofpoint-ORIG-GUID: B-_trTgdaxOMdxvod4upnswWV4fGoCHV
X-Proofpoint-Spam-Reason: safe

Return an error from driver probe if the DEVID read from the chip is not
one supported by this driver.

In cs35l56_hw_init() there is a check for valid DEVID, but the invalid
case was returning the value of ret. At this point in the code ret == 0
so the caller would think that cs35l56_hw_init() was successful.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 84851aa055c8 ("ASoC: cs35l56: Move part of cs35l56_init() to shared library")
---
 sound/soc/codecs/cs35l56-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index d0831d609584..ba653f6ccfae 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -980,7 +980,7 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 		break;
 	default:
 		dev_err(cs35l56_base->dev, "Unknown device %x\n", devid);
-		return ret;
+		return -ENODEV;
 	}
 
 	cs35l56_base->type = devid & 0xFF;
-- 
2.39.5

