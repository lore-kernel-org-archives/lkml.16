Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E985258;
	Mon,  2 Jun 2025 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902173; cv=fail; b=tBSJs0sSnW+CuPfUVRVBC2nxiEDjpuoen3N55NF3pq+uzSiUpiZYizZdbADnmXVPcmInuWAafUIQNV8t9elPrYisYaUwtorl6YaaIujCX39u7Qa/703obXwHZLm3mkX6jRsltq81RfSG0fSu4RyTyPVJ7axBbYeqO0P5mCJPpps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902173; c=relaxed/simple;
	bh=8w4jVgAh7L3FxVWbOS3IWeR0lBEK9Bs4T30Yg7HoJKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uI7QoOqvB51gouPo69pdiKZWW/hezxSniOLKVCOAPrlEUJVEPEnY2mOLzaFbjyCf/16t8cmpSU/JSl6sFyTyF745WlfxmmdJ+XuCWYVv49j1t2vOk3hvQvxgJ6pHwJS7rbg2+b8qvXTgARr1BG5bVBsiC2nQNNQ7j2+wCh83eks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lUXHxhyT; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lUXHxhyT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKdF3a0mb0w2Mu3HugxC+E8z84srIH7kVQDEMbMV1qsciw805FoQrX0YZm6xoQ535CsFwqKEwolVoJElCKKSkkRqgq2iGSxjcJFbCd3wy6tMShzU8LfoqZh3nqoQ2SBgqCDiUKF3M6lF3nvFlicNrz4h8PptEUhL6acFOlOuJZowygo6Y/m8qsVmpeZH1hSm8XanUxhZgX71p2g+2OalvdiwzuxVG67OmMWwxTMkMUhKe/+7TIuuQxHuSKuzUlRq2db1Dqu7sDihwRXiUZjqn9ev3stXuWdAdLTCPfj5Rv2a7D1/B0HrUGyTrcNQRBrFTs/OrHDN+z61f+Sc/FA9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvBmRUAVpwM6XoutEwPDTYPc+Pu/ZvXCDXPAt4Emk+Y=;
 b=geMQlZ/h4ir7M1M3BeaU27w1epFjPsgzasAAjs1yca7c4IU7hvB9nD3dpxrwpPXbnUAyczgiyVZ/dmdGTxAQ/pCDJHzixjNst/aJ4OmJuWTzRHBUD+fYsdU96UOfgwGYp0abx4cjw7v6zfa3EYp52BIhVFPN0oDQ+LyQ0rwyHCLxXkFL1AN9tzDVq5BH/M+C3tNKmTPbqE9mYE5wk3v0jV+gL/De9ouXnIsJ9n4J7T4cLQ0Fm0w03AZU8jwIBx2XYAFUimlH7T2V736oeNwhPd5L1JXhiggwAgJvAuyYiVys65l4vnTyuihCg6EACAp64BE4P7WQjCGTQZQvuRH9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvBmRUAVpwM6XoutEwPDTYPc+Pu/ZvXCDXPAt4Emk+Y=;
 b=lUXHxhyT60aJddaF6Jbn8Gbo0KNPWWci2H62woS6nOa/FWL2a14z4nx2OT9pQG6IU547JMc83nAz9emlwy4Co7kvNehVjk0RBdHpH0UPuuFEOE7FjXoUfxCncdRbQESkjLB9oLna7nwaZdB0S7jpdBNow7xFiOHVUIk1WX5yJFJFO5b1jfKf9slEVmiFeL36tOerF1K7Zybja7y5+nWqIERiNdWIT6Dx8oJP+gy/fSMw9VHfX8p88p+/CD5e+I6H3d93mIyurhPzaZ6WqbpHlM64mLEp/bNnxbFBKqEgJbra7ZJ/NI59KNuwr22+A3rj1LXydUiH2ITeb/efwyUHcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9472.eurprd04.prod.outlook.com (2603:10a6:102:2b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 22:09:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 22:09:28 +0000
Date: Mon, 2 Jun 2025 18:09:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Michael Walle <mwalle@kernel.org>, Fabio Estevam <festevam@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <aD4hEJYbFIrqtEXX@lizhi-Precision-Tower-5810>
References: <20250602140613.940785-1-Frank.Li@nxp.com>
 <618490ca-cde1-4e13-8638-f5cb65606c6d@mleia.com>
 <aD3Lg+LRUThzm2ce@lizhi-Precision-Tower-5810>
 <09089071-57fc-4495-b6ee-159c59d59650@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09089071-57fc-4495-b6ee-159c59d59650@mleia.com>
X-ClientProxiedBy: PH0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: bca63dd0-d75a-4c19-203e-08dda222247a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?dLed4xPINCQC0ZTKPJH2minVsvL9MpNKkN4v9eJwR/8bkb1lAfsZ/O0fTfYI?=
 =?us-ascii?Q?geOd6YxLUMIa/zvRovZt6TktVSKdc3mJ3tJV3sHKG5UkgyDerKPDukgtqExP?=
 =?us-ascii?Q?3jRa/nzj8GdV2xLgcKNGkStZMwhGlxDcZT5X1tFdYja68gbDZWquBVrW10VG?=
 =?us-ascii?Q?ReA/UJ0eNZm5xPHTv4bx98wKkXFyNZy9pLAfeO5M3CJx7kqk4NHtYzfJcnF/?=
 =?us-ascii?Q?M4TlgVArNj4/Hbw2C6fUCi7nj7sBrFPzIRr0Q7ZOwCIfyMj1Yqy0HCje8feg?=
 =?us-ascii?Q?G2wjSjUqS+TM9DZg+GV6GLZ7RcFGrxUhnlPLPu4U2VOIVam3GAE1gMe00HYL?=
 =?us-ascii?Q?bM+/EjwK3EJNDRSXbxhcXQa6zsIfrmCh997RpBY7Q1VqtHLHcSR6WAjDfuJu?=
 =?us-ascii?Q?PbGweH8itfKjECKDv1ar1kq2h1O9hLVEAay7HQug8pfzNIiGzTCBuR10A20y?=
 =?us-ascii?Q?6dBeI9AWEzx9MrAsK+VVI+lsEDWZASgHfk+m0E23IvM2qaspOKKqU4nMSdeQ?=
 =?us-ascii?Q?mm/yxPl0k3N1IkwtLVpwmVjeQCpe0C0pvxLnlzx4OOWCUG6UjeyXCoj41CBg?=
 =?us-ascii?Q?HFFjU9ZkE4SgQbZT4uG8wsXhxlLrr/+W5BA635ULV0mt7//901uDfWQlmbfD?=
 =?us-ascii?Q?HyVDq7JoIq4dPQ/2l+7L+7sZ1KtxI0/JN/L8TGnXU6GsgH16cwhWm5JrW7B4?=
 =?us-ascii?Q?4yvGLT4sTz9SHiPnuq6MnJcMeKr2rdtaOaK3FrizinJ5d4Pts7bDx3uV/kkY?=
 =?us-ascii?Q?2YpV/Vp3IJP1JCASUU7UqUI/n9cCUDoRMTH9uA5zrUCQvlQF1aNXA8knEikz?=
 =?us-ascii?Q?bM9kY6e1f40o/PhpiT5X7qR6wjVnt0ut0XCYUFQYBfg4axyWU+FbLtryCT/i?=
 =?us-ascii?Q?twrbrsoo9lUwAEMI1ExIK+kEAFE1AXW9u9O/cLIwxwupeqMZlyv5Wc27O4O6?=
 =?us-ascii?Q?njCft4YyJZUDZy75ZAiJZy3ocm+zzwG//DnD17e/kKryNnrG+e+neY6aFx+7?=
 =?us-ascii?Q?n+WRBTzimpgCUR+WO2mUZJ0zgV7PkhppkZkIRZrJzvRdPRKiqMceqekqrvbL?=
 =?us-ascii?Q?xVvNRvFMqzC44yrrhArr/TpyqygGfhWtPzRTy98lyN8JPSurmyKoy64Gl+EK?=
 =?us-ascii?Q?EqCbdHX0vlUXFgT7WA/h159K1bcgwsPbDWOO20VDFEkxKy2UbKnl8X9OaHzt?=
 =?us-ascii?Q?bj9278HMWAbFRZOGytrM5f0nG05ObPPF+3S2Wz4VBkYoAPYuDkb27P4zUNE/?=
 =?us-ascii?Q?XnUKehgUoMO95G7pWUGeRW9u60n5daUGFNAYHh6ow+ltL4f0wXV3vMUo43hv?=
 =?us-ascii?Q?4pYjY9UnoXSZZ5QMb2DWnTEX3PGpGkLD+rPDsTp5roe43zQz45p/Fzq2g0qq?=
 =?us-ascii?Q?AVKbZ52bb+8ie0me2U4pGwLp5uOx6mFs8H4VA+AoHKUTlEiKXSQmJQs2j/FM?=
 =?us-ascii?Q?jgKHiKgtKAOPhQ5tIYd5mMPJ/FRIOaP31OhySaROH7RS2nSNAUkEfQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?wCvHzrVd6rjZrWqkKoIbG7Z62IOiVKlXICsieFkF4hN8C03qmtMkldAkEd57?=
 =?us-ascii?Q?x1RSNY0DRNRtl5eAiUx7nwFbLo7UVWV5U7Q0+8jP+Fzpj9uw4bGB3Kvhx4yB?=
 =?us-ascii?Q?xGshv/23z7+kr/fRVeqqJ56+jwC3dO4tBi0bmXsorBrM681NCGOvjJ6jMmp4?=
 =?us-ascii?Q?1crIaITutazjox23Qy5vm4WbDWezZzEkPrGZb2yloB0syDcMyfYsQV8ldKO5?=
 =?us-ascii?Q?Jd8/UwihVNbWLEOOsFprm+xxP2TwkjCgXQmsJONEPQRxiccGeRtW1BNdWVAM?=
 =?us-ascii?Q?2i8UECNe0+GidzYDafeP0CzIwYX82O8xt3s0SYeTA1V+n6/hjJJFGcHolkn7?=
 =?us-ascii?Q?+659LuvOdfQCYCvQ7OcYLUCLHgMET9poiKrda/wGmxcQilLASDy9Z4BvTfXo?=
 =?us-ascii?Q?zVt8JNvK/GSu8GUsNoOdxYw1WKJ6dMKqGJ1VXOd085OG3TvUe/outEidJjBj?=
 =?us-ascii?Q?iufk2W9SW07YdjOsb5hYCm/F4RVnl9hTUWMlGf8NzqVNUP0kuReo8X+WJZcV?=
 =?us-ascii?Q?eSnSxgBJM2HMJLSUsvO2HTjxxBd0dwkMHceuimytJA3yKwd/Z0w8sMh6P6vw?=
 =?us-ascii?Q?Itc6lgD16RVEtQ4/pUNxRSfDrNV+HHJJLXnVnm7ZRyoqDx+yXXREmbamltpO?=
 =?us-ascii?Q?bCpvIOzYkYX7F3BkwxfF0deShl7MdBiO1bVhtWJgdTCjzGhOT+U+yIeUTE81?=
 =?us-ascii?Q?rbxfZTMub81bIlJX5nH/Cxpd+owvESyUGC/nErQvwuqptcVErch3SMt4+OL0?=
 =?us-ascii?Q?D2yGS/5Wa+7pEvuwWBb5OAu1gjNOULK+SvaUWuP4rVk5DvvFryH09SScs5Er?=
 =?us-ascii?Q?mUXWXDDBbJKpK8xXaY6aax1gdAzlZ+TzFnaNRrNR2q1cTD9MFhY2vhQmKGLI?=
 =?us-ascii?Q?xsYILntysx/Ynl04B557bhQOKHrAH9sV+75y6OcK+qXpxFBFTTSJ46UpA7S8?=
 =?us-ascii?Q?qGQXlf/JDb8gQVP02ToXK7xiIJ8ng7aGpxLe9CKd+FqwYKFtrAeQf63Mk8Fc?=
 =?us-ascii?Q?d/QI/HqxSi/OxN0Ly2fpD/50rMhmC3iLwf3F35dE4nvq7H9wOmu/7hkdSvTI?=
 =?us-ascii?Q?jWS1Nu2KUnHPrIh+kc3GM+3FOybYEjZdDd/iZV3yVw5AxJGZOH/+PnwpnWA6?=
 =?us-ascii?Q?AnMQiD3MywOu782INc9ZiygeuxgNzvioE76UwHRkuOleHN219Kfu3DgqBJj2?=
 =?us-ascii?Q?Jg8mPUkTdpOx/iBMkrvVrLFR2VXPa2WvM8qBZtwHQQ1gZpnILluRB0GN4G6L?=
 =?us-ascii?Q?Gh0QIe1xKsBwNz0cSy4fgDTP+aljNoIUAco1zHafyYXOsmv2FeWShIOUoqva?=
 =?us-ascii?Q?iIobiVYTcyBfTITSkR4a7cZdWJU+TjHMVgdfIMEny54Za4HEiNVocyhVdwBL?=
 =?us-ascii?Q?J0l/xIgPjfaNWwO7FQgY9+GE91caxp+lcJvT2rOQuqIg8OGf+4YswBHmSUHm?=
 =?us-ascii?Q?ZkBONdzMqHjx1447T3pwOujNoVF51K4xyeMgfbsHRzOEWeZpqE5wTuVYDZq7?=
 =?us-ascii?Q?MXDudHUNX8SRBmeS+GbLLlTFRn81I6Kcsvv9NIMt9wR5CXWyZ2rZcE++kMnZ?=
 =?us-ascii?Q?AW0n7IKZhySBN0laudL+SJplz8WGF3ydUFMFa17F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca63dd0-d75a-4c19-203e-08dda222247a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 22:09:28.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGsrGsda2QcV8hZLPzoPmfbJVwxsAfs3BDK+xTak7j3n0NHdkiCgwCIFGkjCjP7GdotzB7qyCS2ojVHkEOCWmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9472

On Mon, Jun 02, 2025 at 08:17:06PM +0300, Vladimir Zapolskiy wrote:
> On 6/2/25 19:04, Frank Li wrote:
> > On Mon, Jun 02, 2025 at 06:34:14PM +0300, Vladimir Zapolskiy wrote:
> > > On 6/2/25 17:06, Frank Li wrote:
> > > > Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> > > > warnings:
> > > > arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >    .../devicetree/bindings/arm/fsl.yaml          | 23 +++++++++++++++++++
> > > >    1 file changed, 23 insertions(+)
> > >
> > > I prefer to see NXP SoC powered boards under Documentation/devicetree/bindings/arm/nxp/
> > >
> > > LPC18XX/LPC43XX SoCs are not Freescale.
> >
> > Generally, we don't distingiush that, new s32g chip also in this files.
> > All nxp/fsl was maintained by one person and everyone know these are one
> > company now.
>
> Well, my concern is actually not about the companies, but these two SoC
> families are totally different, the peripherals or core controllers are
> all different, it makes little sense to mix them up.

This just collect board level compatible string, like trivial-devices.yaml,
which collect variance devices.

Shawn:
	Do you like create a nxp.yaml for LPC18xx/LPC43xx boards?

Frank

>
> I won't raise any questions or insist on the correctness of i.MX placement
> under arm/nxp or arm/freescale, but NXP LPC32xx and NXP LPC18xx/LPC43xx dt
> bindings shall be put under arm/nxp for certain.
>
> --
> Best wishes,
> Vladimir
