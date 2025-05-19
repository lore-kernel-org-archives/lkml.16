Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125E20E32F;
	Mon, 19 May 2025 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680750; cv=fail; b=EsOj4ZfOeTcLfsQEhRtnQnovXmHpkSpVLnDgau31ht+F29LovlinCMFqWs0ckAzsFzUGFNYPjfL4kxJjYwuo1rPye3UOSOq+R3kycQjA16FLy38kb2pNpxhsGIE0lVdz9Ev4966wTNlStMxVmMinLaF7sHKeW/orqyW9UESYDs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680750; c=relaxed/simple;
	bh=KTAOEiOrBneEnnMs7cxTa3X1+0syc0OeNZKsnpc8SE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j2ROAMcM/UO7mqbk+mQNiUP464Ppj07xKlZv05NR+N+IJOSbZdwBKiIt83UCYRi8gxsjd6QmojgQ78ZS3f6qqyt9Vi2euTSEHK0rEG+0H++Ao5eamgZFzfZGWgHDeynzwwYc+DmmLQx+gkKDj56rP0A9/46CbBRhvl2hHk80HIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AbOFejr8; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AbOFejr8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQjvKL964wfUV4IaD+5AusCsYj2i5lRYNrAhIrIai7yDFnknl6bPOGFrBvM/AMKV73e8gmageqbxW27/OGRp8gascDlS2jaaFAq61tpPWAMoFwm7vMEQKBT33PffR7l31pHy0v2NCPE6ZL0ni/lZGd0ThEVXA+5NsYVXzOZSQB+Nz5Gr53rbNkDXEZtF9dMuqzstrGrE39C7RiWkyVj2wdfMX5nSN2vB+fJSfhics46/ifDAKjx9rnoyjtJ5rcE+4qnejyPueISIqzwkdSDuAaXbNIC57cSPYdfe2aC27JXB3mKodsWG9jxcgPNGmJl5cRvV5pn6LYmRyc9PKOxWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek15NoYJ7i9U8JHKXyjxvtbxJt6Rm74AghsIxqbM5EY=;
 b=BhFrX9ehT2lIq98+rz7he6aawSKMBRRdOyttJ62vl69OhIUW7lYwdJ793SncGWqSbe0HEsretGjSwKcf5PJVYqzwtqhRBsh5vqiRU5+oVNI6zLHYQ29bzBZ6ik1j0NyF97Ev+iJVbmZWCsYvtBcN5kazywr24Rmi4SP10aIH3krlHDcn9MS5v2XuPXpp/+SL+XbAUHfWILektQBzSxBWEriMk53Vzo2SImdDadO67s5nt4D3RAErvl+Gz0c7pc5wNNnFwrZD5qp3aVb3Kil6fR3IS/qxn95j6d7krywExDasx01Nv+4quq0MP5xdslZmpOHJTpn12yELCTYSclhkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek15NoYJ7i9U8JHKXyjxvtbxJt6Rm74AghsIxqbM5EY=;
 b=AbOFejr8+EwQ/WYy1SCcwjm8Y2DAjbETJbqwQxi077IF0/PovbAEkHA0IEwWFYADfrrDN/xJPKqbJIZGCs89qpy2nDuKZjJXJvVOAHCwVQaOnNCVfYSkw69rCvjGFhpas6n2JWvKmbJ8/4W/M/U/UQJzIGwWQ7BCXSn30qkd8O0xEEKWgEKndzUvW/tn0ObxzzX2SyeJU19ZhJKVb0Lde9lu1KON0lH0sWb2+UgAJyeTipBuRMeulbqbjuBygqGhBt22fipHqMEJHyTZqZBCMx2mBhYPfCw4cAi/JJ16u6gJGArGlVNBZvgw2nL4hSYzAbINqcjrfSamjRT6Ewls1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10799.eurprd04.prod.outlook.com (2603:10a6:150:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 18:52:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 18:52:22 +0000
Date: Mon, 19 May 2025 14:52:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
Message-ID: <aCt93j4jwbkkY/ml@lizhi-Precision-Tower-5810>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-5-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515051900.2353627-5-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10799:EE_
X-MS-Office365-Filtering-Correlation-Id: acd734e4-3930-4bda-f170-08dd97064a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yLu6blqAx522zrgA1l91s7n8ZRT/fn06VenvkwXJlGox3UDlRutpm2jANbfr?=
 =?us-ascii?Q?XqbdJyK7KvtEQ8sBA/XpXCm5H5oiWovoaOdehe0AJxXGkLT1etMXdKOs/QLs?=
 =?us-ascii?Q?JKzSdMOBax/Tv1yiUX87x3maeYFMd6tf5TJSbbKNuMn1IKMWZOxTYRxE3JcB?=
 =?us-ascii?Q?Axxu/ENy6dPzH9ZZLt3A9WaRvzlmppWoGfOBwridQDgSXqUr1yFxzujE40H8?=
 =?us-ascii?Q?ekwvCPIsb+y3VuXGGUnKyuvIXRGsP/Kl30a+lEbYfQUb/PIT/p9tVeofX6e3?=
 =?us-ascii?Q?c5IVK5NF0b09TwxRDXc99kElJv6ebddv37rRkW302tNUqPdDrZG5qjeWM4ZU?=
 =?us-ascii?Q?omHzZ7F2gXejrDf5u0L3egaFdylG0y5xv/OWOJ9agcQQezGUZFd7TQVqIg3c?=
 =?us-ascii?Q?hxFWnzKVvT+9hWcyKBSl69GdRZfcFLFtk8itTFPyBCkPIxpS7nwzvYGQbLbH?=
 =?us-ascii?Q?w4Ve3XlYURoahPgc4sSQssoTv8ucR/UMyLOpaB/sGwdMkaAs1fFUHpVSoOsV?=
 =?us-ascii?Q?6mksl7BLx3bVWd/CVtvqnDCnxePWc8DSfM3RYts5CG2GCq2pf1vF9tqy/dzR?=
 =?us-ascii?Q?78MqGSVlrxiPY2hw5mN/SNk+hRMWxMcYKhN1OMNgZgnHF8gcW96dnZmzUTJT?=
 =?us-ascii?Q?oihzkAsJiLqsWrRadagsPsVs9mPbytaKR7BY8dP4lOMiBm8HuKsGkNxlumAy?=
 =?us-ascii?Q?Q12ch8mCYqZhWF7dEvnPB6ufG7B2zyfCB80xQiaGY6AIYF1iZLPCAkVX+Lta?=
 =?us-ascii?Q?nWMcUYJBfJ5hM9p4sMbLIsxkv+sgMYJEosEzEC5nYWsGCbO06JnOzPvLCUjq?=
 =?us-ascii?Q?emp4gD0WJECVbB3iszMnTnugGk1Mm2BZpku96Dya6dIeP/OFXrQB6uP4CO9h?=
 =?us-ascii?Q?rVmE8ggP5F6Miol0BZPqfLlJV96pZyCGO7j5NKqpIOLIjF5k9ILEjEV+zgyl?=
 =?us-ascii?Q?bRi4xlSLkbnk+rYpflx+7MT2qL70aLiEZnaTZM+VHkIPz4TOdDPjScL/mksX?=
 =?us-ascii?Q?SJl1dspuZB9UNkR1WyXAOvlMbInxcM9jbLmn88qFNStDdJwJxob3mbGhai9Z?=
 =?us-ascii?Q?1A9oNhXBGEMvRcUBbKUOaIXSh8EnmncloIFJGR5/Td8ZnDXuDwOBYJkhPTwC?=
 =?us-ascii?Q?tkk050IEYO1kPD4shbXZDlL5unvlqG5C2dEpwj3lB3K4jJLl2z+FJtCxfWfi?=
 =?us-ascii?Q?ou9JVLU8brOZtwJ7d1Atp4roShMMLZRzuHFT3CL1iHYIq57mbuG6dXXO/708?=
 =?us-ascii?Q?cFVJHLQcgPUXf1z0NehLwTDxCtKUIH01Hvi+1oH0g4YFAidiXhfGhGdUC7no?=
 =?us-ascii?Q?zITW+rotKmDH+/ZyvLCh17TsPjGPgcw9ABfEX///bhJEyHYopUmOb2bS/fhd?=
 =?us-ascii?Q?Rg97fDu3BgVYVBH5rNXX/WA826ADc4pdwMBX1Iq7OgkASzgyUgsxgkflUgwD?=
 =?us-ascii?Q?yEJGPIIFMIg8IiSADbwrhHUPFyhPuk/kd/HchI3mrqK0jF2orUu1Kw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/5vKsCh6rO6kgx/EhNVFMfvuGl2yxGz0RQDeYGLrTHjDA2wbTCPJwZj+yTOC?=
 =?us-ascii?Q?RYihyH8YRDYtvYjvYpiAz/5UP8aDF1SxuHmF55w2w0dlFBOmIFMTvR0lCS1Q?=
 =?us-ascii?Q?ud+YG62UIBq8QbMitF7LzCpPfyexjjfniezZiipfp6W0DQmhiT8Nhe2CKVIZ?=
 =?us-ascii?Q?+RI0oi5A7NT9lsOzgmBS5eqP86MmDXcVBCmWJw4ErgYZN00unwFZerWQOxjy?=
 =?us-ascii?Q?HoXV+bL6yl9+gEqaJrrrEqc/XuP4aHAYjRYRu7zbxQz03nUmAApCYZ+ZWUDK?=
 =?us-ascii?Q?JdwHVBPw2D0RLvY+1bq2ILzj2bqHw2++C2J8SkbPWS1unNJTehV7uCvTzUJV?=
 =?us-ascii?Q?O6R6JdVjORRGGPiKVAGOG7fSM6VpYk0YlL2t4ZE6vpREzES359jJSCyuYQTs?=
 =?us-ascii?Q?7up+F85o1gFuRPM7+f3ZQs6MWXn4FUOEaqAfEvBWZELTHK7kYLDAdCXu3JpG?=
 =?us-ascii?Q?x8GYKHw5ZMoeawghuI95qwneGIFUM6QbsyV5d2GlsaOVh6gpNl7V0KWTNMzr?=
 =?us-ascii?Q?lsQyZcoke+WhqQcu2MTfl1PfghhjDQ3ODV6AfdQBf+kjvLRKRp0tvaeI7t2y?=
 =?us-ascii?Q?4od5hj5zzlGw46xBvt2yDpyvdLyx/SxojUFvYp1Za6OuA37SQ6h4FtSBXEZt?=
 =?us-ascii?Q?oE4a5NhizLVwrVkk10DpRCQCeMunm0aFDEeGaHjKybiHb2PxiIS+JQ90Llat?=
 =?us-ascii?Q?9zLMvVH41Hg7xima6m6C4waO8htpTZpNiKMttkqokkaegL1DUNjF1zywpxPR?=
 =?us-ascii?Q?ZkZ+Q86285CLTbFvKGoFh7KnzULyqpZ8xTbAvAWW71AWP0D9LsK81sLC7TLF?=
 =?us-ascii?Q?IKNhCjyrcipRyvmQw5fOYZj2x+9vUs4MAR4BHxSkuWaRmwm9hBJuXAVMR14Y?=
 =?us-ascii?Q?DfSwf9Mx0MpisuQmUajvfPNum6D4op5buxzBnn9XhLSDHRgnwXFU5qbjoiCO?=
 =?us-ascii?Q?aoSGX6rJw6zqZYX6dzmZaMCuW5M14YSAFJLO6HH2xs/c+rHlvq3v0pjPBRw7?=
 =?us-ascii?Q?ZYudId+uyLgUS65tTJ9tpkxcBz67IDgpqpl0ldZe5ZWRuVtAxv5eEgJhWoYe?=
 =?us-ascii?Q?HRO3ZdcHPqmEOaFVOUaMpN8zoQBuAb/pUSQRDpNktn37QvTBcLFkOvJTwlY8?=
 =?us-ascii?Q?iTmS3z1T8CJQ4UHbCMOUq8+zICbm4RqKxv0Yd+4GA41RpC1utLzX0vsCpPIL?=
 =?us-ascii?Q?AWIzi/HFsDI0YxHg5zArQoCX6+2UNwPr3V51gDBNbEosORe0Yif0xdcVbLVI?=
 =?us-ascii?Q?31Ji/ZtXQ7a1yUmd70uq1Mi7gh1eUTDIbE9SOmM914SGW6+IanoSvbrLAma9?=
 =?us-ascii?Q?boC8XIJDcTaYHkgMUiudH1pFAd8lUJTa3IGGvwoIdGq2jikBprhOd6HN2y2E?=
 =?us-ascii?Q?AXGsawNG5B0veCjMtyMenhNFaN6C8v3yE0iPpjlUjf/tj/IM63GfD+6xPg8I?=
 =?us-ascii?Q?WhrAU9WQbOyNQrJSgcVfy8/SDhBdJeRnL42sMGtRWRgDpqiqMoR7OJmnn9A+?=
 =?us-ascii?Q?yAFJnG+uZKKxB+B7TDoydN9Kz8ezwb2rx2UII8BDrE1reh96V2p3/+z0FGBu?=
 =?us-ascii?Q?Ngo9ZP5gWoT8y3lk7Nt6Qp558o03MkmApOcHz+8b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd734e4-3930-4bda-f170-08dd97064a2d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 18:52:22.8615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xoEl5LnWizZriOdQlsB76bhrj5zvrwH3mVxAYS9beaNFAFTII56MMzwuVmpVTGDO90OXhIWnPsMhq8rwRl2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10799

On Thu, May 15, 2025 at 01:18:58PM +0800, Shengjiu Wang wrote:
> Add wm8962 sound card which connects to sai1.

Add WM8962 codec connected to SAI1 interface. Or
Enable WM8962 audio codec via SAI1.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index ff6e9ac5477f..da08aaa95904 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		enable-active-high;
>  	};
>
> +	reg_audio_pwr: regulator-wm8962-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "audio-pwr";
> +		gpio = <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reserved-memory {
>  		ranges;
>  		#address-cells = <2>;
> @@ -50,6 +59,21 @@ linux,cma {
>  		};
>  	};
>
> +	sound-wm8962 {
> +		compatible = "fsl,imx-audio-wm8962";
> +		audio-codec = <&wm8962>;
> +		audio-cpu = <&sai1>;
> +		audio-routing = "Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"Ext Spk", "SPKOUTL",
> +			"Ext Spk", "SPKOUTR",
> +			"AMIC", "MICBIAS",
> +			"IN3R", "AMIC",
> +			"IN1R", "AMIC";
> +		hp-det-gpio = <&pcal6416_i2c3_u48 14 GPIO_ACTIVE_HIGH>;
> +		model = "wm8962-audio";
> +	};
> +
>  	memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x80000000>;
>  		device_type = "memory";
> @@ -103,6 +127,28 @@ i2c@4 {
>  			reg = <4>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			wm8962: codec@1a {
> +				compatible = "wlf,wm8962";
> +				reg = <0x1a>;
> +				clocks = <&scmi_clk IMX94_CLK_SAI1>;
> +				AVDD-supply = <&reg_audio_pwr>;
> +				CPVDD-supply = <&reg_audio_pwr>;
> +				DBVDD-supply = <&reg_audio_pwr>;
> +				DCVDD-supply = <&reg_audio_pwr>;
> +				gpio-cfg = <
> +					0x0000 /* 0:Default */
> +					0x0000 /* 1:Default */
> +					0x0000 /* 2:FN_DMICCLK */
> +					0x0000 /* 3:Default */
> +					0x0000 /* 4:FN_DMICCDAT */
> +					0x0000 /* 5:Default */
> +				>;
> +				MICVDD-supply = <&reg_audio_pwr>;
> +				PLLVDD-supply = <&reg_audio_pwr>;
> +				SPKVDD1-supply = <&reg_audio_pwr>;
> +				SPKVDD2-supply = <&reg_audio_pwr>;
> +			};
>  		};
>
>  		i2c@5 {
> @@ -128,6 +174,12 @@ pcal6416_i2c3_u171: gpio@21 {
>  				reg = <0x21>;
>  				#gpio-cells = <2>;
>  				gpio-controller;
> +
> +				audio-pwren-hog {
> +					gpios = <12 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-high;
> +				};
>  			};
>  		};
>
> @@ -262,6 +314,23 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +&sai1 {
> +	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX94_CLK_SAI1>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	pinctrl-names = "default";
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &scmi_iomuxc {
>
>  	pinctrl_ioexpander_int2: ioexpanderint2grp {
> @@ -297,6 +366,16 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
>  		>;
>  	};
>
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
> +			IMX94_PAD_SAI1_TXC__SAI1_TX_BCLK	0x31e
> +			IMX94_PAD_SAI1_TXD0__SAI1_TX_DATA0	0x31e
> +			IMX94_PAD_SAI1_RXD0__SAI1_RX_DATA0	0x31e
> +			IMX94_PAD_I2C2_SDA__SAI1_MCLK		0x31e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
> --
> 2.34.1
>
