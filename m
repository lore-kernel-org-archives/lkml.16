Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD1C1EB1B7;
	Fri,  7 Feb 2025 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941787; cv=fail; b=qY6mTzl//+dOm96lAdgpISOIWO12/ID98cFHDr5T0ttSaUNxAmsicNnp6fY+AzVuzExlK9Iv1dU8VL4Hp7fimS2FbAhsG/CK158L7uZwg6clggBlzOlELvyee8Upe9C0ppW7S8ZBjJjWLfgffH3b9l8PZzkn5rGZhPTG+NVkerc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941787; c=relaxed/simple;
	bh=TB2lKUH7f06iwkIG63kTCiC2+Rg7fJfCh0C3FHYH8fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nqS21W159fIdi47Mj512sC0L/czOYLge7yozvZtT58oIzSl6H8br22gkQIya8sJg9MdY81EeMWfWgqHblFqpHaTgm4M6s+I0Q7Zu508nEuZNagcYUU8GCiiI4DhGXYv467vm2C2LKjXE2QaxbOklYQ42v2uhEqfH3LpLFHZNWms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VnOKF7h1; arc=fail smtp.client-ip=40.107.20.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VnOKF7h1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCOwadqF/Q2Ziuw1vNnPX5MRwsK6LnaA9AyDk0PnXs1pSUpzE9wGDX4YxgHZlX0cG5kvmgrMo4QhDzl6xI/RyxSu+WEuvLEkzBDUAx/NqgzekaX1RNa2Nc8ZRAHQy15R6IOy5bOV5hPgdO3P//X7q/ReDr9BbbhTKAQMbHLfcAHhxefq8yhyjKqHgX16KTx9ClwBgcSt1k/tj1vJffpqA06giQMZ1SlUkrl7kjlAHkW6V4Spagy9ubS66oN8ELwkBW2TAQgKIqDo3lihuheE4g8eiaKhQdxeV9Kdnz3vmfq7YLhJH56VanetBWmfT4GF4iaM6+bNjTvFy+UxPKy1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FpefEuBx+BDK/chL0srnHQxUg6nbHFdUve3YdIzJuI=;
 b=M1CYFCGfRme16D+ESOARoNSPlF3+qX+ui7oEa9hdQhBtuWXuy3LoZ2q4vAYbJpoLGqiy3n91ixtgQ5mewyavBuAy9mZhZlxMsToyphQALOXIDonj9cSMjf3/e/FK5pGhah/Yh321+OOwEYRkGORbizUpx0eBnPCh43MPyuMXcCWgS+TVVUKl8/juqkvI56eMEt+WpR1NbWwK07g7bcFmSKsdp/rTKaSWh4GHIyinOIJw7xV3zT7JEYoBDis/ExkTxjg0gpxt7aHt1r/vKtWbQwjeUChhc9egcDXY8YfcVZB0QYsKgGi1Qm6NjEeT+dL5xsJVfRRlQQaApi+0+ZtQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FpefEuBx+BDK/chL0srnHQxUg6nbHFdUve3YdIzJuI=;
 b=VnOKF7h1LVuNXOx3SWRh+Q596gmnGnSpGHm/WLzN6l0uhUxmcltcD9wSmI5xs3DMZKKSjNLIJqyPGXWeURJYY8E3d8x8ukbRE0LC4HuHw8YSM8lgwDywYgqwk3zJFpiQA1Frp1MzzrB1U6p9Cl6PuLbO4HjM1zrHB848EKCiWZ9o7oZE/NARBWlg3jGonc2GYOLo6NztNb549/Jqd2GFRIWq4XVhnsRwD1jAQp9UavsQh1tY3pQndxSC2yiLz1aA+CZc6DTjmNy1x7rv4N7seVCbNv0wEVHfM+bfR4rrky2r2d+2gOhGOi6F/REZDxpUXhd8UI3ZaNMhoTsQyunBcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 15:23:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 15:23:02 +0000
Date: Fri, 7 Feb 2025 10:22:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] nvmem: imx-ocotp: Support accessing controller
 for i.MX8M
Message-ID: <Z6YlTA6M40u6Bj3e@lizhi-Precision-Tower-5810>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <20250207083616.1442887-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083616.1442887-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e2db38-28e6-40e6-4ce7-08dd478b4f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JaTUOQU6YyJSdJHORAC2vRceYjKduPCnER8nJjDBFOAeM7lXG5yxkXKE13Pc?=
 =?us-ascii?Q?2EykiQAstzrP4+PxApdMSrdlCWhtXNp5JK56liQjEnBFPDs2Olrhe/wTpZTH?=
 =?us-ascii?Q?nvi/VDosDT3Tb0TT00dL2pai1VSpFYjyvRNheFUO9iKvU0ghXo5RZsR62T3G?=
 =?us-ascii?Q?+m5jGVWVjMXLe6s7I3DGhSme2eF5vuawPJzvWm2y6+TdpWtq/bWWYjoGWNpK?=
 =?us-ascii?Q?bqfgph8vfRGUd85V1sPDllP3t2rFfbP7uOHAlsycn/iTO6Z9wszShhl5NtrU?=
 =?us-ascii?Q?AR6KfvLsYCYVgT4RZfticdr3fziSM/U0IHmsyDOnoYPwoRjl+7y7YUCwfZh2?=
 =?us-ascii?Q?jd67sEbOIXC0LusNa6x2HploDahjQfpDHXmaiT/3ARpQVr7Ncaa0oWHCuzM3?=
 =?us-ascii?Q?6+2IcGJvMws2SobfWHgBtCcjRJo3xNnbuK6bRrTTPl/YePn/0F4gbrfkufmI?=
 =?us-ascii?Q?BMnJ8QtlMI7Ub40m00NqKYEYRgyCY9/e+O7qaHZttuLt/oXTSFmpXcUPIL5r?=
 =?us-ascii?Q?LCep646Am2DvLsLSlzQR1VNchEpgnWJalDeEdPgI7gUF1lyy3VN4VAXfOioy?=
 =?us-ascii?Q?XRkwIFFm4UZcKmvH8UmgNKsaG2tfkbY5hVKpYZByWsBOvQtIYynQafPF88H7?=
 =?us-ascii?Q?EFBap7vJDBKv0z1DyBmAhBcNpiWN+G7kNAIJYZHKu8w16Po0Ak45KRO5FB49?=
 =?us-ascii?Q?dDK1atmtaDiCvVXS8FuOxEpEWdDukfMuKzUNIDHBNgJdvr0CISbkymVVzCfI?=
 =?us-ascii?Q?HN62pjO3BSTksRjZfL80UYbgxrJuikOSDmDwOqKT21jlt7rYorKS8IXI99OA?=
 =?us-ascii?Q?4HQDVmJxkstVyptqn5+s+e38aNdikaLLKDFycInfy7T1N50Ur/iHiiqWuMbH?=
 =?us-ascii?Q?vKXYW0rFezN/LTS21dADWfZoesl1kKHINSnHu/ptN2hCms+yuPo1Ocy79JVo?=
 =?us-ascii?Q?wSsVWGD0Xyv0qpJMGoCq1HjcVrcJem3fOdvIJloJjV4N+NXaJhvN2v2iRTg9?=
 =?us-ascii?Q?JfRfRigktPHnjPGot+spKa09peFyVo1tANGbo5cCtdTJ4wGNIK+i4yfp50oE?=
 =?us-ascii?Q?EZ+LSk843nw6JF2AXDzItB9egnAr9Hs4319Qa/AKp0GcPepvyDywVNw/dGbs?=
 =?us-ascii?Q?TY/+0zhV2W8ToOjg2k52Zv+BCZ+/sB0qxqJO+QG5gQRIgRhbUAlYW3mmR6zX?=
 =?us-ascii?Q?Gs9V/Zl7fQfYiLb7ljHoI29Z3ku353AsUxUC6b3qyUxcLkjYJWeMyi9tiAjT?=
 =?us-ascii?Q?5wpvBZUTYU5uDXxvEcaHDZG7/WQa/WEpXfBmR1ysBvJ5YKDzx7jyUykA5Fcb?=
 =?us-ascii?Q?JYDqLWNy/Lr8gc7b3v/1V76VVIzPAn7ZjjJjv7DAGaNVBb+dSvqd/lhm2NQP?=
 =?us-ascii?Q?iqxSvU69GQIvlcFYKY2pJHy2jdx5AdEIfnliOxE7g/5DP/M67CFQYyPfdUGv?=
 =?us-ascii?Q?TW9fGPi7Ok7x6DL8TfzqKiGDuCUCq+Vx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QKeaKBjE36LkH/kI5J+KcMSVCh6kicV2CnFHIMxErResD+7GTdzf6VCyyzjg?=
 =?us-ascii?Q?JNugFu8aHhlBKFo3isLRHqSJEa5dG2khQ1ldGWdUuplyvy08UwA0gim046VQ?=
 =?us-ascii?Q?Qik28Bao5MxyjZ0tccYIJHlMDQ0giNEG/xYosuFcRCpYeakuv5y7pveQc4mH?=
 =?us-ascii?Q?LPELrkNMWvFvVfNuX/E8NqkIGx/ynq+Q+egNaTg49CuC00fHg99u4ZL5EctO?=
 =?us-ascii?Q?QozHkAmtyexOTxV206+zcB2lpEH8zCuSHr5x5jPAWiGA8zy/fCyVygirzqlX?=
 =?us-ascii?Q?HqPH2MMw/cmb1EaLmnB6y6UJ+rEa1CaEvKPl3yYQVT7NEJYzTqBKabgnG5JC?=
 =?us-ascii?Q?2Z2OpiGzn8gXsKQFaoV4lYuyuxWF21dUn8rcVOBWH+tC5eRe0Tk5+uQOz8Xx?=
 =?us-ascii?Q?xSkOjB4cauOiaE0QOE70eTKpL9TjCC97kyDgP99csHNdn5tYxBwqwULZlVsq?=
 =?us-ascii?Q?690j9HikAunrPfhm5q/Rfw+oBtGXSvk6F05bQAHlcOSOwItnHVLcXjoDdVWG?=
 =?us-ascii?Q?2+XDyxJ9O7hOIPUKlTlxhBz1NaOURW/6lt57C6L8VW4gVLw6Su8yQ/973H20?=
 =?us-ascii?Q?66YLV4uY7G6iIZAfm1Msl81wCgOpW0ktlDLef5aaG8GogI73Ro53lcCQ1j4H?=
 =?us-ascii?Q?Z9SAB2CpbEAyOBImVVYm0X/99B+0flFsQeFQtVEcRBzwvzS3fM0NyHojbzhI?=
 =?us-ascii?Q?RZL17LnLgWN2Xb1f1MY7Ajp4SNacdU/pL3IASFMOXPsg42gFbejdudoukqX1?=
 =?us-ascii?Q?r+vW1gNIe33CdIGtKqji/Y7efxU5xoLB7G1f8lLOQ+1zagrawTKVITChfulZ?=
 =?us-ascii?Q?/tnGYMMDMZHlTSmu30+9MsVvuUTmBWflAv5lK5Lsy729Z8skRbk3IrYsXbuI?=
 =?us-ascii?Q?fCjSw7COTBCnqy1/AfPFvr/Bts5pp/unj0HqMIcvxN24EAP9aJjnTRpR7Uhq?=
 =?us-ascii?Q?q6OC+NzaPOLGSo/UD9CNszeSU8Hkl4zwx4AuSuD0qcUk6q0IbVc1COhodULj?=
 =?us-ascii?Q?+PnXq9fgx7jDMosqr/zaOzxw2S1rMMR8u6PwBssbtaXeJuVBSlan/k2Yk2LB?=
 =?us-ascii?Q?wFMtxaO9Fom0v8LLgtr8ciYBISj9Uu5bsEeMm0WEsZBeJLJF/xoIRmylOMVZ?=
 =?us-ascii?Q?XSyRPK+RC3mp9ZClnaBcY/SUwqQZZZuCROVDjF8iZwm9Un/PW4m9UsBkg1lC?=
 =?us-ascii?Q?45cFzOq/NmmhS8HDRcNkJDDKcOKXt4KD/ouHO+MjriNTaq7Z8ZWtwrIU96NF?=
 =?us-ascii?Q?qQN61jO9tc5gEyltlNya3dmjQHiOBpns691hZ+R7AXYQPM0oN2RWNCzNtK6O?=
 =?us-ascii?Q?K0EhwwJ12g0chCdgORkDhT2hbdJaTwSnLPckoavxvcz6y/EnZ839AI3ItAqn?=
 =?us-ascii?Q?LRQOvXM6blFMtAFf9IWB2P2syyglV+XWJEWzK22MDaoFyG/ln/XxTrbg1uzK?=
 =?us-ascii?Q?y9YKqxkMyOg1/nXaovJVQOP2xzYCBNrC0yH1dRkXrhpavl4l6oLY98NLj2At?=
 =?us-ascii?Q?NWId+N4RJhtZF7yKfpzHMla38ZlGyviQT9/NE8NU7iUjTC7lrcMbmjj8RtV1?=
 =?us-ascii?Q?5l012IDcZlcyB62ZUcXPUm4t/mG1oKyC/ViLfib3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e2db38-28e6-40e6-4ce7-08dd478b4f9b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:23:02.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXH478tSDaC0r7HPsPSKCN/iLrb0RvKSKCvm6C9pRdqPO/qUOR6bLthpPV4kFg8xisFQRsfIYFSBlRH1JYxdzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

On Fri, Feb 07, 2025 at 09:36:07AM +0100, Alexander Stein wrote:
> i.MX8M OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>  - Introduce disable_fuse for a list of possible fused peripherals.
>  - Iterate all nodes to check accessing permission. If not
>    allowed to be accessed, detach the node
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/nvmem/Kconfig     |  3 ++
>  drivers/nvmem/imx-ocotp.c | 74 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b93..ba5c928cab520 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -84,6 +84,9 @@ config NVMEM_IMX_OCOTP
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem-imx-ocotp.
>
> +	  If built as modules, any other driver relying on this working
> +	  as access controller also needs to be a module as well.
> +
>  config NVMEM_IMX_OCOTP_ELE
>  	tristate "i.MX On-Chip OTP Controller support"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index c5086a16450ac..b15cbdae66a7c 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -589,6 +589,74 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
>  	cell->read_post_process = imx_ocotp_cell_pp;
>  }
>
> +static int imx_ocotp_check_access(struct ocotp_priv *priv, u32 addr, u32 bit)
> +{
> +	u32 mask, ret, val;
> +
> +	mask = BIT(bit);
> +
> +	ret = imx_ocotp_read(priv, addr, &val, sizeof(val));
> +	if (ret)
> +		return ret;
> +
> +	/* true means disabled */
> +	if (val & mask)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
> +static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct device_node *parent)
> +{
> +	struct device *dev = priv->dev;
> +
> +	for_each_available_child_of_node_scoped(parent, child) {
> +		struct of_phandle_args args;
> +		u32 idx = 0;
> +		u32 addr;
> +		u32 bit;
> +
> +		while (!of_parse_phandle_with_args(child, "access-controllers",
> +						   "#access-controller-cells",
> +						   idx++, &args)) {
> +			of_node_put(args.np);
> +			if (args.np != dev->of_node)
> +				continue;
> +
> +			/* Only support one cell */

nit: two cell?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +			if (args.args_count != 2) {
> +				dev_err(dev, "wrong args count\n");
> +				continue;
> +			}
> +
> +			addr = args.args[0];
> +			bit = args.args[1];
> +
> +			dev_dbg(dev, "Checking node: %pOF disable fuse addr: %u, bit %u\n", child, addr, bit);
> +
> +			if (imx_ocotp_check_access(priv, addr, bit)) {
> +				of_detach_node(child);
> +				dev_info(dev, "%pOF: disabled by fuse, device driver will not be probed\n",
> +					 child);
> +			}
> +		}
> +
> +		imx_ocotp_grant_access(priv, child);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_ocotp_access_control(struct ocotp_priv *priv)
> +{
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +
> +	if (WARN_ON(!root))
> +		return -EINVAL;
> +
> +	return imx_ocotp_grant_access(priv, root);
> +}
> +
>  static int imx_ocotp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -622,9 +690,13 @@ static int imx_ocotp_probe(struct platform_device *pdev)
>  	imx_ocotp_clr_err_if_set(priv);
>  	clk_disable_unprepare(priv->clk);
>
> +	platform_set_drvdata(pdev, priv);
> +
>  	nvmem = devm_nvmem_register(dev, &imx_ocotp_nvmem_config);
> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
>
> -	return PTR_ERR_OR_ZERO(nvmem);
> +	return imx_ocotp_access_control(priv);
>  }
>
>  static struct platform_driver imx_ocotp_driver = {
> --
> 2.34.1
>
