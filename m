Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DC189F5C;
	Thu, 10 Apr 2025 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298636; cv=fail; b=r3tBzAolCaqkj5wbkElwAMPQ5rkVuhLf+wjqBjamEZC46mpRedSktLUlFlBWXskjMA8Q+xyIoo2GhAwCqhyV+cSOCm9i6T8cmh4SX6NTO+bOkdrMtBuSzm5jMDD8M3w4v7XRkvmt21zj21xPo5alKcqdcXE/Ty23Mgxt/ZO0Q1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298636; c=relaxed/simple;
	bh=aZyo6vWwnpFA5Ptp9yy1atvk44Uk0EgeuLdvDsFSUYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZF4uWVWkj2RcT36V4c3ZcW99x/fn6xKcsIo42rKFRsQ/SOp0NeZxGXSrn6mmgYG0j6jptlqiTIAXUj5ILH/Dzj+PPBhvlcrIPq4FE6w6AU3wwfFTKeln7MtsQ08Utm9kpLPasv96hvYPUog3lTLJ+hWE7w7PVbDLmjp5WFJqwi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NKivaOTq; arc=fail smtp.client-ip=40.107.20.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NKivaOTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMS2YoPdrDWHF+O/KeMeRrCZEZxEtk2zpR9Kd0Fjvii+5pdyHgyyy3r83wzrQQCTfWrZgEcWmaLL3KkOJIsMaKfideKcEYx4TJCtyg4c96or2+ykSkYBNtdjlGcf3K1VgzubL5QAIJOqL9I6/E3X/rBqMJzfp4w0/40kR+2qNoPmncv6pD/HPbWKOhuxCiZsyOrh7fzpevqj53k8ewk0DO/QLqgg2vGCZYRA/Wy+U2IB8hEJXYISooWU8hDVINGejA+o8BBQV7ebeRzxr+cdtMlArQFclsbSR7gWWubMNIXuqV9/14HaFRUVVVD+mF9aY6Scu4QosAZQhFvuNN1I6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07RxJizvuc1Hx8qCh9mdPue8f7vcyW5eWFRIiHF21nU=;
 b=ZxMr1TEGnP4IU6gge8D9Qy5T+vMbV0qxRuVGymIJmh9NPlMqqNVM96ZhvCuZTMe0GaIXDTEwLQSO4kCopUsyOOacqmOHzLn+CazlZbKkHgfDxEI39FND0dsHzBuKgv4QK5hifMIepghZ3+ZbpWuBKCrVbvx6+CiBX17CseQijgkBMwp7e0J0AJdanCIXXYplgTFbXokno1UiknVcYkWNWzIrAH1CQnZ8WrSLOC7IUEzIaOhPFlznYDsKumk0LobCQ0UiQ6uqOrKmQANVxvqnvHY2DWxr8oaZm5sby5/kN305nF+wyBZTxH3D5rcP7WAL/XHXKb/qYmaR78Ok4R0smQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07RxJizvuc1Hx8qCh9mdPue8f7vcyW5eWFRIiHF21nU=;
 b=NKivaOTq6HI4frPtBSmUPgbWESZUf8lmZFq5b21ATI+/QbamO6WGBHsJ8Oj9YjquEOHxSm6q8+uoatlqNINixgrm4KXtO7olvzFSUqwxu5OsAukF0NOolTk1xhDXR3jcyH+VKLndqAh3Fg/pWQh8zanPYiaWwDQreY68fPeS7ML0iyL0CHaQqs8T/FAJ4/evNT2S+rfR/JPhT+eLbaB5CyscQ0WNbat4ts8SvJU5weMbhxuBafIexqVbLLvGhrLzD2oUPBbLrVJfxlR0QbvjAdn0jVRz355I/rVuiixiblDCPjlq9dlop/aVfqSCL/c5trrXqcB1RMTeEqUIai6weQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 15:23:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:23:49 +0000
Date: Thu, 10 Apr 2025 11:23:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
Message-ID: <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-11-primoz.fiser@norik.com>
X-ClientProxiedBy: BY5PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:180::40) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f769f6-a435-49ed-642f-08dd7843b1a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0rZ0B9N0apnJcyq24UqJAxBQi8pm/3+ZEhyRcxjFNTr6Gnx5UblXUNwMnE3a?=
 =?us-ascii?Q?LWf+RC6Bzg+7wxE9MqlwjPxjNXXteL2sRENL6aAPDkTe/1+yOPwT3ZWTXffR?=
 =?us-ascii?Q?yqt9Ab8fNXD2IUMWzesZWz0FJauWiwfX2l7I5H2dAQ9ePlDi5SRkwoYptaja?=
 =?us-ascii?Q?4NTeaYNpsxO+2tnSGEeib1LPSSAd7eUDu/pMCL1fTxk7OrA6JQ3J8+n665CM?=
 =?us-ascii?Q?XbnoSxKCrftwWEt9mrBUme2ufkGFSiw0l2MzS4wvyanP60SfP3m9uhRt4Aw/?=
 =?us-ascii?Q?gjgy4EPim9Sm3AUIFZFSVO7o664zrl6vXVfAg797xLLq15wJK2n45hLZhtwk?=
 =?us-ascii?Q?fPewsVdi7GSNlj40+d5cqwUuyrg27901jKXtmuQxLsC5o0J62lgiBiSYUuCn?=
 =?us-ascii?Q?wa+Pndx/nK+zcDQp9Unsh2Mz4nlMWmWzWhxyETZek1H8/+gWs9KVgNOxxzrR?=
 =?us-ascii?Q?Dw+n8abqoPzrXXsVjGaccyS6t0260hGpk//OIfILP+V0C8aOjhdmD8hFRXK/?=
 =?us-ascii?Q?vd2tMnULBdDcZa66HY1SKKzZOT1NxysopBaKq58Apvj6V7q0J9LbKMmy8e6x?=
 =?us-ascii?Q?mOXV85F2vd01jwpLaWqdTORsQuhdZmJGAnyuopurINNUJWBPY6oQa65JvZxz?=
 =?us-ascii?Q?IDIZUoRc83QMSw6L8enseOyTlXJ0CNvV1e4syNpBgnPaksbb/lVd/mNSDB8X?=
 =?us-ascii?Q?lCHd3cbK+MkUXn9kkPoPN+pXnIUO2G9Izt7x7S/bzCLTniUF/0aCERgd9h3u?=
 =?us-ascii?Q?HbrAJgQ7SDb1Xy3vc5/AgimPVISxKnDRijGuZfyoJ3//Yh0FyBjkV6mTUILH?=
 =?us-ascii?Q?hDGQtmzTl69yM5cMcNXUo7LOBUGm787EMmTBKenWUEwE8LrkXUwv81ND/cGB?=
 =?us-ascii?Q?bO7Z9g0zmQ7dcsuSQpPfurhaamaR6wsVmKV3wxAEnXkhsduOksy+YtcPctDM?=
 =?us-ascii?Q?u+GRxXh3NdH3ayf+vKnhPY+z+dxhtiuCM3JJXKoRToAQcWha4GX3Qzu8q0OV?=
 =?us-ascii?Q?+jkVi95jnx4ns0Pw/Sc/FOq5lPN/poupY+P5FNtTmMzzS7WTQIdT3b+zXTIC?=
 =?us-ascii?Q?wOkyb4t/7jkL25nqQEG94zU9VjYIQCUdknA9xdxWYKyJ7V5KoF45Gr30+q98?=
 =?us-ascii?Q?++wPZ1iylsyI3jePLtE4VbRvCq+/8sU2Znjyny3zxva1nyKrOyMu/x6VFG5R?=
 =?us-ascii?Q?xY8m7PQdf+RGLCveaI/V8l54jhDXVEAtv2f+TKAFI5XrwN+Cs2yJU0p/p9cO?=
 =?us-ascii?Q?6+ab7axLXfnuNvhl92jOvXjdK+W2jX1Kk6XsrlTWnFtokVSMz7ZZKKTh1UxE?=
 =?us-ascii?Q?l7ow9JkxC+cgCHzxJVD5RP68Q2kF/eU5Lp0x+NXImXinbRggXta47Mink8Xh?=
 =?us-ascii?Q?vfj8Mz86Uyn2l4QiFvY1B+x/A0ZhgFr3udOWTmEGJ8mZZk6O/nDSmOIovnhz?=
 =?us-ascii?Q?FVdtPWAd9sX1loG1pvi+BTYNEkeM0sfG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hJIiS2yOgBkNmK6VyQ0fm0P1Vuee6NdrF8fRHmhL8nnyap/j8LK8/Fs1rOZ9?=
 =?us-ascii?Q?ngWnDyt9jgaTIfBquCXjOQlSmwb1bT7cfEEksJt633xhscoW286u5Mt6ti/e?=
 =?us-ascii?Q?nHGTTSr+/mHHo/rWQ0T0iQkg/MOtUujwMBLftpBwxDW0KtxsrzJy8fN8UpFm?=
 =?us-ascii?Q?+pldISOLvp/wY4uEF9M9gL5ws8kbhaROR1bMzV/l9z9Xhi0pe8ppNYf+D8vt?=
 =?us-ascii?Q?F3BDn3JgeYC9qmLr/K/I2ess0yNCyjNovkBND6++xwv4720l4T7XKL690RuO?=
 =?us-ascii?Q?Tyz0QmGR4BPppu0zLtBbuAih0lGfK0SQRBUinHGyC8ETm0++PJV/kduaZG8J?=
 =?us-ascii?Q?IhC8oCIc4j0GBkj3WR7v6dnGYqt63OqmLs+LQol56Zxt+Jeqnf2Ag/C5DDxm?=
 =?us-ascii?Q?STjXTSERyU5NTQWWFKB/CBEeN2hxOIC1Mp10IoUDLecImX35HgjNjBgFjHHX?=
 =?us-ascii?Q?BJUw37+sTlmgS6vo9JK8HUvOE+03itARp+v3tDDSIQgJFHwWoomVcLpay1iR?=
 =?us-ascii?Q?GtEo44sN+Hy7P+xf1UZAK/LavR6VL7V0uCCKx+Nw15TOfXaPw7s+2akRFQmP?=
 =?us-ascii?Q?1NaYYDTvNn32aAwh+O6rgyszxzLigfUVGxI2Oi8ogK2Fw33yfldoyc1IZvkH?=
 =?us-ascii?Q?F5fhlIqAkw07fKxxTZx5EqghISQvPKWHJdR/xSGJvdhHJUhkXhTXk/rJt5+o?=
 =?us-ascii?Q?Y6M3dPGny9SB3TB+IIQqAZrsb+N7v+txMQjHElNnVkKBkHx0GCUHZqi6QfVz?=
 =?us-ascii?Q?9Hs4bqWtw6zPqTWyH/O8P2hwiT+pVyi1mkex++Njf8dT0G2K/ftVtUeZCCev?=
 =?us-ascii?Q?+QcnQa42VK/Cly0nHSwcUl1qGI+xYwhDfjF8Cwqb0LaM3bQOq3ihqAv+APCT?=
 =?us-ascii?Q?ogERZ5hqWgrVOq2Ijfsc27EJTousb4+NRuJC5l5mPCf2djlH3NYgZv1KzaRl?=
 =?us-ascii?Q?EJJPwakyrfIwC7brxRpvJzAQWon3s9/xbJyenfAtS61SjmAeQvuJw5XnUI0s?=
 =?us-ascii?Q?BunBGZ/nJ4IjdeLL/lPCuncHXymPDesO5e8Dw+JRLRq5NmcSY76rD7yhnmBt?=
 =?us-ascii?Q?cH4NTosNpaR9fQOdYH7Ik5TefrVa/a2bxpnae8j5m4h9dl8z43giq1VM57n3?=
 =?us-ascii?Q?2TAltrVh0z/HRjuq5q6H1ug496fSx6CvJNjHKUH5pLVGN1tlEf+Z9VxKpo/b?=
 =?us-ascii?Q?5jsxEaD/flWGOqD5njoHUx3yojEAQz7x8iIsUXs7mNCcNvFUqk9P9Id3QgO1?=
 =?us-ascii?Q?xGQ2MgBtiIDDSxeVoJzR1PcpSOICm9IVxuzTk42E/kVcMIsVqXTtla59VOc6?=
 =?us-ascii?Q?/6WrRWayTDeZ3NmqYKZDAeuGuFVKUQaXbzsqemcVs7shoOxDFQt1vRY/cooI?=
 =?us-ascii?Q?4IkjnUe9zsLGF/MPLwXL0+nF2JhCzueOSHyAgZiAlYyduYaaXvwIEtQHmAhC?=
 =?us-ascii?Q?bLTZm52YZcNlptbDyxQlfpR49CSUw2RSPQVaHM0FvTthyc4k0REbmDVK7CGb?=
 =?us-ascii?Q?ownck7Yyn3JUHqcQdraeBrTLPvHrkh8Jt+uF8utGXWwP7v6N508NGyq64iJI?=
 =?us-ascii?Q?6O95fA2KECS2b2V1XDnFM0TaXDVv9A/eEQwpD3X9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f769f6-a435-49ed-642f-08dd7843b1a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:23:49.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXtKekgIKKFxgKUZLw0/tSDh7Is4TXgxuW1LJ6KyTGf/g7ofzw8w1dKluOAZkGITYCgOMAQEs6M2gM7z5WEi5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transceiver
> chip.

Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy instead
of use hacked regulator-flexcan1-en.

Frank

>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../dts/freescale/imx93-phyboard-segin.dts    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 38b89398e646..027a34dbaf04 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -26,6 +26,17 @@ chosen {
>  		stdout-path = &lpuart1;
>  	};
>
> +	reg_flexcan1_en: regulator-flexcan1-en {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_flexcan1_en>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "CAN1_EN";
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		enable-active-high;
> @@ -38,6 +49,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  	};
>  };
>
> +/* CAN */
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	xceiver-supply = <&reg_flexcan1_en>;
> +	status = "okay";
> +};
> +
>  /* I2C2 */
>  &lpi2c2 {
>  	clock-frequency = <400000>;
> @@ -79,6 +98,19 @@ &usdhc2 {
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
> +	pinctrl_reg_flexcan1_en: regflexcan1engrp {
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
