Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F13D41A8F;
	Tue, 15 Apr 2025 18:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742849; cv=fail; b=OIQGbjmU7xoz3pcuXT1jAplSOApHwE9YSC22cN7aaXIEj5wqbzDCZzBoIC5oHz/JfuZLzQmSWI8kLkQIJVsvZ7lnSLyLaCKXO/zwn+d8ORfgjhpYiYuSthOssf3ZwVXRHqm6+rZjqprE11Ob/sUEFTu2CdXHmULnxNRiWHGAO1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742849; c=relaxed/simple;
	bh=FT+sF+Cgsh1wYj3owyEmCRrdpKeDrEPB7IYZBF9R1+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kZnkwbZ0z0A0NGrgUA1hfF5Pj84g6tonaQLQJAZ7sP6ttRdHjZHtdwIsO6tjY39tochIJBuZ4WGZOLF2SL51hSiGL6TQ1E6AVSqK4CJ4W8zwrbN2TLuOhpbnGS+fUw7hbCyWmNG7gD95p+BCLhJbkEnkTeOQHbYEiodqIIIF2Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cMt8q66o; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cMt8q66o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+AxAsLz8VRnw0x8Wrl5Jop1p69fc5ZTBSO2t2fUVdZgoVDKnHWn8BQ0f05MzakTA1DTKmZsUpSXAPV0Q323rX7MfEjYCN0jz7LTa7K5Y8G2aaZPA/nyaWu15xDSPwU8aq7ZOkwiQ3RcP3IG+OzCrVaRoPLlDUw+Q5Xlwb4gQo5/441jaWYXkLtPEgsLoRQ0Cz1glSsJMJeTuRsz/mrsp5fEcSDBH/KyGwSsMMOafam8LVbhy7tKd5v3vxPDL0OH7F94LzEmQhwzHNDpVofHWmPyy+JTG0Qsze7BjVlVtYr8K4+7XaHyrAbjjkisnu3iJe6Z30ushz5l8XZbqLHnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz4y4PT1esE9BG1tDlB4trCc3ToGvAOm8U6mABkvG2c=;
 b=pXRnwzjjG94ME+G576xXiYpsi6eMNHhUYQssEul6hVqwz2qr9W82rR0pPEpeRMpzaKbJkr6BsYAx6FCUPTA/5gH/f4w3aaCTyGjqqLPMxMD86fZBC0FlhYCIsJQj7a0dwXArnpbCI+acNd69bL6G1TbP58lZborTs6O8zwpdeha9iUnCt5g1KCfcDsP3hqrOGcSZXDonPozA68pD0In3JMy2HbNOzb1FigKIMT5u0kLaeBoR/OcwwTLEfhrJJg0CurmJ9ECe2a9C/Shb1rzD63VFmYb0ZDaJyxPXCidmN/79RKmC4IXCgtWd6hOgneXcdNvo7TwxmLAq+Li1yh7+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz4y4PT1esE9BG1tDlB4trCc3ToGvAOm8U6mABkvG2c=;
 b=cMt8q66oTBCa8FVoqu1nGhY3rlsR4czfI7DW26BTCI0GUJnQ+Yv9mK7MWB2dShjt6hk7nVqQX+6uzL0V/RtcwYD0231U9BaWZkQ2gMOX4pjIDQomruiOOwuV7JFKmqovPJMYEEFjlkXDainuyp70QuhilnBbn3uOemNK3VSeNEgQuUwvo7LOXjIUWVXnucgGq01/lf+pO7XkzqquJyVvuJiirhqOiRa4McGzx+RHw48ijnzCKxD+sF6zxS/vBhE/5m3bzWW98h84BEGifkwHY9kQ6PXThFB1rhhRsoP8eE1OewfZGtUzMLw0J5z2LeoRXu5H3CLlHedpj2ROSELleA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10447.eurprd04.prod.outlook.com (2603:10a6:102:413::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 18:47:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:47:25 +0000
Date: Tue, 15 Apr 2025 14:47:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 12/15] arm64: dts: freescale: imx93-phyboard-segin:
 Add USB support
Message-ID: <Z/6ptclaeXI2yr9r@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-13-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-13-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10447:EE_
X-MS-Office365-Filtering-Correlation-Id: 877db493-b826-4e18-8f4f-08dd7c4df67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L4cUbj3jpGimzITj77GzukKZWGoQ/DGRfVUXRHcbAnGz+8QWX6jF6YNf//IS?=
 =?us-ascii?Q?6NfCI91QHWTqW/EQ3D9h/ixMBPsDHCOqVcTnzDpdET4Zwbdx2hBr9Xb74RFy?=
 =?us-ascii?Q?eN/GQH3OwDMpZSOgdAvEfcw782p9Ng2VOZE5rK3W7u2dZEWR22xKDsmdnpzU?=
 =?us-ascii?Q?XM0fXPrsbtpuj4vZRKJMVD0QysHbaMIqHnPzlXWQMC/i8L0H7chxvertcxTQ?=
 =?us-ascii?Q?iHemR09mDvBjE6VGGRQDJjdf2H7sbV/S8oqfRF3Yc9QfOY/USm6JCNXCTz4c?=
 =?us-ascii?Q?sgn/8CtoidxRb+R5Zyq2uIlFEQXLmBx9Z8bJyl+a3AiwMbGQO8K2yTqd7L8+?=
 =?us-ascii?Q?MaXySSxHS2TyHsXwJwTZqfgcv22TCuBV9SdCK6poQ/AjWfmAtR0LAEIPAlM2?=
 =?us-ascii?Q?IRXVnqV7iT4qoWOzvqj4LoJQ0LPOu+D8qRTLmLMgeXYN4piZc88nrRQY4yEZ?=
 =?us-ascii?Q?d7152NeaNXsFZWgc+ID8setvVflrMRmbsaXgC/Mgp0hBLaQ7cBYuKgxX/P4Z?=
 =?us-ascii?Q?Z2YlRO3Mk1tTU0Fx2Ury4n9rJ8IJ8gxf6uhj3+SoKgggLdzMuzlBPz5Wr7r7?=
 =?us-ascii?Q?141yGEALwpr9KM8C8M+cfCnSI47KdFdIUnO6ymbdFLBt8tsFlShfrEDv4eeS?=
 =?us-ascii?Q?oKc2ZiyrDR2+2fiSQxRt623bT/H0+crd35oG+5uU8FjCjCd6T1E5RrYXV5ij?=
 =?us-ascii?Q?WU5xmTzbpyQT0dKKsTn8F02eaGmFT89wySP8KqE50oK/cfdOfn92sWXqTPYD?=
 =?us-ascii?Q?CRevVuNMJ8ZCJ17DEyLMQ4Gla66ldlFT1NBHRFaBM5pZRtauOtL2BnxRg5gI?=
 =?us-ascii?Q?7YSIMKh+Odk4OGvnsnHwXI4b/xcmmBsNHJlzYoU4Zy54HEDpVnfYZ/HPmQiI?=
 =?us-ascii?Q?NMC+9fQQJoJLMubB4aZdbn6jn/j4jstV65deI+riSGaiYIIJclBDCF6ZaD7e?=
 =?us-ascii?Q?l4S/l65zVqmSFfiHdIdnC17sDMelNdbhFMyHCgjD7Wu601JPPYFqVqRGZQrP?=
 =?us-ascii?Q?m9C9w1q2D2qOSavB+SnXHxPlt8ckVlLXH9m3GaKn27ud7CFZnuoEPtbX0AqO?=
 =?us-ascii?Q?jtRRGkW1x4rpLA9HWWr/ekFZSTRA4kMBzlXl2x0AtVjRXLGTz8DKqQ8yPL59?=
 =?us-ascii?Q?C+PgXdHn7xthfCVxfDrCgdl26IEOzxTt3QVSWDjm0Vc/46NtdXgKZ1KGXzPu?=
 =?us-ascii?Q?oetwxc8zLMMpmcgyYxA7E2pgdq/4VZQ1A8pIz+R2HWuL1q+TgGMrcVngr48I?=
 =?us-ascii?Q?5nYj3Ils4aAXopRoIy85Yiwq1wEf9UTpYw/QHu92sdgFmwPJRGreJ4sWSZ6v?=
 =?us-ascii?Q?kpgqXAbV7U40GTq8Q01j78HWkneg/qmZ9hGIG54pMOnbg6Gw0t7camnDEUmJ?=
 =?us-ascii?Q?V6zR8ocUyG6ivB+gwOaTEPMPtln/B4krgQ+M8i5Im+lK0aT5TULrkPpUHgz3?=
 =?us-ascii?Q?SPWIKZoUwDQhIYMRK7h9NTmVBR8Q5/1nWDQBLSmruhNHqF7/gHo29A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jqEQxL3VgGmWYM+HKjzgNzYUsg+aAlV+WrXRcunXAXhe6dtXeZ3M60VzpRAt?=
 =?us-ascii?Q?XttM48xwOFAGC/+k1/4JtQe56PbHr4shVOmGd+L1wDydgjgC6/jrYc+mkmQZ?=
 =?us-ascii?Q?9yesFB96ebM3pCFn7xjD8zH8qWmM6ty9+Pw23wAePGuWGzDywq+kAHXTqeKr?=
 =?us-ascii?Q?IGc3G3wqfUDN2mz3T+oncl7Cg3n2YFrmbGPUsJTIQzKDOyBAtd+DKooMxfW/?=
 =?us-ascii?Q?pxIXV9321v/u6/Ov0F2wlo1anLiq59eLaMPEgT8QE9R04UIe5AivgIK8GuuF?=
 =?us-ascii?Q?qGOEAOpxL+9GUaC1mR/xQYdGYy0VwA5Y3LYa2NTpbxW4/Fdvm8tJx8kDAM8+?=
 =?us-ascii?Q?56Eufji1xmlzn4sxTd9osHwFUtdbgIg0rpNcRvyJis4XKcr6WvBZW4Ywo6f4?=
 =?us-ascii?Q?ihgl0HybWrl+r+u33VubQf+V6yNrqOuO/TH+GsEpnv/nDOqKzzj0SvITyNqX?=
 =?us-ascii?Q?/L9X2KNMCFzXS9n/AaMH6krvzh3ACW2mcXYuX2FDlhyDwAzzhK+6vZxni6EO?=
 =?us-ascii?Q?s2OWWAMJXWt/CZjQkBsgVbcs19kiyo+ZuoLDsss6PfY8O8QzOgnubeOxCoFU?=
 =?us-ascii?Q?InVGe4Lztr0gGJV7xclI0iAMmOo87DOd2RkIoUU5qfuqQhjtusruBu93lAvf?=
 =?us-ascii?Q?mRDuogBgTu1Hhr6y7D5Yn6UcP70Tck/Qy0+u0xiIsvf1UXJuk9eeTWx98G17?=
 =?us-ascii?Q?UYMeeCh6ZmmtelRecnPk2dTkAwBIzSOAraGRkwiJkHR8HAOQBqPUIqbSamxw?=
 =?us-ascii?Q?jfwoz6C/VAuvEwtprYpOTRGRbQ+8CkSKC7ixVtEJyBWQr3l16/xooRt/Ptij?=
 =?us-ascii?Q?bRSG+wR0/TFfO/7A0Fidp7imb30vSizf+gXXJC3zGd5rnve6KFxjzpySK7aT?=
 =?us-ascii?Q?wuvx/6bbEzaIWKtJBzD9N3FIc0fHy2fl8/diif8bn5JcPZ1EZ68pnQDxh6b2?=
 =?us-ascii?Q?GWgH5GOgAoHOD9jEVr3NRzYWcqWVe9Fs8r7zJz8dC1MWGwBhXqePIb3LXOt7?=
 =?us-ascii?Q?jJ2PO6aWivHBOKZwk+lktY62/26DYh2WPy5c2QBguU1qvHgE4tuyOJXgjcB/?=
 =?us-ascii?Q?u/QOpfcfxznCtRmcJx3p/gkOXkC/STTunuAwg6xmtowN+9XTWob2ajcqKfHu?=
 =?us-ascii?Q?Yt1urOcXtyBDoUUOY+O/D3ivCpuAXhT0manysqrbHOkZpe5jFI0Q7n5Q7IM3?=
 =?us-ascii?Q?VBsjlg89VPJPp0GCny+xdBRJookXbcCI6GwLcl/+V6YRX2mPmm2Nv3lH4pYD?=
 =?us-ascii?Q?6mFquR0JeYT1Q1y4G9c/5VMpqqKN+HkYFqzlIgD6adZvyFzpeIJKmywUmJ89?=
 =?us-ascii?Q?w90RLm1LfjkgMavXgBs5fHTMyTxzqScJEoMYz+I/ibZsVKBz5buLhb5cJADE?=
 =?us-ascii?Q?GjGBAD1ntJ/OrQQvAwcu8OzHt76bfMKS5pk5Td1ma5NNPmr+TS/yxH4OkPsM?=
 =?us-ascii?Q?fWjPi3993uI3dOEbGjg2yvR4BD6wKyqxtOdfSGPUU3DTMhkyjSNWIMXhbpVN?=
 =?us-ascii?Q?dulMutxqkOZH574g4qREPPqMAATnG1/JMXAysYOuJb6unO9lWytCubyGTqjB?=
 =?us-ascii?Q?eoKefQxsdWJB7eqYdlI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877db493-b826-4e18-8f4f-08dd7c4df67c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:47:25.0590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GYr/+ZFd6vIRhEDsqgXSaxRyINE6OXUZatR7RdQDJACCgHRrOaafkTFHoBChyPpkbHptJuGM5n/B0Lp+VzdoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10447

On Tue, Apr 15, 2025 at 06:33:08AM +0200, Primoz Fiser wrote:
> Add support for both USB controllers. Set first controller in OTG mode
> (USB micro-AB connector X8) and the second one in host mode (USB type A
> connector X7) by default.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - reword commit message
>
>  .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index be9c0a436734..e4f959f665b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -80,6 +80,19 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +/* USB  */
> +&usbotg1 {
> +	disable-over-current;
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
>  /* SD-Card */
>  &usdhc2 {
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> --
> 2.34.1
>
