Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71C86331;
	Tue, 17 Jun 2025 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144830; cv=fail; b=JfITEG1LCAWLi7MOtwDrlZySBnoXcR/lWVakTq+thf4/i1tCwdXOyCwUot3czJj9K/NxMI/mtj9JDJDObWvmLxmmGgCbLxQ9T5B9gtfBXIAwoavtiZYjPMwdWJyQ9shz7orr6ZSYPCnLIPbENz4dRAQKGHYZ2q7wGB8ZTzYvtsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144830; c=relaxed/simple;
	bh=M6gc8z3M7CEOWVVpDD8PnZuF3pJ+yM6R/XeDZQiSR4s=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oSQq+22lcCUvZlpucozfu9uIxfgFgyLP02u7hASzqRrHJ55OVZ5gmEBGHf7lS+U4ZuLJs832m1EqqCCb60pIu4wqye5x707bBpoGZntqKWGpbXJhRfUFDoVnrnpM1iiTbdYrZadWOrFRkf9qgK+KnrvHywChfQi4gq5AjPb2tos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kU3u3Ggc; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kU3u3Ggc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YV3Tukn3FgLQkuUnv94Vh9HOb+M1Kalsycl5xmad6Exl97Lsd5vZDZKiN6CiVwgtwI0b6qBq0u0GmxExMf8vHAaPnN8fb1Nn+iRn/k9dKsQhogc2YUe6Xz4wG+xUNAOdNShDosbvJzKDz6hbaERaipY1lGEGzxUNZfSbTSCSQMw+I1GYf16XCo+r2QgwjkXIhw/hBER2vuIrErztIKQgdtHF2Bm+iNgNRVFbjNvITbNxgAMwXX6GQhiysd6nNfnK1/NY9hLuO0d+/0oBk4iidVco4Jh+PUjQCEZRBxGMu3rk8XjFCePChX14AY5lSAyA86+xhJ9UuzpReXIee8ISmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVNxB/1ys5T0d2VxMJysSjtVLjcJp+QM/OVy/OG7xmk=;
 b=VS7VJx4zknn79t1rY2hZI83hY5YUWYh1+rVgJLVHGtHWyZXTs755ErS9YBOxfrpqDRkJMnAp3lfvA9aA1LUuUeXAhtDpFUeDL+tjTH3z5BaHFC2ECiJ11URW5Q4GAAqmmIuaehSgsnmzOgz6BqcnAqxdExKmIueuTWyUoFIQp3/2PEol49crYReNwUsmTkhNjbsCpWOt1LbVNRKS3aePIiumyg2DkE/FCESCoXHlk47gaYlg3Dfk94FYV13Jn4KVSf1C+LoZ82pRjBNTYH/qwsJUbDVJJ32Qi5tT3bL9kykR5TovzY3YsP5R7q4tNkRaRRUMjWyTfuJS7v1C+FN01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVNxB/1ys5T0d2VxMJysSjtVLjcJp+QM/OVy/OG7xmk=;
 b=kU3u3GgcmL587n7f9BRxbYoduAJgRXDRfj51HKp8fMPWD1ftZOAIUDyzKFpPS+UtBr+CVMJqdJvcuCaaCBuYKOumtjO+UngsmHEy8P+NV9557WAhDOUY+C4m0TgAgdQ9l1XptU0O/KS4aGjTH6jCXCHPUYHECl8z9azm5lb9W5D5r1QlyLu+jANuJBctrXPZD6dZ57jvlxmz/Nx1qxlaTqcNxy/t+a9rfU3W3KmcQFZh7WGPMRbcmudisCey46fTEcqYXqfUNtHMKVrXimFzPMucoFy8wphCP41yHuqKCY5h7UbJBh8XMmAx3QO1QHdcm/24vGuISRjceqYU7QF//w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DUZPR04MB9981.eurprd04.prod.outlook.com (2603:10a6:10:4d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 07:20:23 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:20:22 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH v2] ASoC: wm8524: enable constraints when sysclk is configured.
Date: Tue, 17 Jun 2025 15:18:33 +0800
Message-Id: <20250617071833.3181378-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DUZPR04MB9981:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b704b8-e405-410f-3041-08ddad6f6c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kGGirltQRkBE+zCrwk+pkLEFlWBgEyykdt95VKmxgZn7V8lM0u3WzhTGzyO+?=
 =?us-ascii?Q?hD121M9fLnrNZUMT/XjynPN9iXV6HhJ4UQTPYl/YWEg00C2mK3bkQmtK68bL?=
 =?us-ascii?Q?+CPOsRLQNwgV/BNaHemHmWV2XKry0xTPF/vl5LqVabCjh6jJSIpxKGCU+NIE?=
 =?us-ascii?Q?qjvTOsJ6oW3lGuAV4DFAvcw1BI2puvWOYEv9B9eX2d5LzwrpdQby4d1RYnFy?=
 =?us-ascii?Q?3gXCZRbe8399Zv2KPkh2IHbPGl9IdnhlumK2SkhTY9FOACPc+f7cAz9/oW00?=
 =?us-ascii?Q?soJ37skFroM2+dkQCGtDwn29YOdScQLeCNhW83H9rHd8zhgBLw8MwbXiibmT?=
 =?us-ascii?Q?cqdMe5+xkPc0yFR+uwl0T1JhlCxGdHinmbPLLhssnt7bFv+lUbAxh5wZDNmI?=
 =?us-ascii?Q?w2v1YTxTBCxVDyefNDp0HOBc/glwnAKR6s8C8QF09iSwtyjWP5O7Q3/LzaNI?=
 =?us-ascii?Q?6bPLloZd4pHCRYjC107WnlC0vKB8D3TtGzMRRFISlBZ02w3wSr2+n+CWTJaz?=
 =?us-ascii?Q?OMlYMzYEPwLCnxxvmEkFNbaQ+p7oEtvUxqJzdGaQ1WcWzjG8Hu3uxizTMboX?=
 =?us-ascii?Q?icA/vfrKFIZ2betcXRRInhVyTG4fb42iJHE46iOnwcXiE0JrQQ0d//uNi/Dq?=
 =?us-ascii?Q?a+wgs8Her2TeVfNLC6h60QVyZn72S5RwpRxvkyXM6d2k1Lsi+9EL1fBUhaD9?=
 =?us-ascii?Q?ol+BrGBN18jg4L7Y2UJei8Q02ZjvkIw69Nz0VLuCD9wEw6Mj5pF7UmtAfHgW?=
 =?us-ascii?Q?WXasMqg909ofgQTQx5oM9vwNvwwMwlvS6swB+G0heRr1SzC8XKmTkD9Z2eDD?=
 =?us-ascii?Q?hIKGlyQzlttHTRvvaz+MCcRoFqXPM48PgSMUQaV2zOmyu5+ziCD8+Ka4KiWt?=
 =?us-ascii?Q?vFxrFKrvcTjoRTYI0Y01oH2yGxKLpaZLIG/kFfpJqJEdbVWp6rIRF6oeFw7/?=
 =?us-ascii?Q?afytjIo9F5URnRsZyHWbHVvjqhRKSuE2uOku/he2TzWOCLzFOFIycSCYHb2a?=
 =?us-ascii?Q?0Yn1LMpUH7V140tFt1yTdPBnszfnsbMROeLMbrnS8DdR0ElhsWedMHXrLLX2?=
 =?us-ascii?Q?Ryef4PQf0rgQ/2PQZiwAGHmXi880CWv2ieE51jmVCf8p+z9+h7yXJajpRYUh?=
 =?us-ascii?Q?3LHuhvh77a3Lmi74RM9vsmGF2zUXx5HGK1i/dVA0qNC6WDw6o9z5lyaToKPt?=
 =?us-ascii?Q?/gZ+iJxId+1GSMYjCcZQCWSj5BVUvoQCgguD4A0g2G7dNwllCnkAlIVtnUX2?=
 =?us-ascii?Q?TKOhgqVjSKljUZ95ZGn0zouomqHZyneVrlUflcamKOC6AbiW6f5V0ejP+hO6?=
 =?us-ascii?Q?hRMLs1m/JcCZKY7n2mtiVjCgbX2ZFq0Bq2kzDq+MNmVlPtMzk8gQeNobke/7?=
 =?us-ascii?Q?WG4PsKkXPJ04diQ27/TD20Oje+6IGRILidDUgYDt5JAWsf4pvAxfNz01I1HD?=
 =?us-ascii?Q?P6yl1b0rFcHa5S7Zu1G+J1Hkgx7guj1j+CMxa0cx/HXXajSymhYq4A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tR5W+M/fMgWc7YBOxC689rrC4o0FpWARDTRsbtDv1qNacYepeKRz2OIy0qoF?=
 =?us-ascii?Q?kAD1byboJR51rX42CPRPEpIYT1EsW5wOZYudMAp9TnAouT8/OU6nD0qFBelJ?=
 =?us-ascii?Q?guUyHySquhhf4Rp7qHae0K/km4CYqWm0LL3ahTWri4UFgWHffjb56Te74wwz?=
 =?us-ascii?Q?PMhgZmdfF6kmpAVnlIUaOuKQ2Ire+vujz/ER5uOLlR2BuvAFwHcPuncyXikv?=
 =?us-ascii?Q?YEy1oj7QK7Yles5EsitcNw/LSoG8OLor+ppsH4Nv+oBS2JHWcsVzIuLw6FMF?=
 =?us-ascii?Q?gVizv1wlCiAMaHj5ZLx5gcD4uEvNjuadw3naQFNPyylz1VH5vROWi5PJGBEL?=
 =?us-ascii?Q?NsM+BGIQsRot2UbrXqrLp9HVXcKxrbNVgM5eT9NeO8q2XPku8Q1YI/iS0LYn?=
 =?us-ascii?Q?oWN+eK9LasuRHwR1vy0cv4N/XWCV7Ljp8ZCT37v0uEfbVdOaqSq4Vl3IyXb9?=
 =?us-ascii?Q?8wf11C+mjJAgRrJnGUBpy+OyM0aTZMzCoEueDlud/E5C9MGh+geAR+dFMw1v?=
 =?us-ascii?Q?Zz6yGFV6ew9r6rRzoY4IgLTF7HMftx9w+upzVXuklcnxuSZLq0PGukqlYJRO?=
 =?us-ascii?Q?53h4x+xxANbOI+2VavqHIqsvyrbr5KnpRV6Wk+0XDRvzcxoqPgsp6/K/mZaD?=
 =?us-ascii?Q?nPZJaJ4BZLKbHF6kPQkzUnFV6hhx3vstDgEKO2izS0bUu0EuR/Eppwd9Sf/x?=
 =?us-ascii?Q?s/yWoQY7hDg75h6mzmOEMSgdOjAmNZfE9fQ36/OPhwm6hLmLbi6F0d3ZtMzM?=
 =?us-ascii?Q?BEBHJc329VgRjT4DN03KrlYFQw1F24Y6dBG6gzKv11WMLyhtJjqU+wpii+at?=
 =?us-ascii?Q?ovhuwQCNZTfGKPusifGjRePaxTpRHPhCTbmmlrxinILCYN9FDfmiArOwyBGV?=
 =?us-ascii?Q?2z0p33wh1U61/ath926y8T7T1hcQrW+OsnkPO9gp19KWtFheRVGGJCo+kPOY?=
 =?us-ascii?Q?Crp7/EErfLdrUw0Y5e/I+ncl4b4fQvTixHOGZaOz+A3tLfMr74AxXHDYXIZY?=
 =?us-ascii?Q?1rzAO2he9jkK2r2+EhY6Agwb/Uu/ve7d6fGZAy5yW8hjjc8G6kT5o2/CE/fB?=
 =?us-ascii?Q?giVQzwjAojzSbyD7nqRqdIHeXU2f+hkJUkKcu64JtsiwyrX99eEzfGHvvUwV?=
 =?us-ascii?Q?xwNQb9/L/kAmRMiz85zjpOXarP/BWxHi+HZoS61A/eT8NhpWKYJcNnon61uP?=
 =?us-ascii?Q?K9fL+nd4/z7WOZj6c5zr48GSXoR1fZYyRFDdYx1rfBf0JoJn6btlnw34oXHC?=
 =?us-ascii?Q?aupuSEPzdwrfFyWtGhIM5T6zemUkuyd+FxkDu+sr01vQg3MGfRTd6nOn/RiW?=
 =?us-ascii?Q?ZjSmXvnaO4GJ5s2X5c2sc2aO2K5e1OaAz4ToyuyaIzNPv+HFt3CEV/rCBRHg?=
 =?us-ascii?Q?YSAZVgZBHVjthjyujfldecEjlASIZdvctR7dXP5ScaaOKEACgxAjDeZ0e70k?=
 =?us-ascii?Q?Kf20PAozDTdZEICF7a1Y6Uh2Knv0dSUFA+zFVJYR28tloBiK+NLiFqnJuAmS?=
 =?us-ascii?Q?c8F/MM/PqPM2ME8wlv0SZ0eEfxRDbZolj0+4TVQ6WaoEqwWFg1ddQo+bxwY8?=
 =?us-ascii?Q?cgH2JCN1Np2yGhxoQbENHQ6g35mKicLfWcwEOGt3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b704b8-e405-410f-3041-08ddad6f6c2b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:20:22.7254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBcPqi8pDx9d52KzD8HFpj9+lCmKAw5OACgDmai43VZrOEDUkFWMzeXTv+DfbThmcrMI4NkNGxzInMvB0E7E6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9981

In some cases, the sysclk won't be configured on init, and sysclk can be
changed in hw_params() according to different sample rate, for example,
for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
the sysclk is 12.288MHz.

In order to support the above case, only enable constraints when sysclk
is configured.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- Don't remove constraints, but only enable constraints when sysclk
  is configured.

 sound/soc/codecs/wm8524.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 403e513f3fa8..5d8fb45db272 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -63,17 +63,12 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
 	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
 
 	/* The set of sample rates that can be supported depends on the
-	 * MCLK supplied to the CODEC - enforce this.
+	 * MCLK supplied to the CODEC.
 	 */
-	if (!wm8524->sysclk) {
-		dev_err(component->dev,
-			"No MCLK configured, call set_sysclk() on init\n");
-		return -EINVAL;
-	}
-
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE,
-				   &wm8524->rate_constraint);
+	if (wm8524->sysclk)
+		snd_pcm_hw_constraint_list(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   &wm8524->rate_constraint);
 
 	gpiod_set_value_cansleep(wm8524->mute, 1);
 
@@ -98,6 +93,8 @@ static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	int i, j = 0;
 
 	wm8524->sysclk = freq;
+	if (!wm8524->sysclk)
+		return 0;
 
 	wm8524->rate_constraint.count = 0;
 	for (i = 0; i < ARRAY_SIZE(lrclk_ratios); i++) {
-- 
2.34.1

