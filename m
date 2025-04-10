Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E41DF25C;
	Thu, 10 Apr 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297983; cv=fail; b=j36zUkMUcQQwcpyEnXHJhsm23tA2eAk23hYVPxfUHEDtWuenmT9YuSCqSib25ylYCIZ9meXNXNr9VrF9+tZSYf7L1iuxyABNy35c5DZsYJA5EIrP/YoR+D+yWBEnS2cb5KHHeSBsZmzKpKOQxXwINaZXl7eiriyWmZgQ7RGFykQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297983; c=relaxed/simple;
	bh=aA/U05xmdKmS8o2B+Hh58561x+Tn1y42vaSTZkzkw8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eiuAZ8YK8x3WITZzQSUsQ8jAC+szCj+WzpYdOxS/yKdM99dXwYE0HjjdguGi75DSfS1wSTdmxuH376NDperBjjJEOSMTCxWsIYKCb639CLcvaWvTUxLUs6U15BaYiMjervsxjE3yAV+CZ3gO3ak3SVoool6fba0xiSTJevjpkho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GZ4P3WAQ; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GZ4P3WAQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0bdmCccemjNSjYUSbvmIN7ekhhKVhP6rIFswCvyZCL0WGglJ4FFDHMV89FZP1/WzoOiyWb1KI1WDEaunMyGILrceFzsYhkc3R7ON+Kx1+AZ8iscBqImA5bFR9cmO9QYsmrEKBoLSHiIVIRGDTuBYKfpAH9OoD7PEz22/Ik4aMwQpY5Q/+LXyGwj1VkRyRzI7yrRvEpikNvO/Gl/2MWjfqs3+nxNTIeKMpqTnBKAqEd7H7etTATvonDIY+KwUph3pHm9frRXVfaCC/may6ceBFWdZMPQS9hC/tyVENUYM6i/aLRuK/vwYISpdpVB+L8rW0pddGcqkDziOekkemMJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MqkOou0zInXdnTEJExy+0wM9MKk68f1n8GL7twhX7k=;
 b=nDRJ0LghrZG6Hs7BEHgqZc///38gr7txedp3wI4wNqK685vQXsP3QYVwwAXz2GrOeCwslO9KjQZnVpBSlV0rZbZyEtgw0uYZZ1lg3U8tMS7u/OobE0yzG0syVtMl6UxN/dtcdcwerCLzEV+Dh25GCNemehQagHUImhd2Av9oZxM+6wPHp0Km3k5I3A6TApCRohH9x31LeuKGWiKOax/mkytlIhPLVhaOIA8hKhu+YGb7IMeB+i5ran+jl+jnYL6j9X5GtramCdpvmgNJQIMdlbuGr/rMW9haDiLjD6cvnOXMd3JeCUw7guA6SmXKC3+NRtC+H4u8JMbnxmMC/hV/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MqkOou0zInXdnTEJExy+0wM9MKk68f1n8GL7twhX7k=;
 b=GZ4P3WAQ/pdQGCP+Zh4NkTB7N/TPi+yv7Qw/Ggo5ymywXMe5Jutsl0wg87F8hyiC+FlB1jldQkl6OD3Bkx9ZKbz9YNkLhVjZ5mYv44GvgmtPWp14X/MKQqSJR4cO/pAsnh20sVnH5dTEi16IMH8bpucS77O6otRf0UnwCgsF1lKz8tm1toHm9j7iJcSBDAv/IdpPQsLo7byyO5oNCh7KUZVpRo7vEsXNrjbVyzkOHc9soDQmWOWgTAA4rTruhPeMnnmosGDWf4J/K4S78D1uVq7GXKzW4AhfMXic9tpT2BaFUh9NrVOFEnPmpWsBHAJYXNxLd08sjNlccZVYHArYXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 15:12:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:12:58 +0000
Date: Thu, 10 Apr 2025 11:12:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 09/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 RTC support
Message-ID: <Z/ff8rQ7wGzKiX+d@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-10-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-10-primoz.fiser@norik.com>
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: d8409a75-501d-462f-c107-08dd78422d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OcRT+LBgVKYpp8Jb6F6Cg9Jw7mOJmTmg9QwEDTRgQzVE1FUEs6LTnpOtg69t?=
 =?us-ascii?Q?iRIeNY5Njp7ltcd3CerQz2Me+bsja3ss1mfS7uojrWsjtr5rImgjyeuIzT18?=
 =?us-ascii?Q?vmwqsQykGXqjSMU5f4yabFNYr669x36qMtUX4wVCQ2PD4JWuaeadmnmHk0Pn?=
 =?us-ascii?Q?gUdURnK/g3T50rEBIo1/YVFQyR+AVaxQlmONsbHCOhYgSRw719EHPxX706qA?=
 =?us-ascii?Q?2weAHT5D3Kh3u+UNTJqmsAz66cWKuxkcTVyWtWL9WP3wgoOA4Rs8+RIt5/1p?=
 =?us-ascii?Q?1YwmVSZJuWZs6Q7PM6kXY5pWr3kncpd1ip1Vwy+1ZRjVUInZcCWYP6O/BOV3?=
 =?us-ascii?Q?Em5kcBJlatNuMWlDBlrySESETcC4DZo26YokbtPeXB063/2q71RTxBmWKJvu?=
 =?us-ascii?Q?04Mv5LGAeNhLLJOLuY3AaUTTr1HYZ5qvwfWZ5hqIey/C955hef6kQbav99hj?=
 =?us-ascii?Q?PP3z71lpqbGlWVOLkf44KwjXIOqeMiZySJvE4fpTSy8wcBUhQ4Q4V3Ykdhsl?=
 =?us-ascii?Q?Iosm7OTzXM4XxEayPSEVBv+9zPJOJws1GkF9iFUfKS47M0Ef3WqxvjCV6ROm?=
 =?us-ascii?Q?czKOnN5ZoN5PeLTJAmONWBVGR105QO5XNLJ5kWACh40pkml2imVhAXM1XdQe?=
 =?us-ascii?Q?LjKycM5UobuTb23i6bkEBlP8n93VSdS57xx6zGQY2wW2w3zE5YyZbMFx7fLr?=
 =?us-ascii?Q?2AZCUTa/YZNcgAWYfM++o9W430Brj8E1mu31Yscl1ooBKSep6RHkofeQzLhC?=
 =?us-ascii?Q?7upNizhZVOgiS3G0UJOSMOiMO9b1M+1KG2URgGrYn4zIk/3oerz3S7ekcIWO?=
 =?us-ascii?Q?TZMMgn3pl9UtVCW6fSDeV7sv2Gxz4kAfbeQbewwrfEcJz4P1AYh3abNneZlU?=
 =?us-ascii?Q?nbH/1dX8TTxBb8Di+UhK9eck0FQIiy0iB9aT2m+4K2x0p7NxGx54ZsBHySgx?=
 =?us-ascii?Q?RbCcoMs0HyUK6lb8fAclJ3EA+zGLt1LDIs7a7w7mLnVGs+4flQT9nWktDd/u?=
 =?us-ascii?Q?vxm7qgezKm0POSkBN84kFHrfnp2Fvga/NcEcijGdXWvWt+urA+pz9o2HipsN?=
 =?us-ascii?Q?2Nw8q7M/6SyJ/YCeFAX2udZgiGvqzlmSJwwGN+zz7Tg2DzPCTAa4vrpK1Hy9?=
 =?us-ascii?Q?SOGTH+AAimtGizkYhhHOfXAriROCeFqg5WMGZHWqjuM4Bg0uvw2m+Npzn7lA?=
 =?us-ascii?Q?zBAjbuY5MqmODZbD3Nl5cqgtuQnJP4x9g3gH0aH3ytigfLoPOIP47LXOo30g?=
 =?us-ascii?Q?qwjBz51QnCiM+B2xNlvdy/aJNBgpur3kjN+23jZwNtYNp7ggqdyJBMx9pGZ+?=
 =?us-ascii?Q?s6MPbmWBLwDBHgS01zm5MhQmCtaWvJ/6vSGnw0xtqeQqigh7dQYQFn2D/rfx?=
 =?us-ascii?Q?DZStlGcbk9m7TugpkG96v4jjEYHASTtrturlwwhItRguUs6ti4UTHSx45e9G?=
 =?us-ascii?Q?xauHy00IoiJDbi9B3ojSsD3uqUfxL2J+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2GqtlRSScsmKlyUS309ZlSpCnIRDfQ477s97WBALX3efgr+VoGRsIg7foUIT?=
 =?us-ascii?Q?pj5aRh39AER/E5iyKzjeGP/m2wfu7Q7gmk2Q2b98XkxyhUz8pYJHHuiXRLmn?=
 =?us-ascii?Q?mWhEi7NzoMGhBGrIIld+d2DKUXb9VnXYZhiZlWutMxzr0Prqk5g44PWbceoQ?=
 =?us-ascii?Q?AmEdXzSDefMnbw7pps6iTXaIi3oqV5uAlyatl3E7vDyGeyIKNb8tZGmEVD35?=
 =?us-ascii?Q?PDFpcQHD2rbeykCmEinv2dFoN4evyui7qhfk59bv7v2TexlqMXju9bWcI6cy?=
 =?us-ascii?Q?cPMujLFhVqzQQXHA69YkouwDL8yDxfCrILmT1gYrZVCiDi9vlPVva4QjlvYq?=
 =?us-ascii?Q?ggXdCC4USjSzZuOsEYgaMUHIzdDXJ6Hp9wEts/HesQkJ0rTPvVA8LvOk12aG?=
 =?us-ascii?Q?vTs+EFfFEHURH6g/1VNE6+Hp5bDRLxtqb18v8aXg7Xgixf5VetRRRghF2UR0?=
 =?us-ascii?Q?8nofiChjzPnZSKfluwB7rBsnkXPLsn5BgZMB/2miTS4lvIYzFvfABO5MnL/2?=
 =?us-ascii?Q?6jZbz68hMo06iInJ+PchrJ8H8+Zla6UW52khxdbAfOvYNMCO2Su4Pz5a2m+6?=
 =?us-ascii?Q?oouYfkRdj0bppUUuY2RKLNf+WCsZu5iTJMNCtUIY265C9E/nouwV3IQcX4IE?=
 =?us-ascii?Q?OdFo35YOtLlA+zQ+Xb9dTDnWPYBn5TAYOxv/ise0HbeksSh+ydt/jQx/CTkf?=
 =?us-ascii?Q?D5sr32X97ML6+NkNIczbCxoQynccEPad7AaFT7WlEFA3nWs2Fbjrr8cGxJ9G?=
 =?us-ascii?Q?GMQqRVaUnfyKvKJAxU054uXDbEVCmbakDHuQvTHe7Icl6AJxrynTE+oeHYVu?=
 =?us-ascii?Q?y6k0RQt3AjfIvG/Ko9Ake2uJeJ87JC3HjY3l/V4NEVNco1+oTwkTzBDg2UW6?=
 =?us-ascii?Q?NNiA59z5LtV3dTbe5ltaEoKUJ/ETRy7Z2xMQFhHdHG21mP2kqloi6jEosTFp?=
 =?us-ascii?Q?9wWkbNeDSPdBNzvQkCZVmQozqfgSFC3rNjC0+JHM+zVu/uGl2aKKLicPW1UX?=
 =?us-ascii?Q?RIEj9s/EPoAVi329spUpRc8bOcGU5pDxM1Kbs2YWC+N90S9J4/iw6hJ8gERw?=
 =?us-ascii?Q?dV2xOKLx1jYMucVqlxSNsGD0FDJW3kUxamXD53D8sBWaEL0P1gGxsz90zPYH?=
 =?us-ascii?Q?i+afHKcOF2VgQvnyQR1jx+DCeWPqIHbHG271QWkb9oiCv16Eo0Sn0GQ2u+e7?=
 =?us-ascii?Q?Cf5fhME34lVwozAuKT/DrYLWcIaCdeEHRkHs9Yag+uZuUAirQ+qw9LMwqPjG?=
 =?us-ascii?Q?2c7VH0AbGgLrfdRalELxl3ofF6zb4/6JEAoQPxGwjIfXIq5xJx5seT7rzqZN?=
 =?us-ascii?Q?O9CKYq3fN2yFisvmMTlK3oK6qZK4TjUCsteyoFaQ0+vKbpsjhxQkOyRHB3kX?=
 =?us-ascii?Q?3S8S1vhe/40+YjvTtZyJdKEUlDRuREa04Gr3Mv1L+EOizZQav1bY5UbAzaA6?=
 =?us-ascii?Q?AylMfy40fm+trEEF/8NzpKQaZ2s4Aoz9huAP8Y501+XcDpwkrMRgDSG+bdLf?=
 =?us-ascii?Q?LePkvKX7k8PoCruPmiUQBJsac6Mw9tlwIR5fxMXftGRCVo9mH5dJrdzNqg6E?=
 =?us-ascii?Q?oSZuOjvltSoaDpa4hQb6VvhVdbYZxcFEHh5y8vni?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8409a75-501d-462f-c107-08dd78422d6e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:12:58.5235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKlFLQJZ5ZmzEbKFCoMt1Kr7D+Q2vmF8hTtwdEUPkvkGG9BASdwBoK30rhgxKWaA12BKgRpH1XJr14vs2PRaBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858

On Thu, Apr 10, 2025 at 11:02:47AM +0200, Primoz Fiser wrote:
> Add support for RTC clock connected via I2C on phyBOARD-Segin-i.MX93.
> Make I2C RTC the default clock by configuring the aliases.

"Add support for RTC connected via I2C on phyBOARD-Segin-i.MX93. Set
default RTC by configuring the aliases."

Frank
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../dts/freescale/imx93-phyboard-segin.dts    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 525f52789f8b..38b89398e646 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -17,6 +17,11 @@ /{
>  	compatible = "phytec,imx93-phyboard-segin", "phytec,imx93-phycore-som",
>  		     "fsl,imx93";
>
> +	aliases {
> +		rtc0 = &i2c_rtc;
> +		rtc1 = &bbnsm_rtc;
> +	};
> +
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
> @@ -33,6 +38,24 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  	};
>  };
>
> +/* I2C2 */
> +&lpi2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	status = "okay";
> +
> +	/* RTC */
> +	i2c_rtc: rtc@68 {
> +		compatible = "microcrystal,rv4162";
> +		reg = <0x68>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
>  /* Console */
>  &lpuart1 {
>  	pinctrl-names = "default";
> @@ -56,6 +79,13 @@ &usdhc2 {
>  };
>
>  &iomuxc {
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
> +			MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
> @@ -69,6 +99,12 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
>  		>;
>  	};
>
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
> +		>;
> +	};
> +

keep order by node name.

Frank
>  	pinctrl_usdhc2_cd: usdhc2cdgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> --
> 2.34.1
>
