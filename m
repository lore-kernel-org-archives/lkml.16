Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C2125E457;
	Wed,  9 Apr 2025 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210774; cv=fail; b=RDBFIeBWZiO4nJEGP9+RrqBGubRSeClXFpXkTN4Dip7vNPcWL3ml9okxFoY3XColMTvR/QIrkJPaoCKQ3zcjJHYPss3nckITtdGLTBMU2HYh795YT03kuhRdKhhM9wbQbhd/TYbbTQK8+CvHlv2anVPjlA+aE0TxWSLc/Z4/bbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210774; c=relaxed/simple;
	bh=XQhoMsFPd8c64bApWD63vwxn6OvqXTPEUUYJNnvAu4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gqnOtsgFlZGPvCHS88HO+1P46gZ2Y/+eaoYqafpVr1u9AuKKtd9/+J7+PclYzNZojZVSdq/Gi623qQJHwblCQZRCto68VFh53hgBs4phLslE8dW6VdN5hontMzAQ/nS8wv6RtNtBYQXjrb6s1riY23MyotEO6ENTLTED+kbtV3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BKkgyq9h reason="signature verification failed"; arc=fail smtp.client-ip=40.107.104.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BKkgyq9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thr8cnXaN0DVwL+oA26S6s32Rfs4UYM0hOqcWl7AoYySkE7+3ORxy6fIZoF8bjoJ+3cO2WK6U2ugQ1IIE2yBAtx58SKRUSrr/ocVSGs1Gq5qrIl9y8HEB9okeZ4tB5SY4QFLtOedSDJ7NVMiIq+PbjP5ssG1ps5bd6tbX9ZoquIt7LlVCpvK2mifWCmeHmtW6mmUjdFS4pESBfnvaDSC7rjiGjU1XgslsEgItU3nuA0RgD2olDwzyBG00v2Z4718/E+mxAZ24JIlgD4vYlLI2Z9Sd+b6Eqq21OA9MShpPiZtr9N8eWmz7UepoGc+32dW3hLX8RpJ9nKdgt1vTVLyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FOezy0KM0dIzFtWpwdm/GztjcmBOZa4VphcnTA9uM8=;
 b=TmjmSTkHJKxGpOA/EvdmUsCNCobVEmXHaOs7n8ivzIyJx7QusQAuU5P6QWtAFthmH4u9wqrigbjmlpN7LbdMZy/StF276GxdhVMsehtRWpEpSOfPEAHDoTlL1JGAyZeKhRzN7jIpKMbZCr0vS6KOjx+m3n3JeGkYQLAFFE5q+Yk6VYcW7pN2XsV6piddFYMz+zi26HIniz/JdIQLe55LqmBdBgOLa/WesWF5OhgymbkhDafHCwTzrDpWtih1Kx0pFsUPMJRW7ckIja/6FSPvj8qr9Bh225THG4HelsRhp7R/PGszfxk7hiQ5RIqy3aPbnRRXNRVNdMauvZK7JAdlXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FOezy0KM0dIzFtWpwdm/GztjcmBOZa4VphcnTA9uM8=;
 b=BKkgyq9hzgvTHSbZCEVDNx00Ey/O9jAjv+G9qhY1YxnP9tTimBmIDYrpKvdjDKcd0ew26K6MYxzJCrGLeSNgcjlnPSew+7qVd1y6ufAqc+YKOQOoClSDlOuqd4ujPFQ60OlzCvdUKaXShfmAypsGq0bFd9UpNoZA581y8MEo3JUqb37ldBSjLjcQVyq0Dh9eDkHD33jfa+SU2/zA61LTtw5eCH+I31bazyScrceAqy3GPSb4AwrqJUi0kKUbyAfq7f2uNUCfVQzfkBiZKHgZmUpckybRWh0Uq5Gqq260+VYlgI66iBXYnw70LXRPlAbCChgH9Y9abUZLvbu92Zv//A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 14:59:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 14:59:29 +0000
Date: Wed, 9 Apr 2025 10:59:21 -0400
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
Message-ID: <Z/aLSWGP4mimMNlv@lizhi-Precision-Tower-5810>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <Z8HuU6ULEN756lyr@lizhi-Precision-Tower-5810>
 <Z+WdgWQo4dbPG5tP@lizhi-Precision-Tower-5810>
 <10643619.nUPlyArG6x@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10643619.nUPlyArG6x@steina-w>
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 13719fe6-364b-4752-132f-08dd777720d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?8WX85M2h3peSmwUoCcFFeN1tfA4OB95wtfcahTSjrwMNB/Sz4Ba9cj/t4O?=
 =?iso-8859-1?Q?sZoKopDiMnSal0wYWMRe8HdPAz7q98b6eOzhLFKU5kgN0Hj3AYHVvZh6ug?=
 =?iso-8859-1?Q?i/vdZWCcJI58vNA1mVLADDKSLNlDnAAMlgjxz9ipU+bx5Pk+ClA9NU0bW4?=
 =?iso-8859-1?Q?Yp2uTl3RhAYvYyRGdQBFeQOdIp+gRguEWm1+WRDKEm4jNDXMNcXAXCHOMK?=
 =?iso-8859-1?Q?H9iDg4aUhIqsHmgXtty50g5Ec+1EkoeP37pcJbtVNPZgS9b9/CznGl45ul?=
 =?iso-8859-1?Q?f/IgUSJWDhFq0y+VdCaykI3ZbNn0CUpNyxz5ZnuMaqYCHVEa7NOBQq+J9j?=
 =?iso-8859-1?Q?Y7/piUpRk6xs1nP1cXlSoyWaJH2jtEcsqf62NKMmMS+mN9zIyChmf4cQZe?=
 =?iso-8859-1?Q?FB2M6FqKYdX/NfPugNXHKy2x6l2M6oo/2Z/gAqyeeY9LKMiZTkhfd8C5m9?=
 =?iso-8859-1?Q?XTUn0j9pZoDCxmabZf5w3H4VMvnOOMrofSZ3/ch4IbeO9wUuQCY1L7oxxe?=
 =?iso-8859-1?Q?tLLQ8Vih5XJJ6sfb7bZETSbRW3DyrnvQq13cB2UfS9tRf/0+DGbwxlQXCP?=
 =?iso-8859-1?Q?ck3Rb7yhBn+/6eaYW660LfAlGuAjJEEB3SmLSnh6g7kAKuRg44UdPGtMxn?=
 =?iso-8859-1?Q?1aQ7RzwNWTpp/HRC3rsmN/JvNxf7V4M3rTBSvhilbqzhdpmIf2mahjy/wP?=
 =?iso-8859-1?Q?NbaTV9dCyle1NPJNhqfyamnUOV+GyN0GKBn9j/17rsym3K6UU5tznaReEW?=
 =?iso-8859-1?Q?UGhuaA+UpPiZneI52Jy3DL9LHldV0B64UXVVFTWXQujQeuYf1diQUxI63n?=
 =?iso-8859-1?Q?NxstJV0uuOOkTqnS3gpMmtbuddg5oyyQiZJcebLGkdbytpkNf6mGDpiqlT?=
 =?iso-8859-1?Q?Pr7A+Mp1RX469VcUj2SyfsN4ke9nFFOQP0nIMXnJAWyeKeShlU9mDAKBM5?=
 =?iso-8859-1?Q?nO44MJ+rL5mfLnTmDmwOkzAnFz1nTR8V028NvXVSvfSkxkFQ7uMzjtertQ?=
 =?iso-8859-1?Q?eGxKBowFwOoPs0+8sNWuR4pvdCleLSaTpwhb6AkSF2aB7LnFFK6XCqECeK?=
 =?iso-8859-1?Q?Kjd/KSaB2BZ7aTTy3kAxC/moHrLHH6sppRADuM/MKeL+rEN91f5m4kPwKT?=
 =?iso-8859-1?Q?yoRggRFbxLs7SrSgBkViBeGVCz+4y0t+Zpho8W7Lz1b+at6NqnFAIz7bpK?=
 =?iso-8859-1?Q?xbwRyeT/1ps1jkG+Yw9Ye3izoaDXCOcE4WeL8v2nJ/RFfCBmY8/JFUJNPf?=
 =?iso-8859-1?Q?sKRd1WduF766JdSC9aT0f7kaCLUHMKVxVP66OhgD4IK2qM6tK2rOnHqODr?=
 =?iso-8859-1?Q?zyCcM/77883zxPUuOqpeSfdaTYdRcReiIfzezgjDSxxYGGjzrywu5yj8TE?=
 =?iso-8859-1?Q?gFAlsn2WyBQB90T7VF4uAVtHWpPCtT9d9P2UK/NI7RVeQQNUglrYEln3FU?=
 =?iso-8859-1?Q?ZIcuHFn54rNB9RlbiDncksyv48cvYPmw8WEFCxAHlSy7CU38VHcQp6KKVO?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?4CBFtN4ksUH2BzqKAIs3VXBNp7IV8ynMuhN2ekatk4OFTS1+Hiub8G1pfE?=
 =?iso-8859-1?Q?mVUcJBlBEQ9FvAt/lcKgH8AzLiuLKwtn4eRbHZeOJnCSHCPpzU2aaXuJUV?=
 =?iso-8859-1?Q?MFRhgqBoAp2SQ7Eniy+wdUvOIFE8vHTRJFfZdhfvRcE9G69wG+52nbgg5C?=
 =?iso-8859-1?Q?QUA0pEMCDPBQKDbzkt4+NQp7jbjUlupQUNPTQzgdmhOHDdOj2D3kd9MwJc?=
 =?iso-8859-1?Q?Bvf9gh6f4Y3ZL8acenE617dqhu9tpZcM8bmCVSWirQBLzx9W3bIlmHWpu1?=
 =?iso-8859-1?Q?9Y2stpFMOtL7iivHuULHkOtCnpUaKMLoN0thjzEaTvE67OvdRbPq6foZAz?=
 =?iso-8859-1?Q?wCVYPLsV22OIXkFd3vybvdzOIw4ScSLQe3bfDH46anvhG/Fo6vHWJdIAQE?=
 =?iso-8859-1?Q?uEtkhzl9CwdUZWe5ufl2A9U2nX2q3eOHjwySU026dYkay6vmK7Cyw4M+ZR?=
 =?iso-8859-1?Q?X1IpqKk+1wnbquuMXoPx+eaAKEPkk6AufMn1y+3qzNBY2PoxaWkQfE2sZ2?=
 =?iso-8859-1?Q?hpbPtt+VMJxnHag0j4X2wdxI15qtw6DQssNGe5FIN4Uob+fCeUvlrP8cdJ?=
 =?iso-8859-1?Q?TqyXr9IefZ5uAk84QHbfE0OjMA/s45+77Q2Tj+D0stJyc1sF0krTD6apCt?=
 =?iso-8859-1?Q?PlFnze8kQKzB4d50BoLs1rtxpuX8MQLwEeF16r2ypFKOUQiFzumFw/cm07?=
 =?iso-8859-1?Q?6TNXidhVnxF3UjMYH+0GrNnxtSlaKlMdnddCQEXJXiw8hDfn6JlRdrkdv/?=
 =?iso-8859-1?Q?ngAxZm8TRKa6pxiXwaiGFYKwsVVC9WKt+9Y/w9iQC4sogT6LrmlXPu+dlI?=
 =?iso-8859-1?Q?h4IWD6pG4XdcTngCAh8+OXuY+k4x0kqGayESW5gvh0eNTFHoE9rzysBZV8?=
 =?iso-8859-1?Q?V0ns6Bon3nxxy3f2/iz7lcr724yM/SDucJDHsds4g2vWRDpvLroUrXRN3Y?=
 =?iso-8859-1?Q?p7I+5zG4E6oR3sOD+wNyBP6dbLyjCw95fywNg1wnhzmsjtTwbu4BCOOlVo?=
 =?iso-8859-1?Q?gJNRNS/+D34Uj1s2bhzaCK5Vpf4m4Y1z2QTMmlXgvT3OgfNURKtEhvur7G?=
 =?iso-8859-1?Q?taxBxpRNf6Oj0FV76aUOly6nosSPR25wj/0rrSPtPcv7Rb8PnmsZZ0RK31?=
 =?iso-8859-1?Q?kLIxFICKMsgT+rykQ9wrnZ2BHzoG5BA8uoZ1xZHQbNT66xRd0GJ9ZkcT+o?=
 =?iso-8859-1?Q?4PBtc2au7vuq/McQP2bKLq+l/LGco8W07AzjJJH2X/a7aO7DUJqyJ9U621?=
 =?iso-8859-1?Q?71503Lmpu85KVuDKF3hrMW+a6pin2fB+qn6OxGX94SZZhoAdhakbQIvBn1?=
 =?iso-8859-1?Q?BdmoEPV5BGUuEfoQCiuPkse8TjJMTJjTq5y+A+EshTPFgnIjE8ubqe2h4I?=
 =?iso-8859-1?Q?0R3c0UxAnEmXZGsJgA94IrUUDlBJyJ7ed5OVtglRZqds2gY4vovrq9PmHc?=
 =?iso-8859-1?Q?COLE3hUcAZs+gYmUVjHdr+qwoahdh/nAuyFHMYXdOJIrKauaABxeKmwgjD?=
 =?iso-8859-1?Q?b7SzZWUHDwtFfq19Bgn/OJBh0ho/A2t3v6UY3+2OyjL5j0InLiJdagn2dC?=
 =?iso-8859-1?Q?3SaEn9SQs6JKGl/OVpmm5P4PqMBqD3nS41AcubH3ylkHXGPL2LbFBB8NNh?=
 =?iso-8859-1?Q?FiRocnnSUaVu/ZcSLqtvUXKX4oEB7oSDfq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13719fe6-364b-4752-132f-08dd777720d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:59:29.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+80koEK+UpJPC+BD0sjIhdbNFGA9opWD1Nni0WE970R5gW+jZklLk9fNL7CziHwYKyOdbIdOCgQlJ971HY5dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On Wed, Apr 09, 2025 at 12:14:48PM +0200, Alexander Stein wrote:
> Hi Frank,
>
> Am Donnerstag, 27. März 2025, 19:48:33 CEST schrieb Frank Li:
> > [snip]
> > Finially we get realtek PCI card
> >
> > it quite complex, there are one PCIe switch to split it to two pci bus.
> >
> >  lspci -t
> > -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-03.0-[03]----00.0
> >                                            \-07.0-[04]----00.0
>
> Interesting. Mine looks slightly different:
>
> $ lspci -t
> -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-01.0-[03]----00.0
>                                            \-02.0-[04]----00.0
>
> >
> >
> > 0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
> > 0000:01:00.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
> > 0000:02:03.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
> > 0000:02:07.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 Gen2 Packet Switch
>
> It seems you have a newer hardware revision. I have
> 0000:01:00.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> 0000:02:01.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> 0000:02:02.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
>
> PCIe bridges.
>
> > 0000:03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> > 0000:04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> >
> > It need below change
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 9bb26b466a061..9dbf395b9a67b 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1660,10 +1660,18 @@ pcie0: pcie@4c300000 {
> >                         power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> >                         /* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 */
> >                         msi-map = <0x0 &its 0x10 0x1>,
> > -                                 <0x100 &its 0x11 0x7>;
> > +                                 <0x100 &its 0x11 0x1>,
> > +                                 <0x218 &its 0x12 0x1>,
> > +                                 <0x238 &its 0x13 0x1>,
> > +                                 <0x300 &its 0x14 0x1>,
> > +                                 <0x400 &its 0x15 0x1>;
> >                         iommu-map = <0x000 &smmu 0x10 0x1>,
> > -                                   <0x100 &smmu 0x11 0x7>;
> > -                       iommu-map-mask = <0x1ff>;
> > +                                   <0x100 &smmu 0x11 0x1>,
> > +                                   <0x218 &smmu 0x12 0x1>,
> > +                                   <0x238 &smmu 0x13 0x1>,
> > +                                   <0x300 &smmu 0x14 0x1>,
> > +                                   <0x400 &smmu 0x15 0x1>;
> > +                       //iommu-map-mask = <0x1ff>;
> >                         fsl,max-link-speed = <3>;
> >                         status = "disabled";
> >
> >
> > Only 8 stream id assign to PCIe0 device, it is hard to dynamaic alloce one,
> > or need extra works
>
> Uh, this looks awefully complicated. Even worse this doesn't work on
> my hardware. I need mappings for IDs 0x208 and 0x210, so I replaced 0x218
> and 0x238 from your diff into my numbers.
>
> So I take that PCIe bridges are not supported properly. What would be
> necessary to support this?

I remember bridge use msi to do port power managements.

ITS msi-map can distribute difference irq to difference cores beside iommu
address protection. It is quite userful for nvme or network devices, which
have multi queues. Of course, we need more elegant solution.

My card use difference pcie switch chip. But suppose it should work after
you update RID information.

which kernel version do you base on?

Frank
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
