Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F211DF98B;
	Wed, 30 Apr 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998567; cv=fail; b=ov39zvcizceuDckbySCsVleIibYfhvJlsd6r6bu5bcUbs8BgbaTpd60VZXcFfhHO6HPBqpssK9HNa4FrgV5ao6XcaNEDARiRG7oAwZnmmLnv2pnAdkIZvexYp8vqDgVmaZ/rt9Vu0/NeHMCC+YjEU7Znu972otTkbjcqCi+GDtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998567; c=relaxed/simple;
	bh=G6Sw3MGrNjfadEIanw7kpT9X2v2WtmaS3PPXxROCv3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ofasCP3MJNuDy6XkTg/VzgQzmTFHlzipOnEf6441cNvBIS/Ib5MSNGOaf4i1i3vWvetdkQV5+z2yky9KHQntgnA+50ThPS/2ur4snpZl9rx+vkQMzs4h9ycF1oZIWxO15RFhIDAr3wnWjpscj/5wFpXcSUkPQxTuPd0wVD/zdYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GdZpC02j; arc=fail smtp.client-ip=40.107.104.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GdZpC02j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4XN3N7aCA2gXkuaXVHTifhenAk/2dNtgONNC5smlIOw48MsYU2fdamxYOwhEJ8mGS8v3zul+c/B2pAVJ4lnyK0r3yshACFcaiNmH1HFBaMePL6FChAVKPW336LYdFwuv321N8b230I3yE3elD4Jkb1khUl1IUb7oEcAZGOJQJK8iCB/NgSIklK8i6igG0QKfeo6nSxtv6skdRQFX+w9GpnXHMXuFUD5nD1idhhZZYia02VDMpqctKbNWlj0Ru563grYGsqTXX8AbMBlPXMm8BbkcpmZAn8+Da9E34ibe3mb37IqkTA5f4qYrKNyA8eThJTvkK2dGdqBzvXgXeu68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkQFZkCzuOarGn0VOyvVPtDynfo685hwY7DHrQ/9yX4=;
 b=U9njjYie6XOMie+750i6Sy5qD+pnA5XYuqMC0Qr5+9PL3vN9+SpnT/oQVGQuH4ss4Foagsi/h8lmCTZ8Z9sGJxxfUsJeJyU2v3Dsjy0GNIs1StMfvOYyn9TXgKUQ++k77tBSD++XaqcZ7aVXmM6KT8LADp/gD+BLi1lGgz8D+lZl6IqkqM6Czbi8gO3qXTlB21eTWpALp+yC5DCvHjBwsIQQ1e4fmcsXbstx3ZcdiPS1FcP7D/rNeWbqc0jpu045ecuVWRt7Dsaua58d+TibPifGMeHLTcZ8zFIL52feoyI90suDmPzupWNye9+hrSFp2MI6/USQuKU7kCLTWX5b3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkQFZkCzuOarGn0VOyvVPtDynfo685hwY7DHrQ/9yX4=;
 b=GdZpC02j1Yi4nS9ieUEMUjnBgfw5IzhDb8hUIIsc9YhZWTTiEe4VdBU21Ycs06ZoqnRVggzE1/RbCFgLdwbJqEuy99ETQFg1rsBjwjwmvJLSOcq+6qOAxDniMb2TEi481lFYA5b6H2tLDz+5MLTQejuw98bymVKFuzXgFgISTaOFikUzKc/I9DSO+twJqq53ke2istYPoR/nSjo2LDAA+4eUXSRTYVDHKUhOh/6F8sM1KF/Na3rsNFI/wwjnAO6C6jHwz+LQHM9FwTzn7CZ5fOuHb3vN2iMr/mmfNSq4BurbbEVczNCkjzoobyLD3MU9GapDviyfPQxKtS0TsAMKBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7706.eurprd04.prod.outlook.com (2603:10a6:10:208::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 07:36:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 07:36:02 +0000
Date: Wed, 30 Apr 2025 16:45:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4]  arm64: dts: freescale: imx8mp-toradex-smarc: add
 fan, ec, gpio
Message-ID: <20250430084504.GC31028@nxa18884-linux>
References: <20250429113119.124427-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 81546437-deae-456e-a6ff-08dd87b9a862
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?q2w1ts58DkFZ4k+lh7w+hBNxMuQuyGtcJcId0sx6cL8R2aXwwLjTLEvYY2A1?=
 =?us-ascii?Q?MWucWevLF0q7ghDU5na3arYekMhkDRz6Mp9i7+WkMNp1KVicJTbeGI4m5hjK?=
 =?us-ascii?Q?FvoxrT0vxzDs71RvQ1P99YGE+lPr8HkoBplhsNicfjCW1XBE+spX8WO2JsBH?=
 =?us-ascii?Q?V8YdvYmziETPHSqeiUeWxLvodLY+kWtya+7r6zQvKZI1QrfxG+Xura8z7NCd?=
 =?us-ascii?Q?xMUIYhQRJU0Bl/XKifeWkXShh6aI6DaW2Vz4KYHISJvim/E6StS+L/CN63uY?=
 =?us-ascii?Q?k4//Mz51GnU7XEDcKWtOk8P4rLxbNKxDDfx02M4MNaV7QptRM0oLc+7L7fUP?=
 =?us-ascii?Q?DEqccEt9v15QTWaEx1BuLXLrAA5VivjwiKW0lPEO9DTK9GN1ElGaxnve3G4l?=
 =?us-ascii?Q?HtPtojQXqIV/xgUKXSYSII3GbNWzRZDOhu7IDqhye+scLIc8VAALqdpZ0oyy?=
 =?us-ascii?Q?dKkrPSd4c3K/yCYXuYOdlrb/+VmEnT57A8OxRN/DXIMUPQMHi0VwMMRespSs?=
 =?us-ascii?Q?Ws9UWucG0CwxJVUiFu5F8VZDMY+yOpRK/dUwxDKMizoOlMyqOIp3cTMOwBj6?=
 =?us-ascii?Q?vc9zuhMJrKal15rDFZ2IGO2Yt9hXA2U8oxpjuxEuO7U1DsWMP5YXtL723ESs?=
 =?us-ascii?Q?h0wNYOmlkwea7Y1ZoN2VcYX2VlTs4yIB4m+u/S5JqfzMgYRpvCKt82wHySTO?=
 =?us-ascii?Q?yX2R+CeNxOXR+7JG7RI8Tqnvney2I+vpCJmZ0zHL96UMslLTQ8/SBrQaUOB4?=
 =?us-ascii?Q?gVElUCx6LaYG5iOXMBKtWVyhFCDLTn/st1kW0msvdFFsDuDBmfQ44LLl190J?=
 =?us-ascii?Q?OLleDjFeklUNfBNFjEhB/0RFKPS7TOaT6DgeyUHEak0XuT1PYxh3pD6PNq4g?=
 =?us-ascii?Q?yaEJmXBXjVRlGLVzQcH8b0ZvVXXBrtzmGhSg20CxcqEZtM69vIk8rzeo9T1J?=
 =?us-ascii?Q?oPe+XhSnEd+7WlRlqxAugXZP8ri5JI7uRDQQh60v87qI5bS+FOqiHwcAyKvH?=
 =?us-ascii?Q?MWqALisD7oPhHZBDMcUkiEwDXZPQPvuhdnc1S+iltoNnMK44or7RHlSMTbGp?=
 =?us-ascii?Q?LdjhIdFqhj/9wGr/7NEw4QmR/PywJi+tGQJattjBPrDecetEPyQ2VvFOoiRO?=
 =?us-ascii?Q?g3t6Ayu5L+uU1HVkhFkrfYNcHwJa40pNbYZp49eG/Lf18rtkgupoMjOOxrfD?=
 =?us-ascii?Q?SE7kdR+W4iRhUDZa59jhCDrSgaxkJSH1qZKgDRjvb0ampcr3Ve+hdC5RXyby?=
 =?us-ascii?Q?77VNduA956mtHqAmrew5iOUBK3wwpHDqFT3NLuJAD2SwoEJLOh/WcB60DwyC?=
 =?us-ascii?Q?na0u6foAGtEDXx43QeCtmf0WiSgPeyGks2aS51q3Ax2af3QzMELQE60sL4yA?=
 =?us-ascii?Q?0KvEi+vL61Gnu+Zi1gpEULQWtlqX+0SezibRVmMeFJavjj2F9ighp/2RMQSw?=
 =?us-ascii?Q?4MF8M65ZXuq6bEBz83mrscdeiYb7WD00OshSWKdMYl3UIscT3XUoWi6ioOSK?=
 =?us-ascii?Q?KyzXRVHDE4r28NQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bzRd9Nh66MwF2yUXrXbILEwFMbBWQH/8dK7IEAHSttwjo1T3rOU9afjIYWU/?=
 =?us-ascii?Q?mG+2xmOMhmqbMWmr2z5ntH8iHTSeba+fE/4qem9mB+EVbzXpAq8xETkkfkGI?=
 =?us-ascii?Q?pYe7r84rLAZBhQVEqe1kk6hJJ/sMVakCE6WjeP1cvp5eq4Cq+LTzrk5PuVUK?=
 =?us-ascii?Q?U8b0R1u4hJ2IwvlJeAUkFlyT47SH0iHX9MC/EcJ+X90IqNGTfrp9QvVNT+Cb?=
 =?us-ascii?Q?9nTUpe7K4DoRBdZAAFFJ6M8xQfBDEZ5hjGujIduhkMEmCQ6QHA8epviwcxgw?=
 =?us-ascii?Q?Kk+O0A/y9696BpXrwcyj8y8WF3fttK9lPRFXQ/aH05upDbONsrJWp+VUI6mz?=
 =?us-ascii?Q?Wto+USYiZrZiyqUuWMkH7valwlOHanKDxpUA2OLDMiqVRiYRPCMpQyYNg/pD?=
 =?us-ascii?Q?JnfqnulH6MqnrOhG4tg0jCfbHh5zxmMBvFVJSjjDfXtxIciDrhMsxa1VJSeo?=
 =?us-ascii?Q?66pkSy9i0yC9/xbJvOWgXASgUnG7hRe6mc4TO901EFrubBhdpfBTL8UuU2X6?=
 =?us-ascii?Q?3pADAQ10GZqtruvQpUE5Pxy6o2M+N5PI0lp6qrcmkmFWsC7TzGcXHlpQOZIK?=
 =?us-ascii?Q?ysXRn447dmWYD6gS9zr+ARgtg2FiFOLS7l6DWO6Y8Ro8w4gl/sz/PQ+0YOPf?=
 =?us-ascii?Q?uZzFmwyZIVphj3RN0uLdt53VrtkchSuSzkQSy46mF6/qn560P+OK8tQT74jz?=
 =?us-ascii?Q?pxOiZ00sEtJdUf/Eex68JSXSTOe+i0fyWugc9dX5sb2z/6oSB8Vs4Xc0tYAY?=
 =?us-ascii?Q?KB2YUdO7HWbF1VtJTGaXTrJjODDA6vZjnOvufO6pQeJi3gbTsbBLxeDYXfBH?=
 =?us-ascii?Q?zobrx0zEbhYeo9jVCiVCCr03zQZC1J07QzMY3L6Giyv0jdCG0mpOzmMV8yFu?=
 =?us-ascii?Q?wMMbLgftYRJm+2f5kdOROmesLk+Ap9QsIuCCqsZzJ9FiVcyqqR7tMO0eXDp3?=
 =?us-ascii?Q?Fb8bLPIMRw/HqGKRKohoqxZRjYQjhek5Me5wkw1toTsbuFM4RLoBQtBK9uoT?=
 =?us-ascii?Q?zWcYgwDhUJ9YOu2RxGZZzuQ9Vf1H9YojEHRugK9XeQwJMut/Gt/2JAebG5l9?=
 =?us-ascii?Q?pWds0U1VOvio7C9Yg+i54CfTJlsXdgoeYsn1vIdP3/52X7YjmphODU7AkYBH?=
 =?us-ascii?Q?WkB218T1H8yKolNrCmPK0HnMNxYoKGN8Bc6AH6dMi94GEk/UoIcFHDaMy19l?=
 =?us-ascii?Q?aoZ7/J00iXH4/QKOmGF+SGHH6sH56KCBf8rxD8A8RBDk0osGKNpwkh4lZPXj?=
 =?us-ascii?Q?2AlpeZ8b7Wte55TxChKC4KxqL2/xFx7x0EOFK36tXjEKlFtut6XrhVZ5XPue?=
 =?us-ascii?Q?yDGpvvz/x6hig66CzEgxxBY6Vc3BkMDZd7QZo7f+FsaOHlauQvdoau7TqoAM?=
 =?us-ascii?Q?ayvNBv+cUbGOV2KvX13VGP07AcfSOjmRq8Ryls94iqfN9wnGg3Y8ciInfOxe?=
 =?us-ascii?Q?Mk62PnOEgOKjXF6w9bP/iJ1JK6nXJXVG6aFFCfJHVZsXsx6vPIFOXBZwzx5G?=
 =?us-ascii?Q?4nV327onbwOOPTH31Fff+mE4ft9g3W9pMjamwelVdcZbVgWHAvy0FQORTLr5?=
 =?us-ascii?Q?3D3GfuTvJ0kFqhMvwql077CddAO436XVxKhvPf8q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81546437-deae-456e-a6ff-08dd87b9a862
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:36:02.2911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+Nhp8djetw37vgjy3U1LGzX4mAhYi4L9vQdtw/YKBg5jPavJ2LXqXIcOklYyr/af2m6qFb7tuuHIimsahIZnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7706

On Tue, Apr 29, 2025 at 01:31:15PM +0200, Francesco Dolcini wrote:
>From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
>Add fan, gpio expander and embedded-controller to the Toradex SMARC iMX8MP
>device tree file.
>
>All the required DT bindings and drivers are now in next:
> - https://lore.kernel.org/all/20250331072644.17921-1-francesco@dolcini.it/
> - https://lore.kernel.org/all/20250414171455.155155-1-francesco@dolcini.it/
> - https://lore.kernel.org/all/20250402102146.65406-1-francesco@dolcini.it/
>
>Emanuele Ghidoli (2):
>  arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
>  arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander
>
>Francesco Dolcini (2):
>  arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
>  arm64: defconfig: Add Toradex Embedded Controller config
>

Except the nit in patch 3, all LGTM:

Reviewed-by: Peng Fan <peng.fan@nxp.com>
