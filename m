Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9992E28853F;
	Wed, 28 May 2025 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444776; cv=fail; b=K2+00cSXE00oQPxuA6hv+P0DE37d6iljCEMdWE76ghNwJlwcNy6N5nONq60zjWXJz5MBDy0EA0G6FiQH2UoZ3ZTR6gpwmgAASA30X33g5BoNGOeC8MfejnyN3M7328ANqFTev8kH6J0vaVMSAFf+/PWZ0Ubqrsg7KDfgemxJhms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444776; c=relaxed/simple;
	bh=jEOk6/2ijgzKtUB5qZ5umH2MnIaVg+nE/NGijXmR8Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FmyypLtfdHX+Y9ezLNbEP9xf68OEOGvEcdpPKVilxoZBuV3/npmYACYxjaEqxNoJYx3P6bY2PmHOci0QC5vSwrB7kAT5w9+tbD8SNuC/8sKmmJ10CIQ3rnLyL4Gdyvjfpe5v8Hxelff6Knqv/9sORnJnv8HZwloSlSI0vlWJB9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cg34fN8w; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cg34fN8w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/f3+xfDZMn3PftOtCIjY1NQ8C0PiWyfM68LN5+qa7IvC1u7XR42I727Ef9dfCUqQT4mXNRYHvHjmVa4/iErLoZ3XtB8Gi4rUqGutsCLloOQzi33eeHcukd/GnPVtXtAsx2R+/XI4zCj1XQLRsZqeJ8ebUFmu1LW/HOgOZtyB3LVF5C3bk5g/VVjYIgFTipeBoZ32oAcRDpRuAV/SOvU3LSZJOiK90T5Npcat5tOPYdNzhClGOFBhRWDww4mg6PmYbD9F329+pYN/u42xcGgrJZrd//8zJ1eqsE9wGE/3Gu6MhFIRQISgM6ZFfIkA1YL3DrEhHC9kNpAXPCUBteR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEpENQkMBiFa5w7hpF6Y7z/IWATZHxbWcsL1+Nw+Pp8=;
 b=J0usnPiP+7mDcNIcpUa+KtQxkpyki7/r75WRTYYvm+Sp6feAZohVbhnavAzVEj9q/wXd0ZfxUPFLKo2V6nVbU9yY8s8Wq7hyfJDMXHAVWCRfYxW3L55YbZnvqURLOQBK43WGHQrxi1f2qUHz4Ven1x/epz+P7wVbL7uwLApaT4PVtAWIxo/BZ9fgP+AXCYCYmobEgi6VsRsnYFKssGyj/jUeje5X2ke9pAIfd8P8e/mRDrB6qcNPbX/uYyMEJUbryQJry57EOM5OW467uFyjgc+ZE462C8izkG8mK5E9IXudSi2SUhKnXwGg+KJxVetFV4setioEYcOA/UGzaRGusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEpENQkMBiFa5w7hpF6Y7z/IWATZHxbWcsL1+Nw+Pp8=;
 b=cg34fN8wZbUm9eHh6C9DKY7zqT1WhKV0UqQjZo7OrErxKFllasw+eIV9w4k3qpVIjlSBr11l9LtQP9ZZKo23dx8CESOdRZQcbTCQcjN1ZW/iBhv8G+fMTywGKc50n3jGvAl2M3F5SsorbxRu3GP+FpTbpxG7ttGQEnn5bLkkPnacRbIdlk8oxnDDfViBrinDZ6JmuvxCAOFvWC8LhmmczOxv4rq92Wn+ljtD2zjpEmR9PNr1xvG+bfRYcfl9bmEqMDBbL3fEUF9Cg1wdlyvcaHgCH+XtK7Slsi0z0dlQ6vvYyb2wZE8MR2H5NneHAb8Jx/X0Bjpn7GAL+6ztkZVXXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9574.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 15:06:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:06:10 +0000
Date: Wed, 28 May 2025 11:06:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <aDcmWddO3+q+4qI1@lizhi-Precision-Tower-5810>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c33239b-2260-4622-48ab-08dd9df92df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tV4YMiOXCoEXgNasUlOfa/AMP13Td/U4Und9E/0TiTKm1j+ehnVX8P7skRRB?=
 =?us-ascii?Q?kLTYWZMWALnOtoA5f+Ec/uJtUcpjJyxCGkDYLrDEva38dXsYfjAhJdkeVNZb?=
 =?us-ascii?Q?J9x2M7iEF+pmKzEsM3d0uRhRFm1tF+0doCHJf2vwxFwAp4HFqbjcvEjfy1eR?=
 =?us-ascii?Q?4lks2rXZaws4GCdzjXKwady8sz9Cymh3JpIYr593lFyDQ8Z0MRHKZW9HRSRT?=
 =?us-ascii?Q?HWiW1HK0Do70+pujLv5tNoHJE/Ldc7AGaPKRJi/zv6eHeGlVhwFRTiOrTMKr?=
 =?us-ascii?Q?caM/ibLOVWSRjTwkbU/Mn3eaIpL1Acp54f95fBJ6hOi0TZCTuO5G4/GSOQix?=
 =?us-ascii?Q?Lt40lXWH++vDALP2jvZTLNuyuv12xLrenvRkvq+Ydbo8BP/wPD67czf/9k52?=
 =?us-ascii?Q?NBBCHRtWwSkoDoxRzOtQjoXLbIKRz0LjZCNb7QNNm5jWbvySgrHubhTAimpr?=
 =?us-ascii?Q?M7Jd4ss+Ffpk+i220biX8Y2wtGzdXtrN9AkryZ7w66U1mfQb5OO0tOtDOpkr?=
 =?us-ascii?Q?pDxi5x9TyIapa8k89OxUrvGhF2Hy/ep3QYlbYzzGpiaufLzAWKnVrg0TeDdI?=
 =?us-ascii?Q?lMHoTd5sekTBWK+30tPyT3wIv1M7ptIzzWFuKMkg1pDPn50vADOThGpuQnPK?=
 =?us-ascii?Q?vUbRwzdY+eiRibHXWqAQ1krt6/iIpk2zW0fT18/k08bxrC5I06ZqQ19PTp4Z?=
 =?us-ascii?Q?NGr+FI4yap0TqymKDiId3mRNDHPaIftxhdqzqQniCBOHsgzgjfzvFZsauFBh?=
 =?us-ascii?Q?++QjQFXJAe3UCtJhz7vijmzMrkLxwcpigGDsQyb6rcpGEtVuoYTzgOHiCHsC?=
 =?us-ascii?Q?qeLR5IbpwJiFVF3qx3wzYUGANThpXuIGL1yHtZo7hhsIgK54Q8bYmUFBX2Rc?=
 =?us-ascii?Q?oWUz5yaJw2YcPQ86yLRy6xOjx4boz3hxZiRhMyO1wOvHJcN63xlHrP/7EgCb?=
 =?us-ascii?Q?rf/RKZY46tWakmQEuqopeuGBHiXTnRtogjyBTGOw/1zaeSY+uh5dXXYTWskR?=
 =?us-ascii?Q?5nK8a/Nw25AQUEFNrI1fHN2QNsEa2Z26jinE9gT2Gnd2136r7TA6ny9rO8iZ?=
 =?us-ascii?Q?mCY0oJk6LCc5lt6dUqOq4fj1SB1vBu6MddPxQXsp2CkVNn9CaLMG7cNtqW1B?=
 =?us-ascii?Q?VzxtAwDRjNSXrkuIKfrHOrgcCpJFTetL0pdHMdgsKv6f3GCabVFmb0o0T+rR?=
 =?us-ascii?Q?h8Fi0UF+J02Jjg+K2HYw6JXp8Y6r5i37ZQtbKRquI0XJ/pLaBLTYMpyPRvwc?=
 =?us-ascii?Q?6aID1efmTeAauRTGt+76xkvYn3OojunUSMXaJoqLdMmfUBHqP5zseK93Y7eQ?=
 =?us-ascii?Q?HSpULprRT8Ls/WTCjivgDKun2xNDwrbUKFigvQ+ViRrOhIfRSybEInF+IaPE?=
 =?us-ascii?Q?IfyTXZhOKEOg1+wk99eamYflvLOjddkgSgjShN2iGNGMI04Uny2W1E4+8tIh?=
 =?us-ascii?Q?Dpzr3MTyz0kvq94pwOhhEJHDGL9ZkpA7XikEhbadVoVdbN1oO3Y1g5NLRtj7?=
 =?us-ascii?Q?KGUBSfgEd62bvHY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SKYUWg8rozTYCN7sqW4cFw0cz25CRXyY++B8iayODnD9MvliMNZVHjzQH6bF?=
 =?us-ascii?Q?gppvxjCo5H1UklL8WSM7vYtqu3lOmd7+gtDmc3eHHyWfsfmVkC3iDPiC2YFQ?=
 =?us-ascii?Q?rPjUNrvTZHe8vJ0gnxqbs5HcDQqbvuwcRJWhE9Px3chMgLNDub4A5OwmBW/u?=
 =?us-ascii?Q?zuUBvP3qszJl4Bsb06GqRyYrYSNbvtfSzBAQkBY4d+vDkuaLB9ZuZn+mfIF+?=
 =?us-ascii?Q?HTNKEY5QlAIzwoioFY029i/bzXZwEe4bi6zqOu2bBA4RDuRVjSIx+dMbDmIh?=
 =?us-ascii?Q?dNeZAHVkDLJYtBdScoxGooEsSFAJgND4tEoUHVf8lQy5cwAwo/Rn/QhTgBe/?=
 =?us-ascii?Q?Bw11FM0WQg1hhCJto8uX6cwbI39hnYJjncGubzyZcEgPJ+VKMSQJCzPR8cfx?=
 =?us-ascii?Q?u08D62h8OQKCVNMxz0hoECHJMf89KZYzVzLY7Ph+pdVnwwzn7LXxacbkRIwZ?=
 =?us-ascii?Q?sH1y7v8saYPsNUmTCCV7Ngv8B59agj6DqnuBequTTyx0SVEsSJ4zoY1qpO2Y?=
 =?us-ascii?Q?iF606Kcik9FMfQOxwn7zXpKkqobJg9RKZlYAA5BALxNl/uhuZ7xlRzDgo2Sr?=
 =?us-ascii?Q?zMxW4mlFOrqdmDik2AXtPTXXaGe0FsVT+q57VnpVDu+rpAG5yCOzDcO2WBeJ?=
 =?us-ascii?Q?eJSDvrw6bSvk+cEy43X5WYkwjlPN7bxrxC1tLJR06zcsLavy2irB5bZAa31s?=
 =?us-ascii?Q?FYvp+4khnMlEovMqfixkehD/322TOqL1sLpd1wD1ItP7TuSpgz/BqpeIb62q?=
 =?us-ascii?Q?tUsbsWCW4B/bET025BCdLn6ue/a0WjbXA7MPhcx1+QO/n6kYQKkbvIjM39tl?=
 =?us-ascii?Q?wF8qWW2II0afXYX5djbV6DOquRVmePqPbIFWxg+mui6Utz3vWhfWq7nh8fwa?=
 =?us-ascii?Q?IrJ3H4jkMPqEutkY9c3BPmAkgIUYPNTCihyE+05yDLCxCRwX3J1AhajFap/v?=
 =?us-ascii?Q?ZKsDYMoCwurmpthOK5u/aHZ4iZzP7QNm9JaaMEqIHfMyNBke6GO8QC80AVzm?=
 =?us-ascii?Q?38ZgRKAHbKdFFK9tAmWTIHFZejOT5tLGjLp+pTF2nyX/bKNXbh1L5r4R9Z3N?=
 =?us-ascii?Q?B2B14ZV7AJPuCyG2tzvzzLbJPWNCdvWAZ2i+wiEXbRUlp2p/rmDW2jUKOT15?=
 =?us-ascii?Q?p+8+7wnPFq6fM99lAR5hw1nRr9QkCD08V7NodSd5bRKoXBn5ORsJqNDxVS1M?=
 =?us-ascii?Q?B6Mjg28JM2eGPUEy+14a9+fs2I4lTPDdAGGeOdrMzGOW4/I+qhGeRCkId7EA?=
 =?us-ascii?Q?EsPsXwa7PsfC+B4XzRX2CWfy9fFgH0Nj3/AfaW0viBhHdsuM7EnaGoXxCvq2?=
 =?us-ascii?Q?avnUlV+jurl+8queHrCvzco6ATHgDEyiqJhj1RmsSXoiWixsxJWXIJRwyQe7?=
 =?us-ascii?Q?M/+spZ83G1AuVEuLepOf2Lfo9L3lf6sUUBWQE13WqQi9M9QKHiZauMI3eu2V?=
 =?us-ascii?Q?iRikldqUoxNZ86YrLE9EOkZkyKmJfLywlk4Sjc6kLPaE+RhrjCWFE/y2wBsX?=
 =?us-ascii?Q?gbOGnRS2RiJSfgTaOAtBFfAPTBNFo9tWJ7oyAl278A09hC73/28nMV75ZQH4?=
 =?us-ascii?Q?s6hXtD3wDMVeWcdDZm6IDw1kqBF156FkpCFNVp39?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c33239b-2260-4622-48ab-08dd9df92df7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:06:10.2940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nekdkpOFoBvkQSfZ5I2op8T1HGsG2HBqR3s9NO27L0s4iSRL4M2cp4CTzRpC6KgO8vVXiPBF7vXKiT/7higKVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9574

On Wed, May 28, 2025 at 02:11:41PM +0200, Dario Binacchi wrote:
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 128 Mbytes DRAM DDR2
>  - CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v2:
> - In imx28-amarula-rmm.dts:
>   - Replace '-' with '@' for the pinctrl sub-nodes.
>   - Replace edt,edt-ft5x06 with edt,edt-ft5306.
>   - Drop LCD reset hog pin.
>   - Add correct #address-cells and #size-cells to gpmi node.
>   - Replace edt-ft5x06@38 with touchscreen@38.
> - Drop from commit messages all references to LCD display.
> - Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
>   json-schema".
>
>  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
>  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++

please run https://github.com/lznuaa/dt-format to keep nice node/property
order for new dts file.

Frank

>  2 files changed, 304 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
>
> diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/mxs/Makefile
> index 96dd31ea19ba..d72ba702b6fa 100644
> --- a/arch/arm/boot/dts/nxp/mxs/Makefile
> +++ b/arch/arm/boot/dts/nxp/mxs/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
>  	imx23-sansa.dtb \
>  	imx23-stmp378x_devb.dtb \
>  	imx23-xfi3.dtb \
> +	imx28-amarula-rmm.dtb \
>  	imx28-apf28.dtb \
>  	imx28-apf28dev.dtb \
>  	imx28-apx4devkit.dtb \
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> new file mode 100644
> index 000000000000..5daa9e22715d
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> @@ -0,0 +1,303 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +/dts-v1/;
> +#include "imx28.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Amarula i.MX28 rmm";
> +	compatible = "amarula,imx28-rmm", "fsl,imx28";
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x08000000>;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_fec_3v3: regulator-fec-3v3 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fec_3v3_enable_pin>;
> +		regulator-name = "fec-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <300000>;
> +		vin-supply = <&reg_5v>;
> +	};
> +
> +	reg_usb0_vbus: regulator-usb0-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb0_vbus_enable_pin>;
> +		regulator-name = "usb0_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb1_vbus_enable_pin>;
> +		regulator-name = "usb1_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 4 5000000 0>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		power-supply = <&reg_5v>;
> +	};
> +
> +	beeper {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm 7 100000 0>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_pins>;
> +
> +		led-0 {
> +			label = "status";
> +			gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-1 {
> +			label = "x22_5";
> +			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-2 {
> +			label = "x22_4";
> +			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +};
> +
> +&auart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&auart0_2pins_a>;
> +	status = "okay";
> +};
> +
> +&auart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&auart1_pins_a>;
> +	status = "okay";
> +};
> +
> +&can0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&can0_pins_a>;
> +	xceiver-supply = <&reg_3v3>;
> +	status = "okay";
> +};
> +
> +&duart {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&duart_pins_b>;
> +	status = "okay";
> +};
> +
> +&duart_pins_b {
> +	fsl,voltage = <MXS_VOLTAGE_LOW>;
> +};
> +
> +&gpmi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +
> +	touchscreen: touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
> +		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
> +		wake-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&lradc {
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	phy-mode = "rmii";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mac0_pins_a>;
> +	phy-supply = <&reg_fec_3v3>;
> +	phy-handle = <&ethphy>;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			max-speed = <100>;
> +			reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <4000>;
> +			reset-deassert-us = <4000>;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hog_pins_a>;
> +
> +	hog_pins_a: hog@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +
> +	edt_ft5x06_pins: edt-ft5x06@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
> +			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_ENABLE>;
> +	};
> +
> +	edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
> +		fsl,drive-strength = <MXS_DRIVE_16mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +
> +	fec_3v3_enable_pin: fec-3v3-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +
> +	leds_pins: leds@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_SSP0_DATA7__GPIO_2_7
> +			MX28_PAD_PWM0__GPIO_3_16
> +			MX28_PAD_PWM1__GPIO_3_17
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +
> +	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +
> +	usb1_vbus_enable_pin: usb1-vbus-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm4_pins_a &pwm7_pins_a>;
> +	status = "okay";
> +};
> +
> +&ssp0 {
> +	compatible = "fsl,imx28-mmc";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
> +	status = "okay";
> +	bus-width = <4>;
> +	broken-cd;
> +};
> +
> +&usb0 {
> +	status = "okay";
> +	vbus-supply = <&reg_usb0_vbus>;
> +	dr_mode = "host";
> +};
> +
> +&usb1 {
> +	status = "okay";
> +	vbus-supply = <&reg_usb1_vbus>;
> +	dr_mode = "host";
> +};
> +
> +&usbphy0 {
> +	status = "okay";
> +};
> +
> +&usbphy1 {
> +	status = "okay";
> +};
> --
> 2.43.0
>
