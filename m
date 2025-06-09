Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0410E1C8630;
	Mon,  9 Jun 2025 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459804; cv=fail; b=igIbKg4qBe10GYd13BwA0W6F68x4PZwfZGe2Ext+ZgQYEu4oCZg10e2/8DS4HnRC9ZQ4v6KJP0SwS5VLNb1/rfeO6c8wMdFJ/5qQrXlbatuScthwggY62O/AjNUXNuAbJ0XSCoz1tdE+4L9lC37fTF/Z01KicPG5GAEfump2UEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459804; c=relaxed/simple;
	bh=XyTBF5XK928xOaFgSbxpR5VAXSOR9dyRgU41Vfp6ceA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qHOahQ+kKm0FKUdY/ofdu/wMMxfPCpSiU//l6T94aE4Pw4YXplqbeDzqrnfRDBY5D2YKtAwXmLVJ/x6XBXZxn98OoboITLrhsp+Fsf430busRT67Zy/VqkIf3NzPBsKdoHN8KEEVS8oqUDoLHxoitow34cb+QIp2L2nJ/VAyS1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ab/R0HkB; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ab/R0HkB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rX4Smc+htfk3Tj4ca+x54BgpaU1YKJnfvgWc1+/9VXK+9CFzTo6yFQ1KsjDG20SPLImgauSF2lAPTqsdg5IAwCV0Mfq8rG+tu+g9cPEoVChWe3Dmavi4GfPO2HHSSw+M0fZmenfi4HmcO8cTOdtsMWaDAmb5rb29hKuFLbu6JRNz+cdflgQ0N/Dfhww0nMgtI2M7tV0vfGc6xOtyc/1i8dPmO5QG28EtzjPlTRlOkNrB3KFNpJh3qozTCA19e1l+raRvrygk7j6i+ArNGqADJFOJkCt0GoKkw92cJn/81XqLv7Sgjfc3fFLDV7B4BAiQw5I8LF3b+SmWfYwMYCIH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyTBF5XK928xOaFgSbxpR5VAXSOR9dyRgU41Vfp6ceA=;
 b=tvNC0y8Mee4gyC2SaGsrIduE/V6PpJ/09CQXWzlpfK2aBzwY2Q0+uIJfVIIoF44qcHlCMsYPJTbZA3mZHfUVwZoLgvVYm/NSnmO9a3F/YoXjBzBFBHxL/T66GsKIMdofmzZGIUg7wR9XoYjiQm7tRYhQ/LxSf3BPSglDkcq97d9Jf9i1gFiwxEsXxSbgaDWye0e0HUD16tydNzP9pBeUnOBv3ebh1ZPW8R8m1cFTXX752PiT8YTT1WdMaF1URTx3lQTvpNN0+uCRkrim05PgExCRTNhYiAjIBfbBKRkiU16YxmWmGbmRlD/uWgJVtDQJD5nbjPDXAt4bshV5CLXeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyTBF5XK928xOaFgSbxpR5VAXSOR9dyRgU41Vfp6ceA=;
 b=ab/R0HkBnQUnPvA3u6r+LYWH+kbBGgCFz77SV1pumJpZNt6pnroJpOX9nFE5NU8lXl7KLspNJTQ9vPiuvlya+anIwmGpypJCY9z1yYYfNFSq/5VYqZwxEOLtupHjwyiNSZoAdM5CUoQJ/Tmkerg5kD84piWDlI7FvnlwMTgY4MaATYA6qZRkxTqI/2yQrLM9Cr95MwZCQfswXit8ocxMc6o2+O17T1U91taSseCDi8kjqimCDS7n6GNQ+HKSuokme0QI0gC6j8VPbR+ag67b7qBG+IoLasCaWQkOicob0+UkpO7JpJg9jlmUW6vabBFfKr/zuSA1RFXivAest1hEFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7640.eurprd04.prod.outlook.com (2603:10a6:20b:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 09:03:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:03:18 +0000
Date: Mon, 9 Jun 2025 18:13:25 +0800
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
Subject: Re: [PATCH 6/6] arm64: dts: imx93-11x11-evk: remove the duplicated
 pinctrl_lpi2c3 node
Message-ID: <20250609101325.GO13113@nxa18884-linux>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
 <20250605205853.1334131-6-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605205853.1334131-6-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 818ba9ac-7894-4f9e-a9fd-08dda73479dd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EwbSXBROMWYMhD97AdJNbcegPoktJG5BgKUzQ0RmS1ZYjZCw5JAn5NPqSjk7?=
 =?us-ascii?Q?yp6wlBZ/fIPxQMMDRQlOfdclJ6ur/Tnm/aNCfhbNBAmrlBXrN4okqzUWy+YT?=
 =?us-ascii?Q?YiocYCeyAfdXwf1+hyk4mZRnu1D72LuIrnO9rYKAvWc8EezbLaVzTThCFHjX?=
 =?us-ascii?Q?GpQ8PxvN0u5a85ZlQHSDErFoFb+WQ/O+ILSbYW1P6GgHL7WGcsjWg6v6Qrrw?=
 =?us-ascii?Q?UkBnnfHCe4mWeo/lu4ERxxtZdOPREh7q/CV/0IvyQCy2fNQCu0ZCGQJLvhZY?=
 =?us-ascii?Q?HjpSLZawmZz7SfO7AGIXwOJMW0dZc4HJ32ghlEGnp67Ug0SDDdwZKICyE0J6?=
 =?us-ascii?Q?4OL5v5RqLEBXQ7PMJ8tUFOrkrhsWdlXx0+Epm8DQExM/8wU5rlu5vWcBw2zr?=
 =?us-ascii?Q?Ebfuq/SGiCDN4VHNU5pCAVPrQlwjWUjeVJlaS1I6JIV/EvVx7/1skcB7isxr?=
 =?us-ascii?Q?IYRi8Iuu6huG9exedrAo6kKTL9+BCeCRRr4lQBnqwlq+b6w1GEZfCc0w5Twf?=
 =?us-ascii?Q?/55FpvIh/4qdaZ7+FJcCMNL+OQYzE/rr5Q2i3+rz+ipJUO/nJvuQpDRJfHza?=
 =?us-ascii?Q?YNYxxxSlYfAQRPzvt90Miw45aECIcrehBBAj/T8T1022tH3fcBTbwpRBw+HE?=
 =?us-ascii?Q?PpOAEcRjKe2tVgtftm6iNsA2z2xtNoCevITsYwSy1tiZP4EDmbgNfXlnqnYq?=
 =?us-ascii?Q?vQHA4G8dAl4e/OR4DfRzSPTe7vi1qi63hpoLw1n7S8cwSKYu3GVnodDfMYkP?=
 =?us-ascii?Q?esi9pDqIj0siBGPwOeWK6V8YByxa+Rt4UQXYr+xV0aHItHsd0UU74wioBDsE?=
 =?us-ascii?Q?XfgD2trGYH/QYjkfxYbwEPeJj/qSHpbP2376Yu34e7ZhKawBaCZOdyh/Xi/U?=
 =?us-ascii?Q?3GK6NDlhap2V13kGFzXslqyETmvkLtNHfN1vuJIpFewIwerd+Nus6LTbnY/w?=
 =?us-ascii?Q?fEWV7G5m/EKWz0p+m6n9yVWARN1xSc5XJa8LrKfpxE5pg0j4C2HXrpVwLckO?=
 =?us-ascii?Q?TY2+rXc6sBqHjJfhUoSiOx9FBbN4dNoUkicD+tGJnTMdQaL6yDmBy8EjSh9h?=
 =?us-ascii?Q?w+qk9Ivz6BB1Nhskcpf8JcKqd+ZJTt8TX/WOVo1nT4+AMLJXXAahAhQArA6U?=
 =?us-ascii?Q?7DaxRd4M0pCSDPVm2D7w2RxpPMBYC4y9+kErrwPwJtQvOaRsRrwd/owLNhwi?=
 =?us-ascii?Q?O0nKjAde1PPIyrNKntLOxxjTWwo5z1GKJclP+9tJHaRrl4OdbF6DlnPtR6hp?=
 =?us-ascii?Q?I8zivmbjUQ0srqXnFplYUyNPFcgAWCQmW62PHI96eKj5N7gTBoog0MDOmHNq?=
 =?us-ascii?Q?Kn7EeMqFkvoslZ/fGV3PtEZvZgiESFiLo9mxO8LU0a8M0jE3Q9LQp9lv22Ua?=
 =?us-ascii?Q?JXHgyaAjR0+zHsJSOdQ2rDI+wxcLC4FjY2IP8X4wlxZsOpvrGrzyAy6m1S9d?=
 =?us-ascii?Q?9/muDidn2GVxkQms6at7jAdNrv7NMpwUrce7ie1dV1bfNw+H+pqEug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AG2hikkEgHaNhjH4sYoSx7MJIc+AmYKLDegtAh6Rje4Na+zIyRVQsfdw1nzo?=
 =?us-ascii?Q?5sMIXSnYXSjo5PedfGBN1xC3sTopW++IoPxT80o0ts9dPab6NkWocUO+qat3?=
 =?us-ascii?Q?mx9ddC3+O2VPBe7rPQOfSBVkQVeusaRZSiSxH61OOgeuQat6oEXUcqq4M77I?=
 =?us-ascii?Q?syUoBC82oLkWaG1dAU20u166HXKsHdxJRIpJrV/nbyBj1nKzFNE72v4xvwZF?=
 =?us-ascii?Q?Hl73jkgT2tfZLKnK89h5lgZ+B8wOIwxKT6SbilHhqwrqwEta97lKhPc0XOtl?=
 =?us-ascii?Q?mWeBzt0fJxmnf2dfPGXIwGEs6zAtvr4AVQ0rDDygi7QOLJKtRrhXc4YulC8U?=
 =?us-ascii?Q?39+0+yj5YAXas9gx2MekjEMMdxd6mHLgVY1Ddv7a5OtVOOssHolnr6Cgv97y?=
 =?us-ascii?Q?tROWh42nOCW0h2iL+0OvRyQNZjgY6Gd5sqk1ntgLTDvKKSOTMqeTf0Rbggjp?=
 =?us-ascii?Q?CQzrYXzK1/aQ/lxiaaXJQh9B0eQZMiM48gVypk7L+RNJnlCH+4sf++Wec8dd?=
 =?us-ascii?Q?dlv4xRurzfedbYx5U4QougQhk2hpC1mYiX4A3BOKC0ulI33h7iwQAMcJMGDz?=
 =?us-ascii?Q?tS3Til/j2riPfPfVXexg3Gy1a50czFu+BRT0brC0jnIWnUHnFt9SW42ufhje?=
 =?us-ascii?Q?6CMLgg/sUA0P4tbDkm02vbRZbgY1VCYi4PdOXSQ0W9av8CM26qzkmMsA0DvK?=
 =?us-ascii?Q?bXwMG32P6PfhEW5gpbOMeXOOOnSP14q4iwnNImSp2IyfvV0hRu2xXgIgSFDW?=
 =?us-ascii?Q?vL7mEb/76xRymCP+Vx3eJxxxpuzBPJX/G3Bi/LXHSrcGjIdNjiWyie2qLifE?=
 =?us-ascii?Q?Af8Rxu6yAB+ltI4v7eubB62Ra/Yx7A69gcAMhpgwY3eK4V0iKFrtmWYJ1trS?=
 =?us-ascii?Q?R0wiIrplGLAhA24dlzvIvRu+qXpAo93IyqL/+dMR9Dk9rG6AvEypIbg2HbiF?=
 =?us-ascii?Q?AYeY4AMZ5mO4k4hVsMwWOE6LY1cYMAAA7UYU+u1CPCr4yd+AVgaNYtyMVqt4?=
 =?us-ascii?Q?U9QoonpnlxtCrdaojg52lj+JM3hQFHjIQtX0apIKEJeLCpHF5zdp/VSHhvT2?=
 =?us-ascii?Q?5V9M4jjeKqkrv/dkM1M+k/ExMuXIojhAbtV9vhU/L/9gVB3ZatDQeBDDFea3?=
 =?us-ascii?Q?9/YWNlCnoEqk69Foi5qhkVSRXTkDE2vyK5qlBg3/QLQVPd5UhBH2eHTpA3Nu?=
 =?us-ascii?Q?ffRMds9gAQrIn2e517Io9idxpUfTF5wvB14mx63dpQ5qrhtsBkvSIxLqU8g6?=
 =?us-ascii?Q?z5og2dQPGeiGDqgjStmiGGZLM4XbbmxMYW1TOqlkIiRTXNgook/ln/uUewfn?=
 =?us-ascii?Q?+J0v6sHsgm1lV/95DXvU421zxTOCapV0tayuePqAUb5Nvzcz9uZwZI9EweXL?=
 =?us-ascii?Q?5uKoykMkkfvu0YHLV67O5W09sT9K4eXj6GnU175rI2OQds2T3OP7yb5b7GAs?=
 =?us-ascii?Q?GUqTdwSg/nAuUgqlTXE4cA1icaKBxm/ECQkiy7ImrocQVkvgYNG2DpJ0TJVj?=
 =?us-ascii?Q?8kMbMNMI+iQJMUl3qSp9jTOfCzlHijQEE1D23xOKpU6veJpNj2+wHktVlYz1?=
 =?us-ascii?Q?pXrEk6Qq59vbIKxZjdY9inJFg6R59J+AesMBK3k3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818ba9ac-7894-4f9e-a9fd-08dda73479dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:03:18.2369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5G8SvJh9mQTY/LhgEvOT95/r6B5JjFGbJOCgC+xsgu6YcgA2FibnmeKjth5u8bfdr2Ji9CXtEeleIozTnYVYow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7640

On Thu, Jun 05, 2025 at 04:58:53PM -0400, Frank Li wrote:
>From: Joy Zou <joy.zou@nxp.com>
>
>Remove the duplicated pinctrl_lpi2c3 node.
>
>Signed-off-by: Joy Zou <joy.zou@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
