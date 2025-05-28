Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37EA278162;
	Wed, 28 May 2025 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444673; cv=fail; b=Y1pYXltEG8F5BMRB6AeWmaX/DiodLrVFs4UcEezxJF/3IxQIXSt61UCsrJUsovJuE/HhKAeD04dXjSgC6j1H2DicQH/m+e3jcoL64ydpD+Z2fJPvygtFjbuqA53USivRQbTFyS4faF6HTdPKSFlzl/s05Q5Aca1UnIjMVmaW0yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444673; c=relaxed/simple;
	bh=SrmT3xo8XJraYZoGk7Lu87XBeaoknP5KodZ4mQuz1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U1zdFdm8lzoSXqs176uzUF9WDrwNTbAzD/vBiD2KC2E1g43QaSPfPn4iIKH0PuazqRs+ThKSDoxTkwFbV33i9Ox1qt6IINl7OjAhTKvqspkSUpZrlG5ByAYmCxqtu7bpl7OO/gcIGfJD7RMsNTjfWcQ8/nZ64LNW1rM7MQPtYwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EaXFJ7k9; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EaXFJ7k9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKOOjEBXqd3oMDbUMfBUYlJbZglj+B6jJj2VKu1SycWUF0RQk1J9BWl7rJaJ7w4dO81Py0EO2KkyhvxFQlNsoTcG6YNaIfiAV0SjKZGxB62Ki5p5LJQ9401eaK9EOpMEGzspvDHqWEUbH9Qc//d1Oljh7wD0BuH8vNsrYMoIM5mn/+qAUk65f3kR9kwdv5CjgpfxcPfBtSCOpCUiL0EVTZi8ra7id2+1K1rYzlDHlB0yiKq5diLFsBUj8nwG4+ewVYvsRLljzjTcUkgil+I2vXXm8Z0s1Ii0FAp+nRChV1bI05JDFAy+GFyAU8UDpQBF7TXtaEkLPBwYIJbFZ3EyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y8NUzB7kJYVXD5jvhFR9T1slhyf8Qq4YgsVsHLkmBM=;
 b=IDOZTbLdAQvam13Uwx+n3Y2Vo4W5ZT2HJepLdO554JFhslRs5mwLjJOWeTQEYNyFnCeWo4EjizBqOUcZ9MlLk1+Dsdhfz2RTO8XHDRT+V55udyLzTZEvCJTlSn727nss3wB/VjVn3+VqcdhBlwFLAp1SdV7KjPmEqnROsFFyDotQun/irT+stdmm45PwImo0v+pxnYouQRuZnsnDtr5Xt1LlOeQ7tiOpd/s/8cEcnFZDoRNhlzmNRhZKVI4tEj0/aCkw0keufAj1TIN+IHL1WVshWPMjh5GjBSnt6AmaxvRKE9yJsgX4E+bPDrB6H84mM+XIBcZXTotEATdXJZSmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y8NUzB7kJYVXD5jvhFR9T1slhyf8Qq4YgsVsHLkmBM=;
 b=EaXFJ7k9uLKqL9iW8nvlJVnS5iR0IuRFC+FGg8l2HGx0SHPdTCGUoqxa8P6gR6+rcHo84EtyTPc7/W7vPreO1E34ClHsOn8JC0LOxnc8A8knyG2Z9Ln3wXtObJ6u1x69ewqNzXdOHfant/rJ5hH3POImcY9duclfDiRKlbXrsFWN4MRno02Ifakt3khuipSLMffKzj+fHy4q2JiaOlKyvpLG9D+6oU61Izmp2mcUFCchG2J2EhwcXfj9mzXU7XhIr7XM+PuFduvgqERFn/X4QTjak5WqZZsTQqZz48K+08vu+xsZNPwKmBbsEfGorsqRNzZjVjcvl2lE0KEN3bQO7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9574.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 15:04:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:04:28 +0000
Date: Wed, 28 May 2025 11:04:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ARM: dts: imx28: add pwm7 muxing options
Message-ID: <aDcl90Bz9BJnddL5@lizhi-Precision-Tower-5810>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528121306.1464830-3-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: d091b7f2-f6c4-4c6b-d3d8-08dd9df8f176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gJW0vE2XdyINr1oUaPecCqXHJc9XTOnl2mOsmGTT0R23l4rR3mC7HesqrMNR?=
 =?us-ascii?Q?JDy/AReDM8mvpJy2zuHa7gzPikazSshyHmvHxCmhOX3m/UGS0NpKeIf+Yb1R?=
 =?us-ascii?Q?iqKQoGe76oiv3811GO9QyGu4l1csYoj+/SeHv0DbaJE0aPFyJ/+FaprCtMOI?=
 =?us-ascii?Q?SSpeGp7AQAsZmsGfH8PGXbZgmgu4Suf2tXDjWptGBF9ftd8+6qHwf4zfhl9C?=
 =?us-ascii?Q?35VA1cyJ/xbe6gRXu+++VKilMq3sy2RzSszmD9PdwmCljfZwrzII9lvpQerN?=
 =?us-ascii?Q?QCNjzjYdWq9PofciJCBvVj+EqlL0AV674Yeki5s7Am57+FUBnMM6X4WJidUT?=
 =?us-ascii?Q?vFs/ByE3XK5svJeip1y9uavcQ6CGadwGjRw08xGQsUVS+oR+zQCd5gso0k62?=
 =?us-ascii?Q?op5tp0FFi2zawgdbqMmkrW141H1l9C4lKSXcXF47RNbt3NzATegSBJco+vjY?=
 =?us-ascii?Q?Z2CfaXt2rH9b1Fg3o6yNCCjSyI5wPC8dU/IyIceJXf9NKxUKkP0OQw1rpmF+?=
 =?us-ascii?Q?KsqtQJC+Q2/a/vP4ExQeMDdWZpIfBiE+/VZkpiO4RbZ1i1vmLM7jVt7jiPkP?=
 =?us-ascii?Q?5sxsbyIV9kqBOu26vTeqTpPiaMkkAvYbK6gtoEbT/A+ZFh2f7t6KSuXlYz8x?=
 =?us-ascii?Q?gSCRUP7UK7jtm9gCrEEOLHRMjRFOuQtJYnG9pDRIgsQrUx0iJ1kE8vqy9kIt?=
 =?us-ascii?Q?Zesuq1aPHdDmJKE0Sm3iBP0VKi+hUYcINJXzLWGxR3TpRHL2dKABJYhVrZ8B?=
 =?us-ascii?Q?P6aBOBUO1Yw8clFBRqjdBSKJWij9LxIxhk+0eJzWu2nVK0KfZfM8Zxpar3sB?=
 =?us-ascii?Q?LcArecvao8RmfMLFhkt4ZT+FXA/ofAWrCa51iv/P0Yd02gJNRW1Cpt7czgHx?=
 =?us-ascii?Q?iqtsyNA2eWFQ+uR5sO9C54urgeylRhYTzWEg6FPNC1AOa8oIIPLr0TnP9Jjv?=
 =?us-ascii?Q?PFB91huwB+az8DA7dG9VdNaEaTprsji/4EHx1UltIu6ICistGCfiGuuTLPzz?=
 =?us-ascii?Q?jtTFr7flYAYyNTI+nv+IapiwX0FpG7NsaPq0tD9Ab9I6xyN/7tEsOsC+z2co?=
 =?us-ascii?Q?Jd/2L8jOxKlHbSpGeg3sz9Zd6j49MWJjZj8vvRncHxw92ds0agXZw+859000?=
 =?us-ascii?Q?2XyBS+qfAT7JyNyxwmyxmAU7od+cd2UUGzgWTCdZ7p37t+cXwrA/hhZEn/UZ?=
 =?us-ascii?Q?t5VHSKk6MEyhm77ZOI/YBm9i97MSPcbLvHqER0XxJzm8o03GZ3He2y7OsG5r?=
 =?us-ascii?Q?nqJtb+RIKR67RYjuNlg9O6ZKL/DNCLFZU30CWVWcrKc8kKISqrL3fKGQRVzc?=
 =?us-ascii?Q?NmyxFEpMhPc6l13HdCIg33jUYbC5fLTLfT6zLk0bcS5QAgOmsXKvFMh3s0iq?=
 =?us-ascii?Q?HWOdz3N+IISQHDnPOG2wUTU2Eyt02ud4kH/hPf/Bs18zKVfAjMSfXXxuuxNJ?=
 =?us-ascii?Q?z0uKMGEgLe/SdXnaVeUpr8cxUvv0fvvv5ndgzpOuFTZtXUOygfXAWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tu2paHZ1Ye0Gqh5oTBEEbK6jwF29SWTm+EDeDMP1UAghXL+fmbw1xGF76Y6T?=
 =?us-ascii?Q?avwqTjvelvhW+3yUC3K0Jyo1kh9FXiTYFaxMOafm/bwoTzcHR/FmjvKlAPqk?=
 =?us-ascii?Q?hGVMYKgroI9PjQh1KuL7SwNSETEbzICK/W+ZydoBoaLZJooMqrcGowOL7azr?=
 =?us-ascii?Q?XMZamvjyQ1vTUUato2ckg5etq6Awo2micgEgCyySYhVYMeQfMIA1ug2RTTdq?=
 =?us-ascii?Q?leT7ABLJ+93HN9efQZwhphjc1BS+hiD0dAAXhFR/fncwDzu9kGpdGzcVmR7u?=
 =?us-ascii?Q?NGwTJD3gkllUwdoO0OTEwtKlmEK+xuENYD/NvPFNOUx6PY+xogf3cg3ZnsoA?=
 =?us-ascii?Q?N5ar8iytUiTeGof3ZUY5sWppQkS2u+KOiWmo91IDB5tDj9SlNCFos7zeboQz?=
 =?us-ascii?Q?bON0utjPPacJeqoCzQyl6Q8zlrtpK9ewTe4BFRCYUA/kuevrj3+yi9b/J7Bq?=
 =?us-ascii?Q?5CQ4svFhGpkMalgAij6/9/wu4CeNLrBmE0SS78FzPQaUk+1E1hB15vryX/2x?=
 =?us-ascii?Q?lNuj+rEfbzfrDewmF3yo3yAyzxQl1bedpc4fyPIT1T5Sl9z8X9qfuQIZSNSP?=
 =?us-ascii?Q?KTdONjEq3owf9VRXEaY04WUpY1HqV/PgaIbAP25tcclAMKwD1jspzxKyVY+/?=
 =?us-ascii?Q?x5ca8nvrEUBV6MJiWizzXZ9h92v6sfTXISupTF+C/LvFxqUV6P4qAUjlICN/?=
 =?us-ascii?Q?eHl37BOo1NLINF8JxvfDQG6H5rLCJ/Mk1tzOFrSGl4KVQjCOa4vEeUWRUCId?=
 =?us-ascii?Q?2UhX2kV20W86oIacvvQgzO19KA5C7gjCOgo5dCeeXbSlkK1sIen5LrmQV3rC?=
 =?us-ascii?Q?QnJlK1H1MPLQY5RQIUfkVD2EKQtPW+auEZ+4CKFPeWeXzvNE1u87LnQXxKKU?=
 =?us-ascii?Q?Dc6J8OM6y0yz/weuqjsTECDnvPawNrddjjbMaoT98w/PJGz7U3yCBNE5t0Qj?=
 =?us-ascii?Q?swKjF6Q/9HOYiuQhEjWcLNYqhz/VTFo/xNcrcgbOXj5j1Y1VJY2kC3IG5SQ6?=
 =?us-ascii?Q?L5n9Cf3EM5tKGAFxUUWU2XgSN1RYwXA84u4h/+LMHtfxdfv1YjiSCr9viQNK?=
 =?us-ascii?Q?SGRt5tqNlQKBMnosF/pUW7kYwKTAeQWWc4aUINgfo0ykzw+bmRnJMTkfHUZ7?=
 =?us-ascii?Q?SYgmmgUaBJPUBdsrSWXpyTKqU5WUQNe4jWbIh8vrL1Z7yTAiVE2IzQ2Vt8yQ?=
 =?us-ascii?Q?9Dh6K7XkZDHiQk+ZN35T/339KYN2x4NbfLN48nDQr+rKkO+XMgYiPQD5v1E8?=
 =?us-ascii?Q?TGU1SdpsItuEqvu5pHStkOV2n6WaERvTqdCUcUWDYFQWtrw9abiKNFgHbaqN?=
 =?us-ascii?Q?PqSWv8ERKwe8z3epKOPtG8hGNbgpJrz8VBBEqNATT6zMFtfWvc5Dv+CX61KD?=
 =?us-ascii?Q?Msx1z2KrE8szPCEg3U+cx0zFyj9oUKhCBFr2/CffndD2qEeilK7YT5nxnNc0?=
 =?us-ascii?Q?4PZeMRoHbF3cImd3f8Izx2lrrltAnOsVWX6tUw0SF7Xrq+W26B5UmEZH7XUh?=
 =?us-ascii?Q?/RHDKBvLmPmoKwlM9FpjZjFSFmSIftFqrsg/MKQ0MLEwDFR07ceJjYZpmuij?=
 =?us-ascii?Q?Mg+hzpaGXLy4nvZrmFeVJCrruZuPsy9U42gRBpf9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d091b7f2-f6c4-4c6b-d3d8-08dd9df8f176
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:04:28.7044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPN2HdfkaDukWlsbkFoaMgpBA/biQ/sCcy6aaPcByNfb9YFHT0XFAFYV+/IUb6CK/drb2jb93d+8g2Xu7hKumg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9574

On Wed, May 28, 2025 at 02:11:39PM +0200, Dario Binacchi wrote:

Need commit message here, you can copy subject to here.

Frank

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
> (no changes since v1)
>
>  arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> index bbea8b77386f..ece46d0e7c7f 100644
> --- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> @@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
>  					fsl,pull-up = <MXS_PULL_DISABLE>;
>  				};
>
> +				pwm7_pins_a: pwm7@0 {
> +					reg = <0>;
> +					fsl,pinmux-ids = <
> +						MX28_PAD_SAIF1_SDATA0__PWM_7
> +					>;
> +					fsl,drive-strength = <MXS_DRIVE_4mA>;
> +					fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +					fsl,pull-up = <MXS_PULL_DISABLE>;
> +				};
> +
>  				lcdif_24bit_pins_a: lcdif-24bit@0 {
>  					reg = <0>;
>  					fsl,pinmux-ids = <
> --
> 2.43.0
>
