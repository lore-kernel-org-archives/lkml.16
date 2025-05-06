Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC9272E70;
	Tue,  6 May 2025 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525574; cv=fail; b=dnQ4exg/fS4NxEPwOeEZX7SXnMW1jtccvaUk9hHR/K44WO3/6nvsjVma9jwrdOJjKz/eXq7A7irqcBv2KDs4B9+QFBJDje/NYduGp8koQDdVDixToocJVmfCe1qTeDTVufgii3ZOUXEpkeEWOf4V46yi4ist2Ljqr66gWcth0lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525574; c=relaxed/simple;
	bh=MBSUL0QHEUBz8pscL4bN3nUSBaRsiIYTI3gKHtwH1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TqUfLUt574ZBpb9pljOKGMBJeQ3qLe1DkYN7iGGwJEt9dEAJy3v7VaNYL8Fju08y1knIkgRLYF4j6xEz2Ez2ghkIIAFcwYdbuKt6SztMKRLaH9/wCb2/2A2R5PI3m6Bsuwoq2ov8EFevXmOiB0BXAYzfus0WzFAmdrvtV2BwPoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WuUjbFwR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iGQZqjEI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WuUjbFwR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iGQZqjEI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5460H3DD020665;
	Tue, 6 May 2025 04:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=DhrWl3hfNsXnluYU
	bQABMXC2K2DFiNDkpVRL6tP1Oiw=; b=WuUjbFwRb3V5yMdTDHMF8WjgiYfone/h
	upqcUEivMf16bnDXolCPW19QI29rtJBYaroG6OmW2mVuM1eAIZaSSLBHb4mFcq3L
	zeNLLbwzjrjEe4C4Yl67L2MaZ+XZJb8AuuebH6YZHMgnzFKWt1rbCurn3k5/TA+5
	n4hx0aP6Fi15y0loFKJJEpJ5+viTzLy+1X7y8xqMtHWnLmzFN0Ki/kb2VIILX2ga
	H8pBhtMIbIGvbsbGfj3bgx+QIFXY4G44qMfJYQMe1BeWcyNo2FszyNRSI0ANSvRr
	YtJvr/uAddr/XeGKvwlrU7nvke9zg3UzN0/XS9b5mjRy+Vp2eODURA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46eytu950p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:59:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYkb4vIjeY8sTyB7N2TfNd+QgkdWZCEc1m4/P5sDaSHjJw6t7n/e4Vq6mn4YV2qOSXtNbWfMP8oaVaclewyOpOAy+BM7Ky0DrYY1N8jxpt6gcGdZqcPKeKS1JitibjqdGDxgsx0o43L9IkClGOxUKAaE4osQLGe5SxTmYIFWLD3dxw+L1ZWOZar3dBt8Rvu79CpJE9fjrbSzbyyya3cpDblaPV2uvCB1EDZzW/N+jQNds31s+erF+M6ncJxjfbpgM2ndR+a2I4RK7u+e7vUsEXcff4DcA6k6wuk8Cps2nsdNnLKyHcTDzieX44QhMg8pKONgM08R6LTK5bzAIVveFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhrWl3hfNsXnluYUbQABMXC2K2DFiNDkpVRL6tP1Oiw=;
 b=BhwDFkmiGb2TItgzr1N0wCZV6ywd+jbDFK4IXusXKC8OiNcghPR7XFAyl0EMZZRCoYTK49oNoyCNchDV4eXYL5RbuTA6GmGH/h9ZZsnJsfRzkb+ThtnGt2bPFnB4nVZ1b42P8ndpD3oIKXBa06wUC77MgjISZCP+6k7CKbWPRvk7dL00kSGQHiAryeBCN595Gh58yHENLbdLhpuTBptEUb4sFE8Pj5SuPsj46XKkXKujbwEUnQ4IZjSLMPJq76h0yPZAmPVkk2uS4sfJozP6K9kFyHb0w3WXbqcZDoTZbSaeZgAPZv03IjkleOdN9DW83nqH5gMkY2wGxx2ZcoyRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhrWl3hfNsXnluYUbQABMXC2K2DFiNDkpVRL6tP1Oiw=;
 b=iGQZqjEIBD6mg6BhFV43lCjBYAjB+pAeVLsprqhJ1EOCpJuRyRK9ssQ6T87osl8SowqwMRXDODoagvSIyno32cCjbtjcIFOlEvS+qd9KyUDjpat4esi9d/BboHjDCTystN9DFNIJxsb5YPCd8i/1XaP8m5f34J/d/2f936eyv+I=
Received: from SN1PR12CA0053.namprd12.prod.outlook.com (2603:10b6:802:20::24)
 by SA3PR19MB7491.namprd19.prod.outlook.com (2603:10b6:806:320::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 09:59:13 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com (2603:10b6:802:20::4)
 by SN1PR12CA0053.outlook.office365.com (2603:10b6:802:20::24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20
 via Frontend Transport; Tue, 6 May 2025 09:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 09:59:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DF6CF406545;
	Tue,  6 May 2025 09:59:11 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9ED55820270;
	Tue,  6 May 2025 09:59:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 0/5] Add support for CS35L63 Smart Amplifier
Date: Tue,  6 May 2025 10:58:45 +0100
Message-ID: <20250506095903.10827-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SA3PR19MB7491:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26b2dd73-3ec6-42ba-53ad-08dd8c84a7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?So5MdAS7C5xJxLMuHyBVuTKgS+Wg4si1wUvHYmlCUnFwwo67MYoQ0A7sPesX?=
 =?us-ascii?Q?47YaVf72F8TSPHDjKfsZLDz3SZM8KK4ZrYGSDMQC+ra3GXD+47kHRmGjEOvD?=
 =?us-ascii?Q?3qG3+bvRw39j/9JneQPHjnH+d6/vOtfldzjkJYpgdpxb1jsM27vQ2vXdc253?=
 =?us-ascii?Q?gQUo3/g4lu6bkvdaaD33MTCHdSLsd8BLi0ZcrHSJFB2c8Weit8cmyqFDg8/X?=
 =?us-ascii?Q?jpOG1leFMPixv63dYdwCrk8Fgr9ARFDUNlMz18+M/SSqjOQHlDoH7ez3xa3u?=
 =?us-ascii?Q?BruJBotngW2wo9OXMHN5q951AmJP82egLdy0SmQQrAfeBWYoMcra84uMx4Qf?=
 =?us-ascii?Q?JXVhptpeh50Wxmvp25Yq7pIXl3EbgcNuzCL4kcqsJHG1m7j6m6XSLupXQ1Bp?=
 =?us-ascii?Q?ZFyfW2rZMTSBVU0K/68NgLsTivr+WHE0OXAe8H8h+QJl1b+S+dY5t34z8bWI?=
 =?us-ascii?Q?nJpjeS/CuqCHcYdBmYCsO/wtPLGhBZya9lhrTi4QKKwKUSW+7sZkXOKOIXrh?=
 =?us-ascii?Q?tjcC931y2vKJg027KwqLe2On4CyC2jZ1QHYzhdagIe8pydho3tsUOxHNtdzM?=
 =?us-ascii?Q?WAT/a2qZ4l3P1jEGWpk0fsC1GqqbRL7b7WubOCIMJ7wOw7EFiV0dPpMLHyF6?=
 =?us-ascii?Q?xjnEvY3wVfLEh+jh3fNtrK+kSCTOYd4bizl16GS8dWxogTWX1vN0Hv9McevB?=
 =?us-ascii?Q?MCdNrZyH6jfDd7IkGBnBaDBe/Y+dcfkOQftQ9jQobJ9XuKHKkQXMye8M8BdF?=
 =?us-ascii?Q?iM86ZDQA5nq0J0ZyP4dkO9RxVwyctewF+Ix8B2hs9qAhu2K7aed9nLr7q2hp?=
 =?us-ascii?Q?4U3TlTY4kNufCLecW+XpPdFC5hZqXVomjMZVi5K284c3gjPSkX6c7aa5PuJN?=
 =?us-ascii?Q?DkWNKoJscASHaEbCbegHQaWk1raAShRHU3R7lt8PEH42NXoOLevYU+sMHuiK?=
 =?us-ascii?Q?00aXDoh44xPwt7tl6Fft2GrPrNGjZFM2ChjceLQp2VyD6KPFrdMjHkOoE7Qn?=
 =?us-ascii?Q?s6IgRTNciDre65qSDNrsMaIkOSMMmbn+LDeE/7lfH1ylXAmYylv0WKAI9stW?=
 =?us-ascii?Q?0jxIBBgbOKH7WtMT9FbJ7bQ7cgQxFYbm+domHH927kf4S+t8Zev+M3EAL/rc?=
 =?us-ascii?Q?LWbKVtdwzLjT5f4pDA3mNLPN9ryjXgcAJptWQ2NNqaSKvXeAnAIdYFy7XokI?=
 =?us-ascii?Q?75qYqtCk0ezsaVlwC6lRQAIOxphFV/029WCYQeRu2OHu/cJUzp8iPu4d4kHU?=
 =?us-ascii?Q?yJ3j/49R6nLNrPyDz0ZVPdO7PX+Scsojpag/YOadcPJve0DL8yhgQdxan278?=
 =?us-ascii?Q?enm242WvbdGCocybRwE7Thrv4Z1VMPW/osTg7smQ0kmpiWlqIxx/UCbM7Jjh?=
 =?us-ascii?Q?Df0rlFSYAQ3hjVpWMZrnGCElnLxnK/0PlYxk9nqVue3gY+tnd/0qgRpSUAXl?=
 =?us-ascii?Q?wtwpS9Lw5nchdnI2JIvCARzSPVGduDcdXke8cropHg6fkngAo0jrhkykdrnQ?=
 =?us-ascii?Q?A/Q0lOqOZCmi3wVy2YSgcheDwHLdZ89Z7X9g?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:59:13.3336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b2dd73-3ec6-42ba-53ad-08dd8c84a7d9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7491
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NSBTYWx0ZWRfXwW+Bn5CPtuEp ScNXFFp8grnjVocoRXgerANm2KUdXNOd9hKkwtYXAGVRSTZ35HfysggPzIJiZl9y7QKMiA5q8J/ FuKgmpLgtd/0wHFrjazttVCzd35V5RDOZ9XLkwcz9vS8Ftt4mk5M7dd8eX56eXdNcuJAYbdIoeZ
 zIBZrqU/YB2+MJypBpbEOVEAGCc8fTYHTEeoHVZVLCvClwuktz16mv0vHg+McIn7vWRnV7GvJ+a jH5gJKIrRHwEsya07K1gyfQpBpY6CNJ8uhl+RqjFBjqImoF6vTuHr5kfez35xJupQeYUVAwZLSj okOttwyhw0QwZYN1rDJ8Jxh/ABPZduTJf4SR1a7jdOLsyG+5DYWsp97lzGSLZO5LADiMkJP3nUW
 uIqDq3w2GjLMOg8GXlA+IQVKAoNr/mI9kiqadCxy5DpnnMyAxtm3HSeXzOzAndZQB753HmNT
X-Proofpoint-GUID: OzjgmX1nuFZSR-DsQr5btcM8y6DF_fmG
X-Authority-Analysis: v=2.4 cv=Wc8Ma1hX c=1 sm=1 tr=0 ts=6819dd77 cx=c_pps a=zzjaJ2HwkiRAih7KxKuamQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=8K0RRMVSZC15TKf-PyUA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: OzjgmX1nuFZSR-DsQr5btcM8y6DF_fmG
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

