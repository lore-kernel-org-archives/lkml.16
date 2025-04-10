Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2088.outbound.protection.outlook.com [40.107.105.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72639284B51;
	Thu, 10 Apr 2025 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295498; cv=fail; b=OLcxYKwMoyIE4Vc2W/nRkF0wydwZHsKHs9ZlftdYXEf5RyPJz0nWCu8I3q0ugcxy4A/FewFztmpqBfFrM5+b+joMfZzjKo5LHUC7FGnVSFBxYySmIoGZwxxRPSUxyPvcTzzWpIbMC4Sgd02R0AiQOD6NIaqzrZGoN9bxfg2uzt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295498; c=relaxed/simple;
	bh=/c9ekH56WxDFljWitVWqla7pYt1F5NecOnFiAED9KMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TLRAbpQoosMUBxvWzHkzgDBt0W+2cLWnaeW4EX+ol/HewNlh0q1C/YuWsf3lk+2rxEEIaY0bbQCdJKLUlV12ftpDEZVy0pj3RPZJKWAYjsBv0sidBxo6uS6v7ZRf5KuHk/5tqC3rT84AjbYHsqqf2nB0bv1V82zsZc0Gx3kz1pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M3vquscP; arc=fail smtp.client-ip=40.107.105.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M3vquscP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5f7XuBUvTcMhNxxN/WLsCaNi8MBuLzsIoptLg7X4XxJmbZjLYc0n6lXevlHvJgN5eO3ulD9M8wBL+wPm6mdA5a3qL7E2HD1xGqhegiHVSQP3k3c7s5CWZrlKj2txRTCUtWaTfCuDlpGuJ7EM0wwvCQKZXoqbtBs5axRWwGFtFOC/4JuZRbBzIOAYrysf/l4RILN3GPC5NsqCS5L6HAevdar2z2zLuKys8BHw0gbXKLH5zlYTvEzG2tGUPWN8Tu3Rp4SioyiIEA2AgLNDiFsYjab0PM233TPmYIMhWvbdj9sUNY5i22d8BIplPuZ7p+yahNeKDxENrbVqgQJv4S0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3D2r0wWHKczvjUF/tv5MmStdU1NLuFn0cuvHMaJys7U=;
 b=eVIl/pRljgJTNTBy7+0oaDKuInpsejw3b27DBBZ/H6EFoSTLCbUCX5R7l3lNxYGdGC4pJSmMNJ1n4/vac2F1aaWbqgvDGHrCXtuBoV+iArJP5c8060JTr+EeFONWSeJUJxov7nkgeUZIcq+j+vbF5yTQCJtI+dbYCZb1EkY14QU+XgIvQIvm1areejsGzhGKVa/led9lOq99/PTBtwJtBRUGPDpIU/ei3GHut50jWkZmMq6NqMq4Kd4FY1k9SOqWTOm5iY/r6zsE1PYJFhG2VlDeGVdMKf8n1It0Z40JkQ9qMjtV9/34TCDalFHFOtuK73/yz2o+hk5/6jWs67Kd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3D2r0wWHKczvjUF/tv5MmStdU1NLuFn0cuvHMaJys7U=;
 b=M3vquscPQQ35sGD6XXP9UJbkld02O35XytDuW5Xm6VAzrBsGeZ5fsb5V2tOD9tM2Ov5gN4lJjQdfZ4PgpqLuLyycC7Zb3Ce4O21YKzCahIurdLTHzp3CVWQGmxiGO1uV6QhX4LHjV2IJoNw78rwpqfPzxG8Hs9VFXDrCVhXy84OefCYKOLIOBF/h4be2LoeISrxvvZnv7z8DaswQfQth7CrK9/YKrWogclC8MQsMHK0LZkh9Mi+rjB8KrUnfNID3PR/GH2hD9AOZkXmdGMzkK6Br5oqLQL52K/2ypTctD6S4JVGzN2RAWyYzr57N8qNap1OpG9KplrPZe2hERnijUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10675.eurprd04.prod.outlook.com (2603:10a6:102:48f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 14:31:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:31:32 +0000
Date: Thu, 10 Apr 2025 10:31:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH] arm64: dts: s32gxxxa-rdb: add RTC module over I2C0
Message-ID: <Z/fWNxhtLb7Mz20R@lizhi-Precision-Tower-5810>
References: <20250410133028.5871-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410133028.5871-1-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10675:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb23c44-c098-4167-3631-08dd783c63b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WzZNPnCDIJEM/9zkAqOeRtVKBBB+T8O8Bhap7p3kuUJ05euxkvkwApuUl91T?=
 =?us-ascii?Q?DnUrXQwGfdK3/Kt4MvS9I3OlfZepq6OPPQ/HOZLOMkDsSK29oo/OkdTCdQW6?=
 =?us-ascii?Q?lQVxAC8Jlq5RrGG180TKySwUYmLei1keAXHeERLy13gyGGJUMMLpfRtQuMRY?=
 =?us-ascii?Q?ooacNDRTCWitl4QNzcsjBzH5muUqDuSuDax6gFYWtDPiGf7q04e/FTVST9hl?=
 =?us-ascii?Q?GgdGa1sMC7VyZoUh4oGTAzX+rJmtS5iiiQ7P1RQnJMS5Fa8LVRzOEMHLu38k?=
 =?us-ascii?Q?EatOrDT4BHVb3dcAimVljNj+cJcoGWYkCpWcPXnihCEBPArsq1LOqpn4V9ly?=
 =?us-ascii?Q?xsBXB7IpeAhfz3neuiFzx6uPd+Y0ES+lfswesWz+54RwNBcmEeKT9AxRg/3j?=
 =?us-ascii?Q?rxn3XoLZAo6WLAozwQX/M+nZGUBCD0htXnI69qC0kyCh4jC8jUc6fq5XloI1?=
 =?us-ascii?Q?HB701ZZZzXCFM2LDAzRVC+irStiNiTbWhmwhRlhiODH5PFwqMTk1p+Yzjg7c?=
 =?us-ascii?Q?8LhYHA81Njy0J8DOhu9n+iYL6m2Jqm7sXk5LZeU+eWeWri1FtmaUopvNIsEP?=
 =?us-ascii?Q?q2wMwD8HxJBXBo0+RIM23KO8cKRUQE6GwwnH/OgZq5WBMmpqm+15R6w4lfPs?=
 =?us-ascii?Q?nkDv1Ioupm0zqcYefGF2W3adZSEk1CrZeWueYD+G5RaGUEkKtYMF+AQCz3BT?=
 =?us-ascii?Q?WIX6fnVLUspQNDdutp741Q5P6FvjGJtP9UqwF42Z0+GqwOojV/y68eX3SSxz?=
 =?us-ascii?Q?euOGE/BkSYjKUYZRc4WvoTvOHXZzqkisjNyKqMOKmDmEo3GcXkHB0qIW+X7c?=
 =?us-ascii?Q?3tTKLrIYv2KwGiNSN41hs5IhcbOH+BW0hYfpupZ2O4Frsj/xVQ/QZiQvoCoQ?=
 =?us-ascii?Q?mXzj05SzAPFVnhHTmTJHCPF3Ey14/DS2tOfC2OH/Ep82ANg5VmxoNdqT+9Rb?=
 =?us-ascii?Q?MPVU59MRqyEef4N0QARaE1ss6fKn8lE3uR5N0XKsVD5QLsDJqtUVkZdysx/s?=
 =?us-ascii?Q?0MqD2r7LgoV4cg+ME9xoGQoWQ/Dq9YR0bibNAoCDNeGUegNCNtLiopfBmuBE?=
 =?us-ascii?Q?BuR76sjuplSac8Lx+QZKOZ1Yh9A084H/T0+my81gCEDRT9EmOWV6wdfvMKZB?=
 =?us-ascii?Q?iIYQGZzENf16qie6Oy2gaKHpXlSo/lttazkU4Ar8U3OYBfDNZ+osYmkLfUzA?=
 =?us-ascii?Q?4n+dBJwOQRjrERmifrSIROf8nRCccizDpW4H10FmOc1FVuT2aZkFHgxS5yiX?=
 =?us-ascii?Q?kNQ5mvCXVAd5aAuTqACyR6Ii3bHsVf3lwwTGJwRX2PtYUdd5URtTU0aurj0i?=
 =?us-ascii?Q?8ObmVFj/9SFvkwSRYIVYGjICy6EmTzGq4q5hFGTr0U/nzCbmg7zs+y0K+KQi?=
 =?us-ascii?Q?n0sxLTXRrFwKdiLk2bp+iJa6ShaHSbzE5EoLHnYK/KehYEVu+a4gHo9zcORx?=
 =?us-ascii?Q?Yal5JitQBw0ZVx2Pm/sOln1bIJ9o4YzE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+jgi0lErsZzinduYdPJmk4+ku0O0kVYY9/ZfmyTARbnZwOdU7mvrkXwYBk/?=
 =?us-ascii?Q?Sasu3LfTA2dB+NgAgHMgzMozE7yFfYJv6lZnkPnyuWVKgE55VZLT9+J1pvVH?=
 =?us-ascii?Q?3sSK4GHKyxAV6z3JZ/OS14xee5jOe4Bei3QtmXno8p0yvBxCNs08YhoTWWcD?=
 =?us-ascii?Q?LsP4CsywnIKpa5IqLVYZz5bULuMhazrDAUxNkdGwyem7Ak3DNHzPNa9rgpqw?=
 =?us-ascii?Q?CUyCW2NAHAzFFnjFbw1Py6jhRxaKYiVKaPdjs429hd7s+ogGPzHMRycQU7du?=
 =?us-ascii?Q?TJu8zT7euRbjZ/ygawZq5IYQASZf9Fudh2bmeeJR5bD8I6iXFqYOVLzew8Up?=
 =?us-ascii?Q?4z5mTEV3PgAvcFeQPX9g11tLjQgIDUBJRqnQL5xxeuk4PHxsqsJiVc+nZ0Vq?=
 =?us-ascii?Q?iw/BH8+UkiUo5CVVNMlLnQlAsVfGg1jO/4sInY2WQMJC6urXaXFRZhU35tEa?=
 =?us-ascii?Q?eiUYyZH/O8/oKJwbGHAtSoLckgwSkVsHcsPmdVTeUzSh59nJVC7ASEMCKPAJ?=
 =?us-ascii?Q?Q+dsI+ZeUPExDWsAY6eKryADuaaBc7vuoR3yBpGjYnJVEUlKO4kQ09RF4o0L?=
 =?us-ascii?Q?5Ly6FSbr34zwgOVmKy+4skKVeR3Hwc+fDKz+VHvoAbbtZeI4uGpF3L55xZzF?=
 =?us-ascii?Q?10a3rLZHIL2ywZw8nLUUh9phvw4ymFlMZGVVVFq3eRNocnE9siaLZlK02DsN?=
 =?us-ascii?Q?hIWyT9c3aERTbItDKBuLxbXIaM5Sf2g9z/WUFfbBgtUDuispb/E8V6bAIa+m?=
 =?us-ascii?Q?jDE4o2v/6IOrLkZlOSVzfBiw+d66bMqHNlhpU/3jSU1Pprcsb8ZKPceY9ZtO?=
 =?us-ascii?Q?zteb1yGbgKORd83FSo0JqricRb4jKEJSOO7Tf+w1DQFiODTCk4X0DV/CyxFD?=
 =?us-ascii?Q?g7nAYCBQzyi+7jllNA7IoCSxbvzZVnaEq1BvA22COrCEG/2dikDuYbQlpBqz?=
 =?us-ascii?Q?JDM/8djhge0VF8VFAx5rdfgS2v/Y2udmno7wmdXXT5suWttxrce6/lN3lvrs?=
 =?us-ascii?Q?zqqoupiI0ZOrhBsVRIZWrY4YGHBNdmK7qbYqhZtZ1Y2KsAB61jtXTyAaKm4o?=
 =?us-ascii?Q?l81kxZpjrhWUTPCodQ8SYeKoMR2YUT7iRlNfh/Hjb7R38UzUs54oXBBI+baE?=
 =?us-ascii?Q?OUA5GxN7dUHzJfWC4quP9s+xkxCTtKu+JwYwZc0wLTH7xli+q4yODaz2Swdo?=
 =?us-ascii?Q?4KGDrIEsj+g+6ySflIMGygvenC8656hWO/xCJ/k1t+GLa+EpcmPeAbPaR7Go?=
 =?us-ascii?Q?UqKDmcUgi1gwbODahlhf5cG1yLq7pRbMEz+w+yGJWzpl8UagQ+nTB57iLFDu?=
 =?us-ascii?Q?45OCo610V+bujzETQqDzEpIQm3Xx9oSqxHOVwWL4ojdm6mtzb6qwYVWx9i8i?=
 =?us-ascii?Q?6wnLrwEz0V4Jpyg4Jn6eJhAxCkHtJcXJ2CU4uxlsMMIpFIjVUnjxKB52/STA?=
 =?us-ascii?Q?pyf8IbaIN0exB42dCse5Gk3tENxL2C+zbx1RsLqpO01hd/CpcV1h5ufKR2lY?=
 =?us-ascii?Q?7JV5b4azMPzA/Fm1upmNwQneJa7xoGXhqE5IA4d5K1KC3b41t6zRHDNRjURG?=
 =?us-ascii?Q?Z4ukOMp+cHR+wZjqUjo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb23c44-c098-4167-3631-08dd783c63b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:31:32.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEMsbYwreDZiKSaPXY+rcUc5d1hM3y8wT+QHAeRd5DAvkiNJz2BFPKSQDXFZ0SWqHG9eOu8kTtyZ1s39NY5EoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10675

On Thu, Apr 10, 2025 at 04:30:28PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> S32G274A-RDB2 and S32G399A-RDB3 boards have a PCA85073A RTC hardware module
> available and connected over I2C0. Note that the RTC module is not battery
> backed.

Suggested commit message:

arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module over I2C0

Add support for the PCA85073A RTC module connected via I2C0 on
S32G274A-RDB2 and S32G399A-RDB3 boards.

Note that the RTC module is not battery backed.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index ba53ec622f0b..4587e1cb8835 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -153,6 +153,11 @@ pcal6524: gpio-expander@22 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	pca85073a: rtc@51 {
> +		compatible = "nxp,pca85073a";
> +		reg = <0x51>;
> +	};
>  };
>
>  &i2c2 {
> --
> 2.45.2
>
