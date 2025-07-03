Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D22EA469;
	Thu,  3 Jul 2025 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552984; cv=fail; b=apF08BU5ySHjewhA0iQH+eRIRoFDi9IgXxmE/fDKFoxakIQF9YOlyzThkuD29KFWVwutEdeijmvRJBIBBTNX3InykodlBprB/IjmFJoG/srCA9qISZd+tmIyLVV2VXUeZtKakbB36TcRgYV5fXYu6e8kLkn9V+qnDeFxIY+ZvzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552984; c=relaxed/simple;
	bh=FO6dLBCuDRaqgbk7CIfI4jklHAZ4hhqoxSEDFzjxNmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lthiIoG1QeEWELsEFCfn362Or5+/oxvIAxDqmm7sewhu2gO1aE++knP1FPh9TCiaOyDNg7TukL6W7czD1m7FxDPWbClKIgdDGi7PyWRED+zK/MPJbfKxPvQiEMDT8unzolKIzFSmnWF5grWy5l9/gh75kB6o1W+ywslcRrd7Xl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HrhQDw7r; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HrhQDw7r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXsGHdVH56vl3Tx8lO1qocmH3k2G55utXXd4FFpY4jU3HgyfVsUd3e6rWiNCS7ukAepIQ1OPcxRb94RGYa1TRVayVq9DwtT2UpXfdJTt2B27nZtv824rUbrbbVF+wbyYBlUmbZpoph8qpeUUAQVXEK6diZB9PcXMgPiW9XuQUVesxnto+HRAc8xyy72FRY3pIiJi/F1FMl702NDoBxr/+7bC1f0t8K0eizJk8zYWTCCkBFnIFOzNQ6E+bRrHlXh2/rTse1jYotlfNtA85e4UBdjQSTgNughKlkIFdwAmGT307/ztsD8dhlhZkT7mOKUWVg/kDdCnVLlcUIHiXi/QLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVbbYnJ6RNl9Jhp23w0RwDUo2QkyTt3hVtP84w/hwCw=;
 b=Gh3DXQp+aDQIu62rr0kbQhvL/e0U75eP6oVylg4+cELZT1Mb1sprrwCm0iyrBYFD0Rk8eMTRBSxMtpFipllNODUff7t2Voad02Lbrc5wnTAxPMgzfIRKs7QYgPqL5r33/unQ8ESuZTfXFg8jDwCyiI6KOUsUploysDk9oVtLmW/uWZ7ssryMrf8iuuaJDo5sf1UFoLKR/Qmc6NQY68CMc/BPB3ZkmWIDKgmKtuW7KxYVffQqGLkx499waEikqDk5Lanr0PTL5ucBvxd9CH3IWk1zHv5iFhRMuQfT25KASpk1NKracod775UsLPB3kgxozJByYLdIwKCb8pPLBqOjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVbbYnJ6RNl9Jhp23w0RwDUo2QkyTt3hVtP84w/hwCw=;
 b=HrhQDw7rg2m1nKAGceI4C0IL9bNJPoW5e8Az03uzJZ4zHT/icRcp++sX0rfnBLvqx0bG+bswkmbQiL4g/e3b8r592nCfamq3k+9zdmnTOqGvUqOzjtF5RsT5SJHJMDTOxoCkVgLOcbUbqMatUf50DI8mOawRbblrnXBJlGIMF3+DsoozFQig3rJoLspdNiyhDUDoldDAMFkkDwO2DUSG3VASjELf0P+uLwf2sqMCyUja/lzlXxsI6xcauFvugUQzLcIKsBeMoPKOO7knPe6g04xddQEEXKxWC37VjeMkkNFpvDvntoscKnHRJSBIezLIMVB3Ibm4koM3czv5KNhgxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7440.eurprd04.prod.outlook.com (2603:10a6:800:1b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 14:29:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 14:29:39 +0000
Date: Thu, 3 Jul 2025 10:29:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Message-ID: <aGaTszJ72cmfT5Jt@lizhi-Precision-Tower-5810>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
X-ClientProxiedBy: AM0PR10CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: e15af2e4-d3da-4bab-3039-08ddba3e0b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V63UQOhcScF202yY+EE8BaKcmbciqv8ePDQ6hWNWK/CYP0jjf7XkJM5MOFNS?=
 =?us-ascii?Q?mXI+iCNkun7oeJvldn0EX39HMrz+OxdPl6Ixx+bDPvBXQy2aRWLKrVtVZP4Q?=
 =?us-ascii?Q?TnnvewaMeI1Fx3+OfvJOrwF/jUEhz9GXMqlQUyPvtyCyZRldcJlKQR+scHHJ?=
 =?us-ascii?Q?1XF5V6JY0w4gkzzynfM1zMT9CG+cbJKjG3BqqguX1CCsakMX+xw9QEEa1b7V?=
 =?us-ascii?Q?aD4cgLz1ZUGcU0RX4pWiochhQK/4DWqj/+BCc9bRgl4yh/mlvlytdLIfmnZ7?=
 =?us-ascii?Q?VUoknBOQatWTm67xz5Z9/ZpJ+0cxiu8cbu5kgtLCiWvQjnkZVlmQd847GzVQ?=
 =?us-ascii?Q?wpS/mnTEi/6lkZjbx2Vl2Sh+WugQlOeXjlX8DLWulFKbMycAxwOFNPGjdbC+?=
 =?us-ascii?Q?hRpUZ5OzxWPeFQ4gbDLyELoHUzKQS5d4F9j0SmnbBNmWsu42L9uHmQu+BH0J?=
 =?us-ascii?Q?g5qss93SPJOaBNkDopAe7mYTG5ok3OI63YjQe/pS0mlCSkVNLGBgPibYd/qo?=
 =?us-ascii?Q?53wYm3V+kV5KfwfuR1RjraKfB6ylSBicbGUqTojC4FJEIpiCwgs8QmTUghYV?=
 =?us-ascii?Q?fnwj5Uc4ThJ/w5YrADqvn1SyLOCsnwT2Jk61MSa41KOOELx6uud/LZfvUg3R?=
 =?us-ascii?Q?f04omQ/qTawOZZ4b92nAqbY8yxlRu/YAJyN8RA+Pg7fawXqzVvMNTg3925mL?=
 =?us-ascii?Q?DbeeyfjLXk5rOgPadOX9Qci86JoYebDgHEuezvuHsICVC0eiY1XYexqtfzx5?=
 =?us-ascii?Q?bAR6ukxnrIPTS3VE1ikiAo5JhDn9E7CYvFYIatmm0xfVjoOeuqyn7bLAZop6?=
 =?us-ascii?Q?hp++GkvD96N9GZn/yELpyOIxM6++PTn6SVqTwMRWmVDV0VztJ942qeKQQXZ+?=
 =?us-ascii?Q?/B3MdS6MAErjec+NHodjOPjl5eK7asLeif+re4/lH4fSqXE7PUYnrtm017QB?=
 =?us-ascii?Q?CqvwDw8X8250VfC7+gqQqFnhBreceIz9gQtY1qqVuVIsSqzIMWcdJWRYSOvF?=
 =?us-ascii?Q?F/bpACu+Mdzre2k5cL5kTIQleGN7IdMVfq2c46Pw22lFK3hzFvaEBEPgADyj?=
 =?us-ascii?Q?Mw4lf4KI0+Cbhrbrm7XGFW5XROWqEwoovhq5bMkRXYk7MwqD3moQ6YF1zftl?=
 =?us-ascii?Q?muHpKP7PlIGYv7lqZ1B4P10NZcqOx6Hl/xrKT/fUkpS+1g1GqMuwAWIKhic5?=
 =?us-ascii?Q?+c4Ud85CdN7vNsd4AJ24xIkBtDoagCKmO82by5+gxLsp883azcwIcHm2oIzb?=
 =?us-ascii?Q?IClyXUS4q6sCB3y8uYeyDw5mx/0RUVgF9cBOevSxsBgxp+cqe0QhATT4V9lJ?=
 =?us-ascii?Q?gHAU1mEu+4oxl0Ls1La/Q+9BjlecVvF94THi6X6YnzAngsdTLMIKhd4I/IZ6?=
 =?us-ascii?Q?reyV+7Q+9mck0uxD+/2gXrLpIiZ2rxyuuf2v1ER0FBClJHYZ11yWLE5lDEJK?=
 =?us-ascii?Q?yGXUNGbEW/k37tE1fnJasys4IFYRMkhmEEAdxsbXkqNGY7IRipyXUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cMixZFL0rkTJiLONBuuGUjZf30T/4ucLdm0LqsRFvFH5OmGOz/slo4Xz8rdN?=
 =?us-ascii?Q?IBJ8OD4hQg8tn0rKDobI9vrNRjVxtpGn7zx7gA8DyeFHbyO6IRsewqXTSkxB?=
 =?us-ascii?Q?5/y/Y0DpmuBoEPnVI6G+yzNeMO2NK11kJ63vMWcjKwyPfuty4CnFGpIG7e2y?=
 =?us-ascii?Q?ElBcSHwxat2o+Vmz8t3EJBJZV/4LczFh7K52wDR8YD1yedQysAnYMPCYRHDY?=
 =?us-ascii?Q?4gciTbOYTUF8ik17zDQ5ttxbave3Rx5bytdWVA08pyPbRKbGC4yDzGM6yCHn?=
 =?us-ascii?Q?aHxyXKYoeNwWQA4ogUNFhjmjTtwTf+Vm1g65RoUAem66OYtnUBs3BocbKP50?=
 =?us-ascii?Q?WEtgZt2psMVDJZWZh2fnW8ILjmXwl3tmF4KgR2xy65ACGDNIVLXY16WLirCl?=
 =?us-ascii?Q?yP9hiQVAt974CIlS7JA4sY8KlaT2epklQ+mjhisX7Dn8NxAoWJbx/ir6NLgN?=
 =?us-ascii?Q?KhFZS8ErKd7dF93N1OYh1I9BV2LyFJ7Zoil2mkuBJSXB6FzfIo3aePx/3t2N?=
 =?us-ascii?Q?onDm3JqOiUlq4tZhTnTnFmXlbZeeuiFehdcGJkJD3TfkUm0nR+La7qyUq82z?=
 =?us-ascii?Q?wr5kGSyAp4PfMpDZMcYiTFUgytfk1wW2scsUdmkdjccgrM7WSWZcSS16EKcO?=
 =?us-ascii?Q?KgBZGTqw/mG2rno964ZN7Ky1bGGXJy6eAFIOcPUDqIL7xy67+BJ0CMxK7n0C?=
 =?us-ascii?Q?ISp59d1/27RetEfS9sfIgodui554Xbg7sz7UZOP5pFIcvHvqafrgumyc0bhB?=
 =?us-ascii?Q?VzmwH+vvl6JAQMwyv6BJwP5p+5PbRn+wd0Pkw00P7L8plN/HNaOxiuSxzxNs?=
 =?us-ascii?Q?ok6sUM89CxuubzcAFkyyGi3rZ7v/E1GrozUtruGrOzojRzSWlMGmpxuKwUSX?=
 =?us-ascii?Q?ks8/W1R9qmj4qR+UVfmZ8wdP/bKT6YGZ9rq8Jn56JUCmRdTB+VKRpVblr6Hp?=
 =?us-ascii?Q?2jYLjlCrskljBUVdN9DvI6hlj258mq2n6DX/JPcgnsLz3RK17OS96VzxXO2J?=
 =?us-ascii?Q?Ibo58o0mcxkhRDpdyeGu1OOuSR8ip3QRPQ36YbksfKJzJ5ENmnhLC5u4bgm0?=
 =?us-ascii?Q?+aBECsNDDZt+glHieFB6kbJCefLg1Z/07rZ+vtoyOLq2as9vviKWOGZKNhU6?=
 =?us-ascii?Q?CoCVskJrA6rHHne09oKo1WOZvqJkmAycFoYVgpSPmdvaWsoF+q9fHgkRvp9m?=
 =?us-ascii?Q?YczGFR4iJ9RPXLpXAXbT6QibWezkfPMtyAiXSaU69jEOssmcbsKJC9vWeTK0?=
 =?us-ascii?Q?bMXbokGfhS9qrdhgztqaAimq0wlT2IWZOe0XL1BMferQbt5szxFKhUCB/smc?=
 =?us-ascii?Q?ITDj7uciB56Vo4qSbOVRxB2O8UK55c3ycc4sh6aeh2nNFRs2GYd0E56mrqLp?=
 =?us-ascii?Q?CBbHqfRn2ZjTmJK+KWr2MhFQyNJFBP2nz4WfWwRKH57r1DLJ/irG4zG0hMZo?=
 =?us-ascii?Q?BnCRgR/HEKw9Wv6yUytZ9IGOQ0/gxcnPkyMh18n9+w6Rb9VXvLN8wnzXwyBn?=
 =?us-ascii?Q?Z8owZTF6mT4rnfjObNbWferlTL5bRqt23YZQRgrrgmBnDoZQ1LQdiL4vY15L?=
 =?us-ascii?Q?/nIpq33dKRxMyA3kGNde3b1v9mxOJ/CVb2juf+N2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15af2e4-d3da-4bab-3039-08ddba3e0b4d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:29:39.8573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qKmbeChp1s+hU5L/4aYacVYO49j5pwOrBUUeXIPYRW8ih8MTg254i3pQON6NmUgGoGxi8Du0KjnQLx+N7W0qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7440

On Thu, Jul 03, 2025 at 11:40:24AM +0800, Peng Fan wrote:
> Add nodes for LVDS/DISPLAY CSR.
>
> Add clock-ldb-pll-div7 node which is used for clock source of DISPLAY CSR.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index 45b8da758e87771c0775eb799ce2da3aac37c060..657c81b6016f21270a1b13d636af72c14ab4f8ef 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright 2025 NXP
>   */
>
> +#include <dt-bindings/clock/nxp,imx94-clock.h>
> +
>  #include "imx94.dtsi"
>
>  / {
> @@ -145,4 +147,36 @@ l3_cache: l3-cache {
>  			cache-unified;
>  		};
>  	};
> +
> +	clock-ldb-pll-div7 {
> +		compatible = "fixed-factor-clock";
> +		#clock-cells = <0>;
> +		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
> +		clock-div = <7>;
> +		clock-mult = <1>;
> +		clock-output-names = "ldb_pll_div7";
> +	};
> +
> +	soc {
> +		dispmix_csr: syscon@4b010000 {
> +			compatible = "nxp,imx94-display-csr", "syscon";
> +			reg = <0x0 0x4b010000 0x0 0x10000>;
> +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
> +			#clock-cells = <1>;
> +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +			assigned-clocks = <&scmi_clk IMX94_CLK_DISPAXI>,
> +					  <&scmi_clk IMX94_CLK_DISPAPB>;
> +			assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>,
> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates = <400000000>,  <133333333>;
> +		};
> +
> +		lvds_csr: syscon@4b0c0000 {
> +			compatible = "nxp,imx94-lvds-csr", "syscon";
> +			reg = <0x0 0x4b0c0000 0x0 0x10000>;
> +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
> +			#clock-cells = <1>;
> +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +		};
> +	};
>  };
>
> --
> 2.37.1
>
