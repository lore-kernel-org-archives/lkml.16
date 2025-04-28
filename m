Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC68264A67;
	Mon, 28 Apr 2025 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833302; cv=fail; b=Ms4Nc5g9IusYmh/eMx1mEyCBcYdgU9abNEsFkpnLmDoaiLAj5S3mqftWkKmcbpcUIq+ZVqp0fbIk2vHSfot9Hfk4ssdbhdSnxk4O/ktVH1OcZmJuDAgVsosxiLoXIPxvCZFHqOMQyGj3WFLtI4Zz5nAKJEK9iD+e52IN34BZqh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833302; c=relaxed/simple;
	bh=bvWebNno0LlGz0W39aNr4S3Ovd9nMYAWxciXxQ2GSOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pvZ1jzowzwfLi57Ay9iF1iIsD6NbOR2bgZQTDk59GiH9N3LE9IUnYMPNB1kOT8aqI1Rb5pSKPc5WU+QlPK727ZoTNYut6luTEmes362TlH1ZVE+rA/aPKV9wf79T+xQJ9Ta2oOnjXesqk0fniEZObUsbcOv6EWqF6lyEpLcGE9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K90Inw94; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bdLDSRTW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K90Inw94";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bdLDSRTW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S81S6x013255;
	Mon, 28 Apr 2025 04:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=VXpBoA3eHf0XrXIr
	TO7uTpIWiuNUqPypr7J5sktTfMY=; b=K90Inw947UeUrD1LzezxG6T0ac4cPfCO
	arueuXTBggxFG0sggO5JeyIqQQO2SOvDckmIIaZ3mABvBuZYZNc/+DK0ATfrSnij
	iMsR7r8/BJo19XdFzi9xSNm/jY+YDyeVXP40E2c80tHkb1FcZ4oVl6KRpY9AkIf+
	SuPVfsUWcIOPeWTBnubDvRlUThdklYXMbwRs/Z+KkXAzH/aCagDzoQYpMNPdvop4
	A+Ov1Ya5J21iNc81ZK7i4ij2Ir3DYm+LedhgebDx4Hm4qj1v/Bz3hQqC5QQab5cT
	IUUjdFwtatZVdg0lKD+nbmSkHrWhUykcMazB41Z1f1qgKbnvxdfTsg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw19y3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 04:41:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bv6M0LUctxukli0cahTP6YyM+nUkJ9hk+Uk9hggxxlKFcMH4RRr8rTzbW+3lNBsSGpd6RfZBkXlI2dCiVWrQPhLwymEn1x4Ijn8ChSDb3XfP5KUwQRgMo9bjfdxixQBHaq1ZfKwqcpiTT4AjxnSyB3k/LU93JVyb6Po3Tcy5m2aff2S7b34FZhDJTEV+vYxf/2+IakkiwNqKeYgSHhHEf9z9G/hwkq1CKlAvNUYSn+3szNET8lIpP39Vg4syHLHR7BlSK8jOPV3y/WJsiEEOkcAdoRmduLxKOoqkloTNR+DaRmidqx7KLXqTYItBnSPcXcD+/Nizkk7U9kbtw/QYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXpBoA3eHf0XrXIrTO7uTpIWiuNUqPypr7J5sktTfMY=;
 b=wBw600R7ab5jn1RKlhJDX4DJEz149xlIdGFk62FZBWWrcZk7VXO18pNOmgv3RG+ChKEH7Mk+8bzbsH/de816spaBTLBjv01APbXiQM47zmH62nCH9KxbWWWF2HxnaOhIEN4lhD/ua9YkunOt79TEZ2H1EHuL2oZwvo0qqZxjcDhMBx9QdFccLJgyNls7ngyBzkvW5T7xWRPm3RHMl2qL/FBooRQsS+kfRt3rIgrBMgNQsGPIzQSQq/4ylWAk0pYBMlI+L+H0h9bzNjmstj54jsCHherGJkN7ZP8Xnoh+se/NydbSpDUMk1oVfznVpYqdL7juqnhxHlTL1Ck+EMTgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXpBoA3eHf0XrXIrTO7uTpIWiuNUqPypr7J5sktTfMY=;
 b=bdLDSRTWh2uuSneztBQo8gMkwm/dXUtDqdgZqGQc02yl7nH1fK5deql2DoM44bCukoWMvG415GWapC2plxn2v914KCCIljrOLYpefv4p5IBCqaSDjlO+hiZLUIhY/Q8nFt0WW2H5TxFXIaKpabP6OrMiNfaOXwURv2IfvDiAMmQ=
Received: from BY3PR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:39b::29)
 by DM4PR19MB5788.namprd19.prod.outlook.com (2603:10b6:8:65::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.29; Mon, 28 Apr 2025 09:41:32 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b3) by BY3PR05CA0054.outlook.office365.com
 (2603:10b6:a03:39b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Mon,
 28 Apr 2025 09:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 09:41:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5EEA2406543;
	Mon, 28 Apr 2025 09:41:29 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CE465820244;
	Mon, 28 Apr 2025 09:41:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/cs35l56: Remove dependency on COMPILE_TEST
Date: Mon, 28 Apr 2025 10:41:26 +0100
Message-ID: <20250428094126.125781-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DM4PR19MB5788:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 711666ec-4345-4b94-4c49-08dd8638db9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|30052699003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OCeGf/qCRqahdAKvAmshwPyOQQCi70IXDdqVNcbCiA3CiBE8tdfRr07np8tJ?=
 =?us-ascii?Q?z0a4W3jp0z/EYU2kMxtbgXXv17dZTxyZnL7TrB/duNj0uM85esaJe4J4v2Jl?=
 =?us-ascii?Q?P14WlG9d02tvLVSx+vZxS9ng6oLm4MrU0WbL4XpdIG6qLDk2QQ3Iua673rWK?=
 =?us-ascii?Q?/jhVU1m+bMLVqSJBwV/fIUBFCRgdK23asfjTKkoyOdfwPLRAkSfTh3nsDU5L?=
 =?us-ascii?Q?ZjAeCcpwQdgh4DKpT9Ii6F3DNANdkf3Nwp7zqESBY+ICiHkxPV8zRvH3u6F/?=
 =?us-ascii?Q?Ty/YBT984sGn7Tt4GRpf+0BpLeF+qbpAEh3+grp6WmoiM/l/gFZBmDBmuMO8?=
 =?us-ascii?Q?OMpGhikjPe8eQLYMjB4ijzjFckDHg3Z4VyBPMpRH7Z2gXx8DTwww0APDvDOr?=
 =?us-ascii?Q?+OpxuUe1q8TbTPg92FPb8u0eFqYK6CbQid5Rr4w6dg3tGTh5OSDzwJ4vD/qK?=
 =?us-ascii?Q?42JMmv9gpgEgNAJjUk65ulGAggh9c5rOIfaGMdzO64IpJDIJX4DMdG9ifwFa?=
 =?us-ascii?Q?y57MAplAkxH47tsWMIgLvWkW2YZ1ObGfmyLCobQHB4SedIKkd6oPeqeWVLRf?=
 =?us-ascii?Q?EPu/IQQWrfL5PDVM0fH8QULdoCOVkYXyMiTcehEb+fMO81R03z0ARgvWoXP3?=
 =?us-ascii?Q?eGserHSW+BDBnejW1M2NxaZgZr2BSgu3DOyeXW9gB4WxbKO/MiWS/A0KirEF?=
 =?us-ascii?Q?EN8t2Q/v3Ej8TBcGyq73cSuU6WcLcIb5+e7DG247NMIdXcd9RfpL/auMO7Uc?=
 =?us-ascii?Q?LwAgZOx1zj1E9prfhpuUDas0KBJHCRLLKaDWa2AgJ5lslsnzgRdiiCEul/rG?=
 =?us-ascii?Q?Yot72TKvVsm/ESmREAVi1qlS/kDNnfVD9LkMUZ2ZdEWqpq0Agb7a9/YZ+xKj?=
 =?us-ascii?Q?vAtSelzecGalGJtpkbzfGVJU1x1NvO32M97pr1PFZ5egWEn89aJum96UVJPY?=
 =?us-ascii?Q?Hj85KE0pg1mD59B3C1/gJfK69TIjPqKEoyx5CQwXfufyG9ohvCqXIXnrn+mI?=
 =?us-ascii?Q?vceHUUC9QcFqtBV45ZwPEz7XW3zLUmMQJLhvAN7l7mJLwABNjeHU0QHvzNqm?=
 =?us-ascii?Q?HwGhNwaHvVWDJDmHLc5JPqZAErqisBx5uJsP/ylM5a2SuNS+GCWE+WNcP0Oh?=
 =?us-ascii?Q?psb1j0cQsuKu1NvsNtlgnXitIHgnjLOxtbmCNHrv+QZCBK2SuxYKpFK0Xqk5?=
 =?us-ascii?Q?O3bO5Q/3ttwgvLe2OEF3NK2lCKNN5Rs/oBdR2mr4ESdX5hUxQN2JYJq9g/TG?=
 =?us-ascii?Q?XuXu3dvmLjtmbHUb2EPBVGhDCsK2ACz4V3XfnRnfrhxQb5uQ4XgriMbFH+6V?=
 =?us-ascii?Q?ffa5psenXk5dGlGiFAE62CUEmmGqztE+5V+y+s0wej1Urj+FDBlUn4xEgbw9?=
 =?us-ascii?Q?Nza6JRCrfe1a+zmpZIXOYLqEynzZTLGXT/4lqPOwaE1jsED+OxAFo35k3y6L?=
 =?us-ascii?Q?rKKj56NKXi22ikUM6rBc9k5diFaj6v2rg70083HjGQsmWhvFaqOSkNaQSxGF?=
 =?us-ascii?Q?Chky/OgGOcjZOw2PWGh9LM7G4tTsK5uUWd3m?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(30052699003)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 09:41:31.3655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 711666ec-4345-4b94-4c49-08dd8638db9a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5788
X-Proofpoint-GUID: PHhK3xc5Ufvxgdfy_M3_3sePB91uQfx8
X-Proofpoint-ORIG-GUID: PHhK3xc5Ufvxgdfy_M3_3sePB91uQfx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4MCBTYWx0ZWRfXwnPkVVcTBiYV Bn4ePdpn/LHUMNxW/yg2IUm7C7qs4YXCHRHaIlUodXuDXp692kaYO82BAAf962fGjpbCsTlrpFg m1L+Kgrwb9iWr3k5zOCbDXAdXRGmaHypIILgfS+JVqNTYJABcBitW8U4eNPV6o4zANv7BtTmtPR
 0BLHf77hVBRXypu7VpktUG5+N4aQweTJLNzYX/S9edxJSqdGm81PVgLRLoCCZbR6j1asCed/kLC xI4LI64jIKUYNvWYqLiZrwfZu4dsPHCfI2T7qzl4Jf/tbNJPiJKrg+B7W3EUZJqlgzFGTY2Sr1j 31JPvhwd6p4v/eO4xhXeio0BIF4DMyH4eNLb+J4Pjeg5/oDPflWPoDgC73deCP3ahgG3dFAliCm
 Sk7ABohoeAxGPVibiQ/NfXfKjs78XFIbTNQSgHFFSZI5aBJh8Tj7MIuSopz45nxHoFsHEiPc
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=680f4d51 cx=c_pps a=PdgAl9AEy1hEU2ikvxmBtw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=tOkxpgoez9MNupVflF8A:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Change the Kconfig dependency on ACPI || COMPILE_TEST to only depend on
ACPI.

The alternate dependency on COMPILE_TEST was a fudge to enable building
KUnit tests for modules that are selected by the CS35L56 driver but don't
depend on ACPI. This was based on a misunderstanding that KUNIT_ALL_TESTS
meant "all tests". Actually KUNIT_ALL_TESTS only means "tests for modules
that have satisfied dependencies" so it shouldn't be overriding
dependencies.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 15cc46032583..25fb60b0428b 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -151,7 +151,7 @@ config SND_HDA_SCODEC_CS35L56
 config SND_HDA_SCODEC_CS35L56_I2C
 	tristate "Build CS35L56 HD-audio side codec support for I2C Bus"
 	depends on I2C
-	depends on ACPI || COMPILE_TEST
+	depends on ACPI
 	depends on SND_SOC
 	select FW_CS_DSP
 	imply SERIAL_MULTI_INSTANTIATE
@@ -167,7 +167,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
 config SND_HDA_SCODEC_CS35L56_SPI
 	tristate "Build CS35L56 HD-audio side codec support for SPI Bus"
 	depends on SPI_MASTER
-	depends on ACPI || COMPILE_TEST
+	depends on ACPI
 	depends on SND_SOC
 	select FW_CS_DSP
 	imply SERIAL_MULTI_INSTANTIATE
-- 
2.43.0

