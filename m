Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28915176242;
	Thu, 27 Mar 2025 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093086; cv=fail; b=qAStb/DUiByLHONRxZ122pCCP5LB/bj1qYc4sBcH+LkheZYfJPn1SjxUV3TsCfo0zzqDb2ICCVHnnC/+eni+R+uTutb+eSWe2FIRtT0rox6L2eUclei9/aJwjfC63PiXoeKOg8VBPA/JMrPTCvmoL8b3SnuPV6mKGQIkRLTjLjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093086; c=relaxed/simple;
	bh=oqkUjwD0UdYuZoK4h5KjDXRPBAiUgkw+1t3NuET7cxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YNcIW1AJ3RlbAQBtp/jfszQn9HggD2Noi7kV60IPUpS2G/PG4ugg3yJDoVyEY8GSWc570DsWIyRBOFiiGUtylk3PA9Fr+9bVMdzxPx/5QAbp9UT62jXow0if89/XPhiEGstKg+qtCxJBjR9OUCvKh9cyRWUOpJSznhxf7XMIxTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a5Z3hl8T; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a5Z3hl8T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqaFCYd2JmgDsk8vAkvC0BTLRGpjBJI2arlKxSLLuV/lbZs8jkNGBCFKK3NnsEjqgcrw7zEd29IWfZd/FpFhfp417GxkMNZPyl3wLQm38nbu/uZWt8DmciZqtauqaNUSx6oNCodgDy+TA9y1F1eEPHSmsFcUXtdLrcfEyy9a3BzwYGAEAxH5zKgYZR6Ud/PLTebay6Z4DBWJNM2zM5msGLzl/8Vh5pUQKwjoxzj5fq/PFeb2Q3waehnZm7a7vKl5yF4jZXS3+QuZ10V+A9oipjbqWr93bfIq4SKwKowd63BAuEnJeoQoNvUwPxMGZe2gynqcRSXSqOg4PcYXZeF3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/Jb/3uLp3RXtnIUrLmYGCCBaUm40W94uvMqKsV46JE=;
 b=fWP6H94cuoAu83nRsGOnYY+ycDO9f/DvVUaCgSx2tg46GV5hm9njEZ4jH5qNokgfD8fI/9HQMOYSOyx+C8PQVDhamLhjtNWtNyq1jbfJVJZoFq0w2vgwp8cFSvS/Fch3QViKaJ72Tj+Qv6cBToP7dt1vv4kv7uPhY9Kj/nY7tgzJoaRreWhod8xraZSL2h0mZSdz+AzSKJ/M7PEAOfIuZscQZY9RGtJANijfSSv+Ku+gUBiClssZZwTysE1ZjmuO6CNXtyIphFdbP99pYrsF4PUInoi1QCp7rKYbYRjHZrwWTApO8TJOoPlrPfEwZH7YL8lAl2o3FJEx4YBtLE/2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/Jb/3uLp3RXtnIUrLmYGCCBaUm40W94uvMqKsV46JE=;
 b=a5Z3hl8TDLsmbIo0xNmzeI063YlHhiLbDey3lCkLzq/v5MvpF5IifG/RsehZH2daZ7spOKU3ypF+4lOU0RBKfCYRDKPuYnO9+aDTh/hSXgHQWvwSVinh//wMHTT6jIWvuRLkvBQMqKzT1fF1WyhiSC/VQbDXX9rbr7Syo6vuJ30SdZMlucYMltUkWbhrruMkJvPjBg+geJOMKMFWTpgREhIFqzRW1XL6RvdA72Sm3pCtiYTIQ1zAeiSxyopi/5JQhm1JeU9kB59YD2vSMWZVcH6skC5wobbzHfhZxd+yhZaHwj2ZRxR4+IZzBACwMk6GhfrPher3bUeHKKDLRArKCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10327.eurprd04.prod.outlook.com (2603:10a6:150:1e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:31:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 16:31:20 +0000
Date: Thu, 27 Mar 2025 12:31:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Displayy
Message-ID: <Z+V9UCSN1L6lIVat@lizhi-Precision-Tower-5810>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-7-4e89ea1676ab@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-initial_display-v3-7-4e89ea1676ab@gocontroll.com>
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10327:EE_
X-MS-Office365-Filtering-Correlation-Id: 58120807-0e83-4ccb-5063-08dd6d4cce21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nb2GWP9xuRqqeBpHSKKuD+b5kGxrXGsukwbXEqG0QcPJPpL32KYh2XFDLbSn?=
 =?us-ascii?Q?vtfWu+ne1bwzaD2uAscDQBwOErMsnFXEuU7Nm33b+phL8SYQyE7zf6BTBEsl?=
 =?us-ascii?Q?AHiZ6Zzc01iISt05obLxfIO53UYn6/sgN3/vcmSWAzbv9CIX+8xhzUcD8SRc?=
 =?us-ascii?Q?4uPwvX7Q2GVWaB5MQbsZGj4WSvMOaxR2LvI7TD3XEjJm8xBCs4C8KBROEqD9?=
 =?us-ascii?Q?glGvxQfA0+wF/mnUJeLeIrUWODR49XP9lVCIttEM2ke3uHFN7KI8/SKgLUL/?=
 =?us-ascii?Q?m9KL55aN5iAh9DhKb9iJsYcdWE48L9HsWCCTvVzN2iaFM+O9/LUpy6kydv+f?=
 =?us-ascii?Q?nsf3DQF31wIamgtSYj6xiZHgLaQaZiD9SJCqnyfagSMsaj68wVT0Zxp9CyDg?=
 =?us-ascii?Q?9TlEFphNxcTMLJ6D7YHKGQMRZRQ7eK8OhsJpum2VJ2Qj66FuncIKviaUYbUF?=
 =?us-ascii?Q?Nb8ukZ/2HpAePAFg/YA0LYHpk6Bdoq1pvl865ihkrHxsoYGLfg3LbVImoeOp?=
 =?us-ascii?Q?TA+h/0n6y0GHXHxXqpSugGVn6os6tA2rPwSJeXCWEZ0G+SYob1TZW4ifqcQa?=
 =?us-ascii?Q?Oyg5GAx1iB8JMEH4dsipS//PB+1l2fS8B/gIo+7e1Fe0JKjxxUD368ZE2Mbi?=
 =?us-ascii?Q?kGeqwWsZ2+PiTm+E1os7wLifwJQSf5qpIIFxA7AdSY3XO5R5gRKVmNsVK8gb?=
 =?us-ascii?Q?6U2WL0JwBqAkZZebR9f0q3s0O320hv7r3IzrOTSvER15W7Eo13kHda9tm4qB?=
 =?us-ascii?Q?W/NqT+xsGagjRFpPhwMBibk9My1nCiut+W61o+I+WPxzetLk/b9JDY0d/n3R?=
 =?us-ascii?Q?X3vhrMGFiJw1Ta2GQOTJdYAXMff1YeltpFHEa+3nSnQjU1nUx2GQ2341bTza?=
 =?us-ascii?Q?uSTkecLhQOnhYXxmXUmGa/bl7+ub71Bl2oKTbvewsh01i4krt5HSXhVkHspX?=
 =?us-ascii?Q?FjkqZbq1cOYYD0mna1LxecjKOO1znCvGDq/A4B2SY7/bf2hjy0rx5yyqehvp?=
 =?us-ascii?Q?L9tkxj9cu80dZFM5VjTeMeBHtuNqaMclf34AsWhxOUeZP7Z5w4OAGCkfCaXh?=
 =?us-ascii?Q?mr1lcWp3441gzEVU3VISn5FanJQxslz1jpoXZGTPcmP6fdVqmEmxBPYouncz?=
 =?us-ascii?Q?GJ8jZvCoyxpjCYr14Jk7scYJVnIjJ8CeW3WdLLUpcT+CWqkeCLz9FNJxgX7z?=
 =?us-ascii?Q?toG92Rafj6FQ1kA7OqeITeUN7owudIaLzgPzDLP1yIZCivKVB4fUIIpT2wE2?=
 =?us-ascii?Q?7eqDOfPEI8S/eGZVFURqCJS/IM/eJfQAwW2PIoSCsgHVxV8V+fjru0Y7r/tg?=
 =?us-ascii?Q?iMVQUIIQjTHdX7cO7m5kg7AweDj+WamaQotzEoWfkeDsbMGZ3ZppwSFxluCU?=
 =?us-ascii?Q?JUiq1a9Aj6ifuLAHnssxFq+pGT8W1ORrhB1WEvtyA6NL54Srxu03deywPyqr?=
 =?us-ascii?Q?5zMA56283gZRibGoGednKQgNwa+xzIx337hWw7qFHIRxHZiJBgfvTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NqEikC1ij4J5ppS5XAw4OwIY6zDN+jilLpvzRFGY0B6EpTvL/Nr72oIFBJ7e?=
 =?us-ascii?Q?f5qCpgWstkLmky/SkQET/OAeyeqTWZfEEzz4LwL0Wrvcod+2rWvzgtgvN1uD?=
 =?us-ascii?Q?vT5VpwbXpiosqrV1f/0p0rnGX3kqhChRtNBIT5Q4a35qNmEvhLPEtdrn8J0t?=
 =?us-ascii?Q?9ZSdCPjoc8LcZSWlCaPMxJG4BhIQXMbG/0K9lASss/PKBa4+sclViPcMK+m5?=
 =?us-ascii?Q?9RWvJ8GMB/hG7yZWwhJJMMl2BYHpC2sB6nEEir5OPUqUAV1p4pSVnIH27hlz?=
 =?us-ascii?Q?+dULYqQzUutm5pMzF0CzrJuk5BZ7uhlaI6LuD2fyF8LaIfBBCifg7nAb73MP?=
 =?us-ascii?Q?d7CHxAz9xGuSKv0HZMCX3m1fKnvmJV9LxW7p5eLu9tPuumlLCkBWBUCznK3Q?=
 =?us-ascii?Q?ud4BKKV//mubdBuvcdrtSa22WGmX6IOTtl1crOBgf9JPiDjZGf/ytbG13fx4?=
 =?us-ascii?Q?wJ6y4gg2//SEYpRpQ6CxA7ebpuoCHbYAwcJohi+HZEQfNuwev3PWuvjUAX3y?=
 =?us-ascii?Q?n1sbZ2G0T6KQbDmaKwD+mFRPBdKMQ3KB8hnMb15ze/zEtEQoExWXIkts7wdW?=
 =?us-ascii?Q?uG7CDHa9lNgfbr4xjnjfJHetBWJ29Yl7VeYSpYwDqGuPu5uC2OHQROhUNhMb?=
 =?us-ascii?Q?lprzMoRFOa4dRlTMvR4sV2ExuqNUCFa5SwPKqxK8ILeYZ2gET47sIA0GTJtp?=
 =?us-ascii?Q?0jBPTCoi5iVMeHbgXvzyZE6cG0oO++UWS9IoWnCu0noen69F3AM61tsGi9v9?=
 =?us-ascii?Q?ZY4Jcit2Ncsxf2OlyCAt7KZINebsZeRD05U4pe99yrAX+StwhXfEB72Op4OF?=
 =?us-ascii?Q?OezXmxqVTI5xfGLA8VxxWBp5qdfWZhSL0u5e+tfJsRLbhLcwh3E0gul8nc3I?=
 =?us-ascii?Q?Pk0bWGGdR5ITwvSEjQZFr9Tjtgzt3zPNO6FZAwY9ISmVCNrpao1TlyTfzpyJ?=
 =?us-ascii?Q?8RG+bTPUPSC0zDyp6qqjgob53aXOsXdhjE63rrJ7nd60IO1T+rDwv5k5wHg8?=
 =?us-ascii?Q?5eTpW9OIONx2qpmoZXvU1dB2DFJLHQ1WiZlRGWZYumPYeYPObc9p8B/Dem9r?=
 =?us-ascii?Q?J9GnsGb1KGeRIyszchYJQq3duU+GNgTAHous4b0I2fQ9IF2NRd5G2fMJACTr?=
 =?us-ascii?Q?GcJmAHCj2uABshNiF+w8BJdJoTIU4h0FoYmO3GgoGql/NZ04l9gII0bnLeav?=
 =?us-ascii?Q?0Mrf68c8cSwkB2IJVaWKLV+2NmuGFt76EOp7NoAqp10d+EDB0C7d4UlF9LMZ?=
 =?us-ascii?Q?MPE9OgSEzVSWKQI0N6vmYyKUeXwI1UUx1f83M5pIaAhHbx1ilv6EvYcQwGli?=
 =?us-ascii?Q?2k8a0sJQzLttO0dlmE43uLkvgDFO7xOqCCXUZwzUiF9afQp2tSIF3HXa2HF/?=
 =?us-ascii?Q?/FwCpSZ9v3wsJmtpavtOFXinWZCPfzQHxJnwBAow1VLEmqueI/L0jYvoVdZk?=
 =?us-ascii?Q?WFvT5dBIoFQre2EQIpy+MAI3o1ujYz+EABnVZD0j9PLERFpd5QoVvERhB91i?=
 =?us-ascii?Q?37SL818XiMLf+UeVemWn9mztWFZhPAoFpaI8a3W2tFv80+Qvl/ExtulaIkek?=
 =?us-ascii?Q?ny/Llvf5G6gciS+Xl1M4psoZZl/MbMu1JXh8GDcH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58120807-0e83-4ccb-5063-08dd6d4cce21
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:31:20.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HddoCfWSpMdc4k7vTo3Yyzl08fVSwhY1JWI6HG8dLbjlFc+/nKxFe52FHJgn1XpUpqSaNGs291QTafcxIHn3zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10327

On Thu, Mar 27, 2025 at 04:52:42PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
> comes with a 10.1 1280x720 display with a touchscreen (not working in
> mainline).
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> ---
> Currently the backlight driver is not available, this will be upstreamed
> in a future patch series. It is a Maxim max25014atg.
>
> The touchscreen has a Cypress CYAT81658-64AS48 controller which as far as
> I know is not supported upstream, the driver we currently use for this is
> a mess and I doubt we will be able to get it in an upstreamable state.
> ---
>  ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..1917e22001a1815a6540f00cf039ff352801cda8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts

why not use dt overlay to handle difference dsplay module.

Frank

> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mp-tx8p-ml81-moduline-display-106.dtsi"
> +
> +/ {
> +	model = "GOcontroll Moduline Display with BOE av101hdt-a10 display";
> +
> +	panel {
> +		compatible = "boe,av101hdt-a10";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel>;
> +		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> +		power-supply = <&reg_3v3_per>;
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
> +		regulator-name = "usb-c-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		power-supply = <&reg_6v4>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +
> +	port {
> +		usb1_hs_ep: endpoint {
> +			remote-endpoint = <&high_speed_ep>;
> +		};
> +	};
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +		pd-disable;
> +		data-role = "host";
> +		vbus-supply = <&reg_vbus>;
> +
> +		port {
> +			high_speed_ep: endpoint {
> +				remote-endpoint = <&usb1_hs_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> +	<&clk IMX8MP_VIDEO_PLL1>;

fix indentation.

> +	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
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
> +&iomuxc {
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07 /* COM pin 157 */
> +			MX8MP_DSE_X1
> +			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09 /* COM pin 159 */
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +};
>
> --
> 2.49.0
>
>
