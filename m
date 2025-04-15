Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E5192D6B;
	Tue, 15 Apr 2025 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743641; cv=fail; b=mQfI5tpYK3Vb+gxXhl5e13ftaL8yL74yp3aYS4BtVq5MDdaobiQSgpko+Rm1jbKRKIDOU1TlA8U80iI9LaTKqYURN7bhzAX3ZnvsHm3Q/KFawJsdrEv2+lIPhgMiiKiHzSc7yuR/abypdxh1CCHxx8WFm61YXc7UgwwdlN63zB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743641; c=relaxed/simple;
	bh=/NH1fYudukb1otLNXDJe3ZFMzoDRSYxxH23hHzY7py4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R91DDS8Y0jalt7yy5Ua9QB1TVZiFS0A15noKdfU4Q58AYsd42yc8fpTGogHgNUWbVzg7j+3w2daQ+ddG4qS12hlun/N7FVeTLmK1ON/oJDBuRdoMYA+zNekJqelzUsjAkBZJ4WBguvLBMJGcEWQXcW7Jb9n5sWASRq2zjtMuEMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SO1b5bNu; arc=fail smtp.client-ip=40.107.21.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SO1b5bNu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukjGmDW9pzEx2kqkhDjED4ThsiEz0Qb4VOTQZ5vQ6GMSx4A4va5e7Weo+QFXyyvz0k4OtrY/r2fUneMOlxmC7R8UT8ZWE0ezCC4UaKTvhH5H7oj19/ESZDurVqHoiaUKTWGaeDJbOCQ/kskTyGSQWHwZe1kgtXZcHD/Pfs+VftwwA1cVBuTz5hiRSOgLRxGlwaXgxZ9ZbpF3ZRx8ugdK3ZMHPtw7GsNKrGFtcVgqxsH5rtHoGqw+TGlBnwB3AEQ2D7tfiWFnMEwU0q63E2dqV+YSmyVqCZ9WD36PzxRFLqmdJpLf7YdVRtUURFkWIUhk8NEzjntRG6SsuCIt1VowYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvOawVGWBYoD42C/V0d5zfiGadCvIy1aZD6J131EKP8=;
 b=MNwtCB9niDBpyUg7BM+2EnPr74xAz0g9sa2kunV2HpYe/9Q9l6zMdnwbt3RB/nk0CaNztZ2s5urHSTvunx0VkZ1u6BF4Nksz+nNWea36MwZVj324efOjkzZznvTlHKTSQZLoRVJ7XXOBtfl9kwGFGmCdCUWqGyoPVVTv/rAaurzE6802wujSIphdT+k/mnDUPO3zbVAVBwkQy/GeTRwvShO8tFdEH4URATp1OKLK4ZcwrVC+mNJNyUbQ3mHIciHmsNMFTYmfRf1/e6Hyf/YAk4oum2eiE17VphbaAdy6TgJnTeAgfzJzQJDKSe+DbysfFOxMl/MRvxW4z0MWm9gLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvOawVGWBYoD42C/V0d5zfiGadCvIy1aZD6J131EKP8=;
 b=SO1b5bNuzxVcQ4Y6nnRAFItfVsuXhdr7ULtbr2V5wPx697wYS75XiJi3Q3l+yDzTbFfnJJXxYnkNWF+NqTZ4a4bgXPwiB0W6Vx54qgue5WjTtTFPiGyxl9bcIhnyInZ/NHFfAApE3f5EOJs00uofchGP4RIzy6WYysuNZwCQuhejqnKGnIs7DEgdG/gziY17V2h/pjEXgP9nDi1hJnhsNjEHAhSqT+mDq3SCdDsYJl4i9xu1Sqrh018hJPICi+OEzrFGQQPtyTflY7Oc6Z4bcO22YwwmNWqsb4y7EjxXgHiyfkANBax1+KwojXOYgV6Ainqj4lRuC4NQaAx5EmuZ7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8971.eurprd04.prod.outlook.com (2603:10a6:20b:40a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 19:00:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 19:00:36 +0000
Date: Tue, 15 Apr 2025 15:00:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Display
Message-ID: <Z/6szCdJ/7bE+WQ3@lizhi-Precision-Tower-5810>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-7-f309f8d71499@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-initial_display-v5-7-f309f8d71499@gocontroll.com>
X-ClientProxiedBy: PH8P221CA0044.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 48214de1-ff7c-4a58-28f0-08dd7c4fce13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?td2YtAqMt3ew1PgvW8EENG4/0aWOVOLT/Bjqi5xhunM5aHCTwYwiuX1N4UBP?=
 =?us-ascii?Q?wdZdRQVC1jYSRa8KNWFmHEaWF5UQMvIdteWsA2IW1gTqNjC/jfpj5j/AF0T1?=
 =?us-ascii?Q?BK+PBqrRsXscLzE7UzbGJJe4tEA5wpv87hXjKAgI3yrat3pgIj6N2BOe4Mk3?=
 =?us-ascii?Q?MdFweQtvgKseos2S2wPWp8RASNr8VTD72wJ8qhqVWQe2YkaQ9Os+oepC9U45?=
 =?us-ascii?Q?BKz45mczn1F6dqT0l41juqtc2AHhnLdBcVsSXYr2cYb0cxIgp1VKi50HOiqF?=
 =?us-ascii?Q?LzD+Rl1ASGJXtZEGoqlWSgfB4vcgCESoLG3ADdlDXQzHzI13DwE6xQC//pz1?=
 =?us-ascii?Q?gzAksX2DWGHpU/QS/8Y37flY6oV90UDVTbWchl6aBY2ia8sBwKez2jrQ0vED?=
 =?us-ascii?Q?hrb/8hrZg8aJq/SJZaAnKUnTKRD7k8NUMR+kd/18DVijuT1GxBY+w0Nr14hd?=
 =?us-ascii?Q?rD/k5d7GEl8Bg/8A2PpaHa6fFadooifobXvEOng6ZHVwSA8acfyiw7H4Q/Ad?=
 =?us-ascii?Q?KtrW6EjwRRz5U6SBvU3aY0hTE/gAsGLN6N0V7T8EcKHMLcn5ng3/hYOUxfTF?=
 =?us-ascii?Q?60eUkYZSgKzsPdhDs/2poFy+342usDaHt05MdR+kchBSTq13cw5nmqMpl80W?=
 =?us-ascii?Q?k+ilJ3h7yuv8Td8hgc8X7wyD85aZryMC4NWp6nsgIK502wqZX8ZY5NPsUiYs?=
 =?us-ascii?Q?pOw+GZZyc6mz3pxE6YrpeYOkKPoXPu7mKcoJz9yTjWzpe0s4R4B1imEe5QVV?=
 =?us-ascii?Q?fJfjEHwDnqZd3FsaiIfymW95JWa+tNjgV9Q6+eIL05RW6oialq5Jkpm1bWn4?=
 =?us-ascii?Q?/2GMRM7gENwY7DlfGEqE7x0umM+ltGHhKnx2DCQn46Jhm7Kqx0PHfW7Fduct?=
 =?us-ascii?Q?OicDE1Ca8XGAr3pY8z8mxCRUZdfO2Gaujy7kBq4AX+QSofD280q6GBFgUroY?=
 =?us-ascii?Q?uDIln6Q7vyyy6op8m0q5znWzgRJBb/Uw4vCZK+IqbdSYPgZ+B59Pjk5VO8T6?=
 =?us-ascii?Q?MsC248rj5/dlgLH4pyg+u6jzVDtk7ze/XCQVh1VGMTxuCvj2tzVEVNB+iEQg?=
 =?us-ascii?Q?UTMNidSehsNo3hmDxMx3uTFPnrIBPRCxH+7/GitwsOCZPQz2kKND9ANYS2sa?=
 =?us-ascii?Q?XUqGbWJogmXVOMI27oHRITEUZHkMxK03t94OxJfUvSiBXUco2C6xM3/rNeSS?=
 =?us-ascii?Q?rMxOtRR+ayziw57mp/S/9bTXuvsa7QckA0dQT5AyLRQyU0+tlyMXmZiHeGM/?=
 =?us-ascii?Q?2hzfz9Ifxtv+OsU9PCEOgyyHD2sVG7d1hoNbODqI0A+U2NqVdJi0Jpl+DKx8?=
 =?us-ascii?Q?JzZAp3dgtK3JUGVqz1G+X2t86tjOWvn9I85fbgcDHRmEflD50ACN9YoyiVCm?=
 =?us-ascii?Q?w+rzu6c89V/afVzuC9OdXSmTnvt2mkrWjPutcw5SP2bkYtJwC/p4xcS2p6E8?=
 =?us-ascii?Q?guSnNmNnMNWZZ2EOrQfZ732H9XLNmChXyxDvO/5tCG4sQlTNmOBVhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3BcNcq1m45BHw0AyAZUZIwQeCiq+2LbRETB0XL/BeoMPWJPSqHZReH1aRqWR?=
 =?us-ascii?Q?AC/10HK8keTUBWqE5gtyhQBaDFkTnWtDjXv5dBvxqz54m5Da9h0rzk6ooZ3K?=
 =?us-ascii?Q?WDarvTr1FpOUBAPlXZjG627QPy7MP8hDpESq//kHVIMQbmZSef2c6R1hmZNl?=
 =?us-ascii?Q?H8XMrX7sYmWGpfZjIou81pn782Abo4FGclKp/V1eKlQPGEzDWfTty8sPCd9T?=
 =?us-ascii?Q?juF0MmY8st09aiMdfev8yeqGRNPWk5WuNjp0U6SO61Pd3J6qzhbKIKwP4GWw?=
 =?us-ascii?Q?hrfTZn5etYQLU+xqhpSbLpXldWk9UXn6S2wk49+qr0q5+CfNmE9p+gUc8SAf?=
 =?us-ascii?Q?Q7yGmC5vkDfdGy0qyXoO4S4fKhHVvMuoYRk70bfZbi11Mya3A5UofQnTfqTp?=
 =?us-ascii?Q?oLFWCxDQmsb2+dNtNi7tHknbu6GWutcmxcZqnIMujbyo3r81PpQYKgkAVKvm?=
 =?us-ascii?Q?GpoLf3mITmUeaTm2kQUCnjQJKI5D3MFibQUyRxHIJ981Q3dZFb+FNDfcA7Ik?=
 =?us-ascii?Q?GIe2ALw0FI1mMHUK1gx1xyXT2g3tSB7I0lsGuD0P/w0art5CmlgkESllrWYW?=
 =?us-ascii?Q?zwKhJwVdNP3eQ2YgB4pDEtGII/RZS5ez8NYmGbH5ymdtpK6mJVUAOC4qSpBz?=
 =?us-ascii?Q?UaRGGlvIfAJeJMKR0O3absAIHGkr4eZPdyDW7TiCcPXQMAhaoWigZJ9PshDd?=
 =?us-ascii?Q?wfuNBTrG2A2O8mL8vJzq5t7bFOKJqPvJsxb2Bcp/Wd9EXiSvaf+hNxJhw/Kf?=
 =?us-ascii?Q?PP1fEMXsqMBTEVANsZBbzb6SI3ZAdDMWqyQqAF6Q8EkxNmLhnBhLtFgKMSov?=
 =?us-ascii?Q?AxQJE4UXVhkm3sV0tbqFwtyaPscA95KP5brRJXGwzGH6V1FScXLem0+ETtII?=
 =?us-ascii?Q?6EX0ouaJZLc8LTK5yX52kMC695v+3AMQEODNMrd1CghuZGr0ejWpK0Xc/aa4?=
 =?us-ascii?Q?NHbXAeSVGmOf9VfGZMWbjS9RsRYwSKoNcQuAIdKNdzOaCaXb9ZkiLEB/QRmq?=
 =?us-ascii?Q?aUJYoxUcOZyPFFItH2djjU1XbJ6X0tcj5kInXyv0aQng8EwALh2BULYaVgEg?=
 =?us-ascii?Q?SAKIBP41M+8b0tWnFQbM+1wOb3kBDBtdtmo8HMcg45UwijJt9x6iqbq98r35?=
 =?us-ascii?Q?uZ/xp1hC+eIxkCYAuQ+MrAdXvPDj013/K5PNu1NtxM/+vuGHmqcARvCm1I0x?=
 =?us-ascii?Q?FmOHMY/sDtwicBD3SjkJ1AhqqUQGRNNHO4iqwgdSfkyJsI3/xPS+ErwipQgG?=
 =?us-ascii?Q?taPtzEg6jk93Rq+z+83nlJH1B2vUkjzqzmjiS4iGQvJlTcJbb0hFXdlliJyb?=
 =?us-ascii?Q?bzs2VY1Fqcs9bN4OtYTW/hQs03jQz5J+pGJUYphivig5TkCT30YFtu2LNe9Y?=
 =?us-ascii?Q?GAggrWIFXHvCM5dsstXMDXunqZcXpeLB9TI8XTWQ76tXwVmlwhL1js1V15/p?=
 =?us-ascii?Q?xSZHvoQyQnAo1ZopinSzEhJnWCZzuP8CBaQm2QtsfS2NrKADHoVurpT0Cxsx?=
 =?us-ascii?Q?0AGrz18R+0jp4qdHiGTLRuHvBYtwoJGWh5zGoAaDjmeGmF3WzqoGq+ad9YcE?=
 =?us-ascii?Q?RUlywstCSAkbgwuXPstcZv17P2cqTd/pD74rxJ9Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48214de1-ff7c-4a58-28f0-08dd7c4fce13
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:00:36.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPmHAAuHDCAybN/5Y/GAvuRtwc+P/l+SDpzBPi+m7BQvPg0qiPDqsZVlNmteTcdOEV5La1tu54hwasnpbMeDtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971

On Tue, Apr 15, 2025 at 08:54:30AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
> comes with a 10.1 1280x720 display with a touchscreen (not working in
> mainline).
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Currently the backlight driver is not available, this will be upstreamed
> in a future patch series. It is a Maxim max25014atg.
>
> The touchscreen has a Cypress CYAT81658-64AS48 controller which as far as
> I know is not supported upstream, the driver we currently use for this is
> a mess and I doubt we will be able to get it in an upstreamable state.
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
>  ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 94 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index b6d3fe26d621234ab84353165d20af9d2536f839..ca3255aa9e18187b33d54c836992aca5dd5d0465 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -214,6 +214,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
> +
> +imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
> +	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..b3bbbd69f671493c809bbf043807a22adda5024a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "imx8mp-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	model = "GOcontroll Moduline Display with BOE av101hdt-a10 display";
> +
> +	panel {
> +		compatible = "boe,av101hdt-a10";
> +		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_panel>;
> +		pinctrl-names = "default";
> +		power-supply = <&reg_3v3_per>;
> +		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			panel_lvds_in: endpoint {
> +				remote-endpoint = <&ldb_lvds_ch0>;
> +			};
> +		};
> +	};
> +
> +	reg_vbus: regulator-vbus {
> +		compatible = "regulator-fixed";
> +		power-supply = <&reg_6v4>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "usb-c-vbus";
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07
> +			MX8MP_DSE_X1
> +			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
> +	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
> +	assigned-clock-rates = <0>, <1054620000>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			ldb_lvds_ch0: endpoint {
> +				remote-endpoint = <&panel_lvds_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +		data-role = "host";
> +		pd-disable;
> +		vbus-supply = <&reg_vbus>;
> +
> +		port {
> +			high_speed_ep: endpoint {
> +				remote-endpoint = <&usb1_hs_ep>;
> +			};
> +		};
> +	};
> +
> +	port {
> +		usb1_hs_ep: endpoint {
> +			remote-endpoint = <&high_speed_ep>;
> +		};
> +	};
> +};
>
> --
> 2.49.0
>
>
