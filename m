Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CBD22D4FD;
	Thu, 29 May 2025 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534113; cv=fail; b=QC0DqedVReZXhhGyznOsa9rQmVhcaWiVZtnAB+6YUT7SFirs5SFcLu/V/5JPwl9SbogqBk8xhClJ+8N+g0QO2n9fMh89sFF9oyxClGNkG7lNnyj6wznYo+Dphzfm39YArqEGz8YmpaYcswE32CA8HQi9cl6+47BEU+TxPMBty/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534113; c=relaxed/simple;
	bh=ZtB+cDMkc7NXR5ruHLhJKdiP1mr5VJT8MhK32gO4Va0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fq36vUXr5tGfR4khrVU1NKi+rui3UPCg2NT2eJ3I9cyAoAAX0P8HFmX9Y0f0i/o24uUkfJVNrmlV3fzr3BnNvGmct4a4S56pRTUI+eRWu/0DDEinP2TDq2VakJh7N1aVIp6yYtZQrHddanB6nnLx8fAknkIgtG57myTt0zLFVk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EvBQf8ZX; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EvBQf8ZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLAiATnA8V5JChBqZcfgtGrWMSxAbQT31wuAXRYyYcGWX0kLY2LRR8+j7UfJOexpDZCGosbjrqQcdFyjEqIzrbNrb5ydmfwCC7i0EdVOeW3xM1BdO/VuUkVv5iKXYs9y4a8XhUA3AYL4IMlS9t64n+f5rbpRs+tNjojHBk29qlZBG8d/yM8rbpOG1ZDDpN1+CwB3fO6FFM1YXRrv3TWcGdMr03Uq9sVl15XDWIUPpESu8bM7ulBlDOFxe+0t+yNy6CzzxVWfVHDURdxDlecNe2dWaeorKR5L7SZl5A4swi2E/c2VFhNzOhZucjb9cnclzs9uef2PAAziXhQsrYm+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZkKYSKxHGsYajQLRT4XDK8Tj1aGCJ3s2OLEqWq5koQ=;
 b=xeEJ8P9V+dWvr/Wfhwe7xO4Dof4tDLg6uznoIKWIMHS6mbyOELQ0R9B9APdAKyfc+zTxo/foHYd+e3bP5cLGnoMHlZG+EBA7izi8UfUPUu5/f7lIn/2iKqID4W5Yq5GXbSlF+lpK9UkxhxOOlJxKuxc9q3gXI+eez3VY6Qs3JP+UaK0uixLpnszl2DoQNvMLaob9DCb6rRbxvRwHJSANVod4R6qQtnNzptgM7zS7xsJ6ycW71acBEH2HSo9tuO1hbDmVpDSb+3zjEXZxHKYLCed0aCagOdgAHZox7qhTckZSZRHFm88Cyb7ygmwgpuFQV0ObuCJSce2g1ClflcaG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZkKYSKxHGsYajQLRT4XDK8Tj1aGCJ3s2OLEqWq5koQ=;
 b=EvBQf8ZXjhH1FwwsHxb8l+aG2t1ZD5L41SUhb1I9+NFtGMxjU+frWyDbWPy7YHJY9j4l26L4dovks1qp3P1af3vxb7AWmF/g+91fatxPcZcNTLch1Xl5G8JQN0jQy+ya9guOnplMxvuBGIH4sLHS3MWh9RNjkoe9b0KzPUOmbyR8RgjquCBOUvcF24gxby9k8DHN1JvmHv4rB1m6Qm54yXfEfARIA4+kKte5jryUp8Y/S0MvcPeQzsU/i6hPzJChRrLviaE7sF1Y1mo9iOdJ2WoldLFOvdAESoKJM5KNglHAccW7bOwWow1HB0tGFngMTmMHbE+c1DEmRYSl0LnNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 15:55:07 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 15:55:07 +0000
Date: Thu, 29 May 2025 11:54:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/6] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <aDiDUm6cvrC2q/SP@lizhi-Precision-Tower-5810>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
 <20250529143544.2381031-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529143544.2381031-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb60c02-9041-4667-61e5-08dd9ec92f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NtyHO/eR7SVoPe1EwDtLutI86MUbt2zSZdxXpGzodIsBPyeWVkVZBt1LjShT?=
 =?us-ascii?Q?IYzhCcleufveA9uBRQrpDPbHindhdFDCivY0mADgLuteAxskDeqN3aZJa0AE?=
 =?us-ascii?Q?QBihCmhLRzs2pKapdoP/cmcIPiLFzoqnImDeahpvrnExeiOjKaifcCwLmHq3?=
 =?us-ascii?Q?z0/XfEm9Py1LpSTe6aRbieV6vIzw3EXTKf8NAMKm2ORmG8p9ojpLSekaRBdw?=
 =?us-ascii?Q?elt1X1OI+si0GCg3z26k3x9PIRCgNY9DtOyMfzVZ4l3mly9rzcS/kSClS5IO?=
 =?us-ascii?Q?xYreCIqtN1Sv+MlvEZn6S2SdPlOBYU5ceAluaUSyIC9Tzn7FVhSxOYao3b1W?=
 =?us-ascii?Q?ROkC9/KaC1GuqiMZnYyhR/ztVboZSk7nPuWiFH0KYIbC9Y8wWQw+1uiWlGHg?=
 =?us-ascii?Q?fA7ULMlbFZfYPnuRX4H8C8rL90pxOdHrBarj1PpxuwifhdLanYV6slAec6Hi?=
 =?us-ascii?Q?8Ax93iGLQyYfQKXtnYNIrgstuWO/T/1TU/lcL8f2MEGiVr0OKkTDqjbENhxB?=
 =?us-ascii?Q?5Zg086iNxk2QM1oGDzu7wjo8iNOeTtkY+eJEqWxUUmeCcu3UZ0S8fjknh5Bx?=
 =?us-ascii?Q?N2AC5MJU1PHjcFrpf7GFfmFF9wiQsYOg6ui4qACgdDlOdprpctdewz1iDqdk?=
 =?us-ascii?Q?2Nqq5DMSd8Ni5u5Tzqr2Fr03gxa/SxsFB7L+qe/C+pc01G+KAwYK5yuEWCfk?=
 =?us-ascii?Q?dltJbdCec9ETw0ldAJDiDKdQcmYgCZUs967INb1RMIYf74Fvd/Sa8lweEMZa?=
 =?us-ascii?Q?GcfM7B0fpQ6S4370gF9lPgmwXq4oHWc+nYi27ZzyqGkGvWHN2iSxVQ9Jiinm?=
 =?us-ascii?Q?x9V50FSCfWFqxKObPV7zD7iPsakESWLHhiz4Z+OZrzdhHo677rfEUxxTTqLu?=
 =?us-ascii?Q?qRyqCwdj2hFdLvAN8qZ8t4nATW3vZllb4++yhZPXhedpT5yKh1VLY2CLGAmw?=
 =?us-ascii?Q?sQj67Qx9bWc4+BCNTQAz/JuRCplHCzivjCigeeRDXXkChR7OvuVSpB+CwHIf?=
 =?us-ascii?Q?YYXhQqp3OrbSrE5qSC0vqCpv60CFNKFIohR9jj1OwD4nOT25OmnVFj2kbtxt?=
 =?us-ascii?Q?Igv3x/6MVkPvHVDClYbZitNP9aHWzl61DaV1LfC/t+CNlhLYImL5mroNjwAv?=
 =?us-ascii?Q?4RzCrQjnga4v7jRF1KvuafTVFh07F9VK5yYz8Now7qZNg886UvRD9zRSdFM8?=
 =?us-ascii?Q?3xWGdH3xkECBgiuGVApEa0U9lMUNyxz7BA6nvRi2j4d288fi4EWXpkDqKLi4?=
 =?us-ascii?Q?hIVkG/FcMeaaT9eHNFsFG0fUSXWMNRXAK54ldZe7WV3kKFjfqnr3+dZGjtLC?=
 =?us-ascii?Q?oaDSQmOYh/zCW+5EURIsT56Kdde4j3PWWirDG6IGKiSPFQeLHu74GFqrWk6M?=
 =?us-ascii?Q?poJOqmuN1fPEvOxgQQIbuQdqlVOT02RaORtPoK5Nj/TMUtL6MIHNYHI2Pbmx?=
 =?us-ascii?Q?acSSJAE1didQ7gLQEjihixWFhjl6qjQ8Q445KvG9TyupjP4bjKyF0Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p0hHvOPYTN9CH/z0sJUPlBJyO64nOg1i8tONQ4Tc1HhB023E/7zyRMI0Vg7A?=
 =?us-ascii?Q?3sh0XQC5t5/tvItHYR8TxTVrnGyIMAScplAzbKhxu6euwFqJDzKqC34z/rJn?=
 =?us-ascii?Q?tHSd5evtSjpzcg0mynhFwqan43gvijSMghioomctA671KTh0iTmV6aWbLNO/?=
 =?us-ascii?Q?UWdSpCcIT6wCFZx7nsIYR5GYwJevNgafYTrnkTRz/zTlmaMqHJOYCrf3oADm?=
 =?us-ascii?Q?+1oRH7CiyAEvK940hmGnY+vlFCBe9wQyC8OJ75rZWHA6jiL6/k1fgmiesMit?=
 =?us-ascii?Q?tGz/fw1V3066dibZUymzfAdlBBtTIwS5njx4MSLv5lGiAJwoGMUBcx6GuDX+?=
 =?us-ascii?Q?veVtKbtFllcUMkesTKpvakCI30mifDQ1kJLydzCUcvBnMTEcHcojNprgxJ+A?=
 =?us-ascii?Q?5NUATOt4uvDtJvFurdfxzcpT+4FZRXBIQe8om7juDnlN+4GC5m9B7CNLL4nd?=
 =?us-ascii?Q?kapxLgh9MTNDUul3rLKwCwdZZDJjrrlpODXaWnW0TDFwXsk5PlHeFPCI/iLK?=
 =?us-ascii?Q?SRdmDh55cN2dZx2JNwRkVqRaIfGCxov2n476AhHwprdX817aOYEoI8fo5iHc?=
 =?us-ascii?Q?Pfyi+/lMvANpm7qerls40ZgCzvD6Bs5weQFLCBFQ+t41NQhCVdv/AFyOgIf9?=
 =?us-ascii?Q?X9iPUaJPwsMD18LE047q87zuSTXB4cpETzOmYI8iaiHfUZG5kTz8XOIchh/R?=
 =?us-ascii?Q?wfOYo2GMRvwciZDtSu+cb/WMD5fnMhYySJWe55VjQ2ZZoK29bzLCOrXbcGbu?=
 =?us-ascii?Q?4jQEIQqZnOi/C4d5BsW5hR9K1BjCwp4wrr+JO+s4fIoXEO6ZcgnSgUMBd+xf?=
 =?us-ascii?Q?Pe8/jzN9aeV/7OSK7DGl++2oKZ2mWogTHL4WqviyrjhhmauRL41OYv6IQxbm?=
 =?us-ascii?Q?EWpg7PU1KJ/kDpgJyWdpBqXG+rHvhCHcC7QtdpRMr0txkVvlcVtQix7/e8qr?=
 =?us-ascii?Q?KP+yzrRg+2Ox5qnRrh/7168ql3QKZlDyUsgWGHa95djr0DQh3J8Z9LInDXUp?=
 =?us-ascii?Q?enjUwqHRxxRk6geJLsaTH9RUW6y2z8BmYokTFtxz2H2DjYS4wzfzvawovDox?=
 =?us-ascii?Q?6zAUeso+lUk7M1UwhG7seY+F8pG74kZuqiVGkdForTMPthvjpaXl/4Shp8+x?=
 =?us-ascii?Q?C41Hp6blCihDvT7it7HIp1Kn/i7UYEQSk755Ws64NSCQ/IspJE1jMSUFhpgO?=
 =?us-ascii?Q?4PytCrjPVOl+lXFkczSQON7fLSdm4XkCSYHYGaOgQ8MZpQw/6dVx2TTSPBAp?=
 =?us-ascii?Q?0GMT4+sUKpTKUnX5lGE9Wgi6C9ugRRYcPoU7dDzVdcbeYwT4CLng/HOGsgXz?=
 =?us-ascii?Q?8HXm9JbNxxwojmpeGoymsM+NL4jRe10aOj69BxCHZGLOpzzi5j5+/GP+7EAA?=
 =?us-ascii?Q?DS68s22bfOB+vBsEkHfp2EwRmLAAnfh5/BnswY86RaRO3vUr4ANeK5dhdnte?=
 =?us-ascii?Q?Mz2mf34yJuBznpyXxd79ONQ45/laubo1ixqHXf847xKalVZloaz2Pjy9NS3d?=
 =?us-ascii?Q?AXW8EVWSJ4sMsEggBf0OkiyBN6TPvC/jultIpc6oWh6piTMbjQxSuQDS134H?=
 =?us-ascii?Q?lQvEb2X5CkZ4P/9WrKjY/keJqCWjQdMl0E6ZcLHg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb60c02-9041-4667-61e5-08dd9ec92f39
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 15:55:07.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZcpHd47vH1X+FiMOU5hYNSHFCKaUaKXYar4cLoUQ0e0CtcHMsTMiGqwrFjEWd1x4Wl0+I77zHx8oHf2SGtkLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7104

On Thu, May 29, 2025 at 04:35:11PM +0200, Dario Binacchi wrote:
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 128 Mbytes DRAM DDR2
>  - CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v4:
> - Drop label property (deprecated) under the leds sub-nodes.
> - Add microSD comment above the ssp0 node.
>
> Changes in v3:
> - Drop xceiver-supply property from can0 node.
> - Rearrange the order of specific nodes and properties
>   alphabetically.
>
> Changes in v2:
> - Replace '-' with '@' for the pinctrl sub-nodes.
> - Replace edt,edt-ft5x06 with edt,edt-ft5306.
> - Drop LCD reset hog pin.
> - Add correct #address-cells and #size-cells to gpmi node.
> - Replace edt-ft5x06@38 with touchscreen@38.
>
>  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
>  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 301 ++++++++++++++++++
>  2 files changed, 302 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
>
> diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/mxs/Makefile
> index 96dd31ea19ba..d72ba702b6fa 100644
> --- a/arch/arm/boot/dts/nxp/mxs/Makefile
> +++ b/arch/arm/boot/dts/nxp/mxs/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
>  	imx23-sansa.dtb \
>  	imx23-stmp378x_devb.dtb \
>  	imx23-xfi3.dtb \
> +	imx28-amarula-rmm.dtb \
>  	imx28-apf28.dtb \
>  	imx28-apf28dev.dtb \
>  	imx28-apx4devkit.dtb \
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> new file mode 100644
> index 000000000000..5ef9b79cda1c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx28.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "amarula,imx28-rmm", "fsl,imx28";
> +	model = "Amarula i.MX28 rmm";
> +
> +	memory@40000000 {
> +		reg = <0x40000000 0x08000000>;
> +		device_type = "memory";
> +	};
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 4 5000000 0>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		power-supply = <&reg_5v>;
> +	};
> +
> +	beeper {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm 7 100000 0>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_pins>;
> +
> +		led-0 {
> +			gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-1 {
> +			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-2 {
> +			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_fec_3v3: regulator-fec-3v3 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fec_3v3_enable_pin>;
> +		regulator-name = "fec-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <300000>;
> +		vin-supply = <&reg_5v>;
> +	};
> +
> +	reg_usb0_vbus: regulator-usb0-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb0_vbus_enable_pin>;
> +		regulator-name = "usb0_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb1_vbus_enable_pin>;
> +		regulator-name = "usb1_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +};
> +
> +&auart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&auart0_2pins_a>;
> +	status = "okay";
> +};
> +
> +&auart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&auart1_pins_a>;
> +	status = "okay";
> +};
> +
> +&can0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&can0_pins_a>;
> +	status = "okay";
> +};
> +
> +&duart {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&duart_pins_b>;
> +	status = "okay";
> +};
> +
> +&duart_pins_b {
> +	fsl,voltage = <MXS_VOLTAGE_LOW>;
> +};
> +
> +&gpmi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;

Needn't this, dtsi already set it.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +
> +	touchscreen: touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
> +		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
> +		wake-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&lradc {
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mac0_pins_a>;
> +	phy-mode = "rmii";
> +	phy-supply = <&reg_fec_3v3>;
> +	phy-handle = <&ethphy>;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			max-speed = <100>;
> +			reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <4000>;
> +			reset-deassert-us = <4000>;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hog_pins_a>;
> +
> +	edt_ft5x06_pins: edt-ft5x06@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
> +			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_ENABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
> +		reg = <0>;

Any warning report if all reg is 0?

Frank
> +		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
> +		fsl,drive-strength = <MXS_DRIVE_16mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	fec_3v3_enable_pin: fec-3v3-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	hog_pins_a: hog@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	leds_pins: leds@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_SSP0_DATA7__GPIO_2_7
> +			MX28_PAD_PWM0__GPIO_3_16
> +			MX28_PAD_PWM1__GPIO_3_17
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	usb1_vbus_enable_pin: usb1-vbus-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm4_pins_a &pwm7_pins_a>;
> +	status = "okay";
> +};
> +
> +/* microSD */
> +&ssp0 {
> +	compatible = "fsl,imx28-mmc";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
> +	broken-cd;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb0_vbus>;
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb1_vbus>;
> +	status = "okay";
> +};
> +
> +&usbphy0 {
> +	status = "okay";
> +};
> +
> +&usbphy1 {
> +	status = "okay";
> +};
> --
> 2.43.0
>
