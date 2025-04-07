Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0721FCFC0;
	Mon,  7 Apr 2025 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039150; cv=fail; b=SEkkk5/R7ARQjQpfdRw1oPudhwu4SYtl3kAPI9Y8ifp7621tbPi+KgkABPCxNr52aZqZ5ssswSB8lfzToEVx+kaBLUL9HaWWLCYGTD8d6RT8UyoMLPGn6Hj0zKhpUEu1P87OWNrYYkLPW8DvrDemwFwhB5f7C3r3w2uTUVk9hx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039150; c=relaxed/simple;
	bh=MBSUL0QHEUBz8pscL4bN3nUSBaRsiIYTI3gKHtwH1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hphc5Q7GioBCo9Ciex4lQvG+1Ii/q45mVSvBFnNgeUTU2D5qpOs4JnkjoqJG4bGdoOFpqvPEyVD66oWGhMGCZN1f//o65xzEDn2eMNvlGNabtiWfI+/SQl9RWkmoNu/93L9T6nktDF+kIvkOQkiygXpoCKYINkrnYqssrzOZjoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TenLQrUu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wayhLHj4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TenLQrUu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wayhLHj4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5375LUUF020585;
	Mon, 7 Apr 2025 10:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=DhrWl3hfNsXnluYU
	bQABMXC2K2DFiNDkpVRL6tP1Oiw=; b=TenLQrUuZok8QcPjN2+NV4hSVJz+kF14
	BXab5mjW40gdoXyp92HHKR6XW8gibPodtmudVV5xTCaF6yLg/tZAMw6lz2wKU0cZ
	Q+CzanRgFuZHrm+QzUY5KT/0oGR6KG0bAGOjvKGokVRbrWmTjFsCWVBwwyVyLlMh
	85cYoHlgS4iKqWJPjql9h2zFbZs4kQ99Vxkhs7FA51S93v5Q5HAc5Zw8Q1ggkw5m
	JyX03jX8i7U6v9alYbAo04DEcSSZHuv0OrV0E6++AzBuxCXB+MvvJ30En7CsUHes
	fuagJmRv09UQNVkpt5X44x/4kuij3VlxETda+CWi31o/ZcpIZcDHwA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45u0xgje9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:19:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yavF9G29UF4k4+oBzBUlpE2vuaR6ojiPgzVuDdj9+QyMJrcKXSDK9lg3UZQapiXm5L9lKFVwJVA/XR6zd6iGCwJuiJgeXAxe7+EyNwLJLtXsI0dfhhkmfURN1+YE1DGxZQPW+1PWtME2Oiw2CbkG/G6z0jiKcFHMAZeuhhi9AbpAgaA7zLRW4WpRk8m5aOqNOscvXoEwPtwLs2Jq9R/j/UCADA715WMfumEJWW+AgIa3eJxKR3C+L6y3qeHBlxu0gqMEpn5u0+yooUAd/wb6+Lb8rMZSY1TqUBAyoxXNGqVH0tsukYngsyRbdtFWunoToSKHXLcKD06R/K0/WpGsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhrWl3hfNsXnluYUbQABMXC2K2DFiNDkpVRL6tP1Oiw=;
 b=FqNr/MaPdCdK7ATVb+8da1U+tQdFaO5ivcqfmYUBrE53qGot6/udnPiF0boQ+j3z8sdwWykFiYpqIicGezy3aCFJow1PB92ryo3u+UYgT5er3MfTqh1Ht+y1DK9SKCO9khVx3328CmrLhvC6LbuTH6UDJje0XsEW79ut+mdBE5gfhkFAo/GZlvwsuAt4xp1EUNPHUNBcd35zdQGkCdzhxEFisK2Rp6/5HdTYU4IiQ2vQ+HPsP4Xrc9f7IJ6UipBLNSEaBHDZkmxJ783ZhHsDC5VguHHRaQMTC/iSos8T05LvgViYhfbnWqGm0H82Jii2svwRuxwN0HNdT6igYRPnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhrWl3hfNsXnluYUbQABMXC2K2DFiNDkpVRL6tP1Oiw=;
 b=wayhLHj4mdhrrcrst8dJp9g9sKAWQIgHN5DSARxUxUzUK68VpVv8+mIZDvCd3/N/FGmU9H+Y9b9e5x9gRPdCH79lQkCep02GHXq8SpZK75nINr8zALjI+2WLhWDBMSOReC0+N5ARt5EIX+jdSR6U3TMY9MSmtaN2yzYnd6xGlzM=
Received: from CH0PR03CA0367.namprd03.prod.outlook.com (2603:10b6:610:119::24)
 by MW4PR19MB6676.namprd19.prod.outlook.com (2603:10b6:303:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 15:18:58 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::55) by CH0PR03CA0367.outlook.office365.com
 (2603:10b6:610:119::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 15:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 15:18:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26161406547;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D5CAC820244;
	Mon,  7 Apr 2025 15:18:53 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/5] Add support for CS35L63 Smart Amplifier
Date: Mon,  7 Apr 2025 16:16:39 +0100
Message-ID: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|MW4PR19MB6676:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86a62e01-fc31-4494-ced2-08dd75e78345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zo5z3mchzTboXCZFXkTSE4CdAzO3aOw6gsPM2mkjL7pQuKspN/z/qUqllh9t?=
 =?us-ascii?Q?S1MHWtmViqdAI3BIlI/vFZdNTFdCd/S7JuDUajPIbqOEpnx4Q67LHPe/RDTU?=
 =?us-ascii?Q?BLvxspGy+m7DYlDAUueCVQSHhX4Cs/LcR7Yo/2FNoxQSLSBLVDRj+hGUfuX7?=
 =?us-ascii?Q?gJtyIY/ra/45CJznuwKOvg9jbyBZD+plRwM1BlAGhEDiI8XAT+aJaDL12k8j?=
 =?us-ascii?Q?kNnf2JMVvk3Wz2W5Jj2nrwm1qTbWgGUtqGYwTR7L+v4aaeqW1iETCohUS5G2?=
 =?us-ascii?Q?IE/gqiave/9h7leoWYpagQzYd2bFy/I9Z2c+JB3dCcFjVyz1c6goEC4d9vit?=
 =?us-ascii?Q?+XvXywyefCBPr+qmOFna4tSUci9wLPNzOfTxYBS2h3Gv+a4BGqy38CcXAIWv?=
 =?us-ascii?Q?tyeUH/cnmK3qYEX7/bbSnCaIGI0HN/sgpzvYhJ4l6gQS/mj1/DIS6EuPDnNQ?=
 =?us-ascii?Q?RrFHz95pqqdEZ++SPQRwwr2AF/4bG4SI84FQ7kNq7zDKbju0Q3YMAT0yIOgv?=
 =?us-ascii?Q?HIDS7D8eXtV5/U3j1oakkXIK+uhPFKOSrHDuvSAuvNcmivLmkDpP73jvvF0z?=
 =?us-ascii?Q?eAovsNypONmm5m+Je5Nqz8GxA8zGqyG5Bycoka8BP71CLEN9J6SktGsQKqdV?=
 =?us-ascii?Q?xXQwck4XnfAL7nGwZ48RpoLdbLtLUYN7OobyQXCKl/N05DlGIbcETj3SwowA?=
 =?us-ascii?Q?0WzALX6cFilv9YRHLtpOoUxUpP0ryD+d3mp0pv+E9+cFAChVnhww3am9Mn3r?=
 =?us-ascii?Q?YjVI6YWnW3fz9WcX4+7pBeGlsa0f0yA1uYB0jShJkd+im+vc8mWgkO7H1AaL?=
 =?us-ascii?Q?LI+JXCl4OamS1L59IZt0VYjukdZVLbNGggerZwS+5RurhSTODvrpk3E6qV7A?=
 =?us-ascii?Q?YmDV1jNkUb+mXnL2TcJIKUU4+0cKL9gcV/iUI2prniQLPHvPEOQUEwbCFUs1?=
 =?us-ascii?Q?7w727qZmJK9ZjUYrjZjK1VR9I9DbhY5P7blhwDuF2q/ICnQSH7fvhqT46ICS?=
 =?us-ascii?Q?83IYQtO/PKBmrZJHfkr0EpPPIH+G9isjE6naxmCfi5/HsLfGwNf6qup8zaTU?=
 =?us-ascii?Q?O9jr4I5iOs6T0fQgnMbyASPWfGsNRf9Hed6tMgFr3HFcOGjhoAT7j9ajNW5c?=
 =?us-ascii?Q?xkrf7ishPamsD/jOxnod1x6k1hEpbhkpR+P4NWAIuqVMiCWcEAAljj2TKtBF?=
 =?us-ascii?Q?0IGIoGqIz3PRVvaB/M6ulWWQUjjEGOhJXYorMu67LHXQ95xydghBIRSrWN/v?=
 =?us-ascii?Q?Sl8CcG8X4e/TUkpbIXEOzrLHyFWCmOaX/B1gYqvs52CSy7RytDRjOG3OVlbj?=
 =?us-ascii?Q?kmAj9HR4l8MIGJR2nuZyvKKDF3q20UtaEOtQ47QW9/roSw91WFscesE6wwzP?=
 =?us-ascii?Q?ISgsbAvGGC3EU5/oern2KVXp5IFJK83/BaPY99++a1kTUC9WmncZluiY2bos?=
 =?us-ascii?Q?0Haaqao3SIpR60n4A8EV4kfC1r48wppgmd5oH7/HGpZouTJpaac0r6H8cmMC?=
 =?us-ascii?Q?hsOH/CMK8ih9Vq9FQUNwgl572/Y2zGCmGEYA?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:18:55.4263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a62e01-fc31-4494-ced2-08dd75e78345
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6676
X-Proofpoint-GUID: CPGC3qx2SD46swIzG6a6SrQvnGxjkQ9j
X-Authority-Analysis: v=2.4 cv=bOIWIO+Z c=1 sm=1 tr=0 ts=67f3ece9 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=8K0RRMVSZC15TKf-PyUA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: CPGC3qx2SD46swIzG6a6SrQvnGxjkQ9j
X-Proofpoint-Spam-Reason: safe

CS35L63 is a Mono Class-D PC Smart Amplifier, with Speaker Protection
and Audio Enhancement Algorithms.

CS35L63 uses a similar control interface to CS35L56 so support for
it can be added into the CS35L56 driver.
CS35L63 only has SoundWire and I2C control interfaces.

Stefan Binding (5):
  ASoC: cs35l56: Add Index based on ACPI HID or SDW ID to select regmap
    config
  ASoC: cs35l56: Add struct to index firmware registers
  ASoC: cs35l56: Add Mute, Volume and Posture registers to firmware
    register list
  ASoC: cs35l56: Add initial support for CS35L63 for I2C and SoundWire
  ASoC: cs35l56: Read Silicon ID from DIE_STS registers for CS35L63

 include/sound/cs35l56.h           |  28 ++++
 sound/pci/hda/cs35l56_hda.c       |  22 ++-
 sound/pci/hda/cs35l56_hda_i2c.c   |   3 +
 sound/pci/hda/cs35l56_hda_spi.c   |   3 +
 sound/soc/codecs/cs35l56-i2c.c    |  23 ++-
 sound/soc/codecs/cs35l56-sdw.c    |  91 +++++++++++-
 sound/soc/codecs/cs35l56-shared.c | 229 ++++++++++++++++++++++++++++--
 sound/soc/codecs/cs35l56-spi.c    |   3 +
 sound/soc/codecs/cs35l56.c        |  47 +++++-
 sound/soc/codecs/cs35l56.h        |   1 +
 10 files changed, 413 insertions(+), 37 deletions(-)

-- 
2.43.0

