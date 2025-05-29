Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D059778F45;
	Thu, 29 May 2025 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534713; cv=fail; b=iJTJGgO5XdkyHwTxTW/GzoHvC5YjNGwzeAUlxuouoxsaL5yQW3NTOTYS7nEWbzL+COHvsZZjFggA2mPlx+3DMmVzJ+Hvoscn3HQCErxetG5QFn2DYY12Ji0MA71uRYTB5HCvJiILnwgpbzABBjEilFInGjabZHyah8lv/bEFFCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534713; c=relaxed/simple;
	bh=mKeYrBDg+ntjd42IdAshC5IzYOtosJxQLA65Hm2vqrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bR2VmsQw6C4/8SHBevXPd5GaVyD/eyt8DCldk8yPJt7TCElL7MGZNixrFvpq4fJm+KTvPt/DDHS6eNt20uE6QAhPJ1lcPUoVosnUuSdfjbr+87yLj7L1Z9N8gB1uNhzxRz0sm+KsVFDePDXhAUydbPNbBWVLJlnY/L5wZ9oh1hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g+G2n9Ux; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g+G2n9Ux"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VloSQSvOub9IdVEAAN/+AKWWmXiJhQybZk+Oa8eM/Fgn3JjCtLJhREEiIZh+M/+EDsxWSOWA0cB8grHrMGtZDmAPocQh3Si7Essy1fAg4XUJuz9co+OnfN/49BObNXwhITSzp2qC0licRmz0Uf1om8hob/nRsgbwcOAwI2QgEhqLQ4p1U8svWfOTZPwVegCKkKi/aOiQTCYRwWl76OrO5q+QQhlZbmFiV7P25+TTvPvrC598kOaVHX5BUvxkKphAe6MpNzYIuFBow3bfinUn0WIMsjWQJbBx1k7SoE+T/pn2huO2MKgb+tt3xGyY3HcRu41TdB5VYDmIqpaWIXCZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nye3HbAd6eMp1rjeHwO3uAybCYvnT9ml/DeRSAwxkmg=;
 b=G72NJMqNtYhA6lvCAxD3cp3dKTxiqXv+puhMvss1tpppjT84edTZMjg0M3UlKpWjSmHoyikFN17kXTkTpqv+Q1xqZPHQybhIPWDDxfB1JBPhKNFJMD8jUzq3PSVmTW5HSgYxYPXrb5UtX9Ln2CAzqL7+rXT34bN+NHAd7IjQdzD1fH/H4acEQb7a8lTGYPyEIrfYLLBdIPkxNslvY+TE/O5aZbri3Jsf6reZ9j3r9pwc5B9no+kXQFNWc2Ykw2r07pwJr9y6Mhg5a/QfjF5zPmg5nqySaRjaeNnA7L3dHuIQH5lapSIMbJDYvkKg8Xau9pLQ7EjFiYA5tU3hNossHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nye3HbAd6eMp1rjeHwO3uAybCYvnT9ml/DeRSAwxkmg=;
 b=g+G2n9UxIkxIRy25KH0oFTuFoxcVJbFu1lEUIZ4fDEQq1lIQbYeKQ5W6NqpZL4y3iP4E/dBtnNnyCjGuvfdK55sEODMlAVzxyv0xUBOFm35UnLo99g4MXY/tKGEjDbzRi2+ksSmq0Zm2OeYN9Qv5YvsVcuHShYVylK6XlWuasZLDyCa02mu4ctpLrYxRSSJxxzwX+HWZFnRM1XvQBuj4EDcgA3Sv2evs8nBkmwrWRzO7NtV8GJoOyYgRu5c8q5BXrfeDIl1C/c0OAXmT7t2J8EMj3/ZcNbekYLCUzUeNX6ivXz9Iajuc+ujqODJ7Btm1ZHYnAZpxipPhLSnT0LKcew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS5PR04MB9999.eurprd04.prod.outlook.com (2603:10a6:20b:67f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 16:05:08 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 16:05:08 +0000
Date: Thu, 29 May 2025 12:05:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Li, Meng" <Meng.Li@windriver.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Message-ID: <aDiFrp/firrNlFEY@lizhi-Precision-Tower-5810>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <174843567469.3636722.5654586098186872724.robh@kernel.org>
 <CH3PR11MB877336C35ECB8432FF57C821F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB877336C35ECB8432FF57C821F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
X-ClientProxiedBy: PH7P221CA0073.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::30) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS5PR04MB9999:EE_
X-MS-Office365-Filtering-Correlation-Id: ee13d655-2a6e-410f-9acf-08dd9eca9580
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ltuql4mS5YZHl25moVmbaWuW8L8m2XazvmIwW0Qr3Rr2HH8Mewi9RJsbvaY8?=
 =?us-ascii?Q?0s6gHcfsU3wxeJQ9/edRwWHaLhnPEwNEdYpDT9tdDGGaNUgO+gbALDMRyVOk?=
 =?us-ascii?Q?MsOE/Y/bd9lbDULuDY1Egi+KVDOtQnqrGCTO1uN6YQwr58/VJDCAM6DQspKm?=
 =?us-ascii?Q?fmG6863xzQIiycjiF4k/3qbgeZg5FkxRbk3wped8x9YjJvoA100xGEBYvQmE?=
 =?us-ascii?Q?YtWJwyMzBDu+c9FHPSnbKdE0TPYlcc/cKny3RCPkkaNUyK8OccQCvrnmb0rg?=
 =?us-ascii?Q?MjMqH2YM4gMRZA3Cfr3Ti4MvnDJg+S4uaahhHNvlZMcVqiDIpxOgd58Pkffg?=
 =?us-ascii?Q?eHxdbuyHFDirMqcxnz3YtAq6/McGG0PoDgz5E4vflpInqE/q/XNsoWOmOgD7?=
 =?us-ascii?Q?PyPGjXEyVJRBB5R4pAw3Jb0CPHe4QKmdskC+uRDztEmKxL7LB5y7jABuxhpY?=
 =?us-ascii?Q?wNkcFOHPx0hHJ6vobWIIE/HjgAGO9Nd+JdBMIQi4O2IZiXl08TtUI7dp2cJY?=
 =?us-ascii?Q?1AO226wQdF7sBRDEUj2veHjE+tQb9RG8qoJo+sTrPyOwoXcbCTPnq3jrbolw?=
 =?us-ascii?Q?r3IaHPj2KmAMVuhEsxe0zPqOYm14mboTrnKVZCcdRmD+UuGxOzFKgJlk4HkL?=
 =?us-ascii?Q?tjt3jdhfPZjEn2Sdth5vTQjo1xsJxWI1obCzHiMbOzPPdfGdfT11POwpsMsv?=
 =?us-ascii?Q?o0jlb2Gm7VMTQVzxG5B/zChfBDGisOaQ79+2928uVcayxdVY203Aqym06IuC?=
 =?us-ascii?Q?WaTad6Q1FRa/wgQXyeY2WdEEgHK8XcrC2Xwn4FpEo+CcU/QueWwSj41e1ROg?=
 =?us-ascii?Q?XvNqcktD9eYRflHt21nwjcc7bYhxlkT9EE+vWUEhkEQgxRdhy5ZESuhuVvg+?=
 =?us-ascii?Q?V61qC8Zvfe7AkKpAumWi2hI9wAhcUYcs4QvlWB+xU7HqbxbSGcGZe88pz2cy?=
 =?us-ascii?Q?fZieyROe275Sil0MTwGxnUiizsAv+mMnlnpvbnkC6vnt+Viqba+NHxQQBo5x?=
 =?us-ascii?Q?/6Sf5JoRZ4Xcw8BGJwgRUs5EpiKoPA8s7XxxB7GxOZHIOdAmUPxK5ycNggF8?=
 =?us-ascii?Q?63IHFaqTqHd+vp6RdgNJHTHfbnpPZSe71EvE9L+lGq4E/LxV9uIgikeLBc8Z?=
 =?us-ascii?Q?+cdOVTuM+3W0D6tnnstgk1xt3lIOW1M3wciuxoPdHc7lCuW/caPHeLxTgh58?=
 =?us-ascii?Q?J4mQIuEUUG2DyNnNzVD6yCSc5kuGMwsdZ2aTRw2ZMjvFZeWlfBw9rH22rRaV?=
 =?us-ascii?Q?9FsMlkqIxPLdHPPaLasMOmjiwgu62I3/M91WlslYXP8ejXjvAwDHBNblrHGi?=
 =?us-ascii?Q?gbhVRb3qDtYXcW4UWKJCoRnzW1a5CINO+YTDU+p5kY3wJhOH3MIcWdRHeiYA?=
 =?us-ascii?Q?WvZvMrL4GcsmkvPfW19w/lBi2QO22lMs8BeT1I5IJHfn2laG2H2UIDiWrb6n?=
 =?us-ascii?Q?Dn3zVzzSU+k=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?McmvxyxgZYenxijL3NHPCZw1XjVGJn+EmoxIZYO3iOmzVIRacOG3QZSkeAz7?=
 =?us-ascii?Q?yYw6y5G5EHGEcXI7uITwCsQdFl1Cc+6FSr9lVhg9BIbX5oE5hs5SrHh3Fvey?=
 =?us-ascii?Q?zo47RtRtEBgGu9uPlqS2c5basBWroz2ATmezR689xVc0+pRLKke0Nm7qXEoi?=
 =?us-ascii?Q?o3G1K/kdm+iyVEyceS3jdh0zqw0KWhe+zTAclIIJK9STTgZIi8lIG9CnIrW4?=
 =?us-ascii?Q?YGGLB+edncwrx9nW3wEUVtm3OYFnAPGHk0+aLgN1c0Jg+jGxS6u88sG6exzf?=
 =?us-ascii?Q?GJ9AM3Slg8LsDEaBK08svje5Vd8FyUHt/ARES68mhS+siRfo0TNVkc5mV9r7?=
 =?us-ascii?Q?DoxXRWloG6GJn9Hbkebfg65adg1qk6FRgcAlf981LllygyR11rCwiUOlNo5K?=
 =?us-ascii?Q?m+BMgD2tM9wbB5ZBR5GmU4jj2S1VI8PsenPG9wNVvN8yj7RmuyrAa5OeGDxo?=
 =?us-ascii?Q?DSSW4mW2wc/My2Tx8dyKDi8uu9Uw4m+33ASNMVtcgaCed87Dp3SAnvXZsCRJ?=
 =?us-ascii?Q?k8qWo5cxizXvTmoPAWLzC4uRNt9d2+LVueO9MsrJZWAl4Pk1xDH5IvZvOdEP?=
 =?us-ascii?Q?hdZ3RoN4D55lHn7glsQahDHMNfIYUcd6wt3OKrWoqXeYq3hXJqUJ0D4QFibn?=
 =?us-ascii?Q?fYf3Si18GGK0DYi9V7DHamecpgefZZiGRTpOR8bDUq9M+lsdOAuClRY9WeiV?=
 =?us-ascii?Q?OYPW0UpJi7HkaTil5IKRKkulQRfY1RILM7xpXJkXlSo1PQkxD0mkcyiq4ZLd?=
 =?us-ascii?Q?67W2IxX3SJy4wARjvNz9mUyFarYkVVsj+bkUUBlQ7GkE3tnHzIWKvvZ01vhM?=
 =?us-ascii?Q?ZrTYceszfTI2GnFD2xyNndWNxwJaMu1jd9bX1AAE1EwekyCZjSK2l3NSTe/s?=
 =?us-ascii?Q?qikPTA4ADeC5mFMVME7hxyGOrNhmyA//6cXePyiXtQFaFfbzfeUjUaqSAGJq?=
 =?us-ascii?Q?JDUM9Mhp0RwO0AiqwSiQPp1I2PitSO68fNCPQ/KBGnPhqc2IYQJ4YacUyStg?=
 =?us-ascii?Q?v0FCGLMSyutHeCoapGfnDnav+Lzhs2bpRs2sg8WOxMSX46vh98yyfMBHGR1N?=
 =?us-ascii?Q?2xwqLKGPDJKFY35/MXlJvhMveW3fpFAZQUR4dIY0cpg7hkn240lavILNptCK?=
 =?us-ascii?Q?Ng5/9i2lYgdJmEmiFy6IZKmuH3P8m0avayw/bo90ATpkaETXs/ZL6PK1rfPL?=
 =?us-ascii?Q?n0JfH3qeazcZV9chZ9GqnDMi9K1m63pM8/8YZVFva3Int1BbN7W/i7QlgJmV?=
 =?us-ascii?Q?WmJykUSXl5kxF7sUbGaWRbbN2rZ1fXA4Yf688iNI1bSKGeR3xqAwc7jAj+iS?=
 =?us-ascii?Q?uSLbKZiHLlcsb2fF9Y/7UNE4ClTn0/65y7qgSAlCMuAzPJsgPVtNjJoStifx?=
 =?us-ascii?Q?ZuyMpicpd0hQQWLsHWq/YAQeooEBI+HPJFQG6bfbr5AtHG1RPea4x96FQksw?=
 =?us-ascii?Q?Y7xPppSmmXX/M+QWln9iWSY+9LAH3MEw9JcXOVTdxnLAd+kG7rSkeSKwm3IK?=
 =?us-ascii?Q?eUAAY0pp5XL2LJ4ja1i8TDdk3DWAOgmbATcdFpX3fmKbs/QiphhmXLKLPTUh?=
 =?us-ascii?Q?UhfiIiZ0/TstzujEsdm9piLXBunF/s1nrZEYsHbr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee13d655-2a6e-410f-9acf-08dd9eca9580
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:05:08.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75ay5u5GQUvMcdKps6hvx6j1H8ZPYtKuKma4kyCCuKkCDaO9TJwGLFAa5/O0TGC7jb9tX4e+VYfcRw8KnUghcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9999

On Thu, May 29, 2025 at 04:07:27AM +0000, Li, Meng wrote:
> Hi Frank,
>
> Do you have any suggestions for this issue?
> Could you please help check whether we need to fix this issue?

Fix binding doc

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 0da953cb71272..8006efb69ec71 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -36,6 +36,7 @@ properties:
               - fsl,imx8mq-wdt
               - fsl,ls1012a-wdt
               - fsl,ls1043a-wdt
+              - fsl,ls1046a-wdt
               - fsl,vf610-wdt
           - const: fsl,imx21-wdt

@@ -103,6 +104,7 @@ allOf:
               enum:
                 - fsl,ls1012a-wdt
                 - fsl,ls1043a-wdt
+                - fsl,ls1046a-wdt

fix dtsi

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b44003..096ed81a9bc4d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -687,7 +687,7 @@ lpuart5: serial@29a0000 {
                };

                wdog0: watchdog@2ad0000 {
-                       compatible = "fsl,imx21-wdt";
+                       compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";


Frank
>
> Thanks,
> LImeng
>
> > -----Original Message-----
> > From: Rob Herring (Arm) <robh@kernel.org>
> > Sent: Wednesday, May 28, 2025 8:37 PM
> > To: Li, Meng <Meng.Li@windriver.com>
> > Cc: devicetree@vger.kernel.org; shawnguo@kernel.org; linux-
> > kernel@vger.kernel.org; Frank.Li@nxp.com; linux-arm-
> > kernel@lists.infradead.org; conor+dt@kernel.org; Li, Meng
> > <Meng.Li@windriver.com>
> > Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
> > watchdog node
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and
> > know the content is safe.
> >
> > On Wed, 28 May 2025 19:17:51 +0800, Meng Li wrote:
> > > When verifying watchdog feature on NXP ls1046ardb board, it doesn't
> > > work. Because the big-endian is deleted by accident, add it back.
> > >
> > > Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for
> > > mmc nodes")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> >
> >
> > My bot found new DTB warnings on the .dts files added or changed in this
> > series.
> >
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings are
> > fixed by another series. Ultimately, it is up to the platform maintainer whether
> > these warnings are acceptable or not. No need to reply unless the platform
> > maintainer has comments.
> >
> > If you already ran DT checks and didn't see these error(s), then make sure dt-
> > schema is up to date:
> >
> >   pip3 install dtschema --upgrade
> >
> >
> > This patch series was applied (using b4) to base:
> >  Base: attempting to guess base-commit...
> >  Base: failed to guess base
> >
> > If this is not the correct base, please add 'base-commit' tag (or use b4 which
> > does this automatically)
> >
> > New warnings running 'make CHECK_DTBS=y for
> > arch/arm64/boot/dts/freescale/' for 20250528111751.3505224-1-
> > Meng.Li@windriver.com:
> >
> > arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000
> > (fsl,imx21-wdt): big-endian: False schema does not allow True
> >         from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-
> > wdt.yaml#
> > arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000
> > (fsl,imx21-wdt): big-endian: False schema does not allow True
> >         from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-
> > wdt.yaml#
> > arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000
> > (fsl,imx21-wdt): big-endian: False schema does not allow True
> >         from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-
> > wdt.yaml#
> > arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb:
> > watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not
> > allow True
> >         from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-
> > wdt.yaml#
> >
> >
> >
> >
>
