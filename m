Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012016.outbound.protection.outlook.com [52.101.71.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51432AF19;
	Wed,  2 Apr 2025 19:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622630; cv=fail; b=WX9ONL10KjcUYrtrpbFdnzLeOFOmKYXsS8YY+KtQ6I1fMbc3riBozdEEQnd0ALSfoZGiU9EqDxI7vIWjEiBql6fnGhBu1CFblxMpgvdjJRuPTN8FNyJlWY5hgtLxFxzhIn9P/jibMADKJ26QAGSSqzmkLdysHNrkSD/t4Kc6nwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622630; c=relaxed/simple;
	bh=fHFAf0uaPSE4D9efI+SHKL6cYpyoamSoh0N9+Qa8aAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NKHXURRMfOsiXnq+smfoBpf2w8Dbr9a2hZGtcK2k26VSe0u1I6BpB6IQgGeu0n5El9MsBbThdIYRdyX53Sq4SLm653Lwi/TfObbKIfhMXXbK0UrLWzkIVWhEPp9KW3VLcHJnP8WBC6BQJpbaW+4/e1MGI7wK0wnDdzGvBtgcjg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q3Hwoeur; arc=fail smtp.client-ip=52.101.71.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q3Hwoeur"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AckvAD6D1j9QrAgLbjZKy8cmnpAkRS0lKS8u3CQjf09Fh2ajACpZErcPbD5MdU5ZmgW19DIQHdYEqNXD/MzQbhLYMDVRRN+ze4CZWSuSwgtlWCnW3MJ5gox5WZQRPpotkwYNk+PI56liKxQTbLMe7jGwrlPckZOsHrRBTdXfxs297vAe5Dtrhd1akpz4995IH4y/L/Lz7pv7jjayJKLmpQOvRSmMT92R/eKXN3RgPZiY45H35hcLicXfEyFLttt1rcW4wYM2ZVR1u8kwnmZYehY1vcoj59W+9Pn7EapV1OZcieFkXpUcn/txU1vsBfWfmY3lm8MRbkeUjhrYJMj2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJlp7posSUYF7j6WeFc/4IKsPFVsnhF89IHKe65USk0=;
 b=PKOCAhXX9EKfRGiID2sgGVoSuvxdoqnS7X5YOHUiTyvz7hdtiUMZzJqrBTqo+w+Q03w/lQRmrvUn9y0D4tuRGPDF2zj+Dh9SGWc9Y8hqX6z5CqH7Vf9O9DsrlJ/fzq/axO0794uY5e32Sy/ab3vwMni4PaIR98cfkfm1bDhlpoSdIdYQN6e5Tw5ap3b6SR8OHbyVG8YMI2EAVcGyYkbmP4gCh9o1gAHyJI2jrkRRUHp5uUFC4FX2vgnKBMPOoqvBJ6ntEyvcCRVjYZYr4QpO2VJFFTYK+fDunifVSWANDzMbbRRrgOq1yGs7rKTN1hrUtbI3H9vISRWCDsWt7uBGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJlp7posSUYF7j6WeFc/4IKsPFVsnhF89IHKe65USk0=;
 b=Q3Hwoeur3YHaWhS+JIuC4NaETlagXaE6ea1xF6Dw2/cSriNWnMTMQTD238wbARsE95Eo/xtNCMSoXVGXJm20RVVmrzGgxMmlQcJJvOtLwjM2lzwty1zUQyMBs740rkogxwCITqJfd0qJ+wdUOo7zKzPL8nI4iHZPPn/momOKGNFMqm8jSNn1S1O/7e8P+qHSFYXZ5vzvTkq4so6H76pLa/Hb+RrhVTZa4NgbKwPLnpMJKo9Ky5An2hBs/Ot+Wvl6SoIicmj0B9fZXx6LCww0vTNzkmuQQdsOmbw+lHVtIdc4rC8KfQA72HwEJZtxxS4z41I0MkG/6Lum43AU7z076Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11223.eurprd04.prod.outlook.com (2603:10a6:d10:170::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 19:37:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 19:37:05 +0000
Date: Wed, 2 Apr 2025 15:36:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 8/9] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Displayy
Message-ID: <Z+2R2r5ba6f5pLfn@lizhi-Precision-Tower-5810>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-8-9f898838a864@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-initial_display-v4-8-9f898838a864@gocontroll.com>
X-ClientProxiedBy: PH2PEPF0000385E.namprd17.prod.outlook.com
 (2603:10b6:518:1::6c) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11223:EE_
X-MS-Office365-Filtering-Correlation-Id: 606f0023-6f34-4215-5370-08dd721dbfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6cPiD2urzov3ZKkRkLgPQy/jD0rsC+iyrIu6Ru7sq42CmTn5a9HqUL/KWLy5?=
 =?us-ascii?Q?vIkUfrdPChx6bA7Dz89bou950gTZwPvxsRTjZxFn9vepcujnACBPQE0Yup5z?=
 =?us-ascii?Q?NpvRjygmxu/Fl+2OvOfT6UgWA9AA6nhfGJ2nxkbysWfkldaL3Jze8Jpvi4tj?=
 =?us-ascii?Q?VyC9Mh/Ucj1vmYm7QlgMhuGq4XoPr97yIybCuZYk4qUqItcYhruCTwSS57xf?=
 =?us-ascii?Q?+2onTa7nNxrUo093UEtBKaky+shAEEhxE5yuDCWNOS2ysAyq788TPH6Ji6cC?=
 =?us-ascii?Q?GHv/H5Zxvg8SM/rhlahcAYwUuO6T6WTBEwyaCZxTFq7ttaa3hnUt4a4H5S5m?=
 =?us-ascii?Q?ZymdkxXJeQUMJ8QhMDOE+/LCRDVaysq1/Ij+eKgZjaO+m42e3ZU5CiZWEtEz?=
 =?us-ascii?Q?k+c253XiY6469chmfhW/6vNCxCJm9e2AwGYyfeJNdhwTim6KiXUXBhVVOwik?=
 =?us-ascii?Q?2xR+oSoDD8Nzym+R0ztuO5mi2Jo+VojNG/wHOqpepfJ67XY6VV6hBDfcaHrG?=
 =?us-ascii?Q?eQurxTduU4UGG/abtNy7f+zyZrEOMOfSDnjQ/hiTfgXwtsZ6EIqcs/fGLKpF?=
 =?us-ascii?Q?y6yKC9MYyoV95b7HG1cNV848G40tUZgERxeVRJqtDDok4d31XaGKXNbs8IRI?=
 =?us-ascii?Q?tKCRJdLUAL4EVEIXLEX0PmcF3C+5iY6ZbOaA4DjEJaO3Uuij3j46RMb9Qv89?=
 =?us-ascii?Q?A9JbFAL0DMGnhzd2B3HBx4oj74FzbTtk1UWHdt6PneYpb/oHiaXBjZcVbrcR?=
 =?us-ascii?Q?zzbZCLhlZhf89VCaRV7xl1F+oF8BnTS0Mz+In/CMGcRAklD0Hp59S2aTnW21?=
 =?us-ascii?Q?4TVYtOTVwOhF/Rg0mPHHUwOFDFxipsVFfIJRpIfkZBv9f2603uPPTnAiO2GT?=
 =?us-ascii?Q?s+1AKUeAAam30xtHEXkGcrt5u+Gp/cQDCBL4waz5Mlwyc4bZ7IYUHQOXOQLn?=
 =?us-ascii?Q?UK0xMA5QOXxs72XWABZKfcHo5BI3Jll9kRLl3xeJcn7DLXph8V9FtKUqLjGz?=
 =?us-ascii?Q?+GCvnKTZI7w4JxFwS8ZhJBw6s9/c5r+kTqd7kNptjdFyKZrwdn1gvk9t//j0?=
 =?us-ascii?Q?ErW4K4UHO7kgxzh/AUJIdkQkwqwT9X3RNW/k5S8SZmo4XjQJW0oY9/1js5Xa?=
 =?us-ascii?Q?0J5na8fq27/+Ho3DR2Ixvj+csYrz7jR5wY7kM5XqwZQ5GgSwriMHUVJwbVxr?=
 =?us-ascii?Q?X4VeFbQsvZqUn2oPm3NjwSPAuaiR/XwyQ2rQVJtRDUq4uVeANRdYCCX647Pm?=
 =?us-ascii?Q?iL8YXy2wOmFsa/m/aPQlBo6Fb3qGHVJNU+7OqDbtxtR035Hk5jeRp4GXj09B?=
 =?us-ascii?Q?jiWYTgp6QMv9e0hp5Nm4dwvHOyztePVXJ4GrnwiSousaFFcdtx2HMZAySjrK?=
 =?us-ascii?Q?0IlxEO0R2cbwvEufPv5kiT89JAGvCXZ+F130pCjE+Cky4wYWkLy+bi8lfRV9?=
 =?us-ascii?Q?9SXS6/K2JusiDvkjzeQJnQAE70HOz35j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4bowrfhrnmAJKG2QlxI43nwsxqkRP4Uv92M+iNiomNbBMVTWHcjfjEcKuxfL?=
 =?us-ascii?Q?fiY16eVtC3FySVY4nJ4r3krohIiVeC816Ok+yHV5ODbLBFBerOWZcIlK5Abz?=
 =?us-ascii?Q?Ai0+JcNmWiaHP0YFkQt2z5ueaLMmEPYuo7Y8hDKQtPaDbP+nwoOkb8+ve4Jq?=
 =?us-ascii?Q?VFUdL24vD4SKdpohO0KjunwUL9cU8G/OFfAubH5KaXX7ebXp4kYm6GdybC0/?=
 =?us-ascii?Q?CjoqjRds1ZEfracsISYiMmRuygF+AX+bkK1D7hmPPgT6k0mqlcTvh85ZtQ+S?=
 =?us-ascii?Q?PFkbV4f5i/847rZ13M1qlhYZOUHWtnV2ar9xj/BwHxUU211z2iRQUhKEdJSI?=
 =?us-ascii?Q?B1H2qVGXUL9n5+rFlcpVBdmAB1EKnElgRpvt5Vkkfm9HnozksS5YS9ksHpR1?=
 =?us-ascii?Q?AWwPoAwkWfmgZetaGTRKfiwxn6mCl51ZpYwwV6nhJX2AzZbBsENPO5ew0Aoi?=
 =?us-ascii?Q?QV3K8zF0J8Safmrh2y4bipBYRg8BovbOxKzkXiDL3AGBqgpEnkkLcbvDQqic?=
 =?us-ascii?Q?ZdSbA/tNSZ7hjKUoTaCGSHg5w7kGGLaadmVizU/LIkukADss0POpxQijbPT7?=
 =?us-ascii?Q?KUzYCJT02vsehwROpdTV88ODYjT4dEjWWLI9ny/d2Yv8VsNlpCfcP0IJn7/d?=
 =?us-ascii?Q?wPjQTl88Iy/geLoFxRQ3UcHEVC1w+95qZMuE1yylFJvOUyGQuOtCq+qq6Lec?=
 =?us-ascii?Q?Q0a03SlPEu7mbE+qbJtbbcDQUUJmKhcN84tI7tc5A6jmMYxGZf8Dkc3ype17?=
 =?us-ascii?Q?TdcmfqOA9/s3FLEfbyfFgdmgkJFV7YTs7k+g4E2HF86kVDrNKqUmbCDhOEHs?=
 =?us-ascii?Q?w3aZbPwDKR0xBGN+E6CzFYiEjvB5Y3ontBH9jasqzaJg37/67U8inrmoR0gW?=
 =?us-ascii?Q?rNKOi3OHDNXBq2PDIWxX1lI1Nt3YmfUCUkLDc8B1x93fu3zdgiEg8RV9xq/v?=
 =?us-ascii?Q?30pnuP8bbZSu1UtI/ujpKUB73NfkJQMoQdxEzU/6k8GR8PKv18nO7SQ6jnh2?=
 =?us-ascii?Q?tcllDSQ7tWyNmr4Oqs9mtc6yo80LykhTw+DID35ACJnUfK6RxXbY7UxozEGJ?=
 =?us-ascii?Q?rvAgyUu00ZANhRmAZrdPRuiItBqyrLSLMg0xXAUjDMaMxoxFUCdByKyelrgg?=
 =?us-ascii?Q?bKNnpjSgb7mWzLBhNjMbDEyuujydBIKGkbEt+M6iUHAFrqkCFk6iJBZ0otYZ?=
 =?us-ascii?Q?GVHl5jCLNvLK1UuZMpY9TEUQnml8q7dno/XM0UQsAXFyVat3ApGGV8RcRjvY?=
 =?us-ascii?Q?J8T2gGtaHsdlfGxUZGGWzgAmmu8enDJk9wQqir7QBjdaDeEEaps3U7Jwekif?=
 =?us-ascii?Q?tHYjCx5h63snhZ1umJdjO2wUd46ZREVvT7CeGd9rK0wYMmppDVCO5IhIb3KK?=
 =?us-ascii?Q?z8bygrNiOiA0QIHTTLPWpYof93fVliSND72QPeHgCOfmU4vh5Q9Fzi550sHt?=
 =?us-ascii?Q?LqZbvG2+rn74SCk0r4fKHD6/Cg03BWZ4JcA8pA84HTtL9ThPDBuWwhw/Xw0V?=
 =?us-ascii?Q?W+sjgtA3H/Pxfl/kDBj5g0SiS3CUBjNKRHUZSBvq1nNISfHW69ORlxiJW7Gh?=
 =?us-ascii?Q?Y5sJEDfv8avZyY0+OLe0pWcltSo7dEwUCWOwykz+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606f0023-6f34-4215-5370-08dd721dbfac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:37:05.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/aM4qPvz5nTyKnLdgyyfDkPWAVDEz9Z7wsyecNt4f+BqNFSBXrtp7vxTEUXSs9l3zgrz9Bw3xakCKamGGFySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11223

On Wed, Apr 02, 2025 at 09:07:11AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
> comes with a 12.3" 1920x720 display.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> ---
> Currently the backlight driver is not available, this will be upstreamed
> in a future patch series. It is a Maxim max25014atg.
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 +++++++++++++++++++++
>  1 file changed, 139 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc0f86ca55fb6c21f10fbd333374a89002bb71c0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "imx8mp-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	model = "GOcontroll Moduline Display with BOE av123z7m-n17 display";
> +
> +	panel {
> +		compatible = "boe,av123z7m-n17";
> +		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_panel>;
> +		pinctrl-names = "default";
> +		power-supply = <&reg_3v3_per>;
> +		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +
> +				panel_in0: endpoint {
> +					remote-endpoint = <&lvds1_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				dual-lvds-even-pixels;
> +
> +				panel_in1: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* sn65dsi85 */
> +	bridge@2d {
> +		compatible = "ti,sn65dsi84";
> +		reg = <0x2d>;
> +		enable-gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_lvds_bridge>;
> +		pinctrl-names = "default";
> +		vcc-supply = <&reg_1v8_per>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				dsi_lvds_bridge_in: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&mipi_dsi_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lvds0_out: endpoint {
> +					remote-endpoint = <&panel_in1>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				lvds1_out: endpoint {
> +					remote-endpoint = <&panel_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	/* max25014 @ 0x6f */
> +};
> +
> +&iomuxc {
> +	pinctrl_lvds_bridge: lvdsbridgegrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
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
> +&lcdif1 {
> +	status = "okay";
> +};
> +
> +&mipi_dsi {
> +	/*
> +	 * burst has to be at least 2x dsi clock that the sn65dsi85 expects
> +	 * display pixelclock * bpp / lanes / 2 = dsi clock
> +	 * 88.000.000 * 24 / 4 / 2 = 264.000.000
> +	 * range gets rounded up to 265.000.000 - 270.000.000
> +	 * 267.500.000 * 2 = 535.000.000
> +	 */
> +	samsung,burst-clock-frequency = <535000000>;
> +	samsung,esc-clock-frequency = <12000000>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			mipi_dsi_out: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = < &dsi_lvds_bridge_in>;
> +			};
> +		};
> +	};
> +};
>
> --
> 2.49.0
>
>
