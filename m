Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDFF18FDBD;
	Thu, 12 Jun 2025 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730504; cv=fail; b=Hdlf36c4ho5/5bexuoap7FmXVJR4QJm2TBmOUcd1CZ79ORAIjVaXf1MCWVCIH5O6JJQbFhHvwlxd4lnu5j0XP7c/mJvzW1MJHd8Gey5u6f1ORgCnG3n9WQpEZ4xkJ+OytckB9o2Y6EokoX21vbCJNbjU6uQ1oFKyQ10zq5izOGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730504; c=relaxed/simple;
	bh=B4FvSXMj2gRcCut40A28e9lyVdCFg5TSY6f/5A+39eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TzlRtYjlMStWmjkKE2mmQnSkDQgIW48Rf2gppuvCL+LuYnkYQjtX5FYHPw+7tnpbmw6cgMdXaZLF3hbSn09FKCwzM22FtPcqwEkKQcMOXnyAZxXsMk+WMII4y8DMnXvBduRFkRHFtu1tKAV+L2dDT8x6m7kqOj8ax+dTLt9fNNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jaxu3aE3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=j9m+tKde; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jaxu3aE3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="j9m+tKde"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4KWxp023474;
	Thu, 12 Jun 2025 07:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sAOuE8JnIU1IEOg2g710ClzWETBnpl9kqckl2ya/OZs=; b=
	Jaxu3aE3m8xF3DLiftwMUAQPdsTSUDMZhQ9Vn1+JV+iqAozRLqneBU8/+B9+RBuf
	fvncS5+7RV89TYi5KdfDr20IuOv/FbE0qiHnNG1OxkdoJiABnol1MNa3eiBNRcVk
	QieruFbSPnbri7DDtvJO8uo0ZveAl4UDSlPowoAx2ssMbuq2PQMPoum2q86uG5B0
	alaxhJbRUzpnJcHJWutl3ErKgb/PL69m2YpwABZAVVPNbHYOJRVWr85YfO+hV6Dk
	XK43EhkuFWdbb6dxwLxiC/q9xPEtDOSgvKMpxMP6xABiSd3cCd0RHRBW//B73FwI
	829SFTMRV0Yq/PdRLCM49A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2137.outbound.protection.outlook.com [40.107.92.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdbsng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:14:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N485GkJwXD3BRMatdqMpG7Is/gY43U7OQ3e63ff+49lChay5gifKn+a/EIHBKEV09NoC1oNxhR/tNmku1pVOBfQmQ1bJwKB+sNpMHt1VaFBsaR0Wj/ofMutjA7epvKqlFU6fLO42iY9Df7Gs9irrJceATpwoWCgMyIQnYrFF0pnKgbXOeBM/tyaJy6i4RaDOertXzX8RhfFIZCXgUnDf/AnpMdJRnZFx8Y5slMXahlRuwufhLgdmtcew4F79pWB3HzHJGvWelHHyZLPHXrDbMV9vTT+bYQsh7ncRXqlC1SiPvEagJ714EWVZ0VgGJq79p39HwRQdMazlOw4dM905RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAOuE8JnIU1IEOg2g710ClzWETBnpl9kqckl2ya/OZs=;
 b=ZYGfsaVqx290WFj4zkCEZMNprksMLu6KV8po9Kjc+O0JaEpY11JXY8yVUb51JOui+DBa9pA6ea/HCI4hEi9P0NryRsTdyg2JAPaCv3Ec/CmrpvcXjW6Lc42Av65E4bgIJiwqA1Q3cVt3100wpH4JFgFTtZeG7yAGzUi6qgddixdSFjrgoaTTcTl/z67auS4mZWxuMc8Lut+gVzXxAydV1dxg1yR0OsM/Hkx8P7Ub4xR5Y07thcArszQ0cnLDFXFbuvGAHhLyNRqsRAnYTKEchp8G5v8Go91Qhi8gYdJpnnoTcNWVuxkyJV6s4gjztsnJ3U7Ppr+ltF/yw0/OnCUQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAOuE8JnIU1IEOg2g710ClzWETBnpl9kqckl2ya/OZs=;
 b=j9m+tKdeFR9nNo3NoVRYWgD6OREHgBsEppQ6Gkg/saPONoFlDslF2f/Mc/wTksZx+fE4jEJ8g32FWiX6ANcOheUB87thyRQw54Qg5spPXZhwcsJiOzmX2SwdculvOxfncfrYtMUdFx+751TVxcNM9p5/k2UkPJJcNG6vX7uZRtM=
Received: from BL1P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::28)
 by SA6PR19MB8632.namprd19.prod.outlook.com (2603:10b6:806:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 12:14:46 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::5b) by BL1P222CA0023.outlook.office365.com
 (2603:10b6:208:2c7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 12:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 12:14:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A40A0406541;
	Thu, 12 Jun 2025 12:14:43 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B1DC782024A;
	Thu, 12 Jun 2025 12:14:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: cs35l56: Use SoundWire address as alternate firmware suffix on L56 B0
Date: Thu, 12 Jun 2025 13:14:27 +0100
Message-ID: <20250612121428.1667-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612121428.1667-1-rf@opensource.cirrus.com>
References: <20250612121428.1667-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|SA6PR19MB8632:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1ed79f7c-2aa3-4804-7108-08dda9aab7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|34020700016|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gdXLdVSfseeAe5520TiwD/kVCEfss06coyf2QxtVFJRy9pndLnwkdlbWfG9K?=
 =?us-ascii?Q?6AwSBULe/QNTQP8CMjtnud8ZTz27aUy7gELtfql/qQR4gGZSrRx1wOFcHbcp?=
 =?us-ascii?Q?LlJt59+SyEsoiGX3KvyMGLWc+4eBlBrCjIugoaKBRcBeok2beMjof0szbdlx?=
 =?us-ascii?Q?nslt7+Mfb3jnEhytOHT5sMhPPJdYYkQpznmja0fZczROJFqAQKH1ly45aNz3?=
 =?us-ascii?Q?ZkhSsUUeGEGZFEeqXraE8QvM0mvCT78YLswRULHeLf65CCraK7E4ptX5CrFk?=
 =?us-ascii?Q?FWlRR4PTgY/hCNhEUyqFVGyEhnCH8bT7qYYk2jhyfxGpjNB/QJh6b9Q9JUsn?=
 =?us-ascii?Q?euJjKROW71mj8rdqKj66iIVWXH8BcnRNZ/4XzbpkxbJLXMdEizsoj/YGwy/V?=
 =?us-ascii?Q?7eQVZeqjAnMEkCjhH0Ttsz3Z2ruK5w1jbX943NR4BYO4qfeydMZzp1wBqQVT?=
 =?us-ascii?Q?eReFapvqcbZtLDpTwvoMY+x5UflibQnZ8LLVILgN3QMZJKzLL+UOqTzhh3Ab?=
 =?us-ascii?Q?UybKiT7fgZPISqcw1wdp9Hv6iihMAAteIYbKesYP1XAp+DcjA9kcC9KO1JQb?=
 =?us-ascii?Q?Rgn7srSfNc8SrbSVGtGEpHjQSB/V/ETxeHka68NZowHQHDA0oWwZ/8MlopqR?=
 =?us-ascii?Q?0LzZudQmhtJngPocQvkruChgGInXaMxW6EB3XVP3ewYhcLoFbMF3/986r6uz?=
 =?us-ascii?Q?oXS9U96WVB3TTPy50xSPtQYvSzdTRZf5C+Z2wd+vChn0VhFMcpRWOkm42PPk?=
 =?us-ascii?Q?M9bWYNhoXuunGqTQ063ELKWb9VBKrorIlSeBCaNw4Q/mDuxOqytjrenxpePn?=
 =?us-ascii?Q?gALnktph+7S+Ae43r9PRHRob5p11DrB1Cm9Hgj/ghyLdk2xsCm6UiA98lQwd?=
 =?us-ascii?Q?Ht+nh9HspKBQ1ywH+SvpUhxaEFy+B2mxqSvlIV0NZl4i9N0f+WsIdQvU5ACQ?=
 =?us-ascii?Q?DLyOI7mnu8MFHBvEJ+ki4n+1pQXDtRSo70p6nPCO/xiefkq47VBC3PRWN343?=
 =?us-ascii?Q?98dizVZuJQCpYwfvU67tJTQ8s6r4BF9wlNQKEyVAeCPN/q0mbJ2fZ1X/VtYc?=
 =?us-ascii?Q?ioCW/0azMx31/bBGNaArzzTRBxgomMqk8zI9TbAsm+CP6AOJSW5cdPsuUEv2?=
 =?us-ascii?Q?MDFAHOClOszCjLKxZf16+VTQ0HDTXwDBRAZiZpLhvhc79OriI275RlFeFWdJ?=
 =?us-ascii?Q?6o18WIVlb+wZuRWDzRMPr4ZwSbgKlPtUnWWA1qMLAEByMKtxxnEkolniPr4p?=
 =?us-ascii?Q?V0IJFFttoM6JC7dMv9rLC9NHwXyCmwG6P8T0PJEFv7yve3L+tHb4HPqb0OMM?=
 =?us-ascii?Q?QE4usRxmpvjDTBjqsQIOO44cUoUvus9QQf/vEWmQVpHse/yjCLQTwTMaQAf+?=
 =?us-ascii?Q?oPOJk8xFDk7L4cN6gJFnV20DN9ZvCO1XFy3PakP36gk9Gt3jciDj56Ct+zHA?=
 =?us-ascii?Q?Btx71egODmC/3LKJNiVrE7oiwqX3TXDUqK1YuwK0G6c5UufKjeaPAMy+KJVU?=
 =?us-ascii?Q?YDCqNi9a5HdpJRiMrjrLyVpTP+Z0Rpq+6LRD?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:14:44.8935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed79f7c-2aa3-4804-7108-08dda9aab7e1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8632
X-Proofpoint-GUID: Na_0o-o0G0i_PZvyF4cMf7BDlC6JTgAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5NCBTYWx0ZWRfX9TD8YCiLg03/ Q2GW7CHQQIcnrYcv+mXdndxEEWDIcoGJ21O6p6mFetnulxMKaF70cOh+pqR8h620/T/9L2y1BtL WDjHacWc4kKo7PRlJk0kF5R/8jukbm4vDaIzFRQytt8cw2dd+4NnSrQC9sdHmIbxil5l/rXLTzk
 x9c4pbB4JPLreJlsSFxogE3ta1xfjtnkfWLera3rhAqSYAz/LlOQQT8UR2DKFKqPNFyTiKLQCJm SABSmYIDC9xMRBExuVGIbpizhar5PcXYpD7BrLJQWxcBLMCBJ2HstfT92CosOVPleDuaXV2E2kM qUXvnYcV4b+Hud4O0/C+WaDlECAfcCTRNtnVAYLW75pfdnWbMmUJDvQkTbopCQTudg7oX1vL7eL
 mHnIcMSW5aWidpYNPxKK5PB+83RJg950iCP7zXI8jFjmha9oGoDj/qWrsWJKitmwdmWuzt7h
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684ac4c2 cx=c_pps a=0JauUCTfv4ZtrXH65XOUZw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=naRZMb3kKIbd9dW_DT0A:9
X-Proofpoint-ORIG-GUID: Na_0o-o0G0i_PZvyF4cMf7BDlC6JTgAP
X-Proofpoint-Spam-Reason: safe

Use the SoundWire link number and device unique ID as the firmware file
qualifier suffix on CS35L56 B0 if .bin files are not found with the older
suffix. Some changes in wm_adsp needed to support this have been included
in this patch because they are trivial.

The allows future products with CS35L56 B0 silicon to use the same firmware
file naming as CS35L57 and cs35L63, while retaining backward compatibility
for firmware that has already been published with the old naming scheme.

The old suffix is searched first, partly because there are already many
files using that naming scheme, but also because they are a smaller subset
of all the possible fallback name options offered by wm_adsp so we know
that it will either find the qualified files or fail. All the firmware
files already published have the wmfw qualified with only the ACPI SSID and
the bin files qualified with both SSID and the suffix.

Originally, the firmware file names indicated which amplifier instance they
were for by appending the ALSA prefix string. This is the standard ASoC way
of distinguishing different instances of the same device. However, on
SoundWire systems the SoundWire physical unique address is available as a
unique identifier for each amp, and this address is hardwired by the
address pin on the amp.

The firmware files are specific for each physical amp so they must be
applied to that amp. Using the ALSA prefix for the filename qualifier means
that to name a firmware file it must be determined what prefix string the
machine driver will assign to each device and then use that to name the
firmware file correctly. This is straightforward in traditional ASoC
systems where the machine driver is specific to a particular piece of
hardware. But on SoundWire the machine driver is generic and can handle a
very wide range of hardware. It is more difficult to determine exactly what
the prefix will be on any particular production device, and more prone to
mistakes. Also, when the machine driver switches to generating this
automatically from SDCA properties in ACPI, there is an additional layer of
complexity in determining the mapping. This uncertainty is unnecessary
because the firmware is built for a specific amp. with known address, so we
can use that directly instead of introducing a redundant intermediate
alias. This ensures the firmware is applied to the amp it was intended for.

There are already many published firmware for CS35L56 B0 silicon so this
first looks for the original name suffix, to keep backward compatibility.
If this doesn't find .bin files it will switch to using the new name suffix
so that future products using CS35L56 B0 can start to use the new suffix.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 59 +++++++++++++++++++++++++++-----------
 sound/soc/codecs/cs35l56.h |  1 +
 sound/soc/codecs/wm_adsp.c |  6 ++++
 sound/soc/codecs/wm_adsp.h |  1 +
 4 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 6e6120c39965..1b42586794ad 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -706,16 +706,40 @@ static int cs35l56_write_cal(struct cs35l56_private *cs35l56)
 	return ret;
 }
 
+static int cs35l56_dsp_download_and_power_up(struct cs35l56_private *cs35l56,
+					     bool load_firmware)
+{
+	int ret;
+
+	/*
+	 * Abort the first load if it didn't find the suffixed bins and
+	 * we have an alternate fallback suffix.
+	 */
+	cs35l56->dsp.bin_mandatory = (load_firmware && cs35l56->fallback_fw_suffix);
+
+	ret = wm_adsp_power_up(&cs35l56->dsp, load_firmware);
+	if ((ret == -ENOENT) && cs35l56->dsp.bin_mandatory) {
+		cs35l56->dsp.fwf_suffix = cs35l56->fallback_fw_suffix;
+		cs35l56->fallback_fw_suffix = NULL;
+		cs35l56->dsp.bin_mandatory = false;
+		ret = wm_adsp_power_up(&cs35l56->dsp, load_firmware);
+	}
+
+	if (ret) {
+		dev_dbg(cs35l56->base.dev, "wm_adsp_power_up ret %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void cs35l56_reinit_patch(struct cs35l56_private *cs35l56)
 {
 	int ret;
 
-	/* Use wm_adsp to load and apply the firmware patch and coefficient files */
-	ret = wm_adsp_power_up(&cs35l56->dsp, true);
-	if (ret) {
-		dev_dbg(cs35l56->base.dev, "%s: wm_adsp_power_up ret %d\n", __func__, ret);
+	ret = cs35l56_dsp_download_and_power_up(cs35l56, true);
+	if (ret)
 		return;
-	}
 
 	cs35l56_write_cal(cs35l56);
 
@@ -750,11 +774,9 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	 * but only if firmware is missing. If firmware is already patched just
 	 * power-up wm_adsp without downloading firmware.
 	 */
-	ret = wm_adsp_power_up(&cs35l56->dsp, !!firmware_missing);
-	if (ret) {
-		dev_dbg(cs35l56->base.dev, "%s: wm_adsp_power_up ret %d\n", __func__, ret);
+	ret = cs35l56_dsp_download_and_power_up(cs35l56, firmware_missing);
+	if (ret)
 		goto err;
-	}
 
 	mutex_lock(&cs35l56->base.irq_lock);
 
@@ -861,13 +883,6 @@ static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 	if (!cs35l56->sdw_peripheral)
 		return 0;
 
-	/*
-	 * There are published firmware files for L56 B0 silicon using
-	 * the default wm_adsp name suffixing so don't change those.
-	 */
-	if ((cs35l56->base.type == 0x56) && (cs35l56->base.rev == 0xb0))
-		return 0;
-
 	cs35l56->dsp.fwf_suffix = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL,
 						 "l%uu%u",
 						 cs35l56->sdw_link_num,
@@ -875,6 +890,16 @@ static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 	if (!cs35l56->dsp.fwf_suffix)
 		return -ENOMEM;
 
+	/*
+	 * There are published firmware files for L56 B0 silicon using
+	 * the ALSA prefix as the filename suffix. Default to trying these
+	 * first, with the new name as an alternate.
+	 */
+	if ((cs35l56->base.type == 0x56) && (cs35l56->base.rev == 0xb0)) {
+		cs35l56->fallback_fw_suffix = cs35l56->dsp.fwf_suffix;
+		cs35l56->dsp.fwf_suffix = cs35l56->component->name_prefix;
+	}
+
 	return 0;
 }
 
@@ -916,11 +941,11 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 	if (!cs35l56->dsp.part)
 		return -ENOMEM;
 
+	cs35l56->component = component;
 	ret = cs35l56_set_fw_suffix(cs35l56);
 	if (ret)
 		return ret;
 
-	cs35l56->component = component;
 	wm_adsp2_component_probe(&cs35l56->dsp, component);
 
 	debugfs_create_bool("init_done", 0444, debugfs_root, &cs35l56->base.init_done);
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index a84c83eb2d7c..bd77a57249d7 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -38,6 +38,7 @@ struct cs35l56_private {
 	struct snd_soc_component *component;
 	struct regulator_bulk_data supplies[CS35L56_NUM_BULK_SUPPLIES];
 	struct sdw_slave *sdw_peripheral;
+	const char *fallback_fw_suffix;
 	struct work_struct sdw_irq_work;
 	bool sdw_irq_no_unmask;
 	bool soft_resetting;
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 13db9c6650d5..8a1d5cc75d6c 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1000,11 +1000,17 @@ int wm_adsp_power_up(struct wm_adsp *dsp, bool load_firmware)
 			return ret;
 	}
 
+	if (dsp->bin_mandatory && !coeff_firmware) {
+		ret = -ENOENT;
+		goto err;
+	}
+
 	ret = cs_dsp_power_up(&dsp->cs_dsp,
 			      wmfw_firmware, wmfw_filename,
 			      coeff_firmware, coeff_filename,
 			      wm_adsp_fw_text[dsp->fw]);
 
+err:
 	wm_adsp_release_firmware_files(dsp,
 				       wmfw_firmware, wmfw_filename,
 				       coeff_firmware, coeff_filename);
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 075ea0bd06eb..25210d404bf1 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -36,6 +36,7 @@ struct wm_adsp {
 
 	int fw;
 	bool wmfw_optional;
+	bool bin_mandatory;
 
 	struct work_struct boot_work;
 	int (*control_add)(struct wm_adsp *dsp, struct cs_dsp_coeff_ctl *cs_ctl);
-- 
2.43.0

