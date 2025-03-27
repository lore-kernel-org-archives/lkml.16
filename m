Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013035.outbound.protection.outlook.com [40.107.162.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48081474B8;
	Thu, 27 Mar 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087642; cv=fail; b=docR6LBke6ppiRYu2xdzeVOzY/kPVFLHaMiFFiJlxnBcun9t5dSeroGeuG48OoNqn5fzKETl5ESrzHPX7o8zM5ArbQbWqNJCm0Z7fYH3irmTRbIu2hHyoyLvjTRNhFkIzu61yLhYi7Pye8qWv+PKFMUBLS+1zzURreAJyjBSsgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087642; c=relaxed/simple;
	bh=XYz0Ds9PoFyOIteMMBvTsiP0Umf12EPIOJxmVGvEzM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o8HFe4QcV5Jp4TNvCoBqt2Srcq6MMmuaWTwwNrs3zruAia5Zpz4W0oRy9TRhowz29rBXNH+zHldAPTIM94RTlyWpj9Bbs5Ri5tV/W8eitZYd1qp+H5/mZPZv37i1Ru6sJNiyxMYwfbjuejgu6kULO4oGoAb+TS/gR+DX8v/ISjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Quz10HZl; arc=fail smtp.client-ip=40.107.162.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Quz10HZl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHxFwlmgI0q+ZqJPZcpAka504l79GIIIro5wpf5IHwOXVcWr2H/TmCfO844SpqRSDZVBYD0MhrNw2AkiSKXDUcqpNaXGqxn1xt+YxsJsfZVN1qsidIqtCAS4pSs2uMncqtadav34+EDFgEsFe8T+D857GlqzYYWwbaru3x8HjaO1YIpNXEthlyz1RDOtFNCEsKkussyi0L3xO6hPnpVNKz4eU0qdkTLrV/9yohtw76wx1sdqQwFH3rRHmdVaZIy5+NrMtbX2y9Ne6I+QaLaFnp55B3S43MeJXkU2XSuyrjkmIRIStEPK65qq30PQECgaj5oqaZffQ8w6xphW/rDyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPlaU0xvOz4xCzHkutLKEhCbijrSG0uM5lUNKrQRydk=;
 b=WXNmPU4Yj5dv6Wk/DJg6rfhNEMpeFJePqJ6p4Sk7iykGI8fDhjzooBGwoiLDUoY36yxWF4OGwyhDYzyRtc5wwmm3enYWAfaPCVhhgYRKFmezCZrzuwff2tdvZs++Z5V1QW0hvtfcPpyfMGNssUMgesfuRt8PjsQf6WwsF9e4riv1AJGRmA+BpqFrE3lle5IzbANzuujxGy7/bQELvaB64ofcS3puZ5qsardU8fDxrAL0gVXTiNURQ8K4vedEsd3l4XJiMx/8G07eITVOsXf+b7/GK+FXdot7IitdXt+Ri9Hol6+Wc0HjOKlgejlPVORURz4iJeaWhT7FpY4LSCocOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPlaU0xvOz4xCzHkutLKEhCbijrSG0uM5lUNKrQRydk=;
 b=Quz10HZlmTdPtAPnyUp2wmRtfSbvrv99ycQWTsSXiM61EguEJ6WWYBWGZHBet3z2fo3PhS1g+4Ez8ZYKAn6rSNLEn8JkyORXxLNSo5V42rCr0ZVV5tMiJe85kNcw9Gw+7P0ymWD3XE2E501fhDvT1H56lDQH5F3+JH+nnTcBUt5WUBq36A+zBpwiGMYeJhsTWhk3gG0Dae0ueInh+gmDMafEi70l4pxfYCEht+UOW6zqbPPz2+daO4P9b4kLUhGuOTlxDhoMzoeyMVz6CBeKFJXyfuOUIL0ASNvYCGI77kRIeqIje1Bg5PWLpIwfXpRVn+Dw1qsw7GyqHnUmr1qDRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:00:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 15:00:38 +0000
Date: Thu, 27 Mar 2025 11:00:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for
 Tianma TM070JVGH33
Message-ID: <Z+VoEI9Ep3izRKBJ@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-5-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH7PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:510:23d::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8fd437-4079-468e-af3d-08dd6d402275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?az1OsSqjqjL1dS8SvX3+fLvRjmzQ06b4YJmmEs8Uk4IJ5PKJLxcf7GFtuxie?=
 =?us-ascii?Q?X3HCAGdbgIOEu3QYEgnjQyNqzanEzTJmyA32aAiHSDdbjyJspuhriPIFdJgr?=
 =?us-ascii?Q?5ycMgoQKDZpS0T+XXybStFFPIoJD9Y5H2zR5MwV4cT5Z0Uw6jpDnwB2jgKzf?=
 =?us-ascii?Q?50x3K9o7nmzHKY1qXIaeotxR2WvM8nSgIDdpHRoXzxsE3w84M2YeX+mkhhEK?=
 =?us-ascii?Q?9gYyW6OMp+MRkSmfeCqeCveBhVjOWABhVvNLZvPY/yFxcbPin9VE4ebds5z1?=
 =?us-ascii?Q?6GkjR9el1Poa+glUv8qybVn03uOFA2HALPsZ8LjH2SsiIzIYMHo4XQlI7Tc4?=
 =?us-ascii?Q?WBhjieQ116ZYtK4Gep7JPHkv/WCc1M2Tr/Lra87VsT1Q2lxCQLGKepJTmwFX?=
 =?us-ascii?Q?ZhI14M9S5NVlvvB0HJJItcOiiFMJ4WS/LFYJg6dZh/eD2y0VOii3aYoWyGqR?=
 =?us-ascii?Q?FQG9t+fjAz94namWaPRgSGX2+7Aeuqf5HIfzNMOZAmRuwmedpYv73Oysgxol?=
 =?us-ascii?Q?bg/AB3FEIPbZTvjEhyfEstZKzqlNEU2Hzx/DUPkeiiPotw8s1mw5DKcaMR0Y?=
 =?us-ascii?Q?a4Ad3J8FhonlIKS6PADdQvSPQAhE63QTO5fpABPOBmSk9nc2JOMfB7HRB/rP?=
 =?us-ascii?Q?RglL+OYMgJlK8TMurH39663c/Ydb9i0HesM+IiJf1fPVj3VzwTwLL8dHD6/r?=
 =?us-ascii?Q?5fK1J2WTpVYogf/ZwC6C5rTWXSs1InAEjcu9ZyiYmsiQLColntwXmXL3OCd6?=
 =?us-ascii?Q?NqufD4qjS92dRlFPgt/MEe3pGxZa24CKV/3lgnVwwGS9EgHmCZAhdrLVs7tA?=
 =?us-ascii?Q?Ir+7lfYVXGDOctP0bs8LP78smpcuRLdPqDpcYcB2PqzuL12zJm6t268rlOyY?=
 =?us-ascii?Q?gUzEnZ8IzRTmQuPBNv/m/l2ws56PUr1Mn6utmx2m0JkVBbO42nINd5OozS6P?=
 =?us-ascii?Q?Y0ESPFtIRA7huHQEbnejgtMe5/kUpcQh30uc4z9hMcr+g/dK3bj6pwFBMPWe?=
 =?us-ascii?Q?Px/bSJ0+WphVsQXNHa8YtaqogVmYQ9SJQzJIsHhc7NcKwJhpJ5MvJA430JLo?=
 =?us-ascii?Q?g9vb0DhWNl8NNf/we0JlTrVb7X57hFOJV7YbGk0rQ37hjrbcM+2OUJSByzWF?=
 =?us-ascii?Q?jcWKPF0kfiq5ekp7PhpoH0QZBNZawbUSxo+kct3XFItpMJd2//UAhbeRdoVs?=
 =?us-ascii?Q?XYcd5uxKMslnst5Z7pz6/eWKzCMebYaJwZSnsltbfL+9E2TrzNXjrrWdT4YS?=
 =?us-ascii?Q?qUuphp6rVMjbl1apxZGo+MmBK9aKtLLT4uJ/7xvK1lVTtsvi9elKDyuSJQVu?=
 =?us-ascii?Q?WQKwxW/1+QdGst3gu5VlUCJqG2R9nG+5Gmue39M1gvp/qd9fvhhKe4xsMSrC?=
 =?us-ascii?Q?4vQhRjyzAPpsRF0D4Hrg/zIy4fWbHddY3oCfJO2ZWsLr5YRDonp5npTCZdqD?=
 =?us-ascii?Q?zRW3RpNT3HBarH5Tblsb/DtfVp24A6UpbdgxXcH0qmS3ktBGQVO8ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pz2kE6T551lJL413tu3tVcoYL3W/+66LfogSZjPtJlLOcQFp40dd5JjmbDLi?=
 =?us-ascii?Q?K0TW6fAvajNQclEoTqq7yA2aHD3D1X4WeqZsxNvaQh6oyFagPhJK96PK4VV9?=
 =?us-ascii?Q?pVJ0OYiTGnp74QWgJDxcA8qXI4J6J+OQJ6J+6hR3Pj7wrRYWS1bBSZxUuamn?=
 =?us-ascii?Q?SQWBL8TBUD0SSI+FWTz4BSa78l7TtMdg6a55azt3zqsk/fdbmEtIZiyH5MkP?=
 =?us-ascii?Q?k9FBxzyqTHVKt2XtRgYvCYMAtil7R/0qzpkwDymATIlbgoewAMqcMBjuLVKn?=
 =?us-ascii?Q?bSeOhoiziPX9zWWC7VBGyGGuEK63kvOWQxe7qmNQy9PsaFsYLxCCO6WsS6FW?=
 =?us-ascii?Q?Hf9oAGmuC0c3K3sNAvStDBsqT3A6EZeHwi3vj5086BbmkqbD3xCStYtxzX20?=
 =?us-ascii?Q?4gwchoS2jEgpLLMOrmOqd3xWJTrQko5wOn0XS4uokqQbxWfXJLazZTuqDgfI?=
 =?us-ascii?Q?Am4ROs9LffqypX0CTZJS//5BhgWjWthGLIniinnhzajx51y0u98WPglcgsrw?=
 =?us-ascii?Q?zU7dY4D5CBrL09iMfnVq06MtjtVdrpM6gERsiy0sIKcaOPt5eo7t3MGLqwrX?=
 =?us-ascii?Q?m56wpy+Qgsx12ynWxKN1ZuTYhNM3PsAItijFKWAFbdT/vMxoWtoQ6LhZF2a2?=
 =?us-ascii?Q?PTAekxN22cddRxjfuSlGxG6beHjdxGqxDeWC2y0TbH6IZxgaIwF/7atqnas8?=
 =?us-ascii?Q?SN5YwyQH6rQH//RyWp60CFU5qbU6kpVgd3VQn42moYagldoqbxceY9YtI8cO?=
 =?us-ascii?Q?IUb9OsGu1ZP60FksYTcgC5hdlSbaV87WpHA4mVIwuIwIg+Geu51kGntCydNo?=
 =?us-ascii?Q?Hz7qtkg4mdAZcy2jG4kKDEnIXQ9eBFfso1wzYHYm7hSLHgzsFTQbFOEPBYbQ?=
 =?us-ascii?Q?1H9Ow461MunpBI78CqYGSpVB5zFPjvCKBfTwlvvFpgVXRTUpTpQzp2Kj6/tl?=
 =?us-ascii?Q?BxOT35blnGBeZybG6s7VGUx4MX50zTLMpJUGOtkP3hHCYQ+uMS0YyRaZF+Fk?=
 =?us-ascii?Q?kGncJ7/cH10YRzYThbKPVoGeA8OiLI95RtLbcg5ENLgFI7pRysZbHSeChmiR?=
 =?us-ascii?Q?0W91Qb9hBlkKIHXZHK6OjbClF+TaN9qq149Bg/ItN1pC2bERv3kt2Mc36Rz0?=
 =?us-ascii?Q?iXakDsvhcZtOhb033V1qSJA1oG8HOPTLOugp8zvR3IaLXQzsjWR1B8Z1bzB1?=
 =?us-ascii?Q?WJIZxCDw50KdbeqoDgXe5nXGNWkGqSX5GBJ9TZtBH1mE1yyJGpF2L9MPYmqQ?=
 =?us-ascii?Q?uqGsj18Irbi8eCWruujLwWnqHRaA4el2sbogggZkQ/c5arF+NvlInfBKzlcF?=
 =?us-ascii?Q?gyQ9duGBtybvsCMldtWwvqeC/Vjvv798+X2ThGyffdE46O3t6NRVUzQ5O+lz?=
 =?us-ascii?Q?I/EWcU8/YN3TQQLW39HvGR+B2mXvHGWO9+S7qwVrfYF5qCnflF10kN/4rfDL?=
 =?us-ascii?Q?JGIig90JShFTIvglOHnTULk5yBbNimo2ib7/sLpeDDffHQnzdiK1AsvBgp5n?=
 =?us-ascii?Q?QHU4jS01SGaMEub59pqYUo5EYPS1Jpn8IiPV4DI72oU+ck7CvsxK9T+Qyd9P?=
 =?us-ascii?Q?zTYKUy0L+U1bYwfby3XWnw+dCfDBVFikzXBGGxtt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8fd437-4079-468e-af3d-08dd6d402275
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:00:38.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QM8FfDgncNvqkntv0atW+16WdJ5n7xO2Lte/yaZVjgMEvitPbCSKeCQEyQfMoDsokaIGLVMp5F3LQPvJK0ReqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088

On Thu, Mar 27, 2025 at 03:41:10PM +0100, Alexander Stein wrote:
> This adds an overlay for the supported LVDS display tianma tm070jvhg33.
> The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
> accordingly. Add the missing power supply as well.

		      ^^^ missed?

>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
>  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
>  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
>  3 files changed, 50 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
> index 225a7665b8ad1..7f96de6f80224 100644
> --- a/arch/arm/boot/dts/nxp/ls/Makefile
> +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> @@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>  	ls1021a-twr.dtb
>
>  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
> +ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
> +dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> new file mode 100644
> index 0000000000000..e9708f3c67403
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&backlight_dcu {
> +	status = "okay";
> +};
> +
> +&dcu {
> +	status = "okay";
> +
> +	port {
> +		dcu_out: endpoint {
> +			remote-endpoint = <&lvds_encoder_in>;
> +		};
> +	};
> +};
> +
> +&display {
> +	compatible = "tianma,tm070jvhg33";
> +	status = "okay";
> +};
> +
> +&lvds_encoder {
> +	status = "okay";
> +};
> +
> +&lvds_encoder_in {
> +	remote-endpoint = <&dcu_out>;
> +};
> +
> +&lvds_encoder_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&panel_in {
> +	remote-endpoint = <&lvds_encoder_out>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> index 27a55fa638128..80dae0c09542d 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> @@ -147,6 +147,7 @@ hdmi_in: endpoint {
>  	display: panel {
>  		backlight = <&backlight_dcu>;
>  		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_3p3v>;
>  		status = "disabled";
>
>  		port {
> --
> 2.43.0
>
