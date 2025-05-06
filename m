Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57026FDAA;
	Tue,  6 May 2025 09:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525571; cv=fail; b=k4c6wGgFGs7/shA2uWdYJbv9jthYG0ld0opm24q31oI4Atsos5YbGinlJBhzz+Jg1d4mCTEdJPTcdKEPN43+/BzGD5WZ2rDc258vOPEKQLIOqBkCrtL4rRLgVxRKeAAe9pxWop9wDvA1AD/OXGonbj/URLqWpHT4dklqEHxbwnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525571; c=relaxed/simple;
	bh=NqIUB9WKeNES7sjhNCqmuv3Hr5f0Cb4Cd2JwwTmlD58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQPTWSNkt7MMYf8qpYbop9C4mBnmkv86GY+nUuVeDwPW9ciN5O1l+IugMQVNxZUd4PN+ItLz6XeYZlj5cIF351uSyi4JBjUdKGKa9nkXl3FIMfSYz9h/yghTr42Z9E2w0pwZYUQ2DJji/nI39DlxVFgejhIJGUc8nZN0HHU7NV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Lr0R8lbl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MCKOMM85; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Lr0R8lbl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MCKOMM85"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5460I0Hk010201;
	Tue, 6 May 2025 04:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rS4c3ej823xQWgLmZk2jT7HTuUcX6zfYH0KRV43gbuI=; b=
	Lr0R8lblU9fclUrdPhlKA/1FXIOagZNp2Cr9pnYpklmgu5FB5jrlUPsdEeSzHAZQ
	4I6Ml23rQ1mXVoG4PVevcmaheV9q02MRQENOro6l7MLYodS5fUZIxfMxAom3rXst
	yaMfzsZ+LPGvvg2HOXIVq37ChyeUEprbPHUsGRIPpe6kzJ27Srm7rMnqmdshrl1V
	0UuYun7y/6MsF8aLb9EjFpBbWrNzjmjJdrd8WJgGCdCebKA04wjdtzBtJZ4WRoTl
	Rw0fwnu2+C6vcA0uWJK/kZj9VFgljsqwq/s7LDXhgUcywviFmkVTBAKaOC6GbMiY
	l2Z4XtLTDmIoTc8FSwxZMA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ew4n9dnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:59:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgQWJYuYh7cdv6CRE+jPPs+1Fb/GhwIlh1Z3brsgiparzjinl0SLTcYCKdGEeGh0VHylCmipfgiet7UAS4zYHxfv63WmwsaIwe7XsO14XXZcLds2oepKQm3tISG2xaNh7NoZ2h7mpnvPhTf3vz2Sr0LBgRm1nswBpcFloEy7IOvfOb+TCLSrirSB8iy4VFDkeThP6WHYS9Fkae8W+YYrG+HoCgQRcGxwkGET68nds/RhNUOp8ogY5fXmTxlWTke7vWYfwNIr5Vkj69bHuwve9APRqsuFiGegl2TfMXnr5KF8GXg0yPchp91rS0j4hsPeXmXxKGBB6bRitCU2rh0wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS4c3ej823xQWgLmZk2jT7HTuUcX6zfYH0KRV43gbuI=;
 b=d9MsVsrhSZeJp710G2j/lSzWu0E8sYXA9+EBJaOsqU5+YdaEjxy30Gj1xEAsuSMzwWBUKUUosXnbEH697zetB7OyZvX2SB8hYgt2FKooyuCVkf82UaIcF1RYVdHgLO78pRc/Dx1QgCB59qVJJzqBWMD3KyZJPhjgKBJgLdlKya8+U6tjs1kb6VkbB4yXRajcQXfQ3Wasn4WmCMUSQbu45vO8BOI0sNwVRLtaysivQ23ylKOD9FV+chY2r1pik6JB4pW/5y3wjoCSEdQp8gSfuvUKj0MI576LFxiF2cctCWh16fhHHgyu7DAGfiEnVDdilyCDNH9CrqESjDJIouFwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS4c3ej823xQWgLmZk2jT7HTuUcX6zfYH0KRV43gbuI=;
 b=MCKOMM854a+U0bMx840a6v58pVszwdphBHYSFeShI07D9H766/JLHuVHb4hHI2cd8wb2LeBKSVEPyHBl0HEYzdcDy7SGSQDCEEGwjkd5hcmMicyLBybGjh+NOaSepw8HCU0hxi7C+nzhD2t8VU+oVV20zx38L1x4ywCLua0UOXI=
Received: from PH8P221CA0064.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::16)
 by SJ0PR19MB5384.namprd19.prod.outlook.com (2603:10b6:a03:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 09:59:14 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::2) by PH8P221CA0064.outlook.office365.com
 (2603:10b6:510:349::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 09:59:13 +0000
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
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3F20F40654A;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 158B5820270;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 2/5] ASoC: cs35l56: Add struct to index firmware registers
Date: Tue,  6 May 2025 10:58:47 +0100
Message-ID: <20250506095903.10827-3-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SJ0PR19MB5384:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f5fd4b7c-7196-40de-fa7f-08dd8c84a7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M0d2cjvTh3A1anp12xioTHqWWZLV19nwOvUS/7VZwyY4zdYk46uadE7uWyKd?=
 =?us-ascii?Q?/tj5Cqwo0bgu9LQUZPkR6rCDbOs0JsU19u4QGC4S7wEFzq6dgdNBP2Jwvzj8?=
 =?us-ascii?Q?Nj1+yWQo6/cewaIi67AhfBU2/RKiA0GtE6vcLignknafJ0QIG5Ea9CN5fV3O?=
 =?us-ascii?Q?GL8PrWRiOEe5OTpytFnavn+jmt/27mJolM+uhPB66RqZSbQor41fvneTKfjj?=
 =?us-ascii?Q?reE6RU9xb0TqMiLO+664XFWdcvdqlBxqjt9VmeEPGopNLAGUUkhOUPYnXyxK?=
 =?us-ascii?Q?Nnc+zyMz7kNoDn3/mmWtr1krHdvogeG1PBi2kLzKbZpCWMmCCQQii1bEQz8n?=
 =?us-ascii?Q?re7xpupUmJCj0ANasA/iU3ykLJbdahX1Gh06mF62pXv6P+G20hshPUCeRF9C?=
 =?us-ascii?Q?ALYTJ1/JbrjOoKrcOXsyMB3x8ZSwa3UDzjjkcuAqcNQrOKd7PtI3YgFMgthU?=
 =?us-ascii?Q?Puvh+tYgGOLulGU8lXeS2G1R/wMvFSC+ieYktEQIBO7tvB72htq3PWwUTIVy?=
 =?us-ascii?Q?dp27W5a5pLh+4yC95osB7EqmvkNhhF4PG96jptFjtJFqI0RfGfiSdXIAA0RU?=
 =?us-ascii?Q?P8YvbRu+Vmh3NkSli/v3jp0XhfMjTpLf7Ky8yUZ3R8j/jHB/7nv/hdxUnNvj?=
 =?us-ascii?Q?nwtQUtsKdsFu6RIXPqEu+83SxY+veIB5d4s46+cCsljyXHPdtFYS7e3cBoph?=
 =?us-ascii?Q?ADyDLsHLKKgG8PzdHuZBA6jKRVBd8hfKtB9Mr2e7lmEkwyB2MC2MeL/kLL7P?=
 =?us-ascii?Q?mb7C587JCs69O8MJLcCtp9urr8fVqQDg8XRBWptpOMDqxz2zwAh2jza3DNxu?=
 =?us-ascii?Q?q9vgyOLVx0Nx92nEqOOfj32Nwb1MXeSWswZnykDXMu+7jveTARkn5YtHtXNH?=
 =?us-ascii?Q?Qa+XFKM169+5OkJMXfzmhzyOYu68YmzytZosS5ZqQ9ZdwshQNiE64UKIz/Fy?=
 =?us-ascii?Q?PhTfpRravgnQBLBWLpyj215hiXXao1jtXFpbLIeRmJbUVWQvOp6O10QETvF0?=
 =?us-ascii?Q?3mBWmYOJSLo/Y0G3TxBAsNbJrnXMhPUt7yU7lmmWl0Ez8Q4sNKobYOK6Dy+d?=
 =?us-ascii?Q?xAQcmaYcVcy+8ofwrfikZfkXmu7gzNfm9L5k7Wq7nIGOeAJuJDEBeDnBdVF3?=
 =?us-ascii?Q?+kRTBa7gpdJP0ed9uYdWMJ8p3FX6wni+A9c46W5YoyQh6Q4yhXlM19P9z3ys?=
 =?us-ascii?Q?hXhrBdu7XNzOj+vTPkTTvKnL+81fDcVhCmRAGTdNm08oUaGMEtZRjaXrFm8y?=
 =?us-ascii?Q?CUqWEqQ3hkmLGPFjta88xfMiJyPvilioiwkCvQwcDpAyJ8EuZ3eglEimnBay?=
 =?us-ascii?Q?yd52DigjT3Mp4EcpCJ+xIAfxceMhwXCBp/WrRD4fUUaScoAefQFDJN6NyXHC?=
 =?us-ascii?Q?aADhRKHJhmmEVpjAPGAhMdNgdffiA6dCQ+aTDOOQZ64SKnZKxgP8y/cX4OpI?=
 =?us-ascii?Q?KreY8rt6uh6RLsWjPkptV2stHjReg1P+3mXCit2IrWieXY2ICNJ+tGhblamP?=
 =?us-ascii?Q?ftzt4dDe+yze4lJk5K8aUuGSINEiOGJczaWR?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:59:13.3427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fd4b7c-7196-40de-fa7f-08dd8c84a7da
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5384
X-Authority-Analysis: v=2.4 cv=KoJN2XWN c=1 sm=1 tr=0 ts=6819dd7d cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=2i3JVGJO97D1DHyOKxEA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NSBTYWx0ZWRfX4kDn4qtI6hrf Ugeaz+mkzpc3OnRUSyXabAg0ytn9L742iF3ax4dlcriid3/SipLLmiW+Gi3nfQ5nVf3jwWyrDnQ Uuv8WPFDZFkRl7QE59u7tOA+Pjcpv1EwxYfDE+g4qDZf4viTqM0/p1E+YUSaLDs9HO/9lIzNJgf
 qkPIvaGgZ550ImtUH15yv/mgDI8QFSaRNcxvhs9aS653ppJwbPSV1ti000jiCyNSieLn7QDSOor 4x9j2wQkwzkM/Dt/B6DN8nKdCe46rRNRe46fAf0PBf1K+La5KUKW2mX28aCZsTzMgjqoO2M0npG ntkh/bjCmfWiaYbFs00FDiElzvIPaqWwjUw+i0+YUc0/NIB2qLPr5017EqKo/AEGzFFFaEXF6GR
 hYw1ywF9bH5h1v0VkBTwGtdxZYWwponRtEhXk2heVX5BIzD4S+pstXrsetU0MCZ59nFoSyRy
X-Proofpoint-ORIG-GUID: SBbUvh_jLsdOYidX4AVBhHRrMqqcJ5Rz
X-Proofpoint-GUID: SBbUvh_jLsdOYidX4AVBhHRrMqqcJ5Rz
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
index 235d22049aa9..5660cf7087fe 100644
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
@@ -665,7 +665,8 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 
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

