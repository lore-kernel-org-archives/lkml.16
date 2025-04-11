Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2089.outbound.protection.outlook.com [40.107.241.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD73A18FC89;
	Fri, 11 Apr 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382075; cv=fail; b=am8PAO0dw8PdI6q38pyMnmlfEuuO6Suarw9c418DnjLZZxHKz22vgtdF9CaJZiAyncn9A4CKklJdbsHBGlbbYQ8R4bEInPmPN2iQZLQ5JNgW79aeXGDobHAJCUVcxBrY0mIYBZHr3BvUcBtW+36Xujxr2+GllfdoWHrPJIwZr6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382075; c=relaxed/simple;
	bh=ljptRlRggIC4Yh879NKj2rm2HyvTBJb/Fr6C/KcJp2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JdnCSbqaHeT+LJzmB1fD531Y7idjNLS/e/DN+SandtnxtATCQOJLybImPdi/UcSy6tbNv7aw10YZM6mTzAIbDLnOGAvqMOTRwyF7YZ31YoPHa6rwYc/9NU/b3cjgcz+4B5lrDIwLRYLTWcHDuboOT/5/6iV9nnH6M1ohKW7t7Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kh6cNZl6; arc=fail smtp.client-ip=40.107.241.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kh6cNZl6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bICpxwzDGyh66Ysh5tKfbxjCl3YR400WzYL7gSsFLI/dkKmacsTNQi+HtXmjXDV5/TXs32pG9sbiPnFWWimXhthFFNDRAI+Vi5XNTTFoK5JkbQl8hgjVpISNVLlzTdbBVxSOOtYThkzjSFY5ey35xJBfoNGDwARbBowU9jkzYQnKaina2hk1wywXWelxPbDDHcVM9dySWpmFXIrNol7BtgUrQv+Ccf52NqrIh6lpRczHdvu8gUL9v9z6Qlg1EOFJWQ3SAVO3cF87RsGVlOtGTS4yBc1bysWAhE95JvA7eASCryNI9a0CHczcdJeerC/jlGEuq0XyQGv94mpdQzh20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVfGITe1XOirvsDK3h0gWxNDRoNqpR9Vpbl/HygzyOU=;
 b=QTw8yGbR2Y/HDUL9Zi9WFP3yuPF4PH4oyMsK8NEtQzAg1m+BoZ56Yv/5ugntA6kQq2m0WTVgPjaLXdtvBKsrabWNp5D+07NGIbU0WPV+72XiluT6gTOr2QYNZ06URgOJPlq5opB5FQ20P7X7m2gJCzbAiLqdxZAvRw0fZabzd4L4p79qVsrklfsG5hEfQpiu921L2G+xQWpdQQUjwVcHZY6GRaqM+Jm70XQeydLOX7lr6pXohzOadDqBBjb7nCjX9Ms1eutzNrAQH+OtfAXV2kTo4dNSYToT8lTj5vzWANP6OOFukOcWLCFKP8iU89Cfo2gLwSAMihzk1L/75nhZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVfGITe1XOirvsDK3h0gWxNDRoNqpR9Vpbl/HygzyOU=;
 b=kh6cNZl61/5HV+WK9JrFk8UCO+agP+XQTR8YJOgvN8l2I7nED4iPDq6jjoyi2i8we83e1w5fMIcmAGtMQsF1Xsde2D9QJX07iI+xNfx1NmRHTHIJsVGwXzSrKbodUPIKn28DB2vfqC/RhphVmRdQ+181f6m3Y5XeMN6i77qhZuq8uqkqsxgGF1PcF9B0ztEdFVo0OTfjF3u11tJ9QnZf0mu0JR7E8JzvbfH0n4pEe0ltJSZLXe9nSvKRSU9FdcEfwbTVPVyj0sPn6G5idBmQczO+xXtCCVZGwnFxdFv5b1Vofj9nFH0CCE3U4WBHGuqsNAds9BsXASSDRxn/pKaKEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8324.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 14:34:30 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:34:30 +0000
Date: Fri, 11 Apr 2025 10:34:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 04/13] arm64: dts: freescale: imx93-phycore-som: Enhance
 eMMC pinctrl
Message-ID: <Z/kobxo56A857eZr@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-5-primoz.fiser@norik.com>
 <Z/fcFPrHdI8/IBRC@lizhi-Precision-Tower-5810>
 <d68df49c-222a-445d-b29c-f9ad962b87aa@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d68df49c-222a-445d-b29c-f9ad962b87aa@norik.com>
X-ClientProxiedBy: PH7P220CA0142.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d3b58f-2ee2-442c-a66c-08dd7905f834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JAJmBZVGdxqjWt+Ys7UDo2GuwqGsKA4e2MMGhlfSvVtz27AsLyryzhI3Urna?=
 =?us-ascii?Q?rO5JwQg2TK6giID2AKItNMG6qjkDTdvd7iijkngzrmn0ez2vGO5/i20fGi3M?=
 =?us-ascii?Q?Biq48MJ0tMTnECTtN4nydvh7ffRZivbKoR6h5xy72H/3gk5iQHZyGArm4qMh?=
 =?us-ascii?Q?WcOPEnuiWDxOmZ1NsnpnHFEP6gn0qOPbcKRZwt0bM6/SlJ9YLZGm3C46JMIG?=
 =?us-ascii?Q?R6umugAW08SrFyGPSnzArvmdhtkkSAgW6k185ItBn0UugAQr2C52c/2NM8hJ?=
 =?us-ascii?Q?obD8hV3whdNp8QZIeCG9F+XINmGb2u1vIbNdQjX3QM86sKeku2IEBg5d+LEN?=
 =?us-ascii?Q?1Ls/+QpLx2qRPTdh2dY38otueJCyy+5EMsAjXht1hbwn79/s84rJt07texyR?=
 =?us-ascii?Q?IxjEgXO+Nfe+S5M6AjHUdeblQD+LP90V2JTH+Te3aSiPohHtiwztDE1afliC?=
 =?us-ascii?Q?0HxeA9/LmcdlfskM0d7E5t0uDRcIOk1VbVaOtLs/4tL0jSSUNEdZfEjtW446?=
 =?us-ascii?Q?45NfTSouSyH705WVHkp3U0HJ+MBj6JmJwB2bHNMg3cSSujBM8L+M51uvOpyS?=
 =?us-ascii?Q?xLTV4z/IoU6yY8t6QENBGrIc+4Lm+Luct5GN8MCjtO4yGOkjs4TGED+u3R4b?=
 =?us-ascii?Q?vb/4FM9tEDGE3LF6SiN0Ztd+RsHbjc8jP3+77qnbgyan0LXFuSkFXWT4qCGA?=
 =?us-ascii?Q?98rV9LJ5+fCu2JsP9Z77JugZAQhoQsW7IKFpCrz7w6UsqOwxtw5osPxb1OPh?=
 =?us-ascii?Q?k2/c/Asvs/YZ/JecQKsxtgZfStk1WCH/smDhQL2FDACme2W2gOcQXuL6m1bM?=
 =?us-ascii?Q?YvFUFqc32Fb/ufnuG4YfRGMLm4GlCz08AvhhEJkJfV4zH7SnLluqdWHj6bsH?=
 =?us-ascii?Q?YC0q6x7U3FAxZDcElulDEyckcY92ip0BhmVdJQLHmCrTtPl9eoWAB2AE521H?=
 =?us-ascii?Q?TyZdniOIXmV+l4GjIQjdPfTlKHdhpMvb1aekPPY6x7VYHJB8sQ1LPZPyEjRE?=
 =?us-ascii?Q?4p7JuNU51U2YeD+G1BkQXM+Xxz9Hp0bMZlS+lZCKv59MDLwk4Q2TWepypd0H?=
 =?us-ascii?Q?LfAnzntD/lXiJLfCVWpp/zeWqEG2ljMvcy86a8tAraO3aeAAQdJMLnl6bS6h?=
 =?us-ascii?Q?SuaLpKd4oSA9SHpHMSTOREwy2geI6lLLw9h005E2t1BQI4yyUwUWLYJyZuQj?=
 =?us-ascii?Q?H8+va8GVaE4k5oZa79Z9pKoq3NS46BrPx/CImblihh0UHWOt7VUOSAVa+vdq?=
 =?us-ascii?Q?eF2PEu3uBouPf8R7HaPIlinCq7d/EV4iw9ccK40eE6xlqzhNBSagpO1mxzQz?=
 =?us-ascii?Q?6c7UB04T1ECcOoJMFb29RKs608erwKi1dhs9Ii7LSnahUzlDpzruTCkOxXXL?=
 =?us-ascii?Q?IFj+IYgtNoLX0MsnMlYu9y/6AQKvLhR566B/n1uwypjxl32Nwpypmt6CVGPv?=
 =?us-ascii?Q?TGi/888Z+fb95IPhDxGT/TU04tx9BVannKdCyjk03NVumc0zMk5GaH5qQ1S0?=
 =?us-ascii?Q?JNBeyAT1GuTV5Ks=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BwcunphGHyLU6oVM+qlzkQKryUCtB4RjofQIZTYTXF0Wn52RFOU9iAWUhSp+?=
 =?us-ascii?Q?IlzG25nnn1oz+ZGgCanKiwbBs2DpTH5N+nuQgwM+YzBZbJzIXGuKJJQLC2HT?=
 =?us-ascii?Q?vYkvT0rvElflch0D99IFR3RzaKDH7VtaJeYAVCTJX87JmDD+PRnoaYixgeqV?=
 =?us-ascii?Q?zc8ENDhs7lDopsgdrxG8dQVw7tSfkFrzAJzHdMeTzw3fXmUNFYM1TD5TA8SL?=
 =?us-ascii?Q?RS4anHqj3jAU5oVPkbUl08pO/o+GroVAo0z7EIFo9EAx8Nb6uLWwd6v53/uF?=
 =?us-ascii?Q?yAvyIE/P8wzMpyszBpAKHxjKGcdkVPCjxWa7oFTDM4uUQbKK9Vcfb0KijZwB?=
 =?us-ascii?Q?ptGuJ5BjZrpSaOkiPR55yNSbPhSCNeqhuHvGfRWosDqGqlFpLvMnLixF7ibu?=
 =?us-ascii?Q?R+Rk4ZNL9uvf9IMYl9NbpZDQc116KicSyvspVsA3LVi7m0InB+Qmqam57j+t?=
 =?us-ascii?Q?f65GUoAydAQ/Js5rAUZ01/OMorY+GlXlG2Q6ngDePfxc+vcUAa34MhMBhdgV?=
 =?us-ascii?Q?+9yLb5QxpuFjxehhvE5EAbmqxZvFsa5psXR/qeUhVGNxO/MmNq+a0palsv6q?=
 =?us-ascii?Q?8av6xz0OAnxPIZXIWqlvHxKUdxoswvGsoUxC2FnJuCVcXSV7N5whUIBrLDzr?=
 =?us-ascii?Q?qshgj8+r5owJgO5x28tfmJoO19oz6wVKeIAcKH43T19u/hN06ntUJH6+wiyf?=
 =?us-ascii?Q?1I+bXnWA0BPTKN4g5VTVvQwLeYi0z2ZtOQ5SYM+kAk6qSg0SV6AhDUpGRzas?=
 =?us-ascii?Q?w2wHTMTniUywloATFoOYpInHK1Wtocz53tG3vOtmNvSf9zvXWh/5bga38gId?=
 =?us-ascii?Q?oXDXahl71u5p6b6lkloagin3s2CgD+Dl6at5suZwJrf5tGXtkpZYvPn0J7UL?=
 =?us-ascii?Q?KuuzQjaeCmk7PbidHoQYmdJziZ53Ho3bs0i9HC9QsOZyHf+AbpK/mJ9PFR1C?=
 =?us-ascii?Q?1eSw1o701o0ssyCMsZHz8CJ5tLLPav3F4t0uooeGN2xEBjT636kB2QHhd8lo?=
 =?us-ascii?Q?HXjoA7GgZPkBNgWIea9R5YGTfR3Nopa1s15ga/C7KO3idimzUILNw8l5Lx3R?=
 =?us-ascii?Q?Z8RRuRqQcacKii7Bknnz1Nolcpnq6sO9kgpEtdHKrTMloGhZwSSluyG3IVhJ?=
 =?us-ascii?Q?GMcIjFjn4PM5eDS2lqs1DEMfVAA7IBbyep89nJN4F2OQL9xkbsKRBTLm/MDi?=
 =?us-ascii?Q?TW3zvVOahBpVpGx1DNdSP2L0J4gl/0bGBlKSltDh00f2Ynb1KfrhaPf4m9nZ?=
 =?us-ascii?Q?tdcUoaUdrkhOtN08hhTDJS5VslSrQ8kn/dSDTjq/GAygTx+45WNYY1h4rBmQ?=
 =?us-ascii?Q?8fWKk30Btv1WK56yE6c5CWUT9/n9HXQm5IrLSRBLJZZ1y8wDY3Ba4a+BtksC?=
 =?us-ascii?Q?a6JOWWMuoqAPgvh9PRAFo5qPiqPDC3t6oOmSxMNglEtRyy3Kc0zfWhp87gXv?=
 =?us-ascii?Q?W8W9HFzsn1qr8Gx1j5+RgcrSBuazWZy29vXJlsHyzdytoeBV3ZX65hbeeqiP?=
 =?us-ascii?Q?ar9rOQ2mkvc5tVxvk7lgS5Tz7rrZXrJpJScSYHEfjHj4HKxKkDVhY4ccZFZA?=
 =?us-ascii?Q?s9SZCMOCt0hHXf5HEgkr6Ln7m5LfObBx4uh0K3rj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d3b58f-2ee2-442c-a66c-08dd7905f834
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:34:30.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0v7N3yVeJ6sBradVa6wOzXEC32+pmTK3FryW8UrkP1zEXdBZ6vQNKrwTWmQ/sSwUYhOQyz4YoUDimu8UqvQDAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8324

On Fri, Apr 11, 2025 at 08:29:05AM +0200, Primoz Fiser wrote:
> Hi Frank,
>
> On 10. 04. 25 16:56, Frank Li wrote:
> > On Thu, Apr 10, 2025 at 11:02:42AM +0200, Primoz Fiser wrote:
> >> Improve eMMC on phyCORE-i.MX93 SOM by adding 100MHz and 200MHz pinctrl
> >> modes. This enables to use eMMC at enhanced data rates (e.g. HS400).
> >>
> >> While at it, apply a workaround for the i.MX93 chip errata ERR052021.
> >>
> >> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> >> ---
> >>  .../boot/dts/freescale/imx93-phycore-som.dtsi | 57 +++++++++++++++----
> >>  1 file changed, 47 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> >> index 82f680d891c2..3d84eed33074 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> >> @@ -166,8 +166,10 @@ eeprom@50 {
> >>
> >>  /* eMMC */
> >>  &usdhc1 {
> >> -	pinctrl-names = "default";
> >> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> >>  	pinctrl-0 = <&pinctrl_usdhc1>;
> >> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> >> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> >>  	bus-width = <8>;
> >>  	non-removable;
> >>  	status = "okay";
> >> @@ -213,18 +215,53 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
> >>  		>;
> >>  	};
> >>
> >> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> >>  	pinctrl_usdhc1: usdhc1grp {
> >>  		fsl,pins = <
> >>  			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
> >> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x1386
> >> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
> >> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
> >> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
> >> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x1386
> >> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
> >> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
> >> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
> >> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
> >> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
> >> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> >> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
> >> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
> >> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001386
> >> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
> >> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
> >> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
> >> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
> >> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
> >> +		>;
> >> +	};
> >> +
> >> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> >> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> >> +		fsl,pins = <
> >> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
> >> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
> >> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> >
> > any reason why DATA0 is difference with other one?
> >
> >> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
> >> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
> >> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
> >> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
> >> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
> >> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
> >> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
> >> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
> >> +		>;
> >> +	};
> >> +
> >> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> >> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> >> +		fsl,pins = <
> >> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
> >> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
> >> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
> >
> > any reason why DATA0/DATA1 is difference with other one
>
> Bus signal integrity envelope was measured and drive-strengths adjusted
> accordingly by the PHYTEC hardware department to conform to the specs.
>
> Values were thus determined empirically to adjust for differences in
> signal impedance due to PCB layout.

Okay thanks, I just to make sure it is not typo.

Frank
>
> BR,
> Primoz
>
> >
> > Frank
> >> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
> >> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
> >> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013be
> >> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
> >> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
> >> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
> >> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
> >>  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
> >>  		>;
> >>  	};
> >> --
> >> 2.34.1
> >>
>
> --
> Primoz Fiser
> phone: +386-41-390-545
> email: primoz.fiser@norik.com
> --
> Norik systems d.o.o.
> Your embedded software partner
> Slovenia, EU
> phone: +386-41-540-545
> email: info@norik.com
