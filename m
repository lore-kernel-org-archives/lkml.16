Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1271F8AE5;
	Mon,  7 Apr 2025 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039147; cv=fail; b=MyTJNc5m8lQU417F78AMvEhFf/24by5CPR9ckceCi3nEeFUqGzXewEq+1/ataSSqWkZg9rNriHeO4QtrzajA9k63WOEmYWqOfpb0TjyyXRMC05MmvwrWdV0nf3AE0a0nBdCoYEcsKsT2jZkJVD2/EUE42s+r4WahaFMOMbK/8D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039147; c=relaxed/simple;
	bh=APbcDRaBtdRyWQA6iHzETchws4K1dtqZTwssNlTe4Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyO9WOTmTPLkEEjYbGXVkpwymZ5dBqSGAKdPJnh6CxxhvBiWodTLbMC5JCUFplfDAPpk5u5LSIA7B3HFtVNF5TURkhLQOp00UPyc7XwZ7PlLVrHGFo23/UFHJJMkBVwj5OSy4Olnq1xXyu8/ZuRs7lgvrDbLgPSdVZKOl3qJzqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MqL3D256; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eFoAA3sq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MqL3D256";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eFoAA3sq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5374i0Xc031389;
	Mon, 7 Apr 2025 10:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OfEq3kMo/guaL8cyQu+CbHXQ4Nuqef53w6mjdQGSA4s=; b=
	MqL3D256d/LH8NbXotVLHZhDoLQbMe9VtnspExDkply5/PgTIXTNQTiaMxuXeZOR
	ft5vwuDF6+d0rT+DEvA/YDBKjGbuS5CP3isCyu8h+bMzVLJB3djta8rSE8IqKSHi
	kJu0mCBp3RmIItLhSPV19v9Ovdv806E6pydms6WghhzmORYelsGzoy+aeHWtdsiG
	EQcgXSE7HlOrGksIIODJnFR65U/ET2Z1mi1Pe/3eOkzZAmEmTqCpl23EbSkxUBMf
	CcS7YzJuGTGTidDOScdGqX3VfLWPJLV8IUDxi0c7nmACmt9WIENVcw5pEyXmG82X
	CKfUkJBI/np1L7PfgeBEow==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45u0xgje9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:19:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5jcDaWJXqbrFtnkf/Pt2LwRPWYcQLAGMvSsrwvwN/W9+kAuToFWz9ceZfWAwTDu1dJJPYlez+5vg1ALTvK+uS+tLYbPgePlKGKIgtQ71aNRBQqEgZpOxgjBQ7vhWGsiMNKcv4UXL/THUeOy63Chk79+HjE2SYgqNjESGCOsk11YsZE49CV3CeZIZ+D8wb5h8Ur8oPo9RED/cbewB2JNv2pPPndv2c+Vkk4VWW996rzQ0vbQgZjsNftLfJlynJGlZsQAjhvBAOiAbGHtxodKEc+SFbSC465vWXx6L24R8dnmDElR4g9rwQr0eYG89YKqqPyDakt2KhnoIzsdqwtlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfEq3kMo/guaL8cyQu+CbHXQ4Nuqef53w6mjdQGSA4s=;
 b=GPy25OX1RbxCcjXyHzJMDd9WhKPO6Zx2FKp8EpyPbdND0pUI7J1gt/tGMVwrzb/zMvxymES7/w89QGoQcPKyI+p2J+65oJInTe9+BvfiuymIXaSlqwucC1zbFF5f4mX1wXrEfHwfeacqR2Mgx/pCpWQBrBV3rmymOrapxG5sW7zHa4aDijTzg+jAq8fFyoSxGeanlGNRyvgZufUGvTIPdv/tD8tXuFpPnqoTo7ZcrwfaCsNkNZu8vPOx0oeYsEIQGOFp7+DqV6LD7jA2izdfH5u0DL9DzmfUG47NoCXYrYIddPnPgQzuBKLKkRu4uaaqnY/BOcRHGkyhH9C8DAQaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfEq3kMo/guaL8cyQu+CbHXQ4Nuqef53w6mjdQGSA4s=;
 b=eFoAA3sqctMRsoCC6TG27sREPeUlRZXKKAyWyKRBPrZ0W+1Qwvaov1utHNBFQchaRYqiOBIUvA+mG1Ojnt/7bOHI5mQD0ovArUuiJzUA6DtdH2xtaSBFSlk7+Gpndd3wUXfjWECSvFawQoOM75y8TFG3a2YgDWBeAA+DX1S9nXw=
Received: from CH0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:b0::10)
 by DM4PR19MB6317.namprd19.prod.outlook.com (2603:10b6:8:a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 15:18:56 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::ba) by CH0PR03CA0005.outlook.office365.com
 (2603:10b6:610:b0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 15:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 15:18:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9D1C940654D;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 748A082255C;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 3/5] ASoC: cs35l56: Add Mute, Volume and Posture registers to firmware register list
Date: Mon,  7 Apr 2025 16:16:42 +0100
Message-ID: <20250407151842.143393-4-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM4PR19MB6317:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f150db46-bf9c-4f39-3c8a-08dd75e78369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qFyjhwlO4c8Yn69SYEzV7t+y9USYP+THLn1XP2esGaYVCSYyd41bh3fzAK0X?=
 =?us-ascii?Q?Xy1q21qLRpimdbghIMB+YuhWGxErsvus6VSkF3A5oWF6y0+4BFoGQfjoriDP?=
 =?us-ascii?Q?oD4rB6mWmQ0ZrBK3C+5o0x//4DUrTw8JdLYqMCWzq87IHi8oyKIIzeChyLcO?=
 =?us-ascii?Q?bzVPT+TPxlG6P+Q19TcTp9SEjNElQpENfFz6ad2Xyu6r7cJD4w3CmtgtHUNA?=
 =?us-ascii?Q?h3Uk12zoHuht5mGjvETF/9QX7+aducnT5Ra//NrO8ili7TRP6EIhl7XuUZ21?=
 =?us-ascii?Q?jS5EQgDtcTaUAo0Ym7mNqsqgCaND6A+hSW2g1lncUnF6IVteFf8Fs6bKoGhw?=
 =?us-ascii?Q?ZeO85OKEfuz27JFcKhI5xWmCbXttEwup3WRTunOi2ZAJWC84mn6zTUR4bHbt?=
 =?us-ascii?Q?8IBo2nksQ44Sop9yWaCUtVoxQSHGC6T57QtGt4UPXUbPk1oSSvbOBOaOFrD7?=
 =?us-ascii?Q?F8y1FPAbjXVYd+AH4TvCeq5LeX8FBWlJTsZu0tNu9oZB3WB3yDViLn8MQGPY?=
 =?us-ascii?Q?YinxWWcn5g0bhHLIYrjMGrGsJNbaSiLs9y+V6nKqRFZD8u2jqGPpKMgTvqVh?=
 =?us-ascii?Q?q2GsxCzr8ai7L+vHclrd3PT2ZKhlmfZZWbYtIIAJJO7Yp5HgfAihfdLhhCoZ?=
 =?us-ascii?Q?8BsWDg84Acbes4CtOdGK1cZJ5ol4cP9IaLiEo0mlQYKnnf5v7YKfdfhHoiJS?=
 =?us-ascii?Q?FKqmBd+7TfvRr2pYUE8Q/rCMINNqbFDdP1MsYBfoFvM9BIwYlkoLlM2j3+hr?=
 =?us-ascii?Q?Zdzn1XpBDWa7sX3B3B6Cm0Z+tlTKVJi6W62iUgP7ehaGinluPR0VagFbCCbv?=
 =?us-ascii?Q?a/YdPDK4CgtUrvxlKF7gJh0VtK8ZcRw+ckdMBJuSaWhwrXT0lo6P0Aqip3LD?=
 =?us-ascii?Q?963/dLpDOJdZUstst8xESQAwT9sZHq9ErRljyHliHMsYbJ7rT9MA7rrPfevS?=
 =?us-ascii?Q?xdcAElg0Q8a/3k7wBDuQhy8mEAkUDPLiD4fXhA2MOTUE73DFfFooMoJS2TC1?=
 =?us-ascii?Q?NF4LPM9kDObqpEGBucnJ1JHcECyndNG5KZbf+afXTz+GqX6s4jFZWW3KfvQm?=
 =?us-ascii?Q?0IrG09WKj+ZOtsb6/1INQlTCHdRMbGmHY2acbigSEYGiRZAUzGDk2MM3zxR/?=
 =?us-ascii?Q?Qy1cRXOelrPuhTCQFx+Lp8LlxGjd9xNMxKFZ+lXiOLgE07uw14is/LijMNCC?=
 =?us-ascii?Q?ZKMHDR3t/p5KziZLCmIj4gtZz3Tz6e8YGZs6nGZM0IYr0cYK+7HwgllpsjCR?=
 =?us-ascii?Q?ZJgtB4BptcA5IFlX2h5xHTWHbpX2swRytmzUafkHYvsU7Xbhg12rsROdYbRC?=
 =?us-ascii?Q?0rOJmC8LlVwU7O+YGQBIYBp8ze7X/0YgmgwsMXorpQCDE918sVTMBqrDbZ5Z?=
 =?us-ascii?Q?H3Fpstb7Vxg8PLswzAqEm3BXJCaXknJVglMZxb3vcX362vbinPxZxKphzxOw?=
 =?us-ascii?Q?2cTC67CGIWYI7+2DEAEBD20kASwxSUs6VNgpo3i0wd1HdnS0D50m0OetY2FJ?=
 =?us-ascii?Q?dJUM00LmcopsuCE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:18:55.5804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f150db46-bf9c-4f39-3c8a-08dd75e78369
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6317
X-Proofpoint-GUID: eP5hOpw7af1gJZmboNQJl1rJTuR6vtg9
X-Authority-Analysis: v=2.4 cv=bOIWIO+Z c=1 sm=1 tr=0 ts=67f3ece5 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=QglkZ7J-TCNlRGhXK3QA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: eP5hOpw7af1gJZmboNQJl1rJTuR6vtg9
X-Proofpoint-Spam-Reason: safe

Registers to set Mute, Volume and Posture are inside firmware,
which means they should be added to the list of registers set inside
firmware, in case they vary across Device or Revision.

These three registers are also used for controls, so additional
handling is required to be able to obtain and set the register inside
ALSA controls.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  3 +++
 sound/pci/hda/cs35l56_hda.c       | 17 +++++++----------
 sound/soc/codecs/cs35l56-shared.c | 25 ++++++++++++++++++++++++-
 sound/soc/codecs/cs35l56.c        | 19 +++++++++++++++++--
 4 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index d712cb79652b..3abe4fbd2085 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -273,6 +273,9 @@ struct cs35l56_fw_reg {
 	unsigned int pm_cur_stat;
 	unsigned int prot_sts;
 	unsigned int transducer_actual_ps;
+	unsigned int user_mute;
+	unsigned int user_volume;
+	unsigned int posture_number;
 };
 
 struct cs35l56_base {
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index f6257fe45b9f..61aba1956338 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -237,7 +237,8 @@ static int cs35l56_hda_posture_get(struct snd_kcontrol *kcontrol,
 
 	cs35l56_hda_wait_dsp_ready(cs35l56);
 
-	ret = regmap_read(cs35l56->base.regmap, CS35L56_MAIN_POSTURE_NUMBER, &pos);
+	ret = regmap_read(cs35l56->base.regmap,
+			  cs35l56->base.fw_reg->posture_number, &pos);
 	if (ret)
 		return ret;
 
@@ -260,10 +261,8 @@ static int cs35l56_hda_posture_put(struct snd_kcontrol *kcontrol,
 
 	cs35l56_hda_wait_dsp_ready(cs35l56);
 
-	ret = regmap_update_bits_check(cs35l56->base.regmap,
-				       CS35L56_MAIN_POSTURE_NUMBER,
-				       CS35L56_MAIN_POSTURE_MASK,
-				       pos, &changed);
+	ret = regmap_update_bits_check(cs35l56->base.regmap, cs35l56->base.fw_reg->posture_number,
+				       CS35L56_MAIN_POSTURE_MASK, pos, &changed);
 	if (ret)
 		return ret;
 
@@ -305,7 +304,7 @@ static int cs35l56_hda_vol_get(struct snd_kcontrol *kcontrol,
 
 	cs35l56_hda_wait_dsp_ready(cs35l56);
 
-	ret = regmap_read(cs35l56->base.regmap, CS35L56_MAIN_RENDER_USER_VOLUME, &raw_vol);
+	ret = regmap_read(cs35l56->base.regmap, cs35l56->base.fw_reg->user_volume, &raw_vol);
 
 	if (ret)
 		return ret;
@@ -339,10 +338,8 @@ static int cs35l56_hda_vol_put(struct snd_kcontrol *kcontrol,
 
 	cs35l56_hda_wait_dsp_ready(cs35l56);
 
-	ret = regmap_update_bits_check(cs35l56->base.regmap,
-				       CS35L56_MAIN_RENDER_USER_VOLUME,
-				       CS35L56_MAIN_RENDER_USER_VOLUME_MASK,
-				       raw_vol, &changed);
+	ret = regmap_update_bits_check(cs35l56->base.regmap, cs35l56->base.fw_reg->user_volume,
+				       CS35L56_MAIN_RENDER_USER_VOLUME_MASK, raw_vol, &changed);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index bc8f9379bc74..da982774bb4d 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -38,7 +38,9 @@ static const struct reg_sequence cs35l56_patch[] = {
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
 	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
+};
 
+static const struct reg_sequence cs35l56_patch_fw[] = {
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
 	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
@@ -47,8 +49,26 @@ static const struct reg_sequence cs35l56_patch[] = {
 
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 {
-	return regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
+	int ret;
+
+	ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
 				     ARRAY_SIZE(cs35l56_patch));
+	if (ret)
+		return ret;
+
+
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch_fw,
+					    ARRAY_SIZE(cs35l56_patch_fw));
+		break;
+	default:
+		break;
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
@@ -1066,6 +1086,9 @@ const struct cs35l56_fw_reg cs35l56_fw_reg = {
 	.pm_cur_stat = CS35L56_DSP1_PM_CUR_STATE,
 	.prot_sts = CS35L56_PROTECTION_STATUS,
 	.transducer_actual_ps = CS35L56_TRANSDUCER_ACTUAL_PS,
+	.user_mute = CS35L56_MAIN_RENDER_USER_MUTE,
+	.user_volume = CS35L56_MAIN_RENDER_USER_VOLUME,
+	.posture_number = CS35L56_MAIN_POSTURE_NUMBER,
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_fw_reg, "SND_SOC_CS35L56_SHARED");
 
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index c1d8bfb803b9..a4a1d09097fc 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -838,6 +838,7 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 	struct dentry *debugfs_root = component->debugfs_root;
 	unsigned short vendor, device;
+	int ret;
 
 	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
 
@@ -877,6 +878,22 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 	debugfs_create_bool("can_hibernate", 0444, debugfs_root, &cs35l56->base.can_hibernate);
 	debugfs_create_bool("fw_patched", 0444, debugfs_root, &cs35l56->base.fw_patched);
 
+
+	switch (cs35l56->base.type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		ret = snd_soc_add_component_controls(component, cs35l56_controls,
+						     ARRAY_SIZE(cs35l56_controls));
+		break;
+	default:
+		ret = -ENODEV;
+		break;
+	}
+
+	if (ret)
+		return dev_err_probe(cs35l56->base.dev, ret, "unable to add controls\n");
+
 	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
 
 	return 0;
@@ -932,8 +949,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l56 = {
 	.num_dapm_widgets = ARRAY_SIZE(cs35l56_dapm_widgets),
 	.dapm_routes = cs35l56_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(cs35l56_audio_map),
-	.controls = cs35l56_controls,
-	.num_controls = ARRAY_SIZE(cs35l56_controls),
 
 	.set_bias_level = cs35l56_set_bias_level,
 
-- 
2.43.0

