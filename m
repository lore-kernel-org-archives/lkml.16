Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE2A1DED40;
	Thu, 10 Apr 2025 23:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744328869; cv=fail; b=ZVqaCGK21G4yfU767vIcTjVzDO/RxdTtZJMiW0l8It6Z+nJZO0KDBKp0nPEy95RP+0hwGMH++s8nVI532kkUt4Wl8Gi5Y8WphjrparhMBk3mTftPi1Q0OF88nrq0Qptr+04WBIYln7WCGUPoXrPK/u0tZaXdIp0teZZ+b5IzVQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744328869; c=relaxed/simple;
	bh=CjzJktc2zAtPNSytfLwgq33p31cSGfaX5Uj15X9PV3g=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=a1dFvj3ERCIl05M21pfCJ/A3Qg6hEhNaan6JAW8Ydvy04owS0iK8wKBUhgljSEx/oMx0Shf+WpRhBwnpQGvGyZgx935fLldvq+1EbUjf9Om3Uv4SbI0T9oNacwYuVZsj/t7xPlZIWitcNcq36QMDY0NFgf1TO7VoUuhm6wvl3AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EQwSeVxP; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EQwSeVxP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4L7MOV2XxhTUVzu4P7h1RmMSEWbr7e2CTBqSyjK8Bl5WTa/mqF5Kx2MmYD6F/Bqzap5M+y7rTQRAp3U6fFmalXtWa8+FkZ7fQ+v0sTUWtXjd854KaWwNiAsFu5FC6OB7Mxcz7w7wZ+gw44Zr5D/4FKp7ZQ6xd4ZpieLGV5oxeJX3ngvRwgSFF62O69MaWWAZVGsnztL7ALLwHXAdO3hFVc9y7iQbuk2B+hP0Mte7cHJ0OlA2JiiJpzpFJKxdMjsYz8rlObeHlRNaemh/FqylixIo10zf4MLAHJjsXfrGPOooz4o/+pex8nMlz0WtHikSOqjvEW03tn8EGazysBgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob2sMRPjq0m37/F7liTnMPdiShO7d8WGMn8x4yYf2S8=;
 b=dC2A4Zhxe3Cn5T3m2T5husDLznWmpD9Vogr3jAVUwMyrbDeMGWgfEKsrgahLiAO4f7vEvLNLEHoWXlXNNXmf++FfA8pbctWxLhfLQXCXQrbPRDcMHsLN4Fuyv3IAoPECluRCU3De7f+ToVAxOUrUoU9Yw0zVIo5fyqOSaP0qud3h7LN6L6buwLkbz6HUqfZRZ7a1FJtKKcIU74i0QWbxXOz23jcbocEPg9aYOjyj/zlJUH/LnbFPxXkE0Cli8NmB3S1c5afIlNIXwWBMRMm7MN/nUMCnXKc4w38Ez65sfJbSelb50GLAv4+f6yG+sU3CVi7K5kl0h8TqL5kI6DeUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob2sMRPjq0m37/F7liTnMPdiShO7d8WGMn8x4yYf2S8=;
 b=EQwSeVxPonPxNggAfyYyA8doI1DNSTrCFg8tBRyaBUJnXsljYuZ8DKapJi0t5dzONylcOjwgcTwW45NCZJPfRlv4wULOQvfBDKZLLrmy+APeeKyUYqA9/23rNRdwG/QRB8eD4smXcGGgmkkCjxPb1IXFO+KNPkSdfu6DsTnGHZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14934.jpnprd01.prod.outlook.com
 (2603:1096:604:3ae::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 23:47:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 23:47:37 +0000
Message-ID: <87iknbh947.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Baluta <daniel.baluta@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] ASoC: test-component: add set_tdm_slot stub implementation
In-Reply-To: <20250410-test-component-tdm-slot-v1-1-9c3a7162fa7a@collabora.com>
References: <20250410-test-component-tdm-slot-v1-1-9c3a7162fa7a@collabora.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 10 Apr 2025 23:47:37 +0000
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14934:EE_
X-MS-Office365-Filtering-Correlation-Id: da2a546f-08a6-499b-4d66-08dd788a12c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DrGz3+2wl16YaKvK84C7U1+uadcy5+nLf0eBDhi6O6V86zJx8xdBms5l7qah?=
 =?us-ascii?Q?rQQ89H3s35YRFyDwOOCObZrXOdQDxDGPVD+W+jC569+RrrMBmAHR193ATVBx?=
 =?us-ascii?Q?va1c0dnZZuAOL09R8s3DvSR7n1WfSt20FN3x7HybrnodHOmhNHk/R02b1k+h?=
 =?us-ascii?Q?lRIDxUf5Ma+tk2VVRKNnvyac1WXdo3o6UYTlsKbr0csorbs5T7dmd6ogsevO?=
 =?us-ascii?Q?DstvRoBFbDRcRj31owBjVtSQEEab57VGv0tETnhXHFWNefYzt00N8JXcwhcd?=
 =?us-ascii?Q?YlO4TdEG+/NeL5V6zuraM7faMUckStAS1TWmhRJMklexnrz1kuIf/QAafxEE?=
 =?us-ascii?Q?NPyDC/wlJmwXt0WQbRSY+7A+L2+KyDRCD15Zd7TI2L7BXBMc/kXG+L92JCbR?=
 =?us-ascii?Q?8dgYrt+0qbqE4qe5DA04CRtxnCtvK8plKaWhsxcWQ93wLwIBGs1oGnimMzP/?=
 =?us-ascii?Q?HypCP4B6x55P5gpye/GGh2e2s075kJrnSAoCpf5/vquKR1350M+E/abrkCau?=
 =?us-ascii?Q?TiAWJIxf78I16iXSvsOBhynAkToI296+JfpBmLgkiOM/sakWxcLRpcEd9LXG?=
 =?us-ascii?Q?M1srFpTWVEVCtQOGjY1v7FJjO4TnKjJln/nNs1FIR79SlmcqcSxzb5SKP7tg?=
 =?us-ascii?Q?RnhHYy+Q4ylgRJDsO1cd+Dj33EfCFFopNPWHt5Yo2VW5p9fPkaibUfMsAHCB?=
 =?us-ascii?Q?lm40aTWnLW5cXjFQLN6SlWeaYoiTquMJyVHj03xZWPNNC4jIj/sBuy3Gtjvf?=
 =?us-ascii?Q?ONcAxM1LEaYWZLsSverp8FECegKE0eRFKvj9qo1sq0uDkvYNaMCjUebTY4OL?=
 =?us-ascii?Q?zh4b6xBUIoX08TfmABluGe2DfUK5O/Sc7oq563HZHNs1imhFIDE7FizreZZY?=
 =?us-ascii?Q?wuEJwH3cbPVmhBSSbMugx0AmyVnGxknb6akcOIQbXG87qvPELuUP+hvskiNZ?=
 =?us-ascii?Q?Kh15iX3ykaRi2awlA53JnQ/WvXvxShWp2N3LKHif8aJJSoHaLySSlNIu9UeH?=
 =?us-ascii?Q?sHIdJnDWEDVjiYiGCv2gRG63KSKSZdIg6SHm08lfciO1edIlXdOS3JfxRQk2?=
 =?us-ascii?Q?qT35gJOR/B5Y+x0T4cnLTWxbgJh864QivW42dvQNG3AVHFyCqe5KeeRG7Dao?=
 =?us-ascii?Q?pn3pg+GbT2jPoLPgdYVN4t8BVGprzRXbsn6ivFxKYxai39YWVhvEm1hANu0u?=
 =?us-ascii?Q?fh8eUMjcPEwbSGyjbifGV1VyxRu7CDdqquT9DQRpg979w06/5YZHIq1GFNlO?=
 =?us-ascii?Q?j3A0JOUoi/U5sQa0k0UQEYj+dRuwg5tZlphl7xW1AnIpyEt3zeiGEGq05dQU?=
 =?us-ascii?Q?E8Js1Poqx1e+uZ4ZxuZEWGe4ywOeBDiPhf50ARXaBPpC//yJWD3lvO7aRwH5?=
 =?us-ascii?Q?okQSYNx0zH2JB/pV55AvMHRZModhgFNHIB3dYZn7J7OPJZopOmEZnXFvFeSt?=
 =?us-ascii?Q?SV+qTnCnLp2jh4PCNC5HNjM5LxYEroaJhjkTtUbXuWPVLA2yKtIWCdigHMox?=
 =?us-ascii?Q?xOYUEGoEleDo78A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Raixt6jel/1BOG+ElEHUr8uOEkpuNOKap4aenWk4nl2q3H9FYC8j87wDNSu?=
 =?us-ascii?Q?GSYQZT9VjyZ9noQI9wxJxiQBFxCalfdqdXGjERpIdIJpHPxklCN7nQbHhw1r?=
 =?us-ascii?Q?7KFgPpNSgjnCkmRZ7yTec70Xnd+GpPPuZKU6MqJ1gS1dux5ZOrR9hZ/MlsNe?=
 =?us-ascii?Q?cgfPVsexu6AGWgLOQtQtlvEZc+Dr4mgWHPHfUjJrg7fIC/Vpu1tbht1KHjmZ?=
 =?us-ascii?Q?849ciLg+HvXgiA3K6aGu7AXlR0DIqnfrdBY15PwIirE7Bct6NkTy9PjIH1TW?=
 =?us-ascii?Q?p3+gwIpAHxnTmYfYuurLqwJv+wwduBm7HZ0ATbVK5NPdRIGJGuZm3Tm4Adwj?=
 =?us-ascii?Q?iXfZ9DoWnqNQ+ackC1//CQ2EX/eTHzG1HMjf78khXUz+I+vTSu84/zeoi5fA?=
 =?us-ascii?Q?cRRT40XLQQBl0OjAJiC4bX07e8wdBkbXcwdRzYZfT4sOb2gmAr+uKfrp1iRI?=
 =?us-ascii?Q?DJKAxSAwI9WQwgWXZNcT0cem8GhrhfBB3qAuCMfirXOBm1OShkaTae44Wwn3?=
 =?us-ascii?Q?7xY1NE8Lt/IPZ87iyxFAU5/QHd4XjgzdtEKv75XqGw2jka5yndUa1F68bedj?=
 =?us-ascii?Q?06lVkOL3AFkHD6ow5fjjOklyPMAFzkiXMsmX2NTYge3oU1oAT8Y0VYJZnlTy?=
 =?us-ascii?Q?Q8PmDqn/8iivNi2c6B2kfh7SLjuvmARDxmQjDptc66W2p80sKHGD5GvetWwZ?=
 =?us-ascii?Q?dS8o8eJmEl7oLKbMMNsrqY4UfZ0mvPyuBQyNVmNGXRiUr+RelZPsObIZER1j?=
 =?us-ascii?Q?KOnA1yM0uc9yXe1AXPd04FTS8nMbRH9rLsWZ2t2+7YElodFZjDHS8txLjW5S?=
 =?us-ascii?Q?Iv8/oQO+WMUtNh2f2hzyNZU3OLwik3DcLA5gmR1xTPYu35TAYGuzRq2IwYFr?=
 =?us-ascii?Q?p/b9ABRCakVLnQJhsEDGuMCrIzu2jjgqD8Qy7KGCHzmw+ZJzKS1zn8AEQE/o?=
 =?us-ascii?Q?5E1bp/DKVGeWOxgYlOgagXnfmaimaUfuNsGGxIKge1wa3Tt5pp9mu8PJuPEU?=
 =?us-ascii?Q?9PBi1rsc9HOr2neICXTLb1gA4fNvsAqUoG7drpkiJiNOsDrpEm1yKD9LKjJG?=
 =?us-ascii?Q?afJoLbZaY1ekIs608fiPER+HDnI+u36i3GIkYRR7u7rapwc/nM3Mz+DkwYAI?=
 =?us-ascii?Q?832P5gNyy7Tgh2FGRIjhUKNzcxgbRZJ/xjeT6JjjaDvFtHmYbl47Ig5iLu4b?=
 =?us-ascii?Q?XMX9p5h+Z25aBHtfq0eDele3JlZtsmOrYGQvZ11q3T+nUmHRBZ+bblvEfoyB?=
 =?us-ascii?Q?I/QdDsAp/kXyfma34ZEq7ez/N4WoFcLUrWVdYeMcNPpoiymH6EHcj5glHOd6?=
 =?us-ascii?Q?9rK3VuGsYasHWn2SApt/0ZzmxzADUX6Z/aw11cSiWAU18V79X1dUSMmcKpwv?=
 =?us-ascii?Q?E5ecyIySYDYp8N9NrKhy6SnnHXUa73kItIjrTLo2B4QF0xsiUzFDnxt0HNHw?=
 =?us-ascii?Q?yic+TzNejUKHsXXJ3YBeDOSeqZ4umtC8Z3ZAUI0aRWmKhtad7PLS7grewHoG?=
 =?us-ascii?Q?ohADc/Cwblb7rUWRNZJ4bEwSAdg+PnOGHpknSg1U97AGc7aBrNFtKpTtJqUk?=
 =?us-ascii?Q?3dbYMCX0OlcTBao8YAVPejRM8MB5l8Ob9/WHLVXsvWLFvrHKYHs8hHyiSC45?=
 =?us-ascii?Q?07+tGgL/yCtMVhZ9NDJci08=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2a546f-08a6-499b-4d66-08dd788a12c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 23:47:37.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk3C93p6bG6MBug6MqMMgUG6zO+d3e3SMYKgUnGgToUQyCXxQLaDKsXQPdY32u8JkYl0WrqY9iNayqbWQZfWgK41qLRbsosFYRQs9OUBaT372FTJ19WI3YO/9hJmuITV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14934


Hi

> The test-component driver implements various stub callbacks. One
> of the ones it doesn't implement is set_tdm_slot. This has no
> functional impact on whether ASoC core believes test-component to
> do TDM or not, it just means that any TDM configuration can't
> readily be dumped for debugging purposes like it can with the other
> callbacks.
> 
> Add a stub implementation to allow for this. The output uses dev_info
> rather than dev_dbg, to be in line with the set_fmt stub implementation
> above.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
