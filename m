Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788D1E9B3A;
	Fri, 27 Jun 2025 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052829; cv=fail; b=KVo8ofQOoCFqHkXrJCsLgAFQqmBK0VxqujxZ8HzcHXViTI6XiUJ6nrQICTfw2orTDb3+tzOT47qRErJa/Su8k20gSsVEgaIZr6s3UEwQMg4DsnXjAk9ukUTaPxPFSeWRh2+w8OZy7HOJCcq3S3Xo11JG/YaY6M8spw31hoDS19o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052829; c=relaxed/simple;
	bh=gkh6NSMoQiT+Lh5xibHYCVc/dBDsjl3T+hBhc6sNrz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RF2/VhCH/IMs90xlKkrb0wgv2iiESleRmksbsKxyAxVHUcGoLScTSohpSgl4dASPnQQsGE9iVd3vWoyWVwc5BXqUqSM4BMPbq4EW8Yul05lCHc/BGQh9j+RaHb9f/1/U4woEriqkEa39B8W91HaxARcJd7WL+w7oBKaVoqx1J6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HcuGoMHO; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HcuGoMHO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q877rsX+Ax5f+/hM1RBvRSCcdfvyJZpPlybvJ7ODnNTzruXSGBqLwa2Z55kK/vAqxZfD07ODdYTSiKfXuyoeorp+f9MFv5yfNZCtd9hK5YZd0SIsHy8eOL+Wi6AWi3+s/Q4aimW8NXz/bO934ETJe8FUFASHoMmj37uBhwScedc5A1Fj9S1pw4l8Rei8T9fgvukuQE8MAuyA1e40+lcvrZe8JtClaoc5GcSKhC6f+B/94Z3TEj9vxG4LvtabBJsGd9rzCx+9okmC5/Jb+phl7CVrUfCKFeo/3IG9aOJcQH+5/ZSXQ+lFnL9RXuh/cll+FuaYqKLLYb/cYrwmjo7dwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhPwNoO5ZH28IzSArLRZRwUMuLEa962JWq17ET+F/JI=;
 b=uLOtQdR6suM77O4zGpMcFZdY57YvaPe11Gac6Pr4DPrxiFE9sEbCIH4uQEqp86B64daZYj9no9ktFNDPQd9FSUBFsImtesfugx5VtstR3wIvWdv1UU4V82/EMtoxsPDXVkrIlUPE1PXou2fr4WUn2rkIulqvkFXniVsKAnHhm26QYWoxfHv7/iEftBAAVxdtamW/uMsokuT6i2OVANoTYfEw1uRmQhE6IkhAG11HICUOgZ8yxlSCX/4hwr71P8zMMT4gEOZllalqpBsCDRCc7tRhOKcKvQ0hXTllD6vzp/OiZy0llpYuucaqIbkgLMECGBJGoWmwTuNEIj2jX05Akg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhPwNoO5ZH28IzSArLRZRwUMuLEa962JWq17ET+F/JI=;
 b=HcuGoMHOmRY85Uc2h6qrRVyoF8lgF+xcE7f45HvZlAVDemRcILSiOVzQ++FPX2OKU8fGbJ8LKi+bveMFwfqxsCtFuQJHTIOuX79+4rwMEibyehBnksFJ0ZG4Q9Xj3a+wxXhNH7QIlkliZGq1tAUi5q7rIJ7h0I0Q3AZBc+Sd6pv7sPwM+PD6npHSGkpvp4F0cnel+FbjcIeQYe5DRcLWU0LLUARsBstQuj6H40ddEhaXCbYT6jMYhmWP2LBaKX7SpUasTKZOUnIaSUUl7sWQF7ExJLhmEa43mpDUInPOZ9eebF9BNO4S0TAAvOm/Rr2xBdm65e4kC6jQ7MXbkIiS4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 19:33:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 19:33:41 +0000
Date: Fri, 27 Jun 2025 15:33:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Message-ID: <aF7yD8hWDq8KF4gY@lizhi-Precision-Tower-5810>
References: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
 <20250627142645.134256-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627142645.134256-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: AS4P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 43302980-5703-46d8-e0bf-08ddb5b18580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?akL0xxFd1Jxc+2sRDJz1ICODOPXLWEiVoLg2Ta83vS7RO3jtRQ7Ly7AAc6cD?=
 =?us-ascii?Q?/EyrIGziBPQjAFLPAe8UZRJqprVYGvIqjpPPF0R3qhEesfl8he7oWXXZaThK?=
 =?us-ascii?Q?i+IBIYMjCH75IIJky+tx7eVFqmd/euAK3xbBWAABgbIhIQE6CUitF4SbnXii?=
 =?us-ascii?Q?/iqRRU7olnnypCZs9wt7Mr6YPW1Sy0oKvvBaojPc22JEUew1EvYVsixO3auj?=
 =?us-ascii?Q?wG5vTcnNU1hoUy9CHOoaVHgIgN96zm6CfyU5WQPANmJHsEenAP5VhJQbljIV?=
 =?us-ascii?Q?/VWYFUefF5qc+cl4ufLDaO5bSpIkDOvFykXiOjCPZujqbrynHLhBDKz5KUZ5?=
 =?us-ascii?Q?0mA0XvGAAc7INvyESo/77MJlo2VtypyUaK8RhUccaqygDLCXKbhp0NSmTKTN?=
 =?us-ascii?Q?X0ALqtm3jP4Swr3OkVZTuNJMpPyA6oqgCa+MFwbpBWSDpOWaf1PhGJ/uuWyW?=
 =?us-ascii?Q?p7j/g0PhEq96IDu18t5tim7nTJXfOG+aTaC4AkaQh/vuOKxEEC8lgICh7B2H?=
 =?us-ascii?Q?UfUQFq55USxMxQyHNObvp/rcg5HUPPGhZ2bODcZ0gXiSZDjoCwXtAxlts8XX?=
 =?us-ascii?Q?zQLkl24gZhTwzRsqgTUznx69Zhh/WDJdf89Z4zWT8Ktw2OLmes3DfUG928oX?=
 =?us-ascii?Q?KpIzFVtoWkOcpVFGnLHYDrh7F2oazFk9+TZGO4k2CwKtG31USXxiN7nKrXRT?=
 =?us-ascii?Q?684jwTfudHz2G3GKCU5t/NHI1KPwEYYWajZgZceifkNupQ05Y0xqbkDdmwWD?=
 =?us-ascii?Q?aV7KnQGE5DsOhqTKaqb/igyrFR5pUypMZGggUldX1Y2j+/rgXeXdOTkBwXON?=
 =?us-ascii?Q?gZhzj5xJj1hmob6q0QsQQJgK0V7b84xytdZT5+vZmQPCFWlk42JZBiQWzCcl?=
 =?us-ascii?Q?b0tXOgTfBh5sXExKm3Vz2raIX2gd/ot3+wdVqfSCsM148DAEOMl04PCp/3UL?=
 =?us-ascii?Q?X33rc9TYklCI30yJs2gz9fdSmPJJBT74wCskSNI+/l7k8aGs4Iv9RC5YNc6F?=
 =?us-ascii?Q?CiEP1Ftq8ExnylL6CD4nB6nc0hcGwia4KPPhgwpANhexuQZ4SFJNxsAemhfM?=
 =?us-ascii?Q?u3lGgwHYU9KFhzyhi8BicKkUBNjmbztaEkXX2Bv5zNy/w3XT/7f4sFEes/K2?=
 =?us-ascii?Q?aE5W+BnqqLBE+Eo8AZAhsUvxIuDaiIX3DTbw8X4A8UyclNg8YUbFHGT/poFJ?=
 =?us-ascii?Q?CPXTb3eI5v7s17L/YiPidSDmbTDJwTbZMSIYCBRN2CnYG8zqVlGXYsf1v/jD?=
 =?us-ascii?Q?hSRXmv+RhQR+h3NB2ve4+2AJlXB1e5nuuVhB8I8qNnHnQrIbuWd3f/E8QDTY?=
 =?us-ascii?Q?IJTRvK3357ylz/vJv+Eoyb0ESkvL+0MXEvjr7nJMllrDWjwMOGhM3KkK0FjZ?=
 =?us-ascii?Q?s9dNvahF+phAJ+8yYglCtzuuLAwcNgViDaxr6CtK/2iiMEDdqRU87C2KFC4y?=
 =?us-ascii?Q?pijwVkHSsfSh/4KR9U1VQPCmzz+06S750sxlbDVT8Ei7zGW9Mir/+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3jpU5wsqSlY2w0FcPZ5FzatgTm61iVdNoR6DoJrT3JlXM9bTjCTcykchBW/A?=
 =?us-ascii?Q?ZDO8GP12N0z8H1M+ahw+MS+f7mQPlAogbrpd71qYeMrZ+B0PAt0jE+HU7YJw?=
 =?us-ascii?Q?XrzkKaZV7uIalvVn6fTosmPQuacDuZXeOe9GCjlKkrd15sJ+4BxJMvAJIe85?=
 =?us-ascii?Q?dl/LSWkUUpY0UADbDiGDM0BGKVO0f3zWbc77cBFEk7qwyAshnlgMOvnbrzMV?=
 =?us-ascii?Q?gBh5McmXWR2QExZilhLsaaMXygi6GOmCiZo2kunMX7V4PxGhP/1iiFaEfedK?=
 =?us-ascii?Q?Iz4jKe7O7D1J4v+J76/gQsB2Q3ThuDV9q/OH1K9t8UB7f1TzjPFgZihDqmgc?=
 =?us-ascii?Q?24C6mdj2XGCd+dGcqobd28I/iVKvXW6ePSeaMV8bwP6nYhCSgxHLKpBoXI7g?=
 =?us-ascii?Q?FbWTLMQVf1Vioh/JPTfu4fMNyesxFyFZ6Gh2JtuTSLjm4RPqYn9vMrYsthFi?=
 =?us-ascii?Q?De+GOZVhLTW39Ot/2WT1xOdC7j5IhOWRC18qZ5Pn05dXheiwYgk+J//jSqp8?=
 =?us-ascii?Q?julq+28a8wfPxNd/75aYAlcuv/M+bNfAyJ6nQmdC5BbLYJFek69U8vj60gvj?=
 =?us-ascii?Q?ux8irOXMe0WtoIhHgLX0JY83VmfS5aGA/FoRU99FJDFWbYlpBtfc3zew+i4+?=
 =?us-ascii?Q?QIEUQSt8UKQe3sa5z4nZBRciLws/HrK1U9oD16cQAPD17PaA4stbuxPWB/XJ?=
 =?us-ascii?Q?0XjzFVlQ4kMmlqBf2iu1RXBoizdodkN0+SmcjMZK4FpVIbcyN66oNJi0oEys?=
 =?us-ascii?Q?xcOReYLwPfQY4jGWhMOThQFvVGmeZ6XYeTHSMQvfnJBzICdaWLnEwQcCA+iy?=
 =?us-ascii?Q?CHXvENptzj2hlVG19+yX5rzqY+1W6RAVuO/v0ndI65TI8GjcSKZ7guMttlD7?=
 =?us-ascii?Q?OO8kJngHvBH/pJMWqSHvIk66BhfhpFh3zl4LOY5yZl8xY0Otg7bU0MTOGfxW?=
 =?us-ascii?Q?hcDArGM5P+2wI9b8utooNHq1dP/krcoPX70QbxXwxpvWmTuOq/CSZVGtXzit?=
 =?us-ascii?Q?wd68i2x76sR5tsYAiQESpdXjMa7jRy0G9qLsM7AcXUsxdKlP6veet6oti/jk?=
 =?us-ascii?Q?5WdpfQOKk+1xi2jQRuA82yh9qPxMd9kzYtLVSRh4i3NDwkMjPOwdPZ8UeLg3?=
 =?us-ascii?Q?r+NWjKtxTfqgxLqzA/9kKHT/zqrXGW9v/DY5vOUuNztJXZIhL1hcdo2AIYPn?=
 =?us-ascii?Q?FUJxxL9h9adzrrG1yvTV0jkVIUuTorXdqkEULik2M7/uMIXn/hfnne5ucvpq?=
 =?us-ascii?Q?7jNvniuFMF/f1Fxmrp4UbQoSwEOft5duT+CydQ/Zpgb/+oSvpoudMcmvBW1x?=
 =?us-ascii?Q?viK0knEmNqtLzJ7FpkjVt5lsjXNEiBp+Se9s95fniCJbA3GQQVhYIm809r9R?=
 =?us-ascii?Q?iUy3fGXtYHCGijwDha/bC017LcPmHHS5jm/DZ+8u9CIVuz56tzc2PWV4xWkT?=
 =?us-ascii?Q?J4uGpz/ifCCbP0dwcBoFbTYcBOZHeAckzLG2d7KrwdVUYyBurb+OitZu74mA?=
 =?us-ascii?Q?S6H8gY+rRKF7n4YgK/XicjQpO6Q4kamXvU8wf8qCQ9S4iQ3cpKq65lFcdTbZ?=
 =?us-ascii?Q?Jd2dE3nbOGkRplyJdZc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43302980-5703-46d8-e0bf-08ddb5b18580
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 19:33:41.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iymQ3KdKU0ay5jKlGBljlq3yhFq6vR6VX/LdX88JYiZF898uxaWSm4w1PBAcSg9WYGosn0z3TQ9fkKPkahO/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6991

On Fri, Jun 27, 2025 at 10:26:44AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DT compatible string for the i.MX8ULP EVK9 board.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index b23bc1e48866..0563e9522fb7 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1373,6 +1373,7 @@ properties:
>          items:
>            - enum:
>                - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
> +              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board

move fsl,imx8ulp-9x9-evk before fsl,imx8ulp-evk according ascii table

Frank

>            - const: fsl,imx8ulp
>
>        - description: i.MX93 based Boards
> --
> 2.34.1
>
