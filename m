Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96612254B12;
	Mon,  7 Apr 2025 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052837; cv=fail; b=Ec8RTo/0oSWQCR92wq5+D3y7/G1ZbtLoIMhaa9CXA2pEOoYmx3sOIIC/E9fB7DcLQVvQTRTI0tiZIdc1WazQlKbqLeyp+o8fSVBmEy8Ej5mdjsIesJQmN6od8HLTa5zqWSjPpIHyh/QjNNR91InB8iV6K81kdJMBYeOul1SRZ+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052837; c=relaxed/simple;
	bh=UXBNUbn4lCtk+3McHsQlIMlyUVRgrgIA52VFC32PRaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y77+Q4KOmG2TcDF3tsuvujDJIZwA9yPZ1ea26Kqvo6ZyOaqv4FfWsNflTluw9UjJWK051XqF02LSaHzYfWo0htPPBaQ3Z8pon1UYTKtSLoop0J061oe1iFxugg3OS/Z9aFL84QszI3on5zmXklno0epPPrq6jpeDFoH6CT7emVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IQGna02C; arc=fail smtp.client-ip=40.107.22.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IQGna02C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yT8AKaWW/QV/FG0DBc5ruenDY7tdaLEfXJL86tsV304NfEvSRXBWbeHX1DRArm5h9NiXLGEJg8a44MeG/st9lWimDTFLJbogQv0cGgAjbNTZSPnBOWWGq/q2kowS3oUtkUq5n2Zu+M01pYJEKEkMFiMJAEzXVZZChk0iwf+WX0fhNZ6Yd9CmunGzgjD29/GLgA0Tto9iPIGlMsyjayjf1xTDVVf1qcboiiaD89ks4sVAuJSUT3HixQft2a7/02qIcxx3szVf6b86X92subGBm6h5KhymZVey32Qe0KmGXHYrtag2w8aITHBKE4mpGo0wH0Os2lJOvtRIoH457ZdM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE4VXN8oomrf8/htLiQWVW36VB6ZBZx/RC2d1k3/kQA=;
 b=tbDhaUOnCHhuVDcso35hf898CkRPsB5joZNv3cAYP18ecGf2POuGhT1qAqGSuWVTF4zObwFM4vbphCRpHtlP3tzd/d4NB3YHobxX5sD/bFlZIfile2q2zCEDvnkOAUUfGNIe7CJ2LkuODN/N0PKnBCyp5vDjmUgk1wYK/S6uVvE9ecG4sGjZ7uXCBAbKf2Kp/+52jnzxnEHOsNSmwTJfrJqQ1/0rcVQJ5GiBv85RwEvhGxLbBdTQlSnaRmjVBoiZ21o4RVipT1ppCAArmQYERFacOjNihdQ4Fcq1DCJ59vQCWukvgcgRaYf5EcnNDO6BlDQy+eqFBxqKJvP9my+J0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aE4VXN8oomrf8/htLiQWVW36VB6ZBZx/RC2d1k3/kQA=;
 b=IQGna02CH7UnYsD4oSO1vtpYX0x3Mi1oMr1iAgIP9RjPc8ipTKtYD2AtUWQFTsWGoHaJYNr/E2MlCF9EdcdB21pnmaV2wW1M7peZuPIgsp/8S5XopEmaYWBIOBEdXuvllIAsT27XNTdsW1helqA3odcbT7o9CTisrdyHVTBCjxMP+5klrZGVIGARHg1Wp7uQEWdg7GOp0ZfY/KgEyswaqFt4G2rnFx7ZBfiKosgvPWbu9JMd71VGIz32uimSCQBZp5SgNItwGlyiJ9OAAVK1WJNoy21UCUuV7ouyK+3ulTdZMVv+drzaO1bTCrTfdCVEfsU9WN1nhTWGtXdhgIvoYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB8046.eurprd04.prod.outlook.com (2603:10a6:102:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 19:07:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:07:12 +0000
Date: Mon, 7 Apr 2025 15:07:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 4/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Message-ID: <Z/QiWLiX010ghlLR@lizhi-Precision-Tower-5810>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
 <20250407-imx-se-if-v15-4-e3382cecda01@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx-se-if-v15-4-e3382cecda01@nxp.com>
X-ClientProxiedBy: BY3PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:254::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a2bbac-3cbd-4bb1-3e06-08dd7607675b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?55scpPguX6FXM2ZTdy1XlrEJIPKAYQl+UuEO6stoNw6rJbsxvdcG6iPOwe73?=
 =?us-ascii?Q?Cpl8txtS1aiLQs0yoAVu6/Mm5osBoiMgz3sDCVkUhZ6Xs7chWag12hBJs/+z?=
 =?us-ascii?Q?qywi88VH3fdQRaqnItJqge/7GaAxBZ1CXtqb+PU7vQUp6aeTtgtR88VQsDi2?=
 =?us-ascii?Q?uVh6UtP4s1+ZjJlr/eNwBAnY5wB+cR8QeV8bWy1Ot/q08lrqG5GZAcw4BHKU?=
 =?us-ascii?Q?DvR3He68jcm7XMjVu+HxPkqs+uLdpwAgL5PvxN83SLsBa407vS/wcWHHHQvC?=
 =?us-ascii?Q?NIeO4QOk3U3hm7L8HQerUgYf8NvHkpqCe5j1Ege1sEaVwltt3BitBd/7HmMQ?=
 =?us-ascii?Q?geC/hhACsCo4WB+xANt1nckpYHGa1s69WTBK+W9P19dW+3GNCYqOERQR3tAp?=
 =?us-ascii?Q?O1BteA7wiSojS4GsxnXU0q2dygrf9EDBOJ1/badp+5tEacU4xqzwiT56YI8t?=
 =?us-ascii?Q?2e0Wli88GmDCJYAqcbFBOx2MA7/7PGuvISnaYkdiqfkp5EceDi96MiDBBPwA?=
 =?us-ascii?Q?u6j6XYWJeVhKc3l46vQeIonRDRV6nDeqIwByFPgv4QPCDDNSkroQsF/wt85O?=
 =?us-ascii?Q?BalsRgyGGPmKQCbfv/0Q98SlPDftIlAU3A2hW59inpMiBqeKquXby4us/ose?=
 =?us-ascii?Q?fhqJeuOUta2+LI0ol6E9Spi4ZwgpRXdWP8CER6bA78mTyhl4p1fRqoTPlhAE?=
 =?us-ascii?Q?OGfQzWDlms5rY1l962W2PTGF3lW0BPCKfAw1PQT2L5E6sOSQaS7UWFYG+qGP?=
 =?us-ascii?Q?avQfPUDmCoXcZBiUjcKqM9LRHzGgf/Lf6Iv5hgv42rZ9Qfs2sgRs9hColObc?=
 =?us-ascii?Q?ie0HgWj+yz2SoiMYmUWEOPPoLkiSA0b7dPBlLmKu5BeUqC9LkQmZIZqToz0a?=
 =?us-ascii?Q?DVBb3jDDBu25KgygEgOzacfT12G0IJ9e+v57qYEQazZ+OyEpxNqtEF+gPCmG?=
 =?us-ascii?Q?9rNAJudao5SAONAAZMro2ZasqXXiflxfb5WE0prWeDcnBY5W6+FvMkyBZ7OK?=
 =?us-ascii?Q?LRGepA0zfy0KS/wsYPPMSQJujsc8h3NOeSrcV/neAQDjmftcPqVXoEJp8oR3?=
 =?us-ascii?Q?BGO0syOaDBlnpWKvnUXvGDael4zqJ/KgHziJ5oKL6zxgW5vlSgpaHDWISmVq?=
 =?us-ascii?Q?As6LLgoMFcvGzhEoM5RV0VgMLv7ePfKIay2Qfm6UXhrPOaqrc6VeamCFCs8+?=
 =?us-ascii?Q?V3vWvQfdpCA1rQk6cb3Rk0ntVU+rAPXRiLMDjP9BeDI72PGK6SpGTQxFaJra?=
 =?us-ascii?Q?dzjb/ntmz01cm7KCkxeMFj/2E2qf/E++2EtIrbMFHok65dp9KjA7Ih/BZPlo?=
 =?us-ascii?Q?u30/l6AnLJ43aT/R+WR/r4vMOPmlEXUpM/d33tNfPn5virdszooyLlqPn+Xt?=
 =?us-ascii?Q?b6ty73Efq1ojUUO8l4D6cenS2kq9F/LXnIUbWA2fHEYU6u5lzohJjZjzf7vt?=
 =?us-ascii?Q?ntaRfjq0ge9ECJ9/qMyxdeV3T6iDCIJA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IhYlMb54cCXk/lImIpS+BA/g3EpfUBjJJ6UemjSOcSPMOpibYeiGyJKyi6/8?=
 =?us-ascii?Q?zM6TDT722lgTM5rwpfdXYtMxC0AVxZEzvP8ihA8EyzPBIK+YXD+xNfzWxsIU?=
 =?us-ascii?Q?TDMZR8LnBg1VYDU0aW6ILb+Z5/aiI5Uf9duXblx+JVVWMfLRt4+dEhEYeL3u?=
 =?us-ascii?Q?6CjImAiUaFkS22TQ5I2STJD4AGxrFOisl94jqG+Jmf6pHvbNw7v7CgrJfMIT?=
 =?us-ascii?Q?wGfpCmYoRgec5iYbrv9pab6AdKvtZWfYE80k2iBtiQpKu4Sslz+7wfiAkGKW?=
 =?us-ascii?Q?p/mFzVsWgyYYPMOLr68RnlrbTEdMenD95gWgYpsakJ40NBygN4CsnQSRiQe1?=
 =?us-ascii?Q?5XtwpXE0HGqLMIkOYGR+6X8CW345jujKoVbHTx920G1hUg5CMpU+eGkUAAbz?=
 =?us-ascii?Q?hlH1r5DidK7IqyebZB4qgUNi/QlhLgXd4aOh7JQJAofybZmq0pTUzyA3O1O9?=
 =?us-ascii?Q?CV6LRXeP6mgZarkD9SA8aLOmpnx0gTX1xSljOHXjd3YjjG4MZXYcaQUAD3wZ?=
 =?us-ascii?Q?qUmTEcz67x2L5ingpn8AZIzXB7bQiyaTGYo1+0XFrcvAJ75jv+7inwJL/mvK?=
 =?us-ascii?Q?rMpiWD+tFKeepInPnkLlkP3D1SaxdmJSDMm5UYd5Zju8e4eSUMZcJzZ2cdXd?=
 =?us-ascii?Q?+ni2fsOq9VJd10utaq4Ub4jt32PGQMu+oHEVoCbSeWD58KjdUnL7o21Mtp4C?=
 =?us-ascii?Q?7m4F/wVuAWQkersdqXgaybl/kIOeAZwuILOTVaafE/yR5j1b49BU4Iyac95Y?=
 =?us-ascii?Q?xJ9cY7USGBds1CWTs4xoPlUJ7T3SLUFXwQ8246KOOfk+nQQDRNroV9nw7UTe?=
 =?us-ascii?Q?pfOH6TTR+EsAKPR1lURyju10JI6K/o5d+2CcoEtlh18dLuAFIyL5BwRneQ+0?=
 =?us-ascii?Q?VHOOoo2br9goHys0hDMuzUdhH4M6VP8KlSXvwcLHc3sBXE+l7FgxCEjsV0/v?=
 =?us-ascii?Q?fMnAnAsZ3c2urBwIhAmQ5Opi6a9NmGeMNEMxYLcE8drM7gtW3pLrornheRPR?=
 =?us-ascii?Q?kmhyg5Z/VK/R3hKKD4hB8+ce8owvAo8Jqta8d7QEMMRTKCjgucPQAcUA5HmD?=
 =?us-ascii?Q?PkTucjPYbND07+1nULklf0aiVvRBmyOTfa3pdS0MhbXGYA+4gEXSTULuY6pH?=
 =?us-ascii?Q?W04I9jkRijFGiLl34AdLgYpduGmBaJmmiYv/LU5scQ/GKRmgXKnAu5LX3Kaf?=
 =?us-ascii?Q?fPG//KodNWVUbxnKVbS+Py1I15o1CvFMJ0VHCcb4Y0Ee2SlqeVJfgCTw4iUN?=
 =?us-ascii?Q?6GnRT0mxjSZOi8BT5VVt7BGddmdDaRQaqxsRn/YXkDvtPiCY5D6ve5fBscPC?=
 =?us-ascii?Q?CqPBiwKdMV9MhThp75kAGpmj+ujHDxACtIsTTv0gQFM3h2FcYS6EFxFM9I7o?=
 =?us-ascii?Q?2KxuYYC9IqDWbXlxNjBFA5n8GEbnsO7WElVVyl8a2M4tnHM9CgnjqsniFb/c?=
 =?us-ascii?Q?ClNZmcydB7rjj2O2twELFfP1+F6C9fE7Uw4ywYKsPv+7nfHHqammFsC/3d7e?=
 =?us-ascii?Q?XZ25NJePyc6pmYiqaB+5Kx9F+TiDdHNl+RxZ2csnuMCodbbWW/UK++BnirhU?=
 =?us-ascii?Q?inOKR21xbao1EkOcisUHaAduZID7bWXJ+EGNE5pb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a2bbac-3cbd-4bb1-3e06-08dd7607675b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:07:12.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSea5wx3fNGncERfRUDa36Qi6K2mDa5ov+7JP9sM9nYwH4lP4TeeoU9p6iosozqtSoDhKHYR2v4C8SbsJpg/XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8046

On Mon, Apr 07, 2025 at 09:50:20PM +0530, Pankaj Gupta wrote:
> Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
> limitation restricting access to DDR addresses from 0x80000000
> to 0xafffffff.
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> index 290a49bea2f7..10aaf02f8ea7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>
>  /dts-v1/;
> @@ -37,6 +37,12 @@ linux,cma {
>  			linux,cma-default;
>  		};
>
> +		ele_reserved: memory@90000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x90000000 0 0x100000>;
> +			no-map;
> +		};
> +
>  		m33_reserved: noncacheable-section@a8600000 {
>  			reg = <0 0xa8600000 0 0x1000000>;
>  			no-map;
> @@ -259,6 +265,10 @@ &usdhc0 {
>  	status = "okay";
>  };
>
> +&hsm0 {
> +	memory-region = <&ele_reserved>;
> +};
> +
>  &fec {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_enet>;
>
> --
> 2.43.0
>
