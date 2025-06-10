Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011018.outbound.protection.outlook.com [40.107.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D659201034;
	Tue, 10 Jun 2025 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569674; cv=fail; b=Wg/wc69ivI/YunI1QZWL9uO4ngF7kusraEF92E7IRDX4SWrN3DKe/Zd+xRuVL0Jj6h/Pcs98+X9fy/xAa0oAkdqt7jvwXWkl12ABrgkD8SOYs11ODOn9yMAlHBcNtVcaypA9QLZWMHSCXLOCAchc6uBLgcXB5cbMBcd/p3rUK20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569674; c=relaxed/simple;
	bh=uKGHP1D8Jzr4xsH7kA4Wibx5JPRp2RT+2Sik+DcAvuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mixZDh/00apeK92RAF2+iXQ+ADjSRC+t6HgoEK/gogzrBJ6YfPJFARjaywgZWwx7SnBiGaJB+SBwQPN2f6sfIQmKTyUIOZPMe2r2gJCDHctPMxewFSt9JR2ItitiDSbwRjHxZ+jh7UYmEYiU8eiSZ+tlNxtRZACIx1SSh07A/Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d6iYzizf; arc=fail smtp.client-ip=40.107.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d6iYzizf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vN3f1qiMcwnDrhDibzlE8KOHr98wMpk+gZqgDgM6xWb8L7P7K+FwbtjhcwfnZTO2GaFSO58NxYA92LgDR8uDqd7znsm8dqdGmjcMlk0SJhsu5s5WDWdoMriWILJvnQ3FUzxDqLmePJcyuPSDfSqXb/Z0HXSuKSv0Th5eWIXptsUhy9aRhebJgmuRBKV34txh6CzTYZn76ku09lRaR6v1H9yLbK8KxThAFjpn1qerw0EiEOVD0TveQ/Ds5oqdGCFqlskJsAaP9r6gfAaKmnm+YME4nMSytkUfwbFPyO8DJmR/dAMMTXO5lmULKrKbAAT6qNYAUr65HxaQv9AEYdneIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DobekSxAlkV9td6Rl4PeUse1KRkMOBVw9uTooY8rCl8=;
 b=y9OJfXYBCuzGsbn/lInUNcEXWVICX+myiSQZkU/+/2JepLS3k58WgBOqImFDi3toX3hoin1P7Fkv/TD1GxXlVCv378+xFNtdnEMtFYuE62YCO9TZKpBLtz3kE+ruHGR/0DWwyGC5KRVjrkgtbGZhAgwqum9W/kKlnEBkAOXWnMnRplZ9Hhv2BhsME0Zng88EnPCBb5BwHGMkymzYwbgaMoD8sG95Ez6z3mZo/qcHUbTpqpTOsoWxPelr5UTWrDR8TFctOxz+vgCA98mhBEJMA5a9S7NYXGIk16sbI2AyXuctepYgO00rwK4BpcFXHBuUMqV1hNG3H5pckAJGgupHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DobekSxAlkV9td6Rl4PeUse1KRkMOBVw9uTooY8rCl8=;
 b=d6iYzizfpqkE39SPhZLWFuO7hpzIRzXfUucgVwFIGt/NijNpeq5qhmTFUtqkV2DBqT6CVQWSWQ6tDarRFDno1yUQZQ+FdhdYtrJnvX1O1jzdgcHB9q6E2CpKxmTGaNxPodxtLzjlCGY/B+UlSnhhX7SSJu7dk1d2JNqvcGCTqlKa5EVaQze/VfvpMM+33e+iID561Wsql3tu0rEsFaIqYU/8J3L2kv8fpYHp2uu1n4lA9waH5yfo+v2YOzJoCxWbJrOzIbwxkjZB81mkskIzTeeJjDtnKzQY9KSbxhh+wyoYcVfTAWOj7RsrYYU/cwrZIFwOeEzn8lyHAliaEwmluQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9921.eurprd04.prod.outlook.com (2603:10a6:20b:678::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 15:34:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:34:29 +0000
Date: Tue, 10 Jun 2025 11:34:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Message-ID: <aEhQfvmJMf/SyGmK@lizhi-Precision-Tower-5810>
References: <20250610060756.8212-1-ada@thorsis.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610060756.8212-1-ada@thorsis.com>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9921:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa17f3e-5665-4642-d0a4-08dda8344a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pbkrqNLi1cMonXSATvsT0jmr1Yh8CdYAJJ1ruD+Aj8LeLXnETDoFC9XaE5Yi?=
 =?us-ascii?Q?xYIwGf1sNJdFEoMrbGnjbkWmPUphxjCw4b6iYo3ju8+jVOjecwLoaEI6AK1E?=
 =?us-ascii?Q?sEGLHTf2+McYyf+l6bXJhbftgHqwfqjzzGfGHsYNXnX6csmEBZn/65SE4Vaw?=
 =?us-ascii?Q?WjMEdAmxa2O+cDUFvmYiLMHQY9TeQaB9IZBCk5P90LXbuJMvtcQfUVL5KPLf?=
 =?us-ascii?Q?m4a2KFHFjcrkxO4gSo/ZFLazHr09NCC4UBfy5zHNauMqkyIUgGg79wHNl7x3?=
 =?us-ascii?Q?KQvIQbVQu2wjpX5O4OHsvAnCvgTnZ2h3np+YpoXHTWIaamsshk8sNh5zxVNO?=
 =?us-ascii?Q?VVN9JT8EXdQ/hqHs12Xj4d0NKbhfI7+DXhw0aH3N2KLeASf+vndtkzVMLoi9?=
 =?us-ascii?Q?TcVpRj2WdlPwESYBXZXCHGwDfBp3SrXN3cWNINbMM9jvQAavg2w06SuCOVeo?=
 =?us-ascii?Q?jd2d68uPIQjLIMN/sN18vkO1cAcg/9ZXT0sHvbdQCILt0mAdRHhIUlU64Shr?=
 =?us-ascii?Q?x49r2jdGM7aL4OwjFHhq905xqi4UBt1t1z9+AE48txaJLYf2W4Fx8etHnd86?=
 =?us-ascii?Q?LHDR6VWXQOwXllUv5B0k6NjAoqIEJbRxYSjjfb5FGe/QB0Ttl7fLcxTwXhm8?=
 =?us-ascii?Q?lsesz8nuF9rWK3OaebGUzcHRCNRde5OAcTDYBK8Pr+uvvCccKacBXRLy6D/b?=
 =?us-ascii?Q?jUCJSuXgcCg9EgZF/GTOVRTsGcIWrz1BfdTEblBFGUnJTeB3EAx3HXNMVqjE?=
 =?us-ascii?Q?VLMhkhOsWx4GiJd6vXpmIgeCWRWJJOZfPLJ053+kr3Nilogi2lAecBddeRgF?=
 =?us-ascii?Q?rSUTPKL0Vw3GleGWAav2IyNaKIRgpuFqJVF6ZxMktF10VnLGClCLZGz8j41w?=
 =?us-ascii?Q?Sf9cCcgovyhefbtILg3xDXl14azf7u3/5sELPpaMCk+fS+DhnsU7EeiKFTx8?=
 =?us-ascii?Q?Z9qdvTHRrD0Hf6VBIqFX1SgQrE5zb6IjnDIflLZUkf1Rn84JKRb9l8Or7dEp?=
 =?us-ascii?Q?YOF6Qdr4sqqXEeZqMAfHoPnY1P3Zt1g3/4wmMOyM+VYOiOfKXrn5L92kByyC?=
 =?us-ascii?Q?2fHE7YSfIaoEb/f4czoJHNuC1zZ4lt1CmqU4CNz14/ZOP77xmgq2k3l0JH4K?=
 =?us-ascii?Q?qgcAjJBbKNFVtMow1yp31xIPWmSQxt3u7s9t/Rg+lS7UB6950HNDq3i1jRbr?=
 =?us-ascii?Q?ZKJOXaexZ/pqWCcn1/5Efa3pnVPnfkes5hI8m3GjYa2Gv5RudMaxikpXF512?=
 =?us-ascii?Q?xejVeWfuLsExhECIlOM/N9Xh06Fe1ZE2/QxlLVlPbHuYN6x8hGg3Z6sLU0K1?=
 =?us-ascii?Q?kS7d2pQjdiYi+D/Ly2va63H/DCOMGjWCx1qwl1s/z0Zc1YN+CuRKphz80WBc?=
 =?us-ascii?Q?DWZNhXSFsMTg3q5dN+UzNdXWg2EoCT+Xxa3LmH6eZWQjf7RfZBkULEO3SALX?=
 =?us-ascii?Q?i+aUQVpYsKRxjm3C3ie2tyepnDN0lyN+Jl0iFGdX4YLo6DJbmV0LMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VZPuIiV8jV2qknrzFJtkXL+2krwiHbQCwExSXN5IlTW/y9wMhq/jyYR4QwjG?=
 =?us-ascii?Q?JU3sdHKZuBgNV5E1biYYiHk5ofXKK3rhJAH6lxnn+mKu1oyCCu8D39V51FPI?=
 =?us-ascii?Q?bO9wS2u9lwMApVKBiicbUe1jsIT0kxr/9YsBID7WG61IWdtQz6MWC3f1wDgD?=
 =?us-ascii?Q?HsFySJJ6cdUXN09YvW+xvgY9WSeqfiEEEQCs7yN/bL3Amtrso4Q5u9G++s0I?=
 =?us-ascii?Q?JvcfJQEmyPq0pCFaShhfJYlJ0oLA0hM2bec8xEOZES0PQRzfWIWG7E8ee2/M?=
 =?us-ascii?Q?7gKAdgMZMkRVQczs4mWB1/ZwAOtSHL/FLeqMqTe33eBErjuAv61YX4ukfQsl?=
 =?us-ascii?Q?XYGZmRcVO6FwCO/2GMn9riToCT125/sxIpoyhsw2QPSeWQIF95IM/lmE0UmS?=
 =?us-ascii?Q?18R8b6j4Pe94LVGQu8zbv/mHGDcx9w83GZU4ZP4elVXcD1ZlFjpT7vPNkzLA?=
 =?us-ascii?Q?xChSgR72KGWoRGj8+6c2k9agMpmIghxaEVlJ1xMOrvFfNdJsPiWgpt9VMsGz?=
 =?us-ascii?Q?lBAWYYu4itA9HJXMuinqi6WltGng7faZLyLfPb5kvhgzDmjiBYjTurwfLJEe?=
 =?us-ascii?Q?tVom20jA4igAWZxFQllt15paVHra2FoibYK4qBC5syl77uKF+24OLgB9rAOT?=
 =?us-ascii?Q?9DWGHsI8Foh4Or3hIPG5tpxrYU25xN42WZ/933K+O65ATERTE9U3tCWW9sSM?=
 =?us-ascii?Q?0oDZRl2S9XQoyUboSca8bfXMa2si1E4Bd7SetM17ocg9F0pC7bdj6RZq4kP6?=
 =?us-ascii?Q?BgAeN2qjH/VYzVuiNqqtOd/o5NDLdKfCZWpQqzwWtJ5I0yxQkrqS9ABK+/Rp?=
 =?us-ascii?Q?SH8VUNmUN9/shVaUsdLfdoX++DVIxYKcBkXw/VUStFxhTYbXtVxoopE4RArr?=
 =?us-ascii?Q?y6kRxHxRmiZkNB2voVAJMiotPkMeeZVntdfmvrNjuluxq7h3SRvVc3IQ0fzz?=
 =?us-ascii?Q?e6gi0BqcgPLs51mwCucsXQowCVdohEHhIaXQo5ii50CV9G3kFFEJblECK4nh?=
 =?us-ascii?Q?t2dKmlWwGBiAL+eQNYn5wCH+pab2N12zYWChAR0c47zVwsdmh9/2D7oyya+m?=
 =?us-ascii?Q?4jgFT2+9ojxYABPqYWKXPJnhfLrO/7yvVJFrlOsVBbaPPaOhqhaoqABwX6+l?=
 =?us-ascii?Q?fOLzT5lsFKiM9vvipnCR7UBRKUt4+t7RHEFZr56FdQt60XZgaA0fXPvkYtcq?=
 =?us-ascii?Q?vesZ8HFGHln22z2BTlsaa607wyeXVwdOpS004miqyyTtDPinrbwidqq0Vu2m?=
 =?us-ascii?Q?aThXjCU1Qpz5GTQG+6aCeXvpHZxX2X4/a3df0topWOZoHgZy8JL3mCoc2TH0?=
 =?us-ascii?Q?DZ/xEG41x0hf9HTzCEX9B9JM5Pv2a9dBVp7VdzCIqMJzBFsQ466T49A9tRdU?=
 =?us-ascii?Q?9Cza+YhW54WiloCdin3C4GKAJuQdI+hw/5od36uvowIfm8AKY03SlFAP/Iu/?=
 =?us-ascii?Q?6Gm+5Mm4AxpdvCoJad/PP9z/3dzkC1RclxZfyrLWwfpv4rdki77dd6LXNBoP?=
 =?us-ascii?Q?dPsiTIKlVdMi0C6FeWDmMTzcPjkMgnrxYIc9aNGhC/ShVy/wa1KKXtSy3waO?=
 =?us-ascii?Q?wiNpwEk48RSG4d/Vm9bHjbhESselRvoIA6akW5jB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa17f3e-5665-4642-d0a4-08dda8344a63
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:34:29.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QR5VTJLn2csStBgnOHxDKa99Faa+OCK70gHLK5czHuxr9+xfxTpXz/ryWDUePapdAHcNexMe8YQt1zkPko8XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9921

On Tue, Jun 10, 2025 at 08:07:56AM +0200, Alexander Dahl wrote:
> The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
> than the generic i.MX8 has.  One conflicting resource is usb, where the
> imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
> one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
> including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
> imx8dxl.dtsi this leads to a duplicate unit-address warning.
>
> The usb3otg node was introduced after the initial imx8dxl support with
> commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
> and since then leads to warnings like this (when building with ptxdist):
>
>     CPP generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
>     DTC generic/platform-v8a/packages/linux-6.12/boot/imx8dxl-evk.dtb
>     /home/adahl/Work/bsp/thorsis/generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)

why linux-6.12? maybe just your directory name. trim down
"generic/platform-v8a/build-target/linux-6.12/" just keep kernel's related
patch here.

what command do you use? I have not met this warning.

Frank
>
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> index 9b114bed084b..a66ba6d0a8c0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> @@ -5,6 +5,8 @@
>
>  /delete-node/ &enet1_lpcg;
>  /delete-node/ &fec2;
> +/delete-node/ &usbotg3;
> +/delete-node/ &usb3_phy;
>
>  / {
>  	conn_enet0_root_clk: clock-conn-enet0-root {
>
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> --
> 2.39.5
>
