Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638C71C1F13;
	Thu, 10 Apr 2025 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303647; cv=fail; b=X9MnVR79ramz4DxaemwwqtJq0Fnp4eanJH896cHwZS97b3xp3AAxSnMbWtPJRSkj+wghkxgiy0p4CZd8fJyFi9QGweMW7yjMdFnfh9eWKQ6ZuiYDev2OyTjrTqJNE1UJD8vElVL7qVmLCLREw3U6PZFqq6la10qMnHCV6zJaEpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303647; c=relaxed/simple;
	bh=mBxw3TtijftO4ovW8/sKxmVk3AfHoDSF1wORShuaGF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ekTYXiUZkO2/mRniz5+9QxhrWJMgL+9428InkCIVbRus8rO/isOFvL5/N6VibGg4kmBY3pJvs7RnbO997avHAFeFjyJircILhMIZiXCe79GJ1vigYbiBoUZwH7UrG1EFdmw3rM406bQ74n8I+BldijWj/KQ5QGT7bO9NlUJT+yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B6yUCCD5; arc=fail smtp.client-ip=40.107.22.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B6yUCCD5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czv9MD3PTvkHdr6DvZWf96LTMQM3XR2Cp2lzWJKxRKW6GH/xaruuhgYFWnjxWUnKyK6lXDAYghwqQ3Dhn4eJeKbinkXofs8zCXyqNUleUEEA/BmRg1U7aqzLSGIpcoi/DU3JKMgshP05RgxMh1QfrfUrfTUl5ElFXwBOcJz2OgIuVnjD6pcs3+FhZV/NqmTc+6lOzLvqEfGoaTXqoVVo4ZbiKd0bEbBTyEniVhKcyKqxXJ1J42OrrOmPtfoe+olJpNyAaV9kMkmbVyEYpsoBA+IvaJMu7n84/sGhLwuFp9acw//eoKfsP8M2TTVz2mr/46DNTPeYssUNDE/jN+PVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZU4De0mBvvBW+wWJmhwwJO+tYL9myXCk8kqk0G0IPQ0=;
 b=eGae+gAz8b1nFVZ5qqPgpTqwiCl6SchdslWMnZ1ZcFx5U8McCe0mmmT/Dv/n+FLNco+0pxlZOvfwafqhmkg4UnLUSZu2KJSw3cGNmQ6/wbJGYv4xXT1XtGAMh0/rizkTayR4/l8X/j2IGqXfo5e0yqHoIu/YcqMCgdr5KPuWwj39XKMvdsR68TC2ChZ4POvybwf6BIntu3LLZMNVpm674qsEGgS/Lv6cornAqmOpJiDswamqf+FEkU5F/wT8gf1nVSSDfEgPpBMFtq9cqBwVLE8deencC5GoLN2h2PWP4aCT9hNBTgZIMvJOPotVOF7gX81U0m4xzq5AYwZ53xrm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZU4De0mBvvBW+wWJmhwwJO+tYL9myXCk8kqk0G0IPQ0=;
 b=B6yUCCD52Nag6zFlOt4YDv1rk/EtVb0WG/kY02Jdt4S9RZd51n/MGj1qBq/ITlefnbjxKJrCoEJ7fQyHEheiMIJbus1DCEsKj9foDdy142gVHzDnllQA0vdE3GzvxHSaxfEHcI0ZhzC7Ga5ZRdGqdjmwI2ncAmM+LQxETKzFUPaBuFX2htUQFlbb7WLzxdzf8BY+HJqerRyCV56OPrIbv8nkSgJRfv5nCqvDMOTdc2ZuHWX+gVuR0N6+2eRxEpyMe94neWMDiGUkY0lwcX4F8n3BbAxY9nK+raeomw5an8rG2z23Dti+ANHo4dTobdL1EOcOUS+kxLuUZPJJzYkmlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8257.eurprd04.prod.outlook.com (2603:10a6:20b:3b6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 16:47:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 16:47:23 +0000
Date: Thu, 10 Apr 2025 12:47:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v16 6/7] arm64: dts: imx8ulp: add secure enclave node
Message-ID: <Z/f2E4k2cTp9IOrY@lizhi-Precision-Tower-5810>
References: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
 <20250409-imx-se-if-v16-6-5394e5f3417e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-imx-se-if-v16-6-5394e5f3417e@nxp.com>
X-ClientProxiedBy: PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: b633f1a0-fd3b-474a-9a64-08dd784f5dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j5s4LxhjpiI7MCuirozn1QJXvypuvmDtbRoiwoatNt2oDWOkm1NsVqwN/mkO?=
 =?us-ascii?Q?II+EeY+fy41pod/87A9R3Ac6spvrip+oesMky5UAgru++iPJZ7mZQK6Y+Nou?=
 =?us-ascii?Q?ClT5fdMTIEChcvCuh8JFSNVQcPsZ4c1Frbg6onwLrAMyao7RS3g1p6ZfelE9?=
 =?us-ascii?Q?ROy4qJV3T7nN5rv3e63OvxyYlwXdVeHV6y7GpdjXAp1TyOkFinPVXWP1NJHO?=
 =?us-ascii?Q?BC/5M8CdD9K4kopC4E22C6ckz7yuYFbI8feV6IHJFQ2133kjqMTbCOIDUC9+?=
 =?us-ascii?Q?uwqEDIjRBwv8EgJURH1ys2fvS2E+UXrAfRHGImRRfDZrUG2yIy1lSems2rye?=
 =?us-ascii?Q?LcGqaLpW+r3RkHBwssWWJGeej9jc/OtuvuOrLNisVIlVs4RlBkV1prUz/B6z?=
 =?us-ascii?Q?AvV2h+jWz4/u/Q/2pJuclcJQ4otjAkIuvdkPjgS2N/bFLCD8SiREgFYihTRR?=
 =?us-ascii?Q?hlpEHdGnr515tBBRrW3MV4OLZCNylcykpE26fQvFSjO15Dc8XlDsH+dy5+EZ?=
 =?us-ascii?Q?/MESOfq4NFYATDQXau6xgK2OLCdlxhoXr8wqr6VuNNKNTMO7dC6Wler+sHdT?=
 =?us-ascii?Q?A6MdYyzofAdxZg8nJEdPSPJIdkyAFBlqyY54SiuFZfSBu76JolBL4D4h4HsD?=
 =?us-ascii?Q?f3+ZKT5ZTVJGYjkxKLSoFxJeCBTtnIfaW6i1PdHGXEp99voZAt78KcLSDfls?=
 =?us-ascii?Q?Gad8YtdD5CMAkLRkK6lokdVXTF8eoMjQtyfgJYEGstmRdormMNwulrdOwd0r?=
 =?us-ascii?Q?OgZCBM0ijXAJU8HPvYwdI8jZ51PAB5v7JSOwuVPtIRWNu/7dAPVhsqkjKUrm?=
 =?us-ascii?Q?/AF4iM9zNDQUYu+qDI9evX2StCafRpTvdXgzohg55DdGZ5wh0NGlmI7V4WAC?=
 =?us-ascii?Q?aB+Uvx98AaFBzmfjeOnoIZZelWAIhPNZjhr0KnKYifOLrNsvFRwo3lo14zlW?=
 =?us-ascii?Q?g3uJi2k5GLqKjoY3EG/MjZ0vMs5MO48vUza8oQBeKrQ9GOnpxaA3ioz+n1m1?=
 =?us-ascii?Q?MpBtQ7vqLf6cQEZ26FPECzGRQoD3LZvHmcO17sdsbDeJMAOQcPUDhgvF7BBW?=
 =?us-ascii?Q?Y7OqNJCGD/SeJr1Ao731QQDt81M/KR8dVcDNCCFwFW0jpXrfBzOAmDDvEBsi?=
 =?us-ascii?Q?cMsaEouoTGA0XI1tT0qgczZQIWdGC51beBh3qm2+UNSJk7Fk/XxKCBD/KEID?=
 =?us-ascii?Q?2N9crm5Idh1CtkXDY4bkKkbdBzD7cztdfRyTVryRpLj5WILs66qxaxdnpdTl?=
 =?us-ascii?Q?HBz2Ah6aoHLWh/4sYCfFzzGQlkkrqyM5u6vjFdSZZ0OY3e+UBcc5O7eBahG7?=
 =?us-ascii?Q?ycxIzGL4bhDrC7fzV5bzzOMkCsFEBXMA/LYzkJjuyB58CBEk7C2cGH/R9E/P?=
 =?us-ascii?Q?KvMUWMcHLoJ3VbdzXhzPqPq5iHN/Bt/YFzSvG7H1RWUMDVJQsxxW7dkPQjJY?=
 =?us-ascii?Q?KCOq9KsU6Rq5cY376amLTfCKVzGxhvmLlIzRaVTjssBLpcIBPshP6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qae4RnJFI5VLDcjWTZWHpq1/W4yJwpy74EVPAuicQegrZiLuutboI8zXa/7v?=
 =?us-ascii?Q?0NLGHeZ50tFzAhLurrwdGs8ZnivvczQbvpqPq2S6eZzoM+RuXq5nNI2ccz+k?=
 =?us-ascii?Q?+MqexogiYT4caBqG6l8Sd7MoMB4/ZPq/Q3auMRVYUE5p+YRLRHB0QZkBY5QQ?=
 =?us-ascii?Q?0nmPPpFufBO3n1BGEWXUo7Bj/XDEraU1W5658AEJ3yRg4M2ww4ySk/Um+4kI?=
 =?us-ascii?Q?sn3PLT/moMMf1a4+YMbkv0JlBK7iSsmpUWwQ5JtITUCZN92e8He3HLclx/iw?=
 =?us-ascii?Q?6CJgwUId14EWuujA1bsD5ip+ceM13pcUHEJsLFod+TwVVRDe9CYhu8cy0G7y?=
 =?us-ascii?Q?Ce1m5ZFmiAk4hRRzkz8i3lFMpNnfP/JU/dTeyPhZhhjyuGP3EgjxXKz7rMvd?=
 =?us-ascii?Q?RrE0GHoHLiZm2MZuFRMMmK/Q2bIHIB/NDma1jfseG7FBCC0KWP0+TP3L+AgP?=
 =?us-ascii?Q?1X//5+avFSZ1X+jdQUH+6PQ2aQ2L2ogFQKsBGfsGvV20XgUWZHue+N7v+WDY?=
 =?us-ascii?Q?ewLDbVsMNkK7L4PuHifleE7ZQRv2Vyiapy9imrufuxDYjZXC28Tsc+2Lq0p7?=
 =?us-ascii?Q?51AgW3G3+StUvkf1QrJhjA0nLFvGw23ayQ8Y1IBUBi7fppGJWhwNFqmnnKO6?=
 =?us-ascii?Q?FXqf9Uzyi5Oluzy0Pwi9WXnYHr2kSP6p1inkPpYnb/iutJV+W7xEWRcwYw63?=
 =?us-ascii?Q?b6EcDA8hPukDdYc0MEzH0Sw+ufh2/5B1GWN1MiQra2LYAxkrwuNpob7ffY92?=
 =?us-ascii?Q?+Xud9VwS0FUhaVT62v6HDIZOmRzRR4DQ4ZSBVPgBF8Torg6hRJl0Z4ZW+Q1V?=
 =?us-ascii?Q?jC35nBHFU729fmgmsLuLao11iu+WI/wN5XswyGv35aD8OyBsoWfqjrsHo9kK?=
 =?us-ascii?Q?9CLpZ0DCdNxWZwrBNCAhTwawLJbn+yQQO7xnR2JVW6xZI3AGVftpxt49F+yR?=
 =?us-ascii?Q?BbimZKfE6ijidJfz6q7m2yJcJQ+L87D/zvUvKs8GZ1RUS7KA8XKAPffyWgYS?=
 =?us-ascii?Q?NYE3iREmxbqeFTpQ1VwCkMMTEwrqJygWbJWWN0vu7kWIqrTpwdC6M8JDCx19?=
 =?us-ascii?Q?cSFdD6A/WPC/22bH7jJPL3qq+q7RMU4KwB3mVzgXI9mOCVHq43qw8AzTMVNc?=
 =?us-ascii?Q?VubIXIbGl+2tML4YaIYEWVcTTYKGmtHsy537Ad+htTVNuH2CA2hJn8KOGYW+?=
 =?us-ascii?Q?nIWBgb8GotZ5es8ZcyzipNBCx9QPgDe5j+cLcdpZzRSUS3lefRsJnf/t/u6A?=
 =?us-ascii?Q?i0OfTqZ5Kt/sMek3D9XuIC1INK55UBUDu6fA9gR2qFPpdjTCmgXYBKbj4/C/?=
 =?us-ascii?Q?TIc1C+nM0DVLoH2I0IEBZRabINdt7+itjsb2AFPGgJn//ktzC8r1Ay6OeXGZ?=
 =?us-ascii?Q?M3pf4cUACUnM8Vkiy9qea+vfSbP+bdNOz+UAHsAuPnanvsfTvtN+A/yDBC93?=
 =?us-ascii?Q?TMvvTm8CGnopavctTS4oM4HfQfPVXhyvd7g0AI3ufekIVKSg6H8kLEIXXfsS?=
 =?us-ascii?Q?VcxNDwXjRnOtkqdojUZN6nwyVNk9E1aHLX7IIPnLqFGI/EBdrktboOMGB0AF?=
 =?us-ascii?Q?MUyTzEXWXFvRNXPfx2scpCKlrMXYKqqoNjzpTw8Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b633f1a0-fd3b-474a-9a64-08dd784f5dd0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:47:23.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUAa46+QQqdvmkcy+V16iZRKyWV+a/xSr/UXzWTcvFUfz1kUrUlAFwKOTg4sCWBnCOfhWsIhpJezls990O6iHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8257

On Wed, Apr 09, 2025 at 05:07:47PM +0530, Pankaj Gupta wrote:
> Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
> for imx8ulp-evk.
>
> Add label sram0 for sram@2201f000 and add secure-enclave node
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> changes from v15 to v16
> - commit message body is wrapped arround 75.
>
> Note: copied the change logs for v14 to v15, to cover letter.
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 2562a35286c2..05db47668b7e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>
>  #include <dt-bindings/clock/imx8ulp-clock.h>
> @@ -154,7 +154,7 @@ sosc: clock-sosc {
>  		#clock-cells = <0>;
>  	};
>
> -	sram@2201f000 {
> +	sram0: sram@2201f000 {
>  		compatible = "mmio-sram";
>  		reg = <0x0 0x2201f000 0x0 0x1000>;
>
> @@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells = <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			 compatible = "fsl,imx8ulp-se-ele-hsm";
> +			 mbox-names = "tx", "rx";
> +			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
> +			 sram = <&sram0>;
> +		 };
>  	};
>
>  	cm33: remoteproc-cm33 {
>
> --
> 2.43.0
>
