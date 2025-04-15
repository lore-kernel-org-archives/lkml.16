Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D822D4E7;
	Tue, 15 Apr 2025 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742709; cv=fail; b=id2zrb2QgXwJKHdegkT+Y451Od6vzC48hD+oiwAu0OEq/ke5QNfoDUa+TnK9tLeZYED3KKjSrTaLKLPDeVzLxvkxKZ2JzQmAF2GEOTgcmKUc+B3R+Z35NRuGJrGaMlOOSA0oG47xqxqfSRg96ox5DFmmIclWPyGCyRKfAPp5ksA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742709; c=relaxed/simple;
	bh=TAK++ilXK9GWrFx8G8VtAxxvi/hza0NvlnDhNOCVgY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ov2uxcvlB4AsECTnTniJVG2l8nmriVNzkXfrPPhSvGLO7JY9DoOGLiNN+UAwQRgHug85eqBYfy5E33SuyQkWhMCVtQ+4PqVFbOW4cct6sARCnKoZR33FHY+mUFro8zdBWy+iyLZnPVMpxzU/h6fThbnTf25HjtHPtQV5PN0sn28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UgNGLpRk; arc=fail smtp.client-ip=52.101.70.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UgNGLpRk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3XiAoP/Yz2Hb5pPXtX40k1vk+dYmeh3yyYFyflCGZfBVf+4W/PRoejSmJpnOd4KzN74Ls95YvnFzi//eFuCSjAPH4hw4ze5lZQNNgjC+NRYVSe43J1vjxyuKvKrUGMPnbk2W8pE4CY3AxbklG59KHeZ1iMnJVgDykRlzyL4fmxKBzat+4p0yNLNzE3gj5ifk6kwVzQLC/kU9pLHxItz82sUmjb9bBp8jsLtMcntQX5+M7K1AdlSbmdmxsP7itc0BVTNLxm3BiSsvzSlkTw6wfD24MYDzNJdYmCFlsTih94HzWKUcMK326Fy7Yabx1vku47r9coJpoDSZ5Ab2m4BKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNyRsxOkuoyF7r44UXeLL2ieDG7lHGACCd5UVbzURQY=;
 b=JR4JSmJjdXg3WGfdlearab9FOnGLr95DcYw5+77KEs7qJlYFHNvI6X0Cu1+6CQ9CDXooOKKbW3Ori+ycx3ee8WG5foF5AgFDPHEUArPqUh6IkK9T23ccianhCCivgK/Z3jM7JYXBAKrieLwyGIpzcAEcE1GySuC+PXaMh+12+Ym+t2SjmCOs8SGtWb1jQ5RyEflSKd6gvzPMeur6O1NgFlg3hCxdo5G5cpwzRLaX2yBt6tnlUy2hzBUdKQTiC/V6nnQkrbnvRVk+66dprnVHAB1jqEggzHSBMWjjFJFNLRHp2lXoK5FVqUyzLXYXKydwRXcKy/dkzAYb5rTe/L/jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNyRsxOkuoyF7r44UXeLL2ieDG7lHGACCd5UVbzURQY=;
 b=UgNGLpRkvl1/Pda7wLpIkT+Nzfmk6jtiVB0obo5+HQDT4ENsr8sokpFf1Z4lfrB9ygj0OsJofYBjn29NzIaao7KApr7UJGSUzvnftpWSE2kdGeK9hpSiZzJfIdYowr0XMPKC5XjlonwnRm5v/O2X5aWTPmwhiXyB2q47zWmLJWPgy2+F++JkQYa02j2tm5un5IEpSaHPDmMjCJhBHViWVnWqsIY7Kj4pEvYYmtrBdzoMYH0G+o/ExwotXWt+z14nIzz80+ipYhNXLf/tUXO1nFEl6k7Am7ACHfzkn/LUfYW4kBYfg6YWArZGh3Xpe3aVX32mPiZvVvcRnAzsRSQwHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10447.eurprd04.prod.outlook.com (2603:10a6:102:413::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 18:45:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:45:04 +0000
Date: Tue, 15 Apr 2025 14:44:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 11/15] arm64: dts: freescale: imx93-phyboard-segin:
 Add CAN support
Message-ID: <Z/6pJ62He5TBLVlI@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-12-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-12-primoz.fiser@norik.com>
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10447:EE_
X-MS-Office365-Filtering-Correlation-Id: b7952ac7-098b-4b3d-c23e-08dd7c4da24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iAc3gquWufpYtnJGG6C7qIZHA7SklUP6aA3GYT/LRgc57K8+kzVKjmQ5srft?=
 =?us-ascii?Q?xYXL9h//BSxrSqithnkGWKBLeKsnIwmOPcpBGLGqUP/qI9aa3q7x92WP2Un+?=
 =?us-ascii?Q?d9GlzFjeGoD7tkz8x6PuxN6ExUqqmqFIxwmGo+DhC6EDvlQKvKl5eEuePeUq?=
 =?us-ascii?Q?BXstcYfNpCLICe3tEPKeftRbzC7L00gYumCcbvEq2bJiw3N9bfi1Buz67WSU?=
 =?us-ascii?Q?9V4NvTixlc5c646ZHfRS1KXVEZXSnInYCxtIMWTdn+HdVtKxWm4K9ry7q2hk?=
 =?us-ascii?Q?WNXGVWywtiN0cnWR0s6cFl0+OW1hQGaDeak+QSlqKmVIBg3Zww9obrHum2kX?=
 =?us-ascii?Q?n495IaCmsx0I1f1jyzQ4UfTee4OXc/sCsfCMbblCjYFH/HZ6JPH1w7ez1KOb?=
 =?us-ascii?Q?T5qJQMt51G5NZRhNrk7dJGDBsSLr7PgehfMzXqg11UQppQl6A5Qdfdsk5Gnl?=
 =?us-ascii?Q?aT0X48yxNRbZ2KNm3QW+28PHBUTJcG/Wd25QIAoqVnnOJ6R50/QD3iMkLW2b?=
 =?us-ascii?Q?cs62qz407piXpucFuOkHMR0+w49wXWj6ghcC6rfztt+C7ouMzlhMF8HHTwKb?=
 =?us-ascii?Q?gJ/RETgvZQ6MakzVGLNlbYKRKRWW6e4ys6WTkR6Opu0o/Zh0a85z1MiiyipV?=
 =?us-ascii?Q?k6z3b8ssRa8+AtRpXgRpPkmmF7obXat+ok3JT7BNwmZmlmSK+QFtZ1lTSqjd?=
 =?us-ascii?Q?qD0ggfzRdXwr0LJafUdlXX7u9n5TIR1qbXuuSxuyI9ixHQ+t7l5oQPL+8xR1?=
 =?us-ascii?Q?rAvw8+AvEZoOiuQoSJvYDogkxIjM0OvkAuFoPyWRhOYYvWnb+Qyf5qDBvKxj?=
 =?us-ascii?Q?+mkIKafcaE2lTg94/Y/ouzj+viERYOgZjmRomXINnqapxfUovtvHQ/Kw23gh?=
 =?us-ascii?Q?W3VpuXDzaiCiJ7j7V1kPTXjzkT0u9z0kxgdupHuBlUNrZtSbRtn6Fgd4bvZo?=
 =?us-ascii?Q?WkmKERG8Q3IB+MOtnYdorEkQWiRDC08I+nXpuPx8wGf/eWWFalat+sg9/aKT?=
 =?us-ascii?Q?ZeH/3W8FHYanrYsFPU6IhPAq9DiskJPanYrVCm+EcIKFogGngvl64zoBF28T?=
 =?us-ascii?Q?LG79H3jMQgxTDJ4STn+ZCQV7ZtXtLjFrbNlWLdjc6v7LsPh7pK6ohChGPYxO?=
 =?us-ascii?Q?F73sqbGIAAT0dpqzBAQyD1SbtJamH1Yc+qwAJLQJ+ElpLnlR8A/drg3ZQkej?=
 =?us-ascii?Q?hBa6chMg5tfWXpps0G1JtphGmrjQxGq1ZkqgJ4Ifg+BV5U6G9Cs8jB/K2ThP?=
 =?us-ascii?Q?4cOj4taRQtuRHcanzvQNqVbXa3tQYPe2bg29VNC47i9Pr6v9j1FcI+cCIW4i?=
 =?us-ascii?Q?zpnoNRzl5zDvOcsGLRipHVf1PTHnAPNyzhHfHKI77ynNo/BLxE2OUR93KuFr?=
 =?us-ascii?Q?ArxBB2Ub7S9AQaVmqLGUPEBl9dY+hrf659LSeD69jd4ANEnHnd8ObY9zS32a?=
 =?us-ascii?Q?+k+sSuyANdR8oX84B0Zxbu1Yq0/2TmY608OBiENGDRCjPIMl/mMvRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rH9E+sNR+5rfG0Livchksbr3fFocKrbzY4de9AYKK+WmnFx3VJqL6oNqkbNm?=
 =?us-ascii?Q?Rx/pJuDi+vbja1V4AR3JBCcwnYfMLHAnKXVjXGjyuHXJEToptYlE5RjgJU6l?=
 =?us-ascii?Q?Syo0bheZU0ByntJRGy+zXkpU9H0M/WN2SWBoXl1N1AqaMWeKdvFI55NE6PTo?=
 =?us-ascii?Q?hm7MFComcqgNH8JZxwi1l01Hs6Sejk8caOyIgvmIuERhbW1Rbg4zBfSiW/DS?=
 =?us-ascii?Q?IE/GTb5mETpgJnZt09vWUpDWOtNvvNhoeUWskABRoHW1Te2AjXvquHxi3gwo?=
 =?us-ascii?Q?oHY8AiVjhq+kiUc3ukES5J/H4b8Dt2tGNKSCzsqAto8XM4m0yTOYizoYeOm7?=
 =?us-ascii?Q?kuxUZLWW59d4XckGhGIg1hymHDFWdZW9WXRNVSkXwUnp7HACP7QqLccshORH?=
 =?us-ascii?Q?5RPKeeCz+Z/s9KO6cO98s2mGRxcmmccBXMciB2+VLS+rBWLcbvbuhb/vWPW3?=
 =?us-ascii?Q?bDEzPsas8gUAIbQO7RmgbJOJ3NFvfOeTnqa7ZcIGIf75KgH5+wPr3cvyLbMg?=
 =?us-ascii?Q?9Dpqzsqp45NV7KTFa3tnUonrRnX16ElRyh/6fn93chcuEo2ODVf/TEq1J6Er?=
 =?us-ascii?Q?XILt+Q8ueWYtiFARHvX//ApX6AUbDHocchivUYoI6XUtNi0ObKEU959ribbE?=
 =?us-ascii?Q?52junZvzMSO1jaSq7dcf/lElmWF9Wby6A1x4170jaxFd4pa4wXBbNUqH1fjo?=
 =?us-ascii?Q?ItwavFyDFN3y4au5AOi/gbCPliZY/FXmr2z3lteI6EtX5qmjkGXCfAa2bxbp?=
 =?us-ascii?Q?zWp2ikaN2JZuF63Rs6pWoAHEAgcn7reJC2PcW+SfXh1i9wzq4lS7u6L+NxSU?=
 =?us-ascii?Q?+IKmOXttVsp/nDgWdvgsTZDOFYXK8yLyXSw13m71jVaeypVHGYPVLKc0yVv0?=
 =?us-ascii?Q?gUGt89ck2GY634/A0+173QqX5F2pIEL80AE87KpSCa//M8llkoz83EtdhUY7?=
 =?us-ascii?Q?rAWzRhLg64dZLaL3bopewcgL5bVxy/pFfkWeiDGSqwoksuKUatBVDCNgkdC+?=
 =?us-ascii?Q?5OSDLEOcgvVxYxrfQxGHUA+ToMhm7vSdeztaMAM662eqUWHJfAxtPUmofHR/?=
 =?us-ascii?Q?KxO7NOIpQXizXQWc9lmYAUV7B8d/rxEJxvutuETr46pipo9FsQmA5R+MPc+G?=
 =?us-ascii?Q?PizGqXHR2tfxblBFycTYRzjde7v/ihsvbS7ioK7GKhpBcDfbYHD6jw3MI9Cg?=
 =?us-ascii?Q?bg6GzbT+f1f1H9AyYSe3bwQ5lFsdZv1T3ams1IhZMk4AlZM6f1vczyBBZaJJ?=
 =?us-ascii?Q?wjvbQnl6DFhkD4TslN2PGNtrUZLaVWP1cu5uJ3dXC57VRDfLELPwviXQZKUG?=
 =?us-ascii?Q?F7l5Qv/YkutnfA0xrhoFe9nHclQMdQaIBPj9qX13W6hngxVPmUUxNH/y7M3u?=
 =?us-ascii?Q?u1jULd9/+tZmeEBnDO6wnecwT/J4p27HeUPMOVWGAWlb9eD1za3yOBjcvWdK?=
 =?us-ascii?Q?bmePoaKRnCeKQayogglsTyRERmK73blrd4h2gTTISd9MSd/OUisYX4tmR5Kt?=
 =?us-ascii?Q?sdtlhVGPlqrla24NlpQ9nUGO/jMIIwfFXKrSdp3bHISSodOSzFrmEMzoPvId?=
 =?us-ascii?Q?8oYdkGPo/4lvcujM/dTqiLoRecLXKeKY5Ul5bMUX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7952ac7-098b-4b3d-c23e-08dd7c4da24d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:45:03.9740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyNOuclRHC6PgNVH8VOZjFe6ZTd9lx+1zWiJvRpN7Mbs9ZbF4tiSJzzKxKJajwgEiXwgGMd0K/x9unWiMK+PHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10447

On Tue, Apr 15, 2025 at 06:33:07AM +0200, Primoz Fiser wrote:
> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
> interface. The CAN PHY chip SN65HVD234D used on the board is compatible
> with the TCAN1043 driver using the generic "can-transceiver-phy" and is
> capable of up to 1Mbps data rate.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - drop CAN regulator hack in favor or "can-transceiver-phy" mechanism
> - reword commit message
>
>  .../dts/freescale/imx93-phyboard-segin.dts    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 38b89398e646..be9c0a436734 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -26,6 +26,15 @@ chosen {
>  		stdout-path = &lpuart1;
>  	};
>
> +	flexcan1_tc: can-phy0 {
> +		compatible = "ti,tcan1043";
> +		#phy-cells = <0>;
> +		max-bitrate = <1000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_flexcan1_tc>;
> +		enable-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		enable-active-high;
> @@ -38,6 +47,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  	};
>  };
>
> +/* CAN */
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	phys = <&flexcan1_tc>;
> +	status = "okay";
> +};
> +
>  /* I2C2 */
>  &lpi2c2 {
>  	clock-frequency = <400000>;
> @@ -79,6 +96,19 @@ &usdhc2 {
>  };
>
>  &iomuxc {
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
> +			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1_tc: flexcan1tcgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_TD3__GPIO4_IO16		0x31e
> +		>;
> +	};
> +
>  	pinctrl_lpi2c2: lpi2c2grp {
>  		fsl,pins = <
>  			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
> --
> 2.34.1
>
