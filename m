Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D9237160;
	Thu,  6 Feb 2025 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859382; cv=fail; b=WfZDRcdnybIsKpibDWGN9jk+RyIxW9ufbeDt4LdBEzpyaLVkukvkGRRVY82N513MCea18ZA7JW3k5Tp9pFWEdEjh1UMdHlZhyjIRjZNlMQpGb9mdiZwMlV6lD0lVFIl+hNn+19uaFV+z2pI+/9PAVC5F9Cg+zG2PxbIJyXLIt8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859382; c=relaxed/simple;
	bh=FTlR4rKpIxOgRB86V/ArAM1bsV15keYDP3XJdWnwFNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cU6vKBNhGb47MHIBBQYVsC0m8Nxg1lqRixB6HgL6mhtOXxDHZArKMkBf92q/hiPS438kALLrnSudjlSKRK4qJjbIyYs0xkF3iyD36gMqXqvfWtWqU6yPYfG2KALkOkut0ZKKlvZZtaS+K0MHkEO3RpN2crXeEAu0g+/xlhXEHas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qzhd9R8F; arc=fail smtp.client-ip=40.107.22.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qzhd9R8F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6pxAz9pfHefvPTg4I7CQxOGksqRCLoYLRBNP8+mvDXAdyCgBkYdEA4ILgZ6xiq3vv0dnEvNB9kVQcIv+AkNLC+kW7ycBLKMoa6ybiverQk7K7roHPlURuJw6UHxvM92GL6Fp6HSXIcTyuLqUpEM8CeVNG6CqsmEp5DZpjs9ABoLmo1f/ZMV43E/42TDJkzRCf04q4Dcylmkc2fMkRFMV5k2I2ae+gbDr1abOJ0bQTTrhDv1u4RHAms7wzJ1N8W6JWyfemY/joP698n92PIfrizKy0DKUqkYvx2Ibagb5WCl90ly+/vXk6LEdo+q+IJnEw7MyFyX9Ffc+IpC7yFebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwTXdGjDWc/McZsWjsDANRUXjmgXhP/JVHNv8AjVhFY=;
 b=xHTzivbxiNai5AITIxCCfaGyDUeDckBvor4wR+p7Oxscc6Al+h0kv3GfOFJPxKm3+mHN83RfUNTJrEO+FE7hYdABsx5m+1TG3ax5Y2v3+/MkDWknG/4IzxaMf2pUQD6hdGbPXpZ+GKYtbOR6IIKPtoSb9paK1mRxkJmXGi89O3eA5gpLn69RAmmeaNIuMnruWsfp75K+Rf370/YAYNfp0dAF0QQBz15yAQggxEq/1B/OivKSNkQIeuCabkYBzxXvcWwhHeJvkP/fcmkXCxCe1TOruoHkBa8YTxiKsqiGdlDI5uhOhzc1NrBIL1d5UAPG2dlGAcL0KPwhaLBpFeG4ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwTXdGjDWc/McZsWjsDANRUXjmgXhP/JVHNv8AjVhFY=;
 b=Qzhd9R8F6TZLhKqSUaqostC8YIYwoUMsyI1bDACB6iV9rj0snumdnz4zP5sQ/LVc5ja1D6nyKvWbdk3R/Zr24V7QtgkrEwGbaWesQM/VpqiU1t6FTaFaFwQ8dVHqOKUQnhtaDhLvBQHW3Tkr3RlI+KVuLexqh8mvJBG0WXSzQzgcY9CUIo+8n96NdbSGqE41FvFiO7gOwXJ1OdrQaoIJg3CYKWbl1bvTa3Fukj59bzQa8+okRRDK5CmujTfiVboK4GooHZE7xdQKLvjKoaHIVRGzDoET4l1zTrABmnC2G84gQBfGiU+jMyBexM7kUEwI10rM64qaT2oBqwwP02DG+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7201.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 16:29:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:29:37 +0000
Date: Thu, 6 Feb 2025 11:29:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 8/8] ASoC: SOF: imx: add driver for the imx95 chip
Message-ID: <Z6Tjaa9yNu4+eSv5@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-9-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-9-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba1d202-3cba-4a1b-6efa-08dd46cb7275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B6KKBPCp+acz4xnLJAUXLNsAT8EJJ7anFnkuyPTxrtnsv72kx3qK525xxpf/?=
 =?us-ascii?Q?nR9eNbPOYxEwmNhfw8CfG6piuDojt227Ti5fGF6nyQ6ftzCv8tEHH/ff8OMq?=
 =?us-ascii?Q?H3wWNMtu7nVv7Xt38S09jsylGkHXEL6M9uN+Nsv5uLsj0qcRvSwxibFbYMBZ?=
 =?us-ascii?Q?RPGCykbnVGYcgX1tc+XdZedp+TLlkG8rJaC/y6cFoGW2QNxR1OudoaldAUrO?=
 =?us-ascii?Q?s6b1tqzoeIe8ezHaNhGzJD1i4UtWAZKO40lMy9aiQPI2m791GTlyb+3qaMGt?=
 =?us-ascii?Q?aM0KtrIWN0FooA86jhagYOciI41G17dLK581fmyUxyRmc1Fhw1K7imzU8Vt7?=
 =?us-ascii?Q?IPcsTI1+ictXeTMnSUm+n7E8Sq1GeUkXAcJn+uRdRczvskm1nsZMB8UhHVlQ?=
 =?us-ascii?Q?UN1KBwLgzaO0EQenFl6p8u1M/386m5RMTqilp0DO209/0tD8tomXtKxoEPCB?=
 =?us-ascii?Q?+xcO62AywRZpT7QfNwiPUXFooCtuZaFOAoBhqb0voFSRrib7wxyCwbZ5lmDe?=
 =?us-ascii?Q?UF/j09hchAFzuq6cO1S850q0pWHmZjXmmJd7YPAC25cQXeLxsqIvsTDImiPm?=
 =?us-ascii?Q?J/OzqI1Tac3IXf4Ntq5FP3dVfbS5Fdwiug67n85ALYigQH+oD5LI3HVqDVZl?=
 =?us-ascii?Q?c1IyOIHahdsr0gD2sL6owslIPl9lebFfivzHHNizILAFpXISmItB5QTGUTyI?=
 =?us-ascii?Q?WSZV0MePAK32ULheSNzB/9pbZCsRlJKuPic04Jo4c9HgAuuU5YAMgsnRqcty?=
 =?us-ascii?Q?VRALgH8Olhr9pZ5qzEVlA2DTgx39qONF5au51iVJkOEoEHBmPlcIv12bSna0?=
 =?us-ascii?Q?GDWRFJJ7jTWvZn9WL57tyE+s5Co6QRM8Bf2OjvzZRlQpt3d1rgvWdEyPs+ZZ?=
 =?us-ascii?Q?VxN+UP2OnbZ/L/5Ii3sV6FhmcSv7MGGGmhuy1DMB6YLj5gwAHzK4cJ5LjExy?=
 =?us-ascii?Q?qG25F9KVJiimnmExeDiTjO+3jgQyEzw3h1OeUF2gtpP09mSmxpzOp4Tm8WB2?=
 =?us-ascii?Q?zWj/PBkrZch5k5LpUmsWS4APl6KL8NKZd1ydVfKgbANJYEDiicoLcgOUnGsw?=
 =?us-ascii?Q?x5TMY/3auBsbRfK8dFXYIGbNTv7TN3UQqGVydCQ0NgjgX9Z06eIoY1xv1JVZ?=
 =?us-ascii?Q?XBU1U/famHyfVLZXLhNGDNpoQwF2XAsMUHke5gUILkbmf6FEtMBB5xjan+NV?=
 =?us-ascii?Q?cnCS6dTqTKbZmBvWk8rX4mUFNt7qyx6oRwovLVJl7gfiIZs+Y2NX+aeR8GSy?=
 =?us-ascii?Q?FYtIsb2nMXokSmBL6XHW3QsJGoMeqJvgWC3vAu0ZgyTsk5i6oxuxbslg006l?=
 =?us-ascii?Q?X9fG4ksPLlEmfKI+ppSoktVDTWe5agbU5b9lSSi+jKuPlKpcbyUX+rIfoTZT?=
 =?us-ascii?Q?a5vB8zGbfIUhMuA6qBt/YGJ4/Jhr0I0CChLhMXVWT1JZpYR2eswiWsaKRy3a?=
 =?us-ascii?Q?wgCzbMgKGHnL/8+TT+i2X7H2oYwQbUxp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HewfJsWIwvJVEu3wcxLRWEF1EA29jVnEa24jvzsQbsbACyDXBTJPs3qtAlRX?=
 =?us-ascii?Q?3bz5tcmG72JwJjyQ0QVl1zr/VEV/ZSjPVciag86Vdvcnywl/sSe/fPXgZ7Je?=
 =?us-ascii?Q?qZN4Qy5SXFFi9XWeCnMTU9U2bYeVkCbFokBgr1PX8Z7CcB5otHvzHRTxeIAW?=
 =?us-ascii?Q?PdagdXIVMZcP6CBFrjxVe45cdsNTITgHfyQXpveUEV2uhxQFOvsFD54I90we?=
 =?us-ascii?Q?HbSLGqF+GImjAdFyDIDr/o/PyKUWUmt+RMEAx9lr8M+n4wAoErgL8wGn0281?=
 =?us-ascii?Q?K+GDRrjHkfa8M4dNjOX8kK5cAkt6MWSVUvuAkG27WhvQYDsURwJfj1VaaQ/q?=
 =?us-ascii?Q?iFFkRzGEpJVA5ksd0GALDezgxd/353PXlcZcBoHFSIzJlnxo9RcAye184CSV?=
 =?us-ascii?Q?dZttIkITWQ2ZSqr4jHLM0eEBnwQnNOs3UXKMgBDejOt9lv+1Gk0vKDTayVYJ?=
 =?us-ascii?Q?3NSQaIskABnphV3hIMnmQriBXDNe9xENEXcX4mmLevaqXDKH65mGd8jydG3U?=
 =?us-ascii?Q?lrexNuGuFAARqTBXHVSVtduS9L6tTiRwCGBc/rLR0TTOQRvsLpOwXdJLfU4f?=
 =?us-ascii?Q?Xatfha1ap39ttn1o8vKNqaeUi8IYuOwUjlHwF/IsIlMrGpKEIjnpociW8lmO?=
 =?us-ascii?Q?NV0jA8P4FDkdyi/yH3fIg9jgXPlsHufD5hS02EWOqvZZIgzHqcqhjq4pX0cp?=
 =?us-ascii?Q?1NNQga1Ad+hkS/aH9cfroiDcTs6prfhMCLpgHwg7HBrqnT8mgXGG23Yw3iE8?=
 =?us-ascii?Q?MY/oDOKD2wmIlmv6RLIXlAFC2xUYdNMe7LVjogOd7cGEsUY81jnCycw6IEti?=
 =?us-ascii?Q?fg9txRqtBQ6YTnjJjDVCL2CykGL8mXAxZcDnuZayupRR3hOwtMNUc+yvYJmO?=
 =?us-ascii?Q?qANqe41GE3AkfpQpf2317ypz0/9EZ6RRMd2vo/cDCNGFiQBY9tutTKSOMe16?=
 =?us-ascii?Q?FIiSRMWYiLvVo5zvjGOzHRpnBg3mVazfDdDyJ5OpoEXZn9CR28KAnNMsBF4E?=
 =?us-ascii?Q?oWujMhBXNGQozZUGoGJgSrbU0xpTSj/NCxnTKPWWr7MPzJdIP6TsP2aADQvD?=
 =?us-ascii?Q?Q2T7o/xfMkVjeN26l6FvCEwwCRuRlW79CvlpkPK8l+DWxUKx9lhClHOjubrI?=
 =?us-ascii?Q?btT5ldvuB8LSovBSgEfRIZIZoIgNIXC1r2BgOg/FBMi8uDNC4DnaFc9R+ak+?=
 =?us-ascii?Q?4U11kVeCSCTZxVSC2nispkWnkdxX5S+LlU2f8738Z/lodsb4oUMDDO9cDgpo?=
 =?us-ascii?Q?5Uy8+ctaAoeuomrwbCfmfTK1P9n2tc8hASZJ3ukIFXebfQNasZY26T4bA9Hk?=
 =?us-ascii?Q?ZYll4pO09IdK+BdH4aMbUJUd/YaA29NWOjodRgtcJXhjc5KX1omGNrUxLHJb?=
 =?us-ascii?Q?1aQpcvpvE4+9JhHgbUQY3jOKre1la2c9YMeoC1IrSZd2ZrDiOUeZYW09+ltz?=
 =?us-ascii?Q?AiL6QfgfcND9iS9XMt111i+3KZnstu8NvRbXey4WrjIvl1ElF8togY41X7dr?=
 =?us-ascii?Q?78jWSbJ1hjLF1DJFCPfu2GyN/Uf4+H5awRSZISVJ9nNvOGR1uKR4x37ykN5c?=
 =?us-ascii?Q?6tALVNFi0KyGwSWtYd7agVMSb72NdjU/HAmke5/J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba1d202-3cba-4a1b-6efa-08dd46cb7275
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:29:37.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZrioVIz1vZFjYT+85AfRsFJVsofg6zfupWOQVebI1xAr+w58e/gRBSa/pKLRlfI/AXcJWYlR4RE+7xnOnFliQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7201

On Wed, Feb 05, 2025 at 03:30:22PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add SOF support for the imx95 chip. Although the support is just
> for the imx95 chip, the driver is intended for all chips in the imx9
> family.
>
> Note that the imx95 support could have just as easily been added
> to the imx8 platform driver but a new platform driver was created
> because the intention is to keep the families in separate drivers.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  sound/soc/sof/imx/Kconfig  |   9 +++
>  sound/soc/sof/imx/Makefile |   2 +
>  sound/soc/sof/imx/imx9.c   | 137 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+)
>  create mode 100644 sound/soc/sof/imx/imx9.c
>
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 2edf9de2c886..327e2df94a58 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -32,4 +32,13 @@ config SND_SOC_SOF_IMX8
>  	  Say Y if you have such a device.
>  	  If unsure select "N".
>
> +config SND_SOC_SOF_IMX9
> +	tristate "SOF support for i.MX9"
> +	depends on IMX_DSP
> +	select SND_SOC_SOF_IMX_COMMON
> +	help
> +	  This adds support for Sound Open Firmware for NXP i.MX9 platforms.
> +	  Say Y if you need such a device.
> +	  If unsure select "N".
> +
>  endif ## SND_SOC_SOF_IMX_TOPLEVEL
> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> index 36a3a67c6efb..74b5ecad8fe8 100644
> --- a/sound/soc/sof/imx/Makefile
> +++ b/sound/soc/sof/imx/Makefile
> @@ -1,7 +1,9 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>  snd-sof-imx8-y := imx8.o
> +snd-sof-imx9-y := imx9.o
>
>  snd-sof-imx-common-y := imx-common.o
>
>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
> +obj-$(CONFIG_SND_SOC_SOF_IMX9) += snd-sof-imx9.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
> diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
> new file mode 100644
> index 000000000000..598675d4350a
> --- /dev/null
> +++ b/sound/soc/sof/imx/imx9.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/arm-smccc.h>
> +
> +#include "imx-common.h"
> +
> +#define IMX_SIP_SRC 0xC2000005
> +#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
> +
> +#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
> +
> +#define IMX_SIP_LMM 0xC200000F
> +#define IMX_SIP_LMM_BOOT 0x0
> +#define IMX_SIP_LMM_SHUTDOWN 0x1
> +
> +#define IMX95_M7_LM_ID 0x1
> +
> +static struct snd_soc_dai_driver imx95_dai[] = {
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai3", 1, 32),
> +};
> +
> +static struct snd_sof_dsp_ops sof_imx9_ops;
> +
> +static int imx95_ops_init(struct snd_sof_dev *sdev)
> +{
> +	/* first copy from template */
> +	memcpy(&sof_imx9_ops, &sof_imx_ops, sizeof(sof_imx_ops));
> +
> +	/* ... and finally set DAI driver */
> +	sof_imx9_ops.drv = get_chip_info(sdev)->drv;
> +	sof_imx9_ops.num_drv = get_chip_info(sdev)->num_drv;
> +
> +	return 0;
> +}
> +
> +static int imx95_chip_probe(struct snd_sof_dev *sdev)
> +{
> +	struct arm_smccc_res smc_res;
> +	struct platform_device *pdev;
> +	struct resource *res;
> +
> +	pdev = to_platform_device(sdev->dev);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> +	if (!res)
> +		return dev_err_probe(sdev->dev, -ENODEV,
> +				     "failed to fetch SRAM region\n");
> +
> +	/* set core boot reset address */
> +	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
> +		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
> +
> +	return smc_res.a0;
> +}
> +
> +static int imx95_core_kick(struct snd_sof_dev *sdev)
> +{
> +	struct arm_smccc_res smc_res;
> +
> +	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
> +		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
> +
> +	return smc_res.a0;
> +}
> +
> +static int imx95_core_shutdown(struct snd_sof_dev *sdev)
> +{
> +	struct arm_smccc_res smc_res;
> +
> +	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
> +		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
> +
> +	return smc_res.a0;
> +}
> +
> +static const struct imx_chip_ops imx95_chip_ops = {
> +	.probe = imx95_chip_probe,
> +	.core_kick = imx95_core_kick,
> +	.core_shutdown = imx95_core_shutdown,
> +};
> +
> +static struct imx_memory_info imx95_memory_regions[] = {
> +	{ .name = "sram", .reserved = false },
> +	{ }
> +};
> +
> +static const struct imx_chip_info imx95_chip_info = {
> +	.ipc_info = {
> +		.boot_mbox_offset = 0x6001000,
> +		.window_offset = 0x6000000,
> +	},
> +	.has_dma_reserved = true,
> +	.memory = imx95_memory_regions,
> +	.drv = imx95_dai,
> +	.num_drv = ARRAY_SIZE(imx95_dai),
> +	.ops = &imx95_chip_ops,
> +};
> +
> +static struct snd_sof_of_mach sof_imx9_machs[] = {
> +	{
> +		.compatible = "fsl,imx95-19x19-evk",
> +		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
> +		.drv_name = "asoc-audio-graph-card2",
> +	},
> +	{
> +	}
> +};
> +
> +IMX_SOF_DEV_DESC(imx95, sof_imx9_machs, &imx95_chip_info, &sof_imx9_ops, imx95_ops_init);
> +
> +static const struct of_device_id sof_of_imx9_ids[] = {
> +	{
> +		.compatible = "fsl,imx95-cm7-sof",
> +		.data = &IMX_SOF_DEV_DESC_NAME(imx95),
> +	},
> +	{
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, sof_of_imx9_ids);
> +
> +static struct platform_driver snd_sof_of_imx9_driver = {
> +	.probe = sof_of_probe,
> +	.remove = sof_of_remove,
> +	.driver = {
> +		.name = "sof-audio-of-imx9",
> +		.pm = &sof_of_pm,
> +		.of_match_table = sof_of_imx9_ids,
> +	},
> +};
> +module_platform_driver(snd_sof_of_imx9_driver);
> +
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_DESCRIPTION("SOF driver for imx9 platforms");
> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
> --
> 2.34.1
>
