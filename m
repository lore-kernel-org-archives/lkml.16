Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7991FDA6F;
	Mon,  7 Apr 2025 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039152; cv=fail; b=g85G1qy/ow30d0IArN71W4y6aQGEDhZ31JYR+AIyvl03GnlSZsd3nZne7GecmAlu0gSLL8zHt5fYsgjUToLE7s2ZSSOVp7o2JtNumXkvhQsjE5h54rO/JuKJDyaPps0dpU17rFiOogQj129+ZcSzqmgFLNn8EhFvmLyrXx+mbMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039152; c=relaxed/simple;
	bh=6/Gu/QEbsv7jDJ57vFl3lxmhq8ZaI6KaM0Q0d6Pv7lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iVqy+jUjyPSnx1L6ohQZYKedB4B7PaAnIPdeunB3CkPd61j967uHHFkjDCc8ROc6e/Xdg7aqSpxh/rI50B79D0AcT+2tlukoisaBlsN5CxUezqYdt03R+b6k9Y7FPQXGVwUB06/g2zuqRMdcEf2Upaegye2DrN2dNbB6ZAFDwVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kUpRpRy1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Rxg7hzuc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kUpRpRy1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Rxg7hzuc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537CLFdJ002328;
	Mon, 7 Apr 2025 10:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/ffpUW4N9JClR/nnID+gsV5T/ooBolmtgAXsngtEDec=; b=
	kUpRpRy1vpGGnWJZ9SOqo+8vl09NdP1FgPsL0uJBcr3s0AXar/1W1TJ0g2cJKHL/
	DSHIwDOibqI7RfRRfwDEdnJa/iAq1dMcAExh+tBnwYMMtbYOQB9e63qMmyoxombQ
	kvQWh5Tqb4BE21rbPpRzRTkYlVqutIP4nBC1i8hLCQobLKeR0Bl1fRc00HnIGdWe
	jZZnK+hoJGia+OtRKObsY2N5UWA5SkApb7Ta/YsmHbD8OsACecBGH+Hkgw53nIUU
	v6PMWzfu6tWFHsZsfnkok0uSbqOcYDf8FbpFi7yfM8L04NiGqB9XI2c+FhzUwnd9
	LwVrEmOpayM6fFjb7MN/Vw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwg9rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:19:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkSsxv9mitJjfwEjnUb8NJivvA4X68AOvefRvkT+TBc6TXgkZNW+RJIM3CVh2bx1zKzMRP7WyNWdG3Cu4Hp0PbJOe/9xEYvw1AJQqfIBhVscHo99d0ZULD54G/qwJxWfidDefDvYrCUJnP/HrFi/JrCGiJfP3YclJK7Cn8ESX9MFNx1k5oQkUsfEF7I7m7Llo+MHzXRv6Hi3mSpZqppdEHyUQtbmczuofMsW9f2DUb5kAO/E/c713Svpsvg7Ct5YNc8/Om2EpxSyrUdmEsQ0Ok3qmYek1SYlGIC2Ffoe/J5D40CL067yNNQkTgdjvE0ZGt+MKk9hb15VdsXa6YwcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ffpUW4N9JClR/nnID+gsV5T/ooBolmtgAXsngtEDec=;
 b=X42sWu7NioNAKM7piAQZDyltinSoQEdHi29DspqVYJn8pmDOJ0PQ4wQhspOAgh+ZR7KJhE7XSFMwwOXz93t1v8QZhwbitIWQW8b6Z5wZ0dyzZrGAjdcv3czyZQWcZpYUxsP9t05beKULIiI1RJGZ1EF0jtwGuoCHQEci5/mmQJrKpPGc9epARfF7YjmA2JqOWISXBfDFPiqw4eBbZKPOTBDBYaQ3pm5pGFbsKvfOnET98d1C5plcfeun1mFV8X2pJ71lgXvUrun/fdX9an7KDvHaK0R9SvKU5A4K0bHhB2S6O+zR+RyZp4inJ1wk4Lwz9daoVqp5aXYi+zWP/mveJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ffpUW4N9JClR/nnID+gsV5T/ooBolmtgAXsngtEDec=;
 b=Rxg7hzucw5AutrucUYjUiWYTiVaXaP32rpU7Ip5QauaEUZXBmjCJ509YksWorS7jP4nGSENaNmmVinuaPP3BJJC2jsszuufHJ9Taw/IswufTIOzNqFzqTxSJtN6G9/WWPzT71OKlSycCd0U9DCMLglFNaApx5894beIUlfHrUPA=
Received: from CH2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:610:5a::15)
 by DS7PR19MB8832.namprd19.prod.outlook.com (2603:10b6:8:251::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 15:18:56 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::97) by CH2PR08CA0005.outlook.office365.com
 (2603:10b6:610:5a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Mon,
 7 Apr 2025 15:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 15:18:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7968240654A;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 481B8820244;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware registers
Date: Mon,  7 Apr 2025 16:16:41 +0100
Message-ID: <20250407151842.143393-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DS7PR19MB8832:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 164ee1c3-9bbd-49d9-ef1c-08dd75e78356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ql++0OpVWHHmre0uyt+VDwVHvmjWUm533khstCzy0TowxvgkEYNMv/hmdY0t?=
 =?us-ascii?Q?8ieC3iS1l098Dh9KYRYl/wmXK56m0UeYK+JjeH0XrqoUuElMfH/ICMlzWZy9?=
 =?us-ascii?Q?QOK53ctQ2mRRKwfcCcsPAg+dEc7+jPw4qHp2YrWvgmQG0lxO6GjVRz81xkcY?=
 =?us-ascii?Q?jmby4mOpTSefATbgenhmul0t8tNV6QiBXzx/SeuE2GXFcmhKVnM7PLFUe2/X?=
 =?us-ascii?Q?SS83UCUu6ByloR3X8WoACocM0mYFOLpBSMRnPBLYoA9DyNVNtJGYyvLDSISu?=
 =?us-ascii?Q?vPcXScRjX0oh5Le1mkNVwDl0R1YmvI8cFRUNLh6OGFR6Y0MS+UCOf9MQRGc/?=
 =?us-ascii?Q?7YJO9wjg9Qof6l6ilNdIwCSUz0INsfPnd+8HKRfbYnpE/+HSHoJWH+zOp25J?=
 =?us-ascii?Q?5ZlY54KEkGkIOWwuOlj+R/0wGwhNmK44mIUClCIhjop6ky3v0Xm3O97sPK+8?=
 =?us-ascii?Q?3jsHwlW47q17T9+KkD1h1zV1kU84diNt63CqT0p7+jGlIjxZWs3kQ07V3w1f?=
 =?us-ascii?Q?h+eEl+WMmKUUs0PSwUXuwfay+4ziBVghV99UR8HAh+GdOg1IsnfjlAYONdll?=
 =?us-ascii?Q?Y7QAiRiuw67h2fiNurUW/tTW2i3QBu0xiX7L47CO5aU+1d7brlW1GEOpGefq?=
 =?us-ascii?Q?yxZqiKOjHKIEkHSCoU6J5G4DZZNyQgMtI0rHWth9Oowjc7COroDu0GJA208o?=
 =?us-ascii?Q?Ka8eyHMd/NCwfhl3KVS+20/ucZ2vbSSNI4MkPRQnFHqzGTmGx4/bBGZuXExU?=
 =?us-ascii?Q?DlbduT8d7/8Idnkj1pXswacTmsPHLKAXrBDjc2hFYuH5S+PeDK8LXe6BebsW?=
 =?us-ascii?Q?KdTIZ8+CD4G0u9pERBXb9V0m0oVEVvgiokpMS9rgBMwMw3wVktBXuXdzKZvB?=
 =?us-ascii?Q?ELXZnP6Z+nD/5TBFnPNq1dHq95bFr/LeHbJfnxke9RrXpCCUEuG09od8GoAe?=
 =?us-ascii?Q?yxkRGFvA+NgAItRQJRaLuVMTTBsmWEm0FxZN+tuueIOX0NDOgvMd7Fj/5pMH?=
 =?us-ascii?Q?i/6RMlMGmJnVGkm8SlhIy+Ym+o5PBqIUyQvMB/v7WJPVOnPMjCmGDIKmNmFv?=
 =?us-ascii?Q?MFAQqKdonPiEtWQZD3Bgo6J3Izss6MLgjRhPdgQ4JjD8T1je0fOL0A988hR+?=
 =?us-ascii?Q?x4QMv+0UTTCquUMp7LS6AUML/jNYy7yFXbz8s/XMX5y6DF5/h9S/jH6S15v7?=
 =?us-ascii?Q?qOTDEzsJ0VOU+F5lLzTzh9Z5F3bEwkfJCgkcCjQjOPNgtMZ3pZ8GyTb3ZZOi?=
 =?us-ascii?Q?e+RE9V+a660O7PZRAXSfaXv159uQ3KUT5ER7YvW9G2PxU/Y63NoUHH7V5NEr?=
 =?us-ascii?Q?tKSd8Z5DZ7MCyvwSx0/IoDmcqMJx3RxvqlC7ZxfyhZlGAepF17k+F3ou3g3B?=
 =?us-ascii?Q?C+QKJ4O0WLPiuaOSr0+fU5fQC/s2vJv4GjCINT66/W2vTjEoU3lm92o/Cqik?=
 =?us-ascii?Q?UJwypkMTe6dZaPv4MI8ENoHrZBPuHkilj7bEiwBSuo/DJy3S2DzZqSy7CDqQ?=
 =?us-ascii?Q?VRbJvNL9M4CRhRA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:18:55.5542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164ee1c3-9bbd-49d9-ef1c-08dd75e78356
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8832
X-Proofpoint-GUID: gwVWaq3amToPbO59xjGvY2N-i7JfU3nZ
X-Proofpoint-ORIG-GUID: gwVWaq3amToPbO59xjGvY2N-i7JfU3nZ
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f3ecea cx=c_pps a=eKE3A02riAhCxcKrmNn0fw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=2i3JVGJO97D1DHyOKxEA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Firmware based registers may be different addresses across different
device ids and revision ids. Create a structure to store and access
these addresses.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l56.h           | 11 ++++++++
 sound/pci/hda/cs35l56_hda.c       |  5 ++--
 sound/pci/hda/cs35l56_hda_i2c.c   |  3 +++
 sound/pci/hda/cs35l56_hda_spi.c   |  3 +++
 sound/soc/codecs/cs35l56-i2c.c    |  1 +
 sound/soc/codecs/cs35l56-sdw.c    |  1 +
 sound/soc/codecs/cs35l56-shared.c | 42 ++++++++++++++++++++++++-------
 sound/soc/codecs/cs35l56-spi.c    |  3 +++
 sound/soc/codecs/cs35l56.c        |  5 ++--
 9 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 5d653a3491d0..d712cb79652b 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -267,6 +267,14 @@ struct cs35l56_spi_payload {
 } __packed;
 static_assert(sizeof(struct cs35l56_spi_payload) == 10);
 
+struct cs35l56_fw_reg {
+	unsigned int fw_ver;
+	unsigned int halo_state;
+	unsigned int pm_cur_stat;
+	unsigned int prot_sts;
+	unsigned int transducer_actual_ps;
+};
+
 struct cs35l56_base {
 	struct device *dev;
 	struct regmap *regmap;
@@ -283,6 +291,7 @@ struct cs35l56_base {
 	struct cirrus_amp_cal_data cal_data;
 	struct gpio_desc *reset_gpio;
 	struct cs35l56_spi_payload *spi_payload_buf;
+	const struct cs35l56_fw_reg *fw_reg;
 };
 
 static inline bool cs35l56_is_otp_register(unsigned int reg)
@@ -311,6 +320,8 @@ extern const struct regmap_config cs35l56_regmap_i2c;
 extern const struct regmap_config cs35l56_regmap_spi;
 extern const struct regmap_config cs35l56_regmap_sdw;
 
+extern const struct cs35l56_fw_reg cs35l56_fw_reg;
+
 extern const struct cirrus_amp_cal_controls cs35l56_calibration_controls;
 
 extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 4ef7878e8fd4..f6257fe45b9f 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -68,7 +68,7 @@ static void cs35l56_hda_play(struct cs35l56_hda *cs35l56)
 	if (ret == 0) {
 		/* Wait for firmware to enter PS0 power state */
 		ret = regmap_read_poll_timeout(cs35l56->base.regmap,
-					       CS35L56_TRANSDUCER_ACTUAL_PS,
+					       cs35l56->base.fw_reg->transducer_actual_ps,
 					       val, (val == CS35L56_PS0),
 					       CS35L56_PS0_POLL_US,
 					       CS35L56_PS0_TIMEOUT_US);
@@ -667,7 +667,8 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 
 	regcache_sync(cs35l56->base.regmap);
 
-	regmap_clear_bits(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS,
+	regmap_clear_bits(cs35l56->base.regmap,
+			  cs35l56->base.fw_reg->prot_sts,
 			  CS35L56_FIRMWARE_MISSING);
 	cs35l56->base.fw_patched = true;
 
diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index c7b836613149..d10209e4eddd 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -26,6 +26,9 @@ static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
 #ifdef CS35L56_WAKE_HOLD_TIME_US
 	cs35l56->base.can_hibernate = true;
 #endif
+
+	cs35l56->base.fw_reg = &cs35l56_fw_reg;
+
 	cs35l56->base.regmap = devm_regmap_init_i2c(clt, &cs35l56_regmap_i2c);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
index 903578466905..f57533d3d728 100644
--- a/sound/pci/hda/cs35l56_hda_spi.c
+++ b/sound/pci/hda/cs35l56_hda_spi.c
@@ -29,6 +29,9 @@ static int cs35l56_hda_spi_probe(struct spi_device *spi)
 #ifdef CS35L56_WAKE_HOLD_TIME_US
 	cs35l56->base.can_hibernate = true;
 #endif
+
+	cs35l56->base.fw_reg = &cs35l56_fw_reg;
+
 	cs35l56->base.regmap = devm_regmap_init_spi(spi, &cs35l56_regmap_spi);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 5962914e2180..38c391d11c78 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -35,6 +35,7 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 	switch (id) {
 	case 0x3556:
 		regmap_config = &cs35l56_regmap_i2c;
+		cs35l56->base.fw_reg = &cs35l56_fw_reg;
 		break;
 	default:
 		return -ENODEV;
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index d178357e1196..2e0422b41385 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -526,6 +526,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 	case 0x3556:
 	case 0x3557:
 		regmap_config = &cs35l56_regmap_sdw;
+		cs35l56->base.fw_reg = &cs35l56_fw_reg;
 		break;
 	default:
 		return -ENODEV;
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e28bfefa72f3..bc8f9379bc74 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -253,7 +253,8 @@ int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base)
 	if (ret)
 		return ret;
 
-	ret = regmap_read_poll_timeout(cs35l56_base->regmap,  CS35L56_DSP1_PM_CUR_STATE,
+	ret = regmap_read_poll_timeout(cs35l56_base->regmap,
+				       cs35l56_base->fw_reg->pm_cur_stat,
 				       val, (val == CS35L56_HALO_STATE_SHUTDOWN),
 				       CS35L56_HALO_STATE_POLL_US,
 				       CS35L56_HALO_STATE_TIMEOUT_US);
@@ -278,7 +279,9 @@ int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
 				     CS35L56_HALO_STATE_POLL_US,
 				     CS35L56_HALO_STATE_TIMEOUT_US,
 				     false,
-				     cs35l56_base->regmap, CS35L56_DSP1_HALO_STATE, &val);
+				     cs35l56_base->regmap,
+				     cs35l56_base->fw_reg->halo_state,
+				     &val);
 
 	if (poll_ret) {
 		dev_err(cs35l56_base->dev, "Firmware boot timed out(%d): HALO_STATE=%#x\n",
@@ -395,9 +398,17 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 		return;
 	}
 
-	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
-					cs35l56_system_reset_seq,
-					ARRAY_SIZE(cs35l56_system_reset_seq));
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+						cs35l56_system_reset_seq,
+						ARRAY_SIZE(cs35l56_system_reset_seq));
+		break;
+	default:
+		break;
+	}
 
 	/* On SoundWire the registers won't be accessible until it re-enumerates. */
 	if (is_soundwire)
@@ -514,7 +525,9 @@ int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 		return ret;
 	}
 
-	ret = regmap_read(cs35l56_base->regmap, CS35L56_PROTECTION_STATUS, &val);
+	ret = regmap_read(cs35l56_base->regmap,
+			  cs35l56_base->fw_reg->prot_sts,
+			  &val);
 	if (ret)
 		dev_err(cs35l56_base->dev, "Failed to read PROTECTION_STATUS: %d\n", ret);
 	else
@@ -562,7 +575,7 @@ int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base)
 
 	/* Firmware must have entered a power-save state */
 	ret = regmap_read_poll_timeout(cs35l56_base->regmap,
-				       CS35L56_TRANSDUCER_ACTUAL_PS,
+				       cs35l56_base->fw_reg->transducer_actual_ps,
 				       val, (val >= CS35L56_PS3),
 				       CS35L56_PS3_POLL_US,
 				       CS35L56_PS3_TIMEOUT_US);
@@ -752,7 +765,8 @@ int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 	unsigned int prot_status;
 	int ret;
 
-	ret = regmap_read(cs35l56_base->regmap, CS35L56_PROTECTION_STATUS, &prot_status);
+	ret = regmap_read(cs35l56_base->regmap,
+			  cs35l56_base->fw_reg->prot_sts, &prot_status);
 	if (ret) {
 		dev_err(cs35l56_base->dev, "Get PROTECTION_STATUS failed: %d\n", ret);
 		return ret;
@@ -760,7 +774,8 @@ int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 
 	*fw_missing = !!(prot_status & CS35L56_FIRMWARE_MISSING);
 
-	ret = regmap_read(cs35l56_base->regmap, CS35L56_DSP1_FW_VER, fw_version);
+	ret = regmap_read(cs35l56_base->regmap,
+			  cs35l56_base->fw_reg->fw_ver, fw_version);
 	if (ret) {
 		dev_err(cs35l56_base->dev, "Get FW VER failed: %d\n", ret);
 		return ret;
@@ -1045,6 +1060,15 @@ const struct regmap_config cs35l56_regmap_sdw = {
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, "SND_SOC_CS35L56_SHARED");
 
+const struct cs35l56_fw_reg cs35l56_fw_reg = {
+	.fw_ver = CS35L56_DSP1_FW_VER,
+	.halo_state = CS35L56_DSP1_HALO_STATE,
+	.pm_cur_stat = CS35L56_DSP1_PM_CUR_STATE,
+	.prot_sts = CS35L56_PROTECTION_STATUS,
+	.transducer_actual_ps = CS35L56_TRANSDUCER_ACTUAL_PS,
+};
+EXPORT_SYMBOL_NS_GPL(cs35l56_fw_reg, "SND_SOC_CS35L56_SHARED");
+
 MODULE_DESCRIPTION("ASoC CS35L56 Shared");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index ca6c03a8766d..c2ddee22cd23 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -25,6 +25,9 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	spi_set_drvdata(spi, cs35l56);
+
+	cs35l56->base.fw_reg = &cs35l56_fw_reg;
+
 	cs35l56->base.regmap = devm_regmap_init_spi(spi, regmap_config);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index b3158a84b87a..c1d8bfb803b9 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -174,7 +174,7 @@ static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		/* Wait for firmware to enter PS0 power state */
 		ret = regmap_read_poll_timeout(cs35l56->base.regmap,
-					       CS35L56_TRANSDUCER_ACTUAL_PS,
+					       cs35l56->base.fw_reg->transducer_actual_ps,
 					       val, (val == CS35L56_PS0),
 					       CS35L56_PS0_POLL_US,
 					       CS35L56_PS0_TIMEOUT_US);
@@ -760,7 +760,8 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 		goto err_unlock;
 	}
 
-	regmap_clear_bits(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS,
+	regmap_clear_bits(cs35l56->base.regmap,
+			  cs35l56->base.fw_reg->prot_sts,
 			  CS35L56_FIRMWARE_MISSING);
 	cs35l56->base.fw_patched = true;
 
-- 
2.43.0

