Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59029A0;
	Fri, 20 Jun 2025 02:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385804; cv=fail; b=MM2bZieJbNRRFrFy9YJdSnpYZpGMxV8eAF1hKeE4YP1fflF9AMnlncrCgNHWOUhtc8yZ9yiUMUCPmrokrR+7YxbYV3sqXmU/365WoUMpVc6TwHGChKkyshYCbKdlPoOxWQ+jXtoOI9aX8Gd33zDTWwQJJ355PwcLG+orzYinXDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385804; c=relaxed/simple;
	bh=Q4q5MyTcJz327bYyD7859N889d7o/wMA96kUsv052GQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nXWdhpjxB1fcYdflgVMCCKaF2WiZLrjeOZQJqnV4jfRSdDZTb3JOQuDOVlh+LxTv6y0XRx7dNAw+JCmEBEHwD3BAmUWkiJnztl6leuzZ54+x5KiYOWKKrVES0vufM1B3ojpFzbsVZFKTZ1Zs55bZH3cQ4Zvm/Pt0E3jsB4+3Sdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aJNMLcuk; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aJNMLcuk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjK1gtZfs/KkwZqcuYf3yR5uQv6FTYm/HwSglDMVBqJ6qBV3n/4fNHhk/5H5qMO+GXjcWK6S9LvVne1VsU5C2y1Z4ZNwjqaRPjzI91HilXZO6P1xm9pP6TW3M8a/y7olFplx4Xwnyob80tuPaIbDBFJnAGfP8DkDprtgOOgy9OIrjjD8F0+DYTUPtIX1/KAtkgVdYUGmxrIucG4f0v1zGh0TN1CECXkfOPNtMWkzNML2DKLJJFc1eF5bCg1HHCxc+Ll4d/UWk/hp0P8GRsEem/Aeu+BzT2vr7GfI+jJdkyVrwQqDh/N211YJx9Ot5zS7UJ7TW0+m45ElIgUwZK8mxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGegtEMkczxR/wLNBS+hzA1vadoUL4u4tFFYHgkkvUo=;
 b=SL9/izTKNH+r9iy+FNv8bi56oIj/JX8YI2O+/3L5oMSWmveEz8OhgKGO/755UIUvj2WTMQK47T2mfMBCZ6lGW0c+FLcGHCqydl5Suz6kritbTKeVwiemZY7Az6jMp+ItUr8WW2uxCA7C15V+8tiqfyZcjBsAnl9RUH7G0RjJJYVBwybsn/myZTcMYH705t9rvfjFU9gmxsx0IXi/T/yVM1ELH7cjH42CC3H46+looucbpXMn+QF8GdPNUy4jY1Klhp03m/wYCR1RfzlFi9ruwbHM/l6h2ouSkf5kO8W/ZV03JvXG4j/VrZFXc8kAxj3Th8QvTVX0G1r1+h1H+E1olA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGegtEMkczxR/wLNBS+hzA1vadoUL4u4tFFYHgkkvUo=;
 b=aJNMLcukpjZKNpw03tZGHoJyTkiSPHyuLo0XSNQ/KZKOPqaZV3auXtgCX3rjKfuwAsZy87kFUaVbfZq5hVD+rNFkcMEUtsfnHipEs9OFnPvx/0QUCyxKxgugnQxQo+r4tz53aainR+/+l1eW/Dk4yvXa8/6bDtTGFaC01JHZV0eQujpze3rmg6bliGOK4+EUCZgkey0vR8Y+soJo1q0XVGKtRFo5rVBLmmdN2P6wSH8dpjn3F0jV3fN5DFHpNxlIrT3LPNasEU5+roMSeYh5PQ/a6YVrPfF4U5O4Oilrs4MIpMvj4ahAQTvI58tqCXJApl1J7a/YbsZR8Uo6U5DXEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by GV4PR04MB11332.eurprd04.prod.outlook.com (2603:10a6:150:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 02:16:39 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%4]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 02:16:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH v3] ASoC: wm8524: enable constraints when sysclk is configured.
Date: Fri, 20 Jun 2025 10:14:03 +0800
Message-Id: <20250620021403.624303-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|GV4PR04MB11332:EE_
X-MS-Office365-Filtering-Correlation-Id: f002be43-a356-422c-f276-08ddafa07d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B5J5wlMYvasguTCJQlkiCNp9z7Aluwa08jtDFzxkhbRxydO3yKD9A+oncBvr?=
 =?us-ascii?Q?1vsl8CaYHN21+A03Yo9ZoaZI+0OwPjTLvFKTZ0fXRCO4p8F11gyrMnDggAvN?=
 =?us-ascii?Q?m/ousi47w8OrGaSmhhofyJdkQXFJq54n5T7SD3uvXSVdlFhYEwuKVm89j7h/?=
 =?us-ascii?Q?cKXFSSj1iSiywf/FEhTGO1zMzMu9t1mB3UCww8v24TinObmyrXQGyQmGfk39?=
 =?us-ascii?Q?wFC943K2YOOXWM3m/pyng1FUC+sTWobBu9x/wsIPBJGxmmw3FRiWRfh8Opbm?=
 =?us-ascii?Q?yIGNgEISKp2lsQNEtIdESduCtsdC0KuTRpycO3luCnl55VLS3IBjA1vsaDHq?=
 =?us-ascii?Q?g/LOBhdKc2S4kuDrqr++BS+fZgNvS5mrRBhwj/RpYh9mTQyI0l2MUnIREUA2?=
 =?us-ascii?Q?JqnuU6Mt2lcAK+It41PXSTH4Fn4lZ5nfEqNgGpOqDX5523FameZOXknjy6Am?=
 =?us-ascii?Q?/nwUge+LN/zfPDGwe97wdqwj0FLXbpZM/8617DHpngK/YTQhCaaZc1q5/5to?=
 =?us-ascii?Q?aY8+spqQ0w4ysyZyJoFXDdx9uaTF5RW5tA8Zu1UNvfDS7TKhNWhexKNwtCQU?=
 =?us-ascii?Q?ismqR8GlmmdBdbZFik911Tc6DtvG4sDxrX0JtfSXyKBg1reVxyOAonV4u6ES?=
 =?us-ascii?Q?RvH4e0yIgdpDxqBg4sb6ma17wjMV9dxPuKBJ2vlYelrM0bPO32CiccfdsdR7?=
 =?us-ascii?Q?7syQ+904DW5aqktvIBd6nz0BEG1gBJV1PDauF0xmCBwxluwUY/QDZSs4jrPz?=
 =?us-ascii?Q?omjlqrzSE3Lfcxcr04Zf/E8OyBnkvnQ6IO2Qfx09LhwVfQPJnMidwLWuJsxA?=
 =?us-ascii?Q?cuuyeMPoG9cqToq3fFm08dY7rdOEJVl7FhaQ1wKh2mPsuyP/vSsp/H27BsK9?=
 =?us-ascii?Q?Bwh45EfLh4Bu8B3Nt/VbSWiILhIQyUJ+2hScIyskX3dsCkSZGavcLtnMEBlu?=
 =?us-ascii?Q?LsRu5amniuqYVyYPRKQhUrM+Kjy06rBiQkP4UvOltiEVtJ/PCpuRmtWh3GVc?=
 =?us-ascii?Q?37cLGwrsZqM4YLSPUfstNB12m4nYP+5VR58mXe0COcIO9UUXtIDajYiavJMv?=
 =?us-ascii?Q?2GP7kCVfZjcihK0ZRdYbKv2cRdLExk+/FyMus5rMzW2sx78rYuHq8qelw/ax?=
 =?us-ascii?Q?0Le773FOJ7+zL1cVDJsE2+a/IawxUHWxLvlNI6kiRWb2SC6wEXoja09wQdOl?=
 =?us-ascii?Q?kmdfKOYp7E/bv7S7yS0G89vuD5/fSwiCCkJ/LZpIYEgp64ojWhc35hec/vHV?=
 =?us-ascii?Q?SNfD5w9fyLmOIoCwx07Odfuq21aw1rOnDxzLP52FSB0MyunFEX5lVqQDni9g?=
 =?us-ascii?Q?dqdlNtgRIpz8wUihsr1zkts6oANzK8m62PPNJ43zgy0YsIAFW1zz/x/YsNx+?=
 =?us-ascii?Q?1d0RmWAg0hy779ZHwtG99SB0OUKfPjy19htxrWXUHD59GkuKS7k0sV/ONnVr?=
 =?us-ascii?Q?eUGw+2ZlNAT4zvedvfj9IncfXvUAlk2tBXPgPjH3RIscD4UL+vhidUg2nooo?=
 =?us-ascii?Q?TRCGMdNQs/1x05w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T+zAY8kzBVBaxgoa6h4tBYEdWidGTQ+6ZnH2LUcDZcZyNYnY01O3RfCGdIsk?=
 =?us-ascii?Q?JScGqxzIhM5V5PKpSfYIVriBCdXV9zIqwdw/kZqAvrl/iG0eR3QPzSkw0kxI?=
 =?us-ascii?Q?AkqZ5JOVchlxh7B/Kg1M0qS2sRpyeAPeILUG9HkP4rLUM9tNijzGvNWrcVdg?=
 =?us-ascii?Q?fzuisTfoYqeEuELiZmS5a81azgRhbqaEfQv+gRfMdbu8HRv6gydxSK5DK3o7?=
 =?us-ascii?Q?v8mjJ1q+hnYITlyF3CNuF0bRk4GniI2raA6wWQMWctnq95cDY4cwklBzqDHE?=
 =?us-ascii?Q?WkN6FSoSKmyxYtmFumLZpPaiZe+CuUuA5qQyg8lsq6RhWx/8XGfpL05h+swK?=
 =?us-ascii?Q?P3W49T6pXZxoB00nw5omwmLiwCqRrF2x73CVvswhwD+BM8GinTTIYswTXQmc?=
 =?us-ascii?Q?rpGs6FoS9pw1bgtFquk2FhBV/YvTbBbmC7QiKx5b88+jRmp5FllKQFXJxwTK?=
 =?us-ascii?Q?ELMa1nb+UTojarbWDi8y44Nk97J8rlK+0eGsIw2+jXiECx+XE3VJUkTNe/op?=
 =?us-ascii?Q?6GzS+vCZTlEtaUb3k0dyJcqT89kaVamdeXtKJDEzAGRZZez76x86SL63bijU?=
 =?us-ascii?Q?fENPkxZMSOqHVrj8wlajZGL2PCxKy1sbKd07e6iRgfOeK1eo/muyuvEbg7B7?=
 =?us-ascii?Q?vR0EdOej4N6CAKC4RMH8k7ykGuyCAZFvLgQrqo0xQDEA4T3si/1kLuKe9rye?=
 =?us-ascii?Q?flaPCLlCB+7zbuVPeQKL1EJGdv0dEV1tr1NQo0xpebC+f/VTRfE1Am6i5YOf?=
 =?us-ascii?Q?7SeI/H2hWjeA3894agP3Mfcux7j3gmwC0d6AtbFARU/47SNq7oXPRSdINb0w?=
 =?us-ascii?Q?9GMugshiubSwZvMEzjy2inARyBF5oKS3UAQvT7J26/iNNlX7tK9vlp0k6Zry?=
 =?us-ascii?Q?amvvPhTudlxDR/3gI6q29CsKzQVRaMiCAaNMzlUw7OyvL0rKwdCDUABtBm4i?=
 =?us-ascii?Q?HrgTtPYTdXVbOL9mxnNo0OfQ19GQs3YI+7EcY+SDJI9isfiBhTRFJO8UohB6?=
 =?us-ascii?Q?Ll+bnoJy1fdcxurwfjHkz95XZTbLhWZOPaD76COWfJqIe3dL1OMD1+3Tdc/z?=
 =?us-ascii?Q?iYe7mluSR/wSzhLh+ZpWN47G82yhk/S41ho3fGm2H5zdzO1PeolTAaYA7xeG?=
 =?us-ascii?Q?kr3NCR3xbSMzKMTkEoZx+HdV7gMEtwN0WWDJ0YBzCsGoT0PaBeJ/25J3R5gr?=
 =?us-ascii?Q?uwkPntLh4JwevD8Fw3U3LDSLliXllKF6Q/sxRAgEk4SRH5GZhVPKRkn9GXLI?=
 =?us-ascii?Q?Uc7q2s8AQbedbvmZ0ldXqpGWC9wV7pu2PSSZNOBfpa/i5hUoSSMfbFjp++oz?=
 =?us-ascii?Q?pP6zYvFgsPI1YCsEkwOYexCL5UkVAbm1d80xldqguP+KBn1ceeDO27LRLnsP?=
 =?us-ascii?Q?4wUhrXQU8hcYICbCIZE6SG9TFPydSHcuucOYfOBF4/qSbyQWJdwrQm3c9nNI?=
 =?us-ascii?Q?G9pr3yYqxnF9Dl5PCx8UqETDxFsjapm+URbWfOexLe3TBGbC1z3T9VHp2vCw?=
 =?us-ascii?Q?O1tS0RJDCWgRMHxMZlK2qOECOA2GmETUjZePTg3gZbiRsH3324sQqYSgHkor?=
 =?us-ascii?Q?GfDfnw21SPnrDrlKFjuOmpZIWf6E/uAYRREZ1/JV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f002be43-a356-422c-f276-08ddafa07d2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:16:39.1269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs8OciZzh/MFVu32V6FiAQHCHFZiecXkiceCGJoGNDhequFxWq1eaLulpaAtCnDk7hOeipb0F95wroX+Xa45CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11332

In some cases, the sysclk won't be configured on init, and sysclk can be
changed in hw_params() according to different sample rate, for example,
for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
the sysclk is 12.288MHz.

In order to support the above case, only enable constraints when sysclk
is configured, and check the rate in hw_params.

So overall there are three cases that need to be considered:
- call set_sysclk() on init, then constraints will be initialized.
- don't call set_sysclk() on init, but call it after startup(), then
  constraints will be configured, the constraints can be cleared with
  call set_sysclk() again in shutdown().
- don't call set_sysclk() in the whole flow, then there are no any
  constraints. The clocks depend on cpu dai.

Enlarge the WM8524_NUM_RATES to 12, as the supported rate range is 8kHz
to 192kHz.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v3
- Add rate check in hw_params, and enlarge NUM_RATES to 12.

changes in v2
- Don't remove constraints, but only enable constraints when sysclk
  is configured.

 sound/soc/codecs/wm8524.c | 55 ++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 403e513f3fa8..6b1a7450b0ac 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -21,7 +21,7 @@
 #include <sound/soc.h>
 #include <sound/initval.h>
 
-#define WM8524_NUM_RATES 7
+#define WM8524_NUM_RATES 12
 
 /* codec private data */
 struct wm8524_priv {
@@ -46,7 +46,7 @@ static const struct snd_soc_dapm_route wm8524_dapm_routes[] = {
 static const struct {
 	int value;
 	int ratio;
-} lrclk_ratios[WM8524_NUM_RATES] = {
+} lrclk_ratios[] = {
 	{ 1, 128 },
 	{ 2, 192 },
 	{ 3, 256 },
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
 
@@ -97,9 +92,11 @@ static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	unsigned int val;
 	int i, j = 0;
 
+	wm8524->rate_constraint.count = 0;
 	wm8524->sysclk = freq;
+	if (!wm8524->sysclk)
+		return 0;
 
-	wm8524->rate_constraint.count = 0;
 	for (i = 0; i < ARRAY_SIZE(lrclk_ratios); i++) {
 		val = freq / lrclk_ratios[i].ratio;
 		/* Check that it's a standard rate since core can't
@@ -108,9 +105,13 @@ static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		 */
 		switch (val) {
 		case 8000:
+		case 11025:
+		case 16000:
+		case 22050:
 		case 32000:
 		case 44100:
 		case 48000:
+		case 64000:
 		case 88200:
 		case 96000:
 		case 176400:
@@ -157,6 +158,33 @@ static int wm8524_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int wm8524_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
+	int i;
+
+	/* If sysclk is not configured, no need to check the rate */
+	if (!wm8524->sysclk)
+		return 0;
+
+	/* Find a supported LRCLK rate */
+	for (i = 0; i < wm8524->rate_constraint.count; i++) {
+		if (wm8524->rate_constraint.list[i] == params_rate(params))
+			break;
+	}
+
+	if (i == wm8524->rate_constraint.count) {
+		dev_err(component->dev, "LRCLK %d unsupported with MCLK %d\n",
+			params_rate(params), wm8524->sysclk);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #define WM8524_RATES SNDRV_PCM_RATE_8000_192000
 
 #define WM8524_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
@@ -169,6 +197,7 @@ static const struct snd_soc_dai_ops wm8524_dai_ops = {
 	.set_sysclk	= wm8524_set_dai_sysclk,
 	.set_fmt	= wm8524_set_fmt,
 	.mute_stream	= wm8524_mute_stream,
+	.hw_params	= wm8524_hw_params,
 };
 
 static struct snd_soc_dai_driver wm8524_dai = {
-- 
2.34.1

