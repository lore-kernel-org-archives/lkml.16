Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B5275B09;
	Tue,  1 Jul 2025 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376578; cv=fail; b=OqKhsJSV+8A7os8uFPc50rDT3cDS43YJOZ1DC3EmKC9ZpoP+h8GtuTKXANrdUT17/Vkx6a1x87qCXNhwK9tKR2NpJpEe+bE/D1BUzQSZqBpP2mj8sCOWdYQd2T+rlW7ZRo6gt/2jMy6x/vCOHUczXpVY8s/ay4S9dXkIlxZcApk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376578; c=relaxed/simple;
	bh=iwhd8Q9A9bNyEq66ghmrMqSn6rZUiY+ACTiYng8xQwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xd0XeisoHy9Pc131DDDGNAF/8V1eAksMq0fa9An2kInFueitZIFnZDzEmk+EvrKIoRCGJNT7dtqDdopy0jtW5+V5G6MBfEjxV8LkLyQMASSuc/JIywljVxrA54Aq+rU89i8otpd4B2r6UwN2A1YmeSYtPw6txez2ts1AZl8h+SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Vll0p3/D reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Vll0p3/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1UsqZciRH/ZxBaQ0jlmoJPt0seM045nwx4n27ND/AYqGveLSaAu/M8USJmiTBlzYbYdruwYSNXcjDbBy0OlN6czjTEHPPR1ZLuQ6dqryePOec/GAMvyl1zHAlVBPxGwAhzH6D/TCHiWxgvzns8zBhqXpVjMWfW//HC/sK2SoK7Xujc2MkzhZ9n6iPzl+8uc/e93zfhm79W4jamhLHS3gHfm7XyeTDAO12NcPJg/ZAu37+bbqJZMQbeCsIx5GZMT28n8ePdgSzYY5USDsax7TFsOJzz5JchIDKSVW0siPVnspDlJ/ikhTUv0jHRuCvbvzzvVPJ90v+HSXSstZ8N3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRbz40m7ArAANcZejph/QKqwsySKYTsSGdqP649CCA4=;
 b=mbqaqbRmAeucQDl1QrKJdHPtjVjF+AvveINalHMixEVaDXF0w6DtFu8+qx8dhW9GoWvnIBnaPgGbXgG62pL94J7SRbydi2PxTtmNCHyY/LoHmmL9Ml44M7tSfghhPUPh0DC9xhHF9oanepmX/s3WsyxZ2mzYgFupG9X4QAt7+v4QckuE8roUnpKz3/9ZqPvtA9qooPMUWtDsPvmAn0NNB9OQmKvGoe74kvzBzgRenZ1rU2Su+wntAsYBrvdwDtd9Z6+bJjCakj86GO57MbmiaB7yL5+NeYtNYwMZgGjOpjKaecd3CAG8F73IsPia6y0uiqkdpZjZB0NN4gInmvSh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRbz40m7ArAANcZejph/QKqwsySKYTsSGdqP649CCA4=;
 b=Vll0p3/DR+XvrgmFdFFaPqdXiUaPkOG8vX7PxojBiepfI1WcE+ZbqfYi0bxQWVKlXFt515ID51ewJaKQ7vxjDSru/La17FO8sJCTBg+lG3qktlKhgeLqOguqbZvIxt0hrjiIPpJHI9qLasSm6Lz9Gzvc75HGS7XqEaoi0nx5oLY80pfrG6n6dv8aqwUYmgft6/ZUs0xsUZ8usX1/z2KeGY1IFnWBo5s4njV3LTwPoKZcNd3QGbMPwDtOGbS0cszpMU6DC2obEreTge2sL4+T0FwGayLOJUi1r2gT8Bxw7EQzLm84yPLYL8ioVRlNKzgps7RtK6WQ2CHSlLnEZWw26Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 13:29:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:29:31 +0000
Date: Tue, 1 Jul 2025 22:40:01 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Message-ID: <20250701144001.GB20538@nxa18884-linux>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-5-00db23bd8876@nxp.com>
 <2791534.mvXUDI8C0e@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2791534.mvXUDI8C0e@steina-w>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 710ff516-5abf-4704-73f5-08ddb8a34ff1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?gaeN2eNSPMGowd3h8F0eBrIHitIBEZI9xgfO1Mg1aupRRoe7Cyd4+EMuR3?=
 =?iso-8859-1?Q?3DlXISz0Hh8ACXpqROPIb8iPxQ/EQnIKAEzUzLbM+8iCY7WV4MTgqfk6iZ?=
 =?iso-8859-1?Q?IruqiN2fPIktAq+VXa/I/XSkr2oVUYKAzYTOqqXeLM7s0aPY2szQW0FJIt?=
 =?iso-8859-1?Q?AU11J29psXWkcBBgI8wntwkI779oPvLTxRjLsmSrEaJfDGqR88yfvjk4H1?=
 =?iso-8859-1?Q?A9c506B43k9etEiXAYJ035bduphL/lmjhxa5bqvngMZ9w9+Wj1rxJAqu3T?=
 =?iso-8859-1?Q?aDBah8NEWxgHn4ZXNqsHVxNL5lqFLvE49rNIv9nFQsB8TPwotgOKLoBcsl?=
 =?iso-8859-1?Q?NERk75vYipNTINaZEq7+YldA2hADXO8wsZoLjhkIkuL2mDXLxzkb02pPFt?=
 =?iso-8859-1?Q?T8NxlTeeCzLVfpQ3srtcniccd0pi1jJrpGGpJRXG+VJY2G2TikeSb8D/jq?=
 =?iso-8859-1?Q?orQ4XDFEpgXu5Ku8T7KTRcVjYjrBAxWsMwwAFJ/aOf91/BNPkfvHXDvnlh?=
 =?iso-8859-1?Q?HuYBGGIAOVJr+kz/aEYAKlctXhDSLnpevPDFUTijtxdJiDauc3aFRWooYB?=
 =?iso-8859-1?Q?UbXw/6w35i63PMfNfljFOa5x2R0qnUqd5MuZuj3PRRCiWcYCuQbbVNAt3E?=
 =?iso-8859-1?Q?3HAVAeBnFO0QQaw+INxDT75j1OqZtDTHlnDDwCFIyWmF5ZZgeLlzB3e8J/?=
 =?iso-8859-1?Q?qPPR+Lt5Ch24CwFp03CEWxRQsICFL6FLT68ntQrNp5AtERUnF+IkBTuV7n?=
 =?iso-8859-1?Q?D2Wjd8N3TDo5OO38vIO1dwHCNzC1orYj0d7T8om6ayeSaH7bxicq6eNNav?=
 =?iso-8859-1?Q?Dm/ZN69HpLbLLVv5pLF0ab4e/L9G8hYOoC9ZGnkQI/xIr9k+9h30iRDPm9?=
 =?iso-8859-1?Q?dheZp7ipF6791eRBBJnubEyi3Xm7rZe7/VuRDNa+NoSxt/IcgYC+2HkpSx?=
 =?iso-8859-1?Q?y9VBPCat/ylpY8BMZnltDkr2TeLjwXyitejwGiwSCrlzoFxND7X0B+E++5?=
 =?iso-8859-1?Q?+lPrscH1vYvafVTknPeJBZI0dLX3LFymtYLeopXYml4iQ599WoHL+qsqUd?=
 =?iso-8859-1?Q?WxgbvEcIaCJ69ZnVEl4WqjRbwFjdzk2zNglgx1KfQ7HJWq00si+TMGm9wQ?=
 =?iso-8859-1?Q?LkcwJJhkUgEki72n0R4C6MIsly+oW3Kq04s/0Pdxr+5O1SvZsearCrGLUB?=
 =?iso-8859-1?Q?SkbwIwHOkPMtByqkCn2XgTqKyBh9PEgvEZQzsBhkBuZ0j6IDrZIgi/7FYw?=
 =?iso-8859-1?Q?/mfavVMKn7DKf+DXnmPMXAihF0tJVtfj3zqMs7xqLmFyR5xn+/m4YBcnPx?=
 =?iso-8859-1?Q?vwa5hlG9ZdxO9Rf6eB7ynoRa8oq6WIfZobh6svUMgJz/rQkGBTK7wT7f0g?=
 =?iso-8859-1?Q?U3TuW6ojkykLTnGcv5ujO/10cSmY87ytG0KDO1FqKkKevYmogTskdUm8hl?=
 =?iso-8859-1?Q?a8SOsAUYhrm6EOK41dsvVHq5bLGf+vqJLkILN8evN0wpBDEP2f8vjM7CZk?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bREdh4kTMDswfMBu0Wz0diOywpNHT5gsB+0VEnUILpqj7VBRJC3FFk7bxl?=
 =?iso-8859-1?Q?+uM12hYiULHD2h/57+IeBeqoYfV+fgz1s7EWTaxLqJwlF/AjyfsmcWPLlJ?=
 =?iso-8859-1?Q?bb10B7Xolx8AkdWe7UIv++mS04kqkSAqk/xpF16A/CDvykEnCyDjZF+s9A?=
 =?iso-8859-1?Q?+45WWYU4oPCqDeIrAdW88nVlhzw79lJUSurLYOiOMcftw5tC77wBBh9ReF?=
 =?iso-8859-1?Q?W4gB+bqQBI8M0uycI3kP9bDCvhPxSPs9Dt6LxNitPAduK7sYGcsE+uIP6M?=
 =?iso-8859-1?Q?CzQurQBPW9FqJ5RKGxc/1fKWRaG+Oq5EKoNSLw/WWDdmz2vADPxvCJ3dhA?=
 =?iso-8859-1?Q?JiZO7l+y/mBhUlXhiGUapWo2NdgCc7sJZxwjmuRo6OzCvRfGqTy1izaxDs?=
 =?iso-8859-1?Q?5bqOipkyPJ1/DyPwG1ticGDH05iv0jQWbPwT6Fcfc2kkH/KIisDTLCCUDz?=
 =?iso-8859-1?Q?rTps6O79fFSFQFtftLkpkj7/MI0sYg0eOUIsaT1QgBHtBaRDjdJ4DPX2ox?=
 =?iso-8859-1?Q?RWyCB3S5vaf3FsWvBBoBlCKuLBKLrQRWtNHJgI2mK3bSXQeJkZLOPPv05W?=
 =?iso-8859-1?Q?TdDibf/nYOY5A9H4zYnKETC08nqf2iakWQJ5QJ7k8iTqoFBVakMzGqXo5T?=
 =?iso-8859-1?Q?qbB3+fh/XyG6Ozel/n5bTgH0xiiDZ3J4cU5GmWDTDrKVyO6MruNi3CdQxg?=
 =?iso-8859-1?Q?1nkCU7Qps2IrswQBko1nIbALuB57CWi7JzltsbnYrsca7sOLIxqnl9jfXG?=
 =?iso-8859-1?Q?KlqJBMEJh4H9UcZ3OV7CyVXAB1A8AXNtYeRCVI6h7B/WhVD0QDPeKgQRrV?=
 =?iso-8859-1?Q?exTmMhJqoFHf483wtU+YokZDBcD2ddphaUWfUK09WHcjxgbv1X9u5w1nDM?=
 =?iso-8859-1?Q?SkzNGD6Q2jwZBkHsfAdOB7nnYWL2bdRsriYet+en/NMCiMBzsjSWPtzLV+?=
 =?iso-8859-1?Q?VqedDpCSV8kDm4dJTYQ2UUa2L1ylGvUY3D9kB/e+hzYg+4iWWw+JeTLb/t?=
 =?iso-8859-1?Q?P7owswKe4YzdZGbMHH9ayblnQdkOZ+7YWFHayTPsabAsa+SrwnTTzzdafJ?=
 =?iso-8859-1?Q?cVpg1vV1o8g6sN4A0piuhKKS3ADo5DQRp7r7xJ53vFmkv9P86yG0g4tiCB?=
 =?iso-8859-1?Q?qp1t3pRP8MM9v3YEGQo5KquWyL+XHdXSf9ljcI8B5TwA7JiSZxgBdaE03Y?=
 =?iso-8859-1?Q?TR3G3v6WNa6RFr1XeWHPuCMi9fbWuBcH44LpMJVoCgCbdOtHmZgJEjp7G1?=
 =?iso-8859-1?Q?zqeFJ4rpXD4IDXfJXbC4hoQQZVcVz0d6iM9dku3vFZ+nf7myJ1keZRahQc?=
 =?iso-8859-1?Q?oGnOeAnhi1x0jzpacX9ncSSFB64b/pyJQP+E033gVgF7yRLULhlBWAL9Gh?=
 =?iso-8859-1?Q?L3YEaKmcOu6lP3sOIiFjT0dWTAIhq/MEq3ELS6JnB3xOqGNEhX+i5K4EIN?=
 =?iso-8859-1?Q?5pHi9I5l02EUqbqQcKplV1AiSspo0NfzuZ0WnuyNGsjfwP52jjYIPb6zje?=
 =?iso-8859-1?Q?DdnOIWyJbGBbG5ITjmHCgAwH4qKmmMTJZ+1cwwcvrZhaU6d5pvHRfujB7J?=
 =?iso-8859-1?Q?eaMO/ZnTZARE4VexzfeFkAKQSzSKnZuZqgIZbY5+aZEkfjlUAk1MoGmeYb?=
 =?iso-8859-1?Q?kwfah4kc1TSIwU/rrXo6vwMdh7cB8jIHpD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710ff516-5abf-4704-73f5-08ddb8a34ff1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:29:31.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA0wEpStey+tb4TK4bRBQe+arqlPWGtGKbM4d2qvox93S1KgbEd/7/YB6jBr2z2gjNNnQft8+PQrZh5w/duZ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378

On Tue, Jul 01, 2025 at 11:28:07AM +0200, Alexander Stein wrote:
>Hi,
>
>Am Dienstag, 1. Juli 2025, 09:04:41 CEST schrieb Peng Fan:
>> Add nodes for LVDS/DISPLAY CSR.
>> 
>> Add ldb_pll_div7 node which is used for clock source of DISPLAY CSR.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
>> index 45b8da758e87771c0775eb799ce2da3aac37c060..cf67dba21e4f6f27fff7e5d29744086e4ec9c021 100644
>> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
>
>Why is this specific to imx943 but not imx94? What is the difference anyway?

There is only i.MX943 in i.MX94 family as of now. Other future variants
may not support lvds or display. So Add the nodes in imx943.dtsi.

In future if the family has more and more members, and they
lvds and display supported, we could move back to imx94.dtsi.

No specific reason.

Thanks
Peng

>
>Best regards
>Alexander
>
>> @@ -3,6 +3,8 @@
>>   * Copyright 2025 NXP
>>   */
>>  
>> +#include <dt-bindings/clock/nxp,imx94-clock.h>
>> +
>>  #include "imx94.dtsi"
>>  
>>  / {
>> @@ -145,4 +147,36 @@ l3_cache: l3-cache {
>>  			cache-unified;
>>  		};
>>  	};
>> +
>> +	ldb_pll_pixel: ldb_pll_div7 {
>> +		compatible = "fixed-factor-clock";
>> +		#clock-cells = <0>;
>> +		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
>> +		clock-div = <7>;
>> +		clock-mult = <1>;
>> +		clock-output-names = "ldb_pll_div7";
>> +	};
>> +
>> +	soc {
>> +		dispmix_csr: syscon@4b010000 {
>> +			compatible = "nxp,imx94-display-csr", "syscon";
>> +			reg = <0x0 0x4b010000 0x0 0x10000>;
>> +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
>> +			#clock-cells = <1>;
>> +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
>> +			assigned-clocks = <&scmi_clk IMX94_CLK_DISPAXI>,
>> +					  <&scmi_clk IMX94_CLK_DISPAPB>;
>> +			assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>,
>> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
>> +			assigned-clock-rates = <400000000>,  <133333333>;
>> +		};
>> +
>> +		lvds_csr: syscon@4b0c0000 {
>> +			compatible = "nxp,imx94-lvds-csr", "syscon";
>> +			reg = <0x0 0x4b0c0000 0x0 0x10000>;
>> +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
>> +			#clock-cells = <1>;
>> +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
>> +		};
>> +	};
>>  };
>> 
>> 
>
>
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>
