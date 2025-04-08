Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013024.outbound.protection.outlook.com [52.101.67.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE622ACEE;
	Tue,  8 Apr 2025 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128615; cv=fail; b=X2FCEdbEpMDG0virHwKJk07Fz4zoFx4L7egxqwSUTahQecJ3yxfTm3FDAQa5a7QqSsRQorzTuycjT3aZrfQvbRdW6LsCeIn9epfDBocDhqyuP8hvICi2FR5jVVWEo95UQwQdY8j50/BB4mpn9FmkWzvw/7iNYxVeLYxJREjVu+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128615; c=relaxed/simple;
	bh=AUbx6SN33NuKWZZmInPZ13Q+6nFYZ95f0rNcA79EuUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b3vqgBYO3qUv5iWVZW2cUxCKW8np4kEYedSaEI4jMEbaW/hyqXOsmESO3T5GGwWjSKDlADqJWcBqDwjXMX1+iEjBWBqsj1yxgH9Y/LgbX9lSWsl7iFKw7ofjRZr+iUxW/qRPd+foQHo1hdMNuPskeOfftMJ4mHJqInevz/HxuxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B1g8Rtnh; arc=fail smtp.client-ip=52.101.67.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B1g8Rtnh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8zP1sPw2Lolktp5oB6LbIeDSV2ERUQyK2aL43qR36hZpC4OSGzgPHXRSZzVl4S2p9CodivoOLbcLmXfdygJhYDyfn48Yl5llv+QASXg3slUwrO+hbIHlWNhrRa6tmobwze7EfQP9Lq+fixr7ri5D3EC/EhhUW7k4199o9vmv6u3OV6tIN9kPspzWLa1maBMBX+xV+mcTVjVbs8BllQfagb24MpVwYk3s0QixLOAqqQ4+x7LrD0pF/ORKSTFX2sQiJzogcj7zWim1n4E5Ut4KHsBF2bIURClvYVREWKT8FbohaXmPjkSit7uCr56VnjLOA6peeIcqo//iLGeCaH7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQ/uJ1YXZ/MgsQSXujGVNyOEVFC+pBj/sEr0S7mcVZs=;
 b=lupq55zOHb8XpwdLTYrYpZKLGIUbPkC6gex3aycY3cEk8Te7twtWSgD7cxCnfZJ34I5u1oPn+rB+jIRNZO8mgpO7zuWND0BJV1oau61u1pArm6zba14HzP+S7mqQm31jNOA47iweQpIfLKPlMZC+caBJ+o/yO+6lguY3HtPnL6w5BHnybYdsAcR4yrIBUbcVZlOFhWpfnKnKcFUFX8RWex505ToPwXQWdXqXwqvStpafX5A6lv1GemyRxX8iXTg6NHTkg3+EuefR8isswPXNM+BLGaBHymNSEl75/8BwRC2SSBfaOVmuB4OvUnU/jcxsTu8XiX4SGsnlYZ0tAVjkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQ/uJ1YXZ/MgsQSXujGVNyOEVFC+pBj/sEr0S7mcVZs=;
 b=B1g8Rtnh0WTomIYGR0c6e+nYrajrDlpQlzRJzCq/53ThNaiMLwiIMOyHRTM49lqhOmevUfRnsLjTbZYd/DhoywE9oqlbTzHjw++KuRrPjdsBPFevR4pRYS/nXo6Iyyam4AOJ/9JnH8DRIqeq2VzniEL9XMFtxfebqAxnLdI/94Ux1A50QisRW0wcc50YyUyrU9dc1cWtlGKrenwk4zO7/L++yFsM6hrFaTdNPBOU0Pe58PEzdWt2WkClpUqGZHIfRIbEUERTIzi90fbANyMO+RegelNuwFBSXTUJOekI5TVnjwyKSDyAZrVIBMfQaBzdpgVW8so3TDYeMoqzowJPdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:10:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 16:10:08 +0000
Date: Tue, 8 Apr 2025 12:09:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay
 for Tianma TM070JVGH33
Message-ID: <Z/VKOVMssWrENITt@lizhi-Precision-Tower-5810>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
 <20250408093059.551700-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408093059.551700-5-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 056439b1-62a4-4760-263c-08dd76b7d43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SrfXcvCY852TD+dfjws4gxupX3iKNynEPRNn8s8KWUz2EJHM+5VtdL9GcVkW?=
 =?us-ascii?Q?M4pYNZ5hpnaU6I0VAFIfe8zksGZb5K30PFk0G0TLEqblodMiETCNH9y9pAwC?=
 =?us-ascii?Q?S9TaXT22dmgPRrqYTG+cuki3/xLPX2iDWlRk9LbyZMm09dzHUHUJuz1S3mjO?=
 =?us-ascii?Q?e8ithsHcyXsk4id7Tl4AAqHIqvQsfBK9EoTS6gNkj7/uMBLe06RKZUq10fiZ?=
 =?us-ascii?Q?ZkMEHh0XGE1bMEFG7OZsPmRI36m+IDh/efZwgX2QzV9V+MdkVCjVGH7bIV2o?=
 =?us-ascii?Q?WqwpRNaWt6zOGEbp4S28dF+pD3xy9VNHUJ9D3NYUyxumO3Bj8/Og0biNIgBu?=
 =?us-ascii?Q?AhIKZSaos/fPzLWNa+MAhKx1uv3j9weuQMauikzxzKKuvakwAAxDAngCmqdw?=
 =?us-ascii?Q?m7r4TcRwVW6b4/k4be3rvsdnZ58loAC9e3mSdf5shVcuR8qWw+zuQR0vd2gW?=
 =?us-ascii?Q?YiE/bA8j9cDcwk/FTzjEAJRdh7ojXuLPwK68GkrbN80pZ+x9eTXg2/krMqr5?=
 =?us-ascii?Q?uwPEkTgR1rpMpg7zQ9dAc+ASO98TBA1goXK26VHjZKKeBsbM9lkCKza2Rvpx?=
 =?us-ascii?Q?nDzrZykRLGkee9DSBoo/MkK95kuPFzZX5YzAmMPDoNCmmskBTKX131puReYM?=
 =?us-ascii?Q?uKqVVahSq91Z7bfQy2toruITRM3xeLv4nMTC2R1Y+DKX+Do1sx6TiaT4BmwN?=
 =?us-ascii?Q?gPh/TM1aqqhCpdBQdVkUE9PTf+pgKyysx3hpFDA4bWowdDXZKVp7BqhG62rw?=
 =?us-ascii?Q?n2NFpCELDxhjpq8qC8b6sAV1VZz0RYdDExNJKVQpE6SZWgZ3NQ21h6UpoPzq?=
 =?us-ascii?Q?IEYdUvfBa6/2JdTfSgftdFeb5z1THLh04MQJL8SRKb0wK1STzXNNPk7EEMyf?=
 =?us-ascii?Q?b+QQuBAj5+wXGdZ5SCHwrqW+eOcDQwLcTzVHMcFlnji2tki5ZdZ2ktXkcMSn?=
 =?us-ascii?Q?DOglT8nkuQdFAEXd/NdxJzP2NlLqdUk4TGjcHKi17k289L+v7HgOvc27CSfO?=
 =?us-ascii?Q?w2vGUdo8ireigd7mpecEMdsXnBjx7B8tSH1RDG6GaigF01PMSrwEaFpPq7dP?=
 =?us-ascii?Q?xyj+m3Nav8vFGPsG0kJWUaZ/py1/J0lgV//Nh0iz6GLYgHMI+NQr+hPztbaQ?=
 =?us-ascii?Q?MhPaUX0dgfBEpFbEEb9FZmVZuWX+fP/Os05/rfGO9wQsIJ0i+tukJSdx+Sck?=
 =?us-ascii?Q?CC/eoSck6BUpEhhy/UULUgZHPlT7i6uwWBATLlWVHzFV7jGReR9ifiguAgw6?=
 =?us-ascii?Q?pzjERTUxeV6uwhpRv2DT0sZQ3PpprWe7NHTf4BWL5nJdo2AHAIJwAlgJhMq9?=
 =?us-ascii?Q?h1CybRvbynpJ9UOfYnk2I5lRQBGdQm95DyfAoQthuC21asOItsfXz/9FDY5d?=
 =?us-ascii?Q?wo+ZFbbWiXm3nN3U9FBqkN8jo4oucwfX6DSMsJt7hN7Qvyg+7qRupd7mxX/j?=
 =?us-ascii?Q?dmy8DWhyURQHULP/rkmNKC/krwMgox2z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jUpqmOHGzFanVX5f5/CU5ZyECkzcdznahjB6obFZFlcdTan4XMCW2ZxQGWMO?=
 =?us-ascii?Q?tDJG89hoKTgWggV6dGEHHLTqhUaVFB6xBF/AdiPBZ6ox4JJ5/RunANKxEXOY?=
 =?us-ascii?Q?TCd80qHT3Ijb3D6cKtjZWQY1Odq6olyASKW6RBwi1OBxQ2Goxp9bFp0NuLaP?=
 =?us-ascii?Q?0BBkT72ti5clkzz7lqyfQg9NdPIgp8pWSyt3m7aXkPgxac34yR7ty3M4kVRq?=
 =?us-ascii?Q?rWQqLQ1jVA+b/D/qPEMqHuRENQnYAxhjPjD/gbKDpoIsXVTllEnDI2NPwVjB?=
 =?us-ascii?Q?JVBIo1HkAm5qbPEkGpuZ6MKrg3RipBeD/mNpY81zxERnxlnGGmjHHaHQWexE?=
 =?us-ascii?Q?polJT443Ydkuoq9lxbAHoigJx4eyFF4k6GYDzpuoUq6iPLzYR1lTM8De30lB?=
 =?us-ascii?Q?n0zD7kGgs3ReJcOwAJ5dhSNJ9I0TElYPuEP935O2ClPKDjxgShsIr/s048Ih?=
 =?us-ascii?Q?ryHQJTtSMa0U6L5zKEvhiG+/9cJFHyFi9K4EMOVvx8/EQLo2SnWYwQakLeAa?=
 =?us-ascii?Q?BYy+eGUVT/5Ogf23NkMdaPKA+hcSiJoCUSdcO9GQqzat/3pcBprns5aGGH3w?=
 =?us-ascii?Q?UTW5INoKCd++ABqVdNR1s/UxsZJiRCftod3tTdDziDzqPZwM2k72mUHO7Vfk?=
 =?us-ascii?Q?vabo1kkS60+NYgI5/NpmtNmgRkIbsQsoqaBcb93DkegJDUSTKXlS+yC0lTPH?=
 =?us-ascii?Q?wKXjtEe2lwgrn5NBYqVwEh0PdXSLNpYKByv1c6fXIdh1uQif4fl1rYp9ytlC?=
 =?us-ascii?Q?tnCfKRRibyF0Kj2EfZBJTx0jSFXDnTHqcRW33pfLYtfH2bQX25X/9G6kll6a?=
 =?us-ascii?Q?sbmudpGOB87PwxPCyM6pLDFk4BidXKLP5p3IgAlqFNnGIEx7UaXjMlnat2KW?=
 =?us-ascii?Q?4r3UStMxr5UaUy34s/gUsSBLR3W6xwnpRW3uxm4UZrt3bLcnEbGqSxNGgkNf?=
 =?us-ascii?Q?yFlP7TPIynRbQUfxse5M3wblDJGDq6koonx230VKANDK9mPz9iubHUFCvqfY?=
 =?us-ascii?Q?pdqgWju3knZn7ShY4XYUXh9DZYiZsFRE5Zs2MWsBujt9D42JwTKGQsqfItME?=
 =?us-ascii?Q?ZEJank6iXvFJt/P5tZdM5xpmp4+Hmbff0s478NEC/oxWF5rna/epjiaSrJTT?=
 =?us-ascii?Q?YR025tm6A9QXW0BdH24NqHX+z+pI9dUnu0geXIie4OYVv/H5xVTp/K0D3eE+?=
 =?us-ascii?Q?EdHm9p3dxwQC0gtYp7ATUnPhVkgkBjmIjvO9fnI2FURsuEy7voTgrVx7E1iU?=
 =?us-ascii?Q?sO3wIr6ib9gsWkXupTao/i71yrNjVgH0AKwN1iZ7/PjMdGAaQ/QbXG37iM/G?=
 =?us-ascii?Q?pIG2Ig5xEtzCJlp2HAmBYU58P8zyM3tl/9K2tnKET5UUAdTMO5Y6sbXSn61M?=
 =?us-ascii?Q?O5ZI7sBLk7KWdIeC1TyncRMUwAeFP/4+rrAM6WegcfLyV9BxGJ7sGVM7O+qR?=
 =?us-ascii?Q?UlZccvZxDNow4XeMiD99PnVdB3LOccR2NtQ5Dh11exgjfzqwzJA3MkCMumQk?=
 =?us-ascii?Q?Ugczi6dhsyUUU70CcMWh5PEiQ3Rc7WZihBBOkg5kAjDqLYOlEmDYg0yQ1FEI?=
 =?us-ascii?Q?tlYltmmkGVC0PjSU+OU10TuQ81ABh/xOvlT6R9UJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056439b1-62a4-4760-263c-08dd76b7d43b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:10:08.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPj9RzEQhCXhv6nwVbT6ZspZ5CxAjUWHgsdywiOBt2kWqmEcfZIDTVghvepGn+ahSiimxaglotf6Y5BQMa5gfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378

On Tue, Apr 08, 2025 at 11:30:51AM +0200, Alexander Stein wrote:
> This adds an overlay for the supported LVDS display tianma tm070jvhg33.
> The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
> accordingly. Add power supply as well, which had been missing all the time.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
>  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
>  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
>  3 files changed, 50 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
> index 225a7665b8ad1..7f96de6f80224 100644
> --- a/arch/arm/boot/dts/nxp/ls/Makefile
> +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> @@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>  	ls1021a-twr.dtb
>
>  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
> +ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
> +dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> new file mode 100644
> index 0000000000000..e9708f3c67403
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
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
> +			remote-endpoint = <&lvds_encoder_in>;
> +		};
> +	};
> +};
> +
> +&display {
> +	compatible = "tianma,tm070jvhg33";
> +	status = "okay";
> +};
> +
> +&lvds_encoder {
> +	status = "okay";
> +};
> +
> +&lvds_encoder_in {
> +	remote-endpoint = <&dcu_out>;
> +};
> +
> +&lvds_encoder_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&panel_in {
> +	remote-endpoint = <&lvds_encoder_out>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> index 27a55fa638128..80dae0c09542d 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> @@ -147,6 +147,7 @@ hdmi_in: endpoint {
>  	display: panel {
>  		backlight = <&backlight_dcu>;
>  		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_3p3v>;
>  		status = "disabled";
>
>  		port {
> --
> 2.43.0
>
