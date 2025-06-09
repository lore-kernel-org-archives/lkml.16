Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221425D536;
	Mon,  9 Jun 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479648; cv=fail; b=q4VbJSID+mEkAHoV4JDjoITLEcNCpLSrnQFseeVyKZALrY4BbIDgb4pUK1Hr6gONx3OZ6lcaNGq4TbAm+cAXn+AQmseP82NKg34tLzZlaDwdPthQzxj2yI1go48qy68LkPmDVYDPeyWAU6bSj8tPRngRmnEKXkRTGOWfoV5zzyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479648; c=relaxed/simple;
	bh=n+PXAWK59lk9x/TsxRdigLwhFRD48wSmIhHaBnf3sw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GO9G+QZoJfePgFPE/atNE46BtulJ64b0Wg2I2dlufO/QamQCFi1YspMesBKtUBCvEq9Yxq/t8YITCDtWPCsFNfFjrbw5e86B0sdHM5MHAs8UJjAEYJeATAWD8zp6uPJQyR7EYNN8E7YSQLIrpvsY/jFQyBa357+7eGt3L+HdP9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S/bruaT4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YuInS9WW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S/bruaT4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YuInS9WW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BViW7028543;
	Mon, 9 Jun 2025 09:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=adGO1fXjaDbMVjCOB/ZLrk1bCzvSARwDp9Cx/gqVQSA=; b=
	S/bruaT4H/7rUJK1419R6Iv6ZcHQ2c2y/BKqax/kVuBgcLj1Tbi5ENt/0QFOAyNi
	IYPw9wXJe9z+KlHFix6Kwzi2Fs0UNreqg51gzl/4JXN9ykpulKO5fPc+8EohD9qR
	098EJJ00VkjXMD+FllS1acNWw0ccO+wALJthwaBq6H4MAzXYEre4G4Q9BaoLndid
	0OmfO0T5jHtfZZdJPE5lhJAoyCGHadsWpwHewM+BHhBoGyWoRW4iNc7Q/NwaKiOJ
	naiDEo0UwFb119AXWKfnawvfucGVnb2soG38deRFypCH97A2BDKdEzTm+urL2RnH
	6QjTiXfxZdU1/+tbX34aUQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11hn2238.outbound.protection.outlook.com [52.100.171.238])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1jr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 09:33:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR5j7OkfHdSo1CZkRqbrBoo8RpAqdFy8XMROjajk3loysWnel9+itsf8Ug+oBkMJxJYHd0W28931BFSzFKhdnl/wGkJSo9l02B26OxILCpQl0mU69K0sz9MjXqs2D1jzT69VziE9K20hq6dc2Tg10E2nqSCW0dqVwlVBsYNMj9Z93WK/nwf8TK4KNT9b+FmWRFZmAB5EkZtxWD2uJCKj1sVeadGfVaeV3oNh8UQmRHqZOsIhnOzwokxsLy3cZaRJNeO9QyPGtEE78Dbr46DfD5H6E1Pya8XGRrAyLqsa5z3jycBtrm2qaahhPgQGXnUGMUwn50nrMX3A/HiSjmImNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adGO1fXjaDbMVjCOB/ZLrk1bCzvSARwDp9Cx/gqVQSA=;
 b=vwdwhA50qetNCLCFfwe02ObpewjnYfJy2buDYYAgelPz0yr2k7tCvVfQmfazpRllIz2q4TOR05HDRAxrH2pgyiOgUasmnsZS61gNvMWzyarOYXpZgi1LKUmV2weVgjZD9rmXuRpdI8+SxD8+2lacMapBABkCkSV2OS3CsG5BdXWBwMKPA+z+gvzyXUdlWrV4zlZqIzr1ERQH527UMbIufkO24Bpktm5y/CgTWqTfbkP3goFq/TRmnZan4q5sW7cZEFO4anf2eKdsR3qfCKjP/xziykkxnO5BvWAbnr6gvRdCK2oHB7nFcamxmm64QUEbFECAPCC3VfVRXF2XY78wDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adGO1fXjaDbMVjCOB/ZLrk1bCzvSARwDp9Cx/gqVQSA=;
 b=YuInS9WWJLwAtP4uDCjxsVes29vMh4GVCV7v660FF92pfM4OpG9h4UDLvwRGfcndwr6Y89/9rhYQmzniVIGPn8XtaGfR9osRFpFAezWrnJUZTxNc9mfJzGG9rE/ZP4teE26qyZebHvonrqiVE6B0Dkf2Y6N6XnSD+hE+kgJK+TY=
Received: from PH8PR20CA0015.namprd20.prod.outlook.com (2603:10b6:510:23c::8)
 by SJ2PR19MB7367.namprd19.prod.outlook.com (2603:10b6:a03:4cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 9 Jun
 2025 14:33:49 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::17) by PH8PR20CA0015.outlook.office365.com
 (2603:10b6:510:23c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.40 via Frontend Transport; Mon,
 9 Jun 2025 14:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 14:33:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0CCF40654B;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 92EA782024A;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: cs42l43: Remove unnecessary work functions
Date: Mon,  9 Jun 2025 15:30:41 +0100
Message-Id: <20250609143041.495049-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
References: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SJ2PR19MB7367:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f59399f4-28d7-437b-c138-08dda762a595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|376014|82310400026|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1+hC8ywv6U1eTVjmm0CzbbDWl7VelxkduNx/I9PskBx+Co1OXT8D3oI/RZ/l?=
 =?us-ascii?Q?oRKOJQA7pq1BLDaXn9vR4R85xjhEu9H/AgQM8x1ZWcmzXe3+fKTcltVhPwU1?=
 =?us-ascii?Q?eTQzOZgfMmfKLAWDUC3QQuCHJlSCbKm7m7TtmrVsrS91sg5gKPwiYSip9Mh5?=
 =?us-ascii?Q?z8MnDGNPe3F5qSp4h94VDZWEbL5GrM6NYEUvd8jDDw7SzZtHrZ2rG38E0i+Q?=
 =?us-ascii?Q?mWgc7qwZiX+8xqJrKOg7eig0y2c/Ozj/owLpIfGiJb/3ShgC8YhHwVbhH32h?=
 =?us-ascii?Q?y0U+QmEnFfWzWIHWJe+nZQOcWiBtfzyERptV2ImPBcbA83/4FXA1nazr5UD0?=
 =?us-ascii?Q?KdlDKbDPZM11M4kMoC/O8EyYfaZhd6OKjz0nNZVlmJtN/U7BiBZpylDbBQhN?=
 =?us-ascii?Q?hQhZA1YlheXtr15j9hBmql3IC1GiLC61Gj0amRO3HW3+4rF3qEevwcE34UGf?=
 =?us-ascii?Q?D7csycmCGOgapGbuG2zU/ZNxJMwHah5o8UJ0Dgj2gRjdjqsYS9JrDbnR3eWM?=
 =?us-ascii?Q?ia6fCbT4aD9as8F31IH1e+sqm3hfk/Q5V7bDbGxVu4Bol3pKGqRELw9kuAcy?=
 =?us-ascii?Q?JJVNCG18FlIS4cGiX8hYZnKF/9j7rry7j4Bbo6Q7vfojRyf8Jq+uD/xINmbS?=
 =?us-ascii?Q?PCij60Y3jbT1ZaQxJqz/zgyNzp6Ikb/q73tSByfIjfbm6YNfRUVjzCgQaEYP?=
 =?us-ascii?Q?3SDWfL18z73q7GfcIPFYwwCBC+nlYfTbfAPmVuO5HGl5PPcbfItUL8r6UAG+?=
 =?us-ascii?Q?inqyRveyREd8+RktPlpY5r5MJbtLbHLF2YRGBpPrBCHemN687ur54TxiXyKb?=
 =?us-ascii?Q?PGFUzvpHIkOOtFbutPn8/UPfqfFs8Y8izh16wA0xxNq3KtHm3k4S6niXQnOJ?=
 =?us-ascii?Q?ftx451jWWoqRYGNRTyngHVytER5MiDp8IeJNvBbl5F98jI5+Rvx0QBjChcYH?=
 =?us-ascii?Q?cwp31Gt7t/gPic1mI+RtmPaEcdAUlpv7eRwEqU6pRn025Xp5CTmrWY5uInVo?=
 =?us-ascii?Q?R1+6CmtwXcHzBee1rhiAR20EahImH1adtnHHybytZ8YbQ3/rto0Epwfk2C4f?=
 =?us-ascii?Q?2tXk/cqQTjQIakxqnE/qFHF+iuREQiO9fOowgeskGUspz0I1V7fTs8gkIMtW?=
 =?us-ascii?Q?QXW7JoCGCggZgjai5qhf1efATwPpkuxPCx0w8VyGxmAMG2VuSheEq2Kal8UN?=
 =?us-ascii?Q?9iAMjy/HDOTZ4+LMP6rt8x4IQHer3e5JYcuD3IKN4/XlHYFC1Vit4/Ewgnf0?=
 =?us-ascii?Q?wyPn2aZDtxnJyLialvFGJ5lR01hKAhFaBNyF/Xv/NTncSwMkkeWDig3idGoO?=
 =?us-ascii?Q?WeJYfs2IMOngFCag183lLBK9xfwqE6fnztVIp4JgIgzp1eVBeuU95MYMFwJU?=
 =?us-ascii?Q?f4yyevpX0zKuSu4+xsZO5qhEJTYtqP+7jisYRpgdlyBZgUA+ldcUqIPErImM?=
 =?us-ascii?Q?SYL/YeOb8IGzzPBJ/0LSiTw8aD6XKmYIbf/Rg8wgAOZ2+jjo2uY+ZvTr/kr8?=
 =?us-ascii?Q?OMLmhS8yWE9dMtr4DZW4JbRIbowc3C5bY9zU?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(82310400026)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:33:48.0193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59399f4-28d7-437b-c138-08dda762a595
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7367
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846f0d2 cx=c_pps a=ZSix7NxgZyHh8ZndRuIozQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=2Pf8-g1FY_5CeouxD6IA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfX80qO0qYZ9iUb Y8RObxijQzS3eccCDDrh8aPUInJD6fyA8Gr6SuEy/qJ/9r3kVxgKVHdqPsD3MlAn9md3fof6zOI tPmO3AbltgZDfUaKv7bGPD95I9U8jKKy5QLca7I3+S6kBTwKsMY9TQXKzd3rRu7PtAJO/8YgnFJ
 Of+BRSy5hxus3YMcG6Z+Phip2BRtevLyZHo9L359IfkXdrure2CAs0f9DORAuOj8gl5GbscVL+a c2Rq1IqMuE++5A0/dXrBgdXnK/hPof6/AqfN/uHSVeLm8F7t8w9x6mxaRVVSOp3evD2Kdk0NU4/ pvZJhpsLgIrCO/lAYpPcr0FXvwDcOGGBntq/PbwxOJSl9Grjj5e6NAcPTqJq8szcSUdBfyv+cKF
 AZMj8CJyUG5DTDuTthT1rhEKpsjQq4gw99eU0+K/LUN7tGL+q1ObeEQoXtm20iM2/UYPpaXw
X-Proofpoint-ORIG-GUID: ccH2sS1aEv13T6MQAufDyRXziw4paDy4
X-Proofpoint-GUID: ccH2sS1aEv13T6MQAufDyRXziw4paDy4
X-Proofpoint-Spam-Reason: safe

Now the SoundWire IRQ lock has been changed in the core, it is no longer
necessary to use a bunch of work functions to dodge mutex inversions.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 46 +++++++++++++--------------------
 sound/soc/codecs/cs42l43.c      | 24 ++++-------------
 sound/soc/codecs/cs42l43.h      |  5 ----
 3 files changed, 23 insertions(+), 52 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 6165ac16c3a95..72a4150709de8 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -362,14 +362,15 @@ static void cs42l43_stop_button_detect(struct cs42l43_codec *priv)
 	priv->button_detect_running = false;
 }
 
+#define CS42L43_BUTTON_COMB_US 11000
 #define CS42L43_BUTTON_COMB_MAX 512
 #define CS42L43_BUTTON_ROUT 2210
 
-void cs42l43_button_press_work(struct work_struct *work)
+irqreturn_t cs42l43_button_press(int irq, void *data)
 {
-	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
-						  button_press_work.work);
+	struct cs42l43_codec *priv = data;
 	struct cs42l43 *cs42l43 = priv->core;
+	irqreturn_t iret = IRQ_NONE;
 	unsigned int buttons = 0;
 	unsigned int val = 0;
 	int i, ret;
@@ -377,7 +378,7 @@ void cs42l43_button_press_work(struct work_struct *work)
 	ret = pm_runtime_resume_and_get(priv->dev);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button press: %d\n", ret);
-		return;
+		return iret;
 	}
 
 	mutex_lock(&priv->jack_lock);
@@ -387,6 +388,9 @@ void cs42l43_button_press_work(struct work_struct *work)
 		goto error;
 	}
 
+	// Wait for 2 full cycles of comb filter to ensure good reading
+	usleep_range(2 * CS42L43_BUTTON_COMB_US, 2 * CS42L43_BUTTON_COMB_US + 50);
+
 	regmap_read(cs42l43->regmap, CS42L43_DETECT_STATUS_1, &val);
 
 	/* Bail if jack removed, the button is irrelevant and likely invalid */
@@ -420,34 +424,27 @@ void cs42l43_button_press_work(struct work_struct *work)
 
 	snd_soc_jack_report(priv->jack_hp, buttons, CS42L43_JACK_BUTTONS);
 
+	iret = IRQ_HANDLED;
+
 error:
 	mutex_unlock(&priv->jack_lock);
 
 	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
-}
-
-irqreturn_t cs42l43_button_press(int irq, void *data)
-{
-	struct cs42l43_codec *priv = data;
-
-	// Wait for 2 full cycles of comb filter to ensure good reading
-	queue_delayed_work(system_wq, &priv->button_press_work,
-			   msecs_to_jiffies(20));
 
-	return IRQ_HANDLED;
+	return iret;
 }
 
-void cs42l43_button_release_work(struct work_struct *work)
+irqreturn_t cs42l43_button_release(int irq, void *data)
 {
-	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
-						  button_release_work);
+	struct cs42l43_codec *priv = data;
+	irqreturn_t iret = IRQ_NONE;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(priv->dev);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button release: %d\n", ret);
-		return;
+		return iret;
 	}
 
 	mutex_lock(&priv->jack_lock);
@@ -456,6 +453,8 @@ void cs42l43_button_release_work(struct work_struct *work)
 		dev_dbg(priv->dev, "Button release IRQ\n");
 
 		snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
+
+		iret = IRQ_HANDLED;
 	} else {
 		dev_dbg(priv->dev, "Spurious button release IRQ\n");
 	}
@@ -464,15 +463,8 @@ void cs42l43_button_release_work(struct work_struct *work)
 
 	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
-}
 
-irqreturn_t cs42l43_button_release(int irq, void *data)
-{
-	struct cs42l43_codec *priv = data;
-
-	queue_work(system_wq, &priv->button_release_work);
-
-	return IRQ_HANDLED;
+	return iret;
 }
 
 void cs42l43_bias_sense_timeout(struct work_struct *work)
@@ -787,8 +779,6 @@ irqreturn_t cs42l43_tip_sense(int irq, void *data)
 
 	cancel_delayed_work(&priv->bias_sense_timeout);
 	cancel_delayed_work(&priv->tip_sense_work);
-	cancel_delayed_work(&priv->button_press_work);
-	cancel_work(&priv->button_release_work);
 
 	// Ensure delay after suspend is long enough to avoid false detection
 	if (priv->suspend_jack_debounce)
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index ea84ac64c775e..41a0f4529ea1f 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -167,13 +167,14 @@ static void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
 	snd_soc_dapm_mutex_unlock(dapm);
 }
 
-static void cs42l43_hp_ilimit_work(struct work_struct *work)
+static irqreturn_t cs42l43_hp_ilimit(int irq, void *data)
 {
-	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
-						  hp_ilimit_work);
+	struct cs42l43_codec *priv = data;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
 	struct cs42l43 *cs42l43 = priv->core;
 
+	dev_dbg(priv->dev, "headphone ilimit IRQ\n");
+
 	snd_soc_dapm_mutex_lock(dapm);
 
 	if (priv->hp_ilimit_count < CS42L43_HP_ILIMIT_MAX_COUNT) {
@@ -183,7 +184,7 @@ static void cs42l43_hp_ilimit_work(struct work_struct *work)
 
 		priv->hp_ilimit_count++;
 		snd_soc_dapm_mutex_unlock(dapm);
-		return;
+		return IRQ_HANDLED;
 	}
 
 	dev_err(priv->dev, "Disabling headphone for %dmS, due to frequent current limit\n",
@@ -218,15 +219,6 @@ static void cs42l43_hp_ilimit_work(struct work_struct *work)
 	priv->hp_ilimited = false;
 
 	snd_soc_dapm_mutex_unlock(dapm);
-}
-
-static irqreturn_t cs42l43_hp_ilimit(int irq, void *data)
-{
-	struct cs42l43_codec *priv = data;
-
-	dev_dbg(priv->dev, "headphone ilimit IRQ\n");
-
-	queue_work(system_long_wq, &priv->hp_ilimit_work);
 
 	return IRQ_HANDLED;
 }
@@ -2159,10 +2151,7 @@ static void cs42l43_component_remove(struct snd_soc_component *component)
 
 	cancel_delayed_work_sync(&priv->bias_sense_timeout);
 	cancel_delayed_work_sync(&priv->tip_sense_work);
-	cancel_delayed_work_sync(&priv->button_press_work);
-	cancel_work_sync(&priv->button_release_work);
 
-	cancel_work_sync(&priv->hp_ilimit_work);
 	cancel_delayed_work_sync(&priv->hp_ilimit_clear_work);
 
 	priv->component = NULL;
@@ -2314,10 +2303,7 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&priv->tip_sense_work, cs42l43_tip_sense_work);
 	INIT_DELAYED_WORK(&priv->bias_sense_timeout, cs42l43_bias_sense_timeout);
-	INIT_DELAYED_WORK(&priv->button_press_work, cs42l43_button_press_work);
 	INIT_DELAYED_WORK(&priv->hp_ilimit_clear_work, cs42l43_hp_ilimit_clear_work);
-	INIT_WORK(&priv->button_release_work, cs42l43_button_release_work);
-	INIT_WORK(&priv->hp_ilimit_work, cs42l43_hp_ilimit_work);
 
 	pm_runtime_set_autosuspend_delay(priv->dev, 100);
 	pm_runtime_use_autosuspend(priv->dev);
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index 1cd9d8a71c439..3ea36362b11a4 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -88,8 +88,6 @@ struct cs42l43_codec {
 
 	struct delayed_work tip_sense_work;
 	struct delayed_work bias_sense_timeout;
-	struct delayed_work button_press_work;
-	struct work_struct button_release_work;
 	struct completion type_detect;
 	struct completion load_detect;
 
@@ -99,7 +97,6 @@ struct cs42l43_codec {
 	int jack_override;
 	bool suspend_jack_debounce;
 
-	struct work_struct hp_ilimit_work;
 	struct delayed_work hp_ilimit_clear_work;
 	bool hp_ilimited;
 	int hp_ilimit_count;
@@ -134,8 +131,6 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 		     struct snd_soc_jack *jack, void *d);
 void cs42l43_bias_sense_timeout(struct work_struct *work);
 void cs42l43_tip_sense_work(struct work_struct *work);
-void cs42l43_button_press_work(struct work_struct *work);
-void cs42l43_button_release_work(struct work_struct *work);
 irqreturn_t cs42l43_bias_detect_clamp(int irq, void *data);
 irqreturn_t cs42l43_button_press(int irq, void *data);
 irqreturn_t cs42l43_button_release(int irq, void *data);
-- 
2.39.5

