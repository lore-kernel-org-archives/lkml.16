Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F31F3FC8;
	Fri, 11 Apr 2025 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382562; cv=fail; b=qfghrUOCPqT8mltxnZ4L0yHHQd3gWjAfZtb/+xX1GinniEyCt17rYTlo76F0AAzQpmF2JEad8Sv7Th3mPbM4MOd6ttB7HURvSTlEYrWe2htUnYVTCI1WhGNhk9sSRWuZklLWI1NiV4/32qpx+gxFtLzhEv1BXeSgfUiyMV1MiWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382562; c=relaxed/simple;
	bh=GvZTCHdPaCaJfzeeJojpBaxYcEHmPIKG+w6yVgkcOls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pf9vwJn+EJY7kXUrZUjrbfryJqfpztah+88eA98QFxAgPQ5LXaGF01fNgq2bq2J4Xv36v3YbvOsbef7e/s5A376ZTn+4yej7snaJcPwu1lkU/CoMg7ECbGFAp7GhErLVdYqwHVKCZczYtUzPp8c41BOPvtSSPrLrcoi7AdI18nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OkuTsg8I reason="signature verification failed"; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OkuTsg8I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUXhjcCtc8cor0W4qlukccv46bjAdiDRa/jRnDQvmPy6+qHnIykPG/51l9Jw5AHuUmc35CZSE8/ahVW5DJGWeT5IZ0wsjV+kHgaJQ5rJuQhNUhzAIMHcyfp7VahDDRJAaptkXdlVWLkRdhhnTtdb0NoENfnbjyp9jRUplmIzaQoAFX5Y9mRhrM7UipfjrPolXq+3jpGQ0CxuGYqPhU6ecf17rlpATIXW7Za07scsO7lTO144q5f4iSs4gFWQK4CfJPTfBdyOPp4KmXw8yy7u0khk1pnQehMhyFhqB4HUoNF1mItaqkBueqzYM2T3kpnbg+EQ5dPBIumR9H465+TWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49xI7buebdcZrVAIUpq3U7XDqckLg2pJp2UNr28Iq/k=;
 b=myAZjdcRFHRrHWVqwChRanVOBBYue12GxpF/VI8VYeB63Sq0Y/5SAtuuAraYw7mjMgFDUQ6f0lB/adGNus3PJhoGaA6Qzv4V2ZBz+2/H6MsKfwbLQA59FPGZ4my4mY6k5Ub4mG+E1yWaruk1gc66pPT94OVyuLW5YDIZ9FEle7xta+JCdDOgfNIOScoY9rPmLUHpgkx8gCEX2HBbAmYTBlG+UwroxgfGBWmL3DmWTZkoJS8spOC7vSGh/YXk1AWNzJWcBKFSLmFQLfLJ9OIEQg8YY7y0x/Tc0oTrZaiHZztSrDOvjMoJwvmv6R3i+wR0tZ+ek6LwQ6iqsD6p2WTaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49xI7buebdcZrVAIUpq3U7XDqckLg2pJp2UNr28Iq/k=;
 b=OkuTsg8IfXGhHtJY8jsbc7dfuk2VEAYhxf6ppOgJM3ZzilOqvfQpR0wOs3TMU+AuvLKBRVQF0rhPuQXqXP3KDSO4MWc25ORgaiwrF/qvFND/SGKeImYcpAQsrxg2Azg9quawjgYfsQN9aWukXYC9tL1T7aS8lOpxputerKaSvnXtzjL9YrZHTtHyPET6733ubFx3895wpB11bGl+UT4DuGvo5d+j7H2BBTjccz0vT3I27CrzPW+EhpMDIZDN9Bp0JuaykCB0Fq0+07y8fawAsjVa9uCdTMp/0UnX3wTfuV2bne+rx9RzTqA3tbrorXLrVnh+Hgm+lvAUPLNg51z3Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 14:42:36 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:42:36 +0000
Date: Fri, 11 Apr 2025 10:42:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, hongxing.zhu@nxp.com
Subject: Re: [PATCH 4/5] arm64: dts: imx95: add PCIe's msi-map and iommu-map
 property
Message-ID: <Z/kqVYPOV1Em+6H2@lizhi-Precision-Tower-5810>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <10643619.nUPlyArG6x@steina-w>
 <Z/aLSWGP4mimMNlv@lizhi-Precision-Tower-5810>
 <1970445.taCxCBeP46@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1970445.taCxCBeP46@steina-w>
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: e7996837-4bde-4bf5-8688-08dd79071a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?fA7lfZRV1TzKErMK++hVraqCJsQNEKqoL25CeVmu5AjUjG1UhiXvrPZ9GH?=
 =?iso-8859-1?Q?kY5L/HE66eIgucHaG6md6ScaXegR4DuP1/io3TSZ+Q3O7m/KSoaue+3oNZ?=
 =?iso-8859-1?Q?aNxWa441TKZALGXnH4H84o0li+aVCYPTb3PtdoICodhiWLfRPzzTnAjske?=
 =?iso-8859-1?Q?ikvDu2W12DId4AFhcqS/3iFvfQBpl+4OKnYp+whtO1xQ/OY1iKRFKjHGWN?=
 =?iso-8859-1?Q?P44KN7W0KztUeuOm93ZmrkNPBxBXkqByCpEH/xQCJd7tbuObZtPBf+AK9w?=
 =?iso-8859-1?Q?IcH/+ASD01LQ20nvhTdIShuDbTrc39hBdFq/GIXAt+GiG+7nFvw2X39JoN?=
 =?iso-8859-1?Q?vA4UYyOQXfY1hL6pBs7EH62XcuRuh9aWT0QynGBOzUZ9aUemuUQMmvqRyi?=
 =?iso-8859-1?Q?O38zSN3iNgJ7zV9MHU7NqjJd4OdGf9NmaiKqMYNe/FW4YLqsBXlKIqlrnw?=
 =?iso-8859-1?Q?uJsQDD+rODqjaDOZOXVrIr+NImtib79mi74wlFQ26xYLzTthUSifD3cQDk?=
 =?iso-8859-1?Q?O6Vp18bNoWQjAodp40ZHoLBwU9m/hJEeuCRdPEJESRxUlIZo6RRyZ6lfCt?=
 =?iso-8859-1?Q?s6O6OYdwLoTenFrT6CYvGI+UGr6pXjuO+YPHQa9WFx2yzD88aNtQNQ/tj0?=
 =?iso-8859-1?Q?LFQ/UrQPIe/NkcGeqaL3lCYLcKA/PF+o5iRtljZ+JQIAtnSiNCuUrhIvEl?=
 =?iso-8859-1?Q?mP2ac4cVv2bFIhPUqSup1ZWRu0dvTASJ2VH50QBMl4GnvT0tzM13l4SfW+?=
 =?iso-8859-1?Q?A7O4ikNeAYj+sJApTF20r1MsFCq60cK08Sv6OZZgkt4zYWvm0lsctEqbg2?=
 =?iso-8859-1?Q?CxOBkK/UaWeQmlSGCEP0qhkIVSxH/mgGqNkQM3qZhi6XveX8UWhtSTOaV2?=
 =?iso-8859-1?Q?CLkxexg1UmRJBhSf2lNVU6cHH/qEVGgb6Z8GedaISRI5VNpTaW+hpzbkai?=
 =?iso-8859-1?Q?tZLendxuwIJ/jZrH54K9C96LBrcJdORgj9EUBT26ZXIn4InFbOkNoQOWIc?=
 =?iso-8859-1?Q?RnsQs//F2PrXrYpA86ENXVr99TmCP05NNJtMS4+yurSHjsJLeVY3l7v2iN?=
 =?iso-8859-1?Q?Z7fVGyO84QAgG8wLVfzOAVU6ZWrtpGAuNFzCM+UO5bti2vaa7PpIpsnIia?=
 =?iso-8859-1?Q?JlxDayWCLDcPNWXNKDOqrm64KmuMx0/Osmht5mvRZZPElAoGzSf3Cxl/Oh?=
 =?iso-8859-1?Q?dm5r/J4ZmstNFWMVcZuH/HBWKxACAgUorr65jEkCetd0NVA0zRvfshdujZ?=
 =?iso-8859-1?Q?9L6z/7NI+ef5AR3VoZTkl6X0YiV48NYhPHGWQ8AcgjAKmMp/xy/HcImgSu?=
 =?iso-8859-1?Q?qiR4gWvuOqAFCkaU4QKUM6qS+snrxI7MWpkZ8xJKaSsEyPKuGyc7cntbzU?=
 =?iso-8859-1?Q?zs+Pa+qVXkjXU70r+W/lJNSI0Cmkx0xFA+ehBpF0p1YlwPPf0Gm8/h+qlF?=
 =?iso-8859-1?Q?ov4VsV7Wg0/RglqQGn5nNJG7JUMc7zaHm+2SxPXqY4/yULxYBUv9HhMbfY?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?XParyvsnQDqz0X2lPsZELaNWMLNfvYULoxk42U4V6xiGr9wHtqWkXT701Y?=
 =?iso-8859-1?Q?fL9NQ3481HFyHi0jca21srG/4VA0/RUS4+N6oqShNi4ud72V7TOvItteq3?=
 =?iso-8859-1?Q?oykkN8mJ7/RVV8wYJtsoCG/U2hqNIh34mumqb7/C4QxsxPmXfqoQvDMfw0?=
 =?iso-8859-1?Q?3j9Ho9YySyr95H5z8P/P8foVFEFDkR3D/SBE1XX8ZBHC3RiBd4ctpMVKQT?=
 =?iso-8859-1?Q?v4ObFOHJHq3Byectjvzn3WmRsESGoRnq6KelErhgpjew0su4WcbTZDYdBu?=
 =?iso-8859-1?Q?MmrmzuOtIoC+riNNH6nelb2ccjefavIBdHeP2ppA0iGgdSf3AarqozvSMc?=
 =?iso-8859-1?Q?P4yjWxH2Nl+eH6fPr+qqJAyjzkheOkdHuNo2KfpbAsgyxnfnpO8QkwDbJi?=
 =?iso-8859-1?Q?88yALzryYSgPq+TpWrABH4KurKjiGPphrHGD/bVW0hOAthgAyiwG148HNh?=
 =?iso-8859-1?Q?O1jezH/4FxTzZAes16enRBykCq+Ut9QhsAjMmdIZW5F4p/F0G+VhDjB8qy?=
 =?iso-8859-1?Q?0VohXi1rb6BCIJompl/NzBKidQf1E4p3zZjUXFfaXpsRGBjer8+OSyJVvw?=
 =?iso-8859-1?Q?t6XULZgUuKL7X7dIDpoMf6RJB/NI+aUuY3dq2tIf+ZhkyXI1TWkNVliw9l?=
 =?iso-8859-1?Q?D/3lheqD605fUS1T3ldckQ7Z0h2MTVuc9mQ2Tz9JnLRzKs2mDeIKDMRwHl?=
 =?iso-8859-1?Q?kpgkoqACEhQQQuZ186b1Lwc/czo6mjafJsfu1CP7apxSXAR3Q3bqbD7BUw?=
 =?iso-8859-1?Q?jQNYfIaJtxpIE/dkX/DUbg82xid24T0D9OicX8cx0iLpbQKaONbwQz0tTt?=
 =?iso-8859-1?Q?xrDoyW0Orzkjzk7Q3H0TMr1lg4jk1LSfz8aPQi2trE6UOgAvUsvx38ECs5?=
 =?iso-8859-1?Q?VTYGnyonxpSi5FZykTPbINt87KTPy6eRgmJljMEvtWiX32wgZDp8BOKHJS?=
 =?iso-8859-1?Q?XZG4D7MEDwyj8a3G5HXMNLhGUfbd//GxvNdCy6uNobDzswQJI+HXrVKKul?=
 =?iso-8859-1?Q?NkYHrCGcg7htiV+t1ex8nZDdV2naY3veIAIWtw2HhJkWIL+uQKobTfSHgg?=
 =?iso-8859-1?Q?5mVivrTpNYMh3wAeajiWb8Qs7Sr5t0mbbUc7OJviBTYP7/5BchTVtOc+0p?=
 =?iso-8859-1?Q?0WZxImurTABs+W3jTMHuabtCu+0+IDkVXVmlyKhs81U2jSNb5N7AOtDpb6?=
 =?iso-8859-1?Q?yfbYPAJYrYai09Cw/QaUnoG8+bh6KV7hava5blAKiIqcerdMAMoLxHJigY?=
 =?iso-8859-1?Q?0K4+PEssQnSUKWYWkHYZIQJVbjmWB3HujHwMeRqRsJeAiX3PMhhFyCshfD?=
 =?iso-8859-1?Q?cMsJjrjW8pP3h2OVpWdxftmDOBr/uEMpmFBfvHVn6I+qYftarAD8hVH0St?=
 =?iso-8859-1?Q?fM9wpx6FMAz0zLpGBz1kHPahM7s2IXaNPpdf32f0lud3z/5MbaXfEBLJld?=
 =?iso-8859-1?Q?nIZSH7GBIby/+c+K2ZqGWU+Q/LmZJ39wUKq8WX0Yz0qO82F77QCYngLdqy?=
 =?iso-8859-1?Q?Y6+5773f50fvqvJ2D/OKFJygE4dM50bW85u1h2mEAbICKXTnVDfWZ3evpV?=
 =?iso-8859-1?Q?qbrsnhwMgEtBiFT4WXLdTaxRB9FHnk0uF2bW/OTat4z6CJtcF0dSJqLmJw?=
 =?iso-8859-1?Q?7VjTb9zAxgYth5Z0S7m2EuKOq5wHrrUzGP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7996837-4bde-4bf5-8688-08dd79071a01
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:42:36.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ05S/vKQ72CTM9nvIgbVd7AczsB249LgCjHwMR2ZN0S53Qt0qNJUVm71pKVxHG7yXhR1p51PYG3dGfFhkJ1qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256

On Fri, Apr 11, 2025 at 08:53:02AM +0200, Alexander Stein wrote:
> Hi,
>
> Am Mittwoch, 9. April 2025, 16:59:21 CEST schrieb Frank Li:
> > On Wed, Apr 09, 2025 at 12:14:48PM +0200, Alexander Stein wrote:
> > > Hi Frank,
> > >
> > > Am Donnerstag, 27. März 2025, 19:48:33 CEST schrieb Frank Li:
> > > > [snip]
> > > > Finially we get realtek PCI card
> > > >
> > > > it quite complex, there are one PCIe switch to split it to two pci bus.
> > > >
> > > >  lspci -t
> > > > -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-03.0-[03]----00.0
> > > >                                            \-07.0-[04]----00.0
> > >
> > > Interesting. Mine looks slightly different:
> > >
> > > $ lspci -t
> > > -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-01.0-[03]----00.0
> > >                                            \-02.0-[04]----00.0
> > >
> > > >
> > > >
> > > > 0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
> > > > 0000:01:00.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
> > > > 0000:02:03.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
> > > > 0000:02:07.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
> > >
> > > It seems you have a newer hardware revision. I have
> > > 0000:01:00.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > > 0000:02:01.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > > 0000:02:02.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > >
> > > PCIe bridges.
> > >
> > > > 0000:03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> > > > 0000:04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> > > >
> > > > It need below change
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > index 9bb26b466a061..9dbf395b9a67b 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > @@ -1660,10 +1660,18 @@ pcie0: pcie@4c300000 {
> > > >                         power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > >                         /* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 */
> > > >                         msi-map = <0x0 &its 0x10 0x1>,
> > > > -                                 <0x100 &its 0x11 0x7>;
> > > > +                                 <0x100 &its 0x11 0x1>,
> > > > +                                 <0x218 &its 0x12 0x1>,
> > > > +                                 <0x238 &its 0x13 0x1>,
> > > > +                                 <0x300 &its 0x14 0x1>,
> > > > +                                 <0x400 &its 0x15 0x1>;
> > > >                         iommu-map = <0x000 &smmu 0x10 0x1>,
> > > > -                                   <0x100 &smmu 0x11 0x7>;
> > > > -                       iommu-map-mask = <0x1ff>;
> > > > +                                   <0x100 &smmu 0x11 0x1>,
> > > > +                                   <0x218 &smmu 0x12 0x1>,
> > > > +                                   <0x238 &smmu 0x13 0x1>,
> > > > +                                   <0x300 &smmu 0x14 0x1>,
> > > > +                                   <0x400 &smmu 0x15 0x1>;
> > > > +                       //iommu-map-mask = <0x1ff>;
> > > >                         fsl,max-link-speed = <3>;
> > > >                         status = "disabled";
> > > >
> > > >
> > > > Only 8 stream id assign to PCIe0 device, it is hard to dynamaic alloce one,
> > > > or need extra works
> > >
> > > Uh, this looks awefully complicated. Even worse this doesn't work on
> > > my hardware. I need mappings for IDs 0x208 and 0x210, so I replaced 0x218
> > > and 0x238 from your diff into my numbers.
> > >
> > > So I take that PCIe bridges are not supported properly. What would be
> > > necessary to support this?
> >
> > I remember bridge use msi to do port power managements.
> >
> > ITS msi-map can distribute difference irq to difference cores beside iommu
> > address protection. It is quite userful for nvme or network devices, which
> > have multi queues. Of course, we need more elegant solution.
> >
> > My card use difference pcie switch chip. But suppose it should work after
> > you update RID information.
>
> Yep, after adjusting RID mapping, it works here.

Are you sure it work after adjusting RID mapping? you said
"I take that PCIe bridges are not supported properly"

So I am confused. If it works, I can think how to allocate a stream elegant.

Frank

>
> > which kernel version do you base on?
>
> My development is usually based on current linux-next versions, so it's
> based on v6.15-rc1.
>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
