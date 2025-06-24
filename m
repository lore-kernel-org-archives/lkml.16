Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013039.outbound.protection.outlook.com [52.101.127.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE68C23A9AD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754006; cv=fail; b=g8urYnULjADgnwb3yhjEkVptyIh+2rswP4mYBCU5ACAuaUXioLeuZqFvbWUwBf/sYfpB7crXlbnNx3Ww5LtbIbJSv7upbIQW83zokw8/WMIxMpbSXPwI8dOMEJ91VNUxwtvwgstRjETeSdQAJEhBwih2Hr//OEz377KyEdtCo0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754006; c=relaxed/simple;
	bh=dTHeYdT59g7QHxaU3DfqweOzIDRoVW20eEQDQ7DMQ54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=snJRuHwUlU5lggOvkMP70hGy/mLiYz50/TYvuv/YuIGjuWnKaHnACXbjv4sWRhloAZOXkYLXLLjVAiTTOKk1vf45rsr9Z7rgfJXpZQbGOAilhlJoMGPE8veam4i+yr2o1pKznSYyLQCc1pnBBzc8HbE6kDG+eJusUeP628KtIJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mwmaD1WB; arc=fail smtp.client-ip=52.101.127.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mwmaD1WB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWB8mJLg/u3oJQsMFbQOA/wqBQG2k0ucipbXhfxcw15Fjt/9dtmbToyYm/S2cTAwUBb+vKyutkdu8dN3UWWESoke4+bHmqi3Rtg5u01VJne0x7oSg/Hozidx8jD5QKVHyyd6hOQ83i6J+zIh1yBmNiVweGUsDZzXqxEm0MQnhTBNLSGhCA+y4PBMKjRZa2RYsQBWII0YLAx6LLAxdq8TTb2wi/wGHYEV7MAmJy8VJCommWdC3qv5dhVRNe2+7wDthP/cEWzz9mNU2bbeBU4IwoKgN1rJR+lVLVrkZJ2Ty3woFUb3kUrRz9jqTE37RHBNRIt9KKZEWp2sLrDSKT4rwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCgrn1CiWIu0sdiGmnIChmG0LI59sA3W2q7wMvRlU5M=;
 b=ToaHVtDWtEL1bnKXip3YmBQ3TPzs4RGzsG68w5x65fVBYgVBSiXVMZwPNWhbMvnhAleVsWPpaRCCyx6Jnc6DBlSwIjeIly3LqgPLBzsiQEFafsnrk1nGYXTBdsMNuBJWOjEcZSE6TvWIwWqR2AHk6Ct0iEzzVb/n48+hzP0tsljKsfQTF7Qi5NNhQu58ovgGoSkmoaCxsdmE5acJW2SVKPZgZpnGtJK66LZTR4qUzn+SiLIKMVeKhVxdQ2sH/W07SkWw4Nm+vOtskFQ5LsrK0cltCoaVb1mEgap9AdZgKWrbvbhHvHpvUgffevT7o3oXsLNXJuKRg4OVTujgWvBAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCgrn1CiWIu0sdiGmnIChmG0LI59sA3W2q7wMvRlU5M=;
 b=mwmaD1WBwPF63N1Py+pjMJ05x9qNXpD2/JkLgxCc9jHQlhhfrvU/LmR5qHmSCF8p/MkRCQ21oZ7RSNuGqy6M7oLU1fnz/uCs/trVFOoCZT8MXpzBT1OFKE9TxaD5n8T3IDcNuOFeaQrnLBNTA7ESZsprmJ9Va9rWWOAQhggJ5qorQjHyYyGddfoyTSEiClLdLi+/hU7Dw25VuwGYqpce8cZ7S7ppXL4hY5484xG61TGK5W4MpaZjCe0XUp5yTAQ5kS0fAmYpQh7ONGzUsMSk5DixcJaKJyEV9eGcXSVWkOnLCAL5FV59DJxLip+DrmOWDvKkYkYWaZHuoJX2detDyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6273.apcprd06.prod.outlook.com (2603:1096:820:ec::10)
 by SEZPR06MB5120.apcprd06.prod.outlook.com (2603:1096:101:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 08:33:19 +0000
Received: from KL1PR06MB6273.apcprd06.prod.outlook.com
 ([fe80::1f06:daf8:cbb3:a0be]) by KL1PR06MB6273.apcprd06.prod.outlook.com
 ([fe80::1f06:daf8:cbb3:a0be%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:33:19 +0000
From: Huan Tang <tanghuan@vivo.com>
To: krzk@kernel.org
Cc: festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	srini@kernel.org,
	tanghuan@vivo.com
Subject: Re: [PATCH] nvmem: imx-ocotp: Use helper function devm_clk_get_enabled()
Date: Tue, 24 Jun 2025 16:33:12 +0800
Message-Id: <20250624083312.453-1-tanghuan@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5b048b32-36b4-4c4f-aefb-058674147b76@kernel.org>
References: <5b048b32-36b4-4c4f-aefb-058674147b76@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To KL1PR06MB6273.apcprd06.prod.outlook.com (2603:1096:820:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6273:EE_|SEZPR06MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e580479-1b76-4cd5-6e0f-08ddb2f9c5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ldXfuYzxuED0yTK0QpNSMI+D6avYfefBZFEqjm2I6r3wRqLEQ6JrlQfr/EyJ?=
 =?us-ascii?Q?DGBc0X366VtwyJ39UXmzD6kAqZWyc4QBS1IqwZOa7j/TjiihdM9ojdutj9sJ?=
 =?us-ascii?Q?lwEYICYd34vwQMdFcC90NPZ3f6nUG3/QfrOw/5rgnF5eAauXCtaEj8D17j5u?=
 =?us-ascii?Q?4FqglpJXuf9wXHw4QNYkJwNY3b+tai+Q0n2g3kh1OY0XvJl4OrWpEtrSvqpH?=
 =?us-ascii?Q?2UXGHkNrXXHd21xTbwYDw8Dr6MoJvNf/lKh1foOxQXzvYnE4tVlXzpTiVdem?=
 =?us-ascii?Q?8ZZrb9W8L3rw6o2aY98u9TQ5c9PXa+/yjOI2h+dBpr8IeLBsibTUiFyziizT?=
 =?us-ascii?Q?zpQ4p4elicgieWZVJwTNnFcTQOjBPILW46dhcgh92qp7is864Xuj7/lFkF3N?=
 =?us-ascii?Q?k38qZhpElGyfkcfMT6BSvi6UYaGl1uiJNEl5UvPE0pCbICujIH1VhM/EuXcX?=
 =?us-ascii?Q?iHngyir/znmp4KseF8/Z1GR66pOqTMMHUiQ8JaIh3L4H2blUl42FMFvAslsN?=
 =?us-ascii?Q?MgUoahGfFTJ8MhSZWc0pryslGpslrAqX7R5l2/1RdrL7uVWQq8dhv5JROT7Y?=
 =?us-ascii?Q?olcWr45500q49oN9KN5PCBLDezJMzQUBxAYUCc17Q3G8mayVIVdOJ/eD/59T?=
 =?us-ascii?Q?ZEN9IRpMF9w30qwupwDvxpSTCtGvJcZh5Yn6Vosrtrw8pg+xRJ9TjHDK4CRo?=
 =?us-ascii?Q?1AD240SMeTLK52sX0/vjyQk9bdgZP+Ulnpe8PCzbYNt67DBXPuiImniMFL1d?=
 =?us-ascii?Q?0UpDEKxANIeIH7zFoQetymBMepU+jj7wdaLEBHTSV9tNiqvidTbKJTPdlUO5?=
 =?us-ascii?Q?PLr6b4taOZYcXkx6bKxQjtAoeAjH975KZSZqfPUHI/2k2cO1O7g1y4jfv6Hv?=
 =?us-ascii?Q?AsIHuhe/R18kxePZFZTroiZieZ62aKx1EHZv8LRouHf0H7r1hRSle2Dk7umS?=
 =?us-ascii?Q?R+zm0CaTCEb6M6/2w0k6vFKSK0+MTHKEsW3/H5TiEByLiXaJzODNprvZOLJ9?=
 =?us-ascii?Q?3y39Q6quzpvDE+tvaPEzLxiPIeNjKXRvxDTAFSmQeow8HBm8UbElXqQPnjyX?=
 =?us-ascii?Q?VtvVps/hB7+BQOywFbcniRPstCJgy4xCIcvddVxrcbKJ5ouWC2dccA/Eq5Io?=
 =?us-ascii?Q?EjJG3dyzxWgQ/zFB0X1DV+B7/3uZCkZPrGFkA5LnkdtoDvxcym8de3S4Qs/R?=
 =?us-ascii?Q?G2KBr6yfFysOF8o5UQ8LG2JALly2T3gFIv5+efxi4ov1x0ZmInSoPwJ7nfwr?=
 =?us-ascii?Q?hpqXcxcJcUrtdpM336zVTVdL5xBisye+C24PhKzBV16lJerZUoJGDdL2jMaE?=
 =?us-ascii?Q?2QUI6+RS7/JN0ZXIM+fh3nq9SUjDd7kC858PrPrh3nN9/gXTBincXZxuuwfw?=
 =?us-ascii?Q?F3l5l2r+ZxFecUuRXVBxS+NWGRDNLPryJHKU4JvyC5QMzJ/HyyttE1sQ0Zig?=
 =?us-ascii?Q?L3E7f2q4I5lKYnA33bB36mXVm7hzEpTL+xrJqR3nS+GCfAO33N9rr0VkneB4?=
 =?us-ascii?Q?2TeBJKx7iERqr/o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6273.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IkRcRPOJbM0YChPxu3YK+S6QSqC4Oh1pG0XLrcr8yHDmbfKYEjVHuqTL6TZj?=
 =?us-ascii?Q?At6NK5byCqwuxhieTg3Lur887bVkFJY8TZEWamZDnpiYskGNwi5dnFYYZ/wL?=
 =?us-ascii?Q?oqLA7jo3SpKZGcZGozUw+pzGra9xc3l1IEz0xVDZM6LRHLCFn90b5vCMhanj?=
 =?us-ascii?Q?wvMGOLeJONI0xtQ1o1pQ45j/x161SBP1mriXXUBtLv92WJHb/wwSeM4MdYDj?=
 =?us-ascii?Q?Qifo7QE9zZAFvR464zNfXuS4TikB/+qynf2SftPib/q9+0KyDtvEu+xycsJe?=
 =?us-ascii?Q?3XJ+Ykk/OTeyPxOj6bydIh8nkyKC99YmDjp/g4aSbpU6rGVd+eCyuHqvONHg?=
 =?us-ascii?Q?GQd9y5uL/c4uQWDVtuJknCuJAzBJIkxE5MVJHet1QftC9VDkcjmhovxRp09K?=
 =?us-ascii?Q?B2va+FY2IvIwQDJzWuWBSrruYb3CzryFX9PVuUhbjnut6vk206qpJlvqIOXC?=
 =?us-ascii?Q?XLE1/ZrMOd6Iiw3VfwLvP43ujQ4x0U39x4ANlLVenqqYRqjO+NztZ0AwciBe?=
 =?us-ascii?Q?9AngsseNBbjI+0gGMfnU0wP0/8/rI20uPeVLJ8Tx5K/DCvADI11UYPKvVuk1?=
 =?us-ascii?Q?wLmvIQRlMKjpoc5ajZhVmiSjy5TFIb/oXnMyiPo1nsIu4QCpFAwpSmJSM3w/?=
 =?us-ascii?Q?SbBfBggZOyyy3GLGOpgs3cJ+1VMdq734ZzKECVue+7b1jt5C/ecUIf0tZIHm?=
 =?us-ascii?Q?AnTlrGEZhGDJ2HMOgvoppu/5jmsG2uaKJQ1liuU/boVmafNbeWnD+z4bQ+pW?=
 =?us-ascii?Q?f8rw5B6a9zHsYSNL5BwyDBbxVw5212PvnGbt9VNtu/IEolPHUM4WYVHE15zQ?=
 =?us-ascii?Q?WknlxW4aBLHsu31ViECSQRWz20F0HLlnqJJEKufqAjc4pyR6qp9HIxn2QKXl?=
 =?us-ascii?Q?s4ks22vprOzU5jZP8DgOKdYmlPKuhAC5+50poNoWSubME24vIt1diYCtw2Ow?=
 =?us-ascii?Q?qyqn80mqCM6tFJIb/wI1GOrdTSFxqDmDdswWRM/rUV3jvfmEVUtkMMVKsJ1o?=
 =?us-ascii?Q?IXSmqhmvCvZ15J2mqoA3rBrJ01xFhFc3sBPFehZCJumajieGjRhlw3qGeh8T?=
 =?us-ascii?Q?YvhHCIapkXB8EmpcVOFLX74g9dX1+uB6spHI2kVJ93uSLGKYnkoGHQi/+rQB?=
 =?us-ascii?Q?OSsGCCIDQ2QsobU9MZtcmOqwcvzftIXKipT0aKQ+5PhCmiRAEa8AmphpG6ss?=
 =?us-ascii?Q?eJ658oTuW4f+tGWqDWRkSdWkpx6WtROnauAP4ILIDFq/JkUv+RjZwxQ/ekaY?=
 =?us-ascii?Q?oHJfEYvxy1/QNeObVP1RZu5i7PSMzzsrcfG8DdbPEyzpQEHKDabg/OP1tg0B?=
 =?us-ascii?Q?zL4W5fKfqmfLjgGQ+RxYf981Ya5AI4nrkbvPrO1cGtkS9Jnu6sgz0ykIA4EB?=
 =?us-ascii?Q?nU97N883q++loe/nWIEqZzIFiR4kJydy1BoPzoICHZDAamT9H16LkIITSq/B?=
 =?us-ascii?Q?U8DdAjVugbGUEeqq8YUc1cFRXZ1LLWInTzQ+FVi5/dwbVc6ZCgun+nZNdFCQ?=
 =?us-ascii?Q?Boz8eZxGhshkmzWZXtKDJFl8WikmLnfoicaT/I5sgMBbi6u7gebiVFugeBKy?=
 =?us-ascii?Q?KLMSyEwWjJBxJdq77od2Tvj6Z04V3vW4z4+ZpvVW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e580479-1b76-4cd5-6e0f-08ddb2f9c5a8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6273.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:33:19.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5BljpdQgx+ne2s9VmK0ftPmEDJqcmAu47JzPYpeJEoNhUzafaS5XPUaIzx6/bcxuhKbpQt/zEuA8XzcfRgTsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5120

>>> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c=0D
>>> index 79dd4fda0329..ce5970ba4033 100644=0D
>>> --- a/drivers/nvmem/imx-ocotp.c=0D
>>> +++ b/drivers/nvmem/imx-ocotp.c=0D
>>> @@ -605,7 +605,7 @@ static int imx_ocotp_probe(struct platform_device *=
pdev)=0D
>>>  	if (IS_ERR(priv->base))=0D
>>>  		return PTR_ERR(priv->base);=0D
>>>  =0D
>>> -	priv->clk =3D devm_clk_get(dev, NULL);=0D
>>> +	priv->clk =3D devm_clk_get_enabled(dev, NULL);=0D
>> =0D
>> This is just confusing or even wrong. You do not understand the code,=0D
>> just blindly do some changes pointed by scripting.=0D
>> =0D
>> NAK.=0D
>=0D
>=0D
> I spotted error path further, so let's correct above: it is not only=0D
> confusing, but you introduce actual bugs!=0D
>=0D
=0D
Hi  krzk sir,=0D
=0D
Thank you for your reply and guidance.=0D
=0D
This patch does have the problem of double clk_unprepare_disable.=0D
The usage scenarios of devm_clk_get_enabled are limited, as described below=
:=0D
=0D
Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared=
=0D
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be=0D
replaced by devm_clk_get_enabled() when driver enables (and possibly=0D
prepares) the clocks for the whole lifetime of the device.=0D
=0D
I will learn from you and improve the standards of patch upstream in the fu=
ture.=0D
such as this patch:=0D
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D0fa8ce76b713a31f6aef2f88d08eee74d7d3d8a7=0D
=0D
>=0D
> No for another round of terrible vivo.com scripted bugs.=0D
=0D
To clarify: =0D
This is my personal mistake. Hope you have a good impression of "vivo.com".=
=0D
=0D
Thanks=0D
Huan=0D
