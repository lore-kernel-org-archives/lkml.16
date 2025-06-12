Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8C28B7FC;
	Thu, 12 Jun 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744056; cv=fail; b=XAokhDnVxZoalCxh66J4z/Dk9B62FSPZIJtF6dpXIT/QeGUSbe7D4Bh/tKsO9flN+1XuGJ6y1cV82mTaNCy3U8X4eXxMX3Vc0Hlcv54aaOHkt8rUC1rNmA6qOP9ErsEdfau2lBKc4aXi0JMQ0u9Wx3U8XJbyhZyKOadHYCAT23Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744056; c=relaxed/simple;
	bh=5oejMhCeqzdOLYNVsEZEBWcgRPaDcARFT5E2XaBeGRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qcUCX61lzILg0FnDY55e3fysxc7ZC7cotw47bn6Dr26euKBGn5NSM0DrvxxMadLYj0mZRBcR2jjQlBLdP2QnVnBEsZSB14Jly9YrEpUq7KQOnJoi8WBZrnwROaOdWumB9EYRyPNI2IlIg05bldvzuYBHCrQboC1Zrd8N3bQScaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UcAH9PAd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e6P/m22P; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UcAH9PAd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="e6P/m22P"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4KWDA023474;
	Thu, 12 Jun 2025 11:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/U/tC/qSkpY4JI9L
	EADbEP+/z0TUvNfQwbMfPwlrdzM=; b=UcAH9PAdcPGkP6aYacYUYXv5HfhaqbFM
	4egVjJmVa2MfOA99deSl3Ky9AYzlnGHzG//3dW/Qz/Ey2MhA6xqrIpySDtVXhuql
	502l7J/3iIUsQ9g6ZqL4rUDAhh+1no5RaCx5jNbNIfJOfnojgbx3xsLESm0DunC1
	G43GNVp4OM+sBFrLbIX0Klz9pdFX0JNXTHVxUmMzFWhIRrae4rDsK8NEtMn3AVc5
	4S4w9rbJmFhyle+DGXBYpPt5TIJck6IQvqwPvb9i1qE1MOUArZnZxXTn4bU2RQEQ
	zeAeJ8wla5/GiDrAFX75zAW/a7vR39ma8sGCj/uog6xeXNlJ3NVgLw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2115.outbound.protection.outlook.com [40.107.223.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdc4tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 11:00:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTdjayonILFtUgSwioswKWUNICSbCGvdMfgd6QSkGuuUw/ryyndxDewwL5tz4ySsDVcPP9z4UbgBWPRbq7BXv8KzWohUtf59HaEbuANjf4LnxtJzCkrNd6H40H9OBoBejtmGkelCqgPffTDfiwB0NaY9gP5Y86+5lMydfeMzMcVuqmtnYq4ekMUvMdo5Q9p3oc0aSChV8vqvgcM+sFrk0RnbE7lRngwvT4bG33ue/SLiknbmTUqgtek3EZhPL2pWFP2v0nGYBcydYQfdYSrKpfCRfE/Z3mzcAcwQPPIxpwcmEbcevfXmrL98ne4BnzeZtyIHYruyydJOGsmf1ltkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U/tC/qSkpY4JI9LEADbEP+/z0TUvNfQwbMfPwlrdzM=;
 b=vLP54vlstTrFIAntiZeyzL5/I2ArLU5KOCiQKfs6eIVCL3orC2XcgQANrflYWTn3kKoXcZu3/uipuOXoMOKqLpefq25PwRwU7Q/FADdMnycZM6m3kxT1kETQw2r40B9sogEWKO9MieGMyND8x5FM41ymyI6yHRouz46JUnJlVWMk/msmLFJZfwDy1KPaRH0l5nXRbh2/gpBuZGdYnaKy0HEKAcUklZc3Uh+fzqUcPWYg7DTj93CFjPrDbVcJky4kMk+fTJs7QfMexo8WMbuF+jH2IzfGTnyZzxNrhohM32/7i1hEqUHaHQUXGKzPsGSXWG4pMDTztP9ryZlv4e0gjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/U/tC/qSkpY4JI9LEADbEP+/z0TUvNfQwbMfPwlrdzM=;
 b=e6P/m22P4/0KFqD/jzKWq28kx4/sPRi2fcGqduZb9sWCo0YRlLME6Le3mv3/tvWwyBKxFmOeFaLcqg5EpNarzeE77YNyf3ssKpTpPucR2uVQ9l6xH3VLaGng+YIwBSbr4ijAoDA5cMBV+hCT5crcEUfPyOSvg8AYwR7hqEC3Cv4=
Received: from SN6PR05CA0030.namprd05.prod.outlook.com (2603:10b6:805:de::43)
 by PH0PR19MB5049.namprd19.prod.outlook.com (2603:10b6:510:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 16:00:43 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::f4) by SN6PR05CA0030.outlook.office365.com
 (2603:10b6:805:de::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Thu,
 12 Jun 2025 16:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 16:00:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 18016406545;
	Thu, 12 Jun 2025 16:00:41 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC7C382024A;
	Thu, 12 Jun 2025 16:00:40 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] Add Support for ASUS NUC using CS35L41
Date: Thu, 12 Jun 2025 17:00:21 +0100
Message-ID: <20250612160029.848104-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|PH0PR19MB5049:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dfb27a4a-3d80-4885-8925-08dda9ca48eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rrnBqkq9m7hSh9WUK8mqvOfz9plXw8I/tBHrb2+UeG4Ih02HnW5ljj9Kl+AU?=
 =?us-ascii?Q?rh48CXS0oPZSkPV2KBN0ocCA+0wsIpkKfo6ZgcTaPLwkpMRzEy0eAvnEXn6p?=
 =?us-ascii?Q?XJmoSes0xLlxfnB8Wq9+i46nP47CCPh7JLyOcK423vnxLxi4gWOOxuK5aZmq?=
 =?us-ascii?Q?OIQY57hz6noYWhg2aqnBVN5e93JKbfIMdfsCvJjhfQFmpZQ4neo738Fbq4Yk?=
 =?us-ascii?Q?iojTYj/FrNaGGBJ/TxHEPgjhTjnbVqawPCS+b5MPgDfsTnmk5kwCqb3MJyoB?=
 =?us-ascii?Q?Oo3Qw1qnmhSQDytgpOpJnw+qlgX/Eydw26QD/QkhhbuMLsszysL3YJ1ODHqT?=
 =?us-ascii?Q?G6TeuqrKqTiQlqr+j6KjADC9xvASEKQJfbtv1Js4dFttBPCwcj9jbhiNJfnQ?=
 =?us-ascii?Q?tBuwdH350AMA+mUwV0OBS1Yg5yX5zagg7x5noJudL/oBHKGo27gowYT7RkWY?=
 =?us-ascii?Q?4tFf8HO0RcemqRZsvY6HwLWLXASGLQvTt2yZKe8O/ZrzxYZ3MQWi2NQxRdGb?=
 =?us-ascii?Q?wvI1Gi+KuCLbuXt4iulicrcXW/SSkZePyMCyWOnX5GQ3AsjJ2mgGsSLkca32?=
 =?us-ascii?Q?MZkaSN85c8i9MjbvSBLlGlcbm4XPCUPMoQb5kwi3VlrmsOy7T/0xPhrYD7RV?=
 =?us-ascii?Q?rBg1oDihGLF7j61IL/CN9CJ3tzRgxBNPFC7dhh/OUzq7NwXqif68ebg1b8XX?=
 =?us-ascii?Q?VR0wkU/CN+QCC0w7edwzh/K2ED7aPRvzTCK4/tEsXRtQCTyLoYmOXfQz7y71?=
 =?us-ascii?Q?X/sIpOzgZ+JWx6MkevFT5XNHUnrmbCal1//jUCF6FN4TFKVJt1JZK1gNexnP?=
 =?us-ascii?Q?ZnwWF1SL1EmxVqFTq3kG9fHFEVSqlbTUE65k7X68SnIPUF9NvCE1n/FRZfS9?=
 =?us-ascii?Q?mY107Ka7uGYYIdiNhcZgTv5NZDhMWqtKv4r12is12jV37MokntyEvUiZUalS?=
 =?us-ascii?Q?FYTKgymD6OrOewp+0rsTZslqwTXdBMxBezGtwSALcvAWLwZgnRmTp6D/BKjY?=
 =?us-ascii?Q?RMsUjqjsWxhlrVhwL9bcoV6IxEWS0TA6MI0tiKfRpPlIYyQ//uCSAmdwIlJn?=
 =?us-ascii?Q?Cv4ZmCZ5BAOr8WW1o0AJ0NaijOroP1oetlhNSKj63VMfdyKnqMQPQ6jwD0yq?=
 =?us-ascii?Q?BPvg5WKuUrSGN/9iXXvwFiGbCBBouuwBytlPYL+abetB5HEGOYAUugZZp7wn?=
 =?us-ascii?Q?QORgeZ/W2ZF3JHz9+fe85LD+7PGNqHV22VkKUM2tfDZTQPcLgP6WsBXru/Yp?=
 =?us-ascii?Q?K8pNF22eRcXEEnwqdzsGw7co2fqmtqHkt04F2LtJnvbJvOUuB7rtM8yowAbn?=
 =?us-ascii?Q?SxVwFrgRkzsDE2Sbu1Apm1mXQbDDdRfqZnO478dKtdchP80rHykkx+oTkYrK?=
 =?us-ascii?Q?NR+vQauZGiT1a9q9OtAPccDiAha8IVInrbAYINN8DoW7WCnsEtKscab4eK9c?=
 =?us-ascii?Q?RhjQB28PuN21bB/PcQmU6MxRFR/n5e5Q5krTQHezA05Wt5Sh4Ykl7QSJEUJ0?=
 =?us-ascii?Q?NjsagHoPjJkvaRewiceIMLaj2bIs7mulfuji?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:00:42.5533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb27a4a-3d80-4885-8925-08dda9ca48eb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5049
X-Proofpoint-GUID: yyO0pYsoBDaGSWG1tnyeEyqqW_c2SpXO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyMyBTYWx0ZWRfX926lfPFVEmLP HjPaWOg1Q1q9TWeWC0vsQuMdJJrpnsR34dJ6+2WaDN3rX1izhyQqk6As9YJWGvgxCuHrIqT7Ac9 IqgEsNwkuBTxkvIO8VHH0InZwMlCW19T0h1+2l4EV/RlgyGBNolt8+PKjgxmZb7A78TZqHXKJh8
 FNdpeU7P3Qfga83kglZ7A/tt7fOEnj1Ta0yPj+c7c9otOsKLG9G1mn2JtfIEBShKzv4fDXHnstG kKhQdUlODx6VoxutdT/Dw7JkKNwye+sJmlFqLZmglhDo1WFaI4ytcJKj2JC3vyyWXVMPtYeJdcM jqScFLtQSASqkkkCmoarfpfkkFkATUULMA35uYrVrL971NS5KWeQi8GmUwlU+hOf2emdOokJuuZ
 jBMQ09T5LZ9us+SqPOFUyH4Q44nqBUgeVADSfDsVkGaKKV2oC/Q2ZcT7Qf6VFpHcEckt/UT4
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684af9af cx=c_pps a=YbcMhz4I3gND9vdO9+Tgiw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=I-vAyZJnyVNIUjFTEmMA:9
X-Proofpoint-ORIG-GUID: yyO0pYsoBDaGSWG1tnyeEyqqW_c2SpXO
X-Proofpoint-Spam-Reason: safe

Add support for 1 amp configuration for ASUS NUC using CS35L41.
The NUC is using 1 CS35L41 amplifier using SPI with Internal Boost.

Stefan Binding (2):
  ALSA: hda: cs35l41: Add support for center channel in CS35L41 HDA
  ALSA: hda/realtek: Add support for ASUS NUC using CS35L41 HDA

 include/sound/cs35l41.h       |  12 ++++
 sound/pci/hda/cs35l41_hda.c   | 103 +++++++++++++++++++++-------------
 sound/pci/hda/cs35l41_hda.h   |   1 +
 sound/pci/hda/patch_realtek.c |  11 ++++
 4 files changed, 89 insertions(+), 38 deletions(-)

-- 
2.43.0

