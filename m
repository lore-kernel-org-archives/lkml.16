Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ECD1F4615;
	Fri, 13 Jun 2025 03:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786851; cv=fail; b=LV0yywzquktJjVfOAYXO0kpDJgQ05OM3lrtnlW89ZnMa6sqBxzL/2Wy16pu5het26DhKnwqNu2jPOPISpw8GenLRtvAgs7FkN5GjUxwkGLFILYG6sVSqrpf2NgEFfTm6/Bl02EY/rdCMpDwuwjAGR3RBrxB8w297mclxN46JGD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786851; c=relaxed/simple;
	bh=ndxmhM/vR4W+Rqf7SO/7ILakluYO55LpP1JTRzp57I8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qC+wo2ewBfd6/NMK9VKtH6bgbmKWyFKPxCGO1tmUhZ0IgUjM9HrOVzp0gyyFu/hYRmQmGxrDvl/o1SiJoSmIRns+NMSbjdPnAZiTFGhLUvfBalX1Af3d3JYkdArFN+j8qJUgH9J4xdsprqhvajuAW/mxxZuWB1OyReIry+rchX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l+SJyq0A; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l+SJyq0A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVVO1MiduKz85Y0jB1dFWCe2Iluqx1JGNztWVupH89rTZ2HLZLrLsGggVVHIP4oH9VolAO+iAf5HPu+htuB9DXV014vFnRn5Kz4H6Jko+1wG4HlNStkCIZyDDsCrmvf3iarm+e/uF4PQwhfdzF3S2rsG12CvF8iO1IGeB1u3Sv0zc9pelq8De3ozLTEpZfhpargSvIvfUqwTTmIRJXmAzGHh45gzzsBWrMqP9D8QiAeVd/RbVeZiUWFhH6hMKA0FzNPAfK0P0g7B6byUJxV4kzUbqhykLWZq+sK1GxdAC4/DtgahpTG6wKGP3SPY0El2BmL49uU/ynRe/GoFu42kvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x484Hmj+7RSkr5287ZLF0A6LhaWql7PeCQZZU3aM8OA=;
 b=MedgGz4VlyMuhHc31pHwGL7NiYQCI56fmCqijhU/Gm5ZVZdnuKnC2/ot2dVa401mPqJ8B6sEvRupTDL7wYqjOQse6Icn4l3nacVrEnr22YmZp6Wpv9sRrOOaDE1RVEhhbp9t6qo0ya9K51aMdYtNzVL06hn6HAhtyFaIHga95LV6DkFhfpdIUkLWZ0Th6Ee1aWmbZIE0nOQSXW+rc5+fp761mkTywYKbl1KSOnEbTi055mI76dSpLQYhzAur98DDLBk/Vu2TyraV+xw5yPZtbmMe1Cu5N/SFevTDaEKfGkoDr2Bq5Ko9pec2AAwktFITTmrN5tPCCZJa2bEN0tlAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x484Hmj+7RSkr5287ZLF0A6LhaWql7PeCQZZU3aM8OA=;
 b=l+SJyq0AaFx2s6qMz4iFItdTb4kIwzJt+Yw/E5Vyy00w2TJbvUGp0DSNsOuOLuqJBosNEtESCx30zDN+9q8SiXyo5ZGupwN8xiziTVa+dBwt9veQsK6WDdhiX3080a36Bdo/JgytJJnY/UfGClSj4q1cj0v3gwl+wHx/arbdGxpd+T8kDGq3MqtOnE9eF/PihZo4XiWUIC1iuL/smSpYO2HY1Ao5hxC60Qm4SKbWcaukPpgMw3Gu1StpZFLF09LpspPifb5XIhbxTD9ECCs0+MYdZBbTiWATPp5jK7dkAGhyvcoehZ3u7ynnxF4WUuJvQPqv8b6LiGcNKaXp5bRdnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI1PR04MB9860.eurprd04.prod.outlook.com (2603:10a6:800:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 03:54:05 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 03:54:04 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: wm8524: Remove the constraints of rate
Date: Fri, 13 Jun 2025 11:52:16 +0800
Message-Id: <20250613035216.1924353-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI1PR04MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ce418f-1c5b-40a1-f227-08ddaa2df0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l/bQuCMjfhpvmycetpU5lpCkj54fRkK/FbmOf4foobqPQ7x38EdRJ5+r9xPC?=
 =?us-ascii?Q?zFne8F6rV6s6lP7JWIRb/NeDiAZF2BaPnNQ7YrfoxPAcDvvbo4Q2vh8FaVL0?=
 =?us-ascii?Q?KLaM+/YigJlFmsGs7o1Uyt5DxWXGjM1fnISyaljfrEieZpBRU59nmh287jOM?=
 =?us-ascii?Q?380sNXH28qBEuh5RI/xumez1scEtuZa+jalDHH1XnJGnPLnpV2ha1zn2rk0T?=
 =?us-ascii?Q?WxCveYecrKa3FT2OeX/VAQ+RDDMAm9X3aysReZfjy0rG6DYWRPNurIs+vR0T?=
 =?us-ascii?Q?ccLAbjIrMOMuLTHSQmg8qSKIiPhR2lXteBrGEpsxyDP9iIooLaUdzCFzqnc6?=
 =?us-ascii?Q?sV4BxNVUVs+SYHHR0c20bkYC1D19KzBBgrfp2QB1Kh0/VTh325kzOHFZjYQv?=
 =?us-ascii?Q?6UyGTkisx9IqLquW9GVL6HH4m/eEIUni8tu+XIpBZrPd15uAduUzXlABJq0f?=
 =?us-ascii?Q?AQoYsvx/tAcdhqAIsQcG/O4y/YztBsyt4xbgzqDADyFsntiDcu9WejnT45kK?=
 =?us-ascii?Q?barRoPa2YTpPXjwrcIVar38Mwzb+n8zVFsgmbQ4SnD0bTXlR5haJGuFFmiYR?=
 =?us-ascii?Q?8xhZ5xZDVH+QVur5Vck6uf9j62qqOvx7aai5XifUJHnZGAxb5uFhMb7pd5ea?=
 =?us-ascii?Q?XfosMbAGU7ThAzhK1SUuM2aBUV3y3MFftvgwaYGYtzmjXqCucdZy4FeXkZID?=
 =?us-ascii?Q?tNkSoEW4Gg7NVxZ71phcFQmaktw273AQ4+RDNwBFgKVyoB+1rcdjse9UuFEa?=
 =?us-ascii?Q?VwDj2BfHSp7QN5rVmMrSSVwWdd8y4timwO6ODx7F6Y55akLbOfWvm8C2tw05?=
 =?us-ascii?Q?tJxdlz+3VU3W5G/yYWl0h83rWh0kCiqrTOcph6wu4ga9vWBlfnMvXql3eMDV?=
 =?us-ascii?Q?8Oxu1XZcf3/17g2n5vnIw705P0k54VRO6lgRGTZkOo1Ds4gv9dAE7zJdA3f2?=
 =?us-ascii?Q?wDuC4SaW9WOXMFX5scH4xCfC6gqug+SBZnA1ELSiwPAATQjeKCu4frsrSafJ?=
 =?us-ascii?Q?N/r5JeJIcl0T8vFJgueQ04lsBwnDRDlRlNAA20YMr0HBJUFx/sCtKov8vdyk?=
 =?us-ascii?Q?ECiYRyRNt7gLMoZBs+PJFnu70sEBzTOZFb6UXdOHKoEae/+8hqPRZmXIFiDJ?=
 =?us-ascii?Q?8+bG18Cg4gKnXTWpoDWS6GFiYw+Yr81VEE3hSXf2tkCT7Z7cDM4XWcr4jjm3?=
 =?us-ascii?Q?qYZOeV8sH6FZ3dStY7wgzBZcT1cjeBPsHxUp+JjIfzCBLLjqhYaN2fn81Fvz?=
 =?us-ascii?Q?YSV4yW7uxd53WwdMENEdn3LFOTERDAWyxsTaW0ZexIh4a53ChXkusmn34wWq?=
 =?us-ascii?Q?sos6direTFNSL5mGLDm5dUFLoM6Exoqrd8ns0oVCnZB+XHAa830QGikTLrp7?=
 =?us-ascii?Q?x0n6MtXg4dQ4APh219yr18lYsMrVnJw4UeSY9IsOb3vUR5JJtukNmrh1rI2r?=
 =?us-ascii?Q?upURwOm3Zh/hCg1SUb0uFdIRa8sxPyGQTSD1XZfjPPRNb9nvOXz0UQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K3w8CtEfqWAUQuz13Z2Zr7ySrdMZRoi58BRJPS4NaN56fom16R+CU3uh630t?=
 =?us-ascii?Q?X51VRS1V5AmmVlrZwxZvf31PDEvCZfwsW/tPj4iGUqHFVelPfsxTthJloEd/?=
 =?us-ascii?Q?PdeHy85UjSdkfotF3OtWuqKOdvvLCYMRn/0w323c+LOx/o2ECf9g444dKzIH?=
 =?us-ascii?Q?3Hhy+o5kx6jyEmQHoqhYOirTGQUvhSfQyTL8K9i69X0j3o6DpDiI/caVW7pc?=
 =?us-ascii?Q?l9TQfHM8/a1PR6OzvEam/SpGAh1Lw1gNuf0rvAKLOdEmSJr8NA5SeIkhu6Bw?=
 =?us-ascii?Q?2OOZCLCo1wBYkSMCSTnkN8xHdPfC5hdfvB0qDpW+lnPg2lt15F6KkAaNsfk2?=
 =?us-ascii?Q?7yCw3yLLiA8AO8XGzktgKUwQdU8SNihEBBpAaYkHFe9fcuNqxndz5uOHVJ9V?=
 =?us-ascii?Q?OMyqslzmNRovUolleXutNmBSy5Be1uND4YoQmEbpiPKKrcp97ZSyB5f0hsjW?=
 =?us-ascii?Q?LydihADHIDC6zuLcrsUR7e9TkkNlhm+9UD0Q/e2oQQwKDT0WdJLCmecCvAWk?=
 =?us-ascii?Q?ONpW/D1+SoVIzuIPgaXY0BpjmKDHYNq5GhgSpSNcJNRZjJ57JsNltJEvf3sY?=
 =?us-ascii?Q?7bzKwcU8BSDH2VSo9nSvv2j+Z9W0NTVFRlqj1AbFvFfpLSGkgqlXmFJwiamq?=
 =?us-ascii?Q?IhJ7jb1livKM9hGHDU701/EHoCmC3NehPw0qWcA3Qb0fGTKvTKHxeTKOQ7pa?=
 =?us-ascii?Q?Wc7wffEyUdwsok2ZewKsReNul8xfsFrlvwu74DQbHtcXYPUg1F9qRR1jtC0+?=
 =?us-ascii?Q?yuBt599oyicSlVRo6T3kf6k9Cw0wo4w8agKovRr8GB5RtFnFVvaVxTJjbdWy?=
 =?us-ascii?Q?k3n4oIZ+Z/EJduBNKmWLsOY+Skxz0L/TQ/jyxCImPCsm8IIVARFSjNPRYH5o?=
 =?us-ascii?Q?YHZac0Oqrj5kAzPzdmpxPJYsBdsCWCI41HYHiDmoGb+U8JYRi9UhCSvHi9Y/?=
 =?us-ascii?Q?4kWshtPGH/rk3uR/qiBJDuDjjyT2wEITPEkcMnOwRLvwduUdpBTIrjEISVuK?=
 =?us-ascii?Q?VR4EI/bMjPjpX8PJ63TItdmIQxcUyPdXzHhWFbpxsK87JTbXqBc2wcj9v2Jp?=
 =?us-ascii?Q?C5ANDqKWfti+r2vo32Hin6M+hgqx/kFfK+sAlQ9jhcWkqYEasu4fM1C2C7D9?=
 =?us-ascii?Q?AA+sWTq1LjeCTQEmmQhQwqe2j7xqLKAiBSBg0ljyjNui6lKi0CplAJD6ae5u?=
 =?us-ascii?Q?jI8UMwnGfo47f53c9c6aZDuUJ+tWN6dqBZTCcrwdoOGFmQBLSz4z7ktzixn8?=
 =?us-ascii?Q?+i8E82nmywl7TNsKSL/HijckJjuPPt1GxYg4rUOL10qKBp5ppPU/8wMegdmv?=
 =?us-ascii?Q?ap3YoE+bV+gzcCfI2/+tGV9uLfeAoe4AmhqkD4nUTqZuaECDVaB43Xgz1wWv?=
 =?us-ascii?Q?v2viWZqn9KEBVYxpWyJJDAlucQqtKcAJ+eJWkYpohtlKRKPo3DbmF8x2h7+0?=
 =?us-ascii?Q?sgPe5huJ6YMMBgnw4WkVpsWXb8YKU6lDXdaFEwJV4W1doetYs9FxMkJiZqfD?=
 =?us-ascii?Q?mNkz2c9vxZDQGalHNPPyyLd+G82mtwbBzRzQPfh1ctqfcf9BiNSyXgVHkZ+v?=
 =?us-ascii?Q?vLpVDzSjeIoUJzBOVtmL5Gev7r4dWeUtKwu7OYud?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ce418f-1c5b-40a1-f227-08ddaa2df0cd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 03:54:04.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqzygJvPcXnKNGcTSEWhsf+7Y1hJAcMMZY0hkCQfePHkSlZR16q17Gb3no6EXgflwv5xJmXwI1JIbZ1q6HCsiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9860

WM8524 is a codec which can only work in slave mode, the bit clock and
frame sync clock are from cpu dai, if there is any constraint, the
constraint should be from cpu dai, no need to add constraint in codec
side.

On the other hand, with the constraint of rate in codec requires the
sysclk to be fixed, which brings unnecessary limitations on sound card
usage.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/wm8524.c | 75 ---------------------------------------
 1 file changed, 75 deletions(-)

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 403e513f3fa8..ec708c94f6e5 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -21,14 +21,10 @@
 #include <sound/soc.h>
 #include <sound/initval.h>
 
-#define WM8524_NUM_RATES 7
-
 /* codec private data */
 struct wm8524_priv {
 	struct gpio_desc *mute;
 	unsigned int sysclk;
-	unsigned int rate_constraint_list[WM8524_NUM_RATES];
-	struct snd_pcm_hw_constraint_list rate_constraint;
 };
 
 
@@ -43,38 +39,12 @@ static const struct snd_soc_dapm_route wm8524_dapm_routes[] = {
 	{ "LINEVOUTR", NULL, "DAC" },
 };
 
-static const struct {
-	int value;
-	int ratio;
-} lrclk_ratios[WM8524_NUM_RATES] = {
-	{ 1, 128 },
-	{ 2, 192 },
-	{ 3, 256 },
-	{ 4, 384 },
-	{ 5, 512 },
-	{ 6, 768 },
-	{ 7, 1152 },
-};
-
 static int wm8524_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
 
-	/* The set of sample rates that can be supported depends on the
-	 * MCLK supplied to the CODEC - enforce this.
-	 */
-	if (!wm8524->sysclk) {
-		dev_err(component->dev,
-			"No MCLK configured, call set_sysclk() on init\n");
-		return -EINVAL;
-	}
-
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE,
-				   &wm8524->rate_constraint);
-
 	gpiod_set_value_cansleep(wm8524->mute, 1);
 
 	return 0;
@@ -94,42 +64,9 @@ static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
-	unsigned int val;
-	int i, j = 0;
 
 	wm8524->sysclk = freq;
 
-	wm8524->rate_constraint.count = 0;
-	for (i = 0; i < ARRAY_SIZE(lrclk_ratios); i++) {
-		val = freq / lrclk_ratios[i].ratio;
-		/* Check that it's a standard rate since core can't
-		 * cope with others and having the odd rates confuses
-		 * constraint matching.
-		 */
-		switch (val) {
-		case 8000:
-		case 32000:
-		case 44100:
-		case 48000:
-		case 88200:
-		case 96000:
-		case 176400:
-		case 192000:
-			dev_dbg(component->dev, "Supported sample rate: %dHz\n",
-				val);
-			wm8524->rate_constraint_list[j++] = val;
-			wm8524->rate_constraint.count++;
-			break;
-		default:
-			dev_dbg(component->dev, "Skipping sample rate: %dHz\n",
-				val);
-		}
-	}
-
-	/* Need at least one supported rate... */
-	if (wm8524->rate_constraint.count == 0)
-		return -EINVAL;
-
 	return 0;
 }
 
@@ -183,19 +120,7 @@ static struct snd_soc_dai_driver wm8524_dai = {
 	.ops = &wm8524_dai_ops,
 };
 
-static int wm8524_probe(struct snd_soc_component *component)
-{
-	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
-
-	wm8524->rate_constraint.list = &wm8524->rate_constraint_list[0];
-	wm8524->rate_constraint.count =
-		ARRAY_SIZE(wm8524->rate_constraint_list);
-
-	return 0;
-}
-
 static const struct snd_soc_component_driver soc_component_dev_wm8524 = {
-	.probe			= wm8524_probe,
 	.dapm_widgets		= wm8524_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(wm8524_dapm_widgets),
 	.dapm_routes		= wm8524_dapm_routes,
-- 
2.34.1

