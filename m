Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F4158545;
	Thu, 27 Mar 2025 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743101330; cv=fail; b=L7VLVN90NvHc2hzTKWf1yB837uthqAnizpVYkO0ZkHwxnYdOVKB6aVkXdVvqdVFpRwSCkgOaeB7t0JeCbDCq0yXoFNxvewwgoiSuUprgUYKWSIv4gZPw6x/rs3UWaqTpnogO7OA2CVXMl+8e8HNUP7eKRMbeFS2GW83Zm94hdf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743101330; c=relaxed/simple;
	bh=kvDv1UG0AaMkn6SdoTK4dYHbUTcjvlRVBJhqyPZLRF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GaB3DAZYXPla01olcMgqXTPiiqZdld+zUUQD0Befj2THEnml4ZWlyhnRG5r7HJXYq6Idy8JxpjatmmB75EBoLTVknZLtP3y57NGTo5dl6JGGJOtbVlqzP7iJTCwKamH0QI5SREttJlGlZg87xBBK1BZec5NeXO/gXm5UFCRT18o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JrftdQNr reason="signature verification failed"; arc=fail smtp.client-ip=40.107.22.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JrftdQNr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8U9IGQbuoqZn1jtv9sjNMbHF91I0HBsetc4HI0z3oCKlvbXyPQ7znKE9VYdjNlDNvVl5ZOfMMyduPt9JX/HM7M8cps6qRP9KfqmkiWhxc7dxQdTOWHBlkTcei2F+Rq96WXpYHGZ6iCvphhPXJt7O79SqFKv+PhWX4HGm7Eu3ebTP29PaQrSCmdzQ0X7kBX7372EgQoK2zt4PIr/fMlkFz2JFMSzdrNKI2Bm7iWoA9sMthb/AZgGP7kvs2p2mPk9ffBYKL1NKlizgFsIU7fHjmkUh3R/Zv9iQyLJ/H+N0AlzBTNsQ2oFSdqJx2N9nQ9E8V7+LICwP1BtKpE/mKiPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ETPIiX54nDjU2r/1e+ZI0aeUj37hTbbMn3u0KFVr30=;
 b=QE1sjk1kUvG1s8RImP8IoMumUAfxwEv9ABqGkG2myTFpro8GLZBozggQJJvdLq1mx0NAxXQwCGB3cNsQ2ut+2G9qVsca1ACAzLMosDG9wTlYmvmet8AkA25Q/mdgIfZRXp28Kyiqqj5/J7AhW3fhrA1V11yZEqTUjTpcoJvofmjK7HSzAQkbSitk/b3hmNycb/He8edwBiBcrwi8iMQmXyjylCuHBiGmPK1xGpCP79iVZIPToGM+NWPRaoibXsgQlrSii+dXQlE3f9dHN0B0wRWiReY4lsNcWrtWfFnjzMafpcrA2uzB68Ul1EO3ku3yU6ldZmarIg3i2dvmhZ/b7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ETPIiX54nDjU2r/1e+ZI0aeUj37hTbbMn3u0KFVr30=;
 b=JrftdQNr8qU8tXVnS1i51648ugVQMUaIE/KZB+r0rm1izYDkPs8bOZC0gQ/J0p8u8RcXr8wryZ2MHjZ1Y+am7ltEZK6eFJdLGYlGHZW2ntT84tTLzx49/OfidKOsKndRzD3zpaUs/sI2I6DZnPfW64ambVtdrTYp10eKyfmN3Obh76iUbwVLg4H8pfi2L1MdMP2WrFJWDtbeYYKbpbKWyNmPwhQVZdUAILt4KpaozeFh96SxzQZwEq7JATvzEUZUFn09tfPpN8SAgW2tUswinEj//v3UP0g6xQkKkMxryOBBqkLTWqJDDDwTiQKoABXiXy3yZwewy8HmU/BDJtPknA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10250.eurprd04.prod.outlook.com (2603:10a6:150:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 18:48:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 18:48:43 +0000
Date: Thu, 27 Mar 2025 14:48:33 -0400
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
Message-ID: <Z+WdgWQo4dbPG5tP@lizhi-Precision-Tower-5810>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <47051102.fMDQidcC6G@steina-w>
 <Z8HXIvAZcvNY72Jx@lizhi-Precision-Tower-5810>
 <3661300.LM0AJKV5NW@steina-w>
 <Z8HuU6ULEN756lyr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8HuU6ULEN756lyr@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10250:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc3be9d-eb23-4183-7a51-08dd6d5fff26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?4JfE88Idbu8bs7XKRviIzr+EkfUexLC4+QXalBFlpmtAg1d5TLy/hGuxDh?=
 =?iso-8859-1?Q?H662EVsD+/btwt0KDT1offlTXLI3XsgWJYmWtpTttliq3/JwOJO1p2DJzO?=
 =?iso-8859-1?Q?nkzGUTOJnbLFWLsbXNvACzS9lasFYWFGT45vHwXZwc1Axyoi7hdwk7/piO?=
 =?iso-8859-1?Q?Ddzz9SjYnEFha+2UlTOVKv2jaE52LogPuq87nxjgRP4pKdwVBgJOQ36LoK?=
 =?iso-8859-1?Q?hcOBF8+9ZKlzjQGGCjrg2WiWRxIrgoTEqV/NTyjvsmjoAm+8V6JELezGcs?=
 =?iso-8859-1?Q?dGuylbctRNLPW9zjFVzl8OB8h9VVwwaDy70JeAlFc3Ltrr86nfRHQ775/H?=
 =?iso-8859-1?Q?skwobxZmgNTiOXFRHE9OfhroMbrxcEMhGi4+GTuWomQEjFWEUS1zzxnplV?=
 =?iso-8859-1?Q?9PePieA0j6S2YCqzhbtDxRWxrSuGi79mLmjhuwvUrv/FJQQZ0vuSM4lKbU?=
 =?iso-8859-1?Q?FpepKS9JLWoHwu4Wlb/eQB0EcuKcOU1Ujlqt2YetmBD3lUGPCd+U240wBd?=
 =?iso-8859-1?Q?VE03wChWtjR6ddsh1d3EpzqzLJx50ykiiQjINTgeUUU07PsOhYUw6OjU6I?=
 =?iso-8859-1?Q?ZQfT+3wvNR+fPStBR+GaVyXQABNquSUtY2PGN2y5yqRo2rkbPdKi0kNlpn?=
 =?iso-8859-1?Q?K+Flyn6WL+Jpd3PJpj2SKSAD649Bjgtp9dR0/orcs4SWKPapQ9JVeIjaal?=
 =?iso-8859-1?Q?1z4FY1jrIrLLk8r3HXVutFMnmwFb3xyvT0H+xY7pYdSQ9usyU5us8zrwML?=
 =?iso-8859-1?Q?PbiLM5W1uf8aTUgKcIlJjs2C/MFY2USV8muYfLtYo1/nHK+ILfsGWjmxjE?=
 =?iso-8859-1?Q?4L1iWkiPYWFU0vtvLLf+fxJ9XLhJsTAGAUnyPhGZ+rxznT1aknjGh6KF8V?=
 =?iso-8859-1?Q?Tgv1iyoRCJDRpHMWcsuypaBSekYg1do+I0ZETJ75dnyhfmkDc+QblVpYa1?=
 =?iso-8859-1?Q?y0NLTIBt4FeFo8o4aL/MZmWQ7PqUv9JIgWy25mSaRs0C3cydpCyx+pVJsB?=
 =?iso-8859-1?Q?0DZP3NV/WCMQ8PeIBe8tyaKD/K1gh8Ve5EZ+txBTLqmmyhDNzUBySVwcFE?=
 =?iso-8859-1?Q?l3SCOatgBLkppnzJxwerq5S5aOaENaJg36yczSp1jAfZayugUGS6JPRR3k?=
 =?iso-8859-1?Q?n5FGi2cTn93wt7WTIqTv6HcFQyDgWttB4ILzD7dURPWy2JY1+2gw1I074I?=
 =?iso-8859-1?Q?3WTKcCa8Pk80DWpWf2BdHnqLKhjmY10dvCJZKCnBfeQ9I1WktibOWpZoT+?=
 =?iso-8859-1?Q?n6jGWlo69fFnmjYaCyjO69fEWMrUNF1d7ClbEpd0kfaumManKsHhXrF6KN?=
 =?iso-8859-1?Q?7YrPaImb3Eo9YDW5xTyzYDBh2w+oWk7mqBZjUN/m1k2s5ZVCBp+GbQ2OTL?=
 =?iso-8859-1?Q?SLxbQ/ZSDHq0l5GEEIOG+naYOnjomHm0karKeYykcXcGYwWQjnzUE+VBaP?=
 =?iso-8859-1?Q?45y2HXspg9XB0N8J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?c9sWhwJZg+1uCM4XKrv8Obj/MBn8cnfXdfq1K0KEH9RXlOp6KUOR+B8HwC?=
 =?iso-8859-1?Q?keMy5de/Y+WSiPegloZVtos5XbAZ6nFzBCVem8nTLFTCnOrK53vRs0mEOv?=
 =?iso-8859-1?Q?VHz2qACcpL6UcApenq+nzkVT4H9iHYIqOcLf7IjL1BL0YLsieOlgo7RzNJ?=
 =?iso-8859-1?Q?RQT2vK9DCbGEcnbBidqS99kRZOPfKbl/bnxSf1qbgH3cIGDF9A/6+9Sagv?=
 =?iso-8859-1?Q?bKE/79VXwwPWGg+aWwUfYVgILmVwxdyPGLl5kwj1+NuZr4EIxFX4tbxLIu?=
 =?iso-8859-1?Q?9W8RjdipFw4tJtEZwzR7oFbBkvFgII5E4ahX1E0nQJvdoGCyZ9/W9//aTF?=
 =?iso-8859-1?Q?zhnVS507TdwFWAMKhm4z0sTMzln7BZ6OTyMqdOxXcuH45PZ4uNP7LvJpZl?=
 =?iso-8859-1?Q?tOKmBtycj29Ipydk1I76XGxr6/g6l/r6SGPLwbN3DPwI4oHcanzUFphwfj?=
 =?iso-8859-1?Q?tQdjAWlloMaWLq6Bdq8GU8YKj9OaHLctihBrQobwRrJqYOZJAKTLUEphfR?=
 =?iso-8859-1?Q?aeYv80w/CXqh2nkk828oFIdyNTi4GNskKAc3knx6XHSzb83T6Y+P9P557w?=
 =?iso-8859-1?Q?aWvCMMmzM6yEvTf1kmqah4VJ0iKonK9fhAjCQqgqdWx/Cir3GoCj/oIgyg?=
 =?iso-8859-1?Q?HIvKkfXJtm/B+R46iJUNfp6Uwqg/crR+XzIrsIr/koDwPaDOVIz++4zVv1?=
 =?iso-8859-1?Q?/84EmUzSVOWcISxGSPD+b8ga1jAXakijsS6K9QCjLwU9WWYCfGnJygv75A?=
 =?iso-8859-1?Q?+CsRnFTgp7EYEjd0jJLUSfeMDvAhZrX6ubNGyLYf9Q+nRbnoqyeA6y8jL+?=
 =?iso-8859-1?Q?tjLrCK16BA3EtV9mJ8rwvuGSIoOrwfCd5ga9NnYr0ZJeWARWizL2cxLhVc?=
 =?iso-8859-1?Q?WvMLjT1TZH1n42dw24HRCDMz+U7IiUk95vywF1aKd+fZZIxybFG4ckm7gd?=
 =?iso-8859-1?Q?5S9SG/zytEBhH+63tAVTzoTtGlpiS22uo26RxJKqHkBpHCOMT05VF5MVDX?=
 =?iso-8859-1?Q?GZNNf4DgxGrTNyOhKfwKclK5O78dvbQlf7N4VmuPmaanPW/C64qEAo2XpW?=
 =?iso-8859-1?Q?df6JJ7rEORlrz5lnxdw/HztYHVXa89l2PiGWnd7afN/+i5ZaM008qUjm9G?=
 =?iso-8859-1?Q?p1DPKcjOFL5/+dFdkfZhk6RdQj1ib3XiHf5Rcw10xfeqqOKLmSyJ4loscX?=
 =?iso-8859-1?Q?DyeWMlgoxe5FySoIb8W0jERgMH0hUBE1nqfa1KjxHVatQsyIWxI2v4+ajc?=
 =?iso-8859-1?Q?BerlojEvUqCH/m88szKakXNfY0CADFWnkFjiPwIgd6ddTYKoC07dUDrDq4?=
 =?iso-8859-1?Q?kxpP5GwLhdt76CdEHumRe7WLdrtRuCwwZicNrqsD8rFzqot0SANTYhybk+?=
 =?iso-8859-1?Q?uyCluJFp6u70G/iUBI7abZhfmA1auCo3FKf0qioYRP4kp2abQXP8rC+Mif?=
 =?iso-8859-1?Q?9n1FRYlinIoIKSxyI+sjyFDzt8tJJNsky0GwXHCl9sGftus6DTapzFPUY7?=
 =?iso-8859-1?Q?rIN7vl1YMV11sf9HFZz0UeikH7U8o7bNCjJzmuO9MZkrM6vXyu1QHKB5yh?=
 =?iso-8859-1?Q?hlEqNLZ3iWnxxZrIelKGnXb0VPFzVHErbj7X2Q3Uz3VQvpt7tbkin9jCbR?=
 =?iso-8859-1?Q?9rxuRpqyZ7aFG8E6hdqiCeJL3ieHDbAiMR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc3be9d-eb23-4183-7a51-08dd6d5fff26
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 18:48:42.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIiZ9adlCSYH8n5C8aM3te9qAzKtK/Dxh4W0n1NXt4HM8OmaRHU09wVWyStxfhMZls/IAhHXXH9xDhznNXQmfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10250

On Fri, Feb 28, 2025 at 12:11:47PM -0500, Frank Li wrote:
> On Fri, Feb 28, 2025 at 05:01:15PM +0100, Alexander Stein wrote:
> > Hi Frank,
> >
> > Am Freitag, 28. Februar 2025, 16:32:50 CET schrieb Frank Li:
> > > On Fri, Feb 28, 2025 at 10:08:58AM +0100, Alexander Stein wrote:
> > > > Hi Frank,
> > > >
> > > > Am Donnerstag, 27. Februar 2025, 17:39:47 CET schrieb Frank Li:
> > > > > On Thu, Feb 27, 2025 at 08:54:13AM +0100, Alexander Stein wrote:
> > > > > > Hi Frank,
> > > > > >
> > > > > > Am Mittwoch, 26. Februar 2025, 17:31:26 CET schrieb Frank Li:
> > > > > > > On Wed, Feb 26, 2025 at 01:11:37PM +0100, Alexander Stein wrote:
> > > > > > > > Hi Frank,
> > > > > > > >
> > > > > > > > Am Dienstag, 28. Januar 2025, 22:15:58 CET schrieb Frank Li:
> > > > > > > > > Add PCIe's msi-map and iommu-map property because i.MX95 support smmu and
> > > > > > > > > its.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > > > ---
> > > > > > > > >  arch/arm64/boot/dts/freescale/imx95.dtsi | 14 ++++++++++++++
> > > > > > > > >  1 file changed, 14 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > > > > > > index 6b8470cb3461a..2cebeda43a52d 100644
> > > > > > > > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > > > > > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > > > > > > @@ -1573,6 +1573,12 @@ pcie0: pcie@4c300000 {
> > > > > > > > >  			assigned-clock-parents = <0>, <0>,
> > > > > > > > >  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> > > > > > > > >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > > > > > > > +			/* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 */
> > > > > > > > > +			msi-map = <0x0 &its 0x10 0x1>,
> > > > > > > > > +				  <0x100 &its 0x11 0x7>;
> > > > > > > >
> > > > > > > > Aren't you missing msi-map-mask = <0x1ff>; here? Similar to pcie1.
> > > > > > > > Either way, with this change PCIe on pcie0 is not working anymore,
> > > > > > > > regardless of msi-map-mask.
> > > > > > >
> > > > > > > Yes, it should have msi-map-mask. During my test, I have not enable enetc
> > > > > > > so I have not found this problem.
> > > > > >
> > > > > > Just to be clear: This is not about enetc. This works fine here.
> > > > > >
> > > > > > > > Without msi-map-mask:
> > > > > > > > > OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > > > > > > > > OF: /soc/pcie@4c300000: no msi-map translation for id 0x300 on (null)
> > > > > > > > > r8169 0000:03:00.0: error -EINVAL: enable failure
> > > > > > > > > r8169 0000:03:00.0: probe with driver r8169 failed with error -22
> > > > > > > >
> > > > > > > > With msi-map-mask:
> > > > > > > > > OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > > > > > > > > OF: /soc/pcie@4c300000: msi-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > > > > > > > > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > > > > > > > > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > > > > > > > > r8169 0000:03:00.0: error -EIO: PCI read failed
> > > > > > > > > r8169 0000:03:00.0: probe with driver r8169 failed with error -5
> > > > > > >
> > > > > > > Can you try remove iommu-map and keep msi-map? then remove msi-map and
> > > > > > > keep iommu-map to check which one cause this problem.
> > > > > >
> > > > > > With only msi-map removed, but smmu enabled:
> > > > > > > arm-smmu-v3 490d0000.iommu: event 0x10 received:
> > > > > > > arm-smmu-v3 490d0000.iommu:      0x0000001100000010
> > > > > > > arm-smmu-v3 490d0000.iommu:      0x0000020a00000000
> > > > > > > arm-smmu-v3 490d0000.iommu:      0x000000009b0cc000
> > > > > > > arm-smmu-v3 490d0000.iommu:      0x0000000000000000
> > > > > > > arm-smmu-v3 490d0000.iommu: event: F_TRANSLATION client: 0000:01:00.0 sid: 0x11 ssid: 0x0 iova: 0x9b0cc000 ipa: 0x0
> > > > > > > arm-smmu-v3 490d0000.iommu: priv data read s1 "Input address caused fault" stag: 0x0 r8169 0000:03:00.0
> > > > > > > enp3s0: Link is Down
> > > > > >
> > > > > > With only iommu-map removed, both smmu enabled or disabled:
> > > > > > > OF: /soc/pcie@4c300000: msi-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > > > > > > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > > > > > > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > > > > > > r8169 0000:03:00.0: error -EIO: PCI read failed
> > > > > > > r8169 0000:03:00.0: probe with driver r8169 failed with error -5
> > > > > >
> > > > > > Only if smmu is disabled and msi-map is removed the driver probes
> > > > > > successfully:
> > > > > > > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > > > > > > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > > > > > > r8169 0000:03:00.0 eth0: RTL8168g/8111g, d8:9d:b9:00:16:10, XID 4c0, IRQ 160
> > > > > > > r8169 0000:03:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
> > > > > > > r8169 0000:03:00.0 enp3s0: renamed from eth0
> > > > > > > r8169 0000:03:00.0: enabling bus mastering
> > > > > > > r8169 0000:03:00.0 enp3s0: Link is Down
> > > > > >
> > > > > > > >
> > > > > > > > Without msi-map/iommu-map:
> > > > > > > > > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > > > > > > > > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > > > > > > > > r8169 0000:03:00.0 eth0: RTL8168g/8111g, d8:9d:b9:00:16:10, XID 4c0, IRQ 166
> > > > > > > > > r8169 0000:03:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
> > > > > > > > > r8169 0000:03:00.0 enp3s0: renamed from eth0
> > > > > > > > > r8169 0000:03:00.0: enabling bus mastering
> > > > > > > > > r8169 0000:03:00.0 enp3s0: Link is Down
> > > > > > > >
> > > > > > > > pcie1 works as expected. But this is only a single PCIe device, rather than
> > > > > > > > having a PCIe bridge.
> > > > > > > > Any idea what's wrong here?
> > > > > > >
> > > > > > > Can you help dump more information at for PCIe bridge case:
> > > > > > >
> > > > > > > imx_pcie_add_lut(), need rid and sid information.
> > > > > > > drivers/pci/controller/dwc/pci-imx6.c
> > > > > >
> > > > > > Just to be clear, without msi-map and iommu-map I get:
> > > > > > > imx6q-pcie 4c380000.pcie: rid: 0x0, sid: 0x18
> > > > > > > imx6q-pcie 4c380000.pcie: rid: 0x100, sid: 0x19
> > > > >
> > > > > Can you help dump register value PE0_LUT_CREQID offset 0x101 for your
> > > > > smmu-map or msi-map enable case
> > > >
> > > > I am assuming you meant offset 0x101c, as stated in the RM.
> > > > I added a dump directly before printing "PCI read failed" in r8169_main.c.
> > >
> > > Can you point me the code about where "error -EIO: PCI read failed"?
> >
> > The error messages comes from [1]. As far as I can tell, this is the first
> > read after pcim_iomap_table().
>
> Strange, it is CPU read MMIO, should not go through iommu at all.
>
> >
> > > I tested nvme devices worked at both PCIE0 and PCIE1.
> > >
> > > Which PCI switch do you use?
> >
> > This is a COTS MiniPCIe ethernet card [2]. If I'm reading correctly
> > the bridge seems to be a P17C9X20
>
> I order the same chipset one from amazon. Let me debug it after get it.
>

Finially we get realtek PCI card

it quite complex, there are one PCIe switch to split it to two pci bus.

 lspci -t
-[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-03.0-[03]----00.0
                                           \-07.0-[04]----00.0


0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
0000:01:00.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
0000:02:03.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
0000:02:07.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
0000:03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
0000:04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)

It need below change

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 9bb26b466a061..9dbf395b9a67b 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1660,10 +1660,18 @@ pcie0: pcie@4c300000 {
                        power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
                        /* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 */
                        msi-map = <0x0 &its 0x10 0x1>,
-                                 <0x100 &its 0x11 0x7>;
+                                 <0x100 &its 0x11 0x1>,
+                                 <0x218 &its 0x12 0x1>,
+                                 <0x238 &its 0x13 0x1>,
+                                 <0x300 &its 0x14 0x1>,
+                                 <0x400 &its 0x15 0x1>;
                        iommu-map = <0x000 &smmu 0x10 0x1>,
-                                   <0x100 &smmu 0x11 0x7>;
-                       iommu-map-mask = <0x1ff>;
+                                   <0x100 &smmu 0x11 0x1>,
+                                   <0x218 &smmu 0x12 0x1>,
+                                   <0x238 &smmu 0x13 0x1>,
+                                   <0x300 &smmu 0x14 0x1>,
+                                   <0x400 &smmu 0x15 0x1>;
+                       //iommu-map-mask = <0x1ff>;
                        fsl,max-link-speed = <3>;
                        status = "disabled";


Only 8 stream id assign to PCIe0 device, it is hard to dynamaic alloce one,
or need extra works

Frank

> Frank
>
> >
> > Thanks and best regards
> > Alexander
> >
> > [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/net/ethernet/realtek/r8169_main.c?h=next-20250228#n5454
> > [2] https://www.delock.com/produkt/95237/merkmale.html?f=s
> > --
> > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht München, HRB 105018
> > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >
