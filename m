Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2070.outbound.protection.outlook.com [40.107.104.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97916146D6A;
	Thu, 27 Mar 2025 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087824; cv=fail; b=qcN/kII7BMZf2ufTPyaq3o8h2JFJA6OssJ37PBnY50WFvOMuzMxlpgJx9n/D+sVYSDmc6KZtUOkiLOLDSCLU+/Lz2dHIKCKkXzn3H6JrUJjeW9U0HuADgIroOTFP/gWKTviYhJ85jruEijp7h9optj3B6O9io9QwVSIq8aiLWlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087824; c=relaxed/simple;
	bh=Qp9yAv8VpyDy8LfQoVhZBwr4gmuliFJe4qOIu5gn5+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KKGTWjnCzG1o/6xnK0ZGM5swPHreNJAIim3l7BD5SzfoLmYmWqmPA4XCsUNjMfDMjqaHcNdmHTqF5MJaV1YlA6OJfiGw1TQRhtqmXXmsQSUpFnb1ORZJH5q5KFhu/BI72I8SzV9MExtrwkRZnROsrClNNDXRvepxpd6iWxoxt4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kmClW6g8; arc=fail smtp.client-ip=40.107.104.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kmClW6g8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk0vqwUJLycHYolEQSz8ODbzjR8FhgNTUS19J03mqKgF7WlD2HAolPCf0Zli/6ULuVw1Dgks1fGQKEogOK9qJAP/8Ylc/JDGI2maLDSHYykS/62IuVbZppF1l6Ys22xihpF4yEq+Q3ZkZQ47EzPvcfQR7F1vdqZOumeEuEUsSfbbik2XQqoLc1NOF/EHgGAU6kTElaZd3NRndOF/D426FxYZLfepSDwNozsYLCx6a/o1LbgwSvZOxApH/PNr7XtdXU8jgb0ys3fFf0Sff4zxRmfXpcDq3Re/Hd7njdnx8jcgWlQwgGX2pToloJ9/ah5aK6MRvDuLJEJ3ZUFWv/KMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCn6yLHn2xMU+ugyHhGpkx1E1LnELisSV566o2MYqT8=;
 b=im33MbC/DDHaNHCoNvnBvkMXqliks+aliLD3u5yYdTby/CiRiBqoQ/V0K+tIQEOMsE9tyci6pFPRhCPQnOck/KVhTflKk4QiqiGZWJYvV529vkTYwUWjVPO+bS6XrgTDc14K6pajUUMWAhHqwhJBk+tJ3jHYM1xYeKl7JoOUxSQrcvE3Ww+XYnSfCCrg2UG2X3Ud4DtC4k825JS+i8pujJWJ6+i2lvbY96VQXs35lUwaPPYQULGijhh62O57+eZnDF2/ZkyckxWJRI51Mx+XKe6yLLUuPB4uCOvaVGfzsIopDDD0bz8THieu6afBorBcf2uQVxvEurlmXrf+PzP/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCn6yLHn2xMU+ugyHhGpkx1E1LnELisSV566o2MYqT8=;
 b=kmClW6g8DTNmQ9dH7HUDNQxUKMx70316ZtKO+7rkaNZDvkHwpeaEzpCYXGsKNTazzuBLvhbfD3WRBc9aVXgkmYt4rCotqOHo+fojQnzsJmKtGqsrZ6/QAtEAVrMGQQBcdi5K0Gv1tkniPySEozQsJ5Gvgqn3s8ozAQIOBGjaGvu0Nvtt8m/lYAalx1ugUmH/6cDMXBr5glzN7xslM2+gyctNDzzgws9fKyiisvmPaFW5+504jFZSGtV/RBXfkcVlCRIl82XbtH1YxHzNsmoQQdSfovl2QJ+9OAS4nhJ0C00mTDQPWvWFfzLYo+Ar7hCFkDxYlHusup8guTd9B7oT2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7190.eurprd04.prod.outlook.com (2603:10a6:20b:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:03:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 15:03:39 +0000
Date: Thu, 27 Mar 2025 11:03:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for
 CDTech DC44 RGB display
Message-ID: <Z+VoxVoRVKM3dMAC@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-7-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-7-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH8PR02CA0051.namprd02.prod.outlook.com
 (2603:10b6:510:2da::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 41686239-104d-4311-b459-08dd6d408e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bRJujJZ2H3aDK86BGbFzDq+yWlEZhxx9ssOXNDgG8luOIMDNwA9FA5Dtl4LJ?=
 =?us-ascii?Q?fZ61mcedZ/UdKdOoXjFJJmLmX35k8H8bqxuRIzKSamFN4m6C7SZ8okFLfkku?=
 =?us-ascii?Q?fA0ce6nW2PwS+yDWq0rBQSHCUNQycKX0n6X9WBNn2pbGauKEFcd/ayqqnIXS?=
 =?us-ascii?Q?s8Ewp85mhMmsHKC6JTUqc7Mn0kHtV6fW+aeC6U/D4ePIb6Ql/J333u8m/P2z?=
 =?us-ascii?Q?aiXuZxY8D2VN3PJb61U6h5UmCZ75PiiPSl4Wlt93aB6zdShoxucv0Q4DhB5Z?=
 =?us-ascii?Q?Xb/R5lzvWB24pD6Av1Fyot4yH6R1oqoaKgmPdbpajF1Vzdiv2QfQS2JcFTRZ?=
 =?us-ascii?Q?I6lOCbwSOlFBjIc2f/kR5g4UDIh33ThG3+zp8T5GvGq0BDb7W2plTZ+uFwDl?=
 =?us-ascii?Q?caY739Ur/z4UJHrHKfVFbiGnUne0+/4pFIg4xhiEN5HBTaU9y+TBLxs0/cQ4?=
 =?us-ascii?Q?5MRcbDslGiElqBqfDSbC+75i1Ig49Xnt9QJzOIZOMzixZ2NEIE7Dpw4x2aIe?=
 =?us-ascii?Q?2e/qwdAkThzTXavHRjtfJb6XDhEWPB4zuQbE5hJqfGgm7jX/m8NNTW1IEiQw?=
 =?us-ascii?Q?WfsnjUMkwv23dPWfAznN2A+zKBRveLYau9Gi6UDwGLR3D4gbjBB0uThhEV39?=
 =?us-ascii?Q?rwjb/vCCA6GV54L1OE06gknj4q1m6O9oRlu6OOu0cPhxtsnt74Id0LuFQXUF?=
 =?us-ascii?Q?N5Jt2be0HF+6ZhR70IzZwx0p6hK5qkbzPAtgxaLXMle0kA+/AP/m5/NcLgD0?=
 =?us-ascii?Q?XnNDX9FUhE0H/auuGdaZLbMY05OAagZZ8jjjNCTYHig2+CDWI+tSEe8qDefj?=
 =?us-ascii?Q?pCNXtUFNz7GAx6B/R7iyEaB+6IlRdiZsYKhGuPkXIJcM7zZkSAGBZrHND/k6?=
 =?us-ascii?Q?pi4Ey6sR1PQ8AHcLFgh73XWIy7BWT4fhIIH8jsx+S0NJqNsCa2eN033ZRv/8?=
 =?us-ascii?Q?PIml5soRWYZXf7/h1Y2FAEVWFACzm7zcv0TnztoVexZb7J3VyFvgyVcI2KEH?=
 =?us-ascii?Q?H473SKf4HeC0CcZEatMTRG9E2CThyfhz3hubfIY+HpW0Iw8XVeXo6+o5iN0Y?=
 =?us-ascii?Q?k7ZnECMEDMulG5vfTZ6ZMfdXRZ3CRLkHT6CVOvxuCbs0nDTD0xzV5OLlr/zG?=
 =?us-ascii?Q?c9xZ9v627nyikRRfsECpOdExVa6WiYmiCIQ5rgfL4/B7mqHF6J5YYfTIqZ6V?=
 =?us-ascii?Q?RnQRgOIubgIN6QuWXEVdzazXkzdF9yEo3RJad4BbZ7CScPlCl9t0ftEu5dpi?=
 =?us-ascii?Q?vfrW4iSEZgbDLKuNrlPHVchpnWCUV+MCrwp14HPtmePQvOJ8uiHJS66o1JIq?=
 =?us-ascii?Q?s4vyQzpwE+DRPV5mJt2Mhya9Bp2rA6f6X+e+ua4uc2jQbPnPKdcUiMhd9jSv?=
 =?us-ascii?Q?YYMYTjd8iFX+Anc2nxjyJM4ASYLcUmaetqR1XrbZQOoWB8pMp7rpTChxqSgI?=
 =?us-ascii?Q?8o0w78+rGNJH6JxgYYv1hqpdzpX8dFOh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fANootka66PpSAstdexlhiikV9BkXJ30xEtDfE4ZhPNB9gESrgKBYeDQ7mhp?=
 =?us-ascii?Q?cZQwxKO2HDLZwuCMS0T+moGDxIIAM1ynvbV5Maxql21AyXd7vKibB0Bj6UA8?=
 =?us-ascii?Q?HltDu2RhFVOUsBTbfJrgQKIut9872yYdZP5w2tT6sG+gT6Klw8fbm4Rd4d4/?=
 =?us-ascii?Q?3QvrIOxZ9hn1ozoaUKB1NB58mnfvLIMTNAiuDAwppZ7us3zFSIXW9Rk5K+W1?=
 =?us-ascii?Q?2arkdo1F5LDMFcrOy2rdXDQ+M5+o8OzuHtcf/R1Fdl5nlGFeJyNFfB2sI7vd?=
 =?us-ascii?Q?XcVZeN34ZiV0dFUpMRgkpAZ5FIliAQOUvJLSXoxaPwr014bAgDpvxaBEf6Xa?=
 =?us-ascii?Q?RAXdjufxNB6d3QUGBu3ZCkbca1bTHQbF8YP5S2OGCb6c2tQzftoh3ZgbSMoU?=
 =?us-ascii?Q?Lwr8rAnCkL9aPw44Cc2fd44GF08Y1z8I5DJ5zZjYGrIR10bkQu47HlCCL4dj?=
 =?us-ascii?Q?yoMcbzQh/yhFc3Pe2K+5yk2/IZPwP6BOjSz8ct4ih6ElTxqjg1nElQypFPyd?=
 =?us-ascii?Q?T2+cSLnK0ib73CxP2zE9Eg/Xs2xNbwg5JqRbP652jq5IfjjDFKFF0kzKfi0u?=
 =?us-ascii?Q?viS9t2pds/XPn8HBSk6+4GcUTtO1Rfo/O0eYE+HeVsh/YG72pu/gSC08q1eW?=
 =?us-ascii?Q?J9ku1IP5P5x83Ud1UhQh7QbK/pGdx+0OBhpvAchsBdw/JHLkuOtYhNipWToI?=
 =?us-ascii?Q?+LuL6aqbZkHLCNejcAtItRTHv2qRsmXNVbeS+7ItGluj7LpytinMKvlOk5JP?=
 =?us-ascii?Q?+PCxyQe5HgCF39T/RVV2NyVjUhUcdpL8u5M+XkaLUPokKqE8+y/kJSlPXE1I?=
 =?us-ascii?Q?yICVZCS8/uJgEAcSadWJ1OJo3t5pnEIJcTRtWqAtTWQTAoFR153wboN4KtbU?=
 =?us-ascii?Q?qRlPS0OGX3xQxotiHcyXuejzV9ecTEA9PFfyslC9utfjegboDFo9FQ6QUrXZ?=
 =?us-ascii?Q?BCvUmPZX6I8K61gzPltYxjQSVw7eJsmKzzYnXMsQ1dUwHloP5B61EQh2c421?=
 =?us-ascii?Q?NS4g33xD5sW9OmGayrQVsOdo5AfjTlKhBRvPAZ10Ghe3lzFE6fmaENrGok4J?=
 =?us-ascii?Q?NZhl8EOV7KxQFGMoZkjH1PUuikWOHzjp8VeQE/0o0knjkHGAaIR3fAZ1d8Mg?=
 =?us-ascii?Q?BIx4ou4Vgz/v5G9xFmoFDc+nFElA5JwsZbsg9qEUsGUIW4MS13HZ0HNxC4B6?=
 =?us-ascii?Q?ZnxJ1M9pddCyRzRgs/wtlnAPE9fgJdknFyLc5ybnwYpfwdK4HnpL0iNlgwYK?=
 =?us-ascii?Q?VRIHv7gQhdpDEy7R8KnOr14czIr70muy/GfQ6+oEt01OFZYBk9yqE1Zqy3y3?=
 =?us-ascii?Q?bre2iZPFEvzLWd5QCQbazIUFkwV0mfXQlUA2p4A96DMuzxbXxqEncPGhKdUr?=
 =?us-ascii?Q?H8s731pClSyNBOLn5jrqHREXsotzKd02WkKSlZg4jVduaKwLqjClCWpJ36Bo?=
 =?us-ascii?Q?rjFF5eWhY4IMdzPEaB79dfvYYr3qcEHqD7mgfAF+IQwTgjzM/4BF3SCZ5mGV?=
 =?us-ascii?Q?/pARSTjFR7u/lFIjtGUTi9UOD7d84koqPBkb5nuVMCV4eBMO7Ghuw6YxtOMj?=
 =?us-ascii?Q?lvpjCpeQkml2F6Y4IoQdq4Q4Y7Ag7whSsVWErjeQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41686239-104d-4311-b459-08dd6d408e56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:03:39.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgf769n7Emx6LnnlPFTR/Dp+xJY5PtEEoWpa0Amgiuw+DskwDxkYxPYjdjSKH0JQa25Kxbt7E2D2+aj9PSThFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7190

On Thu, Mar 27, 2025 at 03:41:12PM +0100, Alexander Stein wrote:
> This adds an overlay for the supported RGB display CDTech DC44.
> DCU graphics chain is configured accordingly.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
>  ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
> index 7b97b718ebc16..53240b04c9688 100644
> --- a/arch/arm/boot/dts/nxp/ls/Makefile
> +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> @@ -9,7 +9,9 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>
>  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
>  ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
> +ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtbo
>  ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtbo
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
> +dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
> new file mode 100644
> index 0000000000000..146d45601f693
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&backlight_dcu {
> +	status = "okay";
> +};
> +
> +&dcu {
> +	status = "okay";
> +
> +	port {
> +		dcu_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> +
> +&display {
> +	compatible = "cdtech,s070swv29hg-dc44";
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	polytouch: touchscreen@38 {
> +		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
> +		reg = <0x38>;
> +		interrupt-parent = <&pca9554_0>;
> +		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +		/* LCD_PWR_EN -> TSC_WAKE */
> +		wake-gpios = <&pca9554_1 4 GPIO_ACTIVE_HIGH>;
> +		iovcc-supply = <&reg_3p3v>;
> +		vcc-supply = <&reg_3p3v>;
> +		gain = <20>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +	};
> +};
> +
> +&panel_in {
> +	remote-endpoint = <&dcu_out>;
> +};
> --
> 2.43.0
>
