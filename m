Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C638267B7C;
	Thu, 10 Apr 2025 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278147; cv=fail; b=gGEFNut6uvUfdEMP1H8b6/kpW7+Vao54xiLEIMY3i+oTIkBVc3c7501I/SWmPdRVV1VPNJT8+zEo2vhKBC16WfRpnQ9pbRBvZnt5MEYg3Fj9/v06KWV5bRS0AP6Q1YjkV6wb8xS5t42b5UPEbhJ6Lf5BrOG4S8SzzAiqSqreqYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278147; c=relaxed/simple;
	bh=UGhljcDLmbfVr+xIb+A8Zq5mH+53yZocM1XVk9XKZCI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jFOJw1JeM3o8udvmjlQ0S5evxcbSUrYzOHmY1mgZBMXi8Q+5TJIvnpFlwGoJgx5i3ompcIfwADzkznQU9Px7IWcIBoDdTP0kOAK6Zd3craxe4KBILZyO15dymGlK843Ef3Xtn9mHlbL1tpqikh6DVbweEs47TQ44qDVRKG4xeUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=M7jXcM7r; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SKM8QirJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="M7jXcM7r";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SKM8QirJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A82DHB001301;
	Thu, 10 Apr 2025 04:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=N1RPv15ZtntXIN67
	wtAVZtf7e4We1SLUIbwRnCSXHZQ=; b=M7jXcM7rErOPC+rNrbEwjkdgC1C+S7IQ
	1mfJp8V39sRM65by6B5OTCQpsM0stRTAbKxLAlR9YkihplEvyqWvVyY+qnh6bWAX
	XIyZ10rxEB40AfPdqQf1SNemoyyQ90nXBLaRM0g5Un4HhvxwMKvJ9Foglgw6n6tC
	h1AQuSvhr/FkFROrJjkU9KYHnSVunBV3L6mH/ddL+IFvCkSyNme4gCgIFi3n3g3X
	K6b98xrzRSJHZlL4C5B9aUkGNh//3pqP2GHh4atv9pNWNBAUnLh+Hxg7M7eHKvP2
	cfGIIgoubD7akmoBvDKlAvr6sAtK8d7xhUYy5kX+RVjPOxsHCm0I6g==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45xa4bg41m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 04:42:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmI3nVxnb1c0uITT/33Ywss4yXCFLwN0nZxtZwcvM3aL0UnMRVZe1qiJpvvCikyjqLFJNePeYuW3pLZs2vxStn/+Rn8nlyrFX6YRQL5POMmk6575URf0PbKc1Y/z5ECAc1TKGblWOIxhvho79Mro6CiR0nEtqE/wswllEx38/+UtTaT1tLR2Cro6LdRkuAPWc6Rbldj/Sf6rAml7cnf0yB7iXnymriFb/ckG+C7x1LixPLlRLOd6N+cxsB8O3UBCJWxOVCwcUuE+YcRATJ5tsC3twO2zZiBjDgD+bHUE1m8EmoFZZIvyzjVfXvMbenAPlJ0DrlI2vItivmSp51pLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1RPv15ZtntXIN67wtAVZtf7e4We1SLUIbwRnCSXHZQ=;
 b=URDFFVO/0faoi1n5xOR5mJE5SFR99RrkiF4nmk1KczrTx6zd5QR+f/79TzRpLBCB7nEntMhwCi/uuFZJlxcrtDUre1zn3e9Ryq7PDGx/9bL3ElvRAOiK96nt+zbEyni2+eavM/oCAj9LJeEj+cFXr3ak/cuB+2K+ezwtzcVrgpgXdZ1tRH2yaYa0ZwbGfVtUlppt49kIvWixd8zzNAIMY7IlKrILnI2+Qn393aJYy8KwhW4KLsognubojPsGHWSUtprK5hVQF7T3ZheDJYJUsu8tp3XwsK6+eh5Di61aK8mJNuYyf5d6+WCrOpK/SF84Q80rb2galY9aDLopQ/WbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1RPv15ZtntXIN67wtAVZtf7e4We1SLUIbwRnCSXHZQ=;
 b=SKM8QirJpQDmZuVPEZ4G0q73uNDaatLxXi6JLbuRV7OS4X71Jaf9b3sHxL3OkUivbSMbRJrlivbwjXBkthFTTN46GFNnxOi7DP4RiAgOB0NOtrlrjKnoC+Mz36rou7Nz1Rc0gdCQIlOnnxTjsfOjQc8jx4zVIhI+GRmf0hcOl0w=
Received: from BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26) by
 PH7PR19MB5581.namprd19.prod.outlook.com (2603:10b6:510:134::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 09:42:14 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:71:cafe::97) by BL0PR01CA0013.outlook.office365.com
 (2603:10b6:208:71::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Thu,
 10 Apr 2025 09:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Thu, 10 Apr 2025 09:42:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52D49406540;
	Thu, 10 Apr 2025 09:42:12 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4123E820259;
	Thu, 10 Apr 2025 09:42:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 0/2]  ASoC: Add codec driver for Cirrus Logic CS48L32 DSP
Date: Thu, 10 Apr 2025 10:42:10 +0100
Message-Id: <20250410094212.1155529-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH7PR19MB5581:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 856dc3df-2980-490b-0cfb-08dd7813f945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?noChtx8OsPxWv1zXqheFMwe05XBOQps4aWmxaQu1gA8kJ4lyQakbztv2PN/I?=
 =?us-ascii?Q?xpeNsnk5QLqgpVnfnk4XVxDtJ6W0hFizajNqSJCEeI5lpmJrh8W3V6jFnRAQ?=
 =?us-ascii?Q?G1IUtr+oVxsP//GgM86b5sPBfuqzaNUeffDVIoc8k49LwjSSX2lT+CHss0DT?=
 =?us-ascii?Q?22yuUUzgLJTUwUpfC3ZJq90YJ8PAtsYt45dGhxkzly6L7ShZNF2clTUcsDxB?=
 =?us-ascii?Q?F2b8dseczdHejZ3HoGgDTT6hr+9XfvcFAe3Uk9WXMCoICAy8MTN/pI6VkJmg?=
 =?us-ascii?Q?c9swq08aeG+gn1+dIrYJ5UkcFVJP6GJ2wNmNadT6fwQ41Vguj31BRaX6M5xT?=
 =?us-ascii?Q?U5IybEujABI5VF8WHdkzylA6+b2GQTiYBQGxEAcaSYzy9aLGJ4/BpMzO5mfx?=
 =?us-ascii?Q?Lgyd8dT2uK5BaYMV3ID0JaDjM1dpHzfF0GpqPh+5QQk3srhD1v2/Bk3zcHlu?=
 =?us-ascii?Q?hQ7uaUN2xq/01AU6Ff6+LSQLeHYEtdoPyfqzlZ5TmP/dKBSuJy714/ahQqOP?=
 =?us-ascii?Q?Nw6nNohKaGTulqY0oOO2KmxTSJkH1ZtBlSNtxhXVOrjfAlzx0CUYy5HhGRU1?=
 =?us-ascii?Q?T2Hj/ad7xkBItmjCr9ttBMbSpDgd+J+srbEYjFo1zRY0puuCBvAzFqQHRy6f?=
 =?us-ascii?Q?zcMIg2u4Dfi08DfS22Rt8wKmO5ZpgOPQIjIx9FTpAwd4mgPvykGwxQ+OhsSk?=
 =?us-ascii?Q?ALDLahlZLvVYpxrjIShwfWd/5yoLgQSLVfLZ/wGIZzT5OMIF+4wKM1sOjpfm?=
 =?us-ascii?Q?X4t/jnnAXy5829id8o3p7QgZd0sn23ongx1UJB8SuftOY1Nip3T42QW14iUZ?=
 =?us-ascii?Q?cuFyEiBBijagcbCJ4z4cJo/CHUp+D7YWK+4S7cOkZoP/YUEVgPGJH6OCvnZQ?=
 =?us-ascii?Q?zinmhUUQTb/pu6O5p5pF0QDfzLTlgPpdcBTP0RbDiZonfVttLLwcHgrWQP+m?=
 =?us-ascii?Q?21jprBYidI226wRY25nsNRhg6xVWkA6HIWR1mSg4LFZ3Pl66lBwplg8k9DKG?=
 =?us-ascii?Q?HcNhgoCGyvHBU497MrO52s5xVHXjX4eapaT3p9MnvS9nkxTqOLP8uOj/Y8CE?=
 =?us-ascii?Q?lXzBozjhpNTBwGFJKcEu+8XXYeMfWz11jys76hIdNk+KqqELhH/FiFUKPeNn?=
 =?us-ascii?Q?HeW5Y+a0tkcfrPXtmvjeLe9JE0cZAyum/8aHEKL00MYJqg2+oeO7TOTu0WWD?=
 =?us-ascii?Q?y6EDjIa/H8zPDLojQYTjjtYJIZbQsfT9bJHGj8nrNeOOWI+yT2Od+GmE+DGf?=
 =?us-ascii?Q?WC5PYpwXU4eAqVIBTBoU6mYviEHGBKFhZvJpsytnxNdRFyg5IlrjpSPK9aPM?=
 =?us-ascii?Q?vUoGMXobT+7aMdkMIi1pSVLBlAbOQGCBB2IJ4MeDFLGpS39yXy1OHbPP6UX8?=
 =?us-ascii?Q?OrbQs7kmgr1/3FoAk164oE0OKpj1Cdq+hqiRJDoM/HKJnFzm8xPdxO4UiEO5?=
 =?us-ascii?Q?mjbDL1Cel5kQavVZMbVvekRtD3SGauqSgnmi1Pl4jwPvsHQu+ITOmANayVGA?=
 =?us-ascii?Q?m/tnn81tEg7ssKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:42:13.6054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856dc3df-2980-490b-0cfb-08dd7813f945
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5581
X-Proofpoint-ORIG-GUID: Fy2cGqM2c2z-eZlubshtPR5ZLS-pehYt
X-Proofpoint-GUID: Fy2cGqM2c2z-eZlubshtPR5ZLS-pehYt
X-Authority-Analysis: v=2.4 cv=B6W50PtM c=1 sm=1 tr=0 ts=67f7927d cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=TDA31o14s-3B4xYcogsA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

The CS48L32 is a high-performance low-power audio DSP with analog and
PDM digital inputs and support for low-power always-on voice-trigger
functionality.

This series adds the devicetree bindings and the ASoC codec driver.

Changes since V1:
- Remove bogus use of 'i' local variable in dev_dbg() statement in
  cs48l32_init_inputs()

Richard Fitzgerald (2):
  ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
  ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP

 .../bindings/sound/cirrus,cs48l32.yaml        |  196 +
 MAINTAINERS                                   |    3 +
 include/dt-bindings/sound/cs48l32.h           |   20 +
 include/sound/cs48l32.h                       |   47 +
 include/sound/cs48l32_registers.h             |  530 +++
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/cs48l32-tables.c             |  540 +++
 sound/soc/codecs/cs48l32.c                    | 4073 +++++++++++++++++
 sound/soc/codecs/cs48l32.h                    |  403 ++
 10 files changed, 5824 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32_registers.h
 create mode 100644 sound/soc/codecs/cs48l32-tables.c
 create mode 100644 sound/soc/codecs/cs48l32.c
 create mode 100644 sound/soc/codecs/cs48l32.h

-- 
2.39.5

