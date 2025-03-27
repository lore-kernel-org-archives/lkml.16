Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0E186E20;
	Thu, 27 Mar 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089143; cv=fail; b=bB5sZQ1OlFx3cCQdfl289ADsEOY03Exy5JDdPTKpwt9179DO9yXbEnnXcHpTlnKLWbsEBzpzHDWUNiumiIsVzjbluYNYF0UVIggh+9x0OaxBHuTvRKXW68VVsncFeLJeciVeOfIyaoHSwOCD/+TRHpb1o+rKhoJy0IQq61aP/LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089143; c=relaxed/simple;
	bh=qgMo5yeiUmOVvPX1AN59ZkCU1I/oA0vJXIf7K+Zh54c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rABnP3egUvORJPzTU+w/tiY4tGXNOuJeg0UM3EzlCLRzacJ83CXUl18/o6qC3+JUuoW90mQRFmTTivnB/0zndjHn1Y/wrtaPb7Grr7NtnM0w3gOCklX4F4SJLrTAgthDbEHY22HERD1lb+ipTJykJReO0xOdSrBXPyb8sf4tVuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cwcp2q7o reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cwcp2q7o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HboV/7qP5kuVh44obJuSMkDJy4i+YT1l+Cor6mbCtd+uF5/ZIVmi+tMoh233sjtzQQsK9r5Kn63EiUUJgRDNeKhdHylg4ViS4L4buxeOzYXkRkdJL94PVVaMlqUfjuZS02mY17c5b1UHqcaF+2Ac8EsK1EAKpTCs43bZ4GwPhVo6pB+IUx/wqVLRB566Etai0sx7g3CDeagTTuxDH0zKTnuSUsK4X78gO1dcgvw7LMKMzILubzcrHNb4G0JC+bIOfIHLA0pH5Gle9L6SAY/5OS5lpOqeAmTOt0AjNXMgx8k8qYErAeMD5jBnnlEeJW0RYufDs7QHPLkxMRB+9h1+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUMfURVqhhhvciDmqg6y2Jk36NYPiqDhkJtqEjAtLc8=;
 b=I9/xms2QkUWS/24stSShlaA0Se/iDqdWdLi6RWxzueSli11YfunYHChJ/b6SbsChcZoukptE2Mrgwu7LIslWzmc9pM2HnsDtbLAL1JNHn42mSG8TNOHF87Jjstl2TsmDtwbCoTIkaXDoHCgM1sG8QbByc6Ry/9+FA52Dj413n6DGPi90LVx2Ot9KujcOWPqcfF9kbnInkLkvgOCyTQosYWJAaG3AFUXKkaZHHr6OB4MrjpVCeOM/QUDRTgT4oqto2QVSjpFOmEcSV+KGAHpKCjo1xarjsaJ63P7bSUntrl5lsvfAIbmobUMCbMyO1wXL454suv9cnWt82dMkl72UWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUMfURVqhhhvciDmqg6y2Jk36NYPiqDhkJtqEjAtLc8=;
 b=cwcp2q7ooTrIwuKSf8nrVPWs/lyMwm4ZbCEwuavZxBRPkCrOPU8XHgfi01j9y2g6Re77gvU+CWVk9k2BNHTTUiaeqKKoJjPJQ3xtxB+GYUFoJ6EdRqZ5dnhAfNHxgN1y2nSzvMcaBMJKaA8x5jJh071EGrN/0sUqrtaUZIsRiJcAb+vObrW36P9JIPlLkHlYUZD/9dFLnTNPXD1N6YgYR5m7xHMGIskwNTy+sH6JXijrVeIkz3hKqLn+PP1ROOJum9bBf0CKhAFTebG9ggQhboJcnmjAAZJxy7GmbvxOGF1topgkGcIdV/y1qIJREALaNVmFP/qjo/rxdB1PC8Y35A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10625.eurprd04.prod.outlook.com (2603:10a6:102:48a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:25:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 15:25:36 +0000
Date: Thu, 27 Mar 2025 11:25:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for
 Tianma TM070JVGH33
Message-ID: <Z+Vt6ypdGOS6LYGJ@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-5-alexander.stein@ew.tq-group.com>
 <Z+VoEI9Ep3izRKBJ@lizhi-Precision-Tower-5810>
 <3347513.aeNJFYEL58@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3347513.aeNJFYEL58@steina-w>
X-ClientProxiedBy: PH7P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10625:EE_
X-MS-Office365-Filtering-Correlation-Id: a768f61b-fb15-4a12-a204-08dd6d439fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?9VF2jMHJMxsg7jC9oI5QHHG80Iv+GAf7sZJvOAxUSbmWMX5asF2clt8w/O?=
 =?iso-8859-1?Q?nJwwq44tKBmeORn/EHwv1GVJG2qnJ+A+HJkB7yVJe9NjSoPMDCJ/dmtNHf?=
 =?iso-8859-1?Q?VX4tFrjW+Mo6ckZMzM/RlAcVjjl6UD6EIvHCxpNDclsHSlqwS7h/lS6AAR?=
 =?iso-8859-1?Q?4YudXRIRGgQdVAGwhQWWjlHcCGnHkL3LC4yQ4my8kqJH6Vuq5GaVSSig/z?=
 =?iso-8859-1?Q?HANKbvXCFPYAcpcXlVCY/N3ikW/Hd1sGkVo+tJKwsg9LoAj/23rLQ2JPgT?=
 =?iso-8859-1?Q?6CLi7Wk8DMrdA/8YQd6l1o49brU2dS1Fl/UKP53s1AJ0A2K7/qCNt51Qrh?=
 =?iso-8859-1?Q?v2zy3wkC/kOrdkbuCsF/t3YIkWV2hrtTfBd0SkILpnq9FzkMqYt4op8mhj?=
 =?iso-8859-1?Q?Xyd/DFXu4JugyWUyEv5B4sCWHiOETWqPlqzRDlEl3ZUkTFUsKf8upz6G/8?=
 =?iso-8859-1?Q?VdvVesQBuCnUPVIBtTKQtaJgoU9be68TSuLfNY7TOKE5sPitWii//rWnVr?=
 =?iso-8859-1?Q?q8s4O+faMvEuJ8UOaz26UhBpdUgJDOR9CpwTW+E+i9bb0l/f62MhByNXBU?=
 =?iso-8859-1?Q?RsPscXYSITMqPCVUZ6duMZnbrCxBGv1WNyZt477BRf+ORdHE+GJ7RBBW64?=
 =?iso-8859-1?Q?q80PHtxraTIj/ObvRKzM2UZYJcQzGS+v7SkSCxKjuFDosi2b4Vg3a+sPjy?=
 =?iso-8859-1?Q?owEgty6AzebRMX8WzBAa/i15tked4VWlnK+zT3CZ0omRH4kibvraOvvRVj?=
 =?iso-8859-1?Q?1wZziBP6oiwADVx0VH1lMrEZHw/XxkNKW+jqqBfX9cr2GqAy/owmQOMWHM?=
 =?iso-8859-1?Q?VPjuHl0m4KxACcSk5shKJQKTsyYMtHEFmSYcC1mgdUhnWciXWx7wRHbCub?=
 =?iso-8859-1?Q?RA5CZMp44Xg3hK71k+hJm8iY8YtksZ+rEl+UsIc5E0DOfEwOvwrUaOv3Ll?=
 =?iso-8859-1?Q?z58PWKVdfAOMRcNd9TIGCTi3hcb0q3xa1Y+KjOPCYk00LVLOwhKAuuPxe6?=
 =?iso-8859-1?Q?loWxpNXf+OYZ9UxPJLHkVPDs6Yw09ZJJ5FBfSfQ+u5PjaAhI/eXlT5sQn0?=
 =?iso-8859-1?Q?kJJXi9wR7GlZps8BD7+Z4iURXysBcb5kJHgqA5ue33IKPTjPSkqUIKzFFY?=
 =?iso-8859-1?Q?deDwfPS0r7gmNaeW9t80QjuYTpDO2liPJTMyywOm9hSkm8BiYxq0eIs9MD?=
 =?iso-8859-1?Q?zYS+N62jiI0IlIAGmlPPlwAue4G0XgmBTTXxjWA2P2oQrPC697O15PXFMj?=
 =?iso-8859-1?Q?mxl03kKxn31Fn93mxv0uQ+Sh9Yy/rg29alu5i5uenVGMJp2QQViBZJy01M?=
 =?iso-8859-1?Q?y8IF4OQNHqMKRuZacRx6jJ6aJwm9CxYZBBDA5ow/ei03d7j9/fGM1QWR0b?=
 =?iso-8859-1?Q?u4/iA061et8X4LQXKz7osNb1prwLKB8CSfW8Bsd6zTJXBEwam+hkelF/Sa?=
 =?iso-8859-1?Q?dIOzxUnshRLrTdFv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FTF10vi+b9VfdJn4/s1NPAndU2yAIP4zXobG8/h3ISiMsO3UXrnyezMdjD?=
 =?iso-8859-1?Q?jEi3sDNGSo1couUzAl6OgD4JvALHQQ4IktVOQeLUUfvZhP6wvWdENlFwtw?=
 =?iso-8859-1?Q?rgyXbNEHkAxPdaIF9S7h2G8DfHbz0E9GxiqxJyahvmL6rYFpzru1EraeWK?=
 =?iso-8859-1?Q?mheP4Ex0/oIHiKZR14MVZeepSiKNFJ2SQr3ZyvhnBWjX5FWTijr6yXx1ib?=
 =?iso-8859-1?Q?Ezo5cREY8qpZcwCJo2928TVMDfZjFJO2S9fWjU/N4QYNnYi+UOU3pIY0Gy?=
 =?iso-8859-1?Q?Vy0xgGX7/4mx/KzOE8CqjhYDRlwC9MpZFW86XLs3+TwRRy8TyEShsoesST?=
 =?iso-8859-1?Q?Agugnecx8mGzU0PA/m0lEHzl8fqu54aYShM60t7AuG32Ka3v/VTgblePC5?=
 =?iso-8859-1?Q?zKmUrHn1A07yuidZJI9WEUit16i+HTB6k5Wz0ioKR5z25iCbD/dGKSAq4R?=
 =?iso-8859-1?Q?f+CdWcWro9yu1HIbsS3U/oOsHT4M+ODMmpj5s6bOpF0EDCFYmQju73doG8?=
 =?iso-8859-1?Q?3sk1MAIvOH7jYQfa6GM259In+COnCLciCNmq20sJ95zoQo38A0Q9tdO2u4?=
 =?iso-8859-1?Q?yD2e1CZ2FVe5Cw4qbtH0Y/upd7Ne2ct8K4ITE932hF1+GtxHrDvsu1zT3W?=
 =?iso-8859-1?Q?cuKlL2/3KAxTB8QwkdcRy3j/f5bKMaIDl1x5WDplwBQv+ajgLGSHq9zHm4?=
 =?iso-8859-1?Q?4ygIvYpx/V7589SmcCnzO8DnbwHuo5NtaCzci+t0+NtlRAVX48k7z7/ipD?=
 =?iso-8859-1?Q?YqhYXK6F6gtqj+DMOOfSxHBXlj3gsYdtE3sJKBOcSCWIv6rGWF5Cq572W3?=
 =?iso-8859-1?Q?+D2Mp1M+x+MD3rTI2dTKI0XtPJpwRr1nCkikCThAAZW9rXimXq7foiHaib?=
 =?iso-8859-1?Q?JEwbyLMy9wJo99EoVb8XRmmbjyVUrIuIx0cSzsGPpdV6obFO4jv+Rso/Mt?=
 =?iso-8859-1?Q?hFVwv0drcDW4T2Vb7vut5RJarXHidnKajsigeECII0Rfnn+nIJ0A1BHAEz?=
 =?iso-8859-1?Q?1PFNe1pgbKPFWGJRvC05TQLk331cj46tNQsHbxr2rNRNvTm2asNShV5sL5?=
 =?iso-8859-1?Q?5NMo/8yhcZ9qM2xUAmkUIGbFJTzjyr+W6sZRHw0sWft512ZnmAnjXXcf+p?=
 =?iso-8859-1?Q?7VAk6GRoFYT1MrG7XZEegXkIB1/GchG56s+ovcI9VgfKNaH3KvLlxNAH7n?=
 =?iso-8859-1?Q?FK4XRcp5VwQz0ukZcs+fOJ/daMUe0VMwYvDLC00leo8GiuehmtDvWUv66O?=
 =?iso-8859-1?Q?oD/YtH4MATHeWAZyqZICZWrkwyGUPdZ+OaApBCMceU+HYRIZUzfrZp0K1l?=
 =?iso-8859-1?Q?IEqdKLhdLrTrWbSwdh1+hRW+4R+kRAqnXMH02uKQ/u/SPZZcKQXIg0/Psn?=
 =?iso-8859-1?Q?DgNi6nFXfHWBPEf3ESKZn0dXtK1kIBkdfN3D5ewoALMqDNbP3q8LyBjOYp?=
 =?iso-8859-1?Q?ziO5ukEfl/4gfOcBx190zot1jodxhc3TH1l2Kk4zSOnUQ4OjirP4eiuOF/?=
 =?iso-8859-1?Q?XuuyjJAU6EukIG0IqKqjsbiHHwpQwJwTzr/AJyBcFlccui4wrAn1fo1hxj?=
 =?iso-8859-1?Q?W/00xUl7o7dK/ELi3Lxpk7n6FedVBslnRKiUfRek4Qzsqx0VWPc2/LfzGp?=
 =?iso-8859-1?Q?s8t7knnSvzmjqHCWP2kB1tTngdNFTmXPN7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a768f61b-fb15-4a12-a204-08dd6d439fb9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:25:36.7974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ1/fKDn2bcriTByZfFr/JoTy3OeYW77aP1M28rYqDIPorXCBXNPb5mk9MRoqMC2Q1Ywi7AJuCTxiw3nNMHaWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10625

On Thu, Mar 27, 2025 at 04:17:09PM +0100, Alexander Stein wrote:
> Hi Frank,
>
> Am Donnerstag, 27. März 2025, 16:00:32 CET schrieb Frank Li:
> > On Thu, Mar 27, 2025 at 03:41:10PM +0100, Alexander Stein wrote:
> > > This adds an overlay for the supported LVDS display tianma tm070jvhg33.
> > > The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
> > > accordingly. Add the missing power supply as well.
> >
> > 		      ^^^ missed?
>
> Thanks for the comment. We are touching English grammar here and I might
> be completely wrong.
> IMHO this gerund is describing the power supply is missing the whole time.
> In contrast to 'missed' which indicates it had been missed (just) once.
> Anyway I don't have hard feelings.

Me too! I am not native speeker, just feel "missed" read more fluent.

Frank

>
> Best regards,
> Alexander
>
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
> > >  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
> > >  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
> > >  3 files changed, 50 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
> > > index 225a7665b8ad1..7f96de6f80224 100644
> > > --- a/arch/arm/boot/dts/nxp/ls/Makefile
> > > +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> > > @@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
> > >  	ls1021a-twr.dtb
> > >
> > >  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
> > > +ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
> > >  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
> > > +dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
> > > diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> > > new file mode 100644
> > > index 0000000000000..e9708f3c67403
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> > > @@ -0,0 +1,47 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > > +/*
> > > + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> > > + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > > + * D-82229 Seefeld, Germany.
> > > + * Author: Alexander Stein
> > > + */
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +&backlight_dcu {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&dcu {
> > > +	status = "okay";
> > > +
> > > +	port {
> > > +		dcu_out: endpoint {
> > > +			remote-endpoint = <&lvds_encoder_in>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&display {
> > > +	compatible = "tianma,tm070jvhg33";
> > > +	status = "okay";
> > > +};
> > > +
> > > +&lvds_encoder {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&lvds_encoder_in {
> > > +	remote-endpoint = <&dcu_out>;
> > > +};
> > > +
> > > +&lvds_encoder_out {
> > > +	remote-endpoint = <&panel_in>;
> > > +};
> > > +
> > > +&panel_in {
> > > +	remote-endpoint = <&lvds_encoder_out>;
> > > +};
> > > diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > > index 27a55fa638128..80dae0c09542d 100644
> > > --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > > +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > > @@ -147,6 +147,7 @@ hdmi_in: endpoint {
> > >  	display: panel {
> > >  		backlight = <&backlight_dcu>;
> > >  		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
> > > +		power-supply = <&reg_3p3v>;
> > >  		status = "disabled";
> > >
> > >  		port {
> > > --
> > > 2.43.0
> > >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
