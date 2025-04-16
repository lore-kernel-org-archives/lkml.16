Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2047.outbound.protection.outlook.com [40.107.105.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9141ADC67;
	Wed, 16 Apr 2025 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814550; cv=fail; b=d4whNrH4Psvj1zv5DI387MO09u3DFgYbxwco5LwUTYfi7IoiwHEzGlAOcnet0vjoumdWUluSjP7SVStsyPiTOm+SGWjtUxYVnkeicLpwyXF16PDldLNHcUnZ45D3RV5BJBRhySRCqpJ2AzhYroBeG5VNg8YvrXzh+i0CBoqSNtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814550; c=relaxed/simple;
	bh=J0BqeTwCRWPDVdPAswiQ0SEkR4y/sevF4hnUlV2+h3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qqwDG/EIHi2MuLCKiff+7JzPPFPA0VVbaCSpcyOOQdr/I6dCPF8naYhVg966z55QeC9zApOpsGhWekHn+98B6jubUPuHXwCcJPrwI9If9Iuf4jMwAoLIjR0b8qpB6LSPPxWDPH2xr9iSgEfX2V6j72cfpmOIyh2p57PV6BdlCgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k+hmXLWr; arc=fail smtp.client-ip=40.107.105.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k+hmXLWr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I//mv4wCB7KSrxokVPupA0bvJjrpTY/q+RGCx2vEfRXtVeBQF+RX0s4aJiMkr7dGLfIxMgMtNcmOUd7gSREY0Bf4NEsWff6HQPzTPzZKoR+qt2AmvGAu/J1its9Us46Ym4gTVLemy84Sw/CzenMiDb11AjarDwRUQScaG6skwCfgJMpdSvvnVYcTp7OUmIfX2nqLcDe1b6KO3/Tzwxw4XFUisaZZR0ccMkkWo/z0EBkSzWGx0QO1GNrk8iay09XRwOcsxkVOw3UDl4+GlwSgh16pkVECRzO+WLU/Uz0MxxIqNd4maJgksALRfRAF4L8LGhzDAStce8x8sVaLmSHq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDoe01KLoK2Yuo+8o/EjPA13d5ZEHhp+Os1yWJ8Ta6U=;
 b=wtAu0OuY4g0IHy0Iy2JOubpnrvony4nscB+xxgusNbFXXch8zrVeEH7pYX9wEEhrugbopLhShpL7G0IIujQEN6j0+v6ljopAVc77IUzUgdkvoS3ctn9Jm5ecD0sEum53Y2WVl0INF3w0YSucuabbF/g/5GxN8KMGBE7zfPcERFIAM6fTbl9iXRDLzUyadroYdrjVf0DDzWpPtNHFlN0OYeb9eXH+275f1pntRtAeSwEDwH+rl4302AINXR6u6NgweEBOEUzekR+zklXm4N5FAAXnaO+WlDQqjuEl4HJGNHw+LhYUfj0cGEpAqDsf25WuvVfTPFMAr7pbSGbFnL7KhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDoe01KLoK2Yuo+8o/EjPA13d5ZEHhp+Os1yWJ8Ta6U=;
 b=k+hmXLWrQ1X+O+OEKn1UJYhZGsNPd6BqkvNj4Ig/5Sn/CwHqsMM+b7XYK+41fBXdEaOLEv3r7S5h+C50gKlYL8Svb1Paa01Df5+jVXGzYkI+xxwtg5WgAlXhciCLAMEOsxd/UPAIExfc9tvxnoTtwVInWxm9scQkWuvHQ4SCvqAAGCWUcyqLccc48VOEkbvI0YIFF613KinMHsc+T+a5cGj6M2UXzzuFy0ToOICP0HyHzgBMxt0uMzUGtEneWLIjcX0KR5m4BFCP7i1Zdh0hYzVvNXteH2CCO5t0zJ40aBMQ8Tq7rwgAnFbBC+5JcTEckbsXc8mLSQkat8S4aDHt9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 14:42:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:42:26 +0000
Date: Wed, 16 Apr 2025 10:42:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 05/10] arm64: dts: imx8mn-beacon: Set SAI5 MCLK
 direction to output for HDMI audio
Message-ID: <Z//By2dRIgM1gIx/@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-5-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-5-aford173@gmail.com>
X-ClientProxiedBy: PH7PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:510:324::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 9861e670-01e1-4f6f-cb0a-08dd7cf4e7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I+McIk3yXJmM7gXxT5aIBusqNlBWf1NcsE+K22FDV1UzkGr8HqqRdsFGTRdx?=
 =?us-ascii?Q?rKAAkit/7LGMYu7LS7IqH7X/kFDnJcwdu1+TZMH97HH3DaZLkhcGLVApji+p?=
 =?us-ascii?Q?QfhcEZfXkHyg/CPxT8Xfu7FeoENehV0Nu7D0SfNcWkfoUg4MA/CdJaCiyvNc?=
 =?us-ascii?Q?F0c/iz8YP0gkA+mqCR9oDdM1kHLEDindEYzCDGf5cUOi8Dklr1RdZNCVAzQ4?=
 =?us-ascii?Q?SmDjUuIzwVQjc9wgSNEETve3dFVBaa8YfrfDxO0yxBvHh4VVG6AgnWNL5ZLL?=
 =?us-ascii?Q?w/psP1UF3qdz+PZaxYXRVd54ewnwLulg5kIuXgn6/9RZopY++FEzOxahTDJS?=
 =?us-ascii?Q?YSkZUGmrQhd/ZwW4PhZwt1FauwXRMoi2Jr+MQVZoCG7IW61sO7nKA+rZD4mB?=
 =?us-ascii?Q?NZRrvYx8wRsr1hfDaFLy1TI8qx8OBRM0OP0tonPCwdjm54KruRj0HqMgYBVq?=
 =?us-ascii?Q?amEmXbr4AWyY6153GmxWaSJSMU9j3hft4NiEh88T0xxO6AbYNzQbCopgrbSM?=
 =?us-ascii?Q?PVPiyITYjZORM7JuRlo9pGpVWaHMsUaF7SG14kyLA9yOMnAjjyawK75V8eq/?=
 =?us-ascii?Q?fDSEjUIZxlbA1JNWS0X5+2vbHmRVt5323VYdgvyAiyVk1Le9TfBJFgoRrMEP?=
 =?us-ascii?Q?jOsuhD3e2pU+NJvoTSl7EeArLlDzi1OSLclSDodVJn67QxbdjHPqXyS1Fri8?=
 =?us-ascii?Q?R5GOLs0RXy5wDDMA4kL4h+B/YS8dSJMipXuBCSw0fZz+YpODRRR1sSdolcmY?=
 =?us-ascii?Q?3uNh71XxgifKIbeAeE4ORSOo2uJzO0+fdHUXV3g1zAqW88TGrmzqUsaLt9Cd?=
 =?us-ascii?Q?xlbAFUUj3IM/6WDzxNslBafd5wMZwgEqOG1nA4TvRrrWMAj1gJ/lCT6Eu5O7?=
 =?us-ascii?Q?SIfhiEUjurH4uizO35u9ylG4XSSRGAfbtnLZvWQ7cQxLykk/4Ne2607FEHXf?=
 =?us-ascii?Q?J9FN3pY6lUMBmJvKlHNrZ+8yyxl8sOIWQ9RvVJtXnmF3ZBQFYvgHDsvUWaXB?=
 =?us-ascii?Q?WqoSyzdmq0hNKIIAIDI8DGsMw/0uc3efRnnxSmQbVhrVIGgPY1Xq1IzgjZ1A?=
 =?us-ascii?Q?QzwJIEQnTj2t8gnkDRymQX72I4FRobIBO6yA1QX7qEr58yDYCIGz8Xxehtw5?=
 =?us-ascii?Q?rEthcVxi2AuF0KbtOORA/XuBeKuuamCX8eNxJlViRLSPEvCXh0PADAFK0ECL?=
 =?us-ascii?Q?B43JM80Ezhbrni36DdwTySBFOikCjs1MI+9lT+m9aYpj23F/xwbWOlEKlmSb?=
 =?us-ascii?Q?k7Ce8JuCp+CmAuwagHH9oNN9yUt4OcM6BFg3JY0200GTyf41+2tWH5Uuarcw?=
 =?us-ascii?Q?7JOieyJcfTAgJsqjgRr/0p2Jqt8nNv1ceR904wsif8Rj+Ajp9HYhg7CQW7cI?=
 =?us-ascii?Q?E3SpGZq8nYOKzj8hroBKXgvGvk+/+QcZzwYAQda+AIn3E6VZW/iMUTjBnhe6?=
 =?us-ascii?Q?UFpPj7C1f/9z5BGdIymJ/Lx57IXvKZSD5E0NUC1ewtIGgg8JjiyROA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0zGnWylwpJ7UX1IH+gQkoAKERBocYo0dQq5nHGLVEt3gRZDQwSFQwGQroIny?=
 =?us-ascii?Q?45itmvTgcl+tH0cQsSg+5DFbBCXPXuDgbJZZiQ06eRweM8W4ISjVLYhTgGv1?=
 =?us-ascii?Q?ChXxrLGyzIEOyi20FjtJ1X1V4JGB8I021b+hwhB9vRUXhQpUPJbBxmXdwybZ?=
 =?us-ascii?Q?fKi1ioOnsaGQqKMORZPeVCXwsXubrFeivcEE+lmQWt7U1HGhD4s+0foY65Oe?=
 =?us-ascii?Q?t751WhFqLmmA3LsHNEvO7rbQ/G3KHe6X5nAjjHq9Z1ZF3tz6ioQyq8esHC7b?=
 =?us-ascii?Q?GIjNKnSKCg+kvZo1l04Ny9B4jIhqhvi9nE4f8FHioPrlDTAQZpI5S5jgBmWA?=
 =?us-ascii?Q?5oRXT0cCCJ4uhEA+SN1zcAHftxdx7lRg+Gv/Y5EFeG1NyqKqoCk8POgdBajf?=
 =?us-ascii?Q?k9Na2/1w8WTOuZjgN5zQBKJxkasXLen02cZEE5HH7YTI65ZWdiA82jdakT4d?=
 =?us-ascii?Q?4T7FQm/zpSW19/4HIlDxEURwC9Qas88FvvgIQvN2pGwdEvNSSohzOv/Mepi6?=
 =?us-ascii?Q?kh8NKt9Cc0yUknKopwgXd5l9j7tGpf+Fjs7lPMZoKFF+bC7QhCFvgOJlAALY?=
 =?us-ascii?Q?8PoAhzND7rOhKM0JOV2UFcIErcVOD2XXbZgQ58mTcJKgjBzQxM66tcyk1zP2?=
 =?us-ascii?Q?KkUIsVpVQd7rnX8u2C85+aVwO0JMom8L7Huq5rrmbLnpfPMHq8dZmOshllsZ?=
 =?us-ascii?Q?ojZKBzSagfCI7rvQQ2jYwmkepbQu50OGaVIp/mkSdbDqewUEc7Jd+wFEBNeq?=
 =?us-ascii?Q?O9ffVuciKz8KP1F46ZR8o+8tjK9Bvee0mzPSAmpYT8i+9OQyFGDmvGeemPgC?=
 =?us-ascii?Q?Q+d7rn1WcCKhfr2wt1M38WVRCKRfLgT32jW1stYOFg+KtWJM/+2tZ8z6i+2E?=
 =?us-ascii?Q?r8OLyMd6Qp3w6Ib4l5hqX8YTTB/5m2l6RFWqdXAmR1d781pQ/ibcwUT3ZXn/?=
 =?us-ascii?Q?q2ATzBPZEmPd7zmz8JdMBH6Nj/DPWHklqru0BfjrgraWq5gOfychtREOLguQ?=
 =?us-ascii?Q?7cyX8tMZ29Rp004VcJhhVH8HF7nybP1sjoTv4qe59FNoTgCFcYfzUCpJgNx4?=
 =?us-ascii?Q?+0d0byZvqXx773MCv+RmgwPs3YS+96bzCOVirvMqCdAuxqzzzOFu8d/vYY2K?=
 =?us-ascii?Q?FtGm4DR8nmbEBJ7nqt7zvVHldeNG7e88I0rB3ordmMkRaUFI/GSh+fQT15mD?=
 =?us-ascii?Q?l3yCSegy7/poKJIdlWRxiQugnWwHEjJDansxSxja3AFIBcrM8ni0jkQZUHpI?=
 =?us-ascii?Q?wGhK+4isRALSmR0/vGwgjpcchXjhuLBD9uEg7vjHCwAfxs92UAK5xGohozDG?=
 =?us-ascii?Q?vC+ZvNwuDmonwN5pvy3NXvtQ9tKlJjHUw0aj3+NL++iSjlbdtITurtS6Wjlq?=
 =?us-ascii?Q?Jy/V/zKZdQprQ4ggcGz/LKYk5wiaiaCgXTXew2lIpbfj0XZfBLJdV9KE9doU?=
 =?us-ascii?Q?9YXyc5CxzIdK4wBQgSAeGyofn1xwtp8/Wew2QSAaduCwgsAzIFDsNXEqVixz?=
 =?us-ascii?Q?WW7e/uBKFtaDzNw8pWlNwn3N59/WgxGHV6ZyOJMRvxeIaOzRcjMLUBHHot45?=
 =?us-ascii?Q?NFz4/PzkM6Y8JT1PSldvHYgtBL7jsHnyy0aPQmau?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9861e670-01e1-4f6f-cb0a-08dd7cf4e7ec
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:42:26.3504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzmz7/ZtARDczJ+TLmZ91JjBxyduU71vvjYFmv6Th4jVSDQwXxsgz9wjspCzOv8watEfC1vkCP3sYHUAk8G6nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

On Tue, Apr 15, 2025 at 08:01:31PM -0500, Adam Ford wrote:
> The HDMI bridge chip fails to generate an audio source due to the SAI5
> master clock (MCLK) direction not being set to output. This prevents proper
> clocking of the HDMI audio interface.
>
> Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
> the MCLK is driven by the SoC, resolving the HDMI sound issue.
>
> Fixes: 1d6880ceef43 ("arm64: dts: imx8mn-beacon: Add HDMI video with sound")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Change commit message, no active changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
> index 1df5ceb11387..37fc5ed98d7f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
> @@ -124,6 +124,7 @@ &sai5 {
>  	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
>  	assigned-clock-rates = <24576000>;
>  	#sound-dai-cells = <0>;
> +	fsl,sai-mclk-direction-output;
>  	status = "okay";
>  };
>
> --
> 2.48.1
>
