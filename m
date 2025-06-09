Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012067.outbound.protection.outlook.com [52.101.71.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7DC22AE75;
	Mon,  9 Jun 2025 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459055; cv=fail; b=kPlM7dAECq9OVV1hr33NkPFlmDHjz6X/EzsoyNQ7w2QIzThRJqWrFMMQJ2lt4xM9ZPcOknsxzZTeF673yGIXVwqyfu/6rQ3sINGnrLTHgrV4r422X3q7XFzhq8xxW1oh/5EFlt4wxDa7H70XIm7zRQauFsU/idc871M1PDPlmyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459055; c=relaxed/simple;
	bh=Jj9EbxZi6+sbfJT3BPXDVXKxPEtrAvBWGUDCVbWfKYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MRvxxWwryUkkh9RPv/8D5Gc6g+3M6a6IDAdo1SxFjKAsl8jPul8ImM4Qn8Qte8+fRK7X2oXNItQDkjmNii45nP2TTuIPMfudyAXfvzP5mhQrPWBv7TcPWaPiKyLFmdz1OGd0yBG+2YXptPlMxIh6fhKAJf5B1ZI8FbKNQDlo7bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qq2vaiJK; arc=fail smtp.client-ip=52.101.71.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qq2vaiJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coLhiS3CFrQI9+W+2PSZrejKTbmtgEA3ftPD939I/rnqzFIMe3kkWiN4m9KZYuiLjCa6uBct2PWkO27iqgkvXzBwAlPCsGjie8Nbwjgdwe2iCQbUJsldvCCNZ/6cld0rCB7Yof0CZTCSSjMY+3ChrRwcez7W3yoLRkqlB5olFZbgaB8Zly6raJ9SNyyFx+YhbfjDC1ZZ1cxptZNNWq8E41gUriPlyuNkunwwMLDPBmJ9Cp+moOre6/eKTJLMEA/q5+EgScQSNl/jI9nNFUsXI6CFcR8ucbclGaCimWInEt4GNtwLL1U1aFWLLEEgN8g4RnP2ysOlEKkEccGQG6fucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj9EbxZi6+sbfJT3BPXDVXKxPEtrAvBWGUDCVbWfKYQ=;
 b=dShwhjcYPrm6nbD0N9pteXcbnnkk3vtC8rJY6q7SDqFlmdu0xjcwgy1/vjCL7SxwAsbfBYzNSrCh3PsXHcd397DLR/jP0sQd5tVaNZ5gQEtJBbiObF6CY/RFrrQ7JQF39rRGIEaApGpb2AT5glWs9JgArsSMd35xty7bVGCOL6mmvw0RCWmjEps4OBSTGHD0kKj/pG9G6fxRVauINpq7f+O0AmOUluisKT1FrJXTIofOVnfv4k0eviVXvLKATseDAKXjuy4c8LdSaqlxSSqR7Nz8818cnKkAm0iYhr/Jdkn258Qv2aBOvJK8RGeOmLV194pQLLIEVv18BixJV4lMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj9EbxZi6+sbfJT3BPXDVXKxPEtrAvBWGUDCVbWfKYQ=;
 b=Qq2vaiJKtRW8qJcDCcaccqJaqGNIVG1RqG+AyXwmW/KOTf/gbZSA5XPaeJVyoZWJGnAHBnX1zWV88Idf6xYi4ugmcKC2v7u+RZQGrDNWQlS0uxrg6BMKw4Z7gl5Qh2bAMHIh6xlIfBfHDrukX5YDb/JFefG2UQwdWq6N0IKaBbXakvT3W/7EjZtlySbc0Y4c3OKZXYUN/tB54Dd2ROeyVUIc1gm2m9DtIhlyd0qAVHVjOyqapR08d0QKH/FqDxirHTPVRwDaiW1Vhys6d5wlT3StYwyi7SUwUQGOnU46Ss8uFWOqvKnqU8Ra2YUC9Nd8jcHho30mOqVMMYvefbmtGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10677.eurprd04.prod.outlook.com (2603:10a6:150:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 08:50:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:50:50 +0000
Date: Mon, 9 Jun 2025 18:00:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: imx95-evk: add USB3 PHY tuning
 properties
Message-ID: <20250609100056.GG13113@nxa18884-linux>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
 <20250606190045.1438740-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606190045.1438740-2-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10677:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ad6da9-f19d-4dd2-1188-08dda732bc2b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GaT7PWIFB9FZoOWlCr16BhWidP1QHjFOjnlIqUiCsVG0F9oe0tJB+JR4a88H?=
 =?us-ascii?Q?YSmMO+H1yAyoACXpO1D4iUvis2Lu6WOE8Rvqsue8GjhOG75twCjy4cDl+U36?=
 =?us-ascii?Q?UVbj3LgFIfulHl7ukOem9LGAb9DV6iroVS5CgKS11Bd76yWKj3McwQEaxPKf?=
 =?us-ascii?Q?18cnJqgXTAwGaOdV6fHkSzVIpxmHRmMZBC/estZKVE1FxNg8P4tJpD1sb0st?=
 =?us-ascii?Q?VYai+zwh8qwU4gZHJnSY0TdApAoyt4WbslwiK6JnR2rybcw9L4JG6Obk0leP?=
 =?us-ascii?Q?GlJDd6hZHqrErFo1MMxCawE0GTuaf6S6/5SDfpOlB5iUVx3F0CgTtSU3qoaR?=
 =?us-ascii?Q?5DliXqGYQfYSD3QYyjUY6wuczjpg6HbjJWaOlYJ84jemEf1UKBTyEqzT8Zkf?=
 =?us-ascii?Q?P0m3/a7ITq7kYALrqYbaI9iOSXMlfhNd5JcHbnmAD9FIlUBiuthMrfclrc8A?=
 =?us-ascii?Q?g5OVloF/D0hJhiUeG32elXhnzsY6TtwWBrPn1ce/6Zy6cqbsH5CYsVs9efYp?=
 =?us-ascii?Q?MBoJXSaV5zvRzehbEnndtpJBbKgaPEg16mz9JdetS1nk8lQNIo62BK2kobAp?=
 =?us-ascii?Q?PEVGAsfG8nCOmRyV7j0q60yvILlWrIWI9ED9lmU1ylzs6ERw31JLSQrMwT+v?=
 =?us-ascii?Q?6F5zmFJQI0+dRTbhSPfSr+UQTnY3k0Kgc5x85DorZ6G+uKH7R7seEQlPNAhS?=
 =?us-ascii?Q?w3+Ck72ezzqNFyJVW+QNzq4h7FxNlq/6PHfImPXa5eQ/Ll3+amq+GzYKgG18?=
 =?us-ascii?Q?OZsWyMUTa75dktfpvroPI6oYUOGgg7LmaBV2I3CG9YtUdLykDKRKOvmafyXU?=
 =?us-ascii?Q?7KB/jgr9HI1JOt347CtzERluTMKhxlgBc/9PxtC6HBmBRz9EPyRqea6TT+QJ?=
 =?us-ascii?Q?zuOBbhe37vkU76U1QER67gs5sYQzO2GvXX61J6VkiXCongnNQ8qkQVcuiuPh?=
 =?us-ascii?Q?/0vVOPZLQO+hSVXStlXdxnjw/wwM/Ig00hc1vo/oj8/D3CpnXVNZO+RKAxfn?=
 =?us-ascii?Q?2HRdas96cbPIwvm4BdBwN63xAAV6UmKzYqT2rCvpwiZRIhkqs5uJCuI2yEma?=
 =?us-ascii?Q?E8qh4JpRgHruGOqdkQNd3FgFUs0TOqABG0qflDw4aZljd/tXxbamH80V9ZeX?=
 =?us-ascii?Q?+UjetAXNTyLg+ZZXQmDWH64ur/rEqZoBREvSMZwoRcP1GK70J+k1nkf0az+x?=
 =?us-ascii?Q?BUsNj6aKytkkvmKhhz5IgCCovgmRGS9TiDHgbFM2K60gfyZgSmqKIHD1u+2Y?=
 =?us-ascii?Q?W8mqQEoC2h6ncL0Ntyhv5144BQvVgwlcg/xJ4AYSQUr6yabNGZat8NQrQBmX?=
 =?us-ascii?Q?SypnK8ZfQZatVfvjc+O5YnU5H4MfV3Q4+UfPlfCl7qMlvGxTzLdUpQtTWUkI?=
 =?us-ascii?Q?AloKefzeyNdpTCOkTDApCThr3mWopkIVgUUscOpLYxdyoJZAo181l6Y4/d06?=
 =?us-ascii?Q?IidNfKXsB3S5T2+Pge8yCtrkfpVrFJFo5W6QSkSwM0N+Im7jKsmhZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?InV5Ljk5wTaFbFVQUzF2K6jTq2ohLGsDfx/1nok3/jlaGIUo8tXIFL0ptyU1?=
 =?us-ascii?Q?hx8Z5DUcxaNpAKgEN1dLN7DSgROG6D+yV4EJYPu1oWIfqLlgBocFKBG3pMBP?=
 =?us-ascii?Q?qV2W/4lJFJaN1nonYIw4JlcPkc18iosRg7DStbpQhizGmPxeRdXqlepIXA4L?=
 =?us-ascii?Q?aWn7aVbyndw6pr3X3HhQ3JPTO7XLL5g1og4UfD5Qc8s4VmWiCGaRLjHbDwwg?=
 =?us-ascii?Q?mPy8i7YsfIqs4Cs7WMK4djfYX1khlIvLzGMDUn9AlkjBcmfxb0Dj9YPMN8AF?=
 =?us-ascii?Q?zNps7doRtZdj/UCT6Srfcl9egNAjhhV4cToEtkaE4tSWzrMvzxOi+wyyFn1X?=
 =?us-ascii?Q?J8p9CcqUyksj5K+AxxJLF8ghsyg3niolWlwZIQFDC/KZS8gak6qkVBZ83Zap?=
 =?us-ascii?Q?mEEYEMGsiptrUJXRtigvNbY0DFAGT2TIlo7iUrTFWiaSk7HDzZZOJUXbXAYF?=
 =?us-ascii?Q?JDYUI7dBaEQsBKEhazMJyTHJF/pSyNDXq/lScFGHutO9OKBlAellXih42T+u?=
 =?us-ascii?Q?TN/Wbmlm4S5A5n0Pc/V07NaSmrsI8I2/PBRJzuEnq2uue1FN0HIwwYX6fQAK?=
 =?us-ascii?Q?BaDH0SxS0+lRoWbvUN1UvbnhvSO5gntOfID/O505czitaBxBPBkPj+LZxNuv?=
 =?us-ascii?Q?Ifm3/QcIkByLeKfAX/ZsIYf8YTtUx8MwEbbh54tc6yTv3ozMPLP3EJrinTbj?=
 =?us-ascii?Q?ZGk249LTzpBv6JzabbKEKjuEQ+0b535b47KK9i4I+pNobXRyBVxzEC8AEE/L?=
 =?us-ascii?Q?hX500+2ycduiFMD4hTDV2OqYYihqmXt9zfF27BJTmlFK+/TACuLM3um2i77v?=
 =?us-ascii?Q?Tj7jJa8Fc4VAHNrd4665HwVQJXMY3MNgpCuKSrHL04CX1zoqEFGgAGxDM0Pj?=
 =?us-ascii?Q?Rqpjl0brd5ov0JJgiHzV89apj25izIP+RRo3bKjpbD9LDFB87Rwchx5Wywlp?=
 =?us-ascii?Q?wkCpoZn3Pn+19pbkiR3UOglzCiAnqzvTyWGov5DoJR7pnJll5TKRFNrZJ3gH?=
 =?us-ascii?Q?ok906Jrr15z66+ANiOBLzLgCWMm+oeS/hog0Up/vDzqm9csny5bHVcf1AwE+?=
 =?us-ascii?Q?XJcrSkfy0PADuDK3H24K2zV41uYXf2arVnmvtqf3K1ZzQVhGQB4YVNWsJhZ6?=
 =?us-ascii?Q?R5gkic1UGpUvc9yptb2sSKKzb21x/Xje7zoklK+i8720KxcuL3TRSMuiUH4C?=
 =?us-ascii?Q?n4Yd1TBDCfe2EkMbQijca81ECJGoHJ/YnyVoN5CnycbunQt0vUnwNKzkPRVM?=
 =?us-ascii?Q?2dVx8MIWHhKf3h65LxYp8PAC7i4x4n47tw6JkhqXhpZqqGkhn7IINQV84i2I?=
 =?us-ascii?Q?iOcDoNH/G3WKsVUylaHrnOErDos9rF10KQmTjyruEvj1rF6640fsWaEl4Ak8?=
 =?us-ascii?Q?p9i6bAXGrP13U3bTNg+LXfTW2BM7VIhdddEz9rsMdsABbGfTnFl4lieg/Pe7?=
 =?us-ascii?Q?gceBrjRZFca1EQvf8QyxgU1h3LvoLm2/K/5EWy2x5nRyYlhA7X3mAABxpCaH?=
 =?us-ascii?Q?URF+oLKP9N1zp3bVA2xay0EDR8CZiea3sSeqzMIgey8vLCAnsQg18V1MMA6j?=
 =?us-ascii?Q?CyQQwGmpYx4kOl091/01lZh4iWSq/lj3yW46xWHY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ad6da9-f19d-4dd2-1188-08dda732bc2b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:50:50.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8D6jdYB8znqNIsF/tG/WkRP6Uoq0WTU0Udkc96O1r6NIKQZYbvyyboiiJgNhIhxtNm4t1mgNLVnILN+L8NKBiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10677

On Fri, Jun 06, 2025 at 03:00:42PM -0400, Frank Li wrote:
>From: Xu Yang <xu.yang_2@nxp.com>
>
>Add USB3 PHY tuning properties for imx95-15x15-evk and imx95-19x19-evk
>boards according to signal measurement results.
>
>Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
