Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE22248A5;
	Fri, 16 May 2025 02:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364375; cv=fail; b=FH6bUoW6gNMx5gpsNZ2zwMZ+ajFbygo1NdP74OYWMH1kSqItsjiefi/90/aUdAfZOgXQ2fwhasR1WKNzZrdV0wflUZMR7HdzZTSKOjup7oSqDPygp7sWNMDSFo5bPC1fp9+QuReXBb4mdlkMx64TQWSetsx2489o1kuc8w7v2hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364375; c=relaxed/simple;
	bh=8t0FWv511qcVnLNL5SQLujIxTNdHCQz/O9Di2bIjdNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UP+6+Fp23jNCSG8p58cqbiSRjniWr6h0ko85Rog51JHvLTtlLOgHZyWCaf0UxuKs45qiXSZjnfnFWgbzbpcI/AaJNJCnrHctFEYMrlMeUEJSriQq5SZdFXEKOiKDDN/j3uf/R92t39GXHEu1empt46iT6H0d2pJ9ikv9VXtXPKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FpFEkCka; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FpFEkCka"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnHXaI2Cc5UxASTDlK/Tiyh3crMX3RE7BoowrDUDDg7HMSf4ldtbJ+wwtozZXaiIExwEH5uzfnxdwllnse8UaPXyK5qOc2E/FBflHrjs972rEFiUerBo7QfUTHsV9OtRaQmtkuxGGsAbyAfMqkF6C5tmQhkcNMFC2Th+gD0TESYs3En1U7T47StezCbzKjcevaADy7+GVplzLkWUAaGsTa+IoPhSb3rz4qeM5+cK0rCbYDdlGJrAohezlZyVCBZXK0B7obslloV72ZQv0f1ZHUenhOpwtGu5+KCNPzc0WtFtOATqChwy4GEuT7PXhRQpIID5GBG+RZt7OrMiLNbMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t0FWv511qcVnLNL5SQLujIxTNdHCQz/O9Di2bIjdNQ=;
 b=WrW3gMaE0bGRhE6DQ7BjzegrbfSGLCP68WkpooBmCrNt3a6g3h23bSerkHZ7N5WhlZdvxRQK6WHw8n0rpzRN0jflZCIXQ5g1nlr2lm7rg7zdWO8DXytvHV3BDfF3vrKA2CRuptqiAqfJRUea7SUPxfqj4Whnz9nbIeFL6trlM+PwVNY9DJSdg1gB9+381mwlQyZpjlQ9ZMj4zLPPd8YgZndBGKoduq9eKXoTDDBfThUdTcUWj4GkBqbZd0abYmbMiNw7d8WT9KRHlqYgLRYhX2YSNg+4RGUBLv0KQx/ZZtfqen/dpVNGMwoRcM9stTza7dNN3edpVXTvCdagExYG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t0FWv511qcVnLNL5SQLujIxTNdHCQz/O9Di2bIjdNQ=;
 b=FpFEkCkacNHDSAKDLCyycl5SL88uARb42iYQ2KWGlxonX+aK/KfoO4FqodceeE49zqenYdaoEq3q4I8oHbmIv0E2oF3zDRwEaF7rPBNpt2XmUWafiN8+umvpf6cYXnyjb5y66FSAL2qR7zaqKmZec+QQm2mE1CSExbw0qVlHfMKL5NCCnR6G9jyjgPR+QECe9bdWWo0e6gvFIWeKoEus7ZqDc6LJA5xEbXWTiHlMNHVBGfGwxOMkukOSZwGTBblORmsIZuoYPlU4MC5lOYIehh/I+gNXXVR/rwmC3Q7ChGkDqU5AWSBQZW71wSOaaU9VcIzE5GAZmAd25S87WP/CGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7569.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 02:59:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:59:30 +0000
Date: Fri, 16 May 2025 12:08:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: imx6ulz-bsh-smm-m2: Update wifi/bluetooth
 pinctrl
Message-ID: <20250516040857.GD28759@nxa18884-linux>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
 <20250514070545.1868850-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514070545.1868850-3-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 02263945-7ef3-4bf7-f9f9-08dd9425ad7f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zYirZotmWERF3dwdYvLOeGOiOEPCJQNMH0IrHOyMGj1C62crGmJ31Gj4iYSs?=
 =?us-ascii?Q?XiHSh1t8coeuFI/KGYDqw0aPwck3GY2AcNIzn4MNHxfQ3mKxzkhp/xgNQPK4?=
 =?us-ascii?Q?e5WTyEXguazsu4Qc8d+2qD5lnFgRAqhGguO2CPB3yf/uv6VHF9Q/f7ROsuHS?=
 =?us-ascii?Q?gB1po6upWx5aQpTSLL41mCtV0Q/UFA+3UlLpHtMBwyYRbo64dqgn3jgi3S9z?=
 =?us-ascii?Q?zfXZrxqSg93kz3lNFjMIupqEHObA8KIhTVQryx/0061INEDt/Ogd55hbH4yl?=
 =?us-ascii?Q?jveV4ikyxOVmVC9ycPAgLer6s9sWvERMY7qzf82GbdCwH1r1NZYf9HRBu7zx?=
 =?us-ascii?Q?xFCKpGea1XSQErJVbTwZP3Gedf9x3+nb18kcJOZsu6laaGdhZS/cwmsdcT8S?=
 =?us-ascii?Q?fnbXO4FeWslF9D0jroI3cLeG4gxaXNVcJTSz6luss9wdbNdaFiq5aFgqru0d?=
 =?us-ascii?Q?m8UAXCwjEQjTboJ+gpsUk8XfCtCFJLer5O0rMPrZ1YC8L5QYH4heNdXduyyA?=
 =?us-ascii?Q?SEkBS2Hh7dUYMr+jBpMEmQ/aRpK6nO6LqCHC9EOCkcM4QcxqeK5l4ZYmQZYe?=
 =?us-ascii?Q?dSIjeer6VGiSB4Xa0z606JYkvTmL53qGPj1f+ce68zIVg9fiGFHyhTS3vHg3?=
 =?us-ascii?Q?r7IR7mxR8JLJKRbwqLSLCxY7PGQivfCr/0fcD+wdnDFX0N24VERSYXFZKvex?=
 =?us-ascii?Q?ek/QCC2x6pYOWxp4E7Bw+JzsJEqreCrbPtobwJS3PeYrdHBzg4IPlL1I2KWY?=
 =?us-ascii?Q?eMwSvhO1IakzhS8SpCvk+sC7vCRe9mXS8U1Hvt6srWF69u76HqoeH1Y0ZcB7?=
 =?us-ascii?Q?dGnADtSi5sK5elIvt4gOtz698whqXOQgmYzxWDnn1jbXVZjrL54E5ssZhu8D?=
 =?us-ascii?Q?dybeQSq5OoYgQOgNePfEORsy+xT4prD+zEI9ZR8PzQVZJFMWag3Z42O08rXT?=
 =?us-ascii?Q?0juTDILqvvy7UFJX2eSCSp1v/lHqRnnox7u4rCpDZRjPgLZegFTAygJWenUg?=
 =?us-ascii?Q?+BnvWgOriSuPRvxHJtxl2HguGyPHJjIeCvS5pMNS5fRJzyHwTO95t25UohK7?=
 =?us-ascii?Q?5kE72q846xf8MUnwn6KMf2fZ0Km0MDn3KuVt23fKcTECJ1sUJQksSqEUaFda?=
 =?us-ascii?Q?rxhyJOe9nYY+M/6WPSxuh81k6DY0l93ch1XiKOFlnaJORPcN4FtFvzHiDmHX?=
 =?us-ascii?Q?ANG0w/AQ0LM1rW6gn6EZX3ZxTwXGXXbBzBBwUJwLQgBolpG+bNyomF7u2KX6?=
 =?us-ascii?Q?cihJnNWDbnjXHUcvF+EV/ZJvsuTlyZ3CYXTB0sYiUjvv8cfWco3dL0JibeMr?=
 =?us-ascii?Q?lpfEcmPyGkkKCdtM3DQi/bYGvOGKbQFNcL9NYQzasvyXGd0HsATr9ZkbzE3g?=
 =?us-ascii?Q?elI016Px65BwfkEAqgl8lTqN861sl1K3ZXBu9/rWdhrOWWhQK79QDNSx9Duu?=
 =?us-ascii?Q?yag4ozo3aVw6+OudZb8jqc364mrELVZILQ6bFYWzSO2WWetXvePUKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SKVQ6C6o4Dg1NnL9ogAW+3PtljsxgzpqY1kbIMHxgNYoGB2+N6yvVV94VbSp?=
 =?us-ascii?Q?RDdy+hHeyarpAwt4p7Wcy4bx3dXM4jDiiA+tB/UTgy9M7O15U4BI/eWiSz+u?=
 =?us-ascii?Q?t9SR6vSb83V+Lgb5K5I6y2jdW8GIckhEnDwwU3LfR+23CN3/A8R5fmJ6HzsB?=
 =?us-ascii?Q?9faMmZ5v1U+MnLIMUQnyLGbrqsZ0C60pLLQoNvs+VwQaolEcrkmwpz+f8igy?=
 =?us-ascii?Q?Mr8jSY9ZJhX7d9YUaLC6gcL6Xm6l8X1b3iKYKUCPxXzvELchIHNsK6LJwoI5?=
 =?us-ascii?Q?2bmHha9WX9n8KcWckNXT/jAnzzP8S/c3S0at6IOjoZ2BgHHcNWZLUroLPKmA?=
 =?us-ascii?Q?0wzBYfB3uRE3D/DZFx35aLOYfAPANFNzLwkB+M5vchVd1UDBiKZDPT9dhggs?=
 =?us-ascii?Q?ALA0Jqi6V0dyKoo2A3vE5OLXZFZmvuORH+BZpC751aryiRMRb0c1FLC9UH0x?=
 =?us-ascii?Q?Y/Iu3FgOxf2vzT7V8XApn30EDJ0uNcSO8cLbFdEh4kQKHlFsAm9D0wWVJ0zl?=
 =?us-ascii?Q?jBYBYzcnFSrt0TCYPSuC20Z6EDlEHWNK9KEQ/sunxF+VN6dpOSXlsUkF2Xiw?=
 =?us-ascii?Q?TsHI2qVYZ1HBZ88q5DXhDiOHoSx/gjbFIy89ssa7ZqPzybqof08i4b7FE3XB?=
 =?us-ascii?Q?75qzSwIYsWedA6mBMZVmD5N0lH87pOOiF0GrVD8H3BxU1JNvFMRbgTWxl1/y?=
 =?us-ascii?Q?G+WUgadO41/OCTtTTjcoIdOjirCI44Yt7T5VhglWbufXuYkXxQzdhk0RkqY0?=
 =?us-ascii?Q?cVOXElsrvcYiq6MYgLRFn6SR0wSyd1jD1jqr3PyIe//RNISb16YUYgSFejCh?=
 =?us-ascii?Q?1A/VVgWC7jdBCBX0tYyUvH22OEMJ9fuD/o7ZcBmQTeJv9p0QJbtDjseixqNd?=
 =?us-ascii?Q?HwAtNy0yR5rgkftu6U4dslZcMBiRvLUgLF9aI+D/ziqYCVzERZgfThfevHS5?=
 =?us-ascii?Q?26dndgmoAT3ceQqxCGez/8nIAm3SR2WEM10f2t+13PUaOfXFSA9XxJT47I9+?=
 =?us-ascii?Q?eV1RQAfXAJAEbgrJup6CNDowgPNlIG7FbN0Jd+RM2fda++8hRmVca6w3KKuy?=
 =?us-ascii?Q?GrPdywtgNG+W+bXJ5QHoM32s0HvK+tmke0jghARKhtYgLs818UixefrXw1FM?=
 =?us-ascii?Q?PUjT9eiTTCXjmw3R6ML1bJxNq/DdQ1wWsVggzdL2wOCvv1ehfuJlcwdfBgAW?=
 =?us-ascii?Q?JGHEMy601LYfEDc6CnF0vOR50KfUIcTmu6qts/zLxFdb/SWiZxY4qbW3XaEi?=
 =?us-ascii?Q?1MSwa9ivw9YQKgSSZ6y6DKFoPLrGY7XE5FcDR/5jEiI0VTQcKNuy5/SrT52f?=
 =?us-ascii?Q?GcKJxSpwuyXBWp/lQTOpbv3PHhQhXl6ab4BSIKbrJpypsCT5viJQC4FSTFaE?=
 =?us-ascii?Q?eXua04Hih6VeC8jHues/bI9ZUloXpbDqjQvT6bXMrhP4xVcw4tQLJLw28qZ1?=
 =?us-ascii?Q?QQK0vuAT46lSNSC5/GleLp9m0PE8HqnIDYnnGd3Jcgc1zzg0Ru/Barxr6xg7?=
 =?us-ascii?Q?OZiSryoDossgDZkJqnl4M+Gb07LXeWTD9P0LaC9uhmaDjHE4YMHfVo3P11E6?=
 =?us-ascii?Q?UeJZyvJb9+6kPhFCuLBvC7YTEBik5rfb7n+eefv9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02263945-7ef3-4bf7-f9f9-08dd9425ad7f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:59:30.4217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9uUOwX5OCEOoR2b9rdsvtiG5iJaYyzjK+yBol3E1R0ijTfthaOsUl+TKKXdI93Dez91Dfy42cbE7Gc6pVuEQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569

On Wed, May 14, 2025 at 09:05:35AM +0200, Dario Binacchi wrote:
>From: Leonhard Hesse <leonhard.hesse@bshg.com>
>
>Adjustment of wifi and bluetooth REG_ON pin settings. Align them
>to the production kernel

It could be good to add a bit more info about what specific
pad settings are changed.

Align them to the production kernel does not make sense.

Regards,
Peng
