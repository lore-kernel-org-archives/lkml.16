Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616E5C603;
	Thu, 27 Mar 2025 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087383; cv=fail; b=T5RHOiz8fAM9htvuqQBD4cYPtlWioWCTc/ikfXOXkTUxwKoM6FLodO157qU3s97xOqVJPZ2qjHhyLfwAxBqb4EqYK4XrmnfK7HwirPigtsqxsK/qeBpWHAUbknQM8QySvoamzhvpljSnHIjXULEpNEAPKPx05yK91KuczNaiiew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087383; c=relaxed/simple;
	bh=OprZt3Q8VPjz2QxyxvmbGLjvMS1vxyIl6ZcNrlHlO2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R4ctb4muGDa+/EYhC1DNnovD0t/w5gNjFNJs62JQWEzMkZ2lTRHBo07MYwiURV+6abCw+u75DzA4oBqvwYM6OcfTmLwr7dzh1IZlE/Q8tjSxG9zsieY2oW3vILOg11qmaSoVKrddkOAf8+mkK28lULfPYL4wNis2ML357ThIats=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rsrt15rV; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rsrt15rV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZo67WTjSiQXRyX5hG8C7AbYxKrJhv/pum4TKZOmummJiaWDGQ6kFct3AzDUCajd4tPh15Gd9AqwwD53pYSA3X65RcERFCxvslABzsKkO175NdAAPCCmscaY0hax/zs0O54cAD3zs2A2tJtEcH89UDLeHCLZfB2OsjcoN8x1fwxDneTCF49ZDf/Oy8+yXbhWgW5aOsj505xa/2IP49wJKC7b5gWtNGU9FuwzF7B/8D4EwHUlNTvr0nSERq/DYXWLUsFgoYy2of8qJW6R2q8BPuNV2p7ayWKjZnpqkvhABYy1p+n/ChMJRV7mLvHZ8ByZBOh4AJvC1kLOFekyiIrfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JND+jaQ9lvacS0TVM2E5AY12r5qU6t/i6lD9TmsQkOI=;
 b=SNZtbnVDqodHyOmTDAvgnYXZ1Ozl9XrtRYvsaciojo0L4BI0ExBWdgKa52hXDMQ7NgjATB/rrCoLFySnrAed3w/yhEG7QLY27DcDb3R1UkMUtp15ivgL72sQybUyKUhQHShFYofR4sWD6Fiu5+XIK7j93S+fZvWDvxzSqpoubJoOAj3g2EP6tFIh3PWlRLnNaLq6ywjxgiY8yEHlUXCGtHEy9G3TCq95Jn15LGUpfbhLKXz/qkzGHLy9k7xcbgbC1Sczv1tZPLnOb01UtMQYs7i4OtNOQhm98izvTDe3n0LZ//yc1howS6PqmUsJA+pXC6YcddNBSOHOT1XwLrmWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JND+jaQ9lvacS0TVM2E5AY12r5qU6t/i6lD9TmsQkOI=;
 b=Rsrt15rVGFobyPRt/Ik0sP64kNZ5ZjcwsGfJukLyRzuTD6YJAavTeWJju20SNWi1WZBc84eHOFkSmXlnOM3qzptJ5mP/N8Y5ji+C5evPnq+Eb4078EpU23Qr3h4Qqvz7wSwxvrcTZ5yEQCUAQpeFUYKGbp68xiwCS9YVZvwz4nHfv3occ9ShjzTSQaGWAQDQfXu3YxNXNXI0NvLHbz7xlyZP1BPgI+yZR8UZkWdGv7acAwZrDJpt+x2+hyKC5goKQsjST/7KvbR4x4aZKZlLZdCifW8iElsv+AQ92eiN01jILioXYEaiVwqc6dux5lhTJovrtXzZrvA7xNUbML6qKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11133.eurprd04.prod.outlook.com (2603:10a6:10:5c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:56:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:56:17 +0000
Date: Thu, 27 Mar 2025 10:56:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ARM: dts: ls1021a-tqmals1021a: Fix license
Message-ID: <Z+VnCi/+GZQ716uw@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11133:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3b9e01-5d6e-4076-80b2-08dd6d3f8738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lNb8GvccfSzIUZ6SMRP9I7lfUSeW0qcPwBKs0EXgWBv/KER4R5nDG9gE8sgt?=
 =?us-ascii?Q?giCJp4j63ll78lQzUj5anBBifid4sT/thYVlGdPuzxx/S0Cvo5gK5Swt5wZg?=
 =?us-ascii?Q?t9Awrt9awAdkXqYbq3iRzpc8gw1yJbTXIuTW63RmUiV3j/RlyGVG10JpFH9b?=
 =?us-ascii?Q?FEJBIyiYQfMRE9fKmB4L+bnXbKwmPg/Fx4UtDspasVpyg5dhftzwxIG5h91m?=
 =?us-ascii?Q?ePU75t+WFA3u7JxI1v5D+47LxAtq+U043BgIDAiQZbTSPja913oL+irRAibZ?=
 =?us-ascii?Q?E3p42I2Bs4faAl3SqqyWhtXTmAdNBFJKY7KYyu0PbF4+vfxvjAPSvOSfrJfV?=
 =?us-ascii?Q?WGSar1BuWVNHuecCi+XAxV2KH35CeDBKsRVZpPYjMs8wPaHcNvfPCL1SysiB?=
 =?us-ascii?Q?4wTvWhm6+bmQ/qe47rm6pMKZ5/pJTHZ8xZcexBUGMkEvM/kxPej/M4cFzW6R?=
 =?us-ascii?Q?jmWJHyZ1M5CB20vipU2LyyaTtDI9L4YvbQ2066a7EI021cMrUSLaKzwQopzU?=
 =?us-ascii?Q?yCy1cmV/DACGGumfzxbOrpw6a9u+B5nBzt+SxRPz/Q3/RO+naZ66yuOvcEoP?=
 =?us-ascii?Q?yN3pGuEfoHaKj28VugeGoMnG4WABAQwtnFiskk5GOe1mwGzUxo+ElEtv5KPe?=
 =?us-ascii?Q?9vLAkKuHQU0m9SWlJPDby1veI2pBp7V/V8er9UY4U+bNAST6qFEsoJ1e5pgH?=
 =?us-ascii?Q?j10/JrnVghMW1mfVhJYINsvhTX0U12jrHldjyHVAgkUWxI7qa84631qpZNR9?=
 =?us-ascii?Q?1Pzr6KUkcgwxmUlPlFcVHqYbggnIQGc9g2DFdhadrEwQq9yXGc7KN7ICG2A0?=
 =?us-ascii?Q?HVAQXEKAQMZ/oL47y/R2/aWuX3vxhhaOkyaD56lnI6dkCk++y+ththJZ59ND?=
 =?us-ascii?Q?SWn/Yxa7hKeCSorDHnh6UURyGPsds9pix3yghii4hc0PgKxnLRo+zU7OsW0/?=
 =?us-ascii?Q?GB0g38xyWxlecv3+JyXaWhI0G5AWDTdqJxMy+OnaIjpaVd9dmFbiz57CQ9VB?=
 =?us-ascii?Q?7h4oNyJws6ratiWckibILzZ+wE69F+4zIIJxTK9MMH7I8DpIHnfVBJcr43ws?=
 =?us-ascii?Q?tPhXaZip17LpOa5neXeXOQVO9r9zhzfUc07CvJvlLpbUJUBt3nnlFtYLnmJ0?=
 =?us-ascii?Q?kMZN6j8uxEm++iFrsmaLj1gjHEX0dg3DVCV4l/Es4edgVbx8O97RSQ2fvgLD?=
 =?us-ascii?Q?qapZXMqUnzzdQgt1AeVg1Me3gA17E3/GOL4Oj0vxl0bH7HiUt28mfrJIb9TZ?=
 =?us-ascii?Q?7+1hj+RhFjrTxHWXdyRk+iVqevitr2uYPx5trKa5qDyILHfgPQRQbCX7U1XD?=
 =?us-ascii?Q?V+yv7yWhz+Tk2UC5Hoj4DcSi6R8P8QzBlgNPGHrlOV5ghD/AAZOx2XP2G00g?=
 =?us-ascii?Q?7OjA1fmavJeAwu44EpsYJA/VutD+AOS+XYwIJ/hGPCm/dSfj1nrgtgt/PCUF?=
 =?us-ascii?Q?GXV6Exn2MJkxbTvU8XdcXlTVBr+sOOGo0lRryMdQx+cd+TE2qUV9JHx2aOBZ?=
 =?us-ascii?Q?EDh3cU5/qL+ZboU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v8f/vsj0fP1wMz2dl0b8T8M4nQXufErS1g5KqpsW1OU8uCHdZ0/gf/t+wST3?=
 =?us-ascii?Q?k90H+4V64M27YDiP5vCCTEuPGoFWjvfaEQH6a5/uQ1evd+f2fBkVUtljBfVf?=
 =?us-ascii?Q?1nyQX2cv6UVPJECAf8HR/xVxLOT6rrqQfx3pvFTHnZ/YvNb8CBQ7aj1Itq8q?=
 =?us-ascii?Q?rN9JseEQatS/af+6UAPq/bQFMxZDA/l/zLBUpK/qP+mlO8WEwtLG1u01XzWA?=
 =?us-ascii?Q?nno57YVRDKYbseAZLXBX5ZET5W72qvcmeYNIrNhNlSIRIMEWA/V5NxnNZDhz?=
 =?us-ascii?Q?dGv02eXhXrvmGqIqhX4gm2Go1U6ocwrHHpzVtVGfm4WNCTLM7bOuTU4SskMX?=
 =?us-ascii?Q?khuRDG1UdDrsPfcw3KSqaAF/v/PLA1xCPUrVpsUqAQ71QTWUdAADOPniFKLv?=
 =?us-ascii?Q?NrDisa4MABxvijeigIwFO9ILeuEwftwPSFXQndjD23kVLivSzEgPZ9TnS869?=
 =?us-ascii?Q?3FlktFtZuYJVKnF+tvmzrkUC79BqiZMd2oR/VVCz4qttIOq77glyiSExNOnQ?=
 =?us-ascii?Q?qH5gDv0oPt7WbIr/FMIjuZlIpJDdls/kV0mbZ3GuWUKIEK97ZV5ikdzJBrtU?=
 =?us-ascii?Q?uY2W9eEWgTsXpYd2kJWyWungZGoreIfRPoAqo4j5ItHq+d+UhF+wyV2rFse7?=
 =?us-ascii?Q?4dJ3yMhy2DAgSzgDKD7DoziqcPOMnCnlCuNBizNxK3uPRPs3zaRI1GM/F66r?=
 =?us-ascii?Q?MQ68iobTghzJSMDsDCkfpcdMkwDJl40HupqDqlXdt/vbGm6FQTFNPxtNXlUU?=
 =?us-ascii?Q?9noaeUlJLzrIumRzM7xA9CLIUezvzhNRAWh6ymtG1efRdABXe/BajfnZDW3Z?=
 =?us-ascii?Q?PNiIuhSacAnD6fWzPOi8wCZU1cTQaTsirqSzogR/05WfadZdS1s7Ia2Kmogb?=
 =?us-ascii?Q?OvAZGWTRNtKuTGjXiMVnOKNRxrlNCBIX09URkqD0LNdENRPYjv0Ki/5v/kdX?=
 =?us-ascii?Q?VL6fXfCNNORVejNu7RRW5eYJ88JiTFf57+Wry1JmhAo3EbkCwUhyZKLoZo9e?=
 =?us-ascii?Q?rZ55gdGjoBULCrUgvnn1XeeDgSBA3xQ2Zebx3X/dxYEqRKkYj8D0uYX9uu4u?=
 =?us-ascii?Q?GwiSRj0aTyJqebdmakDipRitUMhD3WXlTMQ9LtTOkoat3BiPOVg5eV3klZPN?=
 =?us-ascii?Q?HJl2fMhhEDtz0bl2Y8MnmjJ87B2lBBajqO6pFeZxAxwXmAIBgW8oQyD4RP/y?=
 =?us-ascii?Q?P/2L1FJT4gikTqvxbmwD7JUwQBoqiVh39SHZMKWqnOKgTNnGNC3QaeR+BLD3?=
 =?us-ascii?Q?Sf+a4143zyRphyB74qWvUeybm8bSdQLWpijr+jv0F6ZmufuqNuFvLPkI8OvZ?=
 =?us-ascii?Q?r9TcLN+LndemuhRCNZ2YBKNRz/L/tVVuMDZ8HPLaw01zviLRixdSNTG5ITwt?=
 =?us-ascii?Q?lXi049inX0RKMG9uXjWYoRO2CCaKxNYvS8C1oXn6/jPaJo/SbvIDo8fu/R5c?=
 =?us-ascii?Q?PGPGWhlfIepgH7nAxwIfMoC1iuoo29nJnlGNnR8rP6K4SMud9b/hG+dbAMEJ?=
 =?us-ascii?Q?xu28vjh6bz4IImAxVRARWbA1pLTUPplrfFDtR832ZUNbSolQ/WUASuz3K72q?=
 =?us-ascii?Q?fAuso0A2Qr+KtTdwNV/QozOS/vZjP9gzMp9J8cPs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3b9e01-5d6e-4076-80b2-08dd6d3f8738
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:56:17.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJZ9mQPXS46l5zCP0GHF3hKDqP1QYohK+G5B06aBPv+rdA4GxrUm2NqLo89c0+WtBEBf2zuZhBS1XKf9vYjfQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11133

On Thu, Mar 27, 2025 at 03:41:07PM +0100, Alexander Stein wrote:
> With commit 784bdc6f2697c ("ARM: dts: ls1021a: change to use SPDX
> identifiers") the SoC .dtsi specifies the license using SPDX tags.
> Fix license according to the ls1021a.dtsi this platform DT files
> are based on.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> index 34636fcdfd6ad..27a55fa638128 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
>  /*
>   * Copyright 2013-2014 Freescale Semiconductor, Inc.
>   * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
> index 1b13851ad9970..f7fe8581a23fa 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
>  /*
>   * Copyright 2013-2014 Freescale Semiconductor, Inc.
>   * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> --
> 2.43.0
>
