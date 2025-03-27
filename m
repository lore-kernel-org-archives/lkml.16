Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9105C603;
	Thu, 27 Mar 2025 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087279; cv=fail; b=D3gUSJxV582KVJqkq7/unsgFMort2X8loX1xQGx7zrBYoUBcC2386s4uC31t2wGh4OiKSYN4pOh4k/o4PyTCPeMicUBdZToRM+2YGy5Yj/5RhbD+NpuNdUJNlWzqgZfSIrVjFrUMpO/CfA/8i5ikxbWEvTgLTjrVKPV7RgzbDgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087279; c=relaxed/simple;
	bh=roBkvOWTgntirok/vsVxTFgMp63zvAJlAR3hulIMgxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rgZ2BdE219lQI+XVU3sRLFfItDpHG2uTmI+j552AVk33IDb+Hik8kDCtcoVQwwWMEsxWkNSpHDpbLQvYOv9p2YtTiQFUnmKuiwLDNL6Nj0PIR54K7b9VWzCnBgQ+Ka0TUeabXVALyg3U27vODek+Jro1OhWOk88XRjhtvrLzC6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AZH+IX0z; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AZH+IX0z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTZNBDHPF+2mggurhPC1bye2Wg2jo/TtxHZeSRXmwRzU8BpyxDMIG9pggv2MsrMfpGPbk8gy/sBudrcJ4m2qOsltZ8QCp/ZzPFB6OOtqjl+WbiJ2aJlVgnEFvBtNmC4WIEZ9Vj4gEmmLEBLNXxNyted2j3lXj287nklg1Bs+V7gSVHAahWu1lLXx61NnuQFH2FLmEAQE0DtCKjvbCm881SajhQ9RXGM+WH+/1NG72UHPsvJKdd7jjw7b38g4hWFPxhjvGH3OQPmEQsj62SBeCCxUxpBQ0H1SPxjtb65spziTFY7pmizChlCKWyGOllEo5eCUPLBD0t8sfnVBjd0yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Chom+sX2K5AAtsNRjBWUk1C7AeCEdMBCVsAVsHaa9U=;
 b=vXPB4J4NHcaEAwZWNEOLKHqmUm/YqlXSsP74sqQvdPCD48bvuRwc+Ni0pjop3zZEaX1FHLxRA8uq5x5zowcAnHHtpingFTn/OAL0YDnbb9AxtGpnr3JA7sVZ2gYfGxAvck1oG2tJJ7sXISE9foI9bGXShzZ3mTwATQpNp1iCOIXBr5yflqeZmNkpCd3uAI0RNcgoIJQOMiW16yKLSqANYqFHFoIRzmeSjK2NMA5P3MtL6Tl4iVz0tyqIXD4S8FCnSBVGsY4wNwX7gCslxHTMODf0xcxgvf3JNxvIKOQjIYR/a3A9bv+/FerDsT9ulgbgOq4sVLCax05pwMX50oVh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Chom+sX2K5AAtsNRjBWUk1C7AeCEdMBCVsAVsHaa9U=;
 b=AZH+IX0zHA66jE0hYp6BPTypgN3gxFNHWCQScqv962lVlo2nmOanNYqGPH0YSC4b9elhd2p/5Ph+p1c86PlV6UGSyi2croVNHjqRg1rvm78TjvAD5fqBCBeTxhUqmXDqkvTuh9dSej7T0SNEgxopbGd/GG3OQ1Dv29zLgioULFlUge5r5bwtzQL1tNNHgchtnJ4rus1Q1TOwLoHRf+9D+AZS/fWOXBnINw33eN7wALMzpI1JDUJYHTBt2xH4N1Sfssj8xEB/ULvFU01JY0PSi4ianz4Eqjd2/qY3MiStoSelJ5DEBBNqDKwN0W21IzMYyFmwa6c5Ir6S6+bDJuujOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9462.eurprd04.prod.outlook.com (2603:10a6:102:2aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:54:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:54:33 +0000
Date: Thu, 27 Mar 2025 10:54:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] TQMLS102xA: New display overlays and small fixes
Message-ID: <Z+VmonrbclCB3zVh@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH7P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f31e8ec-b324-419f-e6b8-08dd6d3f491b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OSgixyna3T53uYH0isZIRkfbLbN1QwI+uDqvNnB1qoAvQiN49+0sgH98qgeq?=
 =?us-ascii?Q?+dn7qhaVCTvaphj+LHZaZsv9xEOoxzTZTCBTlapRVvt5pWzUuSj6SxJrAhrA?=
 =?us-ascii?Q?4d92vwMBomlYKnDYefOAhQp+cMRL0XLg0b6Ob7zhwu7FyoycPZGqkzjpEVwu?=
 =?us-ascii?Q?iCWQYlRctzqEgvbAFEWcV9Vzg3mCx8GYcJWzq9DUqgTCKGEvPbN1+nWv8OWm?=
 =?us-ascii?Q?mRqDurW7ClrUWj9O3EmlzeE1gqFW00/i7QG4dCkw2o12RQfyAAqjoeE7KkAL?=
 =?us-ascii?Q?8goZkGo1shKIIHaaUp187E0TU58bOeqOsIn9lAsjr2babnux8rnuBipIt9p7?=
 =?us-ascii?Q?WvYtu26YJ93Mcsdt/dcJvjYBIZz2FJH6iUeuaLjAspRTQ9s8SF6y6DLtMHNn?=
 =?us-ascii?Q?3rFpPAWlsOU0TgXEcz3MHiTL91tYrpqRgNJybF9Q4DIXcYcVBjfFSgAXt5rl?=
 =?us-ascii?Q?nwNDrbZixybA8Swulc/vkUVzOpUwo7JQ+Aa3UUpRelISfVhVaRiJZuqgV+8V?=
 =?us-ascii?Q?F9qJupXWduMpUncAy/Jrw16XP2fOyru0UNMo0Xhyj9lCftsJ4M9UPYypX3wM?=
 =?us-ascii?Q?dHKi7mrzJM+eK0g5ool464aYz/phzUVXsQEyG+HwSaL+TfCcFJ8XcxMlQxOw?=
 =?us-ascii?Q?5lxSWihVVUMY8SjTHj9t17b0JKCa1x7yPDZpP4OUBexqf9nt/6mb8pqaY+h8?=
 =?us-ascii?Q?+7SZ1gxJpD3KW1gzCZsFbunZ1vEFcbsPZFCjPJ3T1FzG7oeP9qa5d4Wd++zt?=
 =?us-ascii?Q?sMY3GDzNa8zw20aW8upbxEZCknopyxeLNJPvzVljeT8wLzSjCTr+B9TPPJUq?=
 =?us-ascii?Q?wO+3L8YITqde7owcRqQJ2GMbGJX0r+g6aQYaNfMV6e12DQT/YyghDd0e+QGu?=
 =?us-ascii?Q?0++MYwmbkmpqiqY4gHMR9oqm63xpGHpXOETuntNOZGDRmbH4t/FWtiLt3MMM?=
 =?us-ascii?Q?iqcjZG99SAvGozR7vyPLwe8ftv3thQK+GUROgvsCstDTV4b/qbC2HsuM6Xt+?=
 =?us-ascii?Q?fIvkSepuc2tcyT8bCQ437U3KYaVVmoQweqOpwYYlXT++FuqLW9wKVAzYZHxe?=
 =?us-ascii?Q?6fpem7nMW8FYNnHO9AbZzmMtZG+iP2WKOEbuupWmaqei58c7oLEgICTmXhhR?=
 =?us-ascii?Q?HVrM2dlvmzjGduvDawphl9qbZtcCWDpTifPro8YZ/dCPrREGeuXqsT8QTpgr?=
 =?us-ascii?Q?9b1vZb4gt99h0V9Ceu5e2qK1IZeBwoGfk6YPIidHraGAlbJa5tORS9LJkhpL?=
 =?us-ascii?Q?WDuskig57HhYbQkKxhR2osGEm0R47JPkxvpLN/RcQ4yvJ2qXP8E46oQ36XBe?=
 =?us-ascii?Q?5v1jNC395+4FOuqh+Zj1ugCK61xdSo6YTJdGtHLi0PDvCoeaMQ8ioiKlhg8l?=
 =?us-ascii?Q?uN5PDx+I6RNmfXra2r7RZ//NRfFxEROHIsdmGvcskk9w3gMrDIdaxj6RyBRE?=
 =?us-ascii?Q?pN4wtwO31o6p+1JwAFTKkrab5A8L1zGk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YqesTSGY5h6+10oPuVI6DKsNsUrY2aA2pMxrvegShEeAbkVQfk9RttxNXV3d?=
 =?us-ascii?Q?DitFm0vwu3o/J3qTK4A8GW09Ek4r+REvgcov2b4KEyMnrwHipfwalT2C6sMT?=
 =?us-ascii?Q?ve3q6Ckox38o/EEjguAB92bLAdS9LFNUHEw+KrT+hHgqm6wlMbPcU2qyeCzW?=
 =?us-ascii?Q?t0WTg8+/MvrpgYJ4VLPXdw7ckEzOa+q1nDxEm1onRjOkgKIiSdtRse/VVOUG?=
 =?us-ascii?Q?f/1vO6XiPr7wbYgCaxKJyaxSzErEEg/d6GXSYPZY8HpJmDUENAeFMMY5pwhJ?=
 =?us-ascii?Q?1ESu+/hgqEODzWH6bHxMZfYs5mYVEqqaN5g+Ouuj0VxYWb+kFAYJjxdgMT5R?=
 =?us-ascii?Q?AWacrXOBtv8rCME4oTeEPZnmuZPbAOg55optjcpm4x4+oABGMLc4M7n+VcML?=
 =?us-ascii?Q?92KpDXf56nnTlDhPRjrmrtMPqvsavNh2zSoTb5GBOjxG3hPDIw9Emhmt7CNE?=
 =?us-ascii?Q?D2C/5VdrRp6lzy7OORRE9GpK3VIcLvHqI40w1GC5OZzAkMEwCEPvzrtHYOtM?=
 =?us-ascii?Q?+M38hMQKEEe8u+TPZGJH0eBwX8XEXKhn3F6bu4dX3cqno9stLYRLgWtjCNVA?=
 =?us-ascii?Q?/WFS+JNHGsuLSFVeFYT82ZZfxVr+ndFisxc6n4pQmc1W+p50vNK29saMiG5r?=
 =?us-ascii?Q?qPyATQzqmDke8+BDlJybJOHAtEV+sdO996wGertNbj/2ZHF8MjezSzP8mlNu?=
 =?us-ascii?Q?zmnEidCs2dxRF7nOWUn8Z2nJMQTj0WfxBuRPMvi8xAB1waRpFu6WmK4KlPnF?=
 =?us-ascii?Q?j/+hoTecqMdeo766M3/NBMKzxUzQgNsgB+ueYqVYpvzKXc9Q1BnYtXN3Jgcl?=
 =?us-ascii?Q?KRFrT3S8p8yoW+Ye4AfDX1oYBUqU6bW5b88XPStcWUJ95MQQG6SPTeUmlJlz?=
 =?us-ascii?Q?KodvC7Yq6hyJL6ihEDQjAfFPiYpxLlz7hWzZiEi1AG6zweMWkJe+MR/ltGUl?=
 =?us-ascii?Q?BryGAfxwgA3A8MTjQWpjSF9UWkbGVa9MSrebc9KndPT+BqnIbsRyVPvcIx8N?=
 =?us-ascii?Q?L95cvm0UU6MnIE6LIeKTmJVmyBzGBouuoZcvNPJyHtTHAwpJqrbcIui/TAP7?=
 =?us-ascii?Q?w18vvZ4qWlvxwrkrpOrcyXn+XUUgqMWU8MdA8q2ZAcDb7cNdyAr1nDLr02Q0?=
 =?us-ascii?Q?OJNrH6s8itkIeTiqPYbnzgFVJP0uywWMnAnTLqj42vrkNOdZQAmP7odLyhBg?=
 =?us-ascii?Q?S6YRf4eUbq+GM5KtZHrRWTtKsnb7lhAZ8z/mH39qDO+vLCN+rmb70U/q9rIy?=
 =?us-ascii?Q?w0Upz08XLDfS6USoew9BB7XuuezU6tkYkNXNILufxQ3JFnGhcGODKVB9ZVUE?=
 =?us-ascii?Q?7gXnVTkkLvaPx1wi5uTCDFZfqqAAGrYJNKHER9fsAE38FNOcXdruTUXUQOqY?=
 =?us-ascii?Q?IPOakIrLSibAOOuBKirhQ7/vv04yir3HROHduQxu73wKtWGfIuYLlzbzZh+T?=
 =?us-ascii?Q?d+ucLyOShnXxJQxPVBT3yUVVYeJXZD2Jt28gfS40aalH/qsuPrSgHT2BDVUR?=
 =?us-ascii?Q?lFiFtnXA4/4ic5su0kWZCUV5bbTKXNju/SYhaA0wNIxcPOeYyZ2vvhMPpong?=
 =?us-ascii?Q?frKCef/5BDMlxkUehe5gJ/Tjf9DBjm3KeGSzHGp/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f31e8ec-b324-419f-e6b8-08dd6d3f491b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:54:33.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fByDzVDXDD6T18mv/vWgSFYx0x2D3JVpNm3Hj8GAfPiw0OG/e3oK4ahGXR+k6OW3HhrhFwKbgcxGtnVcRZfD+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9462

On Thu, Mar 27, 2025 at 03:41:06PM +0100, Alexander Stein wrote:
> Hi,
>
> this series adds several display overlays for HDMI, LVDS and RGB displays.
> Additionally it fixes the license header and updates the sound card model
> name similar to i.MX based platforms by TQ.

Next time please cc imx@lists.linux.dev for layerscape platform change.

Frank
>
> Best regards,
> Alexander
>
> Alexander Stein (7):
>   ARM: dts: ls1021a-tqmals1021a: Fix license
>   ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
>   ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
>   ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
>   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
>   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
>   ARM: dts: ls1021a-tqmals1021a: change sound card model name
>
>  arch/arm/boot/dts/nxp/ls/Makefile             |  9 +++
>  .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++
>  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++
>  ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++
>  ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
>  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  5 +-
>  .../boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
>  7 files changed, 204 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
>
> --
> 2.43.0
>
