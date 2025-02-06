Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C556237162;
	Thu,  6 Feb 2025 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859296; cv=fail; b=SlesrZ594TNMM9CsLQVgyuNZphPAI1qvInKD9CW7HBGUAaccZH+A2DZqK5AVvm8+WOrOvOFX2ir44mTKXsiKyqRCfzjiuGd0zEekE5u1w0V7NQ6aqxsU/a3lr3PYPJFJZ1UlXTdT/8EkrAOLCFvT1GtZ+sGTTwQ070xXP67nJ68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859296; c=relaxed/simple;
	bh=/kKYafKLKnM8NenZOrfR0wGl7s6BRoslUVjhTvUvtjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cC5xKhOK0wWD+oKAPRu3C6dW9DwGjVhKDKy99hJP6fGhcN4IxxYwnmkARqgY8f4FGZDlwPm5AfG7fVvzCXwVdtZu4ZewOM7uKfrOuAh/A30/NRW9n0Nw7ObXKm3KO7v+yw91L16bWEwn/i/4h1THMvYfJyq0vb4T2IADWqrGoIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YIGFglhS; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YIGFglhS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msNz8Bp5wzhzAkPpQnutXFfvlFdxuEDIEZDm9U8Sp5I69apFrr0XDGNERqMY4sg4wqnyZVm6ECxUnBmr84zmfLvJo6dTiKo1b26hI6N6AzXSP7P1HTUaLFmv6Wu0mVRPgRlXaRgAU9EC9lIAClRpddbF0DNOku7sMmJC234qwXT1s3KtfxHWdB4EWytWH32XrJf09YesohC4JksBHV6HlzDvrK1apE4xp2NS104Xj51tWlWtkkgKWfoM4xanu4F04xSInP35Tkz5zBuba5/3maeZZRbg95tGD6ACaE838cAXpkH3DJ1b5O3dDoLDZiV2pGmAAOOraug8feWPMnR+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1e+73arWJ6hoTV6f8ztf3nnCQ+wtYgIrHbI+gH4/wM=;
 b=xTraTTKGk4o0PfY7n/u4ZxwtSA5ftXeNTiyq0DgYck3f8Rhe/gDCvk8JKHiXuG4hi5zyi0YModPmKu4GEB7k381PyPSeg0OfmW0BWd/U+YP5cjTQev18q4FR++94QlnQlyKE8EuJNet/IMd5y2eigtbJz8KtFVWFjR8sPhv2OoVoYkUdf+V/MoV1Fj5k9IgUWoESeme2sP+xp9IJFg6qJOt2mV6534KFFrKv6mO1ZmCYmatcJVlglnqLEA3gsP5YPbAiKEwjdWaIQYxS+FHX6Ai+wItyxEE20C73KwRXIylV5LgDasl42zH++wHlCTDDFplQR1XvDIW0XXOYcAhp8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1e+73arWJ6hoTV6f8ztf3nnCQ+wtYgIrHbI+gH4/wM=;
 b=YIGFglhS5y2GfO1ENNAGrHaRc7eofaPaAdMOtym5phPxQ5e1sjfxGpOyOFNwL+JYRZJ4BDiH3fSf1xL/ILCDcdcjZU4vLoibAw6GIdMq/BuReFyQ7ZTUue45jSflwO6oalEWcrQETLp8cv3rx1pS1O1Qp/QUDAMW721xF7vTOFXGbEveC1QXsYfdBVXPSXW9btRTYUUZq9XtASdwRSTOK4X63A0cMQ6BLPKnrMll03a8Mwzp4HPhI1or/v4QuDviInjwwFFUlHYyd/iEn7gqS1qll7E+Ct0wIhSSzzscK/A/NVHy55W9s3dKg6s9itFFLBjpoEFEtGuOSV9rq9lyaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7201.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 16:28:10 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:28:10 +0000
Date: Thu, 6 Feb 2025 11:28:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 7/8] ASoC: SOF: imx: merge imx8 and imx8ulp drivers
Message-ID: <Z6TjE817tx3NNral@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-8-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-8-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b39883-ed28-4279-c48e-08dd46cb3ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hbu7lyLZzPikRJqkl4bO9v0xOVj/DIgiAqU7ZgSrHdDud19uz1Di67n5ELy3?=
 =?us-ascii?Q?VArjw9aJFkOtR55nKPw/y3XW4DymGfkTuxM5YwaQaj4+2ErmgLbcp86vkkGL?=
 =?us-ascii?Q?fznQVOay5oIWUsyCRDIIa0gEcwiNpH4wMGUzFJRdWhxXEHKeSp5vqtn/srUt?=
 =?us-ascii?Q?99hRCRErp6DWkJ4Bo9SYnMh4sQKQq4ZroZyN1rK/V+PBgsqJdbVL5sW/5uys?=
 =?us-ascii?Q?GVZjc3C11Yh62Tx7pLSEU7GHTE7wqVUMklKMDTTaj7+zrcz9WQJ9CZlfLjgY?=
 =?us-ascii?Q?r4YjoiQXPvsbOOFrGHahTLVCStFg0E3FeH/XK7WmpyQzg9yvXS47LrRH4dit?=
 =?us-ascii?Q?mbglSVjfBPBnpcWN32VmD2joCdhGhM6ST1u/YWqS88zSoXJT+Cln/BnIPBQv?=
 =?us-ascii?Q?2R4A5uYUnOWRSqxVy3mgWi7HeHzhEaTGdCsWpa7foSjeZnxHxF4nreXsa+y5?=
 =?us-ascii?Q?DjPyDYvBo/O4MQof0tANYkymMX3b3yVKmhQhduPrbvY+CMNE4uFle+SiFvWa?=
 =?us-ascii?Q?KV+OhfAmLqSgMZY0FZQ8RERZa7tut15tRWDwH9mpwo6dRWPACzwc4XijgnrU?=
 =?us-ascii?Q?Id2LISsgrILp0q910IqZe8gU9QJO6vaQLu+A1CI/b4hi47LqP+J9tNReCKgu?=
 =?us-ascii?Q?Mg1AAnci9n/CPHscUGKE+JacP+JDO3ANtSZZNi+l//eTxtN4e45aqclM1KrH?=
 =?us-ascii?Q?IS8VqlHd/D6kXN5Rr4Y1iKY9OJmWaLoVskbhKBHRTKg5KmWtR8zCWdpnY6f3?=
 =?us-ascii?Q?+5h64bxR+LcAphRTw+T3sscH58ZbtzB+nfqQDt/i0IGrBVlUlJGGRkmkc3+I?=
 =?us-ascii?Q?Uw7RF0FBAj5dV41vWaMmMVGcS9+AR9+Y8MM2hwwPCOHMwlKCclCTLyk3ytv8?=
 =?us-ascii?Q?EuiFQa36OQTiXFstUz7revM4JDieKHQvElN7TlTtL50LiDIY6DTeAhB6CvIv?=
 =?us-ascii?Q?KVh3gf5AV9Zu1QSatEqo1Ur8cYeDhklbDIuLE4hcu6Wm/LOzK04uQji5ZE4X?=
 =?us-ascii?Q?XLlDnBGjsYDRB0btj+LrfIgFqiOIN8sUNwBk9pLPVmpkWJ4LD8ilEktVholw?=
 =?us-ascii?Q?5/+fKm3uYnZ1sR/69W+lkYZQ5id6rzXVPt7L8dvwdS7YXqF2idEFyyVTYva1?=
 =?us-ascii?Q?lIhoZwBovH/yBYWOu90iaP37MCbptHvofCTB4p+h/hufZFEtl/s4UWHDUHO1?=
 =?us-ascii?Q?0UPgeG1tOHvv8M11qGU1djLmW7fmhSV8JFqNjJKa+L4O3dhIaPVpiYXLJMoy?=
 =?us-ascii?Q?f/X/AQGiAUDaZ1IHaMZw/aeqhNwIA6UHMRAf89xjQ3TK1rCoDmobRxnostWj?=
 =?us-ascii?Q?BUgUbcLIsr2qHwfOhf4gufZdymv5WnqinGNxlStjfg95GEjjWPKhzrVdNA8O?=
 =?us-ascii?Q?QUUqcE99roR38DS/n+GvVPU0zmzV4GIOuanlyoPNc9bwLYWJNgTVuMqrVY4R?=
 =?us-ascii?Q?YVzoXuX+6//iP21kvjQcYtu4hczsjDKN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m2Cq0VkdF26AEKe61C5GceRyFyLa79I8oTxwA9xFiCgvaylfR645qggcaG1Q?=
 =?us-ascii?Q?sOpZKrnIV9PMdX5oL2gFYpk1cCfsLbp6yzzJBh1I1JhOtRtY9GVohqyRtos9?=
 =?us-ascii?Q?XRKNR29aNkdw+eKDv0BxTxt+e8Sjvu2sk5uT3ShnwzI1Th5Tywnuk/YOS5AV?=
 =?us-ascii?Q?3WsJCpAxzajX5WLiR3Glk0nZ5aQrtbuXKGUpMQS6cxJsK7gB8prkR0eaY9yx?=
 =?us-ascii?Q?EODRhCVaK98HE9UoRMiPxQGfAMlYM0A6arq1kFUweJ61jM7ntwBMKO3nk2VZ?=
 =?us-ascii?Q?PfGtAFPC1rdnEqbTN/IEjoI38ACjJ2EJg6q/NWfy9ffk0CdRQ7ic+rAZTu//?=
 =?us-ascii?Q?3M4TbA2Ytw/bK6VqsjkbN53IO3y4+g4iACBOP+ZRl31bCppn++GMH5Moroeq?=
 =?us-ascii?Q?5DBtFrmGkCl+BxGBTdZm35FKJy0O/3QFmbvdr/iw5JnoZswONHyEFnAenEIM?=
 =?us-ascii?Q?j/0SlaKS7VD/01nKhPLzFpOXDatss06Fjm1NMYPSVXUkShRURH+ZTEwBdUhv?=
 =?us-ascii?Q?bgVDJulrKFwffm/yatCvjri2Amit9Shv+c4OMFTUqtxo0XUEN+0YRN3VxcO6?=
 =?us-ascii?Q?9/tV6vjFwFCPgjoiojsYfseRVDIwpG0PwOnF6u/4nEzAUp1JnvNG82C8YPM/?=
 =?us-ascii?Q?k+tASLgXbvZWmuPBlih12dliARzArkUoaWEUBkwpr+JjDP+k/Oi2pIrk+jFd?=
 =?us-ascii?Q?sMY6oOrKvd5PgC36DyeZLJGkPB/VytjyBbCK7uhCdqdnrPD/aE7zdeakh4Cs?=
 =?us-ascii?Q?+XQq6vsJMVuFYht0ko/JUWIvq7EML0NPb3B27GVF4x4Nmjf8/bLbaHHzKL9c?=
 =?us-ascii?Q?QL0lq3w1kiCIRQSoVWl+YBfKhxTWjoc/BSZ7S7QHnM7dqYTw67lEj1gAX+ZF?=
 =?us-ascii?Q?cwGBTIc1rxXtoBtbo1hvVpx2chgMpNzndc+fSM5MoyoDg82Gm45LrbE9GuqC?=
 =?us-ascii?Q?EO4AohmiZz5n4H00SxcBADXVEMsh6EU0lxIo7gHl7cNf7SzJR6wcyQmEl6zs?=
 =?us-ascii?Q?F8qsLol/z3lQ1mpeFhZ1pnl6Vyo3VMFchl9PPObd7KB6V0C7f2/Z+ZBzLCYu?=
 =?us-ascii?Q?mdfQfa6dTmylLjJT/WIpzi7EkA3vV1syzvuYE4XZyH2rrOeyVVJbbMJNk1FY?=
 =?us-ascii?Q?jfFL8MuzeqpJhr8sicbk3KExa0X7rbXI/XTbSJhxRvcC281k/HxAU+64WfZ6?=
 =?us-ascii?Q?q4p8mGXw6mYqNWOcGaNb4YUT+ZmK06j7GxvrA79SeFbyu2sRnG9E1U+Z0dKw?=
 =?us-ascii?Q?zDntx1RnOchtIbo6hxvcduqTo6iYVSmp9z+XYo9WIztoRiu2yUrlV9J8OHMe?=
 =?us-ascii?Q?caAg7sELLds0IHylsZUfJB0LCP1AtHXDYiUXkfHj8iOnXyU93Qy5mmyLK6jJ?=
 =?us-ascii?Q?haYzhglyDYFVTn4CipGL1GY1p/Hs7K2MT43v9cacZ/hJEaYjTgwjj+sEM0mr?=
 =?us-ascii?Q?OS9Ty/U0ApofwNSvIKFFrPFLu4KAe9jrtJ86mh9BZPr3KXJB5iFt9hrjCznU?=
 =?us-ascii?Q?SUS4R79TG43wRPGIppERKK4dkMPtc44oID3hP9XTZb074ujTfrSrP+VdoND3?=
 =?us-ascii?Q?CrlnPNLNvdAJAPwNzQyRFF6wNCHDNpvuofacdzSC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b39883-ed28-4279-c48e-08dd46cb3ea8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:28:10.3674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGnxv3e+E25QjsGISHNYQflGIgSl+g2ok11p8qa7L5a9oYo1lhNTCPzAjm/IbM5zfepjEHv17Ncu+SKIUxOWmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7201

On Wed, Feb 05, 2025 at 03:30:21PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Now that the common interface for imx chip has been introduced,
> there's no longer a need to have a separate platform driver for
> imx8ulp. As such, merge the driver with the imx8 driver. Furthermore,
> delete the old driver as it's no longer useful.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  sound/soc/sof/imx/Kconfig   |   9 -
>  sound/soc/sof/imx/Makefile  |   2 -
>  sound/soc/sof/imx/imx8.c    | 113 ++++++++
>  sound/soc/sof/imx/imx8ulp.c | 520 ------------------------------------
>  4 files changed, 113 insertions(+), 531 deletions(-)
>  delete mode 100644 sound/soc/sof/imx/imx8ulp.c
>
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 92fdf80d6e51..2edf9de2c886 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -32,13 +32,4 @@ config SND_SOC_SOF_IMX8
>  	  Say Y if you have such a device.
>  	  If unsure select "N".
>
> -config SND_SOC_SOF_IMX8ULP
> -	tristate "SOF support for i.MX8ULP"
> -	depends on IMX_DSP
> -	select SND_SOC_SOF_IMX_COMMON
> -	help
> -	  This adds support for Sound Open Firmware for NXP i.MX8ULP platforms.
> -	  Say Y if you have such a device.
> -	  If unsure select "N".
> -
>  endif ## SND_SOC_SOF_IMX_TOPLEVEL
> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> index 852140bb8104..36a3a67c6efb 100644
> --- a/sound/soc/sof/imx/Makefile
> +++ b/sound/soc/sof/imx/Makefile
> @@ -1,9 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>  snd-sof-imx8-y := imx8.o
> -snd-sof-imx8ulp-y := imx8ulp.o
>
>  snd-sof-imx-common-y := imx-common.o
>
>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
> -obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 859355eababa..d4bf92982eae 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -8,6 +8,7 @@
>
>  #include <dt-bindings/firmware/imx/rsrc.h>
>
> +#include <linux/arm-smccc.h>
>  #include <linux/firmware/imx/svc/misc.h>
>  #include <linux/mfd/syscon.h>
>
> @@ -29,6 +30,16 @@
>
>  #define AudioDSP_REG2_RUNSTALL  BIT(5)
>
> +/* imx8ulp macros */
> +#define FSL_SIP_HIFI_XRDC       0xc200000e
> +#define SYSCTRL0                0x8
> +#define EXECUTE_BIT             BIT(13)
> +#define RESET_BIT               BIT(16)
> +#define HIFI4_CLK_BIT           BIT(17)
> +#define PB_CLK_BIT              BIT(18)
> +#define PLAT_CLK_BIT            BIT(19)
> +#define DEBUG_LOGIC_BIT         BIT(25)
> +
>  struct imx8m_chip_data {
>  	void __iomem *dap;
>  	struct regmap *regmap;
> @@ -49,6 +60,11 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
>  	IMX_SOF_DAI_DRV_ENTRY("micfil", 0, 0, 1, 8),
>  };
>
> +static struct snd_soc_dai_driver imx8ulp_dai[] = {
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai5", 1, 32),
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai6", 1, 32),
> +};
> +
>  static struct snd_sof_dsp_ops sof_imx8_ops;
>
>  static int imx8_ops_init(struct snd_sof_dev *sdev)
> @@ -208,6 +224,68 @@ static int imx8m_run(struct snd_sof_dev *sdev)
>  	return 0;
>  }
>
> +static int imx8ulp_probe(struct snd_sof_dev *sdev)
> +{
> +	struct imx_common_data *common;
> +	struct regmap *regmap;
> +
> +	common = sdev->pdata->hw_pdata;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(sdev->dev, PTR_ERR(regmap),
> +				     "failed to fetch dsp ctrl regmap\n");
> +
> +	common->chip_pdata = regmap;
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_run(struct snd_sof_dev *sdev)
> +{
> +	struct regmap *regmap = get_chip_pdata(sdev);
> +
> +	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
> +	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, 0);
> +
> +	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
> +	regmap_update_bits(regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
> +
> +	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
> +	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, 0);
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_reset(struct snd_sof_dev *sdev)
> +{
> +	struct arm_smccc_res smc_res;
> +	struct regmap *regmap;
> +
> +	regmap = get_chip_pdata(sdev);
> +
> +	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
> +
> +	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
> +
> +	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
> +
> +	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
> +
> +	usleep_range(1, 2);
> +
> +	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
> +	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> +	usleep_range(1, 2);
> +
> +	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_res);
> +
> +	return smc_res.a0;
> +}
> +
>  static const struct imx_chip_ops imx8_chip_ops = {
>  	.probe = imx8_probe,
>  	.core_kick = imx8_run,
> @@ -224,6 +302,12 @@ static const struct imx_chip_ops imx8m_chip_ops = {
>  	.core_reset = imx8m_reset,
>  };
>
> +static const struct imx_chip_ops imx8ulp_chip_ops = {
> +	.probe = imx8ulp_probe,
> +	.core_kick = imx8ulp_run,
> +	.core_reset = imx8ulp_reset,
> +};
> +
>  static struct imx_memory_info imx8_memory_regions[] = {
>  	{ .name = "iram", .reserved = false },
>  	{ .name = "sram", .reserved = true },
> @@ -236,6 +320,12 @@ static struct imx_memory_info imx8m_memory_regions[] = {
>  	{ }
>  };
>
> +static struct imx_memory_info imx8ulp_memory_regions[] = {
> +	{ .name = "iram", .reserved = false },
> +	{ .name = "sram", .reserved = true },
> +	{ }
> +};
> +
>  static const struct imx_chip_info imx8_chip_info = {
>  	.ipc_info = {
>  		.has_panic_code = true,
> @@ -272,6 +362,19 @@ static const struct imx_chip_info imx8m_chip_info = {
>  	.ops = &imx8m_chip_ops,
>  };
>
> +static const struct imx_chip_info imx8ulp_chip_info = {
> +	.ipc_info = {
> +		.has_panic_code = true,
> +		.boot_mbox_offset = 0x800000,
> +		.window_offset = 0x800000,
> +	},
> +	.has_dma_reserved = true,
> +	.memory = imx8ulp_memory_regions,
> +	.drv = imx8ulp_dai,
> +	.num_drv = ARRAY_SIZE(imx8ulp_dai),
> +	.ops = &imx8ulp_chip_ops,
> +};
> +
>  static struct snd_sof_of_mach sof_imx8_machs[] = {
>  	{
>  		.compatible = "fsl,imx8qxp-mek",
> @@ -313,12 +416,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
>  		.sof_tplg_filename = "sof-imx8mp-wm8962.tplg",
>  		.drv_name = "asoc-audio-graph-card2",
>  	},
> +	{
> +		.compatible = "fsl,imx8ulp-evk",
> +		.sof_tplg_filename = "sof-imx8ulp-btsco.tplg",
> +		.drv_name = "asoc-audio-graph-card2",
> +	},
>  	{}
>  };
>
>  IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx8_ops_init);
>  IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx8_ops_init);
>  IMX_SOF_DEV_DESC(imx8m, sof_imx8_machs, &imx8m_chip_info, &sof_imx8_ops, imx8_ops_init);
> +IMX_SOF_DEV_DESC(imx8ulp, sof_imx8_machs, &imx8ulp_chip_info, &sof_imx8_ops, imx8_ops_init);
>
>  static const struct of_device_id sof_of_imx8_ids[] = {
>  	{
> @@ -333,6 +442,10 @@ static const struct of_device_id sof_of_imx8_ids[] = {
>  		.compatible = "fsl,imx8mp-dsp",
>  		.data = &IMX_SOF_DEV_DESC_NAME(imx8m),
>  	},
> +	{
> +		.compatible = "fsl,imx8ulp-dsp",
> +		.data = &IMX_SOF_DEV_DESC_NAME(imx8ulp),
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
> diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
> deleted file mode 100644
> index 0704da27e69d..000000000000
> --- a/sound/soc/sof/imx/imx8ulp.c
> +++ /dev/null
> @@ -1,520 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> -//
> -// Copyright 2021-2022 NXP
> -//
> -// Author: Peng Zhang <peng.zhang_8@nxp.com>
> -//
> -// Hardware interface for audio DSP on i.MX8ULP
> -
> -#include <linux/arm-smccc.h>
> -#include <linux/clk.h>
> -#include <linux/firmware.h>
> -#include <linux/firmware/imx/dsp.h>
> -#include <linux/firmware/imx/ipc.h>
> -#include <linux/firmware/imx/svc/misc.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_platform.h>
> -#include <linux/of_reserved_mem.h>
> -
> -#include <sound/sof.h>
> -#include <sound/sof/xtensa.h>
> -
> -#include "../ops.h"
> -#include "../sof-of-dev.h"
> -#include "imx-common.h"
> -
> -#define FSL_SIP_HIFI_XRDC	0xc200000e
> -
> -/* SIM Domain register */
> -#define SYSCTRL0		0x8
> -#define EXECUTE_BIT		BIT(13)
> -#define RESET_BIT		BIT(16)
> -#define HIFI4_CLK_BIT		BIT(17)
> -#define PB_CLK_BIT		BIT(18)
> -#define PLAT_CLK_BIT		BIT(19)
> -#define DEBUG_LOGIC_BIT		BIT(25)
> -
> -#define MBOX_OFFSET		0x800000
> -#define MBOX_SIZE		0x1000
> -
> -struct imx8ulp_priv {
> -	struct device *dev;
> -	struct snd_sof_dev *sdev;
> -
> -	/* DSP IPC handler */
> -	struct imx_dsp_ipc *dsp_ipc;
> -	struct platform_device *ipc_dev;
> -
> -	struct regmap *regmap;
> -	struct clk_bulk_data *clks;
> -	int clk_num;
> -};
> -
> -static void imx8ulp_sim_lpav_start(struct imx8ulp_priv *priv)
> -{
> -	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, RESET_BIT, 0);
> -
> -	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
> -	regmap_update_bits(priv->regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
> -
> -	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, 0);
> -}
> -
> -static int imx8ulp_get_mailbox_offset(struct snd_sof_dev *sdev)
> -{
> -	return MBOX_OFFSET;
> -}
> -
> -static int imx8ulp_get_window_offset(struct snd_sof_dev *sdev, u32 id)
> -{
> -	return MBOX_OFFSET;
> -}
> -
> -static void imx8ulp_dsp_handle_reply(struct imx_dsp_ipc *ipc)
> -{
> -	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
> -
> -	snd_sof_ipc_process_reply(priv->sdev, 0);
> -
> -	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
> -}
> -
> -static void imx8ulp_dsp_handle_request(struct imx_dsp_ipc *ipc)
> -{
> -	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> -	u32 p; /* panic code */
> -
> -	/* Read the message from the debug box. */
> -	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
> -
> -	/* Check to see if the message is a panic code (0x0dead***) */
> -	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
> -		snd_sof_dsp_panic(priv->sdev, p, true);
> -	else
> -		snd_sof_ipc_msgs_rx(priv->sdev);
> -}
> -
> -static struct imx_dsp_ops dsp_ops = {
> -	.handle_reply		= imx8ulp_dsp_handle_reply,
> -	.handle_request		= imx8ulp_dsp_handle_request,
> -};
> -
> -static int imx8ulp_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -
> -	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
> -			  msg->msg_size);
> -	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_run(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -
> -	imx8ulp_sim_lpav_start(priv);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_reset(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -	struct arm_smccc_res smc_resource;
> -
> -	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
> -
> -	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
> -
> -	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
> -
> -	regmap_update_bits(priv->regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
> -	usleep_range(1, 2);
> -
> -	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> -	usleep_range(1, 2);
> -
> -	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_probe(struct snd_sof_dev *sdev)
> -{
> -	struct platform_device *pdev = to_platform_device(sdev->dev);
> -	struct device_node *np = pdev->dev.of_node;
> -	struct device_node *res_node;
> -	struct resource *mmio;
> -	struct imx8ulp_priv *priv;
> -	struct resource res;
> -	u32 base, size;
> -	int ret = 0;
> -
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	sdev->num_cores = 1;
> -	sdev->pdata->hw_pdata = priv;
> -	priv->dev = sdev->dev;
> -	priv->sdev = sdev;
> -
> -	/* System integration module(SIM) control dsp configuration */
> -	priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,dsp-ctrl");
> -	if (IS_ERR(priv->regmap))
> -		return PTR_ERR(priv->regmap);
> -
> -	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
> -						      PLATFORM_DEVID_NONE,
> -						      pdev, sizeof(*pdev));
> -	if (IS_ERR(priv->ipc_dev))
> -		return PTR_ERR(priv->ipc_dev);
> -
> -	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
> -	if (!priv->dsp_ipc) {
> -		/* DSP IPC driver not probed yet, try later */
> -		ret = -EPROBE_DEFER;
> -		dev_err(sdev->dev, "Failed to get drvdata\n");
> -		goto exit_pdev_unregister;
> -	}
> -
> -	imx_dsp_set_data(priv->dsp_ipc, priv);
> -	priv->dsp_ipc->ops = &dsp_ops;
> -
> -	/* DSP base */
> -	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (mmio) {
> -		base = mmio->start;
> -		size = resource_size(mmio);
> -	} else {
> -		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
> -		ret = -EINVAL;
> -		goto exit_pdev_unregister;
> -	}
> -
> -	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
> -	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
> -		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
> -			base, size);
> -		ret = -ENODEV;
> -		goto exit_pdev_unregister;
> -	}
> -	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
> -
> -	res_node = of_parse_phandle(np, "memory-reserved", 0);
> -	if (!res_node) {
> -		dev_err(&pdev->dev, "failed to get memory region node\n");
> -		ret = -ENODEV;
> -		goto exit_pdev_unregister;
> -	}
> -
> -	ret = of_address_to_resource(res_node, 0, &res);
> -	of_node_put(res_node);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to get reserved region address\n");
> -		goto exit_pdev_unregister;
> -	}
> -
> -	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
> -							  resource_size(&res));
> -	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
> -		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
> -			base, size);
> -		ret = -ENOMEM;
> -		goto exit_pdev_unregister;
> -	}
> -	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> -
> -	/* set default mailbox offset for FW ready message */
> -	sdev->dsp_box.offset = MBOX_OFFSET;
> -
> -	ret = of_reserved_mem_device_init(sdev->dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to init reserved memory region %d\n", ret);
> -		goto exit_pdev_unregister;
> -	}
> -
> -	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
> -	if (ret < 0) {
> -		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
> -		goto exit_pdev_unregister;
> -	}
> -	priv->clk_num = ret;
> -
> -	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
> -	if (ret < 0) {
> -		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
> -		goto exit_pdev_unregister;
> -	}
> -
> -	return 0;
> -
> -exit_pdev_unregister:
> -	platform_device_unregister(priv->ipc_dev);
> -
> -	return ret;
> -}
> -
> -static void imx8ulp_remove(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -
> -	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
> -	platform_device_unregister(priv->ipc_dev);
> -}
> -
> -/* on i.MX8 there is 1 to 1 match between type and BAR idx */
> -static int imx8ulp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
> -{
> -	return type;
> -}
> -
> -static int imx8ulp_suspend(struct snd_sof_dev *sdev)
> -{
> -	int i;
> -	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
> -
> -	/*Stall DSP,  release in .run() */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> -
> -	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> -		imx_dsp_free_channel(priv->dsp_ipc, i);
> -
> -	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_resume(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
> -	int i, ret;
> -
> -	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
> -	if (ret < 0) {
> -		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
> -		return ret;
> -	}
> -
> -	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> -		imx_dsp_request_channel(priv->dsp_ipc, i);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_dsp_runtime_resume(struct snd_sof_dev *sdev)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = SOF_DSP_PM_D0,
> -		.substate = 0,
> -	};
> -
> -	imx8ulp_resume(sdev);
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static int imx8ulp_dsp_runtime_suspend(struct snd_sof_dev *sdev)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = SOF_DSP_PM_D3,
> -		.substate = 0,
> -	};
> -
> -	imx8ulp_suspend(sdev);
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static int imx8ulp_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = target_state,
> -		.substate = 0,
> -	};
> -
> -	if (!pm_runtime_suspended(sdev->dev))
> -		imx8ulp_suspend(sdev);
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static int imx8ulp_dsp_resume(struct snd_sof_dev *sdev)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = SOF_DSP_PM_D0,
> -		.substate = 0,
> -	};
> -
> -	imx8ulp_resume(sdev);
> -
> -	if (pm_runtime_suspended(sdev->dev)) {
> -		pm_runtime_disable(sdev->dev);
> -		pm_runtime_set_active(sdev->dev);
> -		pm_runtime_mark_last_busy(sdev->dev);
> -		pm_runtime_enable(sdev->dev);
> -		pm_runtime_idle(sdev->dev);
> -	}
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static struct snd_soc_dai_driver imx8ulp_dai[] = {
> -	{
> -		.name = "sai5",
> -		.playback = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -		.capture = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -	},
> -	{
> -		.name = "sai6",
> -		.playback = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -		.capture = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -	},
> -};
> -
> -static int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
> -				       const struct sof_dsp_power_state *target_state)
> -{
> -	sdev->dsp_power_state = *target_state;
> -
> -	return 0;
> -}
> -
> -/* i.MX8 ops */
> -static const struct snd_sof_dsp_ops sof_imx8ulp_ops = {
> -	/* probe and remove */
> -	.probe		= imx8ulp_probe,
> -	.remove		= imx8ulp_remove,
> -	/* DSP core boot */
> -	.run		= imx8ulp_run,
> -	.reset		= imx8ulp_reset,
> -
> -	/* Block IO */
> -	.block_read	= sof_block_read,
> -	.block_write	= sof_block_write,
> -
> -	/* Module IO */
> -	.read64		= sof_io_read64,
> -
> -	/* Mailbox IO */
> -	.mailbox_read	= sof_mailbox_read,
> -	.mailbox_write	= sof_mailbox_write,
> -
> -	/* ipc */
> -	.send_msg	= imx8ulp_send_msg,
> -	.get_mailbox_offset	= imx8ulp_get_mailbox_offset,
> -	.get_window_offset	= imx8ulp_get_window_offset,
> -
> -	.ipc_msg_data	= sof_ipc_msg_data,
> -	.set_stream_data_offset = sof_set_stream_data_offset,
> -
> -	/* stream callbacks */
> -	.pcm_open	= sof_stream_pcm_open,
> -	.pcm_close	= sof_stream_pcm_close,
> -
> -	/* module loading */
> -	.get_bar_index	= imx8ulp_get_bar_index,
> -	/* firmware loading */
> -	.load_firmware	= snd_sof_load_firmware_memcpy,
> -
> -	/* Debug information */
> -	.dbg_dump	= imx8_dump,
> -
> -	/* Firmware ops */
> -	.dsp_arch_ops	= &sof_xtensa_arch_ops,
> -
> -	/* DAI drivers */
> -	.drv		= imx8ulp_dai,
> -	.num_drv	= ARRAY_SIZE(imx8ulp_dai),
> -
> -	/* ALSA HW info flags */
> -	.hw_info	= SNDRV_PCM_INFO_MMAP |
> -			SNDRV_PCM_INFO_MMAP_VALID |
> -			SNDRV_PCM_INFO_INTERLEAVED |
> -			SNDRV_PCM_INFO_PAUSE |
> -			SNDRV_PCM_INFO_BATCH |
> -			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
> -
> -	/* PM */
> -	.runtime_suspend	= imx8ulp_dsp_runtime_suspend,
> -	.runtime_resume		= imx8ulp_dsp_runtime_resume,
> -
> -	.suspend	= imx8ulp_dsp_suspend,
> -	.resume		= imx8ulp_dsp_resume,
> -
> -	.set_power_state	= imx8ulp_dsp_set_power_state,
> -};
> -
> -static struct snd_sof_of_mach sof_imx8ulp_machs[] = {
> -	{
> -		.compatible = "fsl,imx8ulp-evk",
> -		.sof_tplg_filename = "sof-imx8ulp-btsco.tplg",
> -		.drv_name = "asoc-audio-graph-card2",
> -	},
> -	{}
> -};
> -
> -static struct sof_dev_desc sof_of_imx8ulp_desc = {
> -	.of_machines = sof_imx8ulp_machs,
> -	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_3),
> -	.ipc_default            = SOF_IPC_TYPE_3,
> -	.default_fw_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof",
> -	},
> -	.default_tplg_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
> -	},
> -	.default_fw_filename = {
> -		[SOF_IPC_TYPE_3] = "sof-imx8ulp.ri",
> -	},
> -	.nocodec_tplg_filename = "sof-imx8ulp-nocodec.tplg",
> -	.ops = &sof_imx8ulp_ops,
> -};
> -
> -static const struct of_device_id sof_of_imx8ulp_ids[] = {
> -	{ .compatible = "fsl,imx8ulp-dsp", .data = &sof_of_imx8ulp_desc},
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, sof_of_imx8ulp_ids);
> -
> -/* DT driver definition */
> -static struct platform_driver snd_sof_of_imx8ulp_driver = {
> -	.probe = sof_of_probe,
> -	.remove = sof_of_remove,
> -	.driver = {
> -		.name = "sof-audio-of-imx8ulp",
> -		.pm = &sof_of_pm,
> -		.of_match_table = sof_of_imx8ulp_ids,
> -	},
> -};
> -module_platform_driver(snd_sof_of_imx8ulp_driver);
> -
> -MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_DESCRIPTION("SOF support for IMX8ULP platforms");
> -MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
> --
> 2.34.1
>
