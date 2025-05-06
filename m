Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B33F22D790;
	Tue,  6 May 2025 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541325; cv=fail; b=GZr97dN+KCHaHOxfH/FLl/1BNGYClH8CWd0zp01jm72N66hxWBhFIDJgd3MqjE5LEZfMUWtqQz0EnmyVMUkhj3Vz0r9MbuHyrpZZd5jEnKgK+NMkWv3RXkDd1m3m8SNA3U8MWFj/bo/BVf9XHVMqNcQU5qpzeXfnBhpqHV6FKf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541325; c=relaxed/simple;
	bh=wL1Aqte8Se9ZL9bVIvNpdiMIwPWWifkeTlUbGx69v+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vCclWVPfPS5nXEuecEXfj9Tfere5ZUrgPQAg8w2ZBkL09t2HA3+i4dQ6Q9kowMTjwpDwPcr29+tUOa1lG8aB+3jqHC6hGomV+ScufC5Htdf+w/cyNYDzS/6pnYYhY0A12equYXC2UECi3T9O5lL8gqt8pZ3t6Jk2oereA0SKTBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FaxS4qOP; arc=fail smtp.client-ip=40.107.159.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FaxS4qOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqWpBoMXGh055hTuMSJxgelPZLR0rpKA3FGbOYiBd6gmGdEpONukZ3rQJ62ty0uqutjNht5HobFBmW5RDzWux6caCcxyvHz0Z86npOIDyZottGXAONc/53G05uTZtmxpPgFacT0Vo0XoSQIvOZUkBVQ3hEh1Zp4O0UvBlvdPFcHyt02y9UrQbg0yldEMA7MJsnxqHfqXlQzs75hEs3Dd5PHiDwJCt8yXqmnYFgbvhlANhjJuYvguK+koG+oEfUSeO+uGkZ9abgxyVoxcFuoXAgCjLsaVDZOYxX31djYS1nejL/EFstNk1vu4OzFrOho5h6R0wIE9s7Gx8xLIn31apg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPiaoAIQ8g5mgZTS1TOyFzBws4F6cTeoyTehuMwvClc=;
 b=iGu6Gmi3IhcO9PJOAvpaVMRwIWlV4Devyu7h7PJEVphOCyoCVWvTTXu6Zw43qsBi/d95G0tnEaDSxqr/BHZbQW8osbclKubX7nEg0iBFeSi+g/vN/G72Xl/bEuL79YoKe54Ilfg/UWUo/xl9F4i4KaI/czofnJBWlFPKOTkGQDh7bn9vBkYtzxylCLdR74eQ0FO75UYo1eAGKHMvdtJKdipgjMIkqX7cG+UEpOevnwffgqzCeZ0R5aRN5VauBB86XW/+iurvVxM/mOEy7qNKoRIoU2fOlqECEZ9L8auVesv5VFt9ecaezR2baqQiQ+jI9UC7vrPaYfER8jP6B+Gzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPiaoAIQ8g5mgZTS1TOyFzBws4F6cTeoyTehuMwvClc=;
 b=FaxS4qOPwS0+RMvStuzzL8c2j5gpOUFbd/r8hmA88HGMiEL+R9i1xE/cs34aGQlW67ndF8Uf7ielUGCzM6wBxe51c1cnhUQayTvHYgaaKiFV4WSHkkzO3VdGkDEJQjnVYRE/2T4cYcBML5jYvcBle3EBj0GNDWhBFRAfy3KmtMNmedkvWpgDUs8nOM3IZT+1HVIPlrzJEbMQ4hJQPtcaaEd/5P4XpHmTYy5VLJGZ7e8tYrE1yeXoYUD3y99z2NTKaAblW04J0f7b6M6ilbMau6ZeSCHz0KRPRtYBqggo8LE0y0H5C2/7tm/vm7Xw2SZxC4pBGYiBaWKbgOmpWgaDEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7655.eurprd04.prod.outlook.com (2603:10a6:20b:292::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 14:22:00 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 14:22:00 +0000
Date: Tue, 6 May 2025 17:21:57 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the
 simple-mfd-i2c.c driver
Message-ID: <smfuskvhdhrfrgbpjflgymoadms6vfiwgjmipsmkrxldtor6we@tyvafv626bwr>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-6-ioana.ciornei@nxp.com>
 <20250502-savvy-eccentric-hog-b4fed5@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-savvy-eccentric-hog-b4fed5@kuoka>
X-ClientProxiedBy: AS4P189CA0051.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 75195820-ed85-4985-c865-08dd8ca95d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0RDBgPSufAeafiO+QWvshJp0+4JRzl34iSSg6mvileeEhKnJ6uNL0iQJQres?=
 =?us-ascii?Q?Oh06E1N+csSVFsxF9zvujlwpw81XDPJfPyvsumTlHC6XyTwbbErgIMZi2t52?=
 =?us-ascii?Q?tcBOOym/Ekdx7hPPsa4d6eMpnyeeUvjRG1h2Ym3M1LdNnXoJ5cAKLYjB8rSM?=
 =?us-ascii?Q?OnxmDsVKs8xWmNNyW+RI7+9VTD8TIRY6rz9TBR5NXneDkEJrQsQe5r13aPkx?=
 =?us-ascii?Q?1QXMELO5dd5C+4BimEg4PovfqvXppBIgA0hrUV65nlDy9AuDWQe68oD/rMZI?=
 =?us-ascii?Q?Xr44FYI/3OQe2D2NGGQeJNNmeLvnQSTXTOlgJYzXFpyhBr1PSTNQLnYmvLu1?=
 =?us-ascii?Q?mPCAknLB480n/5rGf/L5SafdpXlfBjzKSm2Ol5jxvRDEWYGE6cROtD0Jh6ym?=
 =?us-ascii?Q?UaZr9tx5m99eYAx3/IwIj/LEKl4qgqy4x2uSRfZtKWVxIK8uzM+8Ew9wG5Ye?=
 =?us-ascii?Q?gtZSVXa39vcMz0fesYY98iN6pkvt+eK/pFSHkR/k63NKYexF3i/5CZoLIyoI?=
 =?us-ascii?Q?ldOtddHJEBBbGMPy/f5EaFYTT9mfZ91pj50zkyWCHU2kyUpf++KYj3dkGGyS?=
 =?us-ascii?Q?AU6YetDHOSHaLzZTLQB06Ebgzc62tJUyLVQm6tHkLJ87oABhPPMBdzO6WoNk?=
 =?us-ascii?Q?o5mCI49Pmxn8RqTqSifyoPdh7LsypISoHNnWa+f4EqSJK3vgXduxfva4raSC?=
 =?us-ascii?Q?ev4B24UVHCp/eYJrucUYXyJ7021mFV3KXYthV1dRCIcaJMyszyOorh63cawU?=
 =?us-ascii?Q?WkWy6IA7aiqVxiZJGkjiceL6xtUCf2Jj5ZARAVSKxxPxMiWTcIB3kbc4X/4+?=
 =?us-ascii?Q?ad0w9dbaepj0AyboNb0qSxqIVqXkQyx9BpoU2JQn5IbkfiOkVH3OdeQkAS3y?=
 =?us-ascii?Q?G4TFHz2p3KNG3kEYGGPjYPFZRH6DhKGy3smIYZVpTRLVNYtZ3C9gRgkVNj5N?=
 =?us-ascii?Q?GCPr9EOM/NbYGcx2yFcjOnRu6uBDrE0lBkm9zo0bG13Nt+/DHB/M6eE83itE?=
 =?us-ascii?Q?7h3fZvUuEDV0GhNFCgV60ApISnss1OQSs6De/EJtNK3RAPxpyE8Wim51i2bZ?=
 =?us-ascii?Q?uguc8t2CfBCIphJCB35mc/chYAIRXQtHRb+9y7b2BYzSZFh8Lh40r2wiYs2j?=
 =?us-ascii?Q?zTKEd/VZpOqgiHiqYgxrk/f/Rf7+m7G5vh+JOgJSmR8hPttV7U4WUZHGatwZ?=
 =?us-ascii?Q?umjPLq5sDbIOsa7J/+6/jJoHnI6eROH2MXXw2lHe3WYJqLagH6ysZm/6c20v?=
 =?us-ascii?Q?I2AVy9bSgLsmrETpIWcFQw4MDS/2YVD13SP4fErMRJ4UOF2B1smkTpbAOlqR?=
 =?us-ascii?Q?RakVTk6YaOBJ76DIgmN3P7nsLcAC8YnSuQCKGzWup4CJnA8dFfxgwf79fs0r?=
 =?us-ascii?Q?BY+hHGuP+UMaLWyuU8yJFHwVtwfZ8+qvv0pdocY7droV4Gd4dwcA5wzlKpJq?=
 =?us-ascii?Q?Z6szxXcDVJg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2C23o+UwoF7pbAVVnzzdwN6J+TINIrBde+GdqpoA235HXhEIrcrW46/13jcI?=
 =?us-ascii?Q?RqTOeVIhAFOFZSePVeYxsf/tOS4RNPOdT6I2ypqJLFwZ5NpDJJ8GxJzScRqX?=
 =?us-ascii?Q?4to9z18gpEy6R+jxDj6PcaiPgGN9McWQV8WhstpUMWCh0Xbqsyvf77mH95vy?=
 =?us-ascii?Q?aEm40ilNX+Li3aJFgJ/qymQG+HEzpSyFaDYu01tDt05tfJP7XMQpxgpgqyGx?=
 =?us-ascii?Q?pHV5KyIi5yON/Wd3hHgqBKQJyHebwpsRNruJPQxXZ2/sYlf0UPj+438egaDZ?=
 =?us-ascii?Q?t8oFY4tMxPyRg2C+kOzwFMK8SiiWDUucmGuosy40ChSLQ2lNTcM+sMMgyDJq?=
 =?us-ascii?Q?e/5M+7t2SBUIJbC9l40jx+m/wDQW7DezSx9ZTi0frhdeZ9s2CvrXktXOZFDE?=
 =?us-ascii?Q?rfKlV1qI93BB4/E9pxFj5SMKB0jn50ltXKJz6ba6PRxLvHkoWDjmDK9xjOU9?=
 =?us-ascii?Q?sKXxH6CNP8DYs05v5XJv2aNhzETVAKBXiEeY5ZuaLC3hmePeuNBnNYfupMsR?=
 =?us-ascii?Q?zROqmrYh0oRyVF6hK9gvYeBgN2aqV+UwS02An5T0VJN5TuO7DfcQTunxTo+j?=
 =?us-ascii?Q?he4SGRiJWHGRpLWD3yvsGf34GPryFLPZ/B+05Zd2ipyRZsUIwD4gguAqy6nm?=
 =?us-ascii?Q?1KH+T9vO56nzm4W/mCSfb+tM5yrLwCsQ4+tmA/FleAAcXlWxMpWO46MVjDY1?=
 =?us-ascii?Q?XKfqYsbRBOPwNVb+AhlrjCsBt+PEXwXO0DD2Bq0F4IPiuIDHLS3grQxDYflP?=
 =?us-ascii?Q?MEJfHwns5qSfZrbNLXMWLO4cPD6gYKj78A21I21bpwVyQi/fvo6HfGwWBUxX?=
 =?us-ascii?Q?PFT2Q+FNXaFjecr2gY94sH4ZM95fP16R+sm3+FHqDmsZmkAvlJz0d44bOeU1?=
 =?us-ascii?Q?sxh5M5OytfODGVDwlVYbtokSTyaYYLkTCN3+KvHq4QenSg0GShd651LhhNCA?=
 =?us-ascii?Q?hb1KLMRnrJguw/tAsg0xWVGFjOCTbTypt0p/meX8l/XD3BKBHO8bl7250NwE?=
 =?us-ascii?Q?kC8m36jWAYA5cwP8OweC7Neia6/r5RpK8iTY3jTD55S+xRC9zOFi4mjElEzO?=
 =?us-ascii?Q?yEhF6gWxIUipHwFptHzuBPVs0UxPxib9bxLz5FCeYQ+a13gSqmL7eu9y+w67?=
 =?us-ascii?Q?oTE1iyp53sfWbAxX0SCxu0EfJTZ9pulMJKuXOkwdkuSJnqZFlH5P0tYx8d3m?=
 =?us-ascii?Q?CJJc8tQFLbIfo3x57KEf/cSABTR/npEOBMRn+7mvDB6VEJA44slpbLPbMCcs?=
 =?us-ascii?Q?8sCobUVKjuTOGRbuROy+/VIrJ7HOcutYBDROJCQTD2AJb4same5lMIlVPvyS?=
 =?us-ascii?Q?0HyWYJfUK+bvj1KzHeo75UNEPAkABmodsBP+NE0ocLp9JXBA2uHegDHu+VJG?=
 =?us-ascii?Q?0fEQObxqmenyGsQZoekeBYOGOnrhMTCJO3dQX2QgHr5h7IeYh5OQICPKi5El?=
 =?us-ascii?Q?WldYqDkV5qEj/a5/fyrgbCvbFWl5nSyMJtewcG6DTvJeNINXbGw51bLTCWDV?=
 =?us-ascii?Q?ih9P1j8wvXCg4//dbRH++z0sWa8isRyF3b6lYSQMJc/Zyfm+nFxwM3boY1fE?=
 =?us-ascii?Q?hG/JC/HL8gK0N5HoXc/z6vE0mKEM+b7Q26S7s3aV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75195820-ed85-4985-c865-08dd8ca95d3a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 14:22:00.0074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1caTNS1TbIbPcsflhslvil0eBVMUtcQgDziyrM1GSibDwfcS06fsbnw2h/PZK+GjNvgiX8oPEuJuoudN3MACA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7655

On Fri, May 02, 2025 at 09:04:03AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 30, 2025 at 06:36:33PM GMT, Ioana Ciornei wrote:
> > From: Vladimir Oltean <vladimir.oltean@nxp.com>
> > 
> > The MDIO mux on the LS1028A-QDS never worked in mainline. The device
> > tree was submitted as-is, and there is a downstream driver for the QIXIS
> > FPGA:
> > 
> > https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> > 
> > That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
> > and the hardware works with the simple-mfd-i2c driver, so there isn't
> > any reason to upstream the other one.
> > 
> > Adapt the compatible string and child node format of the FPGA node, so
> > that the simple-mfd-i2c driver accepts it.
> 
> Why do you break the users based on some driver differences? Fix the
> drivers, not the DTS.
> 
> > 
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> > index 0bb2f28a0441..58b54d521d75 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> > @@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
> >  	};
> >  
> >  	fpga@66 {
> > -		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
> > -			     "simple-mfd";
> > +		compatible = "fsl,ls1028a-qds-qixis-i2c";
> 
> This breaks all the existing users. NAK.

Using a mainline kernel, this DT node was never used or probed by a
driver since that driver was never submitted. I am not breaking any user
of the mainline kernel.

> 
> >  		reg = <0x66>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> >  
> > -		mux: mux-controller {
> > +		mux: mux-controller@54 {
> 
> This was never tested. Your binding says something else.

Will fix the binding in v2.

Ioana
