Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4365B26D4D3;
	Tue,  6 May 2025 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525570; cv=fail; b=BY+dFWh+IqibZhRQidEu2AYvfPH/c8lng1EEKlJmxKzZeRCqPW7CO0TXVFa3bOXY596fADwc7zSWo9Mpr3PA5mnHLnnXBBtv5iDz/hZzLGghouJcAMROxfwhMItfYAlMF1eZs+eUIW2UetdnKecym5ZYMrfRq762Lc/FpFiKgds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525570; c=relaxed/simple;
	bh=el4lnsOYczckEfw3PyPzPpqLthrOqJhPQL/mj/5bSiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjIprSj1KFP8TjrDC/7i5fxwmQNzxN+K4qSPOrRtumrhrsahjEpSOi7gB1r3O8jztt9pHCwKN/qVTdx/NJWMVILqhNonnTR79/3n0cld5rZQE07ptoQELqGYTEnZmFEh2k4jfB+VDLB1S68jtl+COtmtn5Q/FcSqi/HMSciFFQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=I478yaeZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TJ/Gi5li; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="I478yaeZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TJ/Gi5li"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5460Gxh0009174;
	Tue, 6 May 2025 04:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=v1OytRehWpTtFkVJpRsTd4CjuYtwyza6r1PgHfmlXCk=; b=
	I478yaeZ3f75ouYvG2UYk7qVztwih2RN1KtCQBGvwXQBgQLBz4r6g7yM43f8FCbn
	HrxdhsZbqE3eHASsXJzbfHl9aJ5riO2fw6OCgqapjtuvzHDWgGebOgzbd+Z5zLMh
	eKL1JuEBWDPcH58gO3Tsd2Y+3GvtyBoUCPru0ClZ+x9JpgTaPeXVjbd+HNBxonUF
	e2GaTEqKq/H7vf4Xtj/c/j5Bqk05BYB4TGG6Py3sYcb0RoCEBj2RK0L19kKdpuS0
	qnhD9RgwvCO3q4pTBkoFxGAWsRlvww4CKAKLxvckJR2/DS5at6u4u8hu/UuVoHch
	VkLZ0e3x4fB/lUsCCyixFw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ew4n9dnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:59:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ2wnCBNFSP0tRV/GYjEIsgMbc6PF8Zo9ApJRBtGfe9O/ZEtd9+YaQlhx1QgCUW9M5UrbY1f0ONC1cLmzisTBgR+Ap8EaAYG/7isRorHED92PvfChhSQyOz3GVO65A2zkHkWuC1GlZEp9+KE00j5cEBC+RB9yv++GWE+ca62x+KVymcxVlIIhfdZvnZlJUdAUyS8RJxSuHwdyN3CzwRii2gHpk0bk7En9NJ24Pi2hjjLYhceIDQU/pTvIXbWLuFtAa4R8ke3oLQ/d7qZEr3BEknUGIUsHGod7GRliR8a12+EQhqQmsYzbg6YAaMGMKjyhO4D1Min4lXAO2HQzZVQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1OytRehWpTtFkVJpRsTd4CjuYtwyza6r1PgHfmlXCk=;
 b=mP+9/IFIonoumGp7yVNejuTt8Ca4n6kWCZzpZysivZ3B9C8AY0cv9KblPtab8+MM2sICFg/c56dL/qpbO+RI/p2sxOdalF8J1gCQzBUfQl5iIRYO6pwNxFGUpupZiN/nfG98Smb2Ek8b4Q7Ps5niipGwjIowLSMxHufpubCQYJcOpX7JBZ6/r8h0O+MnGHgCw1cavJGwNxjWrozjtsXT05cNoU+sDmI+Srsq7HLkEIiGwwvPwpIzh91SUaM0gwnUSDztG5lvL1MSohvxwVXX63E0c6SH6sH+B6dmVF3lMlqidmekgR/+Sc1uiKDlkBwKnEnY1safqXuk1KbTp7+KEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1OytRehWpTtFkVJpRsTd4CjuYtwyza6r1PgHfmlXCk=;
 b=TJ/Gi5liFEzGaxFKn6TXxsvpmOuaWqZsNLgSolxz82PnaKCDS2zCDlBcpc9yA7KYwr/QQ2Dxce2ugDlD2I+3mpO9pOrzj76nDe5Lvh+z1xTnkekxoWWei1Dyh9LI64LnMvNtS6k4fja0wwhntfsBo0Z9ZSuS5kM8gQ/MdI52l0k=
Received: from DM6PR03CA0096.namprd03.prod.outlook.com (2603:10b6:5:333::29)
 by SJ0PR19MB4591.namprd19.prod.outlook.com (2603:10b6:a03:279::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 09:59:14 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:333:cafe::ea) by DM6PR03CA0096.outlook.office365.com
 (2603:10b6:5:333::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Tue,
 6 May 2025 09:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 09:59:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 707B240654D;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 45A2C820270;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 3/5] ASoC: cs35l56: Add Mute, Volume and Posture registers to firmware register list
Date: Tue,  6 May 2025 10:58:48 +0100
Message-ID: <20250506095903.10827-4-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SJ0PR19MB4591:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c2c02039-c5d7-439f-bfc8-08dd8c84a82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pPPZ045le8QERPCaaITdedUYKJiWSrLLMVbtI57YKVfc3jjfggWLXo2vxhCd?=
 =?us-ascii?Q?96eRAI+w8DnaimWddGaaP+j2UYnxpK039plGAHJs4XxI3pVwijovaskpRCbJ?=
 =?us-ascii?Q?cQHqAmXxI+3awSmnB4zhKqAC727/VUWV0wv4yeSolrhXqPx+TDOKu3Ke557R?=
 =?us-ascii?Q?v1ED/G3ETlro1h4rFFSBMPZOEpoyiTTM5FcuusdeKtPxKIOfViq4HdgaXaLB?=
 =?us-ascii?Q?cpZC9d8rMbFgsDP0WZHxSGjlcvfQoOvM8YJAbWlM1lH5sOLvvQAfH8KN8laV?=
 =?us-ascii?Q?Lkdm8GCE4yIVO7kBGV99c6gxrKri8F2enBrD9pu8v2I2vuvl54zPB3e3FwdA?=
 =?us-ascii?Q?zrMoRwA7WZc+1pgITAq0d0m0go9DuRN5NYIvvhDuWpdtaV3LagR3XKEpbn2T?=
 =?us-ascii?Q?yzOPH6DmgUChscRDO4NfpwcH5Q4qstzOZu78YLpOXkcUrlAf5UkaWNAaFyi4?=
 =?us-ascii?Q?MMRu3YF8GuWiG1QTuTpym0EDiSzLktJj/krivGABfN9MR4Pv+TYH0BkARhov?=
 =?us-ascii?Q?XXWVTdHSR3JAsaHjXkj8Yxq1NdQKQ9wow4Q4bmhbyfjIgpgofra5vCAjl2HO?=
 =?us-ascii?Q?lU6HTNb9lCOTo0NckCCx5Lih+u3AhSe+zWXcELrLXtOmQ6diHJD6hBDO02G1?=
 =?us-ascii?Q?wYAZ48VU5FJ7hmzx3U8ZO9V9QwVwWg0rRBnmeN72oXxRJvYq8RuSmbgh2Y34?=
 =?us-ascii?Q?edoGPdmQbBHoMNXRMWjtE3ClEBWFEdAgLv2zADYEM4L+AB35s+vemBt4mfj7?=
 =?us-ascii?Q?UUpndWLUqJ8U3gnt2F12/jQfzLBj0MBTARU4QlMS6J4kp0E3zwpSMiswFB+P?=
 =?us-ascii?Q?rDDWoQ3ig0+QTa2lsNtBISlksjjied9bKlXUVK3nsewNH/t5EffOP7gIcsGL?=
 =?us-ascii?Q?Wyes7RN0gtKW6ZqlfqoSkEXaJBO17sZuKgqiSTqnzQOaU480IgHqhlI3hp0F?=
 =?us-ascii?Q?lcCCzE+Vl+OA2NEq+6xGTk9vXzPEz3zSanh+PJsGzxyzhLy7Bu50WIRpkjvp?=
 =?us-ascii?Q?Rrb5HXqbg8uhwe0GX6hM+BLLV3yxgmnRscJUubbF6k6gOeY6+33qrqlhC2Mf?=
 =?us-ascii?Q?IZ0bvKI9RlrPgYLiZ2Ks7WYD7QeblkEuOJm16UUOt0xV+MWRJW5pRllA6g4O?=
 =?us-ascii?Q?be5p6QYRSt15P0ImxecDtwSvjddMERNJXBYQ5esp1quDKYSkn6C4z9EMmm3o?=
 =?us-ascii?Q?XSctlTvMbQXGmlIvafyLRIkRS1/XCwkyKaQqqMba9EjPsI7iuCVGi0U74Zz3?=
 =?us-ascii?Q?Gsy0S5a0ZYhBqEbp0356r7PZ/N7PHJYAFsFCCQa8dHjqO2iCF+SWqulGcaDe?=
 =?us-ascii?Q?lyupSE3xkaOI2VnmM+V7aTTcuoM4mUT30YoNGvF1eD9GCK0iQCOgVav1eztJ?=
 =?us-ascii?Q?Vm/XKlWtdwpntGGvWL3jG2PZ60oRtNx3u3Rh01aHEOc6OQcIW+075KlG9mYJ?=
 =?us-ascii?Q?VYFqsfo84olej1ClZslZXUekZH5YDcQ98LdJx0T/hJvegzlQOiyz9fFakeT+?=
 =?us-ascii?Q?XpLo6qWs1VJNIEa1aNnSS03zy33UheFMAJiJ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:59:13.8584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c02039-c5d7-439f-bfc8-08dd8c84a82a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4591
X-Authority-Analysis: v=2.4 cv=KoJN2XWN c=1 sm=1 tr=0 ts=6819dd7c cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=QglkZ7J-TCNlRGhXK3QA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NSBTYWx0ZWRfX7C+a3llVO+C8 8F2/U0MISJuQHKDtQBT520BEAMsAEX9oUVRO2tMSOzOkgTEemUy2gzJkqD7P1ayvPUAzenVZxNX Z8roQDOJNBHMvG14+nozWV4b8WPtcjfv0g6YaTi4PCIylOtWavKR5/4rq/fAgaxnQEwj024N9PF
 RV+CL6jgaxuBBK8uZNthQ11+AYMNa4bD4q5Sudtz/lL8FICa9+9QNs8CdS20oyPIubzXR3Vfv8u WsXgMdXoNUQkaHPd4nHu2EiSpeWJFhqCz/3y5k7wEwpJmUeIFJPYiqsXBC4isgEdzWl/+rqBCVz E5XeJQuXAGZheHNJ0qWUjh6hmGAmQlq3nyWAOjItX+KUPdFMNhnxdzxM3G3Blx76vqXOz8gWXSq
 JKURdRGX4LgMd2tVoY9nBMNMYgic81UDRQ5ASwhS0WLNvR7ZREA0PfTQYxopvc6lfAUmrVpa
X-Proofpoint-ORIG-GUID: jrmPr_bcgXMq3SrRciOzBdmo5ii_Ex5M
X-Proofpoint-GUID: jrmPr_bcgXMq3SrRciOzBdmo5ii_Ex5M
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
index 5660cf7087fe..b6fecf119261 100644
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

