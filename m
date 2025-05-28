Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87832750E8;
	Wed, 28 May 2025 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446566; cv=fail; b=RFPbp5NeMe9hWDhIHwQfDDomwtEFjMca8CP1DDFfzoiRNkW8XbldE2/4OU4GC7V+XTNkXq9ECZru6OizfK0ygrBxXio1ObqmKk81WwTvCmsd0qq8I8r8tK8yiuA5RVo3w7NYVufiUX1Rx6c6vuYoKHwdEsjK824vCODfzgMs0j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446566; c=relaxed/simple;
	bh=Sla6yuvYLV5oSCe5qkFiI6IRJ5XgFi7+LOA27nLN0fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s7FNh5hQ0xtqPgGvdB+PwKOIHUGd6Onmsb4t3Ldm9HmCqzT2mPeo36hmPuavlpucAIBLAdESNd50SWduuI95DnAy8JGy+IFkIvj4ssDif7GUxeTt6PsRgab9eIT1W7L+ARCUOdSWhdVvpPsZTCWB4EQcJT/Z6Yax+1RR1kbpVYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RdmWONcg; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RdmWONcg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGxrX2MduLtoGvTJ5FfLcGroKkxZ9shUkQ2ExPaK4LqW8qhLgbt/Dx5s+IBMJ41LweevJjJKY9/wwmGqg5eWZKdr05lLXq1Abp8OPAfaaHqUdUUiJ8XlB3PbT+TIHT4F5pVMjKbnTeCsaaCAvA7lYV3ghziUZq0CIyYjAMhMdy2Jqfvs7mWst9LWH1/v7XgURmV5+EOQBQ0u/3LJfwMBRG0T5ts2lp0Ap6nAaPjzez4RhD4gn4syw38WjaqkgTPrXavSFTbVk+UZa6ikFaachir0QZT0IwjjbfiiVq3X1Pdbzw8uwRDd+gJHcEfzLaI+MxMkJbwPVubhu32bSdzZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+7zQ2o+FwKDg46WFIBroyECXa70RRbkpBUp8D3oHhs=;
 b=OXXpHUEDjTpDzHpjuswit7s0h8kC/ob7l2QSGw7Vklr/RgArnOFXB1dKE6eqdUqHAzvIu18++8UX/0LnzMNzMB7NHhd/EcgA475VeIajSht6IWUZMXmv3pDBNx3jVrFdCSWDKdiAi7sbTnwmPR0uzgj5Du+MW2N+fa/YsamXOaiEv4z+aW6AHbFonwb2LFmMRMhO7XfqOUj+TKM9neI00dVWmZraaacw7Zd0ld5blfoMKhWWfYGk04i6z6i+KIW/GYcMfP608RB8ZTwf7ALaWsMSBi0HONmBC5uw7grPExRqo9yoyuP+lhVxfNIi5VXEDbSBnUGPwLvrgD5N++OkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+7zQ2o+FwKDg46WFIBroyECXa70RRbkpBUp8D3oHhs=;
 b=RdmWONcgTDkqq5kmqRl5wY6EPMRJo6UMVQes4ikGj14Swl7QuTOu29aGbqywvXI5ZW+nyxcZWEB9OuqMRSIqqONeXDUEgHiNhVj81DJkw5HbDR5lWTsXOHOwx4uRFf1PCg8bZF5AfdSe+oDuWzCVVTBC9p28CGy4STQqL1sH/EPx8WvDRm/YX/r4CwCGneX8m3NgK5+i62NLJfM4B4oGtLVR78NXOFFLQhgx/E1+TVfGQjMZCfa9tHcakuhh8gjpaRPu4tk8u7EhrMIlh3u/6AAZKj+KA2FyHhqSqyCyh7dfG7H7qfwpU6/YC+cwutkEKnhP6QdG/B0DlfSkrIhDHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11424.eurprd04.prod.outlook.com (2603:10a6:150:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 15:36:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:36:00 +0000
Date: Wed, 28 May 2025 11:35:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind
 devicetrees
Message-ID: <aDctWKIvBKwF29lP@lizhi-Precision-Tower-5810>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
 <20250527060400.1005757-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527060400.1005757-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH7PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:510:324::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11424:EE_
X-MS-Office365-Filtering-Correlation-Id: 7472d3df-c696-4f65-85ee-08dd9dfd58bf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?HNRUEw8PVyWz++Ur0utJ4vymjFkZSD3GG4mjrocZB+ashLHp2apLRkLm1ASN?=
 =?us-ascii?Q?jvW8TVErPJ3q0lX12PhvNYbQ1PvvkzaDGszomonb7dBKLRk4S9E27rUgqeZ3?=
 =?us-ascii?Q?hb8Tz2k6EcvGqa+CjyKMGrQKi+7Lg9SU9sidjMIMb4s4l3Xm0eK1WwneRR+u?=
 =?us-ascii?Q?nW1oPVDsbCe2QREM14e6GLjkYaDZfAt08/idruC/FXQLz2BmGV/ojrfTPFsq?=
 =?us-ascii?Q?eA+bUlAjHAumMAL/Rr3cvinuWNwP5jHio4PApch6qfaGmGgL1mUQe+rPZCCL?=
 =?us-ascii?Q?61Ui7RfCwnChGvs8vto7Cz+3jZFKtsjy8c0ABPftsj6V3S0DZ4ATmdk4RqVn?=
 =?us-ascii?Q?sdwQ+PmJqEA76HzUuc0dRpywCQedBOqZM8CnshIkKZfAxl/sWmeeOj15rjEy?=
 =?us-ascii?Q?N/eDYkMyW44tt/2sz55SUQ/c/u92AWgHRCxjjanbEi39jBOSHCm9wIevVu6J?=
 =?us-ascii?Q?K86uPG+sQDIy1V9dP5lAS42aIg0YajEWI2Rl5bSQrf/aVoPaujhoVVTeFRx4?=
 =?us-ascii?Q?Y6lz8O2oxtacSpIjlp5zABemXtGcM4yt5i6Gv4Dlb8GgpaLEYXDP2LDKsmIL?=
 =?us-ascii?Q?lFmijRlxunVpGa/iupJQNNOmVUZvZ+wqJo0FOv+FkMDPOPcK0ae9MEL97bzi?=
 =?us-ascii?Q?/IEM4qPdQ/PTUnaeDhdISHyTE7C+NeP5GyZF3Y75Nw9/YyrkI+2YFsGjw2hh?=
 =?us-ascii?Q?P9I4hTeXkG848fWWwRXCMe58gx8HwchNN2Qx445LIDczn5c269stkShsMXwh?=
 =?us-ascii?Q?BEoXCf1G2gZFEuUZB1A6fzRFHT5fvLeEL4caWVgRd2jsnoJ/9iVP2+bXx3Qs?=
 =?us-ascii?Q?eRUuJLhhbmuCO1q+OzgucPaT1/lL3tzaRoNfhn2kgmlVFz4WccFlGFs9p14L?=
 =?us-ascii?Q?D3rFWyHlJqithQFyXsLKdgrSDOeCVKyqY3aDzWeiTHf8A4DCju4tHiFS8yVh?=
 =?us-ascii?Q?MJxQTF9AP/8q+/d3RAjkOvyBlXW292Eal6On6cSdqa1lTuSdgy+i0uRBgatz?=
 =?us-ascii?Q?+NnxW/AVQiIWIC8rtw3LRbcea3C1Gc99Y+7nWC8yHzeo271QB2H/t/wx+r7X?=
 =?us-ascii?Q?Ha6bma46w6jTmKvinC2rnrleaR8z02WIekG51sYSwVg2rfvs+g0KgDbau5EZ?=
 =?us-ascii?Q?zmbuKIA4xjUZ0LnqLepi5cYON2M4ry2Kyjw0SFcJV2qA/eRNLHOt8LoR51MZ?=
 =?us-ascii?Q?bOorF6qa1R2Dz7Co3lCELCguqBEiTuVCJGrFtp3racV+y9lzjjretWj5Usng?=
 =?us-ascii?Q?WVbUnmp9E7vpR+OCnrTz3NhFnx8yDMLIubfJYzASsPbQBBxYECOABX4qEvje?=
 =?us-ascii?Q?8m4ECN5gGBcpLq1qugWrDag0gouO4mNARwlhxfr3s88a0He09l2Rlu7jOn3d?=
 =?us-ascii?Q?irhh1TF/59qJsadeu41kQCGhsRLT48Htm0LwhxpxsbJXlUFrXWw88n2IGJrp?=
 =?us-ascii?Q?7xt/WDZhzZ6Fo5ElQahxNFQKVADy1CNDcySrb0wFLhzr62wf6tFV9TEK0PiV?=
 =?us-ascii?Q?H4pOcr51MNRq/B8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?62O9qscNTttcni2Al9gLTsidlx0DYXYiIfxr01f7uVexCYDDUXC+P39MPNFu?=
 =?us-ascii?Q?AvFpYsnKidfxgtZ0st9nT+KFqxO4PwJmQS5kdFWMX8B75sahP9ZTJSHGN2Kj?=
 =?us-ascii?Q?Z/DVLlLVcLMhUujAoNmVfPhjZsmeruf2lK2x9DGLsVXNFph+Qv7VlUOjcVFm?=
 =?us-ascii?Q?dkorspzNRAig4+4Igj6bnfE0ivRqS5THMyAVuleXIUfHw6IwLgIaYgQYKGOz?=
 =?us-ascii?Q?IWeMg3BnXaho1ti9t2UGTmsQVhoxusH02AMVh1nGFS5IDueX/ddOl9YgJ7oY?=
 =?us-ascii?Q?BbS8uMWymv6WtkGF0mwwvQIghv2E13+zpX4zwld2DSue6C24uchXu4ReiJ5Q?=
 =?us-ascii?Q?nx7MFebL0WU7rMcAtEhT71sMGt0lD+v0bFb09HDa8mJZOvGnZYcvV9WU8BNr?=
 =?us-ascii?Q?Q/7s2j4LZYP4Uz2NSfDJQEKolxkQYyeRfrasJnHCvMklqLQMesq4xpHiYDt/?=
 =?us-ascii?Q?0mqzRzAKDOdDY6EckaV0hZzC2XGRMTTtbglAiSuLUZCvx7d1gLDbKIz8L5af?=
 =?us-ascii?Q?dDWWY1wDEy1ibOVN00bWcCuGzzj9Q6x+wNmCh8l6pQbEJy47WzOSBeOf9eq0?=
 =?us-ascii?Q?0IVGTCHSRItegCL1lm6S6mW/2XoCL/wpOJsmCHqbfIqtpBYFmF2gxpQE+rR+?=
 =?us-ascii?Q?sTiWNeYYblHVYg95r88WNEASBQbjyarDVQcTre0vsnyMbzPh3CLOylywvzwi?=
 =?us-ascii?Q?rpz3HBWh5c4xx+R9fzM5UlYwH9/RnWSgfjI60YlB+/ObaHGFKbSE0WSYPZwd?=
 =?us-ascii?Q?xhJs3eqmGfxrzrMoJyJDeVAUdO1ishkDDBBI09eyfQt+ytFrYX9wPDgmFGvW?=
 =?us-ascii?Q?zehqSuKbfFqPr4tg4Gt2PVZO6OHQ2/PYxkyYrAHx94w7czjZCqwhhLiY2nww?=
 =?us-ascii?Q?6fQxyXwb6TdLCyWfNqFjIeYL2MkMiuG8B2oRV3B36V/0CzY23AfHNU36lDs0?=
 =?us-ascii?Q?QotM0lR7qVwPHQShwS2/aImtgwRNwXOpdEimFTK1EKUznwSsKG+MCkO8JIhy?=
 =?us-ascii?Q?7cKiIhnNN+y2ROFs6wjzAx+qvAYzeZKnUlu+tMjf0UTKQu3gf4ugFQr6wnsK?=
 =?us-ascii?Q?pYpig6TN4Pj7007cuPx5+Pm9dCPj1EyZaGswEpQNGVbRC4d9yh68/TflSalz?=
 =?us-ascii?Q?rxUa3xiBlo4Di5m/j7ujeaA9I3sd9hTDnC+H7Y+UJWAH0gXf+0ByqfB3ZJMD?=
 =?us-ascii?Q?8KOkc7jGR5cXGF8c7yGCOaNJ2H6S9K+OIpT07ZYgpvdi/EGLAiDd7PTRi2Gy?=
 =?us-ascii?Q?rJybGmB1HjQekswT0xnskmipJp9M8fzeZhhicTk2h3Ctj4LgrZ1TAzdgHnSU?=
 =?us-ascii?Q?VHpHOd5EmiZSVqBodCSJilxSCXtS1AjNJExJRNFL128zHYGXsRFoN6ZtLUjE?=
 =?us-ascii?Q?aLvxYde6Q2wUayDSydTnOIO3U9Or17nevyTfVVSNGlL1ETuj9ksbimvc/lRS?=
 =?us-ascii?Q?v+rB5qK4eUiaOtRFgIGPF+wV/4MStsssm6pHs1xigETZAxauL9DxuowwEg/S?=
 =?us-ascii?Q?v/NPJi5xQfINoEwF+Nq9nLllQ6k9F/jHeYoJQeiZfgHJceE0uNwcWg+jv4Es?=
 =?us-ascii?Q?NgDt9ywJLVQh38v9pkk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7472d3df-c696-4f65-85ee-08dd9dfd58bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:36:00.2154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LZHV4wsrpHpNoeCkaGm17StpB2jojS+nLUivBLjXbgJ3TC8dRRdczrYT2V7O0gcXI3CoARk+7rIMpZT1r3HfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11424

On Tue, May 27, 2025 at 08:03:55AM +0200, Alexander Stein wrote:
> From: Gregor Herburger <gregor.herburger@tq-group.com>
>
> Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> TQMLS1028A.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   2 +
>  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
>  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
>  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++++++
>  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++

New dts file, suggest run https://github.com/lznuaa/dt-format to nice order

Frank

>  5 files changed, 596 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 75ea65d718c1f..38674e4eeb4c3 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -16,6 +16,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var3-ads2.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var4.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-rdb.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-tqmls1028a-mbls1028a.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-tqmls1028a-mbls1028a-ind.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-rdb.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-tqmls1043a-mbls10xxa.dtb
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
> new file mode 100644
> index 0000000000000..fb735c5d475ad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +/dts-v1/;
> +
> +#include "fsl-ls1028a-tqmls1028a-mbls1028a.dtsi"
> +
> +/ {
> +	model = "MBLS1028A-IND starterkit";
> +	compatible = "tq,ls1028a-tqmls1028a-mbls1028a-ind", "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
> +};
> +
> +&i2c5 {
> +	gpio_exp_3v3: gpio@71 {
> +		compatible = "nxp,pca9538";
> +		reg = <0x71>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		clk-intn-hog {
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "CLK_INT#";
> +		};
> +
> +		mpcie-waken-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "MPCIE_WAKE#";
> +		};
> +
> +		mpcie-disn-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_DIS#";
> +		};
> +
> +		mpcie-rstn-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_RST#";
> +		};
> +
> +		sata-perstn-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "SATA_PERST#";
> +		};
> +
> +		dcdc-reset-hog {
> +			gpio-hog;
> +			gpios = <7 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "DCDC_RESET";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
> new file mode 100644
> index 0000000000000..c5590c6d23995
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "fsl-ls1028a-tqmls1028a-mbls1028a.dtsi"
> +
> +/ {
> +	model = "MBLS1028A starterkit";
> +	compatible = "tq,ls1028a-tqmls1028a-mbls1028a", "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		button-0 {
> +			label = "S4";
> +			linux,code = <BTN_0>;
> +			gpios = <&gpio_exp_3v3 11 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		button-1 {
> +			label = "S5";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpio_exp_3v3 12 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio-beeper {
> +		compatible = "gpio-beeper";
> +		gpios = <&gpio_exp_3v3 15 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <1>;
> +			gpios = <&gpio_exp_3v3 14 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "default-on";
> +		};
> +
> +		led-2 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio_exp_3v3 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
> +
> +&i2c5 {
> +	gpio_exp_3v3: gpio@25 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x25>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&reg_3p3v>;
> +
> +		clk-intn-hog {
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "CLK_INT#";
> +		};
> +
> +		mpcie-waken-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "MPCIE_WAKE#";
> +		};
> +
> +		mpcie-disn-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_DIS#";
> +		};
> +
> +		mpcie-rstn-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_RST#";
> +		};
> +
> +		sata-perstn-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "SATA_PERST#";
> +		};
> +	};
> +};
> +
> +&gpio_exp_1v8 {
> +	dcdc-reset-hog {
> +		gpio-hog;
> +		gpios = <6 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "DCDC_RESET";
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> new file mode 100644
> index 0000000000000..6261100f3413a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "fsl-ls1028a-tqmls1028a.dtsi"
> +
> +/ {
> +	aliases {
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +
> +		crypto = &crypto;
> +
> +		mmc0 = &esdhc; /* SD-Card */
> +		mmc1 = &esdhc1; /* eMMC */
> +
> +		serial0 = &duart0;
> +		serial1 = &duart1;
> +	};
> +
> +	chosen {
> +		stdout-path = &duart0;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			/* 256 MiB */
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&can0 {
> +	status = "okay";
> +};
> +
> +&can1 {
> +	status = "okay";
> +};
> +
> +&dspi2 {
> +	bus-num = <2>;
> +	status = "okay";
> +};
> +
> +&duart0 {
> +	status = "okay";
> +};
> +
> +&duart1 {
> +	status = "okay";
> +};
> +
> +&esdhc {
> +	cd-gpios = <&gpio1 31 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	no-mmc;
> +	no-sdio;
> +	no-1-8-v;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +/* When switched to baseboard-internal i2c bus,
> + * IIC5 has access to the following devices.
> + */
> +&i2c4 {
> +	status = "okay";
> +
> +	/* SI5338 - set up in U-Boot */
> +	/* clockgen@70 */
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	gpio_exp_1v8: gpio@70 {
> +		compatible = "nxp,pca9538";
> +		reg = <0x70>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&reg_1p8v>;
> +
> +		ec1-intn-hog {
> +			gpio-hog;
> +			gpios = <0 0>;
> +			input;
> +			line-name = "EC1_INT#";
> +		};
> +
> +		sgmii-intn-hog {
> +			gpio-hog;
> +			gpios = <2 0>;
> +			input;
> +			line-name = "SGMII_INT#";
> +		};
> +
> +		qsgmii-intn-hog {
> +			gpio-hog;
> +			gpios = <4 0>;
> +			input;
> +			line-name = "QSGMII_INT#";
> +		};
> +
> +		qsgmii-rstn-hog {
> +			gpio-hog;
> +			gpios = <5 0>;
> +			output-high;
> +			line-name = "QSGMII_RESET#";
> +		};
> +	};
> +};
> +
> +&enetc_mdio_pf3 {
> +	mdio0_rgmii_phy00: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x00>;
> +		reset-gpios = <&gpio_exp_1v8 1 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <1>;
> +		reset-deassert-us = <200>;
> +		interrupt-parent = <&gpio_exp_1v8>;
> +		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,led-function = <0x05b0>;
> +		ti,led-ctrl = <0x1001>;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +	};
> +
> +	mdio0_sgmii_phy03: ethernet-phy@3 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x03>;
> +		reset-gpios = <&gpio_exp_1v8 3 GPIO_ACTIVE_LOW>;
> +		/*
> +		 * Long reset to work around PHY incorrect strap pin sampling
> +		 * due to external capacitors for SGMII
> +		 */
> +		reset-assert-us = <2500>;
> +		reset-deassert-us = <200>;
> +		interrupt-parent = <&gpio_exp_1v8>;
> +		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +		ti,led-function = <0x05b0>;
> +		ti,led-ctrl = <0x1001>;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +	};
> +
> +	qsgmii_phy1: ethernet-phy@1c {
> +		reg = <0x1c>;
> +	};
> +
> +	qsgmii_phy2: ethernet-phy@1d {
> +		reg = <0x1d>;
> +	};
> +
> +	qsgmii_phy3: ethernet-phy@1e {
> +		reg = <0x1e>;
> +	};
> +
> +	qsgmii_phy4: ethernet-phy@1f {
> +		reg = <0x1f>;
> +	};
> +};
> +
> +&enetc_port0 {
> +	phy-handle = <&mdio0_sgmii_phy03>;
> +	phy-mode = "sgmii";
> +	managed = "in-band-status";
> +	status = "okay";
> +};
> +
> +&enetc_port1 {
> +	phy-handle = <&mdio0_rgmii_phy00>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&enetc_port2 {
> +	status = "okay";
> +};
> +
> +&mscc_felix {
> +	status = "okay";
> +};
> +
> +/* l2switch ports */
> +&mscc_felix_port0 {
> +	phy-handle = <&qsgmii_phy1>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port1 {
> +	phy-handle = <&qsgmii_phy2>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port2 {
> +	phy-handle = <&qsgmii_phy3>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port3 {
> +	phy-handle = <&qsgmii_phy4>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port4 {
> +	ethernet = <&enetc_port2>;
> +	status = "okay";
> +};
> +
> +&pcie2 {
> +	status = "okay";
> +};
> +
> +&sata {
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	/* dual role is implemented, but not a full featured OTG */
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb451,8142";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&gpio_exp_3v3 1 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_3p3v>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb451,8140";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&gpio_exp_3v3 1 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_3p3v>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
> new file mode 100644
> index 0000000000000..69aa36a3a0523
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +#include "fsl-ls1028a.dtsi"
> +
> +/ {
> +	compatible = "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
> +
> +	reg_1p8v_som: regulator-1p8v-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V_SOM";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v_som: regulator-3p3v-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V_SOM";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	thermal-zones {
> +		/delete-node/ ddr-controller;
> +
> +		cluster-thermal {
> +			thermal-sensors = <&sa56004_4c 1>;
> +		};
> +	};
> +};
> +
> +&esdhc1 {
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-ddr-1_8v;
> +	bus-width = <8>;
> +	status = "okay";
> +};
> +
> +&fspi {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +		vcc-supply = <&reg_1p8v_som>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	js42_18: temperature-sensor@18 {
> +		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
> +		reg = <0x18>;
> +	};
> +
> +	sa56004_4c: temperature-sensor@4c {
> +		compatible = "nxp,sa56004";
> +		reg = <0x4c>;
> +		#thermal-sensor-cells = <1>;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +
> +	se97_50: eeprom@50 {
> +		compatible = "nxp,se97b", "atmel,24c02";
> +		read-only;
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +
> +	rtc1: rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +		quartz-load-femtofarads = <12500>;
> +	};
> +
> +	m24c256_57: eeprom@57 {
> +		compatible = "atmel,24c256";
> +		reg = <0x57>;
> +		pagesize = <32>;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +};
> +
> +/*
> + * We use a separate sensor IC to measure core temperature. Disable the TMU
> + * as its driver can cause log spam outside of its measurement range (0-125C).
> + *
> + * Will have to be reevaluated if this DTS is ported to a mainline kernel,
> + * as both sensors of the TMU are referenced by the default LS1028A
> + * thermal-zones definitions there.
> + */
> +&tmu {
> +	status = "disabled";
> +};
> --
> 2.43.0
>
