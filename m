Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B91FFC69;
	Mon,  3 Feb 2025 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597152; cv=fail; b=LUp6Hq/vVsQXKz6DFbtTk+eCmOVToSx4WRrBjQ4nSDaQt+w/2EVaLbKXE731lxsHLQ5m52dhrLw1HgOZxycsupuzFB2GGEiGta3Z0awXAb9ON4RD7DHwZrZKI3NCPtXubEKNiaS5UsePZXeK7vGh0VaUxlqym1msAOYYevwcM2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597152; c=relaxed/simple;
	bh=LMYBxZIO0fI4l7ke+XDLrzdHZ9IWUb68khNDJhQhOTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s6eFV0Ru2VG1AUHtlSDtffU/240/vgaUje3XBaAY2VcByvhj0cUIZRT5wJOGAXTYcCEv64cn8muNOZS7Rtqe+9MUhUpoGwHnKwnk7QlnLbHRDqLpk33mHCwk+J8CR90NgcmR19zKZqJUVoV18nqIOnHdAmNk3HujfESSv6zIqMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bZCI+ubZ; arc=fail smtp.client-ip=40.107.21.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bZCI+ubZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jShCI7riv61eUicSJBjMgEonGqPrhkmcJNuxCHFRaRGSMRdmmOrbWoUvKZ0tsiUqDPFhPITq9SkVe2J+SYFOHIcfDV5/NqBSw2QJwotuckApz1wC97cHd0++9uxc9FxkOFc9fNstJrwZ13j2lG/qbpYhc7JmO0jKaB8nytWOChdDai2HxHpAn38kT6fj/HNLtdWONDsukHbtBdWFKoAIRm0iLnlSr2KB4wh58M1R2fPiJqAwT9wpWfRVtBBhC56RzyzMK9d3LLT13Cle8DGYmzcqdkUW/vihEpRRfrlO+esxRdVaFAhksRayNkNcMbz3b6aBQMJnm1GX/0/0E1vrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWY27lDsAtP1r/eqjdYWBVgraKpugSKogNUv+POAL+0=;
 b=MqSTT4v6LUYSUhOSgAm/DC5i4n6esvNPM6A7iIqrot9mD498vWwwWHYceKY2pg1GP2+CZPA96mTAutyCprucosaEOvmqbe7s1vxwBszU9lQgK0tYsgIFoyw6hsyvJLyCnJkJL5vhSEluCNK7vJmdY8MLnckETUm+5j5yqeUXzV/QDv37zQtBWW5d69kOreFbTJLOes2afqwG5NA1w9GmmgFBQFJPiwSlE6iuRnW6QNs0v7SQc6+rDbOeVnMzx9YxGeV1FpnI5LOn2+1N90IpbvxXpkyUMJGUjo6x4B0h1UdPDEsHYOhnK1IJ7t/SrjhfR52GfVSLr2wCqm5qcYnt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWY27lDsAtP1r/eqjdYWBVgraKpugSKogNUv+POAL+0=;
 b=bZCI+ubZlZzLqcq8JzJ7iiQcYiTZ0bbgYq7V29ff6otLWWlx71smhrm2paYCYqGlElOT1N+8RssLXd8/aaYMKJEr/zDt5JJQpxs2DHp9X25FjtXx7twmUkEdjVh/5a1+8s/ydjwX8wSo7K7VXHlF+b6iCTX8Z3NELKTAzJLPc8NPcljWYN/p8HmrVyFndzRdAReO0Bb0rzxBDY+9e3PT6P/GdZ6isULPiXC49KVPvDpo3Gag3FzM/HUbx5hn+QlmcH9+WDBfMwV6wn8psGOA/lWXFX71rsD5bdJeqBIKbkBYOwFtQFxBke0DWIWbu2pxX/TkIQ33FUvdg1CeGmOGkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB8030.eurprd04.prod.outlook.com (2603:10a6:102:cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 15:39:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 15:39:06 +0000
Date: Mon, 3 Feb 2025 10:38:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com,
	eballetb@redhat.com
Subject: Re: [PATCH v2 1/2] arm64: dts: s32g: add the eDMA nodes
Message-ID: <Z6DjD+5aYRL/I50H@lizhi-Precision-Tower-5810>
References: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e20d557-7d29-48ef-2d1f-08dd4468e4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pcByATVD988+8NLPvEEcct1Y4y/FmKfzSsKrO2Swgh5XDXlaqEqcUOzrTK1s?=
 =?us-ascii?Q?dBKVAdE281tzGlZfYrueCL12aqVUqTQNdP13/umYwE1OVce2PIyMb2tkyedA?=
 =?us-ascii?Q?k9UhNQxpHFw232oC+EfjazluTpgM0oGUnnfS81rhJBfdHufVX04PuQV+TkUK?=
 =?us-ascii?Q?TQuYB0zsmgGD6ZXbZ65HtvttpLZ3QCofZt934L2jmAow2KRbCmI8WJ/WDn7+?=
 =?us-ascii?Q?YDkbZR/Cj6xg7T0n7IE/8fwul82reC3qKTXpPnaCLaDeUs7a2ZSK2+dhUiSm?=
 =?us-ascii?Q?FUiJJTfOuITSujYoaq3CN8QBKVpE75ZA2a2vx23rYGRQR1215ARRc+ZfBazh?=
 =?us-ascii?Q?FCAD79qsNXJ+rJdlpW+mX7SKCPu1kVUqhemG6GbUHjtzLDxT+xQx+1aJeDGo?=
 =?us-ascii?Q?crBBPHs2Ja4MxsvArGlBhU6whPX4t4Eoi3nC8GeRnt4Jsi9quflgnpFcxSZo?=
 =?us-ascii?Q?gJFmhD7n/Wsg0FTtd3qJ8kWxU9RG8JJHKvLv1Tyh5V+tUUcGKPyV7wlq1YAo?=
 =?us-ascii?Q?8K27o0QQ0bgNmsXoy7vyQfkSbPe0QBUaHGptq7vPUFpotd0v7UCYJ+zYOCN/?=
 =?us-ascii?Q?08t8anTLyioncdZMgSnXd9GGVvCSohhSpxwDxALohVj7fP7Mywq6ykWmmK8n?=
 =?us-ascii?Q?I5CwRl+e0J4OucR4sMXbDZEFXobqUpEaObVyp/HD1/2RxYWc85aSVQe82aIC?=
 =?us-ascii?Q?68XxRNydABQr+ahIRo2xGrwGKM6yr748OgSTF8yEUc/zaEsIaZdW2KpJRx5r?=
 =?us-ascii?Q?kpbUxWR/Z8LyXe/OPtX9zJOP+X2J7N0gaAhU83LJiPey6CIRJIEADlwuM4Lc?=
 =?us-ascii?Q?7YrZrgtGmc13TZfwQ6eN8FsiRN9E6zuslenv9RjRyiIsw3/DB2Y68zP1Pyu6?=
 =?us-ascii?Q?akLEirDiBRzlAefZa4CWzpDO5wVNO3hshjbx4HkhS50Kayz5LDu9SJWKb1E9?=
 =?us-ascii?Q?g8Ty+7B0zg2O4TM+vmNMu7OZ4x2AC3K6x6jmAXAw1XSi9ihx0C0JvbZT18Q6?=
 =?us-ascii?Q?4og88IxWLQxJA9YrFMtXXda1GJC/UMNkKuixs30+OGZ+Rr5J3BPN0FKWRJ1B?=
 =?us-ascii?Q?tCX7wPS42PqVoGb1DDCCxnjCWWVm0vVQRuB84P71FIcFY9YppLPDDAeNiFwj?=
 =?us-ascii?Q?xrPMzFWhc9fT1myDEFg9M8Wmufl803EFiqnIffAL8W/DWxjSuvnj46eBvjev?=
 =?us-ascii?Q?T1dlK7WldBujCekL54SQ2ZwnnQknnYmsJvdOBpwYXWBomf+D6/RbbYYsdmLj?=
 =?us-ascii?Q?WlF7G9cDTLamNOtgS5lY9rzIyuuaO1DQc+ysQ69CPlBCb9HGE6U+lbJ9Y0Dv?=
 =?us-ascii?Q?p2ThtxsvCwybbu+9TLptmgSz5xJfAWvoSZEzDQYzMuMicOGzrv+wrjN8pDeN?=
 =?us-ascii?Q?pbT1PYNg5+QWNVTFecnEpRv03zSqUcmsTOXIGz+l+tzFvsiFU3PTVkeqL9hd?=
 =?us-ascii?Q?eeHI1ly5ZeayhGiZyw/VWj0Nt/4dcHpN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nv8irXzBzcZECc6kNumj5X7tg/A1bf8cz8AqD+tHfTda0vCmwrZQ6r0sIk3g?=
 =?us-ascii?Q?+SUzcO3sMwJ+6/MFqP+0cmEplYXAbi5Qiisiw8UsIO/cE1UqCuGfK4PyHPdp?=
 =?us-ascii?Q?SoD54rYPviO/nvhFkgqaDPGABJMV/DloM2IUeBpEWlk4NbhmvoY/sk2ai9/d?=
 =?us-ascii?Q?THIIkLSeGSo4Hhkwswt10lwRtZ7HraYJpT/w/p7pCBZGRvDPmyz9ukgolr1p?=
 =?us-ascii?Q?++Hqrodw8RPDKl9d5y1HVNFDJHnT4domSp9S7YN/XLE7lfBBU7pS6OMbqCEa?=
 =?us-ascii?Q?/Jp6GLcpVOPL2vqKjtlhkgiyTFcNjsUGnJXuyH7MnBkpXGyPgF7viDWW1IzO?=
 =?us-ascii?Q?YtEvl06WtN+vI9Og3AlP+6E4cimivAJvsqIJh4iFzNbhuWgZCslbJB2qWwJ/?=
 =?us-ascii?Q?NkVs1nRI0GpPlSISWPosIGLeqyu0eYXG01AyErTCCVH9uQ3ObCMhcVGGPmeD?=
 =?us-ascii?Q?3feU24BXXQ98QRw2pCRtHl3GlIByVQf4u8CGx1LUVUxcZ0IEY4xxWpfotYiy?=
 =?us-ascii?Q?kmRG24B9tmJRUulGNN8MCfQnEjdMIhqXaXBYLXQZBQlFwE0TpEOagy6tJP6t?=
 =?us-ascii?Q?0orFccXod8/waKbHjdmjLSIxDu2ydUadzzHoGmpTkH4p/xz0NUfN1xczcbWt?=
 =?us-ascii?Q?nFU20h1I5c8WACmb1U0v/AcbDjN15VoFqYW9FB50OoRynY9FCAYo2Tg0tnRf?=
 =?us-ascii?Q?RRY8ZkkQkXTyvV0cSha02uit9X8LQKlPVCU8fpIUe8mppRBIJ3J0Nfv1+LZz?=
 =?us-ascii?Q?G7xAwczZUVC/4xdifFdtrxOuEkBvf8EP8ZhOxM52aIc7B8Rd3VQjuxE9mS+C?=
 =?us-ascii?Q?RqJll5uJKKrcduvxwNPzxxxrFS7JmUxBm3z88HNgqgoLSN0J39U/4eEemdP3?=
 =?us-ascii?Q?tU81lSHiB0eFr+cPPJ4JZfwqEBGh7fAMZ/8rCOu9WbrTpI5R0v88Gt6yNoEh?=
 =?us-ascii?Q?YIpfOUobVOf3jmyCNrMWt6LVXRf6DKLtw0SgHlp47xBeyYXxRJntiAnntB3M?=
 =?us-ascii?Q?nmu4CTFBDeCO3ObiRJ2jfnloTK0JfKrY4w8WMr6A0c5d6Jbpd4LU8YiSlzZh?=
 =?us-ascii?Q?oOEpiyPv7lO3NnyBXjyQfz59QIpdd7rE0RTentOrI9Pchgv3/6EegVXiBiYN?=
 =?us-ascii?Q?2uLyKNmrASjko0mSIu2Sr35w13BL/+be6bvh5Xyo0hjQexTbobisNIeeZsve?=
 =?us-ascii?Q?0E5lABYeyNP0Q0RUjCsq92acZ5j5VEpGV4o4s2kc3e06lH2I1PP2yDQHfFUR?=
 =?us-ascii?Q?COnOeFURsQ3NPZVwTpaytYEHGeiitAWGDfQ3xQbC5lqaWq2LvBO8nElSoz4l?=
 =?us-ascii?Q?NFyYRXIKLR8lF/xvoE6LQfwaM/C9m298U+OsQz36eNbR3yBCmCCTyXCa7TdF?=
 =?us-ascii?Q?UvRGS9YDA9UlIT2ZoIQkjeftxcJG5Kh2F6W5wJa4SRSmnkDTRXZt0w4DZEIO?=
 =?us-ascii?Q?uSrknBDt0QM5XnH7YIVSEBmU/Y7HPZM59UgeroucAGI1NlRYMOTJirDDr+Qs?=
 =?us-ascii?Q?lEzK848tpTj7f3ARUa7prl6OMgIMWKO1UqENzWfgQQyihZVFhcpo5iewMsub?=
 =?us-ascii?Q?Woiu57Vg0y/+ovfqruTZj9vnRfRY+qgYqCSUpsQV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e20d557-7d29-48ef-2d1f-08dd4468e4f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 15:39:06.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CWUI/1PVe0fOHdDSA2ZAlvyQWlpesvFJIJJeWcUgZEroQDS/tCsjy5eRL9mVy7J9Xg+QETYmmfHOlL6Mf3fcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8030

On Mon, Feb 03, 2025 at 10:09:19AM +0200, Larisa Grigore wrote:
> Add the two eDMA nodes in the device tree in order to enable the probing
> of the S32G2/S32G3 eDMA driver.
>
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> ---
>
> v2: Moved #dma-cells before dma-channels and clock-names after clocks.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 34 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 34 ++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 7be430b78c83..64eac1dde05b 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -317,6 +317,23 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
>
> +		edma0: dma-controller@40144000 {
> +			compatible = "nxp,s32g2-edma";
> +			reg = <0x40144000 0x24000>,
> +			      <0x4012c000 0x3000>,
> +			      <0x40130000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>  		uart0: serial@401c8000 {
>  			compatible = "nxp,s32g2-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -333,6 +350,23 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		edma1: dma-controller@40244000 {
> +			compatible = "nxp,s32g2-edma";
> +			reg = <0x40244000 0x24000>,
> +			      <0x4022c000 0x3000>,
> +			      <0x40230000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g2-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 6c572ffe37ca..4f6201d6c08a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -374,6 +374,23 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
>
> +		edma0: dma-controller@40144000 {
> +			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
> +			reg = <0x40144000 0x24000>,
> +			      <0x4012c000 0x3000>,
> +			      <0x40130000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>  		uart0: serial@401c8000 {
>  			compatible = "nxp,s32g3-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -390,6 +407,23 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		edma1: dma-controller@40244000 {
> +			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
> +			reg = <0x40244000 0x24000>,
> +			      <0x4022c000 0x3000>,
> +			      <0x40230000 0x3000>;
> +			#dma-cells = <2>;
> +			dma-channels = <32>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tx-0-15",
> +					  "tx-16-31",
> +					  "err";
> +			clocks = <&clks 63>, <&clks 64>;
> +			clock-names = "dmamux0", "dmamux1";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g3-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> --
> 2.47.0
>
