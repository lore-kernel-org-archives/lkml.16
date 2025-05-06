Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D542701B4;
	Tue,  6 May 2025 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525572; cv=fail; b=Mbm0GebKQlE7RaL4ogT+Y98CQkvqC6oT+JwIlZ3DjmmAX2fKI0P+EFPNu19q9UDqlcNSHRLxIs+8M22Tj+ytdQncVW8hGY7ltSf2IinZuOWTzI6TMRLOCAQb6Gr7O7E7ZxIRp1+DHzS+VTy40mvAWC4Us5n0EWyr1qvRuSuppGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525572; c=relaxed/simple;
	bh=nCdPFwtleOLX9Im3Fz2AesZWmPZe4GNt/4GAuY4RswU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcuYBi4wdUyvhLTYxtwPAW8c2EZN2cnUnbrT7ZeulHX5toN2pelXbr8nJCgeuoRQlCAxqMIxi0wwVAjArS2twFsBugVXk+65Iq3pCp3JMGRvNQBwlytvPhc215AiYkLR/u0E26KDCqw67Gvwug80bEpuFN0p/CsWmmWEMQKmskk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QrpSX8PM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BzOwQ2vw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QrpSX8PM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BzOwQ2vw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5460I0Hm010201;
	Tue, 6 May 2025 04:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=S/QbRk2seyUY78y+9D8RMnNeTe8MdhV3nroM1nhzdrw=; b=
	QrpSX8PMx1hLDbQ/zYo8o16n1ecMmy2mO+KaV3F8Pts5qqxur8sHAuguaOHdU1fT
	8xGgOzEn/2csfwwvwCVIWi1iOoFeqXq1pRhc7lzYfi4RI179p18UkkXIZQ5kPK6z
	+K6nDgaw+VBC4JyeGigBwLDMOIDoA6BlEY60b7dyPFMez1J/Dhj+rjAhkBg+rhJr
	pZ+O1VxEBzeBg/5YWgU4EorOTXxLT63qgu4az3RLzIcqqqrN2IC7DJ057MjdnK6Z
	nV71YX2bkjNS/7yV45kxjwEAixn51I/0liJ16LUsjhqJYEbmHdKhItGj1V3kwJlR
	RnjJ00+uA8VqPIQcAerReQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ew4n9dp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:59:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtxesBKC3p75tzSZR5p5it5iX23/REG9I9ATsvqBNbRYeEwqWKWCkwMEW0k24LnmnRgVKBs2qR9BBPQuGaVt+WuhF78at0oolseX5O0czDH1noEAJ9aT4yw5HkO47/XjrGl5U7pQ3gqUt2nW5Dv1a/ST4Qh+4xNLCa9SOTrRFOc3xIHJMiM62poXcCJNUySRAhQyCRwy2Z8N1DLLVq1BOppALO22IsMLgyGkSvkbYDmadPCgmEvLTWfkCRU2cdtroNOADei/z/NoUHA1Mu4gb0OgYSK8UongDgyc9u29Sln1yjJjMC0voBINoGj6fvisnXR+tBAp5XSNgoo6IYM3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/QbRk2seyUY78y+9D8RMnNeTe8MdhV3nroM1nhzdrw=;
 b=MCN49ooO2KKQUobZBAO+EtUjhjODEbYTH33xHFCIcd33yh6nPZBI/h4Ksf4UvNMsuimlR4yw/c3GiKkwKNwSNpja2u/x+H6NvGo6ariORMpxpkcR4Tm5fUl4tB0WkJ8kSIr5KHCr68vb3PTr4460TZRGWXZ2JZyzpuUKUlae6aihMyHdA4Uk8wIXxyuICinIjoWK09G4mE4msQq5i/QDG7vq85Rlj7wTv96lHW4v508YKrsSIdjP1dKCxbqK4q9IseW1Zrz3I+wXELua1JpNJOO3124JxUuU51B32ojnT9iY9CTdbvVM06eogbQqcq1O4Fzs25vulSG5cV5dd+ymtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/QbRk2seyUY78y+9D8RMnNeTe8MdhV3nroM1nhzdrw=;
 b=BzOwQ2vw7HseQm8r8+9l4fyrN9irp57mAJhpO2INAaf4OJXBZi7pnvKwKdIVnsUBvxLqzEBu0Gq7+dTyx8/ft7g6s6FcpnkPLe9iev7G7owgSDqJhYHBXtpYuHcQ4+ZdfKNFJDAzx4SkvKiOSwKmrwEkCLCgpcJtXakBuHwymKI=
Received: from PH8P221CA0055.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::8)
 by PH7PR19MB5918.namprd19.prod.outlook.com (2603:10b6:510:1d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 09:59:14 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::c8) by PH8P221CA0055.outlook.office365.com
 (2603:10b6:510:349::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 09:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 09:59:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A2D3D40654E;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7669882255C;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 4/5] ASoC: cs35l56: Add initial support for CS35L63 for I2C and SoundWire
Date: Tue,  6 May 2025 10:58:49 +0100
Message-ID: <20250506095903.10827-5-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|PH7PR19MB5918:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8f8429f0-6abb-49f7-f45d-08dd8c84a819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g3Z/jNwUlQIy3yIAQV0x3pErp6UNe8qEVyze7ew9UqJsExyTkcXY7yq9At8d?=
 =?us-ascii?Q?MG2pLkPlC5+g51xixvML8AxIaNLZhq2kH0V4chSC/JPA1PC/kzEz0j4Jv7QW?=
 =?us-ascii?Q?tweKzHHs1cK18/VLe8GweQJK3XCrCrSzMvBJvRP8qrpeMsfxbDCRmXqF/MOi?=
 =?us-ascii?Q?Mxxi190XSvSHT9wOjnOQmWbGH42AItO3MS9uct/DpD22kRSxaqOl66xi5fDP?=
 =?us-ascii?Q?wtAbGiUeduEyqNbmrNVsU+oHy7dEke0Zb0xH78wQ/wNoWwrJ+Id+UlkVRK+o?=
 =?us-ascii?Q?lVmup2lsrrDI9Kt9z0ujs9KJRwpOoZr7fsUh6EhD1eYMKhZ6Y99cI08qXjfp?=
 =?us-ascii?Q?b73NDl33M7AH+mQrHsvkBafxxNsWIsx8Ylmbv7V54QquML/L88eKqBJtLpCw?=
 =?us-ascii?Q?OGjYBbu5IK4W3RBTNl5PS1oipcrW4+s/5j74iOokGBABLLJTbFogFpzBwqc8?=
 =?us-ascii?Q?vx22v5FNkxRmqLNI0kFypbO1pwZviMVzNH7eNRlX7ZW4erxbPQVoFcfv6lNG?=
 =?us-ascii?Q?b4RoorNdtK9fcBS4s5DGCdYobERW2zBK/oWxeSf9ai2SdrKV7C3rRsx00dwR?=
 =?us-ascii?Q?x+00A5JM5UflArRjtEEEc7SYhhfk8/RoUrAe9XwNrrKOOnOMK3bCQ2lFVp7p?=
 =?us-ascii?Q?vNLG8zprMfVSFaG++kizl0ttvXRXn7L7N9JNKENtx0pKNSwvk0Q953YD0VSX?=
 =?us-ascii?Q?fR4FesFTQV5bwgm/zujMMOed86eQu7Pw9FwxRO1NjMBfpnPhsSz6xumCE1OQ?=
 =?us-ascii?Q?+uHiVQ2u/rlUhOFIE8VNlVO6Dd8yv3v6ADAzl7+qGwb8HwL84hZOvxsDtnmz?=
 =?us-ascii?Q?4H8+fTaPxMcNjncm5C932s7m6wiaCf8D9FlCxKK6f8qFn6hQK+q3YjMklHRa?=
 =?us-ascii?Q?lwDUMtSk326qoEuapltRkrn0pngNszjr7+b+5a9W0T1mLbb7mDbrW8Lww67y?=
 =?us-ascii?Q?T+QrHHXSy1BtOlUOLiWjmyUaNt8aJWIWAzLIHioDmJs84wcPqaY3uHJ+uxX4?=
 =?us-ascii?Q?yOj6Yy3n7uVBcMTPBqdeP0Uh0A/CGpAK8+OdOTItkWxxaqszwQIutoWqYmeM?=
 =?us-ascii?Q?OBTfdbJdKuv1LgE4x0fA4Rt6y4RVDQxh14SBzDB+qdAa5jWkaD+6mAQpy201?=
 =?us-ascii?Q?pIW1psVZTpY5S7BrTjYYEq34uEIDUm4K9GJynCCrKXi/cPES7uvcED/8DolH?=
 =?us-ascii?Q?vi6XO2GPaUK9Znyff1SB7D+MK4qeX6xyAqR8IrKajnvwFvQhVQaO2BDdnWe+?=
 =?us-ascii?Q?VylLsjkoI3blI4KPK7xtiw8sFgcYdcaTbqfPz8LguaHEAc9aOAEQ097U2Kod?=
 =?us-ascii?Q?4Toq6iG2wy3PdAUrdZvwiv6K8nv2pfREIlUK8Abbrki6JwOG/1VjspwXTakc?=
 =?us-ascii?Q?JKC1u/lBkHN+IJF8S7h5MB21UHHsBwz0EC/YxYpMwzvpXYpTYF6Yu8+izdpK?=
 =?us-ascii?Q?prB9Tx+VbRS4UE1gE8T4MLNE8aKr3jCsIxRxrhomwU45iObJPY8fexGc+Jnq?=
 =?us-ascii?Q?eGaVtypItr+tH7neGE1H1ptTBVxfWohlLOTA?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:59:13.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8429f0-6abb-49f7-f45d-08dd8c84a819
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5918
X-Authority-Analysis: v=2.4 cv=KoJN2XWN c=1 sm=1 tr=0 ts=6819dd7e cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=_UruoEx0gL58JRCOsKwA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NSBTYWx0ZWRfX632TYbpgpayb eOvhd6SuXRhPee6wXZwstAQT4ERCWl3D/jnXMROdO4N256AnB7Fga+S4cwXZGUnpGpQkoBMhUSU hGPd0vP1a7H2nisSfMp+y+3eXJFOLREApGJpEV/cmQ9Vj9y/AuWSqfiUqyh+byr8s1RG8KQCZzn
 Nwup91Vh32znCHRB6qELtmK1LNahIBa+3gI/CjyHu4c9H9lspdw8nO5RC6YhKheYyPvP6cwwewH xbMoieTrFxQ49BRqHqFaIe4CX0wLhPoFS3EFMtEWFivIwvCV3EClRN3s+3nr7B6uKlSrY9jKo6d 6/p0gyuJfJE9Lr/YuXn53xYuZ+qdOWcq/G9yQ9NCU227d93qWBlWiNV5FwbGTkqgkoXOsoehTKL
 7dikS3MrY2jzFcbCY2paHQoij1aMlpsPQxDfw3s7DlWvpRtFrbrj05SUVHYN2cr44ypDbUca
X-Proofpoint-ORIG-GUID: l3PbjQjKPPtD15IIQjMYGpA-ML2Bo_UV
X-Proofpoint-GUID: l3PbjQjKPPtD15IIQjMYGpA-ML2Bo_UV
X-Proofpoint-Spam-Reason: safe

CS35L63 uses a similar control interface to CS35L56 so support for
it can be added into the CS35L56 driver.
New regmap configs have been added to support CS35L63.
CS35L63 only has SoundWire and I2C control interfaces.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  12 +++
 sound/soc/codecs/cs35l56-i2c.c    |   6 ++
 sound/soc/codecs/cs35l56-sdw.c    |  74 ++++++++++++++++++
 sound/soc/codecs/cs35l56-shared.c | 123 +++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l56.c        |  23 ++++++
 sound/soc/codecs/cs35l56.h        |   1 +
 6 files changed, 237 insertions(+), 2 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 3abe4fbd2085..e16e1a94c8a1 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -104,6 +104,15 @@
 #define CS35L56_DSP1_PMEM_0				0x3800000
 #define CS35L56_DSP1_PMEM_5114				0x3804FE8
 
+#define CS35L63_DSP1_FW_VER				CS35L56_DSP1_FW_VER
+#define CS35L63_DSP1_HALO_STATE				0x280396C
+#define CS35L63_DSP1_PM_CUR_STATE			0x28042C8
+#define CS35L63_PROTECTION_STATUS			0x340009C
+#define CS35L63_TRANSDUCER_ACTUAL_PS			0x34000F4
+#define CS35L63_MAIN_RENDER_USER_MUTE			0x3400020
+#define CS35L63_MAIN_RENDER_USER_VOLUME			0x3400028
+#define CS35L63_MAIN_POSTURE_NUMBER			0x3400068
+
 /* DEVID */
 #define CS35L56_DEVID_MASK				0x00FFFFFF
 
@@ -322,8 +331,11 @@ static inline bool cs35l56_is_spi(struct cs35l56_base *cs35l56)
 extern const struct regmap_config cs35l56_regmap_i2c;
 extern const struct regmap_config cs35l56_regmap_spi;
 extern const struct regmap_config cs35l56_regmap_sdw;
+extern const struct regmap_config cs35l63_regmap_i2c;
+extern const struct regmap_config cs35l63_regmap_sdw;
 
 extern const struct cs35l56_fw_reg cs35l56_fw_reg;
+extern const struct cs35l56_fw_reg cs35l63_fw_reg;
 
 extern const struct cirrus_amp_cal_controls cs35l56_calibration_controls;
 
diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 38c391d11c78..073f1796ae29 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -37,6 +37,10 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		regmap_config = &cs35l56_regmap_i2c;
 		cs35l56->base.fw_reg = &cs35l56_fw_reg;
 		break;
+	case 0x3563:
+		regmap_config = &cs35l63_regmap_i2c;
+		cs35l56->base.fw_reg = &cs35l63_fw_reg;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -69,6 +73,7 @@ static void cs35l56_i2c_remove(struct i2c_client *client)
 
 static const struct i2c_device_id cs35l56_id_i2c[] = {
 	{ "cs35l56", 0x3556 },
+	{ "cs35l63", 0x3563 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
@@ -76,6 +81,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
 	{ "CSC355C", 0x3556 },
+	{ "CSC356C", 0x3563 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 2e0422b41385..13f602f51bf3 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -393,6 +393,74 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 	return 0;
 }
 
+static int cs35l63_sdw_kick_divider(struct cs35l56_private *cs35l56,
+				    struct sdw_slave *peripheral)
+{
+	unsigned int curr_scale_reg, next_scale_reg;
+	int curr_scale, next_scale, ret;
+
+	if (!cs35l56->base.init_done)
+		return 0;
+
+	if (peripheral->bus->params.curr_bank) {
+		curr_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B1;
+		next_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B0;
+	} else {
+		curr_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B0;
+		next_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B1;
+	}
+
+	/*
+	 * Current clock scale value must be different to new value.
+	 * Modify current to guarantee this. If next still has the dummy
+	 * value we wrote when it was current, the core code has not set
+	 * a new scale so restore its original good value
+	 */
+	curr_scale = sdw_read_no_pm(peripheral, curr_scale_reg);
+	if (curr_scale < 0) {
+		dev_err(cs35l56->base.dev, "Failed to read current clock scale: %d\n", curr_scale);
+		return curr_scale;
+	}
+
+	next_scale = sdw_read_no_pm(peripheral, next_scale_reg);
+	if (next_scale < 0) {
+		dev_err(cs35l56->base.dev, "Failed to read next clock scale: %d\n", next_scale);
+		return next_scale;
+	}
+
+	if (next_scale == CS35L56_SDW_INVALID_BUS_SCALE) {
+		next_scale = cs35l56->old_sdw_clock_scale;
+		ret = sdw_write_no_pm(peripheral, next_scale_reg, next_scale);
+		if (ret < 0) {
+			dev_err(cs35l56->base.dev, "Failed to modify current clock scale: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	cs35l56->old_sdw_clock_scale = curr_scale;
+	ret = sdw_write_no_pm(peripheral, curr_scale_reg, CS35L56_SDW_INVALID_BUS_SCALE);
+	if (ret < 0) {
+		dev_err(cs35l56->base.dev, "Failed to modify current clock scale: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(cs35l56->base.dev, "Next bus scale: %#x\n", next_scale);
+
+	return 0;
+}
+
+static int cs35l56_sdw_bus_config(struct sdw_slave *peripheral,
+				  struct sdw_bus_params *params)
+{
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+
+	if ((cs35l56->base.type == 0x63) && (cs35l56->base.rev < 0xa1))
+		return cs35l63_sdw_kick_divider(cs35l56, peripheral);
+
+	return 0;
+}
+
 static int __maybe_unused cs35l56_sdw_clk_stop(struct sdw_slave *peripheral,
 					       enum sdw_clk_stop_mode mode,
 					       enum sdw_clk_stop_type type)
@@ -408,6 +476,7 @@ static const struct sdw_slave_ops cs35l56_sdw_ops = {
 	.read_prop = cs35l56_sdw_read_prop,
 	.interrupt_callback = cs35l56_sdw_interrupt,
 	.update_status = cs35l56_sdw_update_status,
+	.bus_config = cs35l56_sdw_bus_config,
 #ifdef DEBUG
 	.clk_stop = cs35l56_sdw_clk_stop,
 #endif
@@ -528,6 +597,10 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 		regmap_config = &cs35l56_regmap_sdw;
 		cs35l56->base.fw_reg = &cs35l56_fw_reg;
 		break;
+	case 0x3563:
+		regmap_config = &cs35l63_regmap_sdw;
+		cs35l56->base.fw_reg = &cs35l63_fw_reg;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -575,6 +648,7 @@ static const struct dev_pm_ops cs35l56_sdw_pm = {
 static const struct sdw_device_id cs35l56_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
 	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
+	SDW_SLAVE_ENTRY(0x01FA, 0x3563, 0x3563),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index da982774bb4d..76ddb1cf6889 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -47,6 +47,13 @@ static const struct reg_sequence cs35l56_patch_fw[] = {
 	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
 };
 
+static const struct reg_sequence cs35l63_patch_fw[] = {
+	/* These are not reset by a soft-reset, so patch to defaults. */
+	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
+	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
+	{ CS35L63_MAIN_POSTURE_NUMBER,		0x00000000 },
+};
+
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 {
 	int ret;
@@ -64,6 +71,10 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 		ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch_fw,
 					    ARRAY_SIZE(cs35l56_patch_fw));
 		break;
+	case 0x63:
+		ret = regmap_register_patch(cs35l56_base->regmap, cs35l63_patch_fw,
+					    ARRAY_SIZE(cs35l63_patch_fw));
+		break;
 	default:
 		break;
 	}
@@ -102,6 +113,36 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
 };
 
+static const struct reg_default cs35l63_reg_defaults[] = {
+	/* no defaults for OTP_MEM - first read populates cache */
+
+	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
+	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
+	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
+	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
+	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
+	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
+	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
+	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
+	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
+	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
+	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
+	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
+	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
+	{ CS35L56_IRQ1_MASK_1,			0x8003ffff },
+	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
+	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
+	{ CS35L56_IRQ1_MASK_8,			0x8c000fff },
+	{ CS35L56_IRQ1_MASK_18,			0x0760f000 },
+	{ CS35L56_IRQ1_MASK_20,			0x15c00000 },
+	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
+	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
+	{ CS35L63_MAIN_POSTURE_NUMBER,		0x00000000 },
+};
+
 static bool cs35l56_is_dsp_memory(unsigned int reg)
 {
 	switch (reg) {
@@ -199,7 +240,7 @@ static bool cs35l56_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
+static bool cs35l56_common_volatile_reg(unsigned int reg)
 {
 	switch (reg) {
 	case CS35L56_DEVID:
@@ -237,12 +278,32 @@ static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L56_DSP1_SCRATCH3:
 	case CS35L56_DSP1_SCRATCH4:
 		return true;
+	default:
+		return cs35l56_is_dsp_memory(reg);
+	}
+}
+
+static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
 	case CS35L56_MAIN_RENDER_USER_MUTE:
 	case CS35L56_MAIN_RENDER_USER_VOLUME:
 	case CS35L56_MAIN_POSTURE_NUMBER:
 		return false;
 	default:
-		return cs35l56_is_dsp_memory(reg);
+		return cs35l56_common_volatile_reg(reg);
+	}
+}
+
+static bool cs35l63_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS35L63_MAIN_RENDER_USER_MUTE:
+	case CS35L63_MAIN_RENDER_USER_VOLUME:
+	case CS35L63_MAIN_POSTURE_NUMBER:
+		return false;
+	default:
+		return cs35l56_common_volatile_reg(reg);
 	}
 }
 
@@ -405,6 +466,11 @@ static const struct reg_sequence cs35l56_system_reset_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
 };
 
+static const struct reg_sequence cs35l63_system_reset_seq[] = {
+	REG_SEQ0(CS35L63_DSP1_HALO_STATE, 0),
+	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
+};
+
 void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 {
 	/*
@@ -426,6 +492,11 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 						cs35l56_system_reset_seq,
 						ARRAY_SIZE(cs35l56_system_reset_seq));
 		break;
+	case 0x63:
+		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+						cs35l63_system_reset_seq,
+						ARRAY_SIZE(cs35l63_system_reset_seq));
+		break;
 	default:
 		break;
 	}
@@ -844,6 +915,9 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 	case 0x35A56:
 	case 0x35A57:
 		break;
+	case 0x35A630:
+		devid = devid >> 4;
+		break;
 	default:
 		dev_err(cs35l56_base->dev, "Unknown device %x\n", devid);
 		return ret;
@@ -1080,6 +1154,39 @@ const struct regmap_config cs35l56_regmap_sdw = {
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, "SND_SOC_CS35L56_SHARED");
 
+const struct regmap_config cs35l63_regmap_i2c = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_base = 0x8000,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = CS35L56_DSP1_PMEM_5114,
+	.reg_defaults = cs35l63_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cs35l63_reg_defaults),
+	.volatile_reg = cs35l63_volatile_reg,
+	.readable_reg = cs35l56_readable_reg,
+	.precious_reg = cs35l56_precious_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+EXPORT_SYMBOL_NS_GPL(cs35l63_regmap_i2c, "SND_SOC_CS35L56_SHARED");
+
+const struct regmap_config cs35l63_regmap_sdw = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = CS35L56_DSP1_PMEM_5114,
+	.reg_defaults = cs35l63_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cs35l63_reg_defaults),
+	.volatile_reg = cs35l63_volatile_reg,
+	.readable_reg = cs35l56_readable_reg,
+	.precious_reg = cs35l56_precious_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+EXPORT_SYMBOL_NS_GPL(cs35l63_regmap_sdw, "SND_SOC_CS35L56_SHARED");
+
 const struct cs35l56_fw_reg cs35l56_fw_reg = {
 	.fw_ver = CS35L56_DSP1_FW_VER,
 	.halo_state = CS35L56_DSP1_HALO_STATE,
@@ -1092,6 +1199,18 @@ const struct cs35l56_fw_reg cs35l56_fw_reg = {
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_fw_reg, "SND_SOC_CS35L56_SHARED");
 
+const struct cs35l56_fw_reg cs35l63_fw_reg = {
+	.fw_ver = CS35L63_DSP1_FW_VER,
+	.halo_state = CS35L63_DSP1_HALO_STATE,
+	.pm_cur_stat = CS35L63_DSP1_PM_CUR_STATE,
+	.prot_sts = CS35L63_PROTECTION_STATUS,
+	.transducer_actual_ps = CS35L63_TRANSDUCER_ACTUAL_PS,
+	.user_mute = CS35L63_MAIN_RENDER_USER_MUTE,
+	.user_volume = CS35L63_MAIN_RENDER_USER_VOLUME,
+	.posture_number = CS35L63_MAIN_POSTURE_NUMBER,
+};
+EXPORT_SYMBOL_NS_GPL(cs35l63_fw_reg, "SND_SOC_CS35L56_SHARED");
+
 MODULE_DESCRIPTION("ASoC CS35L56 Shared");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index a4a1d09097fc..cdb283ed938c 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -84,6 +84,25 @@ static const struct snd_kcontrol_new cs35l56_controls[] = {
 		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
 };
 
+static const struct snd_kcontrol_new cs35l63_controls[] = {
+	SOC_SINGLE_EXT("Speaker Switch",
+		       CS35L63_MAIN_RENDER_USER_MUTE, 0, 1, 1,
+		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
+	SOC_SINGLE_S_EXT_TLV("Speaker Volume",
+			     CS35L63_MAIN_RENDER_USER_VOLUME,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
+			     0,
+			     cs35l56_dspwait_get_volsw,
+			     cs35l56_dspwait_put_volsw,
+			     vol_tlv),
+	SOC_SINGLE_EXT("Posture Number", CS35L63_MAIN_POSTURE_NUMBER,
+		       0, 255, 0,
+		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
+};
+
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx1_enum,
 				  CS35L56_ASP1TX1_INPUT,
 				  0, CS35L56_ASP_TXn_SRC_MASK,
@@ -886,6 +905,10 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 		ret = snd_soc_add_component_controls(component, cs35l56_controls,
 						     ARRAY_SIZE(cs35l56_controls));
 		break;
+	case 0x63:
+		ret = snd_soc_add_component_controls(component, cs35l63_controls,
+						     ARRAY_SIZE(cs35l63_controls));
+		break;
 	default:
 		ret = -ENODEV;
 		break;
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 8a987ec01507..200f695efca3 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -51,6 +51,7 @@ struct cs35l56_private {
 	u8 asp_slot_count;
 	bool tdm_mode;
 	bool sysclk_set;
+	u8 old_sdw_clock_scale;
 };
 
 extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
-- 
2.43.0

