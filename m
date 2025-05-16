Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0335E55B;
	Fri, 16 May 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408892; cv=fail; b=ilvCM6yCXXCIqTOAuKVrpJ3c84eSCcXrRb8HKHf7AV2BZY5ktT9pt4Pr9q7EUlFXpT5UD0EcOkf/72WCdbVfC/6iNHOL1GeXtOA0ij6+FDzY6gL9dcfJFzp/gppQPhMUshJIGkNAkxpoALSKhF6gFf73hIecknWhXtZdwsSj8G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408892; c=relaxed/simple;
	bh=01J1fxvxVrEX+8rmV4WDR1dPVytE8DhXgbaogkxiP0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O1ajkEseD1zEVIvL6Q1n1idWYMWSf4XwI/sa0ay2SzT331cHU0YmTEfkXnpncPme3wxYsw6twOsl0gVrki1l83jGCvWmS0XBmL8dM77VQ4ZRPACduV6lrpWPeQ5Nf608Yuz/s6IcFImePcoAZgmnAQJ88hIr5XuKD0Rh3b/NCdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CihcJ0P4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LqGX3Hbn; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CihcJ0P4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LqGX3Hbn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G9pSP6002309;
	Fri, 16 May 2025 10:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uBCDGC4XtorXT8Kp18slZchtS3clX3uKKIrN56pph30=; b=
	CihcJ0P4pd6rt4gfy8OoHl6V24hAZ84YjU0PJbck7ASEvk7gGCnleKO4Hs35DAAr
	cicLYPz8JDFLjKvd0xYdrFQsQyT4KhxPEB35jtnGZX/bcDhrBd0YgcMAMoJ4Go70
	rkupgOFjItGQ1wpPP6GF6o904cklwKTVD/NR8M18c11NFg5CpqYlNuvlmIJpg6z5
	Z5pCv/QwghPQ0k6BF4D/PZ59tk9UdfvDvXKTZEC6/FTCGlLeG1YFRllN1GIPwf3m
	Gih0FYctt6GR5jOfkV2nN9Ra7lfRuXhubCP8SOjx9Y3V+k+0dwPEp1cI3J9bzGJG
	oxeS/O+PIB43984iv/Z0zw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrcvfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:21:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xICJ9b9PA8SsDnfOEIc2hHlH7B5h0dR2LvqPY3jypWrIrLNIAm3eVIVOzPdNqV7M0Q7HiNvaU1AFBR+8gykmtxQs+jBDyC5QDWRHvrINWKrBnq4i4q9mOJbcFafzlmUQkvUIhXha3WLLvohJPYwgQQNj2rPFvNL23TIYhT00PnJCThWCzp/gFOpUrTQqLeDou3os0X9GIgCYJ7nPqvGBaTKqnUNxtlHt2jtm9kkGCh1ue62FdpBkW6vzEwGW98ErrrZvyYQ/ANw3uuEAbWJ5ZTQ2228bb0+X7s6N8c+dsOJPu27zzzq2/+EJYCkwBPQc6492+K+RcrSeJdwyi1Zsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBCDGC4XtorXT8Kp18slZchtS3clX3uKKIrN56pph30=;
 b=XYikDMHrWFBM2Jgo95JWrBfoxC2EN/mMXK51MwFyYC5fKdnu0ear6SgZ+dF/U/cS3NMxSXshdbi+xHR1PwfAlzU9jFJxUo41wOKJneTinXj4oepY+jP9oepGf7CvxI3kBgfU9uIHWwr1LAalaeTalU6bmY7ANW0XqxqNw6OIbI2djN2QnxySQ7KI9aHHq8VO1qTVs4+I+tno72H+tMUv1E/oIifh4PUnsr7ZZEqayTs1zkU1Ot8KMglCRKI/JOoslqg0PebfmwSWtLJnmpWFjZA4PpGGrgsXB6KJfru+Ay3lbi5CjJzdwftRwW8+Cqw1F/eHF957d+GtoaHgF+fImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBCDGC4XtorXT8Kp18slZchtS3clX3uKKIrN56pph30=;
 b=LqGX3HbnKwQGeQQvJJgxgoVgphDLXLoKoUbngKTkdgAjz8OFuw55NmjWlQ6WCCZvsBFYMbX0FPMf/Xk0Am9Tb9kk9F3tHTXcwx426QFi/10zhmDcX2LY2BGQkAqdMgeq5p96tvhVOEaj0wXf8fitptjmhWEYjzhj+dZS5JL1Hrw=
Received: from BY3PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:217::14)
 by SA1PR19MB5005.namprd19.prod.outlook.com (2603:10b6:806:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 15:21:13 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::d3) by BY3PR04CA0009.outlook.office365.com
 (2603:10b6:a03:217::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Fri,
 16 May 2025 15:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:21:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2568240654A;
	Fri, 16 May 2025 15:21:11 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D8163822563;
	Fri, 16 May 2025 15:21:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ASoC: Intel: soc-acpi-intel-mtl-match: Add match for CDB35L63-CB2
Date: Fri, 16 May 2025 16:20:48 +0100
Message-ID: <20250516152107.210994-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516152107.210994-1-sbinding@opensource.cirrus.com>
References: <20250516152107.210994-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|SA1PR19MB5005:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f4f30240-4d94-48d4-1bf1-08dd948d4b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2BXy4yh3f364b8Du55MGq8Z8tvJ3Y3hxF0gc/N+P3ojK6SSCvAsvFB9T9nM?=
 =?us-ascii?Q?7HVBB5HH9cJfVxb1v279LnqtUgSz8POL6B/ueis3Q4/R77LElQk6//HJFkNQ?=
 =?us-ascii?Q?F0mVkKNzTGuUEYIqQSCpmQZAhX/WU0RkWHzqRZiUhqZ8mQXU1UsCZ+zml6Yb?=
 =?us-ascii?Q?kVCoVfQXPykn4T3TrEH8sRAlV+PvtjDp2qr4TXTo3pKe31MEImckcLp++A/A?=
 =?us-ascii?Q?8F98qyUbmf+K76M/qUb53PDLOSxC4a9qEMZvnC1/b5mTis1z3cMoVhq/I8do?=
 =?us-ascii?Q?MjTTl2F6rhHYBryp5DxKBCuDaWr2qU7oOM9YhJyefj6DP3BA1hyyLLSelkRv?=
 =?us-ascii?Q?0QCKeen43nW9ho04U0HJHfy0v8uVhf9uegHGzEmUh2xBi7qcxLcqUBN9trGI?=
 =?us-ascii?Q?DpKtru2I0itWwhrx3Acah1FZbYhkNydK3oY8B0IviGN463M8bRdjleVU2A0q?=
 =?us-ascii?Q?Uw+vzRvvo8BE11GvZhTGx5Pd/xkPNpVWlMEIhD7pZH8zssuSozlFz5vZEp8I?=
 =?us-ascii?Q?ppMhm2R39ybOGQdaWFMkU90E34RTgADHVKJw94lfzk42YlLOVL5wtClGglWI?=
 =?us-ascii?Q?QKF2Ckzi1RDIsXr6z/lxjk+rNx21B1ZUigygWXmAAcBpwgWnFEdJUopw/Z6t?=
 =?us-ascii?Q?3jXBpz7lPDvIZUVfm6bkvqIk2e5fKdmllhjpvWz/brrcYB92/cPQXafKvCoF?=
 =?us-ascii?Q?eIlltOKmby0iqdBwnw9HOgfL1dHypGBrJQJw1+hsyYhX1naRWB44IxROd+gn?=
 =?us-ascii?Q?Yr4JbbCr0vAzqzqdp9jvKg1tSu9LA+x9MRlYBZTx9MOtCmLVnYFMUheZaugu?=
 =?us-ascii?Q?kzKLtlw/lxwXOFo1yo7U1dwlUPf77M7pSMPRf4Ii9+0B6uVCftDdwPYUI+9K?=
 =?us-ascii?Q?1zblDmguetlOHgITS3SIzybunEpDcZj+uAy6bYMtFh0XlVMhpD2hRfYGMMnz?=
 =?us-ascii?Q?gTxNu6HazHr2NmSTQN1qAv8KM2RMAYcMLuekmUwDdNsOuON/SlksgkMrdM4W?=
 =?us-ascii?Q?+0KNj+11rqIYeZZtUU4YEQxRUkNX+bA419vIz8bmNTbC/T/qJQQjVDHKTugy?=
 =?us-ascii?Q?HTsq9jmmfxIe68JifFsiE3VNjHs2Tw8hpRT3WROfZ3h80khhegieSoWcsjJ1?=
 =?us-ascii?Q?eBJvjVyOnqovUtLbUYd3n+ycQBNyhpnW9WOOQHp9viGFB+3zXha2GBcdDEEH?=
 =?us-ascii?Q?Sndoafjju930DbRMblPWPWYqy9djqIumiqne/7xqUggPbzWTbURY1yAVkKdh?=
 =?us-ascii?Q?uSEIDS2GMHkyCVp1xVUuYGhvjf7zFg/GBsGRGxHTiq/JDlaNavNfrOn90tE2?=
 =?us-ascii?Q?idIT16iDonYr/+5azbHJpGuYJyiGcwEyX7eupuWsxFgl4sSW+Lu6AggQFjaN?=
 =?us-ascii?Q?OWUMYhbBPp+9p0mHp5+6zdGh8REASBFO9GkTP8d1y+lUj+88fkH570tTgjde?=
 =?us-ascii?Q?9yH+TOufLd8EvzLJYito1qrFhwhHT5Iry95eRg6DMjx+/8TrrRviKJIPmzEV?=
 =?us-ascii?Q?3v4uOlFDeqVEPPwnjs1FzRKKMGG4XE6eop9T?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:21:12.5737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f30240-4d94-48d4-1bf1-08dd948d4b28
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5005
X-Proofpoint-ORIG-GUID: 1CgiPOsQlEOlDRL0Y5pJhiuuWyIGr2DT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE1MCBTYWx0ZWRfX63w7qkDVYlaX jXXFsD0PU2aw/iTgzffG4o+xjwvPcrbbzWvS9QcTH6nXmabM8mjeI56bxgZFyLgLh9ZC+j944rh eQKJJkI6AxrfuB++GK97uDmsfB9sU0ynn5TRot7WeX1Hk9velGcXwvnL7nNuNin9HYlgzWOTPdv
 UhNHcv1uD71HzSKPlbq3A9/MWhmVZOsNTrx+QXL5iAXH9z10gG1KtG6mfP5wfhSiO3D6xIeYeQP kJCwMItTwQKTN2dtqhZEgIoNnD92wvvZsN5ujdbUWCuvcrjCP/VtqqJaOhCdkqACdHNcWWb40cL GIrEJ1Iz+riH3xeB3ppes0TL9Q6I8SYTHQ9L736tSL0JokucBQQLok7dBEbazgK3udydvAvmC2H
 M7ls3a6e5LZCyvQmQT4NmkxXvJ0qVFuLbf7h6VKDo4GoJiAhVV4UgOX+RSQAqbsDJn3rjr1/
X-Proofpoint-GUID: 1CgiPOsQlEOlDRL0Y5pJhiuuWyIGr2DT
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=682757ef cx=c_pps a=6H1ifQWhBrriiShMtbI+RA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=oNY-PSTW-Tjuctb37jQA:9
X-Proofpoint-Spam-Reason: safe

From: Richard Fitzgerald <rf@opensource.cirrus.com>

This adds a match entry for using all the amps on a CDB35L63-CB2 board
without the CS42L43 codec. Configuration is:

  SDW3: 1x CS35L63 (OUT1)
  SDW1: 1x CS35L63 (OUT2)

Speaker playback and amp feedback are aggregated.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index af131d26bd33..75dc8935a794 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -730,6 +730,24 @@ static const struct snd_soc_acpi_adr_device cs35l56_3_l_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs35l63_1_fb_adr[] = {
+	{
+		.adr = 0x00013001FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_l_fb_endpoints),
+		.endpoints = cs35l56_l_fb_endpoints,
+		.name_prefix = "AMP1"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63_3_fb_adr[] = {
+	{
+		.adr = 0x00033101FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_r_fb_endpoints),
+		.endpoints = cs35l56_r_fb_endpoints,
+		.name_prefix = "AMP2"
+	},
+};
+
 static const struct snd_soc_acpi_link_adr rt5682_link2_max98373_link0[] = {
 	/* Expected order: jack -> amp */
 	{
@@ -1027,6 +1045,20 @@ static const struct snd_soc_acpi_link_adr mtl_cs35l56_x8_link0_link1_fb[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_cs35l63_x2_link1_link3_fb[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l63_3_fb_adr),
+		.adr_d = cs35l63_3_fb_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l63_1_fb_adr),
+		.adr_d = cs35l63_1_fb_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -1134,6 +1166,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(1) | BIT(3),
+		.links = mtl_cs35l63_x2_link1_link3_fb,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb8.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_3_in_1_sdca,
-- 
2.43.0

