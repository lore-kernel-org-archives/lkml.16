Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C6285CA1;
	Fri,  4 Jul 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622491; cv=fail; b=g5JrhjTzlGFXBagdPoc43N4T8DUdrLj6W7MqHfDGJNPj6/VWQbrvVvMvedQ7hmU6YlQCZxjrinuswXxU/DimvJ18o/Z37Wg0iymOcRCB8IUBWHwPe3deHFW8K1EQtrWNOg40IvjIhYOCh33uQXP7iF1fNcIwpOLvtlpPfprUFQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622491; c=relaxed/simple;
	bh=b0TxSsPHoPPkNNLWR+XbQgxt1f/kIV5870uNJTptg5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OT3QvQyJRGgJxot4Pc4LWwltLZGHMrXHqvtc5dw+ud86SBLF31hE9eCxj8MJyGiaVGCZjDSGDKLHfYKaTY2sd5NrxhL8Dhp1fdo22AQYmyVqVT1aLeu+knt7ArJyBJEdgwEaMUwe0xzdvMTfutF00hh47+Z0bunrxTcVcqVgDrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ghJNlC1F; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ghJNlC1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrZKV2rp9Z5lNA7jRuig+Wbregl8xgv3tXyy47XZNkINPCv6aGs5z1EJvlWXtRDuVeB0i6u33nPd9mZqzL+xhFKxHdLkyRb8aVIUzUgWK2rC+2gw60MZ5N3D77gnZO4g/vd44Rt3+nTUhgwstrI24GEMD/kWwdiCBocZeYFouUlfp6mC3NkxgXtsqWXCB9QKMkFKZ0/qLGgGPDxhuVLTu/WfNjitL7ltkj7FXTEiRrb+sJ4F8jf+WbI/JZlbpWPB+dJjkNB53FKJwfkMZslf92s9Ny1gZiWb/cASUWe2SA9U9YE99B0FJ1ndV0ESkwnfxz8fL/stSuDtyEtDTtus4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnqfseEf4BZQXBJsHUoys8iQAAUNuS05EoOEzgBtT6E=;
 b=yibBwOUdyNfZA85HptECV47kPqqyFrw6yB5JILtytLCvvpYOxQa+9NfvUCUzgaShORxqFkfqoduNuiPasBq8pOp4M9NdRtTkJuTdSH7ni2KiNRSh5RnDqvnNcMQpTrS0RiY4HDjUSESpsPTkL7Q0YwB5FPSyJ2JDOT3FXo61N+VwFn4JvYiMQPDz8Mjp+KaN6N3LydDiqZ6rsMhdnDJd+k1XNsUWLCpFqvnjrFJCBXs9TcuBh2OOzd8+wtF5P+Un6srNZDLCk5po8qYlznrEY9T7Aqsi6QYC1J20IYeyUGqk49Wl0B7/0R4cAumPUNNnlaUiiVeCWgDEtYdWN7mDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnqfseEf4BZQXBJsHUoys8iQAAUNuS05EoOEzgBtT6E=;
 b=ghJNlC1FfnlyvEsRL0XrVo2xAd9cNyCNEMCf+iUa395yclYyKN+FgGa0j7up7NhBaCB8znX1u6dMXgXlYZPojYI0Hb9y59PEVteXA5teHHfKqFHIEvxDrx+2oEWfADNJbVGtpYjbjWdsfc7pH2vykcDWMPWXWQ7/E8Y8EX1NEZbIFbJWz59pKYRdK9mL6Y3fuzDiB4Os3pR0mmRfa9j2IAoLQm5cII+buSHKnHAdjLlgJ8aiNLCRClpoH0bpdi0sNxCyrlKuCVbdvJjLTCFPYA1lKwbhBAOR4j2SxXs6qv/6bX36JI7miBbi6MolttArzY1X/ZsOzy62/HB1URBpEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:48:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:48:04 +0000
Date: Fri, 4 Jul 2025 17:43:09 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>, 
	Ionut Vicovan <Ionut.Vicovan@nxp.com>, Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: s32g: Add USB device tree information
 for s32g2/s32g3
Message-ID: <u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
 <e3e5041e-254d-44c3-b645-532d4d7a8f9e@sabinyo.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3e5041e-254d-44c3-b645-532d4d7a8f9e@sabinyo.mountain>
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d8a905-b0c6-4979-4a31-08ddbadfdf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VUkxvgmHohW1J//XbZCeH/n/76MnnZLZF+lEV1BqmGtSpn/ii51567BUoVlt?=
 =?us-ascii?Q?zYPBHsC+nTwTUmp7ElgyUhE0uTAFkVoegPvL7CQ18by0YnDf33vmzRRgIeMy?=
 =?us-ascii?Q?AXTGuqzbl4STvAP7N30s6PQjkb6/jXGR3uLTvb+zhSGSuthfkF96r8GOqWOd?=
 =?us-ascii?Q?kcnJ3RvzXU+T0YIzYH3WYCKQOdTidIVv3d+SHgjwNxEPu0KYjdyET7ceJJaL?=
 =?us-ascii?Q?8qXU3td+a99CNxX37IQcxWktJ/ZKl9e+n7IA/khgQ0sG9U+vUNTdStf/7E8h?=
 =?us-ascii?Q?XipR+dga2T7NIV15cjipOMzygf+Xj9xPlzpwqHovBk0L/1dcRkku5STBrhyv?=
 =?us-ascii?Q?wEbvQyQN+h477a5Coz8W/4DnIb5VhprH5CV7Ast7pkmqBOnA1TqICLkQVnzY?=
 =?us-ascii?Q?MVZGpyvdP2UwCAWVqlwnmByzDqmvpbfONdE3rX41ERwf3tldjKSVnx014OYm?=
 =?us-ascii?Q?U6qyNt6Ak+2n9eNQruyifNEppNdO97UFFwsVQ9VSYwRNmchWKdcjiEy7IEC5?=
 =?us-ascii?Q?2R1RWmjVzbau7E0X5nMXfuY4S7ozCGr5vvhJrFhJPQyV3Tpv3xLwoXgaWUEO?=
 =?us-ascii?Q?CZDo+XCuFgHX34Fs3td+silexhbHK4xYt2YDc4kQSDeVelwaqMpz8dkIAPgs?=
 =?us-ascii?Q?6VDS1+BE+l/QdyD4flDNdNA6YELUI0JTDKRCPeN5JubRVQZeH7irzLOwdWB/?=
 =?us-ascii?Q?uDC+BcCGZrwaSXV9HqChtk3HecFlwnR6OCrKY2SglZJgsVZMxgr23A94hcaJ?=
 =?us-ascii?Q?mYS1K68iDg82ugt2cC1eR+n3V924IpfKx5sq1LekL6723UkN8l1qmFCAnvWX?=
 =?us-ascii?Q?1pr/8C8LUaJC1tpBYW6I2mka2MCA0R1f8EpCJxQ/N573lgjFCicLmsLVsiet?=
 =?us-ascii?Q?ZW9nG+dhsWWfkq97tdL6Eu5en2zrUcMQ+sEi5chfg/eGNoM+6ZaSsGFd5li3?=
 =?us-ascii?Q?7bIbfs+14kxOpXgGCREmKxVwebd2ltqV3A35rw+bNj/OV4+Btj21bNqg+hy9?=
 =?us-ascii?Q?6DcHVVsvkv4bUd4UMpU9XJgBd6ViU9d2Oqh1bL4/TrWkSiPIJO4tGzPxE/Wu?=
 =?us-ascii?Q?lnU3VeUOjaBz4Y5lXupuD3HPfxq/EuhB5ZhgoKRKjkVCjLnIq1SxdTy/1nLP?=
 =?us-ascii?Q?cUMKMrZEbnDu3rvQKzln1WeWEn90DMWLZg/nesi7lwiGUvOxeI5VH5sDjyNY?=
 =?us-ascii?Q?kJUt4daP+nENmga5/+YUS6LClStEDMWfAg0bY/Og2ZPAYP/6jlDnQcTH9yAs?=
 =?us-ascii?Q?B4sZL3gq8Wl3CDoSc8iNf41zcxjZTm2n/3dsJL32q++GWPU5B9yatZZKFNve?=
 =?us-ascii?Q?KqWg2j6VEM74d/279mSI5d++ra+OdeUrYCYemtVLgA5oXvTWVH7YNLcGU8zI?=
 =?us-ascii?Q?zuFL/Vt1vBhf7TG2744NEc4Prk4cJZreHO7s1Fp2HCptxdPtvZAVnEXHg/P4?=
 =?us-ascii?Q?ZKwjtF/L1KRsS8E8u8Btz2bBPgRwLwn6HaCplF8PniFQ0vx9PTk7gzR1zxs+?=
 =?us-ascii?Q?PGsjRnImECeN/Hg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ovLaZqtI7dj+4nBaCih5C1TAiRzWmYJZ4QsAgy34LQErrpJBS4VjA4BUBvym?=
 =?us-ascii?Q?qWn0YCoObRvgkhGNsN4rc4WUx6pa4YYfcnR2OMZm/7T7p+XBRrPRpDfMyX/E?=
 =?us-ascii?Q?53Mjh92LUzBSZ92AGINwkJdJfemuuShdRnplkAEphPB92C1U7gAYDwRnKMMu?=
 =?us-ascii?Q?BWHvZVbuNrt9YRVBIhKKANbQXkWv+2Z0tFtq8F6vS+I8fq9ZeV+HBg5Om+ho?=
 =?us-ascii?Q?rEUt40q/MHOCgEJ1ZA6Vg9hdTrjEC1w6lxBTHP6CV57KL/kFb66Lqb2ARsdj?=
 =?us-ascii?Q?rWLdKrqGm8+i+iJjyFoUZGnhZDNglGWFLioVcplDVIsa7z0RAGJ6Znk/xyW4?=
 =?us-ascii?Q?FTO1zMFubF+gdAY8fgvpZYv7A5uqG4pKkjZdCqEjp288pkx8YcKGt+RVJJHK?=
 =?us-ascii?Q?KnGug1iC5On0YjhI9/BcUgWMPZ7hkarxn3x4HjCreHYTAhMIXI5yLhMz5t2y?=
 =?us-ascii?Q?Z3bWuFoDYJ9aPjw3ebAs8dFA/zfOYNOVUMhgg8GHj1ezMiCNIaQpRLWLyq18?=
 =?us-ascii?Q?8xjssdxFfRekB9HSOr0xmubTH2oCVM9EEAWl2sFetNhs3AzgE6eWQ26asaCt?=
 =?us-ascii?Q?o7q2VWAHlXE14o9glIMLzLsecz9BgmHeYqfVFke0JcAZViAWOKrvoQA/cdct?=
 =?us-ascii?Q?8Xe22OMuZjaTOqP7zulOmBGlbdypTnRnqwsNvlKHe902PrsnC3FpqnOxdQXx?=
 =?us-ascii?Q?EsIeNpaZ1NKOl38xINOwsQz+nmKwuKqRqdL6HHSgrkLIwbMhRcQLRNUgfqcn?=
 =?us-ascii?Q?uy9sXaui4wDnjWg5eRMl7rv2jTSFv3q0Y3yajLt5fE/kD+vp8hto+kSOzoQY?=
 =?us-ascii?Q?CeJq3cUg+WnTkLg8ZP2BEqfx0mWJv3kzWYjH+tDszOzb5rRNja+xApnOmpCB?=
 =?us-ascii?Q?tg754EDexDVlhP5l4wGDMc3ObIsZKInPCTARwPGAiPdI0LUMZyoqSGsOjNQG?=
 =?us-ascii?Q?TmMT6ImJh7AcVFv6qN7VWDy5ZbmJmOZOIi3QIYZmecMM7n/aOhEZsfcCZ0Jh?=
 =?us-ascii?Q?k0Hm7ZL29z9hvzvBZDPoxivhZhDTP+Z0g06vajNAWdyDe8LxEM/xhX02NeKb?=
 =?us-ascii?Q?fAVk8dSNU9tUlyOCdsHaubPmw/viBcMkkuaAXn6O59pWh9Cvoa4sk37IgCz+?=
 =?us-ascii?Q?h2dZ4rdFO5VEJ1/wHLjh0ONAJPabHZETD05ihil/drW7+8ABTE/n4lhYOsH0?=
 =?us-ascii?Q?ptwZ6/s5BqYcPxB+jGyfkVUgn16UIeM6drM+qJYmYBo2an2LHchRykZ6yJIG?=
 =?us-ascii?Q?fmS//q61NXdft8bzhYJrQxJl906j23dR541u8MR5xo3ShyRGk/0VNuvyw7Jy?=
 =?us-ascii?Q?h9vww3li3I9kqfq0mKvsFB5x1jiVbgUqgOELsgfgBbKcPVPgFk1oL4uBOcS4?=
 =?us-ascii?Q?0uocSIBjnOgeT2Tm6esEhuVSSmQWo/tltOaErAP7H1dDzRStWhszSnRZ1r/R?=
 =?us-ascii?Q?LKGBea7Q9u6j5+qjVU2SN8/bP/3BJJJ3CA0X6f1Odtgp80ey9hiRIRJAFx3p?=
 =?us-ascii?Q?aUgLI815nwHl5sZivUwsXwm1qQseMOztmK/QZJQ4ui+liDAthzp4uFcwjF7j?=
 =?us-ascii?Q?39hWEHP7/+BhyxAKLvhrnC6Zvec60OI8RB9e2Hoj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d8a905-b0c6-4979-4a31-08ddbadfdf33
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:48:04.4491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5uqCF03qrWKdkfhkl4Up0vSssfkgpt73hc84uKff2JjjZM3MMXYalj/HOAfCcGqGT3bF+Dd1ypOlOeufRndlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269

Hi Dan Carpenter,

On Thu, Jul 03, 2025 at 08:20:44PM -0500, Dan Carpenter wrote:
> This adds the USB support for the s32g2 and s32g3 SoCs.

./scripts/checkpatch.pl --strict report many errors and warnings:

ERROR: code indent should use tabs where possible
#63: FILE: arch/arm64/boot/dts/freescale/s32g3.dtsi:444:
+                usbotg: usb@44064000 {$

ERROR: code indent should use tabs where possible
#64: FILE: arch/arm64/boot/dts/freescale/s32g3.dtsi:445:
+                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";$

WARNING: please, no spaces at the start of a line
#64: FILE: arch/arm64/boot/dts/freescale/s32g3.dtsi:445:
+                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";$

...

Refer to:
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#indentation-and-wrapping

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v3: New patch
> 
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 23 +++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 23 +++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index ea1456d361a3..4be6534ed01d 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -376,6 +376,29 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>  
> +		usbmisc: usbmisc@44064200 {
> +			#index-cells = <1>;
> +			compatible = "nxp,s32g2-usbmisc";

The "compatible" property should be the first one. And the property order
in other nodes need to be optimized. Refer to:
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

> +			reg = <0x44064200 0x200>;
> +		};
> +
> +		usbotg: usb@44064000 {
> +			compatible = "nxp,s32g2-usb";
> +			reg = <0x44064000 0x200>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> +					 <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> +			clocks = <&clks 94>, <&clks 95>;
> +			fsl,usbmisc = <&usbmisc 0>;
> +			ahb-burst-config = <0x3>;
> +			tx-burst-size-dword = <0x10>;
> +			rx-burst-size-dword = <0x10>;
> +			phy_type = "ulpi";
> +			dr_mode = "host";
> +			maximum-speed = "high-speed";
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@401e4000 {
>  			compatible = "nxp,s32g2-i2c";
>  			reg = <0x401e4000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 991dbfbfa203..191d2dab4254 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -435,6 +435,29 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>  
> +		usbmisc: usbmisc@44064200 {
> +			#index-cells = <1>;
> +			compatible = "nxp,s32g3-usbmisc";
> +			reg = <0x44064200 0x200>;
> +		};
> +
> +                usbotg: usb@44064000 {
> +                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
> +                        reg = <0x44064000 0x200>;
> +                        interrupt-parent = <&gic>;
> +                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> +                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> +                        clocks = <&clks 94>, <&clks 95>;
> +                        fsl,usbmisc = <&usbmisc 0>;
> +                        ahb-burst-config = <0x3>;
> +                        tx-burst-size-dword = <0x10>;
> +                        rx-burst-size-dword = <0x10>;
> +                        phy_type = "ulpi";
> +                        dr_mode = "host";
> +                        maximum-speed = "high-speed";
> +                        status = "disabled";
> +                };
> +
>  		i2c0: i2c@401e4000 {
>  			compatible = "nxp,s32g3-i2c",
>  				     "nxp,s32g2-i2c";
> -- 
> 2.47.2
> 
