Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3D53BE;
	Thu,  5 Jun 2025 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749083181; cv=fail; b=OReqgK3OvOiKamaNm6pkwSwjWfcJlD8wIjLN/jmmG2NM/B+sZCbusbvMCp/z/OaweOCeeMvwvBIi/s7stfeCZuMKOl0Na4jxo2fA30nkyn/+jW4sFvlK0oS1/lhZK781qAIKk2Mj9n2xHNmN+AAWsQuvnt9tYr78KAgeCMq39TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749083181; c=relaxed/simple;
	bh=Vcj+ua4hUZ04/SfWaGjD68uQTkZ0E27BuSSoEJRx62Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TpB0rmeX3Y+EFStcxbDj0EGYmCFlk3k09jlF+7qL3vrUI2qwVqk0Q7YghwVQPoe3duohvH36wul03evyjLsXv3c4+/bHWsrwSEBqye0dnFKo9H4Vn7QVb4HFBMdaJfQzzMO3HskDX3rqKRs9LxhQSb7XHM2TREEmxtDQyVGUMCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K/vrSfKL; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K/vrSfKL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYuyxXupJErf074riyKay19iL7U4J37m0jiNBSgHYvuAP3id0L2kUApw3dwqMrwwADNKcIC8kVlnhVWMASap1c4wlQ3qk8lPcd2T/3verWToXbtMXLPqmyTHqWZ8ywB+h7Tok//wDqXXrl36X/8LcmnBua7KQ9PqWTcAO7wxBiThO80XYmAONav8EZpVcPod3SK1qP83JUBpvttwA7VjvznpmS1xPh1HLCoWxUU4AF/vN8u3GYyvTSVG7k73ig5Jgh2ixIIGfpmAGkBLKqiztSk6jLxddzrM6LDRtSfWhiklbYALt8pATveJWzgabZ9hXkORxxwDCeUTK1Rsbf+SwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcj+ua4hUZ04/SfWaGjD68uQTkZ0E27BuSSoEJRx62Q=;
 b=dFmDOzVTpMcVl8vDE5P/pciN2bTnnMXpVbmACBdI5srWur47q17H/ofIraWnT4x7RrRzJFs6QcLs2mef8pzpoWKbiseZKynao18MH5C1KH5JJs5/epy4cS+NP+jfk3NA7kNnZm5vqQKQgnkAyUcq1PbZSz6pUnWagfrTU7A0OWXuno6vAbvqZjXnDKliVsMQKhZXwmddtiuqOfcLG23DpvEoK46uxyMA5NfDyGjJ6CWkpybxKoOuqjz6Y4pu9Y3F5vMGNAyei5oMc1ZGEK+9gOgkt+poGhBbaIX8FN0eeBu/3bUvvu5JzC771P+7ODPS6uBa1PMtBXAyWAAtBm4bug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcj+ua4hUZ04/SfWaGjD68uQTkZ0E27BuSSoEJRx62Q=;
 b=K/vrSfKL/QI7bW7/2VA+dV2Y49sXn2yA4AUjAxaGhxv7s/okrnUYv5GCeRTjWvxLSFmWdglyPhZImZfYqdPCBUqfUijfvOFsVfjpiPsC9apuoF0mALAhl/9SbFZUQP8E45zfPIyJGbsnH1/O5VPWg10TPg3DicwV5pvjpU64oXN8dRY5PwIZkDGXGLRbRex4jtLovpqBzDnWKqokkbTT5Lkwe2zIF1Oh2nkrzZKAcq8p5Nq5JPIuoaiaDnsKpfxYQO27afuJ9HRsbH3QVH3lTrb7jXwmYJ5xjYuQq5ds5PHcMN8uYgDBOyJCr9XwtadUe18k593Tu3b+knPD+oUg5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9341.eurprd04.prod.outlook.com (2603:10a6:102:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 00:26:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 00:26:15 +0000
Date: Thu, 5 Jun 2025 09:36:14 +0800
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
Subject: Re: [PATCH 2/4] arm64: dts: imx8mp: fix VPU_BUS clock setting
Message-ID: <20250605013614.GC29462@nxa18884-linux>
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-3-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530221713.54804-3-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: a07633ee-97a5-45bd-ae3e-08dda3c7950d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fNEfoVBlDaPBpias7BDYGxn5rp1HF6m3Gx303Y+pVlwUYnEJO7vKPJre9ztD?=
 =?us-ascii?Q?0MCDSoPpe8w1EDvpJcXTvFtTAlPUs0BIDQc3T3gX7Fx6GPSRAjYbDaex41UI?=
 =?us-ascii?Q?ZYbmJZ3D19w0OerslJYxGtVc9d82KlM15hvV8IoDx8Bm8cDWmO2MVSbLLWXB?=
 =?us-ascii?Q?o0sRZudG2MjJl9X//f5PG1XBVBIg+WVoeRyLotZ7MZGaRGqTrXoduwPKB1l0?=
 =?us-ascii?Q?jYnVitHALWsXG/3H5x/J8do/+miU1tgzmG3OU5+NCXtga1IZlGi6TqWfwWJ2?=
 =?us-ascii?Q?LGENh99Y1+H6h9GLu7u9yDUZUkSGYOy4B6WLW7dcEcHh1vrlIO2yhgyChpf2?=
 =?us-ascii?Q?4iG7G4zKtQvKXSFGz8Cff/n1Dw70LJFDpDqkm6P7IXyCO5oeioKDYVTvYZxf?=
 =?us-ascii?Q?ElSkekgFzYiirWre568PMUhlaOoJGTXGOzUzMfPj1YvIq8Z5PYczqECrND9d?=
 =?us-ascii?Q?yqlTBEzh2H+19MW4D5QSD+XZYEUAl3+v5Oy20o9dnzbftF5hsVDMqHJeFTnV?=
 =?us-ascii?Q?O1kzoZhPtL0M0rxHcqPo8Ht4mKOZ0HWS8IqY6zH88JP7avw3HkKrTVxkCeoC?=
 =?us-ascii?Q?YL4k91TApt856rYDq378PM50ju1A5rL2hA99rLYPlZNm5E/JZq0OJFONeVaj?=
 =?us-ascii?Q?IUAA7v/h/CMCtzOLRZA4X5bBvsD30VIoDfzhkh+rrM0suRr8QYAVQ3p1jrdj?=
 =?us-ascii?Q?etoC/q+tyoYAKjfupaeH4H4X4yq/2AQpWl9K39JUHMBKClWVp1jKEwKJ7MMP?=
 =?us-ascii?Q?go3FUwP4B9F8HzV3ziRTeTMfcEnb41lcGq3ZRs11i5BQOg6bUjWPIuvzH34p?=
 =?us-ascii?Q?n9uJQY75RKe4PkZ0oP4z1LZHSvQ2jFPlCwA0GMTlpUuy+tRj5683kdPtVLki?=
 =?us-ascii?Q?k4l/yyHY0oy3vlMqMtPEEHAjhANy6+PxHMoK0qERk7OcXix5g3lFzA9/lRdD?=
 =?us-ascii?Q?+7Tquir8qs4WGy41Jr0LoMMO8SYhTOpZvfZTHDNQdvPEf8KmbP/gtVUa+HCr?=
 =?us-ascii?Q?mlIVD8HtX8baUHFxo6sxfrRNwtMbQeyUE/jtVTe6InVaUlTjmBZFJi5pgANe?=
 =?us-ascii?Q?AFhNhnOEBmYCQ9vlbXKIsTbcpLTZE8b20oc1lnzTx6hjxu70lU+fWKztxHK0?=
 =?us-ascii?Q?GriAQ4jKBmwLFlhB2brM7lABrpfC5nwCB+nWGef9ihkRJMzGmDSwmcQw+0Am?=
 =?us-ascii?Q?ES/1CfB6qfH/E+0T81h7iDU+XldVaLIWtgzdhnlCDujEasce5GrHJ6oNktMl?=
 =?us-ascii?Q?9hR0SFfEbVsUGf95227CeyV0j7NGfKmUPiU+d2RzmF1/gMxHR3xGj8+hOoDr?=
 =?us-ascii?Q?LvMEpuqZaScW12/Fx70fIOlRrPt/25UtXnFEqTB55fzY5oAV4EDnELqau77N?=
 =?us-ascii?Q?+LP0oSOSSsesAWXj3gpEHrRq4q2zk1dX+vHbvRsbTQtiIr5WSpEScIP67s10?=
 =?us-ascii?Q?4EO+d5JBDf6jmgeRirTdEG8zzG0MMgQ2YC+ZJH6r10LnrLQ5ptSdJA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K9XSHwhK1ZPCzBzEPIx24DBtdrvX1lYcAKwLjxiUnEdFQHWHaPlYBRP4ALKP?=
 =?us-ascii?Q?cPGWXYskhdfz+lZo9VlGe5fsnhstTbZ0TgIWPYyDOsgWdyT/a2k6H80of4QW?=
 =?us-ascii?Q?Q5OuPhGKl2HPr1togmtMKAzfjkc1SWlrIcAW96mcsdtsmfr0KFJYfQ66OxEW?=
 =?us-ascii?Q?9JtnW5QNLFvhMmMArstU/iQKio4JehsBFetfkIs8wVqz7nrcaqpTujGd6YNm?=
 =?us-ascii?Q?cHLmMiT3pX7rpZ1AdKNPxvNKtojTiGKMaQP6wcXM5HQjREs4ShOfXTv7iUOB?=
 =?us-ascii?Q?dvDT54HqgeLrfzdxIgw6xdwFI7mjD5lRcPrQy/xBoxJmSkzc5083WhPCtjl8?=
 =?us-ascii?Q?+ipBEuzSmMejRXwZqkLBH5ROIF90qUTdk544jwCglaMdOY1Q9rkHaiEz7Mjs?=
 =?us-ascii?Q?PZOlwPzRxGklWuPprgGQInZuYu/qzCvuT5xm1/s0Z66zhNAzCVzWz+nTOI5e?=
 =?us-ascii?Q?2DPyzMPg3WHE99eVGam8xqexmA13zCTBDAnfyvBAf6gLOj9HIT9eZepsgr9/?=
 =?us-ascii?Q?ur2j4o5zXjPe1lAM6jNrFJRJAvlTmfYj98sB9RzyZv1/GPIV+ebIwP4tWN8F?=
 =?us-ascii?Q?oGFINm/e9FQ0nIrqaGSGrPLKBDmmR8ItUgrwMIt5V4/uCG7gXu/2RztLtIQQ?=
 =?us-ascii?Q?ACdMYrI57mHU3v5OPN1JicbpL/YoqnaRwjpb+9KTuQxfpEv95CxwgPP16YCJ?=
 =?us-ascii?Q?9OUCzj1M8r8Gvf3A+iU/ivJ75fMCQrgU6mrsXUP+km2O/BUWhCPxnMwVbCPS?=
 =?us-ascii?Q?Oqe3Gft+bl/m/lujGBjfeTvcK2Wc4BtTmYkpYVMAynm/7IRn5WfDGcC4x6XJ?=
 =?us-ascii?Q?fEUMUFJmy1huoDFyz9CfTmYZNKviFrW8N7BlJC5BT5GJhF9io5Z0av+50f8w?=
 =?us-ascii?Q?CwCadaqD1WAZL9Q817uATz3ePYn6JIZ8gbOpR3g/VGBdmnviCV1p311eG/Yy?=
 =?us-ascii?Q?aEA8X8RzdtUl1C+ntU0RNaakiUGviKATqWxq7V1aXvrC2nf20XtisnfomQWv?=
 =?us-ascii?Q?sAFsledzX0qO1ULhWgNdPra7eBaxmSsrNOStf3/9Q1qoKwJibErdzun6X5dK?=
 =?us-ascii?Q?gYvYTSpw/ju5Lo0NEW6iy/JEOlSbCFRg/3/ccJyp+nrwaxT1pqzAh222ijDn?=
 =?us-ascii?Q?HEi3JJQnLdg2oHj+7tj+kxS2JJTK6kbv344ZAHd/ToKajv1gdGJnksBz0Vaw?=
 =?us-ascii?Q?u1UokYCLEgyi2iOGBpHNwC9w/IRZM2SlDdhnpSEiF4ea1bxTs/6dgeV20/Wy?=
 =?us-ascii?Q?5j+mjILnL02viPalX4qg5qjptfb4tGlfTfMdud0X4nIxoECQUc6z8OUdqC44?=
 =?us-ascii?Q?1X5WHHeHOEpXYvJ1xCPSeCe+xNXBcVk1z7vCr8Tc2BtwBRMU2A/lHG7HoVK+?=
 =?us-ascii?Q?69y1Uf8K/qwfmo+N1Y7Xl+DxmXMVeNp9tQ0EBnEC83633f4iaN4Pibx8MPR6?=
 =?us-ascii?Q?eEY5OJXL4LmGEFeP3AuPEURLE5ubZJCq7vFtZ3ifjzDLQlNyTjaZCipJQUjl?=
 =?us-ascii?Q?8bsYm+vCBuyrsA1yAMJnXX/ya4KGaZu+8u3cKSyerg7abhOrsw4VSlctfNP5?=
 =?us-ascii?Q?anNC7qDeLWRMW422ZrtwL4DTnfgXWeU/kjACMJX8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07633ee-97a5-45bd-ae3e-08dda3c7950d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 00:26:15.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5iIC6HaM7Sz3mAoXrLZqJOQj0dEdd+8H/En0MZS0/1O0TuG60I7vouc49/umU0WJ0RrY1vkeFWVGhGj/bXugQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9341

On Fri, May 30, 2025 at 05:17:09PM -0500, Adam Ford wrote:
>From: Marco Felsch <m.felsch@pengutronix.de>
>
>The VPU_PLL clock must be set before the VPU_BUS clock which is derived
>from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
>
>Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Fix tag missed?

Otherwise Reviewed-by: Peng Fan <peng.fan@nxp.com>

