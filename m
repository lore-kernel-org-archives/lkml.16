Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90121CC79;
	Thu, 19 Jun 2025 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344514; cv=fail; b=JI8jb5Kbil0uxxVXWlj2L8pp8nGC+uae08EHI/XCDHHA955aoC6gWbs3N5/t54FIVU2AYZfOvO45/4FUp185y3DloH0R+T2AHMkfXBPyLu3GYHRq6XCK65+tsftsS+5KjLMhxsohB4ecWxWwuHCuQFQbDClPJ93o0ThePFxc2cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344514; c=relaxed/simple;
	bh=KIE/31aDZr0G6qJGnzetQAamVxY1KWd3Tb0ONEe+Xgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VfGI+/aze6XMtYSmlN/bcrIplz5H8CrXqmRcIObLxEBiRjKL5a3G+N/SVswJQeLj/AgVHnM+c+7C/nW7c2YxA6irgRzs1FDjbBir7/arYyttdx8b8EjdyJ2ykKMwyT2Ciylgdb2THGf2Z+Bpeg94319r42I6O/W466yRyyb4Plw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YE1106bU; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YE1106bU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeO7g73j9SYuTjoZ28c10qRgJB1uLE2dbDAe3q/a91YNYB2ca8bFoMAizc/TOD02bWHGH0FFRU47duoI2AWrzAS3lmnA4KoilLtzKpUW+AVsNkKA9onrMMD8P67C4qCdcaV+ZsIQ2OteWenOUmXl0k1FTwq/XtWgRQ3xirKnfKwkRu7rHWwAb1c/Ze/eY8sa9YgmOPcRDT/o/EUErf+HsLuLoXy/uP82Ok7g+V8Ea7ws+zJTeF8ZFfPpo7VZPuAuxuoSzIejvnyjW0voFuxRaXArWqSbGf9C4Qn5ARXfLMnF7ilR5LS9CKyoKmo2PspYqELgmwXqrTJBxOjJ4bcrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a44/OkKZajlXFzfUBKl/M9reBcyNNKwZOvdVBy8d4UI=;
 b=OpoLageQrMPrj2uLHmHd+xUEZu/4hCBWguhGZJplX6HkIZOx6fQPR7fyN9llh3JjvE7/TPPRIgaQh6DdSrq+zRl6E93Lbduef1GNHy2GdycxzOnE3gGdgobX+7sGwNZK9cGVsFJGAPMjlvtitHNokm+KVSvmf/NiOK1gMuXZ94eU+gLCTIFzf4ukgCelTuXHOGUxVhhHpMn2/wJWKV6jSA+5klosRtFsTGSqQW367280rjCWcUDiNmwRUZ1pKq5uFunOuXTadZZCijZZTVOJ8dWGmjMq4Th6s8827TpHsOOpgrxmsHWYGbZlhLU5mvDWs4zYiR784G2Nc4MbA9efXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a44/OkKZajlXFzfUBKl/M9reBcyNNKwZOvdVBy8d4UI=;
 b=YE1106bUvBqF3YeWIKtx3GrqohC+lOZDQKuEzG1RRqYtPsLfMuQbXZ3gNxq8rzhCx171BE5yp0J+PxMrhQ+YiemqPbuoLhBXXQ44UoPI+iYG0CB3Vw9UlZm8oBSQA8oFshLKZcDJb/cuTYZGBaX8o2pRca5OrhZnN3sGrVfS9NflW26RnvcoA77oex211qFSgyP99oq10Pb0EV4b0TNlTgxHv6mvsBukuWrCiBJ83ZJxEfPu6PMbYm8emQewd06QbhSK2Le4GwYO/CwtQ7xYGNi8XMpaPDJUhOCo43zDdp8/Q09GDyM3kuBi7pqs/CVE0tmPbpoW2D5gVYOd5Aas1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 14:48:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 14:48:29 +0000
Date: Thu, 19 Jun 2025 10:48:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Tim Harvey <tharvey@gateworks.com>,
	Michael Walle <mwalle@kernel.org>, Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tobias Graemer <Tobias.Graemer@mt.com>
Subject: Re: [PATCH] arm64: dts: freescale: Add Mettler-Toledo Snowflake V2
 support
Message-ID: <aFQjNbpZn+1EB49a@lizhi-Precision-Tower-5810>
References: <20250619091247.51919-1-Wojciech.Dubowik@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619091247.51919-1-Wojciech.Dubowik@mt.com>
X-ClientProxiedBy: PH7P220CA0165.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 291bb502-bcd6-4c7f-7e03-08ddaf405a7e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?PzlxYrnNoCSUnF2a9oNr24DQg5/3XLqRjvhp7K+lhKvADlc2els26+hPyMNv?=
 =?us-ascii?Q?dfh4LEnZ84VTZG+mAJlJsdpPT5Lmzg4BJEc8HYJkp/Tqv0X7rDLcNzaaH76K?=
 =?us-ascii?Q?U/LgOOV+E3f5QoaRsjHnX5wEdgcoahddk0+bCHVVGJcpLQfu/RWX/8OyLzqv?=
 =?us-ascii?Q?+R/c9ph+uiwzsmyd8c8rNGr8f1aLo/hEM+Jf1Waxmhaqcelh8ZLTbQVRZp3P?=
 =?us-ascii?Q?6xTqBjyUwgHuRVOsJlK43uTN3ED/BP0a4s4n+6gB0CWGMGrQl63eVvyuFt65?=
 =?us-ascii?Q?ctgK5Fo2MR6ybIos8HE+6+AE0M8YqeaMbyjp9diBuwe8SPY6tB7xysgz/+Q4?=
 =?us-ascii?Q?6ULULO+4rjonhMqguf+K83vD4TdO2EsCJrcX1ciR5rzK07WLOx2CT8IiQiTA?=
 =?us-ascii?Q?I0GXAy+RXg4h+cPZTm14y6lPkkfhbnkM/jvPtE3JhgtSM3uvLDX1baoQzDdu?=
 =?us-ascii?Q?xMEQ6k7AOXj9hm5K13BaxKQAw2eplnqzJ91Vhk8i18xBxwL06qENW7928n+S?=
 =?us-ascii?Q?v+Wpo8OUQRgfju9k53E9sbH0KXAcHlQGZOwE8+LJZPU8mrw4EjcFfJKuygSP?=
 =?us-ascii?Q?EAeY+qlIuQH0+eiK8P7C3GRcjFGcqifdUSTvBpKluAReqxoqdMLMLBDYxObH?=
 =?us-ascii?Q?MvMvKxVBhzBqfA49RwJIFAoovOMal/286IQjRyWxWpT78DX7pdsJ6qIml3SI?=
 =?us-ascii?Q?ZNTzd+087m3pqMQO+DhWQBiW2+j/YtOk3VfOltqB9D+70+Oqbfq+hhWUyH1q?=
 =?us-ascii?Q?Zymt0GC5X1BsWVtHopepwyrn9KTVeZtRys7k7NQjzuAjNteBTC8JlPg/VeU1?=
 =?us-ascii?Q?622nWQVWi+cMrgajKKQJ3bb8fEEbkv9D7e0+vlE9/0kta6zBIanAEbQMqJOe?=
 =?us-ascii?Q?BC617xj++NdWiXYofamsbHrII62AlQ4hiBrwBUN/f4HzkVSxisVdK/tITiUW?=
 =?us-ascii?Q?2u+RkyqKOvzTccwh1/FFUtAJuw8VoULHoiuuugx4SpgGuSskMmJ5l2VSIawZ?=
 =?us-ascii?Q?E+O4AHqD4LhZJ6C+BMbcZD/8IwIpLeFDTsLJsHijIpD9Z/sEdn3//EZ/mToa?=
 =?us-ascii?Q?nK3qhInX4JqM1F5nDUIImkpYZvdSCb0cEmPB7ARiCIhuEN57550c/ctkjtL2?=
 =?us-ascii?Q?auLCZWU3tfmK/j8AaTtoJD7eV256yFRr/iNVuqNbLBc4tX7UoJNXNOz7dXrV?=
 =?us-ascii?Q?3NWET8rUuR8bAahmUP2ELtTMnlHjKdb1WvCH1qOSs1v0gAZxszk3Wkqd1aJi?=
 =?us-ascii?Q?jF1rRZxcPHcbe+ME4SrtrG7a5t6125TTm0MKD6i2nx9MHY5BhR7RBk3EMA2p?=
 =?us-ascii?Q?TN0aWynS4OuNwb/Hhf2twwDASx2pk8Pqv2kb7v/x8ZvAUOS62MM6urqOPVmn?=
 =?us-ascii?Q?aTgLoKJfyy6RG9AZ8BbG8OxfNL4TC9jXliC4csh9oNCbSWQmSFZ8hoiLe5Cl?=
 =?us-ascii?Q?v5EHd0m2AiQ2ETtqa15sH8sDAcJWncoQEJJdTAlrW63kKmIiaWsK7xfUvb0K?=
 =?us-ascii?Q?LFtTBm7jtGZI6KM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5J60Xr7hk+iGdxQm2m252GZHBnCwLdfT/TJEkfLBLH55ynb9Ys5tZQMaEF67?=
 =?us-ascii?Q?hdWQ3xUY2CCQN5brAQUxH5eId8PVF0GOhWEkEJrAORZmxKK7Q6jj+u2/GSk/?=
 =?us-ascii?Q?h0Gaja4cBAh/9tTc2/3uCU2dyghMdnuF5LiWjJiJw0+AhJ1E2Yz96oS3SEaH?=
 =?us-ascii?Q?y0KKxo5ePmw7yNgNQLbXP8D93giRqJhAezgBNyoBmwWLtesrrZyTP0uKeB7l?=
 =?us-ascii?Q?dwc/WKjhauokheCgJZ/fjWMzFXKS6g3ZinydNuizK8XJ1AGot1vyCNCnQ8My?=
 =?us-ascii?Q?ErfEiL4yyB7Vk9sQxkRr4iqb/pSkr+mDcs80a84sNcIhMcnj058xyspj2H0H?=
 =?us-ascii?Q?Bd4sp3GPzB9uY5lCs/hPwnryld5YUgr6JYYbkTM17rgbEh0f42AMw72/MezA?=
 =?us-ascii?Q?gdOSZ2TDPs2a6emq48PijPksy6MGkbMaiL9UlMts4wHc4TLtYPIM/l2gPlbm?=
 =?us-ascii?Q?gcp5E7krf3Ng/mtm9RC4DnOwc4wgbNnH1AKEtqpuDd4NYNMfSJXZvMs9yTpI?=
 =?us-ascii?Q?9GZE71H01mfJnlFMlBUoOZZJJfEn+Kspeszj8QHUafZCf5iGySf9SfLEf6Xa?=
 =?us-ascii?Q?F00l+lsKKq/lcdXX3T5lzo1j6gBeaoMCsRqKrq6ARWeXC3Lln86O1WJUK88r?=
 =?us-ascii?Q?qdvUggPtl61wYNPtXGmetAMuv8c5lK21gRUBcVyfWfXNzuI7C7mHgl/xK2xJ?=
 =?us-ascii?Q?1MIgRx7AhaO242TYDXni77z5tXL9NVAcatvtN6UZ8p/VHQbfkamxJJpg/+oG?=
 =?us-ascii?Q?PAb9fYWPNcHnaLv+MrN3yq4dEk8JJ5CRcd4xbLnogsCfRid2/nrZfHeapNo+?=
 =?us-ascii?Q?eWF+TfdHmjOvxEHWsn6Le8UicPNOOP622sGLyhj5B34U3LufEgPXr/vUp/uX?=
 =?us-ascii?Q?WQAe4b1FHAfauPc/BkvHknfbcsLGnBMax0Zj+cfmzscclScG9vtNFTEU71Tj?=
 =?us-ascii?Q?CL/hUPmDyc3iZ8oF/VZVe4eDqNIZ2+APSWdPWIvZbGLcEvGY55JUwJtR4q0n?=
 =?us-ascii?Q?E0WRfCotsw3Z1gEP87z/mLVhk/JVEI6U8OGSdA+Gs7nKoGe4Yb+PmtBN4t7g?=
 =?us-ascii?Q?ZKHFQAjGgoH/v3BCuhayjht8e7ZZkhLjXGb/+lqWRX0rENXfC7YbmXrihNtu?=
 =?us-ascii?Q?VUaeOKrYwCs1ph1defXRtF9FuIiyaok6gWtGs2xbibf3KwAKjfSmDLiPWXMm?=
 =?us-ascii?Q?HGLBmtyRB+MmwEze5Y79Q54I3LWZJnvvLiaBrHoHTZ6GIy1rY6/KKmzjFUsk?=
 =?us-ascii?Q?JiFFzlgSGKwrypFFcucDj8rMqtFlzvLUi/J/R3IDhEu3I430O606xobyWUso?=
 =?us-ascii?Q?3HDde7l7yJ+vGxwhFAOt+hfZ5KraTisH+EeF4VwxVN/bXW+ToCX52Yq9tF+A?=
 =?us-ascii?Q?hy8YvDLBqrlvX+a+XgfRB/aeaP2oMI5NvDH7JCCdZBZutK58GokpZKvq9Hu9?=
 =?us-ascii?Q?agngFhRFXyoqaaqhbZWPw23EuL8I4Shb4N0pZ5AwusUipYEDw+eJhZWmBw9z?=
 =?us-ascii?Q?B1Gdo+u8nePkOt60gYJHuWzrad7t8rAzcA0N8a1piVPKMY4XUroFyA8O6vGb?=
 =?us-ascii?Q?mgw5u6wmkTt8IvOolmGzFnGmu+b6zpYyPhbA3bRE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291bb502-bcd6-4c7f-7e03-08ddaf405a7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:48:29.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IJDYgGYXqmSMTFH72y+s94lsyNxNRpCDsH8ekwzRfmV0azod87OVLB2AjWjUwTIEu8IeUdEx4hC7+X4anoL9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409

On Thu, Jun 19, 2025 at 11:12:44AM +0200, Wojciech Dubowik wrote:
> Add initial support for Mettler-Toledo Snowflake V2 terminal.
> The board is using Kontron SL i.MX 8M Mini SoM with 1GB RAM.
>
> Supported board features:
> * 7" Display with touchscreen
> * RS-232
> * I2S Audio
> * SD-card/eMMC
> * USB
>
> Signed-off-by: Tobias Graemer <Tobias.Graemer@mt.com>
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +-

binding doc should seperate patch

>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mm-mt-snowflake-v2.dts  | 484 ++++++++++++++++++
>  3 files changed, 489 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index d3b5e6923e41..fe5eeb4355e8 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -986,9 +986,11 @@ properties:
>            - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
>            - const: fsl,imx8mm
>
> -      - description: Kontron BL i.MX8MM (N801X S) Board
> +      - description: Kontron i.MX8MM N801X SOM based boards
>          items:
> -          - const: kontron,imx8mm-bl
> +          - enum:
> +              - kontron,imx8mm-bl                  # i.MX8MM Kontron BL i.MX8MM (N801X S) Board
> +              - mt,imx8mm-snowflake-v2             # i.MX8MM Mettler-Toledo Snowflake V2 Board
>            - const: kontron,imx8mm-sl
>            - const: fsl,imx8mm
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b473a23d120..86f2f1580696 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -128,6 +128,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-innocomm-wb15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-bl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-bl-osm-s.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-mt-snowflake-v2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-mx8menlo.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-nitrogen-r2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-phg.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts b/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts
> new file mode 100644
> index 000000000000..c810463a2f40
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts

run https://github.com/lznuaa/dt-format to mantain nice node order for new
file.

Frank
> @@ -0,0 +1,484 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Mettler-Toledo GmbH
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mm-kontron-sl.dtsi"
> +
> +/ {
> +	model = "Mettler Toledo i.MX8MM Snowflake V2";
> +	compatible = "mt,imx8mm-snowflake-v2", "kontron,imx8mm-sl",
> +		     "fsl,imx8mm";
> +
> +	chosen {
> +		stdout-path = &uart3;
> +	};
> +
> +	aliases {
> +		ethernet1 = &usbnet;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm1 0 500000 0>;
> +		power-supply = <&reg_5v>;
> +		brightness-levels = <0 100>;
> +		num-interpolated-steps = <100>;
> +		default-brightness-level = <100>;
> +		status = "okay";
> +	};
> +
> +	panel {
> +		compatible = "edt,etml0700y5dha";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_vdd_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&bridge_out>;
> +			};
> +		};
> +	};
> +
> +	max98357a: audio-codec {
> +		compatible = "maxim,max98357a";
> +		sdmode-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		status = "okay";
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	reg_sn65dsi83_1v8: regulator-sn65dsi83-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SN65DSI83_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	sound-max98357a {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "max98357a-audio";
> +
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&cpudai>;
> +		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,widgets =
> +			"Speaker", "Speakers";
> +		simple-audio-card,routing =
> +			"Speakers", "Speaker";
> +		status = "okay";
> +
> +		cpudai: simple-audio-card,cpu {
> +			sound-dai = <&sai1>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <32>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&max98357a>;
> +			clocks = <&clk IMX8MM_CLK_SAI1_ROOT>;
> +		};
> +	};
> +};
> +
> +&sai1 {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	assigned-clocks = <&clk IMX8MM_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c4>;
> +	status = "okay";
> +
> +	eeprom: eeprom@54 {
> +		compatible = "atmel,24c08";
> +		reg = <0x54>;
> +		pagesize = <16>;
> +	};
> +
> +	ili2511: ili2511@41 {
> +		compatible = "ilitek,ili251x";
> +		reg = <0x41>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touch>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	lvds: lvds@2c {
> +		compatible = "ti,sn65dsi83";
> +		reg = <0x2c>;
> +		vcc-supply = <&reg_sn65dsi83_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sn65dsi83>;
> +		status = "okay";
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				bridge_in: endpoint {
> +					remote-endpoint = <&mipi_dsi_out>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				bridge_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +					data-lanes = <4 3 2 1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	usbc-cc-controller@61 {
> +		compatible = "ti,tusb320";
> +		reg = <0x61>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usbc_controller>;
> +		interrupts-extended = <&gpio1 6 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&mipi_dsi {
> +	status = "okay";
> +	vddio-supply = <&reg_sn65dsi83_1v8>;
> +	assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +			  <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +			  <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +			  <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> +			  <&clk IMX8MM_CLK_24M>;
> +	assigned-clock-rates = <266000000>, <594000000>, <12000000>;
> +	samsung,pll-clock-frequency = <12000000>;
> +	samsung,burst-clock-frequency = <891000000>;
> +	samsung,esc-clock-frequency = <54000000>;
> +};
> +
> +&mipi_dsi_out {
> +        remote-endpoint = <&bridge_in>;
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&gpu_2d {
> +	status = "okay";
> +};
> +
> +&gpu_3d {
> +	status = "okay";
> +};
> +
> +&ecspi1 {
> +	status = "disabled";
> +};
> +
> +&gpio1 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio2 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio3 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio4 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio5 {
> +	bootph-pre-ram;
> +	status_led_controller_oe: status-led-controller-hog {
> +		gpio-hog;
> +		gpios = <4 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_hog_status_led_controller>;
> +	};
> +};
> +
> +&pca9450 {
> +        bootph-pre-ram;
> +};
> +
> +&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
> +	bootph-pre-ram;
> +};
> +
> +&reg_nvcc_sd {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-boot-on;
> +	regulator-always-on;
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
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	uart-has-rtscts;
> +        bootph-all;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +        bootph-all;
> +};
> +
> +&usbotg1 {
> +	bootph-pre-ram;
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	dr_mode = "host";
> +	disable-over-current;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	usb1@1 {
> +		reg = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usbnet: ethernet@1 {
> +			compatible = "usb424,9500";
> +			reg = <1>;
> +			mac-address = [ 00 00 00 00 00 00 ];
> +		};
> +	};
> +};
> +
> +&usdhc1 {
> +        bootph-pre-ram;
> +};
> +
> +&usdhc2 {
> +	bootph-pre-ram;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> +	vmmc-supply = <&reg_vdd_3v3>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	no-1-8-v;
> +	status = "okay";
> +};
> +
> +&pinctrl_usdhc1 {
> +	bootph-pre-ram;
> +};
> +
> +&pinctrl_usdhc1_100mhz {
> +	bootph-pre-ram;
> +};
> +
> +&pinctrl_usdhc1_200mhz {
> +	bootph-pre-ram;
> +};
> +
> +&wdog1 {
> +	bootph-pre-ram;
> +};
> +
> +&pinctrl_wdog {
> +	bootph-pre-ram;
> +};
> +
> +&pinctrl_ecspi1 {
> +	bootph-pre-ram;
> +};
> +
> +&pinctrl_i2c1 {
> +	bootph-pre-ram;
> +};
> +
> +&pinctrl_pmic {
> +	bootph-pre-ram;
> +};
> +
> +&pinctrl_uart3 {
> +	bootph-all;
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19 /* \SOM_RTC_INT */
> +			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x184 /* SOM_DIS_ID0 */
> +			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x184 /* SOM_DIS_ID1 */
> +			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11		0x184 /* SOM_DIS_ID2 */
> +			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x19 /* SOM_PCB_ID0 */
> +			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x19 /* SOM_PCB_ID1 */
> +			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x19 /* SOM_PCBA_ID0 */
> +			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* SOM_PCBA_ID1 */
> +			MX8MM_IOMUXC_SAI5_RXFS_GPIO3_IO19		0x19 /* \SOM_STATLED_RES */
> +			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20		0x19 /* \SOM_HUB_RES */
> +			MX8MM_IOMUXC_SAI5_RXD0_GPIO3_IO21		0x19 /* \SOM_SUPPLY_EN */
> +			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22		0x1c4 /* \SOM_COM_RES / version C */
> +			MX8MM_IOMUXC_SAI5_RXD2_GPIO3_IO23		0x184 /* SOM_DBG_GPIO0 */
> +			MX8MM_IOMUXC_SAI5_RXD3_GPIO3_IO24		0x184 /* SOM_DBG_GPIO1 */
> +			MX8MM_IOMUXC_SAI5_MCLK_GPIO3_IO25		0x184 /* SOM_DBG_GPIO2 */
> +			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1			0x184 /* SOM_DBG_GPIO3 version C */
> +			MX8MM_IOMUXC_SAI1_TXD7_GPIO4_IO19		0x184 /* SOM_AUDIO_SD version E */
> +		>;
> +	};
> +
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI1_TXFS_SAI1_TX_SYNC		0xd6
> +			MX8MM_IOMUXC_SAI1_TXC_SAI1_TX_BCLK		0xd6
> +			MX8MM_IOMUXC_SAI1_TXD0_SAI1_TX_DATA0		0xd6
> +		>;
> +	};
> +
> +	pinctrl_i2c4: i2c4grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL			0x400001c3
> +			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA			0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_sn65dsi83: sn65dsi83grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x19 /* \SOM_DSI_INT */
> +		>;
> +	};
> +
> +	pinctrl_hog_status_led_controller: statusledcontrollergrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4			0x19
> +		>;
> +	};
> +
> +	pinctrl_pwm1: pwm1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT		0x6
> +		>;
> +	};
> +
> +	pinctrl_pwm2: pwm2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SPDIF_RX_PWM2_OUT			0x6
> +		>;
> +	};
> +
> +	pinctrl_pwm3: pwm3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SPDIF_TX_PWM3_OUT			0x6
> +		>;
> +	};
> +
> +	pinctrl_touch: touchgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1		0x19 /* \SOM_TOUCH_RES */
> +			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16		0x19 /* \SOM_TOUCH_INT */
> +		>;
> +	};
> +
> +	pinctrl_usbc_controller: usbccontrollergrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* \SOM_USBC_INT */
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		bootph-pre-ram;
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_RXC_UART1_DCE_RX		0x140
> +			MX8MM_IOMUXC_SAI2_RXFS_UART1_DCE_TX		0x140
> +			MX8MM_IOMUXC_SAI2_RXD0_UART1_DCE_RTS_B		0x140
> +			MX8MM_IOMUXC_SAI2_TXFS_UART1_DCE_CTS_B		0x140
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		bootph-pre-ram;
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x190
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d0
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
> +			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		bootph-pre-ram;
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x194
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d4
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
> +			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		bootph-pre-ram;
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x196
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d6
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
> +			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
> +		>;
> +	};
> +};
> --
> 2.47.2
>
