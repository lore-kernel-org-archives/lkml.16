Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BA418BC1D;
	Thu,  3 Apr 2025 18:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743705106; cv=fail; b=cfQGWyPBaBrJUObOyGR6GIhKrsSC+RzFOFRk7decVE+zbwcC+9DyF+z310oEIhRtqKjSp7dps1nx7Pk6aOeXAE6W4zD4hp1ixN4tnLfYrPhbDZOPRn8zKrmky4nKX5CK8/Q1AQuqWAFvHVNBLZz5ysvsVuZHtu8TgVBPEjCZ7Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743705106; c=relaxed/simple;
	bh=AScPlR5hbx+gAPsrdLApTNIWzlC2nTfd9t3SKNmctQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=py6OsMzVeKVn2a52GrgmXrVV/6VbHciwOcMtoMomhVKJDGtplSQfLKGO1Mcm+X/4oZmKJkBTAfokh18gxWVSKHFgPljQEfZ8hsf2XRQzztG71aWT8V2XqTi12DkX4tuEhKpPr6NapKOvNnmG9iD1/r7XFjmXm1LCHa3KZc4Xa8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WH7zr+BI; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WH7zr+BI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTBHo87aqojrXJqNxeA+XS3B9q8PIHd7SpVXldwDjxQ91uOmdJJEpk0jHqSWWCYwProNqd6fUodiq7wSYU03UUKekJ5l/3Hu3i3KP9thMhgV78Vj8w6itNyqCRrOvrUNxTYazxQHfBJVFLvjagAz9F+ljXg1CC7/8O4NyftQr0VuVbVGgWJFzJMoSdOu6e/mpLLerPfkKl2JHYTS9RFLUTIDHuWTQs9/a5CuoUU5IyGLYjx1kyhPxEHFkRdHfXqAtba9noy1btjqDHbHTOjObcnVcmmRZCe4sTtuOktqPU1sD7wh/usXXYhWBRx7XuOBfqFDVJh9T4AZ2IW4ozDQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RPCwbiprTmdP7lQIFyeC35n82z5R0AwVfawSjfe/3s=;
 b=CXHnXkvlSazLTv0KJcf2l7+tyv4onutjBvK1Qcfdhc7j4pQPLTTnUfalhFN3m/zRfPjeugRyEMYotDZjUaoW3uk0IPRhVLi4dZT37q+hIU9vIKVBkx+uQLIQ2k6Mr/37M5eTsfutPt2LJShncQyM2Ht9+IwR3XxG4WO7S92T1VTgaEQ8l32CBmF/hk5vU/MrzAlrhJW0yYYYr8fWeTcloWffLhYa5WgZrFyDRk2rWQu+mfEfsne64+LMBoU5njoFRm3NizaEcS08nlKOpieVgKFY0fNOKWlI0H69PYlOzDB/aVKhKYYwTYbsLw5b3ucBlM0n6Yt3Bj+CHOe/mwvG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RPCwbiprTmdP7lQIFyeC35n82z5R0AwVfawSjfe/3s=;
 b=WH7zr+BIvLWFFE3RrjD7HT8KD3GAsHc/aEgem0/9zVxidRDWm+xicvfTceUqzcryxODPFuc5FtCfhyeLWvTXVmmfg/si27tNjTCwUwRMdWVaXgSVjgffx/o6bkIYhQj0B9GBPLP8y71EqB5dSA848mkZIy7Sy9I253bDfmvjUr7zUWPoQR4u6DY3hWpz8qvvBRCmYy1XCprWAXtOx3GtIi/LZ+LZUdHwBP7amyBlqIpFswCvmus2eOwmt7azG42bexZjBwPhE38zbFbetrhxVZPvFGADZWN5nomh/sJjObLjC72GSRNPK9ZVwnFEDd+p66PdnvkzA5zeagjt4KnAkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10913.eurprd04.prod.outlook.com (2603:10a6:102:484::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 18:31:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 18:31:40 +0000
Date: Thu, 3 Apr 2025 14:31:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, upstream@lists.phytec.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Benjamin Hahn <b.hahn@phytec.de>, Jan Remmet <j.remmet@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>
Subject: Re: [PATCH v2 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel
 overlay
Message-ID: <Z+7UAzFYCHYij0AA@lizhi-Precision-Tower-5810>
References: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
 <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-3-c0d2eff683ac@phytec.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-3-c0d2eff683ac@phytec.de>
X-ClientProxiedBy: PH7P220CA0099.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10913:EE_
X-MS-Office365-Filtering-Correlation-Id: 82aec998-f487-4baf-fc2d-08dd72ddc6bf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?mhZaoRb8AtsY1t89IfiPew81il1M2XCtTeVBInSL+73iupq76iRhcnyq45ZO?=
 =?us-ascii?Q?c33NRWlvq4F4DX3mHcZICBy32iPwCkLCS+O6ktxE0xHzMipqLzBTj6qFdsae?=
 =?us-ascii?Q?eyv5RIy0H/sKbu0a9/l3Eyd4dmK+a/2LienAccyW8P1IJ8rnPKBI3T3L4Q88?=
 =?us-ascii?Q?YhnriLFjc29Q/Nk0OFSN+bjEpA0qFbNlkUc3nC+D7LdGIDed/Qf4YfscnmIR?=
 =?us-ascii?Q?bu/Mku3BxLgRxd8/4D++BaVJSvk22g7OTF0qsdOBDQe1iilYRTVjpex2FZf2?=
 =?us-ascii?Q?WwETCTUgEpwQYF5Iqjni1lQlu9nTSykq7Rx6mRM3aXdDYM0KHYr51TyCA0G0?=
 =?us-ascii?Q?8ANZG8GDtfQPEx8ke96gluMc5eNH2SnCVVOPWmqrWZQQqGnsLXHcyyjoCXE7?=
 =?us-ascii?Q?wJpXKVsRZ6yMJUo8gcdjkfP+oIaxORNYkPjAKobmnJrkEImQ44HzjXSLGF6d?=
 =?us-ascii?Q?We/4DJwTLwdk7ICtN7ukWzYn+5NYM+iA9lzsI80pBN1+JZaCi/WmijdAbKcu?=
 =?us-ascii?Q?zo0VRSsYVTG+7RVaV3AIOg5zqvcFiko07yYZX1Bt+dxrOmMIz+myvsqW98Ie?=
 =?us-ascii?Q?zsB0g1g89VBnquyqAS1xP+OMe4PsvkW8Xj4tEae9FOaTOfAKo8bpO//LyGfs?=
 =?us-ascii?Q?1m/gisp+tmw9o80TK8+3MhbyEVSwmULDGYKuOXikRkdEyhAGSAw1IoEb12Zp?=
 =?us-ascii?Q?YhjmQRxOUsIMsajyaDiJ43ltqTxkaptWi+szdPEdsAU4DXeCglJh/gWhYWUj?=
 =?us-ascii?Q?QKEEiymTT3rDJ6b8KcsiPFOh4qYGjAgFVk9TKAYt6L4V+54sjclP+2o6s7O9?=
 =?us-ascii?Q?BKW80s3mXw7l52PzkN4YWpagfxr3wTeVhfDPVsEOJP6owhnadX8tAbfq5iO3?=
 =?us-ascii?Q?W6K+Tr9vAmjRc8cEd2QMIa5bIvqIYj6KvFLNgSKvw/6l+97bl5PWBSQT8Jnf?=
 =?us-ascii?Q?Mld8dASz0vzxHvSTN52gvxlnEtkb+E3kuhSqkoGBAZXW/gSuOcWmW8qWpTef?=
 =?us-ascii?Q?/7Yk9B87tDbawpG0+TS87E83G/g5apKuk8xxEtcCNjbTiAjlo0ZZPdCkBcLl?=
 =?us-ascii?Q?DbvjE5xmxe6+gKcBbim1r5iP+6meFP7cEon+0DKsxL6SeB6LagZb5rJrFKik?=
 =?us-ascii?Q?RnvkeOo1HyFpRHTFiFTGVgTBCvNsKs5w9Ls9YMaUKq+cTp7zQaqDxwBg2w16?=
 =?us-ascii?Q?MWFl2XmkEG4x/fyMKvbVGw5XWifRj/hZ+J5RJUtzbDyrsOvVUYhcSj7Qz6pA?=
 =?us-ascii?Q?xdHQ/Ji38w+ggTzVbZKcRf2vNkTPz+EXBIxbs/4CNU8vi1Qz3qZViZanSTHD?=
 =?us-ascii?Q?8nOItb/WMW3WT7Xo8bkYNIAiML/dgBHzliMjGbjvdgD2d/sPQCj6GXLrY6Q1?=
 =?us-ascii?Q?Cm2UKfUFosDK8emz/Egb/D1nhtNbNOTGvbTl0vlUNdRLKnfAJcJiJMjTLSbl?=
 =?us-ascii?Q?lsReUp1KZB5IQhdgWrUI8c9Am8SegmdRiG/72KnoZ01E6ggF465sXA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JseSkp0KbuM0Q55ChfdLm/MEVBFkkD3cRnvzAIBz6MDXuoAMwvAAfwaaSBOr?=
 =?us-ascii?Q?Rm9aEYu3NH9Zm8vUgA40xt3x7zx5r09CdEccNCuIHycDnG5v+b1OPwUN7IWL?=
 =?us-ascii?Q?Ds1ZWFkOPxoLvg5gClMkkvFvhfk95znrkqE7JvFROedC+TGy6cjHkCpge5de?=
 =?us-ascii?Q?RTwyH8eRCy6cUiFnfoiaaTkx7Zgp/Nymk0UdCNzG9kNHOUERKmMKL65N682T?=
 =?us-ascii?Q?uD0PGsaTr8XwtRixEk3SvxagzKdUi8zNSGkJegiOaAwjjGpZjwC+lDFBuah+?=
 =?us-ascii?Q?FyuYIemz7xJc02egu4fD2pgchXEWZTFhzkzDXX5CpFPNPvoraK2Oa9iXkvz3?=
 =?us-ascii?Q?z17gjlftdnUqK4bDlaFLvH3qa08Q4aKX8ZPw6kCT16SZOaA4yEQ6QTwAkYC5?=
 =?us-ascii?Q?awYESnmC/taFFXf75xL/ABkw6VpGM5aaK8CYEdrVlBi3kltL+IlqBayqZiX4?=
 =?us-ascii?Q?bz7TluQlhZnLaW1b5DA+dNF5qkJSr1LcS4Xis6lHp0kVGwPZzQR4AzVL/1bn?=
 =?us-ascii?Q?xJ7+mYSRcOWKBv/l4Mfdn6icuXOjQaqvt1UVYXnZ0rMlGVMXBn/UZSHmiFQ6?=
 =?us-ascii?Q?6S6iSovHvcErXB+V1tqfDH6a9DUg4hD9xFQM8rBYIwyGjGpwIS+ryjGhZCGQ?=
 =?us-ascii?Q?TVuXMw0s9Y3aJWZqDIgFzyeOGi8eTm23iIUdz/UPeCmprvwRXRTXAllJ52jb?=
 =?us-ascii?Q?71JlfkCJS8lnNQHMW+poWk8X4JqPtznadf5+KGUau5ljKYrCiu7OVzL/DzYm?=
 =?us-ascii?Q?A8IaCBluHZy5s+B+VU6/mHXTamMyYw88lpufdJw9ACYWgnQBHNFzIgB/v2/r?=
 =?us-ascii?Q?Fdjph5ziBuvV0UzuTCbBt+F3pUqug2/nFkyRCjv4RI2tPTIIooUMyFafaLO1?=
 =?us-ascii?Q?XkMxsCeaTOrhoX0xOxT1c0efxDaPGGPYQDzrW2XRPDCvcps7pcJDcwaAuodZ?=
 =?us-ascii?Q?nCXa6/RNn9D/KwS2LlkOeMlIf3IXhoDVM0JTHgwQUUYtVjk16t7vE19KD3cm?=
 =?us-ascii?Q?vRVICehY5onG10cTEqlQipoAMBswO7FNkMZ7swmC/ou0FCjkK+lS5ojlmBE8?=
 =?us-ascii?Q?JCCiRkUS+wc9hxcvLSqQR40wHgPIagaUqsQIneVFdkmZfwtXqXNwjdR9/m2I?=
 =?us-ascii?Q?z6yb/G70V42n0qbJCaTufN+wefgA5XBsiBbXyRuIWLBi7Cgi3hFJirmvJAY1?=
 =?us-ascii?Q?N4BKXGQ9KcLYtn41TNuJ6GxwbM/SUe2UWMtAvnpaJzsfL1UehDBpcKCetBj/?=
 =?us-ascii?Q?9lmXZJIgYHw/v2iB1FRkyLf02QEdaZ/pYYZHVsgfnkdhJx9OJsql2W2Y0ugc?=
 =?us-ascii?Q?xAKQNjEmrJATpWipNX426YNSUYJmVRpF3OnDh+euyAzL3l3XMYmymPQK0NKP?=
 =?us-ascii?Q?msvJfB7s8lSRv+X++G9rmtMwDVKggUW/wdlzSOCp66nL2kVO5xwAihpm3nNq?=
 =?us-ascii?Q?kVJbzUSoklhf0fE9cWMq2NPl1NJsejOT7hU4QpL8yA4KDHXoGJ/AdXPDDn0/?=
 =?us-ascii?Q?SP4ReVN7lmRMp6+2JwSV8Vl92+7iV6Z+g6iB+K5xJBA+G0OZ6OiNVe5kLuNh?=
 =?us-ascii?Q?s4Ja46MVLmxNwKcgruU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aec998-f487-4baf-fc2d-08dd72ddc6bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 18:31:40.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXzOsLFhTr5FtlCcVM7RAn2SQ06mWfxcfwwhnZTL/4lYgbCZBhvxrOHvZLfYzUJYUucXlHl9hI1bcEnB5qliEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10913

On Thu, Apr 03, 2025 at 01:29:29PM +0200, Yannic Moog wrote:
> The Libra board has an LVDS connector. Add an overlay for an
> etml1010g3dra LVDS panel supported for the phyCORE-i.MX 8M Plus that may
> be connected to it.
>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  2 +
>  .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  | 44 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index df792553be479afcb6fa50dcd25a7eb63b67bc44..aa349ee35d5b310512f05c92390d5c2a27df81bb 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -201,6 +201,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc.dtb
> +imx8mp-libra-rdk-fpsc-lvds-dtbs += imx8mp-libra-rdk-fpsc.dtb imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..1dcf249ca90d2b4d9720a55de39e3f8564780dc3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&backlight_lvds0 {
> +	brightness-levels = <0 8 16 32 64 128 255>;
> +	default-brightness-level = <8>;
> +	enable-gpios = <&gpio5 23 GPIO_ACTIVE_LOW>;
> +	num-interpolated-steps = <2>;
> +	pwms = <&pwm1 0 66667 0>;
> +	status = "okay";
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
> +	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +	/*
> +	 * The LVDS panel uses 72.4 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
> +	 * 72.4 * 7 = 506.8 MHz so the LDB serializer and LCDIFv3 scanout
> +	 * engine can reach accurate pixel clock of exactly 72.4 MHz.
> +	 */
> +	assigned-clock-rates = <0>, <506800000>;

why assin IMX8MP_CLK_MEDIA_LDB rate to 0?

Frank
> +	status = "okay";
> +};
> +
> +&panel0_lvds {
> +	compatible = "edt,etml1010g3dra";
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	status = "okay";
> +};
>
> --
> 2.49.0
>
