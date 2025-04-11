Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96049267F64;
	Fri, 11 Apr 2025 07:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357814; cv=fail; b=nySb7ML6qV4b3CS7NIuEKbCbvKStv6ihsnvjmFxOENQ7eKcBH606WSxjP51e1BQcs6swpX1RN3xIRH2BVWtjYlrJe3SPavoZh8bnwlXTsO7Ff6f1AVy+Twb4JVnS5MKWDXMVG0CabMfFNpePIiQVHQAoA79glF5BHQe+7UHovvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357814; c=relaxed/simple;
	bh=ovKvTjpSgbxu8JiYqkNV6e/qdF7/G3EZ9eW2JH2LsWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=oaZ1KrxzqbSyw6FtEiAnLWOl3VIkFY847abVd2F+n/QOyvXaX71jqrmAZQE6dn/gEe32ItnFhzZAE01egi9/syyzOha8dZmo431tpwa6faMnwYOT7JTOlvNTnfZy3Dc6UAonIXqjCKs6csykmgoL0ol4YP/Fg/cOgVNFMwRc5SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=hHksJi1C; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="hHksJi1C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0zDvPonwukRm8PMjJFZGB91MWjrhTuTaiXXADM+AoZ5ftaTEuVdcSaECcgqehSx2xjRzDFQbo6vUzbn26KiLWFLrHUhlkp7EGmSDnKPfvsIUUQdyLSQard2qrsDMYUuU2zcTfxBjFvaqImIO/nROxQkMMlHWF9tGTmhVi9FcfZNCNvlMKgjDTVucvF94WotHXI29e9e6vkO3xuujZzE3d/EOluA1fAGDvAv0bbB6vqEwPTMidfu64jO1Pejox5uGbPywgVhVppCwd34x9ikipItX3sTeDdZcr5g5EtsjO6yoAPlhol0UTYu7LX4+4jCc1AZnCBrdgSoPbDJ9/XO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isT9Ckh1Y6CvVrPuHXh1defzICKklDdtSd90FOT6rvQ=;
 b=nCxViBhD7OZYXfDuE7x0oX+hG0ahv179xzTLdXFQVJnskM9FHF3IPUKGHkxrFNAEWC1QpR2jdURJY61WD8cnu4FcOt+MSHw7RRTOXUUNLpN622jX++ufC8iit/ggQ5u4wfa3QakDm8kyEgf9+E7k5qEf4mBudOxXkDiituNXQN3TgHr7UBSqKTy53qW0AD4s0wHs7QfRCz4BncNaeA7wS/BpqX8QxzMiHxYC6lddStfM5NYUiOA+mhPOzEH8mhEThukwbN18SGbUaHrkb4L1Sy4Pey9r5+TSwIS67H2REMbH3xborW6HJaei94P55M3SwKFxWKkB+S4szHgwIKrQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=analog.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isT9Ckh1Y6CvVrPuHXh1defzICKklDdtSd90FOT6rvQ=;
 b=hHksJi1CKeTI7riG9yrZpJy+mzcgRwTpUYvByFG95CKEZL7B37h8foSx3czGwlWUcGiQM1JFzMF044JH/Ym5yLfXSQdfkyKAYEsOJDaYRCIUXRhjkIQ4SLa0NvKLfKr/gJEWuGyBBLY+Uws0qEw8xSWaGqzFKWPdqTF9SDm3mIs=
Received: from AS4P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::7)
 by DU5PR02MB10608.eurprd02.prod.outlook.com (2603:10a6:10:521::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 07:50:03 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::ca) by AS4P190CA0036.outlook.office365.com
 (2603:10a6:20b:5d1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 07:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 07:50:02 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 11 Apr
 2025 09:50:01 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 11 Apr
 2025 09:50:01 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 11 Apr 2025 09:50:01 +0200
Received: from pc51840-2244.se.axis.com (pc51840-2244.se.axis.com [10.92.173.9])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id A1FF91BE;
	Fri, 11 Apr 2025 09:50:01 +0200 (CEST)
Received: by pc51840-2244.se.axis.com (Postfix, from userid 17330)
	id 9D87E4143374; Fri, 11 Apr 2025 09:50:01 +0200 (CEST)
From: Michael Sikora <michael.sikora@axis.com>
Date: Fri, 11 Apr 2025 09:49:29 +0200
Subject: [PATCH] ASoC: adau7118: Allow dsp_a mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250411-adau7118-dsp-a-v1-1-be3fb487a6ac@axis.com>
X-B4-Tracking: v=1; b=H4sIAIjJ+GcC/x3MQQqAIBBA0avIrBvIiUq6SrQwHWs2JUoRhHdPW
 r7F/y9kTsIZJvVC4luynEeFbhS43R4bo/hqoJb6tqMerbfXqLVBnyNaZBpY++BoNQFqFBMHef7
 hvJTyAdo/KJZgAAAA
X-Change-ID: 20250325-adau7118-dsp-a-e26e1dfc2b8f
To: Lars-Peter Clausen <lars@metafoo.de>, =?utf-8?q?Nuno_S=C3=A1?=
	<nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Michael Sikora <michael.sikora@axis.com>
X-Mailer: b4 0.15-dev-c25d1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9F:EE_|DU5PR02MB10608:EE_
X-MS-Office365-Filtering-Correlation-Id: e61f0847-7812-447f-72b1-08dd78cd7791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUNaVjUzTnc2eER2M1NHeXhENmo0VVkvamdraHVlRlVaaFJGRjJ2bDZndEE2?=
 =?utf-8?B?NHJmV3FHU0QxenViNGxNSWwreDFJU1JEUjBTczViL0lzU1lFOWxpY0N0TldF?=
 =?utf-8?B?c1o5TG10ZXNYTFBmYk15T0pHRGxKTTRQRzFkNTdqUWpZVTd2SjJSVDUxMU4x?=
 =?utf-8?B?NWFCQ1FEN1F5T2FSaVNKOVEwdUtoRW9OWERBWnBkVFFEYnQvVnQ3SmpRRG9p?=
 =?utf-8?B?VGgrT21leDJJVE56QXVrV0h6RmpzNlBqa01iZzZmRGZSc0lYUjNLaTZFbFRX?=
 =?utf-8?B?c2JPTWZBR0YvN0RDZmU0ZDdpVk5qdlNoTDUwY0pjSklxUVc1RFU2Q1dBWWQr?=
 =?utf-8?B?ZkN4Y2N1bG1LcHBuajkwVTZ3UXZvcjdyOEZ1c1RqU2FFVmpHT1N2NmNyTGhX?=
 =?utf-8?B?MWJHTWZsNjZLRUlNWmxDcFJEa0NPejBGVzVOZENhNWhTaCtQNm1DVEk0cWE1?=
 =?utf-8?B?UEo1TWcvQ2w4eXJkalpOclQ4cFJEZTNDNGR4cVpnVFpEZnppWERST1JQTlli?=
 =?utf-8?B?bWd0aTJ4N0N5MzdmUmlNTWxTNFVVL3FUSUFQeHNydDhSYVMxekZadjZncmtE?=
 =?utf-8?B?MW5vQW9MOG1hWC9EZFFNQ0paZCtHTjFFUWJWb29VdlVib0pSamdqcVF1UStx?=
 =?utf-8?B?dkorWG5ibVNxM0dSNWNjSXdTTXpSVnVUQ2lWd083RHlkd21kZnY3L05ZcW5k?=
 =?utf-8?B?UHVnOUdFR2ozM2p3dWJzNUQ4cTk4REJzdUxaOHV0bmVZb3BVSGVtaFVQMEJR?=
 =?utf-8?B?YndKVFgxR2l4eUdQcTd3bmFJbWtackVpMUdONW1iTkdZcThrOVUxNlFyVG93?=
 =?utf-8?B?eTM5UEVMb0xYcUphNmhjS01YUkdnaDE3Y2FxVXgwZU11em9BMngrVGF5UEY0?=
 =?utf-8?B?b1RIQ0QrdHRDdGZ4b0tmazZyc09WVmREMVUycEprM2FhaytRQVI4RktmSHNm?=
 =?utf-8?B?RmlFTWQyQVkyY2Rrc2pES0w1QVdQRGpGRHJHalFaTmszL3JrQllkRFBValJh?=
 =?utf-8?B?dGxnY0xMTkViWFBuOVBDN2M3RWI2Wk0zM1lCQzZlemJRQjVVbkVMckx5bXpM?=
 =?utf-8?B?WXBNUDEwRHBEbERqSU1qNDZZNjRpNThhUXEwZkxTd3J4b1lWZWZSWlluRnNB?=
 =?utf-8?B?aUlZeWtCVzZaUTNnajh5U3VTcFVSRWpxVXZFSWU3Y3dpdXp5T0E4dmxuam1K?=
 =?utf-8?B?eUlDeUEzaXBuR25FenNtZGYydHlSMEhSYWhpUUxqU0NIdXV4SUJydndNb3BF?=
 =?utf-8?B?NDQzSGhucGswbFRNWE1xWEZvVy9LVmxtNXNJMjd1dEVlTldXZnROZVhJeXRq?=
 =?utf-8?B?ZTR5MkN4RVhNcm15OUJML3MzWE1xd3BsdnA0MG9jcGgvYzl4VEQ0d1NnQ2Jr?=
 =?utf-8?B?d2VTNVRvTFdRUE95QXN3dGhjd0VJcGZPaEtkSW9oY3d2UEpNekk3RFhuY3lu?=
 =?utf-8?B?T1FYaU9rTnRMNllUc3BoT0ZjcFdTV2R4NldsK3FRUm5oUXFWOXFrYStMdGkx?=
 =?utf-8?B?NXg5UXMyUUVuamVSWEYwUEtKRHUyZWdDSWdYL2s0Sy9jMlNzdEx0anZJR1hx?=
 =?utf-8?B?ZFVXYUlwR2Y5a0laL3hrMWpoeDhrSzRPYmlRVGVsUy9kb3dvY00xNDFVM2Za?=
 =?utf-8?B?UisxVVVRQVBTc3RXODlZRjdZV0YzTTNXT3NBNlQ0LzB1dFpoczJXK0tJQnpv?=
 =?utf-8?B?OWZGZmF6cEg0blBYZnlNTk43S05MaUZLL3ZuTjQwcUoxdDdnci9ZZTk3TGZR?=
 =?utf-8?B?Q0dpK2dqS05mQ0VsYWxvYzR1dkYrcDAwRWNpU2VFVlJER3h6Z05LVlRma3pK?=
 =?utf-8?B?OTRzYmRFNFBSQzQ4WjJYZkFHdG10aTVOcUJ1dWpaVjJySGh2VEhKY2srRmJl?=
 =?utf-8?B?TnU1UjliMlZabmVSa2ZIelpSUlZsN09zYndjZ2IwZTY0ZmZKOTVsa25kRWV0?=
 =?utf-8?B?VDExWE9WekZaaXdwdHBwbU1Jd3IxN3pGMWJ0WUFQMHdJVmV3blY2RnVjdm9X?=
 =?utf-8?B?cFRNRkhwNUdiY1llUHlKaXFaN2ZTZHJZbVUyMVYrRFVnbWM2Mmk5VTJRUS82?=
 =?utf-8?Q?uKliB3?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:50:02.5815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e61f0847-7812-447f-72b1-08dd78cd7791
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10608

TDM mode on the adau7118 is dsp_a compatible. Set SPT_SAI_MODE on the
SPT_CTRL1 register to 1 for TDM mode when the DAI is operating in
dsp_a mode.

Signed-off-by: Michael Sikora <michael.sikora@axis.com>
---
 sound/soc/codecs/adau7118.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index abc4764697a5..14259807c872 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -169,6 +169,12 @@ static int adau7118_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_RIGHT_J:
 		st->right_j = true;
 		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		ret = snd_soc_component_update_bits(dai->component,
+						    ADAU7118_REG_SPT_CTRL1,
+						    ADAU7118_DATA_FMT_MASK,
+						    ADAU7118_DATA_FMT(1));
+		break;
 	default:
 		dev_err(st->dev, "Invalid format %d",
 			fmt & SND_SOC_DAIFMT_FORMAT_MASK);

---
base-commit: 5751a1448babcf892161b4496d6b3da11a0862ec
change-id: 20250325-adau7118-dsp-a-e26e1dfc2b8f

Best regards,
-- 
Michael Sikora <michael.sikora@axis.com>

