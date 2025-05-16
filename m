Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D5D3232;
	Fri, 16 May 2025 02:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747361893; cv=fail; b=m5TW7d5k2PVz6+ejgoVtpK1ggMAjtvL4LGOktIakcigVRKqTPL8rOF1X3k+fbJq6f3JAta0Ag1zshN8AZguiy0ItlBzV4w3Zq3RyC9NUC0+nPytsPRWmSfRDgDmXlomoh07c5IL10lpQwETEpivqPhTeid9N4nTX6nqCiUqNQ2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747361893; c=relaxed/simple;
	bh=drSdXpmfgIdiVwEZaSJvuxG+p4o5LJlIOG7CjyVLnTM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AHky1AcrO6ywz//ntVGsgoRxq6H4gl1a+GCnmzm8oSmIi0hF4WMlqqBgoNcMUV5SF00Lis7Yk9g+uI9/Mgx2oOvaNuJIX61x2HEmxNdcjg4WKjgebzj7lsi+0h11uYxmo7dEH7DwinZmduy367JPxEYODhz9TSlO142W2liRnRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Nn0HAQdg; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Nn0HAQdg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdKd4MU1pxDHTZForDdOjM+DyBW79nfTZWI0JLAt3R6XeMMbYEpndXN+2rPzdBrxaS+oUnbQSlPFEEWOzl5TBNeNfwgHZyHI0dl7R6d+CzixGKCSosIIex4S6Jw+/Tc1dw7v9UdDpswenGzf+3MkWOyuUm0plBoytzMNtBDHBH1XXDNp8LpxWyp1RQp1hDd9WLIoi4UenNQlwFbX5AgxGk1sgdRAeteF66R9TN8ePJm1BUzegtgadopWokxDe2X3jVjnTZj7NtPjT8pbEQaemH9vnUNCjgcyCvpG9IihLfG7X5ns/ucimc+DwpLgGTbUGjaADIA3AXjdnEd3+huZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6lQudrQGHUGbGftCvtx4DT7j9WlBEvO+6tAyqDlnFw=;
 b=EdwEHZFIYjY+LaQnvzYOwMjCf4dOhj6FDiQ/+l09XyuUKH08paKdGDZAycehhkg7yqRFC9gAZCq1qnvsCs1o0EJx8WhRzmsTmEf7+zSn74lzF+7WneLJbfG5OsrHIGqVGcmwc4SpQuq/rPE2B4xXQpp0S159WHapNsrSVHeR4tpahSJuwCRUWa1NNd8tbBh/rMSX6vFeJJJ7NmRwftxNwYBfci/wpGlOZcg8XqboiGK8/Ruptm6NJnvelCLUAxJcAvN1icKdacvfaSlV3p6YW8hhlaRYuldR8utdyqzeUl2gd9EEB7O7qTv88t56cA4nUBQID3ghQ4sVEGHA3tn1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6lQudrQGHUGbGftCvtx4DT7j9WlBEvO+6tAyqDlnFw=;
 b=Nn0HAQdgmjRtThcdlQm+lkJ30rlm3OWkMLUnAkciRDDnuL6Gcrrf8N2VO5IqVjVEoZF8r193JyK7Spmbhgr9mqtGZ/dzquDsg9TlpaJWZOQymFqV2k+S3yc5tM03f2oovsoNYng2QSQ6c0GmrXAE/AEms24dumBuhGn0e5QxEXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYTPR01MB11064.jpnprd01.prod.outlook.com
 (2603:1096:400:3a1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 02:18:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:18:07 +0000
Message-ID: <871pspti1t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org,
	shimoda <yoshihiro.shimoda.uh@renesas.com>,
	goda <yusuke.goda.sx@renesas.com>,
	Kurokawa <harunobu.kurokawa.dn@renesas.com>,
	Kihara <takeshi.kihara.df@renesas.com>,
	kazuya.mizuguchi.ks@renesas.com,
	takamitsu.honda.pv@renesas.com
Subject: Re: Question about UIO vs DT
In-Reply-To: <2025051549-flannels-lively-a46d@gregkh>
References: <87o6vutrbw.wl-kuninori.morimoto.gx@renesas.com>
	<2025051549-flannels-lively-a46d@gregkh>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 02:18:07 +0000
X-ClientProxiedBy: TY2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:f6::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYTPR01MB11064:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b9125d-4f45-42b3-2537-08dd941fe583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JOlmynv1ozKpjwguHybRnouhraWpLQhntdTd7hLM7pXD8eQ0jV2IyZpS2S1f?=
 =?us-ascii?Q?g+dnAr5Qsn59ujprtj/SQejToFi3ZRhjtKtEUT+QcusI6T5iDtE/ZUt1APfs?=
 =?us-ascii?Q?QzmKxNEJzdVSBt0/V52rjGTxceG4qK6VVRs/G8TR//uPpTqtCTNel8A0/Tca?=
 =?us-ascii?Q?4PI3KelrLVCHjfuPa1idTJbYMnMeGPbYVqT+Tm+y9Ke7C5xKeniazOgqai/D?=
 =?us-ascii?Q?8LBA3FCzmnZT0IpOXOcS08mViTRclJ2UZA++Q+xgjeV8w4a3oxZB15i9iJIZ?=
 =?us-ascii?Q?R2nrdk0f4nEErsJR8urFkc3Qc4BnqekB79DR07/C8C/EWxqS9qbZMk0RtTqa?=
 =?us-ascii?Q?aGme1HGar8VdhVtR8ftyw5Cy4IJ06Ng97S11vSSpSc3pfXi2YQcSJozzbVvX?=
 =?us-ascii?Q?Q0Twv1nD5TPDbZc/dWT74T2Aik6CH/jjXIKG8zITkhfZfRUj3BOuYkB7rOB1?=
 =?us-ascii?Q?zHOdDe4Wa4D06T4MIVSP7zmCcuFQ0fKh6SLZI1Ij/CaTjV2eepVmlSalGO2E?=
 =?us-ascii?Q?zJ3eir9/tV5yLspEGZ0uCkg3K+1+XOS4+6jXMB+2J95p3fs5gEgFZmkE4kMv?=
 =?us-ascii?Q?Na6mXfsngVxCZ/lwW9AZoKvo05oQ4MZ6PhMxBcQYWOexVlxai/brw8hTpuzr?=
 =?us-ascii?Q?37NQdafAKseqaQCbpGVMoRTsUUNPMdqDd3Ez6eWPeDN2JXdVyLS3N+LoEXZm?=
 =?us-ascii?Q?yLHpdkLE0lUC6pp7xJD0fMKmlm/kp35d122OmwXSM4IoQRwtYntdyyYTA1YH?=
 =?us-ascii?Q?V4QGZ2MM4OKHTR15F//hwVQYXf2YEfIHv4XBDRiX3HZWiAdQ3aW9+xeB4ntU?=
 =?us-ascii?Q?REi7yossvqBeel235bZFPbJjbo/l1zA5JqLR5Ux34iq8QNaT4TS5Vs39JZTO?=
 =?us-ascii?Q?/ZKlRq+oNT8VU5F3lLeG5FiPgIAI8PhOoabJJf9ex8TZFbabqTkykiZRXQCM?=
 =?us-ascii?Q?J6MObDcO5M7LdlnlsoZ3k/MS0EU4X3CpyBWyrqtRC7alYcucI4VI2+ur2Q5+?=
 =?us-ascii?Q?iFGumCmeopERensLJTTcupj+iEaiuz4m2NYy2MOGSmBrnmIU4L2TYNEVpcEy?=
 =?us-ascii?Q?6jP36Hu8wgkGHKOdacX8Fj2C6I7HFr0dF8VXDvoZBg1RlFPLFmLB/8F4CSpG?=
 =?us-ascii?Q?foSsZYhAKJdC9WbI1esyXBD2G+VVQON9EHAfgdqdQOdmD2QcG3Rsd04y3oR8?=
 =?us-ascii?Q?+u//KGfA+kYEb0L6wADDeHZhxLGp70r+RmhwCdqCHw0ww7PdCACs806io3ud?=
 =?us-ascii?Q?bY6yVc92NW70pmKeqPgkwEePohT1nmWhSXWIXGGYd9MLD2U6sMwgZEFjJtcn?=
 =?us-ascii?Q?n24ZYHlPLPRAwBV5q+O/d2V2kQVj5jjcsjYKNZiEvk6306fkfvVCg0ExPwrD?=
 =?us-ascii?Q?Ujq4V05w5pfzmxbedowoXt3DUjZo0SPLYk2fswKJv6uB9MweY4BqztIf1+p5?=
 =?us-ascii?Q?1pH8kz2h7Pxxvwv/4jAIZmmGMPPZsPjC/B4x8xbDhpUDc/5CaiE6Hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eucq1X1TQkZsYlJIqRi6MrLxdym6Us3dV/Y8bpop8SShdx+HeeaEeZOZKdfJ?=
 =?us-ascii?Q?117uYsyBvrhiAIXGljqz+h2EiMKBr2iGIZDecPx1ovVyuZJabfOFe+bqbNzG?=
 =?us-ascii?Q?UgXmf4wCQjOzUSykzlgm5Kun/QhPSKGzLsYx8+c4raNPbHhwHP+4FG3O3ekn?=
 =?us-ascii?Q?XuY6gCPnm+f5JLATq/PrtJtSaz71tkHJJ8cEbPZ4c0MBHwxOUuTwwWZmTuCr?=
 =?us-ascii?Q?PPVYsVx7uvGw+K19qVsRXxIVmEO/vshy5CR51gsXt3gy0Jx4ewOai9676CLs?=
 =?us-ascii?Q?V3jg2ksqycs2RYn9HrUC2nbpqBlQWdx0ahliDEsaPUsKhIunWMBJGVY+kVLM?=
 =?us-ascii?Q?AtUews628zeNOGLQ7ws7GQM/Ciymo/BrMYHsl22zxNfSqmD83kLcsKH7PcBm?=
 =?us-ascii?Q?DcEkiFC+HLNwgxtpVbBuXZ067Y94Zti0UM0XtAqO8fw+41/JlPMhV/Lll9it?=
 =?us-ascii?Q?HIibW/Vs/GVR0VWZFLT0NR51AW7qMRqP1LkCp+yKfpPym1HaWtGdTILgdcFp?=
 =?us-ascii?Q?RNgtz8wGYwQ4MlMLKMTQzOCNao6qoSvZ7KK7AqqpRx+QxLs4dj568VPBnGUd?=
 =?us-ascii?Q?JD14EU1mQyFbyDDIz0fmUU5YqauwALkqk++utkUA5+iN8wB0rO+bzrWyFGK1?=
 =?us-ascii?Q?6xqbZYVyupSdHf4NWXH3HZV/qFv1TbiL8ybv9GRSWwLbmvaOFbnux0jaX5Tb?=
 =?us-ascii?Q?04P/HPrYz/FUdNayg6igH73VfimzTmAMqxRGAy3RhNawO6A3OHSjOFF8rJIT?=
 =?us-ascii?Q?3mz1BfIgQXxXbea5ItPLs7vv9SAoi6n8o2TYtFnkhMvBfHWnrDdXVBRUCjNb?=
 =?us-ascii?Q?uSndX3PU6dImytEk5khr/lm+ReB8UtpiMSE3guz+Xfn1X6OgTi6qPnXV96Kk?=
 =?us-ascii?Q?p31az/kmmMWorv0mKv6LszwTrOuesdszGwWgoacsG9w6N+2lxQYoaCVYj+sD?=
 =?us-ascii?Q?k/X+ERUEiJ3NHZXVaa4ik3gSabLpiA0tw8/RsnH94WEuRY43dMjLOB3lBO2s?=
 =?us-ascii?Q?4zEKe34R5xIGfolVrOApxTFeSHOcIskh7ymPk/aAU0u1yZBCf5ll4+f+2mv0?=
 =?us-ascii?Q?bxf+TedpRTmTNABIf7tVzE9YXrBkl4G5eUNg4u6mrFQZ+JNiedQrHg4YnZk5?=
 =?us-ascii?Q?NHNaprgSHHAWZqgHW1v/cmKJzyNNW1pSLPmdPI6sr39+bRM2eOuNdXQ8jfWl?=
 =?us-ascii?Q?Yny9NyBgxt7D6jKniXXig27LPjCqyfeG+jCju7TYrKFKL5Tgnns2hyfLcCDb?=
 =?us-ascii?Q?MYBVWhKzHTdkL0BWpDn+0OY8f5D1jLorLmb4KxCqflXP8RZ8LZxRubmbS4sS?=
 =?us-ascii?Q?MeZ1AddKERAdrQSfWdTWKz7ymPDx6zo2x4mzF9DmlbByYtVKhM+Zvj1ufWpY?=
 =?us-ascii?Q?JTEA8cwq57qM9niMfAeQXMM9lYE8Bld3x2stidEk7G35gqyrFiMIuzuSFgLe?=
 =?us-ascii?Q?s73Mv2LH48ZFfhGD5e1hXsMtxEyQ7gcZ3TbCQ5L2Yp7mrKImuZvgTVWYTvsq?=
 =?us-ascii?Q?fb15r0iF/Zs0nQAkmKH0BTP2L7AdWJvSl5lF/LbQafz1rYXSadnv0P0aQM1O?=
 =?us-ascii?Q?3+ubsXIrliqhznyF6gPvpGLOp5nTs8xaHjtmy1URkUUnmw6Jf2R2pAr7jBAr?=
 =?us-ascii?Q?woaNgvYC06VGVIObeE+T1ZE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b9125d-4f45-42b3-2537-08dd941fe583
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:18:07.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKJbzD7ak/CbltRgWEbl+x0eru7HthT/Ifv9CYc1ND2MU0RjX4IEvPAOE2aab+JVsysj0Jc81DfPdqzayeT8Webgyusi1NYI7rSoCwoE3MUKReLBjJw0ND3u0ZQZqvE2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11064


Hi Greg

Thank you for the reply

> > For example in case of
> > the device which needs "2 regs 3 irqs". it will be
> > 
> > (A)	[1 reg, 1 IRQ] UIO
> > (B)	[1 reg, 1 IRQ] UIO
> > (C)	[0 reg, 1 IRQ] UIO
> > 
> > and (C) will be DT error. Is this known issue ? Do we have better solution ?
> 
> Yes, write a real driver for the device as obviously it is a complex one
> and UIO shouldn't be used for it :)
> 
> What type of device is this that requires this type of hardware control
> and why do you feel that UIO is the proper solution?

One of big reason is license.
Because it needs to be proprietary licensed driver, we can't create
real driver.

Our team is thinking it will be no more DT error if UIO can allow
below, somehow.

	reg = <reg1 reg2>;
	interrupts = <irq1 irq2 irq3>;

Thank you for your help !!

Best regards
---
Kuninori Morimoto
