Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ACB201024;
	Mon,  3 Feb 2025 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579258; cv=fail; b=K53Yceb5FTfJT/wg1RXYG/HLfaCHG5NZMsBofRassBoQ4Yf3jn2yntyUOCZTFXc3ZlhFL4lIwRc76Atj+FinSKhG5tG2orEG8OyoKVhkcFAAyO5cSUv8KqwhUctTbRZM4UsOVexMlyYNLGMfb3DosfVsgwJlnrQafzfKLwyT3FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579258; c=relaxed/simple;
	bh=7M7m3vj1/GB5eyE0CUXqIS6mab7ecyygsCZiCE/Bm5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s184qhmbZ7esnn8lwrPFvxu3RRU866DFAUIGJK6cUGVtgi34jRzbrirZ71u2hIi/mVcIBtmRP3DEisL7vykKAm11Qr/7ULP0TsQrxATEbtB/YLcVOujLZF5eVOljmcIFtOw/iML5rxin4HV1D4HPVdf6WsWG5og6cLgDx6WFn8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p4eqxv/n; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p4eqxv/n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYWF/uBO3ti2bFacR7NWS9LGTKdXucISwUv+aAoxAODmJfT7sc8Crj1V7nfx54fRLieWNADy1EVSYVytQ4twKBV+WAVFpM0URdmhieCQOVCcVl1cXWGThE2K17wfCBwPu4OeMjTCprleNtYevdYTpClJqkJmTVTjO1d72Ts3SmB17uXtb690GAMYMdhioyi3h5sbYjL2uBg71CLNm4/A5al45+yQqNZS0XwUDzXllq6pCX/NKHHuxf3Vg9alCBvwbZv+HXYZrEvX2VFRoi2Q2WCU5hbQFfLbJYom80RIvyvwA7FgBFjcUu0aoITNuhDJK/Q1yz27sjPOHHRYhe608w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX5XV4DvuHedKgMCvsknk7RhwB5QimN4fpv2fILHLrQ=;
 b=qr3QtmLSssR7+R/5JIPYUbLwrh5I1vbh4+trPVJR6OOckkyp/R+7Lkc3FTfMMcuzE7lNqYMhv1h7JNFqHEnAfhyQNJZ13LSGTuV5qr3m3lhyuW1gEkZGJoy3aL69H87OcsyT/YyyAfMFxbDka8gQoF5JraAOjb0mlbg9EUUe7rxOAuHeiZffYCdz1Yi+cvfM/3b7yhXhw9Lmuaa00RZ8aP5sV24/CVudkGVr1fQ86UPBYwtW2jBbhx9NQrKiStRCwmcqf7RYhY9uCrws3G61zolZfGzHVtds62nPQka/Y7yDud2dvKThD9qbERomif8aPkUSI/r+W6uhCsU794qcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX5XV4DvuHedKgMCvsknk7RhwB5QimN4fpv2fILHLrQ=;
 b=p4eqxv/nMv7TBZEiCZHURDadZ2tUtqcngTik/Rn1CfFfA34GdzQmOPEZHK/t6pTQHsZsLMsDrLX3AWy0/FRX2puIo05i/cQ43xsCfHc3b6KmXfbeNWOQ1KtOO76VSax63ECkNn5KhjqQ05clwSAsTDJIovS6gxAx+rmN9AJR5KCKDLMorii9tup5P0o4+BtvEeVkNbhDnV3/K7zALEJcoOaBglEemsujYRUG5DP/2E6XgkEcAtj+dPUjcdejQZfS8C1dkb/HMotLtqeYR+QwKJgmw7iDVxaupeTIhpO1UgwujLSzrUAI1VLlLdUwXNOEk2lElXSXz4ZU84yWhRF8CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 10:40:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 10:40:51 +0000
Date: Mon, 3 Feb 2025 19:47:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <20250203114722.GA20298@localhost.localdomain>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
 <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
 <20250202104256.GA13402@localhost.localdomain>
 <Z6CPy89TVxV1jaDn@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6CPy89TVxV1jaDn@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d21f03-aa79-4d9a-c652-08dd443f3a4a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?skpEZvyiv8/A+V513NBqCGWfASKsm1OUSWvIplcdsC2nfZz/1e91osDLJYj9?=
 =?us-ascii?Q?1L3uuaK2oK3SBBySA5BeZhrSnnKEx21smdeMWl8e3aKwvx7KewPPqJ0Hvyar?=
 =?us-ascii?Q?bzQ+3CoRsrusUFoIGv7bq10CLVmyhHEpF7i/SJYNv2HNFZ6SCF5Xr2c8eri9?=
 =?us-ascii?Q?MGSbDO8uHq3UmNDw2u0z27bP2MCMQdj8wQxmBklnHZIZED4rHUdydjVtcqA7?=
 =?us-ascii?Q?MM25SGPh11I3le/btdID6J2A97vh+FRLk69zSFypZJhNisVnOBNbVVDwqCv2?=
 =?us-ascii?Q?jOWPE/cWCbuOGjmpW6Kde20VMIfUCHZFy8pX4U7Ux+P5IS2p5+mw39R9qpxQ?=
 =?us-ascii?Q?ax7A1j8WsMQd+O/CVNh3sfx9u0SJIRnLqNuOL1P1lGeKjL43ST5aDua8taKN?=
 =?us-ascii?Q?CWFcm03P8q8QDkd3K1nuvVH9LSs4BWaP94fDQTpMkRoDabYU2s1lshhk7jaf?=
 =?us-ascii?Q?BvuYkjIwp8DeLUs5xpRZog4cEOy7kvT8Z3M+oX9VX5kmIfPhpiMAEcW0GioL?=
 =?us-ascii?Q?tHdzFU8jeVEw9Um0KCC3uqIySwv+rK+z3mD6WQt/AUmAJMbCy0nbc+gaBDaD?=
 =?us-ascii?Q?Tiqaulni57c2LwcjNxVy7nZC4HePniH8LrAUTm+e1meuk7jJMTueGMVzdBjm?=
 =?us-ascii?Q?xX+edAXF+7H4abUjfPQSGN0qxOfH06Fkvqau8C5qcU82uXwrxLvtA82tUXPz?=
 =?us-ascii?Q?bRQotYeGJdfcClEffA4CQIRHPtkYdxw5js7bO5YZNDhgznEwZiolNx8Cxxvx?=
 =?us-ascii?Q?krxQhpzAWRL5cSUR1IIGfqyC0ykew3MXS9MJNvn+UEDWrK7b+57nuAlbaJgF?=
 =?us-ascii?Q?gVYlKswY9FAU/Ulq8pY32gW0/0Asu25yOks6l7CAFj3WQTJjQC2ZB0DLKp8+?=
 =?us-ascii?Q?4nkFr4zYQ3p6P9//gyxy8oaOrcUbkHO/L/JYU276sIMTRtQXsTODMZ+uJeD2?=
 =?us-ascii?Q?KMnwMZEltAGMieXRXnnbhTto2uFwhy4DnVT0M/Br/ktntLL7JkE5X+kabTvG?=
 =?us-ascii?Q?flKg687W68pOcmb6eNIZGImtuy3eATTII7aXmoftdKzyEopZa5Dx2e43MfGF?=
 =?us-ascii?Q?6q1rTqvWRbo3YucNGje0RAare3BLppJAy7BLk+U3EsCb48YzZWf7uY8UT7n7?=
 =?us-ascii?Q?e25V58TspcJSg8+pUXfA3YZQlZiUS5xvzin6Sn2AhBEKisPXzYIDNpYNxW7V?=
 =?us-ascii?Q?45ZkNjypkh2fuIcZBrw8/25T9Zey6g+UglJO7s/sVUtsoSoIwp/7bkPWd3uh?=
 =?us-ascii?Q?4hOhYEvkMe0aaRchO5HsDxMR9MJ76efhrlenh5lvqww3sXq6np826ZORnXeN?=
 =?us-ascii?Q?hviqzCk+CXLiz12eugQzvnrNGv9yDuzFAGQhcJQ5N1E5vjMmCHVw3LFEOW6f?=
 =?us-ascii?Q?5+gUw9fDWG/8jyp5Hp1s6uDSs2eCkICqcomcLQ5ZpdrQMCI6UDEJ9Qms1cUk?=
 =?us-ascii?Q?fwpdx1uftI/4e6rVtS4+W3C3NzK5ijG0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GyvEXjeAGG8mxBaFOI6cbB06bPhbaRI9p/v02ocj2jSCUuEcem6LYKpdLdPM?=
 =?us-ascii?Q?5+iKkYCwoTe5ZMvlXTbtxckbszXtyNUL5PsLdlQScDvcZjCu78QbWc5iZ2av?=
 =?us-ascii?Q?qADyZSmFUzNyrdFgFD4+6Xg+7ljFNvN7fp9NWF8VvNxVEwReXVqWwKJqxyKC?=
 =?us-ascii?Q?7surx0f7lgpooh9Mh9NTl5YKW7NMgUDzXKomxZRZA6gcIQilauwIn1MN0o7e?=
 =?us-ascii?Q?6iprMlCHOST5B8zMJcD+omXPCkCzsdd6LqOD25UqAiSiloT9+fyeWKGKrF9h?=
 =?us-ascii?Q?VSZ7eMpVq4BO/xhSofbe/+sTv/QLWZBVFzoSGX+wG+K9hpYBBi6Y9PQvB9NK?=
 =?us-ascii?Q?vHbEGGXKpuqukqqtBK7ZezdNApcOIadVoWUvo1TA6eL5CeStiFsm9f08Ohnt?=
 =?us-ascii?Q?RuGIMEVPJnppOYxhSq0gj99sbL4/BG3ROfwcChbryeo1wK2aOi1fEov0QhIR?=
 =?us-ascii?Q?79xXvKydSIeQliHydZJRRdgHSl92eLiMxqov3gXBUyrmh72V9+xwo89t+kbF?=
 =?us-ascii?Q?on6Pnar2hjGcm9LRdcVHifRhgPhaY1sJ/rru3CAs4t9XsH1ELxcgDx49C1fB?=
 =?us-ascii?Q?0WIrw6Y4WQLqyYA88dRbR7a8WepTr3yPU32haIB1Y1zXPGnM2UAIw1aPqDxb?=
 =?us-ascii?Q?en2ELPZixMbbFavhmwj9FTz1VE0jB5UTfK9tIxj1StSm1sWDl1nW5JQUri7D?=
 =?us-ascii?Q?87ENMuxcL8KtPTL5qBAEKZ/M790KELe4Qf64pvAdfRTtL+O8VXMNqHJgBHoQ?=
 =?us-ascii?Q?KDlZwk/Q3cA/1BT3YMGAsxQwHhPm52On65YEw9i57HMjyDhtVa1Qq8YHtoky?=
 =?us-ascii?Q?iscgLhtJuuzQLc8tRQZQbPaxBfGJPMO8mMXuyZmk1uUwouWnWejtn7obh3/f?=
 =?us-ascii?Q?fI5OqE8K2N49A0JimpSsBn3Rd6BtCPZ6Zq/GCOpJymquLUr+WgLHVqpmBRFK?=
 =?us-ascii?Q?Ih6prz8uftOag056OLEEUP27jA+xf5dFquxPBIwGsvY6LlytcHOgl+nX3+jI?=
 =?us-ascii?Q?/gHU4Bb5gaUYdQDVnGwyneWJZzWZ9WbKpvFqeZuKnugMTpZS/ysMg6lxdw4y?=
 =?us-ascii?Q?h4F0XDML3tbeqeiyhcxQXChnul8oVgE3jnE/iwO6LWIGa8562zSnRG4oIbiq?=
 =?us-ascii?Q?Dmk2C7albQRcpIN6OBSsrrBEi0C9BGlVMk0LMZ0e4+HcbMXC61lwfZY5tVfo?=
 =?us-ascii?Q?FStuJRVvWTJeNwJQneXfFriN4a9lhiQwwS6u+1YGLd/9JXENrHQflxuBqixO?=
 =?us-ascii?Q?pmsZlCjKo0hB2WrEabEsI1yMbbrKA65M8A456DGGRJ0haSJxoTUPUX/eRNOM?=
 =?us-ascii?Q?jPOnTA0RIQQQjs6P46w8OUdHlgGVMNcyO8jJWdlTIrEaLY+rtZoV7AbtGZdw?=
 =?us-ascii?Q?Kjup+qIT/CmVm3SeaI2GVNMMtZnQYY4L+RKCA/Da9mcfej//maF42zQE13iR?=
 =?us-ascii?Q?J1SML/Dz4YnC0ipWtdVdXuQtmvxmABYqWBQzpKprEYxTCrYq2doFr3jAr5WL?=
 =?us-ascii?Q?wt+4z2OStfJv1tn2sf9rnzArXf4lZY4OmpFf7NNHOYB3aN6vEGlTCLSv4Y1n?=
 =?us-ascii?Q?PGBxK3k+l1m600THe9xThu0mfYnGQOGWVYTksxiM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d21f03-aa79-4d9a-c652-08dd443f3a4a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 10:40:51.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMb/gJWFDgWKWZGiL0btHvpujI8Bz3brXamlGDJB18ta6j3xEZw7AD+frCRUpEWHgBWyuZilmPD99Jl1X2eu3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946

On Mon, Feb 03, 2025 at 09:43:39AM +0000, Cristian Marussi wrote:
>On Sun, Feb 02, 2025 at 06:42:56PM +0800, Peng Fan wrote:
>> On Tue, Jan 28, 2025 at 12:25:28PM -0800, Stephen Boyd wrote:
>> >Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
>> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> >> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
>> >> --- a/drivers/clk/clk.c
>> >> +++ b/drivers/clk/clk.c
>> >> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>> >>  }
>> >>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>> >>  
>> >> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
>> >> +                           unsigned int spreadpercent, unsigned int method,
>> >> +                           bool enable)
>> >> +{
>> >> +       struct clk_spread_spectrum clk_ss;
>> >> +       struct clk_core *core;
>> >> +       int ret = 0;
>> >
>> >The assignment looks unnecessary.
>> 
>> To avoid uninitialized variable warning.
>> 
>> >
>> >> +
>> >> +       if (!clk || !clk->core)
>> >
>> >How do you not have clk->core?
>> >
>> >> +               return 0;
>> >> +
>> >> +       clk_ss.modfreq = modfreq;
>> >> +       clk_ss.spreadpercent = spreadpercent;
>> >> +       clk_ss.method = method;
>> >> +       clk_ss.enable = enable;
>> >> +
>> >> +       clk_prepare_lock();
>> >> +
>> >> +       core = clk->core;
>> >
>> >Why do we need to get the core under the lock?
>> 
>> Drop in v2.
>> 
>> >
>> >> +
>> >> +       if (core->prepare_count) {
>> >
>> >Why does prepare count matter?
>> 
>> I was thinking to configure Spread Spectrum(SS) before
>> prepare/enable a clock. But it should be fine to not
>> check prepare count.
>> 
>> >
>> >> +               ret = -EBUSY;
>> >> +               goto fail;
>> >
>> >We just left without releasing the lock.
>> 
>> True. Dan also reported this. Fix in V2.
>> 
>> >
>> >> +       }
>> >> +
>> >> +       ret = clk_pm_runtime_get(core);
>> >> +       if (ret)
>> >> +               goto fail;
>> >
>> >We just left without releasing the lock.
>> >
>> >> +
>> >> +       if (core->ops->set_spread_spectrum)
>> >> +               ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
>> >> +
>> >> +       clk_pm_runtime_put(core);
>> >> +       clk_prepare_unlock();
>> >> +fail:
>> >> +       return ret;
>> >> +}
>> >> +EXPORT_SYMBOL_GPL(clk_set_spread_spectrum);
>> >> +
>> >> diff --git a/include/linux/clk.h b/include/linux/clk.h
>> >> index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b92768896c4e45c4e7c 100644
>> >> --- a/include/linux/clk.h
>> >> +++ b/include/linux/clk.h
>> >> @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate);
>> >>   */
>> >>  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
>> >>  
>> >> +/**
>> >> + * clk_set_spread_spectrum - set the spread spectrum for a clock
>> >> + * @clk: clock source
>> >> + * @modfreq: modulation freq
>> >> + * @spreadpercent: modulation percentage
>> >> + * @method: down spread, up spread, center spread or else
>> >
>> >Did we get cut off?
>> 
>> Sorry I not get this point.
>> 
>> >
>> >> + * @enable: enable or disable
>> >
>> >Isn't 'disable' equal to spread_percent of zero?
>> 
>> yeah. Drop the last parameter.
>> 
>> >
>> >> + *
>> >> + * Configure the spread spectrum parameters for a clock.
>> >> + *
>> >> + * Returns success (0) or negative errno.
>> >> + */
>> >> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
>> >
>> >Does this need to be a consumer API at all? Usually SSC is figured out
>> >when making a board and you have to pass some certification testing
>> >because some harmonics are interfering. Is the DT property sufficient
>> >for now and then we can do it when the driver probes in the framework?
>> 
>> I suppose 'DT property' you are refering the stm32 and i.MX8M SSC patchsets.
>> I am proposing a generic interface for drivers to enable SSC.
>> Otherwise we need to introduce vendor properties for each vendor.
>> And looking at clk-scmi.c, we need a generic way to enable SSC, I think SCMI
>> maintainers not agree to add vendor properties for it.
>> 
>
>To clarify, from the SCMI point of view, I expressed the idea that it
>would make sense to have a common SSC interface on the SCMI backend too
>instead of a custom NXP since you are adding a common CLK framework feature,
>BUT only if it turns out, from this discussion, that a common general way of
>configuring SSC can be found...and I dont know that, so I am waiting to see
>what this discussion with CLK framework and iMX maintainers goes before
>excluding the SCMI CLK vendor OEM types scenario...it would be ideal and
>easier NOT to use SCMI vendor extensions BUT ONLY if this NXP SSC/config generic
>solution is deemed to be really generic and usable by any other vendor.

You may misunderstand. Using DT properties for clk-scmi.c to configure SSC
of a single clock means to add properties under clk scmi node, such
as:
"arm,modfreq = <x>, <y>, <z>;
 arm,moddepth = <a>, <b>, <c>;
 arm,modmethod = <j>, <l>, <m>;"

And during probe in clk-scmi.c, the properties needs to be parsed and when
clk is configured, the ssc settings need to be passed to scmi platform.

But per the i.MX8M SSC patchset that DT maintainers raised, 
the properties(fsl,modfreq and etc) needs to in consumer side,
not provider side.

So it is not feasible to add properties here.

"assigned-clock-sscs" could be put under consumer node and clocks
could be configured with SSC when needed. This is a generic property.

Back to NXP SCMI vendor extension, if SCMI spec could include SSC, NXP
SCMI could move to align with spec and not use vendor extension.

Thanks,
Peng.

>
>Thanks,
>Cristian
