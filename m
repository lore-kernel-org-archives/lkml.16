Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459AC1D6DAA;
	Thu, 10 Apr 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300716; cv=fail; b=D/gnhcqo0gI91rNJgwO8dKK8V6Wq3BDQGmTrrjPADE2rsRgAr0HRqzWkT+hjWNjUnNY8q6EzWKtYuabeIMQPEcFkWU9Cn8DCaHJwpAiEmXOlRFtjLQkII8xLUr8eWN9Mz0nip3fjkQuoqGKMmvmjxIgG4wb+sPQU1lEWGEt11jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300716; c=relaxed/simple;
	bh=e8ugmJXo5powi1PQ+p3nAV8DYhPQhV2PBM9DsJFqmM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ME1CEvJhvL/jXz/v82ME+56Itp5DTGePoE9vHukzXHlBgGfks35AyRidhkXY2aGyghqCMxyP2WAcuyzhBJoum0FLndh2gezbIW7hOKIl2gJ4ZhmusHPGjMFgA5rrnVl5gr2Br7AdwBne3Q5AOyV7oGw+ryFprWjJ05QWGXGhMrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JjIOFevF; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JjIOFevF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjQMceanA/y/rq/xKaVy//t5yvpB2J3fUYkunqbGd23p7WNQbBuWCIwJkWJ4wFXXpSSig0IVutXiqDpexW99YuDgl2GARtYICJdqdjDtBkbPK8G8AP3dNXpO17q62Usky8cozzYN5FUF2D089VRQqBr8aQ+DvKwnYfmCowlAgyXo/0Fl3Z/ahapNNOiKLTOJ36qHiMyy+kamK8vbsCfdRzVy0UlZmqCNm/4ZYOIF3IyQkfaEKasqzxJn3fUc+vdOqM6q2n6ZRTTR1+HlDhyHSxv1bLgbhP23/b00xdP26DouEUby9QUs2JH31z0Hdnd3uF+Do7aY75DW921AlvPOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRTF6s7WX7mtesD+UfKCPovYT+btF6wqG+7jccmsvKI=;
 b=Sf1rwCJxMVtqBVpwokC2fygBgwadRXIuK/swrFo9AG7lYNmKdw3IhRBek0OTvnxyvmCjN69HQcWCWmNWBNeKsrehTYzSlXnJZtEJ0AWSZGBP2IQ6fzBjpnRWuYUzhvO1ZX6+uQa1hbZhiEMnt1aWGiDi06gylsK40+bIZGs3Pz2k3O0RlRRaRSg9h8uHNL4v/y7UfhY6j0XcTtudQLNvGnl91He9cSp6m2Hg7fnGDd9jBEhOc7YG6uRMo4AK0OgUJekDNCIf1WL1U2yvQHLPMOVq4l2VAALA6x/lbbSGcK+hZAhZMD9nVkNi1W7DBPaCafqshONS//cgDrml0svQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRTF6s7WX7mtesD+UfKCPovYT+btF6wqG+7jccmsvKI=;
 b=JjIOFevFwPDmz+YAt89AtZDJb8Jh7G2PwF3WTvFn4umwl8yOF1aEUVqxhOcwHKFanBIMDCoIaD05RrCVtABGI+lWd/ewsey3/W8D1dqt+Bdtj8VGqyqI1++cBwtjqKlD59109d6QztfNz5ZzWBQxRZ7LfCrXduXCksX+uV3GJfpYBxche62AGgGh10eA0Sf+sw2byDg86uY7qBeilXBbkjMA80mjmn19H796M440fPjCd06mIYb/1ryI6YkTHYBGNx+0OITg5pPUxR9xznQAON/3/ZlCxJ5vfnsy7lzreGxJyFu6gsYGvVSkjchiUjzJM3DBd5xn1hi1RaEVShlX/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7333.eurprd04.prod.outlook.com (2603:10a6:10:1b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Thu, 10 Apr
 2025 15:58:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:58:31 +0000
Date: Thu, 10 Apr 2025 11:58:23 -0400
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
Subject: Re: [PATCH 1/9] arm64: dts: imx8mm-beacon: Fix RTC capacitive load
Message-ID: <Z/fqn+847WMMfKf2@lizhi-Precision-Tower-5810>
References: <20250410005912.118732-1-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: a99aa3a1-c2db-4b5b-9790-08dd78488a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fmXxoRc8YQN0vCG6aZ33UpMjqvXaDJxKQzTVLcALr7LO7dYX5iMaG9DzapYc?=
 =?us-ascii?Q?US5bynFwqpQV5lMjh22vNHEYVcDz4ck2395yBKuCGw2+pqW72RxSbe/QGP/z?=
 =?us-ascii?Q?rwVCVkDjzSVzugolma7FT4wCtLzAJKVcFZs6BYQn7GmNBHdWN84Wx4vwfNUE?=
 =?us-ascii?Q?6K+B43ssmz3JRo1J4nMliPVY0V7t5rwI3duEnTM/w6qLT7VUm5T/09fyQTIV?=
 =?us-ascii?Q?Unq9vwiAmlmBR2YC0HC/D4Mp3YmtmidRrcjq5kXVbYekBONN0E8s90tPcdzH?=
 =?us-ascii?Q?iiu/mev/u/EiUmoF32adZhr7oei/knx18wCZIMzqEnjr+gAES7CVYbJ8JsxI?=
 =?us-ascii?Q?bHEWmQfqo0XR6UqJc982PqNXeRKfmnNB3icRjjWMdn93+bv4zv/TZfYh3Q9m?=
 =?us-ascii?Q?NfyLzS+UwdkHpHI9IxuCAFJWbi7SnVpg/EvnvgCj10BAY+V39jB6jfAI4u0m?=
 =?us-ascii?Q?VcDYm0hoxUMyPGiqU94zMFzW6yIH4bY5CEt9fHUefVpLo9VcbN0rzplCATcD?=
 =?us-ascii?Q?bdy94RRQxikmmN2PmeOLjfGqne83OTVNO2A4FyXSypYCNeLc3aBUTdONGbsP?=
 =?us-ascii?Q?vGjnD50oJIvUgNdxaOQ5F9NhUhZvi8bSHgRelRXeLUADW9/JwLhPdhEv8CD8?=
 =?us-ascii?Q?pgeR0DxGUNxwrnR62fRibeM5DuKvw+2eAPc2nMvVXOxzX0qTFS7NdpRH6Fz+?=
 =?us-ascii?Q?PkWflcYeMV8+DnR1aDDc0JKVfImkwpYS8dIYkMiKfFL5eIIqoX4tbvvapGmA?=
 =?us-ascii?Q?MO46OrEQWwter6PQOSQ00V+1N216C/hnGQA+7eY2YG3JMBm51j7Mkn3amK8E?=
 =?us-ascii?Q?HJWPJJdYzx3t2TIVMgiLdCHoB5nDct4EDdTq+DKq3xyfR9HDsMIX0i2/v6B4?=
 =?us-ascii?Q?eXs7CFhBtcybJJzPliz4gCl/TXjNwLekCut17E3WCO4u4uMObalPl7M2GEnO?=
 =?us-ascii?Q?uZPANeN6H4aLQYh/gVFzVi4VZLCba62VYWgrVu9fkIUwPQPFhYjKi2v5RQYq?=
 =?us-ascii?Q?/CXf7Ld9QaPtX5p2U+tE3cU0vBLPOVywcFi5QBlyZ1niNW2VD8XakUM5NMGA?=
 =?us-ascii?Q?T3Tw1Bf3+HTHWe1U8UiD179qySEhub5kOPbtIEuU0cuRmdRdYADbWyfuZ/kf?=
 =?us-ascii?Q?QrW6tV3cbK3CRPesqREHZx4f+xQLublT25/o203O1/m1ygsyS1c62zmJO4DT?=
 =?us-ascii?Q?64XzcsCLSoST9OSYi2iF0l3WFPOnubliUCtKz0B04MUTgJvJRXMP6F3XwFtm?=
 =?us-ascii?Q?ucyj5tp7HAUxH4GStowJ4yqy4FyndXCST5gUD0muRG+Rd714cQxZuGQvrdAh?=
 =?us-ascii?Q?eMANJwCtiyl6eQxPs6z/sjwEHGmQLflp/dow9jndwOCg25x4Pr50dYGMDRnX?=
 =?us-ascii?Q?prmYC5gZWmMjiurUf0GuRex72OGEScGR9vbP3Qbl6w6FobMaWp04VTVjsJS/?=
 =?us-ascii?Q?HEm4lswJU2q7sELxysZGVUg5VbKIdZpn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xFeolPR5JF4EbFsjnQiqK50KAPHT62VSkVg8SvdZ8ycEQW6Ev7dx4eiNPcD+?=
 =?us-ascii?Q?7zmb9blgLN01KscLMeq6xz+6ZSjr1tqiU0FcYAP6usj4I9DfQlgEtzJL6D7t?=
 =?us-ascii?Q?8O73sb7wUsJhzEBStwjiLX3/YD8wyxLWjfXCA8ef0ysY6iI5y9nwWfjor+BB?=
 =?us-ascii?Q?s5qg0bYrVav+RgEA3LphvIAiwyEaoaiXnj7DIqiO4FUC/8/7c1+0YU3jwp7e?=
 =?us-ascii?Q?i8hKW/XBmXar5zxDgS2Xn/0fK/G3Ul38LrocpcjUAJWEeKUs2bt1hmEZdHtN?=
 =?us-ascii?Q?xHLVvoLGPVLKs69zWMXLOPBDuS8BIVtizvT//Yq6XTr2/Q0AkDeLyacrfbk0?=
 =?us-ascii?Q?hBo1la5l8F2Tv5DnL37fuBFPHvym/5xlLMhGSTnmMfsJB1qvwPUQX4x3vFHk?=
 =?us-ascii?Q?4NQNP/7vdVlilTsrCktExjvMFe/rI+zBjJkAr9afaSZaWoxQPSsyt2O+ihaJ?=
 =?us-ascii?Q?lw3k1i1qY1GyMtikc7t0SykMq/BC59QzLQE1kIybvdc9v/PBa86zpQHKMHnK?=
 =?us-ascii?Q?NWnYvZy114Zyc1Fvg7wra6AMx/HEa7WVDmt5A/7sEubVjaf0WSfho92K5T1S?=
 =?us-ascii?Q?nC/yqGzVNWIx9bQOhjdZbtoVmgK6CzWgB/uhYFJJm94VuOuWrcmcLBepb98E?=
 =?us-ascii?Q?lg0vHwAXBdWGKr3Psvi7luc4/QOaYdrSGEslWHVd6UFtl+LJwM227v47q4lw?=
 =?us-ascii?Q?9364hQFdwbzJmlWr7uH4Dh6Qv9eGi+M+Gawj5U7SDsPmrOv6EKOkTH4SnWNC?=
 =?us-ascii?Q?fEUp8sw3Xqv6kgt6rp9mW3cuffvQgSoMKHw7lG+4Y8G+xJ8OtZYYvRt0Uajz?=
 =?us-ascii?Q?/DGyYo74/Gebd16SRQSZwohvrobKhlJM+VdFTeD2nZ49Yf5ufo0IUOjqwqEl?=
 =?us-ascii?Q?zFyvtd3d6jCPCNHi534JkkMOr2wYws3a6byhT1yEunnopj3gHY1Jb/jnCbIs?=
 =?us-ascii?Q?GXQoplzpDvwhlLCQVT3iJcoD9iYemsN2NABM6enoVeFLYuLcO3UOPEm4FxwU?=
 =?us-ascii?Q?2MBiudoHQhDC+VpyQoHPtl5yGVEEwWG6/NHthWHvVNO7Sw8OiI+YlpurjTbx?=
 =?us-ascii?Q?9MgDDBDSv+Iowd89Bt6bqlXdfeAN/+jEF3er9MDJJaaBE/C5TMhBX6ytPGsO?=
 =?us-ascii?Q?NgV74s4OYe/lmlcwSCZirqj9EmDQVLr9tcdh5OqaEaZSvZu5FaZIpKLdcEuD?=
 =?us-ascii?Q?y1rQUo6bvhMEJ6T68QQaAyWbVWbTldNa3hj+JWeEaSGCpn1vTWRzHAFKGtDk?=
 =?us-ascii?Q?RHBTymNnLqIl22h2vkBYddXDBAbjZIJQwO6QVwAZHvherKG7/EWeb37/9FD+?=
 =?us-ascii?Q?zgesMM8fTiY3RELGSpxbUQekJHuQAifbvSFIYmUfJW2L5Kv57Ahy/UZaWQ0w?=
 =?us-ascii?Q?CnsjlCbJ3JZrUsaJTT6OIuwyakTxEjxP3pqD3CUldeQwKBH+Godcj7cmSIr3?=
 =?us-ascii?Q?kQUds1BiI0YE1/WWLLlPuEow1MpynxC7VKJSD9iHKengPy07X0oxRO1GBJIw?=
 =?us-ascii?Q?mYCnT5C4QOKvwheBQbsPtZqOmcKMqpB0VExZXtxNfEAOvGzTgb4tvr1F5dE/?=
 =?us-ascii?Q?rTwP5yh+jWUpzx2ohNUlciDtTNqXV+JZBdGgBtN8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99aa3a1-c2db-4b5b-9790-08dd78488a4c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:58:31.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xywvum8hjtNbNIUwNx5fTvUzI04yJIxc5VLqpUkQvtMwlEYis2mwJNJD4yHPwYhMvtaYLnRFuSicp0nTiaLEmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7333

On Wed, Apr 09, 2025 at 07:58:55PM -0500, Adam Ford wrote:
> Although not noticeable when used every day, the RTC appears to drift
> when left to sit over time.  This is due to the capacitive load
> default being 7000, when the hardware is really using 12500.
> Fixing this setting to fix the drift.


"Fix RTC drift by correcting the capacitive load setting from 7000 to 12500,
which matches the actual hardware configuration."

should be enough.

Frank

>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 62ed64663f49..9ba0cb89fa24 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -233,6 +233,7 @@ eeprom@50 {
>  	rtc: rtc@51 {
>  		compatible = "nxp,pcf85263";
>  		reg = <0x51>;
> +		quartz-load-femtofarads = <12500>;
>  	};
>  };
>
> --
> 2.48.1
>
