Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B275383;
	Thu,  5 Jun 2025 00:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749083427; cv=fail; b=d4yw8wsoqRE22LmxIwBocvrOH31chTiQ/J4DLaePvWG2cZ1f0cPXWAUwfpEj+QLy8qQ/DZvp1gaovL4MVn/6yKV/9h5mGqzbkgT3oM67pzL5qU3avSQ6ychaxwuUYk1cdhAhNzDlEg+UwVQ80TGNvanyEwwwms65jE7OcBeBdUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749083427; c=relaxed/simple;
	bh=/TqjTcaC1/FxYM9YzCbCrpcC9bBks+Wtiwn0Fj3LPYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fUzVDGLExZC29vWCuTGf9rPTCBnD4NDUzrrchKpoAOQ2xaXXs356JB/FYJJP9jA/FK6ZSYiVahdmG14wgTqO5/YbcRxbgUdBuAbdSA92XDPwv/8+nvqzorb6OIhXpLdZ5ijz3J4ahDTWUcmI9q9lUpSSXU5ha2cvX5X14WjF1yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wmqR37dA; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wmqR37dA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoNF29XeSrgpQ20MYT6DVCWyJ+RePlvOutpZQg/cFodH6+owzzWkvBb8oU3+/6r16NsNyIhZ+M7o2NGEqbheYVWZ0CbQ0TKuLRV5AtubidqjInSJXH5YAOgNgxZ7Nxc8QOkUddzjG5P1Opez5qITWOWNcde+ek8t8WN96ndv138sPHr771Ihe8IGMcRDf1sYTXYG1SVUhgmBzrXVOgyQYuUM0eS12OiC8LOra0M0m4beMhYTjl9NGmAvkhf34rBf8rL2NpWJkpcpQ8pwABr27idUjOQAk93gX9Gmfsk7fia6mm7eSDoTtrDQVCrtS0lLxngiFKWZ+j861XydztQrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TqjTcaC1/FxYM9YzCbCrpcC9bBks+Wtiwn0Fj3LPYI=;
 b=VZWqFjlhU1UCe1TaVZIKONeA+l9/yE3WffU6iNRAl+QjhPFxvvccbmhCPvn92yP1ajt3tatX4m7lsrnXT6otPBU/69/HAk+WL25yX0fiUlr1zgmVDn9owzojDwSQtYRm2F2L2Bb+wyZp2n2Ye/WChgolKFOFJkDzZHa6WrZ/cB66kT03wYx0bnTcwObgGC7Q4t717DTMNRWdbMJtXTpKYg5KsG4bonQnce/mewscrzU0Y9vrtpIOTDQad/FWNUQLaSuFxI6EC/7U+796Y235DSSHfH8wYrxZf5ZZtfoTAEffZBsBIZ1FXkjMT4p60Fwl+Gj7/3mXg3hYN073ArIQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TqjTcaC1/FxYM9YzCbCrpcC9bBks+Wtiwn0Fj3LPYI=;
 b=wmqR37dAPAr3XOYhOiZwzvs+Ef4+vdUJy84w31NpaRNS/G+Q0bQETyznBmclN9/ZbMNqY4uf2JRQnq6UxhpoR2AUOaJ9NsyTF1qzFFH/v6HtoAzz03FtQeTW71HgIa8KogdBuirXRhtWUx9TmzP2TjjuDXfM8w+M9Fa3VR/ACrmQ4maqJ3Q8p3GmMtPIopekECX6OD+zwymkCRMFf0KXUbyIuYDaBSnNlZ8rf97rQ0Xt22FmwmlJrgLpY+4P2f+DUnw+Z580x3ovQA5W8hmsyHcDVIgmFz5bb7nWSFbDzDIBXaDT4wXTW3kDAQ9GsZuEEJQKieYi50iz5PMiAnZwgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9341.eurprd04.prod.outlook.com (2603:10a6:102:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 00:30:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 00:30:22 +0000
Date: Thu, 5 Jun 2025 09:40:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	m.felsch@pengutronix.de, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp-nominal: Explicitly configure
 nominal VPU clocks
Message-ID: <20250605014022.GD29462@nxa18884-linux>
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-4-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530221713.54804-4-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: ca48b468-8b2a-432a-3b0f-08dda3c828aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xAbM65edCDKFQhKT+wmp7kBcTWzEaIwR+01pUEDZGh46kQCPIkv12vuLL/rG?=
 =?us-ascii?Q?FGUbLNWjXDJxWooAnqEzyZHCE3SBbk/yhvymIsUbu40txbzFHKMekSlCJRCB?=
 =?us-ascii?Q?xPm/+r1ghANvjwCRW1HDgIWY68Ya80SllrfOyXpAfBDH90+n1vhyQ24q3ddh?=
 =?us-ascii?Q?q5ZViBgWALjzYBZg82y87SK7I0euJ+XaFaIMaNJLLqbLXClU71YCTgU44xM+?=
 =?us-ascii?Q?OS3eZ6WxNU/KIiu9exJrt85g8SpE5Daj4VgjsccTnQ+6yFF2Zpu9hzEboz3r?=
 =?us-ascii?Q?h4UTu+QrFrrAp2aQa9Gb6e/09UHngRNRhIYjuf+zBm+nQqzq8Wgo87yPiCWu?=
 =?us-ascii?Q?1XQpcD/3mB6avQ1TLgOJWv64mtWWEaGY+hMyJW1E/XIzQ5LGFIhVXnIyry+k?=
 =?us-ascii?Q?oqTI+xr5AiTOBaBsBmGqvwpZj0DVjg6IwLV+3C4R8iySQDNXoVxw+TV3Bp0O?=
 =?us-ascii?Q?XgvoR5W1ip5xL+lw4niGM2jvsoqhYFA26vvgg5/dCNqKqiMjKKZ1VlDEDcOo?=
 =?us-ascii?Q?kTpgoTk9MSfZLUPE/VmYsy76IUB1o4z+J7PYDsWGvq0znJq73+mnhBlTy5uN?=
 =?us-ascii?Q?CUgp0/eQ8a3QObcHFoRxR1NTlqi8Cwc5jNMnKrmLIiAH/qD/3GmAL/EJWZDU?=
 =?us-ascii?Q?S/+UUJ3mzVSBpYDG3HDxoLsSGrSAhQ19vi/zyNdyrx0Uae5DEK9n/B7IPZ3I?=
 =?us-ascii?Q?6oiPf2VbnuY6SC97MSgMMgdZlfZH+rzwPTMHhTOiGzp47n/XydbnGodSV/bB?=
 =?us-ascii?Q?9NHMggIRY38b/Ri11/B82OIJv73MaquFw8k/ezJTgVFdFfx0n5sfMrzKB5QI?=
 =?us-ascii?Q?MzHa9RPkM584LwY4gUfeadFdgTXgiVeI3MJVPB9NIeqIOxLHO8OCgHVQYEUU?=
 =?us-ascii?Q?CGpVlL+6o75F5cqU4ElFqwJE5Cw0Njg36bOuBzHAylDvwG8x9+eUqI58H0E1?=
 =?us-ascii?Q?J4CGfpQk3BoJTghB8wVuM+oku1ozBtjmzuDK1reZkX++EE5kdWNZK3WB30kW?=
 =?us-ascii?Q?dCrHY33otu3gyoxHUVw7R8aY14WQRn6WLlkWoP6TDyVIUu5mmoJpqBcVL06F?=
 =?us-ascii?Q?WCAXT7XIZYyzSiZZPYj1ts3UNDRcGFcQv0aKPNWSC3VCG98vN7eC4mrm3r7b?=
 =?us-ascii?Q?pgSsXjOr/Gnh74yOJ/ptsH+uIVKDe8WJpQWh9hwGkJuDBocUg8NA6s5oo9/v?=
 =?us-ascii?Q?IQ+5FsgY95tus8KXGfkhtiKIgG00FFsDq5mrN5vzDfsKF8jJXFXSQApFpnqm?=
 =?us-ascii?Q?3Pa0xrVdgZxKVusynhDEkqN753/roNQphJv+YqC/cOPkKKen4OzDvgtQyj2o?=
 =?us-ascii?Q?LEHcGgqp94SDZvDU5eeqbXIChZ45km9YLRfJW1hEGm49LUAk59FP+lVa+XB5?=
 =?us-ascii?Q?OAfCwEHZn3AZ6dgNZE/kTHpPelNZToWIk6YBgTWPwkXbvnRG26j2QvS1M9h8?=
 =?us-ascii?Q?VFr/knJz+9VS2y2WKoxD6Py05MP90+/aUIAruodsoAO1IclDuXCvUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VI6Z8eFTE5Ss3S0+SPB0OrSKBOIUk7vSqDrS33yPEKa77K8rzUNB6+WRB8jz?=
 =?us-ascii?Q?OxEWawo4MFSwa8r0Epkw75GdHLWZ/X3Q1wIijN9YW7MHVZ73AWaIB0Y8WVFm?=
 =?us-ascii?Q?YSMnUnU9KAnB2AfU7QUKXqzGtq10+/rjmZ1EigDmnsZG2RMSQdllGQYWsphk?=
 =?us-ascii?Q?ORqbB6QHNnRfhSvCwM7HWq2wZ0ADK0AYd0l65sMphE4w5WTe7ikkBsa4D80E?=
 =?us-ascii?Q?nvrm+F57sO90JlXbW+U9IGblNUfHXnkplyHoox/feTFUvRYgpHNGQ/PFSxew?=
 =?us-ascii?Q?EjeR+J64n0SxQ82Ciw9ksQCOx2NCLb9PbBWJFo8/wmO067i/cIp8ILsuW03Y?=
 =?us-ascii?Q?OnpN0x3DbliwTEgqDslHoFx0Hri04Wuo5OlI6WTeDcldWKzc39gayU+EodIn?=
 =?us-ascii?Q?7zXCywpAK9wutgV3FnrlbA2RjS6rh9K29ENs1tEzU3okhy9Yqn4UVEwFJFt7?=
 =?us-ascii?Q?/p3+yoOdDF4wHEz69EbXl6tQaSOvlCUnQu2IkA3Jlnlk1EiSha1oJOZ6WYRZ?=
 =?us-ascii?Q?+zwCwZP8hw+e7OhyXosNjCw3YoiNYi9Yxb+ZrZOsgDrwy0X7ZbSZ/Gvr2AtD?=
 =?us-ascii?Q?aSypoF2n2c/mYb7FRrwW9mhVQgrw0veEgds8iFM6ZZ719oChwjHrFea0w5dO?=
 =?us-ascii?Q?c9Fhy7OuIq7NJ0boRqESGp9wlZfyeRg0A1tO7latuDvonzxIg4jlhK9LO557?=
 =?us-ascii?Q?yv9bPBxYkIQ8+qShJvlrksdY06e2wyFAc8bwtKC4wItj18qe/FfvfVaY+FP3?=
 =?us-ascii?Q?lsEpSDyIpoUXelAsXqO4s+7Tm4OS/ZLyrslmeHGxzlavVC4bRxa3hU86chGg?=
 =?us-ascii?Q?cvo1WgpQEE8nhlfY0gvXcuMde4IrSQo08EqVyHODQ8N0AJX3M0oLiAiyLsQU?=
 =?us-ascii?Q?fJNJ5RocuQ8zSuyg2yGt/qcOrrSfriRajTLdFq3OWxEIlVh5n4dJPHAV5FIE?=
 =?us-ascii?Q?0lISiUSs5AqIjtfPYX6VwnmtjYh89uECqDPyfs6IJb25kJNCzibXTSa3oDP6?=
 =?us-ascii?Q?z/IyJK1/RmQ0x6ESPhbyGPF/gz7vCUQgEOiFYNvZMxrR9+Jx7vAilKyDVjXD?=
 =?us-ascii?Q?YDsQaOQ8aCEAkqlYoC23lL2oJeVEuyLhaTqoinYozEsrW7uIASIr4Iqv1la1?=
 =?us-ascii?Q?9GmH3W4dujAEABoKRPpJ3W5cHLRab5lGIvSqG1OFEG8/b9vudxi5b+3ThaKy?=
 =?us-ascii?Q?IL43WTGQD4dDUGxgTvu+A2mCMqWkrETw8IvzeoUqnJE6tKl+dmFRr6iAdHRS?=
 =?us-ascii?Q?BaNpSMtNoXrTCnLY7XvwKUEaO3o1aLLVEJ02dLYHe3jHQJSm1cILkRiCTfbf?=
 =?us-ascii?Q?OotLEnIi5QNnA+uEP/5mCgyo1wQNwxsyvDGn+KBUclmQh4sZnp3ipbmAZsEA?=
 =?us-ascii?Q?QTlEBXiAbIspk2rhnAFMx2SUcUr3QorpRBzXHiwZfMVvoWKDb0I6HJ3pVKma?=
 =?us-ascii?Q?DLbGi63WXOI/zKRCCiDMuNTuIufhMLTJcYEMyYpNeDkfBd1BWCsTPKwW52SU?=
 =?us-ascii?Q?wHlVDa5QQDI4KOPld0hJy6srMP48ar+MywH998iPZSeZWvSIglwTZJsSnG3W?=
 =?us-ascii?Q?kyS2PF3ninfx4ur3TSq8SRD2geuHHhOdtg01BVV6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca48b468-8b2a-432a-3b0f-08dda3c828aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 00:30:22.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drv5bEeTDoyV6Zjy7+xv+Sy0SslrT+fEVGsNLE+TuGdWLMwr+itKHpe5dXaNL4ABcpy7en9kKJbAdIX2y6dN7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9341

On Fri, May 30, 2025 at 05:17:10PM -0500, Adam Ford wrote:
>In preparation for increasing the default VPU clocks to overdrive,
>configure the nominal values first to avoid running the nominal
>devices out of spec when imx8mp.dtsi is changed.
>
>Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
