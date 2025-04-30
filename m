Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E8248F55;
	Wed, 30 Apr 2025 10:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009127; cv=fail; b=NmfRVoW3A0F7uef/8G1T+9uckJa78H/P/RxkMenkNf32noY1NK6hw3TwdgDpPcZ+T3wJsf9MM1gauz7jp4sG5FnEXbU9k1rOZZClPJn36gjRcJXi/flrocY90i8iHpeLpVI3tdjrZ/Zpp17okna+/mvp1fF9eTuf7yd5TaWd92w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009127; c=relaxed/simple;
	bh=OwLbA61jNc/lZ85jXmwm4n1rps4eE+LVv3/5eKSF2eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hiuUC9YnaBy9x5b5Pf0BMEHx/i2vn2Wyz8XIaSx+AlMGcZOjM2jkIprpdhRASypIJcwi/GiwSdgf/ecI8oGhfaDpGO2PKk3FEqRUBGbraJOH2BIFC7eVVKp8o5NHmLyeQT2LeFbcNMwg6vTtbQJFPhys3sQEWNPBuyaeHjIR2sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qQiXNKyZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XVk/8ubn; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qQiXNKyZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XVk/8ubn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U4rFFW019656;
	Wed, 30 Apr 2025 05:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZQCxpfaMsOS+/xtf8TcyFfUPII2vUWhjVehbOFn3qPM=; b=
	qQiXNKyZDTvKc7rZFGUzKHz7gN6KdxwaoLfISjnyXTLA+pYdm6XBF+YhcflaCSbL
	dx5FGSAY2K2ZNEtvLBeRuRtZxvP70bvzYO0Ul37Cs2wy2oYdg0940FBdUtaifWhe
	0uALmZ8fQrv8thMjV/TWpG+HwhzCxJRR1htdRzNoIhr+Ohs3u9N5ILhOgai2b4pB
	Pnzil58m/GyOHbZP3xCPC0z4hw+l5yAbrRl3wusfwQaF5kiFmGvcdNZIQ50NqTq8
	fEx93NAZOn7of19r/+vGMOW18k2IU+/KbrhK+x9VblwR3c5QchRrj7chWJzsIg3C
	aFkwD1xAS/R3TJ6WxWg5pA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46b6te8s9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:31:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aB9189kFjPApabcjToHSlu/k5v8iVQ60C9/X1t4HRy7Sk0p8/0iXY+5eVtO+AVpRV7z+KN06vEIQKGWqgDz9LzCCWYteATFjeCf3XPIl14lc5jyzh9+yXiYe5jo9yWVpD+e7o0aWqn5oYEm3GO0lxk8B39bIbXDONISRavBvE9t16VCywprKZCzktf4nfDZ3XflEK7qvQ5z2dsr4Ld2GqeEt+/IbRVW3WRHlZO5YXBFdxytsZfyx8bQr/rELO5oFgJ/8M6Dj2ze/hS02f8AcOZqGP1Ec8jLpi7lWwcMZZOdPkOtO42qakXjyuYnDnLQqPtoGf0K/+aSnXPD0A2IuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQCxpfaMsOS+/xtf8TcyFfUPII2vUWhjVehbOFn3qPM=;
 b=spawZH7ynrehAmYk7zlGesdXmQCDWZclvq6Gxtz5zDrt08HGZUpbx3cG1ApKsBE5XI8ITpsnGF9IOjpzG3WiVDg+VsCMUuLh/zg3t/4cx75x61sL+TMnXB3qf4TouNt+JkgRWf2LiEWhtlBIJ429riYB00DRDPpMNSvPcrU6zn3iw5Hqcf+k+2VwSS7Ac3irP3+As0AhpYFNP31+NajN0pfH6lV71HB77k59WdYI65cWVb1SFEebSgl72IPVxfCpjQunNjXEkRWkZlF+Le91E/TNhMCh4/QumGgsxeVrdDXCwoKYxHXH853KkVcUQsKy+jEAcy4FmhfESPcAzvtH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQCxpfaMsOS+/xtf8TcyFfUPII2vUWhjVehbOFn3qPM=;
 b=XVk/8ubnNnnM7nQkzmdcv7gX5cjR8AwysKQWqunfsp1fdH5Gmvac9yW9a04DqZcd3zPM51OCGREePhilQZr3+IfE2VlgxC1A0jSQybiCXuoYwjL/+3BmEp20MRBvOUAByhoObpMyos/E99gfCv1NEL6Uono0LTQb4ewsv+OKQxw=
Received: from SA9PR13CA0081.namprd13.prod.outlook.com (2603:10b6:806:23::26)
 by CO6PR19MB5386.namprd19.prod.outlook.com (2603:10b6:303:149::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 10:31:44 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::63) by SA9PR13CA0081.outlook.office365.com
 (2603:10b6:806:23::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Wed,
 30 Apr 2025 10:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Wed, 30 Apr 2025 10:31:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0F67740654D;
	Wed, 30 Apr 2025 10:31:41 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C7B3E820244;
	Wed, 30 Apr 2025 10:31:40 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ASoC: intel/sdw_utils: Add volume limit to cs35l56 speakers
Date: Wed, 30 Apr 2025 11:31:20 +0100
Message-ID: <20250430103134.24579-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
References: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|CO6PR19MB5386:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 455a6b14-c6b6-43f1-f943-08dd87d23328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0pGQdvJ6ILEdqyGTVr6LuFYuH34W6yS9DdoDLImOaEv+m2Qdc8KTrcu5HENs?=
 =?us-ascii?Q?7YlF3XE3mcFTgRxUmrbkYK94RoInvfRnU6zvs+VTocZnFPKaqcoYM4hPCAjS?=
 =?us-ascii?Q?3lePRcmu4xbu65a7g0JHRTrNebhN1+Pf/jox99UB58EoxEx+EU0DbHnafbs7?=
 =?us-ascii?Q?uOddTkvx7O9oWGAfY1KvQjr49oVYepVMs3k4HgkG4oHEAJ1SW5S0J77yNuOU?=
 =?us-ascii?Q?rlfEpDwTn35a4dhg99dNFecXgAfdaiUemsJzGJyN5AqEIKRouJ31Cuo3mzA2?=
 =?us-ascii?Q?IfXZcQYDhF0Aa+cR8qNIWqLPpGoonRRJ5JSB45hx7Fl5elCxDLMbIp0Oufq0?=
 =?us-ascii?Q?uOYH1UT1afCz2+txcx7tfD+e3t0IZ0hXosGCL065vajOjdIduHFPqSTUahZW?=
 =?us-ascii?Q?PtxXYqKM63bBDXIpVA6sXZSeOSrutEJc4trwTgZe/+rTbVxxhFUkR0RfKjwB?=
 =?us-ascii?Q?swz+jWAn9wZ7vx2al501wLZXHrQP0kYkPgrBMh2a3mBYzTrrK5lGlbb6xoB9?=
 =?us-ascii?Q?eHVgWScDo9dSeM04Lu/RAhCHazo3e3zykJERzf5uatBNyfPhIjRIQ9bktJv9?=
 =?us-ascii?Q?ri/RXqTlkSx2j9iaa64LodC6xqEDAtRYREU1ZviJV+nG6tutYOH98/mt5h9g?=
 =?us-ascii?Q?Hlgnh0H0ltUxwIjvYsayCSIDH/QpkzBKkr1YoFbWwCmpjJF5rBQ/aO/osePk?=
 =?us-ascii?Q?hb1iBiK++Cvj39nn1nC6OUvM09bnM/c7xuyWHQl9/A9pDEJeEnq+wZb2CkW2?=
 =?us-ascii?Q?7aN/bEvDlBM3PMRAG6gGP3kLb6Q8JeoxfTiuqXeOomuJpAvQoCHZ+x9qpSDv?=
 =?us-ascii?Q?tHIFAZwxOyywUvzk8jYRMKywV03MsqTGifZnIdm8ukX59wLMsesU87NUhUY5?=
 =?us-ascii?Q?7tiig+syABcmoQI745ruw6JDMVVGktg9I8VDbNOJBqekocx+Bvj7Q0Qj45YM?=
 =?us-ascii?Q?QaHSjBb0VEBqB5Vwmsp06F4N5EVrPXhZTV8Qd+ZlNxiC02i1PBtjNSEukdqj?=
 =?us-ascii?Q?CJL2lW11W1SFpWq+K0HQHfzfEx3d76gMKc6wnTGqJU1LPUFyYPHYOvUutt7x?=
 =?us-ascii?Q?Hif9Wncd8flB+5Qmq/mb5T180Qd6OWpVxKGUZY8UBeBZodg2BsvCDpRUVQMc?=
 =?us-ascii?Q?xcQqSmSRha9BwJHp9A0yeASwhWdgVYcN7RbC5lF3Tz8kwlaFqeKSDYsXWvDS?=
 =?us-ascii?Q?63TpokCTrB3sKtwzwsA4VhNxOAFetoMdyZsqdjjJ91yonm71+RC+0+q8rwp9?=
 =?us-ascii?Q?ztgXs3GfVKPVUVsOlsr8aLTP+tskXyjnS9kGVWWLUpFDFdbm4Meg+7zv0sW+?=
 =?us-ascii?Q?yJguN1sJtsRpvwnDAVkyrUSIrX9qW3JKmMx8MUPc3OMmqSAFWC+ma64jsPsV?=
 =?us-ascii?Q?vcodlIOz+c4+NcKDTQ2EjNzism/XwGcG950XwErXunZ8QXC7/o6/sOMP/Yng?=
 =?us-ascii?Q?HKP8jBnuoC+h4Iny5i/rwyuH03lQ6NHWPpn+iYYyRebYd7SzDiZPhxHbMd1l?=
 =?us-ascii?Q?Z2hLqNdfXoE8ihLpWnuuyjcaTlVU4f1kluDk?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:31:42.4970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 455a6b14-c6b6-43f1-f943-08dd87d23328
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5386
X-Proofpoint-ORIG-GUID: dB5wS0KlhrNK6lfIy0In6F48UHTRCqA8
X-Proofpoint-GUID: dB5wS0KlhrNK6lfIy0In6F48UHTRCqA8
X-Authority-Analysis: v=2.4 cv=I9ZlRMgg c=1 sm=1 tr=0 ts=6811fc13 cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=dNzS_mdQi9kc3JURET8A:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NCBTYWx0ZWRfX+CBFvPqa0rdf vkmR04iDK09jODx/Sgakx/lgB7OwSoZ0stiFOB+uemeLoYfD2CoI611THuCWsGw6wQ8BKp1uPyp LRrW7IgZKsjFDo6fBh2qBOOW1NxtGUCcPtHH9jUGc81pcFvTRfEH2k9RuT1WJbGoU4FnZ40qAFz
 oYz5lA+gtc+yMGlbKDZNKI44gy7L7zlVk6M4YFlg6MQvQBeWYiZmpxEE9RBnDzz+HFTCJVcobU1 oUz3dXrd9G7SjMpoCTtTKNpnO2tSDFpiGOHwvoGnMmKx9lbMDogOQTXVqOQmnTrVCdrfGCphljM U2OIeBSQ1M06Kqf6+b4Uo5ha2RGTa8F9eCFWviWcvA/agLnsuzk1o0+4tREgFro5UDNwfE4Kf4i
 50CixytP2i8eDI+2hxjMCiHLSojs7RzlDrRfTuvJMI9AQbdFGUBup2Fmwo8zZ9IvuLKSSIet
X-Proofpoint-Spam-Reason: safe

The volume control for cs35l56 speakers has a maximum gain of +12 dB.
However, for many use cases, this can cause distorted audio, depending
various factors, such as other signal-processing elements in the chain,
for example if the audio passes through a gain control before reaching
the amp or the signal path has been tuned for a particular maximum
gain in the amp.

In the case of systems which use the soc_sdw_* driver, audio will
likely be distorted in all cases above 0 dB, therefore add a volume
limit of 400, which is 0 dB maximum volume inside this driver.

The volume limit should be applied to both soundwire and soundwire
bridge configurations.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/soc_sdw_utils.h                |  1 +
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  4 ++++
 sound/soc/sdw_utils/soc_sdw_cs_amp.c         | 24 ++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 36a4a1e1d8ca..d8bd5d37131a 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -226,6 +226,7 @@ int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 			 bool playback);
 int asoc_sdw_cs_spk_feedback_rtd_init(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_soc_dai *dai);
+int asoc_sdw_cs35l56_volume_limit(struct snd_soc_card *card, const char *name_prefix);
 
 /* MAXIM codec support */
 int asoc_sdw_maxim_init(struct snd_soc_card *card,
diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index 246e5c2e0af5..c7e55f443351 100644
--- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -60,6 +60,10 @@ static int asoc_sdw_bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 
 	/* 4 x 16-bit sample slots and FSYNC=48000, BCLK=3.072 MHz */
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = asoc_sdw_cs35l56_volume_limit(card, codec_dai->component->name_prefix);
+		if (ret)
+			return ret;
+
 		ret = snd_soc_dai_set_tdm_slot(codec_dai, tx_mask, rx_mask, 4, 16);
 		if (ret < 0)
 			return ret;
diff --git a/sound/soc/sdw_utils/soc_sdw_cs_amp.c b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
index 4b6181cf2971..35b550bcd4de 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
@@ -16,6 +16,25 @@
 
 #define CODEC_NAME_SIZE	8
 #define CS_AMP_CHANNELS_PER_AMP	4
+#define CS35L56_SPK_VOLUME_0DB 400 /* 0dB Max */
+
+int asoc_sdw_cs35l56_volume_limit(struct snd_soc_card *card, const char *name_prefix)
+{
+	char *volume_ctl_name;
+	int ret;
+
+	volume_ctl_name = kasprintf(GFP_KERNEL, "%s Speaker Volume", name_prefix);
+	if (!volume_ctl_name)
+		return -ENOMEM;
+
+	ret = snd_soc_limit_volume(card, volume_ctl_name, CS35L56_SPK_VOLUME_0DB);
+	if (ret)
+		dev_err(card->dev, "%s limit set failed: %d\n", volume_ctl_name, ret);
+
+	kfree(volume_ctl_name);
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_cs35l56_volume_limit, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
@@ -40,6 +59,11 @@ int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 		snprintf(widget_name, sizeof(widget_name), "%s SPK",
 			 codec_dai->component->name_prefix);
+
+		ret = asoc_sdw_cs35l56_volume_limit(card, codec_dai->component->name_prefix);
+		if (ret)
+			return ret;
+
 		ret = snd_soc_dapm_add_routes(&card->dapm, &route, 1);
 		if (ret)
 			return ret;
-- 
2.43.0

