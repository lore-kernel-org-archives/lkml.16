Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78971272E75;
	Tue,  6 May 2025 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525574; cv=fail; b=Zl9Bn0jyoE/lO57X1MMEKEzlViJV7VkeaAD3zcM0eCi+mI8FuWvKhdqlDGkb/K1NtxxcY6jY0Pup4QOZLWQ3qUwhtxi1cpi6gJjZkeDFq+iI9Z/6jUt/kfCT6Q2eYqPugNZh/Wplpo+Sxh9Ix8pPjmQ8YRxR0SEiWsj5Ds+hU5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525574; c=relaxed/simple;
	bh=sMg+l+DwviDy/O90xXItjc+uyyFkzAI5vS3bYFfSkog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J9B6mLnWPdnCDdRjQbHvQ25feiw+R4aGh4jSG1TehIGDiuFaPhNvPAUG3O/05WsZX7gK4WfYvohJ80jAIeNUq42iqcRv+D8L+PrmfrIjBS0HNXdzaDLjFTN8ChvurttB2h0g7NypvzuzH/W3Txjh2ypX/46f1/VyCkQU6pF2r0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FUX/wSO4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i+wYORT6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FUX/wSO4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i+wYORT6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5460I0Hl010201;
	Tue, 6 May 2025 04:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=j0hWv08HP1GeLP//o9dhysk0Fb8tP3kqDf3PGfVekT8=; b=
	FUX/wSO4Jzs/tcAkbeEXKZzeIumpoCLxZoew23702w/iI3FaSQ11WZ5BUP98vGX6
	ZayQWmfGHQnO7upLufkCPFg9YMfrAohLgRQ+rsYtlFaAWZoEqpQup65dVJe1wZ3u
	cemIzi3WaB2bY33ZYd7sG9a0zRcgU7/eclIXeRp5xg66v/K3Nox5MGs06F+qON/w
	Hm4hNNoWJlmi59BWGSf1Q0qnppP3c0KYj1zNvUpK/xFonJFDC9GFEjgaxVJs2F5Q
	uXHKplxS4fGx3fV2azsG/WMKzEKVvCzA1rMSY/fy26UzrPH7k6gNMDSF8+Y/PwyH
	bTn216oFsDwozvwa75HMvw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ew4n9dny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:59:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN42N2KEhgm39hQ+MSzeDh7zvxJ8fJ5ayHKCMBM8H1WKDvT7Ntej1e9SJFH7rarablvoqsE4xPTcogewImUbxpm9vhqzmUgrfoYMLgAbCKCvem9FIub6yXQmEQIhZsHMGIr0bM5EkPlGYvgYd4/V8yrxTsZGiz1EtgeTOjv1+tOwo9+2Tc54FLi3rQZVt1JFu6Pp5IV1BJI8FUGhRTbYhv3DmpNkH9CNCNjzUFiTdApIjbFWjRiRedE9LkO+wdiYyaISYG/549luZuCgvnzS514mSfZBk3cCsJXo3A530neAyBTEGIAFTSK/nkSCwZFiWLQz/2N/TNuC2tEyFCGskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0hWv08HP1GeLP//o9dhysk0Fb8tP3kqDf3PGfVekT8=;
 b=LQ3DjwXBo8uxHOmVH2erntcwcy3sOywiHS6yKqauMvem5T/eoT2Qwi5BtLdmo0g+GI5JBaUNRFQOzsGDLz8mMhhSVAY+n92CAvof4hQDmsd2CFCiX4odSbAdEjEVcXS+5AJPX/c/4qx6IXqAvXx9SLFPCy/cCM93DpTp5HSuB+5BiK5HZbpg1f4V0eEwROyoZSBx2clCALvrAMQV+jD1LZmcL6A8NgDfWaRUraqdTHmFSpdhAbCV4an3W/rbfNZEupNF18Ra3wJLCsdzLP/lFU12r3JUsh5lvBpPmOFch81lpFVyIOq3l7PPEpQ7x1suhfzLY/3Ki0/0qBDZep+MzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0hWv08HP1GeLP//o9dhysk0Fb8tP3kqDf3PGfVekT8=;
 b=i+wYORT6Vek5AnuIQfn+NHMK1gtUCl8a5gFuM1Wj8+geeFEPDwSl7Z+HjElND/+oEPEgWoGutLc9ShwPxizXTgiGcLFBux9/ovfclVmdkF12ADb6/pVU4uow2mPYn5bsIe5DfkvwgLvFrUYDk30xdMYNQA+koq5G0Wfu/p9cCQ0=
Received: from SA9PR13CA0001.namprd13.prod.outlook.com (2603:10b6:806:21::6)
 by BY3PR19MB5202.namprd19.prod.outlook.com (2603:10b6:a03:36a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 09:59:16 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::4e) by SA9PR13CA0001.outlook.office365.com
 (2603:10b6:806:21::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.17 via Frontend Transport; Tue,
 6 May 2025 09:59:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 09:59:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D21B040654F;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A84A8820270;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 5/5] ASoC: cs35l56: Read Silicon ID from DIE_STS registers for CS35L63
Date: Tue,  6 May 2025 10:58:50 +0100
Message-ID: <20250506095903.10827-6-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506095903.10827-1-sbinding@opensource.cirrus.com>
References: <20250506095903.10827-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|BY3PR19MB5202:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d963f972-8889-487d-2e2a-08dd8c84a912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A3raG0pv2+T1KUhxnlG7kk2tpXy08VyNVzMkCmQUD+3ztNzsga8J/4wxNpYi?=
 =?us-ascii?Q?tr5zXqjVfLTxeQF4BikTW3qtf1Kvi3HzZGjYprjR9XjmPlvZLzQ6p2zpmS3F?=
 =?us-ascii?Q?u4b/8visK/BC0mWd+A20x7iAAl1WIMhFDSrB4gL1dahWTg/KtWlNZX9WeXaQ?=
 =?us-ascii?Q?dLQIKpZP2GrnxVn91nIj1N/ZbCuFlfUJ+Ptwj4YYwjbbwUo5KllFQ+GGteHY?=
 =?us-ascii?Q?ko5Xc7AO2ixNAurvI3ldY9J3EJvY3UFv3cDgmDLuZqOL40yp03R72CV7gxgF?=
 =?us-ascii?Q?3ArP1gSDFb8zfB/E7c+MXQQWyD5ZHaVf8oC4R+NAiiFG9jYwuVh0oN2X007d?=
 =?us-ascii?Q?SO4Gn6hDI8mYeCUlmPiNb2y4fx4FTo8spVJZqi9xzKp4/JLtOeZop4vufXyE?=
 =?us-ascii?Q?jya7pj98kDMVGiuWatjXygBM99N+AOo17aAq83LEhy2YT2h2DpovjRMIci0J?=
 =?us-ascii?Q?6z+sD6EKaHJamhV1aFyX0BpRx/OcorOhP9w9t5ML9q0V+cMdz0e5UmFIkfo+?=
 =?us-ascii?Q?GdRKuK8d3W4smpWE7kiDkyP1a+YKvWN2jOdYk5Uj7g3RZGnru9C4Z0aNK7Tx?=
 =?us-ascii?Q?Z/LccFlCZJ+vKzfrws9ZVYrR9BUpzcoQa9QnbivrRaF1lvAL4IjPcST/1FUN?=
 =?us-ascii?Q?NDe4xw6jxPN31XDZ9RPbsXFQKwlngoLd4DaI8CHqWXEx2w9mkJM/viFNIvqo?=
 =?us-ascii?Q?wZcFEIKeI9+MpG02gyWJrDVGOOWP98gwZSxuz0Q5nTXsPni/tfhJx7aZEoDr?=
 =?us-ascii?Q?lpyD/Lk9/vaSyCcDcHSJQK37v2ieQq2owdI4henlkY9qGCIQOhgtzFzIzrzl?=
 =?us-ascii?Q?fGVpToZpYISvFWC+I9OMDX4xWYKi4dVAuxhuuKxjyKPdYAIl60DutOIseyl1?=
 =?us-ascii?Q?kJ9fHiWnF/bko2PxAoTPC36zf0BxE6zjLvmbnW6zdPzc5mtrp67Tn0/g4gkQ?=
 =?us-ascii?Q?aTrFfYK13i3ZFryW7roQHkosePNtkMj3sLIsdtEHzA0qCvhTA19qzLEdFCh5?=
 =?us-ascii?Q?6ovxOGClQum3G6idk8F5vIoFTTxT06+Nl4vYTeW2VjZV1+BZMX+gvRXdsOK+?=
 =?us-ascii?Q?PEC+yClKYdviHjfFO1MuvEhdvtEkiCrzTBga5i2d9bmU3iGNpyTia0yg3hrx?=
 =?us-ascii?Q?YQFUXz+X2SnE1R8VqQ219ZtDfYIED948bGc83qPookzA+3kWeYQ4fi9SHJZx?=
 =?us-ascii?Q?mUxzlwyzqNBipNwWuXqljG0xS34EfYsGRaN/joIDUh1XBS7ia0oKA5H8xJwy?=
 =?us-ascii?Q?oAKUBQ/En54TvY6jwGN/GnQ4dAROoJ51tRdMzcdombUiof2IZE/N0ItApqta?=
 =?us-ascii?Q?qcFErGN5dIJ03Y4SYoyiPMPt3n72425Qc3sawoSGOpUrBswUzGHPAt9o0Ral?=
 =?us-ascii?Q?fL/s/EIZLf2np7EoIzlnYSSa9mfmcVkkX/YB2w91bvr8emMApEfhj9gWAHBy?=
 =?us-ascii?Q?mPdM4OpxP9p/ts3lUUoEtEFYUUyYavxkHW9PdsTbLZom5ZWdNHVuT4WkgeWI?=
 =?us-ascii?Q?ZqcbzDKJmwf4iuFXUBIZx/pPdx4gvPjs7Ad/?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:59:15.3821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d963f972-8889-487d-2e2a-08dd8c84a912
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5202
X-Authority-Analysis: v=2.4 cv=KoJN2XWN c=1 sm=1 tr=0 ts=6819dd7e cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=CWbckqrqqy4M3qBwpBwA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NSBTYWx0ZWRfX1Vcp876VTMil K1GAcBeEpffs02l/3XbmZRNUPY5RARS4k9lFSNkpnXuAPiiSjqmoFFVasHtM2Sko6rNznURSTxC /BuzwyaLmdABWWTFURnA0EZ51MHhX2d5bwZVljr65SWdD8jMZ7+osj005nFQQi2JJ8flCXwg+7y
 Hcju3lgRSyex6ZFcnxlqJRX3ZC1szY3ZRoslFLeNQSn9BDC2oAF8/jB0ULHuuFpl2RAyTG7n9sY mTnihUlkbDa1ijxvd5CORRSXQ1NoEnM0pMsRf6vYe4LoAPG+P+Rv7PgDds6RRTTY1zSWQmsw1D0 joVrw4yeIl78G6N2eTpWeaMSbOxd40nEMGtKILXv8946JvwCNYZWO/XiZ/nmkpcW9IbjQC0orh5
 CtsXbgisgsZLGu7a8GCXhaHuSUvaJJfZIShDb6R5ULuvRAB8On7TqbBq0c778mJy/OgmaSje
X-Proofpoint-ORIG-GUID: SU-Y_s3DZve_kOCLFj1OeVrlpTK7AyKG
X-Proofpoint-GUID: SU-Y_s3DZve_kOCLFj1OeVrlpTK7AyKG
X-Proofpoint-Spam-Reason: safe

On CS35L63 the DIE_STS registers are populated by the Firmware from
OTP, so the driver can read these registers directly, rather than
obtaining them from OTP.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  2 ++
 sound/soc/codecs/cs35l56-shared.c | 39 ++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index e16e1a94c8a1..63f2c63f7c59 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -71,6 +71,8 @@
 #define CS35L56_DSP_VIRTUAL1_MBOX_6			0x0011034
 #define CS35L56_DSP_VIRTUAL1_MBOX_7			0x0011038
 #define CS35L56_DSP_VIRTUAL1_MBOX_8			0x001103C
+#define CS35L56_DIE_STS1				0x0017040
+#define CS35L56_DIE_STS2				0x0017044
 #define CS35L56_DSP_RESTRICT_STS1			0x00190F0
 #define CS35L56_DSP1_XMEM_PACKED_0			0x2000000
 #define CS35L56_DSP1_XMEM_PACKED_6143			0x2005FFC
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 76ddb1cf6889..7f768718b69b 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -214,6 +214,8 @@ static bool cs35l56_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L56_DSP_VIRTUAL1_MBOX_6:
 	case CS35L56_DSP_VIRTUAL1_MBOX_7:
 	case CS35L56_DSP_VIRTUAL1_MBOX_8:
+	case CS35L56_DIE_STS1:
+	case CS35L56_DIE_STS2:
 	case CS35L56_DSP_RESTRICT_STS1:
 	case CS35L56_DSP1_SYS_INFO_ID ... CS35L56_DSP1_SYS_INFO_END:
 	case CS35L56_DSP1_AHBM_WINDOW_DEBUG_0:
@@ -802,13 +804,29 @@ static int cs35l56_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
 	unique_id |= (u32)pte.x | ((u32)pte.y << 8) | ((u32)pte.wafer_id << 16) |
 		     ((u32)pte.dvs << 24);
 
-	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", unique_id);
-
 	*uid = unique_id;
 
 	return 0;
 }
 
+static int cs35l63_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
+{
+	u32 tmp[2];
+	int ret;
+
+	ret = regmap_bulk_read(cs35l56_base->regmap, CS35L56_DIE_STS1, tmp, ARRAY_SIZE(tmp));
+	if (ret) {
+		dev_err(cs35l56_base->dev, "Cannot obtain CS35L56_DIE_STS: %d\n", ret);
+		return ret;
+	}
+
+	*uid = tmp[1];
+	*uid <<= 32;
+	*uid |= tmp[0];
+
+	return 0;
+}
+
 /* Firmware calibration controls */
 const struct cirrus_amp_cal_controls cs35l56_calibration_controls = {
 	.alg_id =	0x9f210,
@@ -829,10 +847,25 @@ int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base)
 	if (cs35l56_base->secured)
 		return 0;
 
-	ret = cs35l56_read_silicon_uid(cs35l56_base, &silicon_uid);
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		ret = cs35l56_read_silicon_uid(cs35l56_base, &silicon_uid);
+		break;
+	case 0x63:
+		ret = cs35l63_read_silicon_uid(cs35l56_base, &silicon_uid);
+		break;
+	default:
+		ret = -ENODEV;
+		break;
+	}
+
 	if (ret < 0)
 		return ret;
 
+	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", silicon_uid);
+
 	ret = cs_amp_get_efi_calibration_data(cs35l56_base->dev, silicon_uid,
 					      cs35l56_base->cal_index,
 					      &cs35l56_base->cal_data);
-- 
2.43.0

