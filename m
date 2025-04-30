Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D100B1E32C3;
	Wed, 30 Apr 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998523; cv=fail; b=dreAtJC/CRW0A60ldrrIpx3+fo60bEsrcIrm7MffEtorLNYowz0Pl6ufQ5wfi1ftGiOR4bpB7Dt/lo3ZLc0wc/hxJFLWoHa4gbDRUYZgxcRSMFeEf4lO/IPz7bUXDpPtji7H+kjb9rD+mB18S47hvSsfurPb6Emw59ILGPqeL30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998523; c=relaxed/simple;
	bh=0HdWnaEry11hhXNboehT+3xD88Jvp8BkbvzHWdcjO4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R2SqAh3pMyHhpPIz1G2m0aIwzXalwiEoDpsLBfxbckJgaOsmCaQ89YS61thiptw6QjKS0c95qU1lFPLQihmX1Xn7ZjlBcM+VnhlRrUF0spyxRWCu5OAc94U06x8UywqhMyXwyuGPDCv6K4LFkvPwBKUoBLNa7F35eNiy45Oe97Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vm05mdEz; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vm05mdEz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvSD8cgltX/iywZ6nqVs9VdJ/7DM+fUG+zU9TquOqsYdZJQkxQ58rNKqnbNt/k8wDvbU0CBd5U7L5IidV/Lq7gZ+GSqXzI3URyeq+mkER39BWbUTiUFQqY/tF/lSvzlaxAmUrvv4UObH7Pct2tMZbd31EWfqKT2O0LW7kjqUtdQHGLAsfHcv0woPgdc9kjJ9AA6Ojpua9M20G3cWHDPyAJulXNiTpLR3ToqjXOr7kSgjqcu3TPVZki93dkpXQ4sHgizQcaJmVzUiQ7RrzjpKuWNaL5qVwrxC535vN8fV7qaGiA0AfmPut1+m+lkdSHi5oD+YgBcSbCN/VPb9+5qhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCqrKkfakw//xnNgVA7l3Ny0BQ6EsXY5lE1McxXA430=;
 b=I84iMqwiwK4toXUzjhIQqqCbBw3L2F79F0Fw/bmMmGqICSMCQ2+ve+LIpAdBXMteo2aOFe0DwDPNukQ7jA4EiSR/kOjGuL8GrHBMfhGvQnXvypH8l2yNpY7DuW0RTh5I3HPoXPFaIJ7LUXk6TQWKw+FQ8U5503A5fEPuBhI3cBgQZ/U3uJsQgYKnMa2SqwiCumkV5jcLrJQjICFouBWn4JO5edERlkPR3XUzqZly7iYx8lzzJoocU/uOwNUSX1B4rUSLdXfo9n3tq8j80fWLKCThRocDaU3tXYk1oATBPJZ3Z6P9deEUcNPh5eZHS+9dyFueWOhQSfI+AlWbFWQrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCqrKkfakw//xnNgVA7l3Ny0BQ6EsXY5lE1McxXA430=;
 b=vm05mdEz+Rj2mFXn7GaY1VIquQaoyvHVLiT4DRqDWP/gRWTFRTq6t7wy88ZMIFGIFSFE42TIBG4L/VKafa6gy81Pqg3S+TdhID+nI9iEkZF6oarXvApNiezl7X49tsKd1u4Q2rL/GHRt8HcQqMypgAIuTm0B45MKF7rcIOkEgQd8uIO1Qx1Flp355UCQjgP+xWd+YTdMKHrS0xGOqPQ/bCPhb0Lr40nmQS6yXK3fQj8WMAfoKHvm6dn1Icj8uIUAwoILcxvAqyxD1rPbxf8KgGtmb+3A32L3aYyqZ1rAhg96qPT4bj2mh1q4hFA1DLo2fK+KBttH8K1uOtQqrwRc5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10993.eurprd04.prod.outlook.com (2603:10a6:150:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 07:35:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 07:35:15 +0000
Date: Wed, 30 Apr 2025 16:44:17 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: freescale: imx8mp-toradex-smarc: add
 gpio expander
Message-ID: <20250430084417.GB31028@nxa18884-linux>
References: <20250429113119.124427-1-francesco@dolcini.it>
 <20250429113119.124427-4-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429113119.124427-4-francesco@dolcini.it>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b7bff3-8a6e-4ebd-36c3-08dd87b98c60
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?drAUxGsozKii1+7HnJFekyuNLI/pH52ALRtArkn+v1d0hfZMp1A50syLYBkA?=
 =?us-ascii?Q?3xZsMwdA2PzvswlS/J6qs6HqpHieAVawAREPCQnd6gvDAwFi/KPYYsb1tegq?=
 =?us-ascii?Q?NTM5OqmHGm47S4GPv9ALvDuWArBOPub1cJZ9gvF4fAuBqHn3rzrbA34nVi9Q?=
 =?us-ascii?Q?+jaxAPKAJW+5LXF0SEEpXtKOS6mGiAzrXpweyr1LiT9CiSfvp0mPRiCBgRsb?=
 =?us-ascii?Q?rmf6WM2Jpa3DsrP5z3dGZBg3P4vi1TPvtfqmyd0LBpMJISsHhZqvYPod6wlu?=
 =?us-ascii?Q?UvPvBQbOI6U03od1qozobrX/jJFjVVOk6eaBS8eqZUVyousgHOwsV3LndIBs?=
 =?us-ascii?Q?ZB4wIWM+qdYaBfXD1jejtkspJlMivymjU3K2UItdLh0aIlrcgCgOmwpiKbTh?=
 =?us-ascii?Q?AaS4HuIXr3TgWIrWu3rkKH23LkzCH6hk8aul4YFHO+sccMa3y7yuvAI2vKKF?=
 =?us-ascii?Q?Wklj05tNnlJi7hSrDVktwpWWW8pl8QsYIYVUJmbPbheaIVdkvd/5GOytMGlX?=
 =?us-ascii?Q?MzcXaXvhwfLEl+aE5G0qIb9U9V/Nn4BkoE+Nb8B0Ronbfqw1cTomryR4q235?=
 =?us-ascii?Q?1epgcGvNs9ZBnpQw0f+VHxxuOE+sF74Ya7hJN6j5DOim9v9mai5l+0CtKt6b?=
 =?us-ascii?Q?UOdjRV+QJ0k0cLuzz1gGnk32XTlK+w3vmkSuvHpG6dNoyxoOlZz3dNVOD5pX?=
 =?us-ascii?Q?Cy4H6j222LRP7QBETvtn7FZESJlMGDttoDrbWreDAn4nuimaOZww52Qt1G/O?=
 =?us-ascii?Q?ZpW5DwDtX2cVL7vSz29BVqUHXnfPDN1HQyQei+l7UggGzhZCskI6bgFs+iDX?=
 =?us-ascii?Q?XTjL5yC+nxJ2hX14L4yRxE2XQbjdGLyeZVkbDoZ4ESFrmEhInN9UblIkJJr6?=
 =?us-ascii?Q?HlpXJAhn6aJd8Y/kcVWijAhyyGVne2CjsDzbiVxBe9ZoLZap2lQi1h3YdpSj?=
 =?us-ascii?Q?Ai2UxJY9MJ4MKtEtmEHKe+tU5xTQLItOD6BJ569nBj3MoF3UnW9hnvNerrGX?=
 =?us-ascii?Q?D4WU3YZ0P7UwiQZ20JhIM/W1MadlmwNS9ule+HGhXK9GBrWrA1QSsHLc7TIm?=
 =?us-ascii?Q?Sc6LRSzTageFwany+xVN9+cmRKL3qOLs1cHaUSvNgn6dh+811D9XCea7hCQG?=
 =?us-ascii?Q?eXXyFZ64YebtnEpohI9TjWYZe69i1lELFQ4+tcRM5ccZgb3kAYa4VwPjK6E3?=
 =?us-ascii?Q?DkcOh8CJhuoUu+c/yaUOa6vifuETQ7qhgWCxQPYPAdZvbwUr/0D6BE8W7OKE?=
 =?us-ascii?Q?c7MndeXl0bwftrvATJTSfDghtoVNpW2ElASYb1P7gZTfpB1R1YfcS3Wg/fMZ?=
 =?us-ascii?Q?48+zwCNMVIF3/Xva3IffJ55T5sTIndEgbY6mcWdhApO787MLb6HfqR/xEZW+?=
 =?us-ascii?Q?NFR10aSLIdzdqlHDhYztHzgtl60fi6QyKIFfsxBKWlnM++RPvIucfQgLaPnT?=
 =?us-ascii?Q?WNnNSRTI75E/B4VY+ux/AonNgEQ5alBrtzsFOOJqn+LYqwyMpMLlkg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?PCVLFxIkLR9COnRUt+KxgQkXlEp9bQAMOtWzHHVaxFo6Fgpe7whwAspJGxSA?=
 =?us-ascii?Q?mHnOpIuDBUMWd3+3+N+Nk7m+/Qi1Nb4F0gpkPZ3GgmasL5PjVN0BpLTMfwhc?=
 =?us-ascii?Q?U8SFoTDceilBnYe5GYfazhCwt2q7943jLpZiG006YBsrUunOeqFEKmlGTcJw?=
 =?us-ascii?Q?ywjpCZJSyIK4qSnQ5WMginwKsmKiznsv57iXYiGWNMKlT4NzA4XlaJ0Ono5u?=
 =?us-ascii?Q?sKBJohfdSCPr78B8eLkz2OtWHZAW4omcXwap/S3uZj/El8gXZWBt4I8+Skzo?=
 =?us-ascii?Q?e1y0vocwdEwQklpfNEnfgVcx0LRT14d7QKuBCPxSR9zEUapt92QJAUeb3AuY?=
 =?us-ascii?Q?JZzOs4Zm0admZmY9kWaJl16hgajvL6guc3Ge+3AtuNYgNsqXHs+RQ6nCTMq9?=
 =?us-ascii?Q?FLzZpNZa5eEEGknyBCRYrkfBwClgxICtBUUJB5be7efWioF+B41OAI5vebRA?=
 =?us-ascii?Q?vnQwrfezE2nC6TpquFoWu+k01oSSlVqragaT3942++IRr1EPBPszalahMVNs?=
 =?us-ascii?Q?f6xoMNrRgfA7/RRD07dwZg9Q+j29FXk10a0G7/vzke933lj87Faj5ItgtNGh?=
 =?us-ascii?Q?eUGJvZR0elhOoE1SI6w5l+SpMDfO//UsPeRLA+PL6cRDOZ8P2KpNnSXUCO36?=
 =?us-ascii?Q?0mvSGWUsZfkqVxz9VOuhRLgUwj9EwevvGSYTiC0muGr2zRt3NIH5Rc8yq/lS?=
 =?us-ascii?Q?i+AdmSU0hWbIX/fPICZOSDNCxlo8U7YhZx8xMBgkTwR3KVMYKM22VXOyFO2f?=
 =?us-ascii?Q?ApwYjFmm+QSSChULb64FnVA9y+P8vYs7s8b3pL7NMJ20T2yRUqONTPdZf9XR?=
 =?us-ascii?Q?qnHHZZk2bqJ+opyDIr5C0KQNG6J7yqQCw+42urQiPF734u5aAybzxeuJXV1P?=
 =?us-ascii?Q?uipUFB4UzpmOWUwKgL2upc4CsCVzmsYFKU1A5w8VCH1zypNjXYmSkqjOIiOo?=
 =?us-ascii?Q?C0us7ar202eTL9KHf1GDKw0myyY/XIZTNDGaJtqIZcTFaPs5gP13DvUZzeSP?=
 =?us-ascii?Q?6TSZknt9o+4e4Gb2A62qmQJNhUtQqABQFjnj8nd60h0vQr8D5OJ71z1l+UHg?=
 =?us-ascii?Q?eeVWIywtvMkHpePI/ZkvJjcnEw3u1w+W/+cZBuGmA4zckgaqYrY1KocgWzaw?=
 =?us-ascii?Q?MOdOb6rco2J5E1trl0egp0/r+2jnXeHd0LomGjNeUOM6H/H63gYTCOvBQcWL?=
 =?us-ascii?Q?rWriZrqR74flAdCpvoDsWBYg9MyQcEc4oLVw9Sem4xOPTS7QTLT+akWlZkq3?=
 =?us-ascii?Q?KCs1cGOSme5TZNPnH7ZduHySvme69T6U6SH/NM7HsVNxv2zNNb+EHJq1AIMM?=
 =?us-ascii?Q?owwgELys8o3U5eRst2lX0temG+8texjeHTQTwKTjk6fWWn51DvMUu9Ik8qkZ?=
 =?us-ascii?Q?sL3UNU7UCh4fMLy17YuUlUicg1Y9yCNYLTejlo+W/v5gbIolteYeIfR5364Z?=
 =?us-ascii?Q?KJonflhSERn5zhO+cTKQoY/zJhQeor9LjAJ1XCtBB72+lEiKRfjdmPaSjuw8?=
 =?us-ascii?Q?6k+uLDXuE7oNof/a41dT/dIu1aMGSxxqsGzSjXLF7TBDHvilRGiJzzPZXt5G?=
 =?us-ascii?Q?Dpr4ophcXkvuSi6gOxaYCsiUePdJq7+NH3WN1mCZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b7bff3-8a6e-4ebd-36c3-08dd87b98c60
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:35:15.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+K5tOc/qMvG/3J2NAxNn2SK+wICr0UmfSXIybgHjoO8VW6Ok/2SCLohNlptaUdsv1nLGIa6tWsFcZZ5UGpIaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10993

On Tue, Apr 29, 2025 at 01:31:18PM +0200, Francesco Dolcini wrote:
>From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>
>Add gpio expander node to the device tree and the related nodes.
>
>Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>---
> .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 25 +++++++++++++++++++
> 1 file changed, 25 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
>index c4ca01ce60d0..de84e7e52efd 100644
>--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
>@@ -54,6 +54,13 @@ smarc_key_sleep: key-sleep {
> 			wakeup-source;
> 			linux,code = <KEY_SLEEP>;
> 		};
>+
>+		smarc_switch_lid: switch-lid {
>+			gpios = <&som_ec_gpio_expander 2 GPIO_ACTIVE_LOW>;
>+			label = "SMARC_LID#";
>+			linux,code = <SW_LID>;
>+			linux,input-type = <EV_SW>;
>+		};
> 	};
> 
> 	reg_usb0_vbus: regulator-usb0-vbus {
>@@ -539,6 +546,24 @@ embedded-controller@28 {
> 		reg = <0x28>;
> 	};
> 
>+	som_ec_gpio_expander: gpio-expander@29 {

Use "gpio@29" ?

Regards,
Peng
