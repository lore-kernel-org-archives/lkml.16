Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2082.outbound.protection.outlook.com [40.107.249.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D71957FF;
	Thu, 10 Apr 2025 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296796; cv=fail; b=NuTZfbv2alhYmJOSsNZifzlotgCUMBrfJ+/X/LAHyUhMDdGDHkcDJ7g7Mc63QMZy2H9VyjEecrmYIaoblneL5tYjoWCMM/gngdLM1JCFFwFgOpvoMBIceyE2UAu5cYliQjLgPkhreb4V87Qwi+noxnCul3p6me7zG8fsEILRggs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296796; c=relaxed/simple;
	bh=ELaY1cDxuWQ4c+0+D9TUKkenDuE4EFdJ6IzrofxQVrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bHS8Izb1PJbT9LHzgBZnThfrjqYxt2xRbSKrrC9xT0cVfQjniUdiqMxwGHrEmPt6OEPJTuPv7p+mq9ZvSFtEc+iVpB6HT5/egUcmVC5IO/+vFyC0w07ZokvCMwq3F/qJcto14NGV6PKfLWPXMinkB9dmzVtZkXu8GbjjDW5saWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y5rRhiFs; arc=fail smtp.client-ip=40.107.249.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y5rRhiFs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=susyolEl56nBeRdV3d6B5SWhBtJwKDxrK7KZraJYhSQ6btdGeYSw89xCqjlG8FRpDXvm3azw7B9ltEXD+yM//gMuikv4YKkCLqsihXiclA22Tf78qZll7WELLMKsjKQYB9oJjchRFA3h3T+jAGcPKbVeuHJm0onvggt44f257wYLQxBMmZxjOahzSSIOLoi/9wd+mM9OktY92TigAm7DtGSRREqMLfVb/6gU129Vikf3q7IIhEKggrWpZqv14e1lrPRsViWOvaNzorCOpOMKOEr8JH2Oh14kVwoIShpeMnSx+31QicBCN+Ac0lP5pGqEN2R8ZacGNXN2xMBFVjhFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkMNPAPFXfqs32m9mHLguQNT79ULu90de+nXEpc4+mA=;
 b=NuyMRnYg4RDmujd1sluZ5oQbqAFMSa6Zis8c3yH7+bVmYM/Qe87UCw/hFlC5L2MQX57FWvAEZcqVoQP0antVwAlJFs2aRzdr9jtyPJmLR9SNRyLrRYyJ0LeTRbDpJGkSP8YPxwjcggJa7ANnaXpJnx2k6Ytw9FtVf1IBLjslzEzMsiRQcwz0lb42uuh+3P3ttcmSj0jkxIq5iSTCtvVAnFY/HyDLvxouY4xx4YiHYnKiZ0M///sYiC18Fh9gi4hkA5KprpN37c7m7G+BDcVQacjtaptl7XfgEvQoASkPqtpxSDomkhK5mDLD2BPoeSkjzYtqQo7TRJvyCdM8bzoa6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkMNPAPFXfqs32m9mHLguQNT79ULu90de+nXEpc4+mA=;
 b=Y5rRhiFsSC0Hb+V+Mf1JE1VSfFvVUQCXHDOVDVPMWl6B4gw/svVpqljIV0EJMtmf3rh8ok9r+pP2EyqOlBwcAgcSxUKlvJAzm5xfIFpf3uD/Fy3fW19eEnYwUCy9RSkrLezQpMGtMx6wvH2gs4ksCITUSVopr/ltiuMGFbYZvMMhwpRJPuX7PpcsLfJ6ZycOl3RWnlw6nsBFopusLefxvDfnHAmvWk9X2RS9Ca0JKEYhEpHEvDZF5DZWGy4uIolZ7rjH3a0hoasGOYtkfIeFEf7VBW1kJcX+PyT/lOqZ983HfBG1QqBNFE5V3TALLNlofciZpUDgeBbj5U6wAbZdBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6804.eurprd04.prod.outlook.com (2603:10a6:208:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.39; Thu, 10 Apr
 2025 14:53:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:53:11 +0000
Date: Thu, 10 Apr 2025 10:53:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 01/13] arm64: dts: freescale: imx93-phycore-som: Add PMIC
 support
Message-ID: <Z/fbUAc94+lzOW/0@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-2-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-2-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8PR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 232cf37e-b852-4545-f3c9-08dd783f69ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3O9HGik/D8RYBswdrQNCvB/Ymy9kGJ6hyFAGKDip6whEDjuFZMTh7XZPkSo?=
 =?us-ascii?Q?49TiqmqkoEl1Glmyc0JdRDDZSKrwo3ZhdBNc24iPoCVGk6lddFuknB1BkZNP?=
 =?us-ascii?Q?d7vAVVsJ3CNq68bVuDnuzkcZRaS3fIDQ+bvm5NxmXsTuAGW6cQIK1KJH/0n0?=
 =?us-ascii?Q?P4o0RxxcMsJ9/p2bc+4BrD4u6Vvzst/liokEIxKL06i8GjIc5HSpvi0uUzH9?=
 =?us-ascii?Q?c16U/aPRyQ7AIAAAAvZzx0NGSkTlWjFBBKobnmMg0B+SJod8d6/nL4c0wVNp?=
 =?us-ascii?Q?YwX+W0q12020blsoBbMFaXzthCJz5jg7Cd8TaEExHiXw3cKfTCB8Sfkez/sj?=
 =?us-ascii?Q?nqkXtUHLyPbwehOiPgNNcbBTXWqMBxgpXmfR/aiRIyvaWxenypnAmDUczYqx?=
 =?us-ascii?Q?7KVW8s9ivv+OqCg81VFmVyy8WBbPIWe/rB7OElpfKwJ2TN2yDNhi0ivJMVvH?=
 =?us-ascii?Q?Gnz4ahWarGAxzvMzSdPxLtqif17JZmdSMPSGzteJNh989oYAompsYswI4Fqm?=
 =?us-ascii?Q?3848t4SNLMVnAwDpPICRFOg2EEEpfDi+NYAcXx/Jhl2yhHhSNtPqq7kwGiys?=
 =?us-ascii?Q?JJqVJePwGwqF661H5e71d3q/eFN2brQ9OO0tN+Z1YK3L7x3G/4tbuNfQOwCE?=
 =?us-ascii?Q?gETFkzSKeDHg4BDYvIFfV8e3QSH/0eWaWAuFk5RLqaInlq1y5T5bmSMusbgo?=
 =?us-ascii?Q?UxT0dFZZDVWHkuLeSLbUW/EuzqQ7rD0hYT/P74C8Gg7H2emzdG71QiRlyTZP?=
 =?us-ascii?Q?IBdY4g/v8sM34zdmw/MXxBzR3i60YXpyj+pzqWvxc4j5txKm0cIuG5esjLCF?=
 =?us-ascii?Q?wVT6/aeYG5Sf9JywJaftrcMeGHaKyrGnBRugnBRqqvWBngCWHkXmlt5V2+uc?=
 =?us-ascii?Q?2BNlJ1DD0OJRl/zIO0zdMzfBUS8GVpIoU/ROLBMrR+rDrQeT/AKOICb/jsfL?=
 =?us-ascii?Q?YYRaN+i/CZ9VAMiwSXaAze1Itm2d0/Mol5efZTeORRafcB24TpYK9bc40tUs?=
 =?us-ascii?Q?dqX7RXGSPFlMUWqaOPEwtYALWl+6OU+byNWQlII6w33hv3t/T5nTy7h4IIeL?=
 =?us-ascii?Q?//VXxUtJPRKOG8m9hxKTtyztuau9EhgQCm1PT3KLG57gF8+Dw4sXcx66/nv7?=
 =?us-ascii?Q?8yMIhv7ziUnrCDbuPETHBQMyngxNN9UaYhZq2PoB9wCw50CXub7T8rNcRslN?=
 =?us-ascii?Q?1TnMdJDS+/URMigygUIWc00+EAI5ZXwGwXeBhRF9cqpBTfs1YO2oTUrXXWPX?=
 =?us-ascii?Q?PKY4wmw6N7O69mhbr5wY+vHERybruoT51FXyRkCDePEF27myGj2tCPuoPvoy?=
 =?us-ascii?Q?sfr3WiKLHR3RwX3LgFTP0mQUQxlGhkMNL+sR+c469P/WnO8T1xb0pYDlBCrM?=
 =?us-ascii?Q?8kIraxRc3mNu+BrakXXJJv/eQj2Itr1kKbAKOphwhNwLEmvn6AqojhmCjk7u?=
 =?us-ascii?Q?WRjQX2wkyozIyRRJaEVogDLXSE0EY2Ye?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lr8337vGPx/kLXw09nuFU0zIn+M/QAjasEVPiueiyt0nm3fiVOZedla/pqb3?=
 =?us-ascii?Q?UJKcB7AcWfgt6YrA3nIUI3lBGfpAcRbPF1y8LMu77AdZrQeHW7JjlnjWLGRe?=
 =?us-ascii?Q?S8MM50v+nMH1b5ZaZk7J5nsB0V66EcqXmrkMRJsCNneyrwP+xP8ToGuFug2P?=
 =?us-ascii?Q?rOrYiecXoE/kbWHOdtIJ2u6rlXGCLIkekYDq4zgJH/EnLR34TFBhJf4nK3ia?=
 =?us-ascii?Q?Xc3e5H+NFDUpVCeYbdo3Wxw+D366CF4nDejgkitv2kGotPDzMuRl4uQbFFBD?=
 =?us-ascii?Q?Fk68OdjkBjTXUEER8tK258NXeETKkpWi83FwwcSHyYTD7bcHqNTAP8zmCbkJ?=
 =?us-ascii?Q?5L3yw3cyomsEm0ue4fED9EzrXPY9cVNby06kGF5KDJzFtfhAcry/ZU+J/by1?=
 =?us-ascii?Q?0Xlamw3El+ivj2GyiKEP3e1QDGdYheswarbZu2liZaxl/RUaK9ze/AogyIdV?=
 =?us-ascii?Q?uNdOqjvfLXLV4IF7Xtmdu7AbIdw5ma8hgVovOlRg0uMxY8WJ0gp62bRhYkrr?=
 =?us-ascii?Q?zWdwl/DNLuebZPEcMHuYzmApMVFhfgI+IJ9rgTy/3uODcsgGjWPqNFH2Xhni?=
 =?us-ascii?Q?TFWy5BxxpraS8EjRIjlqV0Q1dwfsF7SGONLO1VVnCB8qt0ok7+CUqnT0IEoK?=
 =?us-ascii?Q?eFzBeY5WM1R9qtb2ovSZLhe9DKnZVWDILFrCl/mraJZrRby9dqunHaRQzE4P?=
 =?us-ascii?Q?7dI66PDJsCPauXdoyC05dKoJzPvYLlfQJ4TmtAwJ2H8x5DRmP5tGeeXVNQcm?=
 =?us-ascii?Q?FkodYfiZclSxuQ8UltFiBNogjkiEHkRvS9qmx8zOiB77c1nOvunRAj4sWAbi?=
 =?us-ascii?Q?WOEu/QXhlm5fpIhVuJkmUT1+BUqexsTr6dlY6zd3XSl22lbkAGbvnhV+CYP8?=
 =?us-ascii?Q?GbdlYqHllGh1SpZsC68rNNC1puyOlhkAhY4xILjJ09M5YoDEuHmtDLnKjWG/?=
 =?us-ascii?Q?1AsAy8vzye6ZUuk3xVTimBOecnU2owwro6NQKJIbC/jgHBvn70pQ5fvU+p8p?=
 =?us-ascii?Q?1vCAaDdtHghMdcb7E3X3D73cRJsroT0pkQFaHQL3K8k6q1ycKannoCDNkGRq?=
 =?us-ascii?Q?ka6kK7E5q2bMVUERN4NAU4Ts1fwu3gJvuLMnobk9IQyqpwBLx7vO9P+Q5v5V?=
 =?us-ascii?Q?pdE7nLqSi4vjA9HiSnxv830OMKN3Ut5w+Ax4kdBMxzuxf2D5vmQfZ5DXHpWU?=
 =?us-ascii?Q?WRRk94KzKTjTvRffmG+uuSWJl6VLLCILIiVHPYjPSBDSqgHqLcKK/95pzUvQ?=
 =?us-ascii?Q?3evMwxwgLLZh78LPGUpiLk0SRNHyQAzjts1m0zo/5qS9m9qOvy26PkXQrU2j?=
 =?us-ascii?Q?LChxL+juYPVcXjdZHEZOqvAW/PuEboIKSM1yPxTSm1B8x0QftdCRIUVSxTmN?=
 =?us-ascii?Q?/SowhknOQ2lhVx0brkhT/jPRojeR7Tfd03/RhYEMC9+sPk31KMDnS1hOdG2a?=
 =?us-ascii?Q?r3bKZ4fOLnrUAQbTGmbPUMag4XlmNIPSkgf+l4NQ/jlfTRO234Ygu/PzahC0?=
 =?us-ascii?Q?wFRWrp8/rMffpyjU2EoDrHujpcjCAaywWOuHNEerlUu548nzu21hynR9o+RA?=
 =?us-ascii?Q?jJfvf4ekJa+HM/nuGoGprZ++oeEg3A9/GrJjwqsY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232cf37e-b852-4545-f3c9-08dd783f69ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:53:11.1992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVkc4WcTwJ3LKbsfvVNpczwPU4Fe0KlcYyQQm7PoqfWXREJT7oQQND4+O7isKAtAMSlaIoukB6mHsDzO5D+qaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6804

On Thu, Apr 10, 2025 at 11:02:39AM +0200, Primoz Fiser wrote:
> PMIC driver for PCA9451A used on phyCORE-i.MX93 SOM is available since
> commit 5edeb7d31262 ("regulator: pca9450: add pca9451a support"). Add
> support for it in the SOM device-tree.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../boot/dts/freescale/imx93-phycore-som.dtsi | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 88c2657b50e6..507a71f9294b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -72,6 +72,90 @@ ethphy1: ethernet-phy@1 {
>  	};
>  };
>
> +/* I2C3 */
> +&lpi2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	status = "okay";
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9451a";
> +		reg = <0x25>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +		regulators {
> +			buck1: BUCK1 {
> +				regulator-name = "VDD_SOC";
> +				regulator-min-microvolt = <610000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-name = "VDDQ_0V6";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <600000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck4: BUCK4 {
> +				regulator-name = "VDD_3V3_BUCK";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck5: BUCK5 {
> +				regulator-name = "VDD_1V8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck6: BUCK6 {
> +				regulator-name = "VDD_1V1";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-name = "PMIC_SNVS_1V8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo4: LDO4 {
> +				regulator-name = "VDD_0V8";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo5: LDO5 {
> +				regulator-name = "NVCC_SD2";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
>  /* eMMC */
>  &usdhc1 {
>  	pinctrl-names = "default";
> @@ -108,6 +192,19 @@ MX93_PAD_I2C1_SDA__GPIO1_IO01		0x31e
>  		>;
>  	};
>
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO28__LPI2C3_SDA		0x40000b9e
> +			MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
> +		>;
> +	};
> +
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
>  			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
> --
> 2.34.1
>
