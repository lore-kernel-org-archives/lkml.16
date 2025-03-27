Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3D536C;
	Thu, 27 Mar 2025 14:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085955; cv=fail; b=dUXPH+DHhQj9OAyvV1cKR5fY0G3O+vQU2sa7XyAU20zDklLj2bbutDaqwMnHY763MUYdLcozWEsNe14MCALS0Xj83M1NwdmYWdJYwVv2udh3ja+s735S+zPVoWumeut2ZeVhcCyDudVjXpsfXePg5R2q12sPcWm1bLc+4Xmp9LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085955; c=relaxed/simple;
	bh=q/zPa7kOgmJnDn4Ue0FtDFWVLS6n0k0YM8zI/GTzm0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=teMi9r0/6kSIh+03QQ6e+II7qfIehPcnkDHuNar/VZiXtRGP3Hn/vNFFAlvEMOrhTB1EYCvE6jZ3mNXn1+CH1I1rbihpKtrUMR/ZEliR9m6GaVxIYyFIId6v+1q3ftEhTneLhsbu0uS0ccTgNnsysh8NPtzrigsCPcTsy/UETWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bJuqf5lZ; arc=fail smtp.client-ip=40.107.21.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bJuqf5lZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWJpuUvRTsrYtHi4nKYl54u9/E19NjDpDDPT9xTGYOnggzq3vx1aqGbJliggDh+LXfXJ6Xqlw/fdmRLRwBhCMgKMyRkw3Dh4eUamk0Gy6To3YXQ1fsWB8q9xuTSvwt2r8nGYAG1oIuSFpmPMReDUNo4O5aRIAKPDxuskIvRW11l2VtRxwdBTt95K87AVMA+lq7dhrLaPSzTOkic7XUD38bPoLdJBM/EY+qDP6fC+iszUK4gOi1vtT92n45J0xxkxTCmwZIDx6+MGC11N9LlWflLoXh0o1c+4YQET7+Ov0n6Kjf7J/Cx505KgigwwTe99uSTdLFpV9SsKWYhkH/INJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTy+ZEXwALyYm3Ty+NG01BmDPKqOdm0go658F1Z0I7E=;
 b=YaaD8IpbZ0uQ2BwB5FuFZZR+vk731PWxcLX5mJE3NFBTwydnAfqRjPKO21/pCWh4TScNo3ujHnizLDCN0I/XGpTabA4QXouNxzPCF74uXH7DMraTGhjnatL0jtq4OxCiTg3Co6U5j3pBXfYHQN1DFoOpTKQPkGo8JgP1RmlB7r1Yr8RFpMe8mSCAbYMyrFvifEP8lG4/N/pjZcj2/p37t+IfaBgakNPJOzup7RImzcdLmKfS6rGcCSV/1BIHf3DUyZK3N2vPtYne1qnVPeF7RVlIy+qtvMfytwC8QAdx5DUhTd/tit/OjKg0g0BqW7RruNDdyYX56KDTRriJcLyq3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTy+ZEXwALyYm3Ty+NG01BmDPKqOdm0go658F1Z0I7E=;
 b=bJuqf5lZ7ODLF6sxo7O4xpStorzCdbz+ofuKEqnFtJMTY1NKzchI/Iqh2gKuI/6Ut58lGlPGW4VyTd+IeuC1/e8oyz+NQYFwNMNX8zIlHG1brrV6mZcOi2pWmc9DgfqDhhReRzR6/vlCfTJbCYbPUGg5d99pf/MCFegOo5u8ab8ccGNjkfM0QPPeYrB7hQNfTbX5ZroYiamdzOzuKHUqAqb2rkd5DHPIoaqIH+PSRJ8ugEoGuE1Jcon2vxxT90T85yp2Y4k3xsve7vkI/Q14MHGNBd91iMRCZsLfuUgdOY+TonqMLcLnjFh7L54TvhKKJNKqKrNp6SIwj3/T9HnwWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7226.eurprd04.prod.outlook.com (2603:10a6:102:8e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:32:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:32:29 +0000
Date: Thu, 27 Mar 2025 10:32:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
Message-ID: <Z+VhdUlwBjqEaNb4@lizhi-Precision-Tower-5810>
References: <20250327123907.542132-1-martyn.welch@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327123907.542132-1-martyn.welch@collabora.com>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: aa245032-5a1d-49ec-2c8f-08dd6d3c336d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QuQBIo/Wtmg45QKjN10y2EobonMIeVsMUSksyXjYTh19fkSxCW7rJAaAJFiH?=
 =?us-ascii?Q?ViGPt5upk3+8ZU3PYiPwEfWxMjIEmzhe+02QpAhvovYkxXcw9Rux9K3A5cQk?=
 =?us-ascii?Q?ByEH5ahwl5r15cs4Y4kMCRH5SF1RB/PXEWDOUzV6mktOr4ANTQIG7DT8RvM/?=
 =?us-ascii?Q?ncrmUmMF4nqoHUriWQnNqucxTd2CDdnhSvS6Emhw/W0vNignwcoOaZKFk8S5?=
 =?us-ascii?Q?RSWsfPI4aHzJELTrfFfutO/JIMh3B0RyaVZfMlilEv2qqRfw0ycCsVo4+VHw?=
 =?us-ascii?Q?hGZ+qb2wpFcSjF2xFqUuIsJ+3GzBjFYdA7USDHbR+l7Z8EV5+5m29qEnI3jh?=
 =?us-ascii?Q?YRTYNGWWc/2zO0QPcpG31st5Q/O5OsA6uumayDMfpWiOF+6WSIzSqvIOWdzT?=
 =?us-ascii?Q?n3Ss+OC2l09Ac/7nFThKirTLBUfGEPzcjgmDFAvzmQjPWNLjbHSrlzri5/Yd?=
 =?us-ascii?Q?VylMFt8TMurG7kGyJPuHDEbXPE/h/49TEr7vKYFgDQx9e+IbRdT6bqi9UPMN?=
 =?us-ascii?Q?zaqgnO/zuGd7RM6bdStBdcqGnDnYoxkiPTDJnnTHA9EEwP18veI9guNl//GG?=
 =?us-ascii?Q?+2NFtJZEx/gU0tM/HyivaZdqlfpjYxt/DLk6cPEuQAxO1tJI6bFXrK/dmufc?=
 =?us-ascii?Q?1dxpfmI7sEzqaYwq79B00seW2yfrDMafBS3rn7StJMhqMzLx+fP5XmazUIFF?=
 =?us-ascii?Q?j6fIWElObQufiIOGFaccJqF5Oe0MViwpmQj3oVTUzLsmZg/y5RcuxtSRuEiI?=
 =?us-ascii?Q?tqZUHJh9bjAb4rQ4E7sENXpbRg8JwMkPonIwt//pc2K42wYLBLgUTnG7y4Sj?=
 =?us-ascii?Q?okxUYFkhGBJ1DfG7wM9RyX+ah5k/XSyVaPF/O0EL1fe21RB0iQzXAU/ZpuMZ?=
 =?us-ascii?Q?jHMDDoHaea3Gh+/6/YOheFoXIPRWfzaOOjDN87ntLruAMPdal54n4ein0Wzd?=
 =?us-ascii?Q?JBPbE6nl/a9owtnpWtkByDC2KBSc6KsWzAepz0mgh3f8xLPChZzv8T/LXDSd?=
 =?us-ascii?Q?FU8GUzpPRoXYQE6dEBfp7Al2wFB/llymt78yKtcpWMoSFvHN60EfvdFZxNF1?=
 =?us-ascii?Q?80/b1Q0a5nfhDZD679PrQ+cwO0OOu8see1UpCQ1p1xj1huiyVRAanzSF5Cej?=
 =?us-ascii?Q?29H0EOvGFBCM+yVPxLMIxCcAf69TbKJswSRim8TZLNo6gDNkA2fsxTe3rclw?=
 =?us-ascii?Q?+thxGBF2gS+jmcn13QRaB31S5sWP7s88y+1TuYra8ZIWDJMKY5ykWrnAaKNo?=
 =?us-ascii?Q?PumzT2aEHglmtALjI9tnDce9NBxddPt3bgFim/JA29P4SMsBJpcsSgI0TKum?=
 =?us-ascii?Q?ctS39S8FWXxooTxvFygQJrc3FmxvZoPfvE95BWF2Ke3uXiHsIDcUcCW+Ebfo?=
 =?us-ascii?Q?Tj+veLhDJf5XfZ/Fdb0evEd50PMYvPd2EJYxbvjDrY5RMasF5SxY3DAewbQF?=
 =?us-ascii?Q?mQbV1N+TlZMwPN2O7PhAJfkeYoxridos?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nwV2icf9lGZxlxC2QXOOcUqTQMG9IsQHqU+DMqRcevVx92hkFn+RWvHpI2c0?=
 =?us-ascii?Q?1P+4TnlQTPAWPkjNDMHeWy3sgOpQZdWjKXZsS0MyPVi+Iw+fqgFk4vEbNSwn?=
 =?us-ascii?Q?C5EuhzsjAxL0KMJ6mccgTNWkDF49CvPb+7LeUmKlbMrOJfPkNdBOox6DVXWn?=
 =?us-ascii?Q?QnrBPapO1jVPza47p60iwAjtV7qJuDopB9gzOwpTb/OVrHoJNar2C+eoH1WO?=
 =?us-ascii?Q?yInFiNUkTaZswf0helwxCAyROmZou2JXrsXhJMihyXqocKUXAeRx4qfNmTPi?=
 =?us-ascii?Q?pMIHvskKRObkF2v8QyOov64YloLGv2hVdw/Gz/n4GPXvzF1DkJYL/u/tnmuM?=
 =?us-ascii?Q?nPD9q+ANQ8BYuImGsqIp13ps/nnxEREMFUijw+2N8u2lviJfDujw5KJxktoJ?=
 =?us-ascii?Q?ckdQ/uJj1XYvm3pdgMnXcv3sfPqwHJ58j4u7ytkMd0nfIEcX3/ZH1OqxcwF+?=
 =?us-ascii?Q?cv+5g7JjQptWQNyNx/8lsDMbyDWD9n1esVXONVDLPpRmSOlYJrJo4kkI45UU?=
 =?us-ascii?Q?KfcWTa8wPoluMBvGzmTZXPJNZjSv2CPkm/jQq8CzcZwRjSrthtFACudd8gLU?=
 =?us-ascii?Q?MXnQA2qG/L2yfvz6BFM98vGI/UPS3i6ofQxgzM5YR+wJBan/vW3yggB3XnjN?=
 =?us-ascii?Q?W3UWR/YQO/0yw9a9Vet47OtfWr9UO1ciJ/BiU5cQxD0Z3xFh+5gbJY6D4Mdj?=
 =?us-ascii?Q?a3HkIgNAlu+4X00iXXqgrLWN4jmwDeuiWwpIYyUmANiQ2pga/6IT1Hs/fdge?=
 =?us-ascii?Q?s2twk+i0gte4hJah2ZB8cesZYr8T3b70xMbIgEjUQkTxJDzDxJ0qoqW/wh9P?=
 =?us-ascii?Q?KIHfiFUx0wT8E3nTbanFwDs4PTlG/qZn2ZOFOjic2AA1xYpEN514aDyKgrPg?=
 =?us-ascii?Q?+MmRvQbTzfQ1ZWVhwElKY09tdnjc9mUgHNlgNJZpRVKC0UmJjF+sEBAIy46e?=
 =?us-ascii?Q?7OKmsy6+P4hAYBLUFxf6/OcUVp+jict3qoOiDEL+7bb0gLfWiwA/+cJXzLhP?=
 =?us-ascii?Q?W6wJCfRQvRaugY2+YBMHs1PIHfsJsOmmJo2hUYwrvoEW3GcsYlU7rMO8Jjvq?=
 =?us-ascii?Q?/2AP8LhEvRQo9nXZvlQVIIuoZ2/uRHEmiuJxskHySO2oPILMqBZC+b1LEurc?=
 =?us-ascii?Q?bTg7dPSE3wsCl1BCrF3eT8hpRgJFfLNx11Lkf5E8TmPk8LbTihpxF08LHIVS?=
 =?us-ascii?Q?o4JU+1Hd+vrb52jhQZS2jbZmi3w9FRcxYueN3TCzYkhpf0DMxHHNchve0sV6?=
 =?us-ascii?Q?Vtg7fOw5yLXUfLKJnRkmZ7DwKIXjX4QusftlLOh9P5BRCscUFtoQ7Qkavp3T?=
 =?us-ascii?Q?EX4eQwXfNYy3+Za3LzMnauaKZ1Xm2rp8QA6w+8yxhNH07eb+lnhk6J1M3gDP?=
 =?us-ascii?Q?4DZDMyYf6C8pfVpgxa5pS+au4XelXcZKalV+VS/0BTElmdB/Cpx9eH/+0rZo?=
 =?us-ascii?Q?BJcpYQ/ap3mcfs3h2A2yzmjagrINV++zFc0fR5DHxpZe7o8hph4Yv6lB94pz?=
 =?us-ascii?Q?AfH/w/Zq4aOIYXmyxNYGIB/etmwGsJu453rUTaODG7bG+bwKniyhtD7SxM5Q?=
 =?us-ascii?Q?j32gfrJa4g+etHXCguKgBhT38xoScr9KoLOO+GJo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa245032-5a1d-49ec-2c8f-08dd6d3c336d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:32:28.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7tRSKRhl/hKQttU1SA58BAy6rkq6ofcZuy5FbFvJGTr6o01p8WMz5ptO/qlcpBOWfCrp8iEUy26Gyq2dzFFZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7226

On Thu, Mar 27, 2025 at 12:39:02PM +0000, Martyn Welch wrote:
> Add support for Boundary Devices/Ezurio Nitrogen8M Plus ENC Carrier
> Board and it's SOM. Supported interfaces:
>
>  - Serial Console
>  - EQoS Ethernet
>  - USB
>  - eMMC
>  - HDMI
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---
>
> Changes in v2:
>  - Add missing entries to binding documents.
>
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../imx8mp-nitrogen-enc-carrier-board.dts     | 478 ++++++++++++++++++
>  .../dts/freescale/imx8mp-nitrogen-som.dtsi    | 415 +++++++++++++++
>  4 files changed, 900 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 6e0dcf4307f1..de42f684c462 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1113,6 +1113,12 @@ properties:
>            - const: avnet,sm2s-imx8mp              # SM2S-IMX8PLUS SoM
>            - const: fsl,imx8mp
>
> +      - description: Boundary Device Nitrogen8M Plus ENC Carrier Board
> +        items:
> +          - const: boundary,imx8mp-nitrogen-enc-carrier-board
> +          - const: boundary,imx8mp-nitrogen-som
> +          - const: fsl,imx8mp
> +
>        - description: Boundary Device Nitrogen8MP Universal SMARC Carrier Board
>          items:
>            - const: boundary,imx8mp-nitrogen-smarc-universal-board
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 42e6482a31cb..58b33708e4ee 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
>  imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> new file mode 100644
> index 000000000000..323e10b3bc58
> --- /dev/null

New file, please run https://github.com/lznuaa/dt-format to make sure
correct node order.

Frank

> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> @@ -0,0 +1,478 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2020 Boundary Devices
> + * Copyright 2025 Collabora Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mp-nitrogen-som.dtsi"
> +
> +/ {
> +	model = "Boundary Devices Nitrogen8M Plus ENC Carrier Board";
> +	compatible = "boundary,imx8mp-nitrogen-enc-carrier-board",
> +			"boundary,imx8mp-nitrogen-som", "fsl,imx8mp";
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +		label = "USB-C";
> +		data-role = "dual";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				hs_ep: endpoint {
> +					remote-endpoint = <&usb3_hs_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_in_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_out>;
> +			};
> +		};
> +	};
> +
> +	reg_usb_otg_vbus: regulator-usb-otg-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_otg_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usbotg_vbus>;
> +		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_host_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usb1_vbus>;
> +		gpio = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_vcc_3v3_sw: regulator-vcc-3v3-sw {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3_SW";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&ecspi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi2>;
> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			hdmi_tx_out: endpoint {
> +				remote-endpoint = <&hdmi_connector_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pca9546: i2cmux9546@70 {
> +		compatible = "nxp,pca9546";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_i2c2_pca9546>;
> +		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
> +
> +		i2c2a: i2c2@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +			clock-frequency = <100000>;
> +		};
> +
> +		i2c2b: i2c2@1 {
> +			/* J9  - camera*/
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +			clock-frequency = <100000>;
> +		};
> +
> +		i2c2c: i2c2@2 {
> +			/* J10 - camera */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +			clock-frequency = <100000>;
> +		};
> +
> +		i2c2d: i2c2@3 {
> +			/* rtc, J11 mipi */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +			clock-frequency = <100000>;
> +
> +			rtc@52 {
> +				compatible = "microcrystal,rv3028";
> +				reg = <0x52>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_rv3028>;
> +				interrupts-extended = <&gpio1 4 IRQ_TYPE_LEVEL_LOW>;
> +				wakeup-source;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	usb_mux: hd3ss3220@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +		interrupts-extended = <&gpio1 8 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_i2c4_hd3ss3220>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				hd3ss3220_in_ep: endpoint {
> +					remote-endpoint = <&ss_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				hd3ss3220_out_ep: endpoint {
> +					remote-endpoint = <&usb3_role_switch>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&isp_0 {
> +	status = "okay";
> +};
> +
> +&lcdif3 {
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm1>;
> +	status = "okay";
> +};
> +
> +&pwm2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm2>;
> +	status = "okay";
> +};
> +
> +&pwm4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm4>;
> +	status = "okay";
> +};
> +
> +&snvs_pwrkey {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	/* console */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	fsl,over-current-active-low;
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usb3_0>;
> +	dr_mode = "otg";
> +	usb-role-switch;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			usb3_hs_ep: endpoint {
> +				remote-endpoint = <&hs_ep>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			usb3_role_switch: endpoint {
> +				remote-endpoint = <&hd3ss3220_out_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	fsl,phy-tx-preemp-amp-tune = <2>;
> +	status = "okay";
> +	vbus-supply = <&reg_usb_otg_vbus>;
> +};
> +
> +&usb3_phy1 {
> +	fsl,phy-tx-preemp-amp-tune = <2>;
> +	status = "okay";
> +	vbus-supply = <&reg_usb1_vbus>;
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_ecspi2: ecspi2grp {
> +		fsl,pins = <
> +			/* J23 */
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x143
> +		>;
> +	};
> +
> +	pinctrl_hdmi: hdmigrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x40000019
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c3
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c3
> +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000019
> +		>;
> +	};
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_DATA01__GPIO3_IO07		0x119
> +			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x16
> +			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x1c4
> +			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06		0x41
> +			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07		0x41
> +			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08		0x41
> +			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10		0x41
> +			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05		0x41
> +			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04		0x41
> +			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03		0x41
> +		>;
> +	};
> +
> +	pinctrl_i2c2_pca9546: i2c2-pca9546grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x100
> +		>;
> +	};
> +
> +	pinctrl_rv3028: rv3028grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0x1c0
> +		>;
> +	};
> +
> +	pinctrl_i2c4_hd3ss3220: i2c4-hd3ss3220grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x16
> +			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x03
> +		>;
> +	};
> +
> +	pinctrl_pwm1: pwm1grp {
> +		fsl,pins = <
> +			/* J11 mipi display */
> +			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT		0x100
> +		>;
> +	};
> +
> +	pinctrl_pwm2: pwm2grp {
> +		fsl,pins = <
> +			/* J28 pin 20 LVDS display */
> +			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT		0xd6
> +			/* J27 pin 20 LVDS2 display */
> +			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT		0xd6
> +		>;
> +	};
> +
> +	pinctrl_pwm4: pwm4grp {
> +		fsl,pins = <
> +			/* J31, pin 36 */
> +		MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT			0x116
> +		>;
> +	};
> +
> +	pinctrl_reg_usbotg_vbus: reg-usbotg-vbusgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x100
> +		>;
> +	};
> +
> +	pinctrl_reg_usb1_vbus: reg-usb1_vbusgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x100
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x140
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x140
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
> +			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
> +		>;
> +	};
> +
> +	pinctrl_uart4: uart4grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
> +		>;
> +	};
> +
> +	pinctrl_usb3_0: usb3-0grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0
> +		>;
> +	};
> +
> +	pinctrl_usb3_1: usb3-1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x16
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO03__USDHC1_VSELECT		0x116
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x190
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x194
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d4
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d4
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d4
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d4
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d4
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1grp-200mhz {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x196
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d6
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d6
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d6
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d6
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_gpio: usdhc1grp-gpio {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11		0x1c4
> +		>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
> new file mode 100644
> index 000000000000..b784b5d936b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
> @@ -0,0 +1,415 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2020 Boundary Devices
> + * Copyright 2025 Collabora Ltd.
> + */
> +
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	model = "Boundary Devices Nitrogen8M Plus Som";
> +	compatible = "boundary,imx8mp-nitrogen-som", "fsl,imx8mp";
> +
> +	rfkill-bt {
> +		compatible = "rfkill-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rfkill_bt>;
> +		label = "rfkill-bluetooth";
> +		radio-type = "bluetooth";
> +		shutdown-gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	rfkill-wlan {
> +		compatible = "rfkill-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rfkill_wlan>;
> +		label = "rfkill-wlan";
> +		radio-type = "wlan";
> +		shutdown-gpios = <&gpio2 19 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@4 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <4>;
> +			eee-broken-1000t;
> +#if 0
> +			interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
> +			reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +#endif
> +			reg-mask = <0x90>;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	scl-gpios = <&gpio5 14 GPIO_OPEN_DRAIN>;
> +	sda-gpios = <&gpio5 15 GPIO_OPEN_DRAIN>;
> +	status = "okay";
> +
> +	pmic: pmic@25 {
> +		compatible = "nxp,pca9450c";
> +		reg = <0x25>;
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +
> +		regulators {
> +			buck1: BUCK1 {
> +				regulator-name = "VDD_SOC (BUCK1)";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <2187500>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-name = "VDD_ARM (BUCK2)";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <2187500>;
> +				regulator-limit-microvolt = <1025000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck4: BUCK4 {
> +				regulator-name = "VDD_3P3V (BUCK4)";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck5: BUCK5 {
> +				regulator-name = "VDD_1P8V (BUCK5)";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck6: BUCK6 {
> +				regulator-name = "NVCC_DRAM_1P1V (BUCK6)";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-name = "NVCC_SNVS_1V8 (LDO1)";
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo3: LDO3 {
> +				regulator-name = "VDDA_1V8 (LDO3)";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo5: LDO5 {
> +				regulator-name = "NVCC_SD1 (LDO5)";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	scl-gpios = <&gpio5 16 GPIO_OPEN_DRAIN>;
> +	sda-gpios = <&gpio5 17 GPIO_OPEN_DRAIN>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	scl-gpios = <&gpio5 18 GPIO_OPEN_DRAIN>;
> +	sda-gpios = <&gpio5 19 GPIO_OPEN_DRAIN>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_gpio>;
> +	scl-gpios = <&gpio5 20 GPIO_OPEN_DRAIN>;
> +	sda-gpios = <&gpio5 21 GPIO_OPEN_DRAIN>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> +	bus-width = <4>;
> +	non-removable;
> +	keep-power-in-suspend;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	no-mmc-hs400;
> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x20
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0xa0
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x91
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x91
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x91
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x91
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x91
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x91
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x1f
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x1f
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x1f
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x1f
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x1f
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1f
> +
> +			MX8MP_IOMUXC_NAND_CE1_B__GPIO3_IO02				0x10
> +			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16				0x100
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c3
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14	0x1c3
> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15	0x1c3
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c3
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c3
> +		>;
> +	};
> +
> +
> +	pinctrl_i2c2_gpio: i2c2gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16	0x1c3
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17	0x1c3
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c3
> +			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18	0x1c3
> +			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19	0x1c3
> +		>;
> +	};
> +
> +	pinctrl_i2c4: i2c4grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL		0x400001c3
> +			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c4_gpio: i2c4gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20	0x1c3
> +			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x1c3
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicirqgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00	0x41
> +		>;
> +	};
> +
> +	pinctrl_rfkill_bt: rfkill-btgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09	0x119
> +		>;
> +	};
> +
> +	pinctrl_rfkill_wlan: rfkill-wlangrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x16
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
> +			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
> +			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
> +			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x10
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x150
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x150
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x150
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x150
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x150
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x150
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x150
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x150
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x150
> +			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	0x140
> +
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x14
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x154
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x154
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x154
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x154
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x154
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x154
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x154
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x154
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x154
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x12
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x152
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x152
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x152
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x152
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x152
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x152
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x152
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x152
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x152
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
> +		>;
> +	};
> +};
> --
> 2.47.2
>
