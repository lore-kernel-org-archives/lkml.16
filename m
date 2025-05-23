Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C7296FAC;
	Fri, 23 May 2025 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017580; cv=fail; b=bNYZqPGhZ75NbESr14cPv2BrpJn0MCQcClFf/vHPwFGcgEfOX82z/Sh8RjpL3bzfe7odaOvMYrQfuS60DSqAsMy1GMR3Uoe6zvRPRXfMaq0SRH96EBU3Fds9u2JWTKhn79tnKKUCsGBjel969NgVSngQo5JT8zLHATbYuCbw9Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017580; c=relaxed/simple;
	bh=a3aHTD7Kq0y+5FAzfa1zMGi7r0dRpZzB1q1oZBAE0B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r7bYsSLgojBJ7lZU28BE6FirbD4TjTIxM5e1KzYuGH0yHVHvLrNOp3Ixh/FTolmEz4uRJ3iRJB1rpEsVzJ2tHcV6CuxjyGHC1clQKpar3O30T5gpX5bYELhxHf9GkRzfIrNZzscAhISl4S31eIfNuNYpmwjwRicAcHloZaIBx78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dGVnghpU; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dGVnghpU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbppCgGRiRmTLYsjGXYjr5G3ey/bYnqAUXtj3meYv6okuo546dRCRQEATxRM4To2AvntcPcktXLmRc3sp7kEHhFkWqemI2vGVRWxnMVXFt+9NatYwrXOPa1RBrTJlhlZjSAyoDPeJB5lLMctve5Cy2vH8ROIcNFNYniZJfBg8QwM50fnEckAwaXzAZE8R3Dt6vLxL1ViAi3Rx6i+E4p+NiVThaWJkOVvN8Vgu2PkN/TzYK9oGCuU1FrfbdEHOMOUf7csBLMbNK6ZA24WIITI9l/gpwAbNlJshdr0V9F/I4jJj+9urf2adTiobCqNY+zamquYSG6hzqHFtZxdUvYoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QHJvAVNs1b3HiwayIwvOy3FfpSyOxHSjLD3sxNbQ3w=;
 b=E3GI7SgyRYJusmDm2aOtEz7kO/oJW1UKzgWGe+3BVK+cX80Ca1LooT+AM6ZwDzRFkkHtnOZKdl9tdHKnrmSySv+WBtqzp9IgSQMU/eq0qbnarTt5mI8ko23tFt3ynyEqRVCjhfrINIesFUVk/4AvOAH6PnpG+gfW0EqmvZfGEimwke/2i2BXlbawag3HLNIokniGQd9mgWnLyuRqHvX0dJXiZWD1pQIFlMu+Q4MJ53x7FDxdajCRV4ZN6uQyGT9wT2pTDh7wSFiA6WoPaIjqffl3exE83dwL3hPb+R03dKP4hzH2o4vqGA6CmNbf7CAkHyHN9GxzHyT3UUxb+HRUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QHJvAVNs1b3HiwayIwvOy3FfpSyOxHSjLD3sxNbQ3w=;
 b=dGVnghpUv7fNDWTcdnDycqbIc5D3INwNvSSJQlDbv3PdG1HcvDcfmqaT2OQFgXIFmmb5sgrffHxP0ANGHvstUUiKKeVvE8DPhmV2J/SlPb5tFrw+zAB5ZmNNt50TBqKK+5IRQt320GxbdMYJfGc9u79bs5x3Nb39laDEedFAi/NE99VPmNYuSjeeQPcJMW68JwLekjDhY4EwJMIA7wNEidcsMNnXPaVVIbX7wneaNhknEKXahwHYTJwyqLkIDhiOZfQHr/tg43Ba4NQZi4uywNhL0vqk6nZM5dhVLnLhXqHRp1HFBNnWCzMVBvL1cvs80okHXBB5IVr0RsCTN3Zqug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9549.eurprd04.prod.outlook.com (2603:10a6:20b:4f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 16:26:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:26:14 +0000
Date: Fri, 23 May 2025 12:26:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: Add compatible string
 adi,adt7411
Message-ID: <aDChnSd6Z1lu5eBB@lizhi-Precision-Tower-5810>
References: <20250523151338.541529-1-Frank.Li@nxp.com>
 <20250523-fridge-scarecrow-982578c16bf0@spud>
 <e11aade8-f646-4d94-942c-6186f06fe783@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e11aade8-f646-4d94-942c-6186f06fe783@roeck-us.net>
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: e3247e55-3eff-46f3-e06f-08dd9a16893b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?gXMisJO13qizmV4r8qaGxglLsF3NfPYJbdKu5PlHK+nwl8TAktAOnRWmexX/?=
 =?us-ascii?Q?9wHUJ4Zd7g6UmrMPrGQQxxG/99o6v3y+0dhlGADN1CrpiMqpgfALcFFjJd3+?=
 =?us-ascii?Q?tsnIHLfAJ2t4x6Pzf7o5MoCzaf8Rc5SOJmvZAS0b48C5pUDUFehGRAUquqGP?=
 =?us-ascii?Q?VCsch8oPDgQJEkrHSEd0G9mjSj206sIngSN37PpN6pIQHQAKjkbe8+VVimEd?=
 =?us-ascii?Q?qe9M/6GIWJSUPF23G5kFkhetOQy0oZwiZYUznz/QsWXVKSv78MRUx4qOflVV?=
 =?us-ascii?Q?8yneBWRXAEd3fXkVanKcK2hRAD3odNXija2OVJs7F03DYTpukO7o4WqeZTR/?=
 =?us-ascii?Q?1RkhBJWKQQpVs0qS2lasiKqtwuY5AmOHso4/pPnmijlegsx1B5k44hUgKzUQ?=
 =?us-ascii?Q?CmYC/i2+x3pO1io7epDnm4tFjHKA6T3TcfNdCO+kTicS64piko74LK9No93I?=
 =?us-ascii?Q?aBxF4E6ThWtXFrKHcM1WgYXkmpMI3Sy2D1ZCDwPQvu2xEOY+dDQn1CE51rSM?=
 =?us-ascii?Q?mU0NUo33wIRaT2+w115fzHUpPoJ8Rv3KVu3wv6eSJG+35Df9bWQMbxDU3d8K?=
 =?us-ascii?Q?aTg/Xj2fV1PQ1QZgrqH1nBJvHtZbICguPB8LfNUKifz0xMOUZcDgMgqqid36?=
 =?us-ascii?Q?YD4j+iVFU2MlPMIAy8Dpx/p8Fn9ZuLVoaWsKeD2aDQKICOUIQzOKVWJep3ZK?=
 =?us-ascii?Q?rwZYbxDlkQWkl1hPEZfbKXWixNHEdc1LBaWPjpqLN80I/QMiIUktvaVHWAwB?=
 =?us-ascii?Q?PYZ+f3eadLcLPROk6DCMd73kXrCIRQ6AujBDijC77hv3PZYzEv+xg9fMvM15?=
 =?us-ascii?Q?Ul+PZvEa316sVxMabSAFTik1kKGtsJSPAtyK7Ws8Aq6vJCp1s9JJuUwLGo91?=
 =?us-ascii?Q?BlOLq33zh9EG+nfWM8X3oUVTUr2mxbO1cMfU0dVgphM+BcyfE8KVSGcLqaKk?=
 =?us-ascii?Q?HY8al8i54ULvIgWeT9BSi2QyxUqGPYkp8hEkn6g671CJ1a1HUMoiEViIJehw?=
 =?us-ascii?Q?3LtWrFjG4g5hhivBS8i4NJJ2HscLkEfZacQcgSEDYlEsS3Afi+kngPp7DEFu?=
 =?us-ascii?Q?LKhHx2ZYCPm1pTRMedlRcepqkRRKBGgF4vIvaWjMKii33WcrP5+2jThlp+fM?=
 =?us-ascii?Q?kfwhqjKvJWiwoUUUxY69bk2SXyucjKGQIw4hgiojgxLyjfHvEws+wQQn/Y+k?=
 =?us-ascii?Q?hwkioKwHVE8KvfrHpXZaijOqLjHQUiXiwMpOMqYQ6OLmbiVGMQRyzMd2w7BK?=
 =?us-ascii?Q?e2CHuCtiwkNBRI+hkJestYosJBiGRdjLEbohag0jIGb4mB8BsWKUjCFXf3TN?=
 =?us-ascii?Q?MnmxccGICfFiOjmQOXuWjwMUCZnTgyr70iLes75OuWD3YstX4lOouzKukHZW?=
 =?us-ascii?Q?5oZ63SJq1uq5KVuQrJ0JLZgo0zCxI0xFQYhBBmuk9FN1sPUIUnn2e7YlyAvj?=
 =?us-ascii?Q?bg9NxgPw/7GwW9W1aGf5Yt3i9mlA97WpV8r6M49s2tXKQ2pVGKKN9Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?I8LZHGY+U+BqrdmgW7FT1793ektV9udYzF56KC5BloTb9MhXbcLDw7GPOa1O?=
 =?us-ascii?Q?DOu3ts1A0kdNS6gT+uFj8ywgCMgtInXdGjp1qUU48a4kjte7crUslE5KMnJn?=
 =?us-ascii?Q?PeB89f3kuMOfJJ4XRt2VeQCENITZgoeo/x7YweJNFEheootEIWEdcwqZkABC?=
 =?us-ascii?Q?ytjTLAwDj+arQLL2ORaQRW5niUk22k4Q8puBHIbPy0MwUnoVqhSHHz6mzzxa?=
 =?us-ascii?Q?JmnjmzBpNwVNZBhYDo9CfnBb40bQuvQNGra9PLEJsxLBtCp04qHenutN31Hg?=
 =?us-ascii?Q?Oqh4wdimVplEzrwMQaOSrL4ws3HsY7I48WgaoWRVuB1VRPNnoJPBSiV4Ms2Z?=
 =?us-ascii?Q?hrojAJWssM+mdBYXYzBeidU+DAwfOEiqq4qj92mYxywXI6Cs8oHVdlBkV1Ld?=
 =?us-ascii?Q?u54MrsktnffGGVc+9QUHNsc87iplONHQrIjiDXFie29vD0zC+3ue6T2JdW9d?=
 =?us-ascii?Q?gS122BrnGx/yzi/ztSo33JbmgjGkNpxOXEVanGwlZm8y3EYMOrCPMpn4tsT+?=
 =?us-ascii?Q?JLnSCNgDGecCKZS/9pY8z+ntrZ57uvThVMe9nYLQXY8m88aGcPzfA3whjvRP?=
 =?us-ascii?Q?75DqeZshjIyp2ZwEhwUfuo9Yr0WJd/KN3ZzP667gQQZ7jy1frzJLsbOIyRkp?=
 =?us-ascii?Q?lt+3LQWq/AWoKJ1mXDXostloAMnrn0wUuB/AJGEaJJ0sxN6Q1O1CJ0N4qaUP?=
 =?us-ascii?Q?wWNy+UvFVXiSXo8uUtzNDeOokJXoOMk/J8U6015sGHbLjecn6aWcTx8lJmKi?=
 =?us-ascii?Q?ojv/YxJ9xkzPvuRJZr6H4JKnmrpc0ZglLFrGQYXzEauOjw3PwoeptFQICgm7?=
 =?us-ascii?Q?DYk3L9UitcbO8Xpd7zBaxEPLf8EUjGMazc3LyPJ233qs3zeHmDxB8ZUIzTFv?=
 =?us-ascii?Q?zCG7HqPZ3qUHB7GNXNPqV9mT+q3kQ1jKVxhjgRVMn2SIvm50Vqf455h53BvB?=
 =?us-ascii?Q?T/JXqRMk6ES7iNM3GZl/a3m++aq8W8W3269HOvENwx+aPkMpUyyMiVi7B9AR?=
 =?us-ascii?Q?LeK/JOqzNqVm91p41Fy9DLn7IHROROpTzGXKKd78rUF6ZwoSSuGRPOIw8DbK?=
 =?us-ascii?Q?rBEuIjJbZhK+ZUw4puXd8wsBnvzHlnuTLIMjU11VSQOiBqp6w3UTRLbsTB7m?=
 =?us-ascii?Q?DsJy2ZPHy8DfgTZqi9A8scIV99Ih8VpveffqcyFrIrSoHIti347wDAr5uABg?=
 =?us-ascii?Q?56gIN3rTIjF+k22Y4I6Q5p4YDGunRT3kFrIthDcckJVnMD0rVSCeckOnjIXu?=
 =?us-ascii?Q?y0HlMRYjaKL2lpE/5vifxhs8HxEsF3IV4ZqgqQw3bcqNo/xeXk3ts6DKebNR?=
 =?us-ascii?Q?cA0OQoDeHIFtrOLD6C/Z+IIjwaS+h7zSh+43txZynaFxy9BfUJbb1aVQqCAB?=
 =?us-ascii?Q?MWzvpIDPBC9VneWZ8jg3vu/QVSty8vLjeaHcFeWl5wzahe9QhJRiUCkctnpq?=
 =?us-ascii?Q?CcFPcyzpcWM5N2xcKZunR1UoV1n6TxoXypmv7G9YBP1U/IVtbbquYuKezFB/?=
 =?us-ascii?Q?DHjRtPuEiCMl258emOhptpXfng/E7cVTih/reGbdkOndtuKv/rDoaPxD8anq?=
 =?us-ascii?Q?ln/w9Ufmw82V1YrBERY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3247e55-3eff-46f3-e06f-08dd9a16893b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:26:13.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qulnsoavKZL3D1KB/tX1ykebmVas5dTnzdFnp+OCNF8woiKtGg9P39O43rDnE0U4h2r8B3MrSTxsm3vzgNg2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9549

On Fri, May 23, 2025 at 09:02:12AM -0700, Guenter Roeck wrote:
> On 5/23/25 08:30, Conor Dooley wrote:
> > On Fri, May 23, 2025 at 11:13:37AM -0400, Frank Li wrote:
> > > Add compatible string adi,adt7411, which is temperature sensor and
> > > 8-Channel ADC.
> >
> > Usually for iio devices supplies are meant to be documented, and this
> > device has one.
> >
>
> FWIW, the driver supporting this chip is some 15 years old. I don't think
> anyone was talking about supplies at that time.
>
> Also, this is currently implemented as hwmon driver. Is there an effort
> to move the driver out of hwmon and into iio ? Fine with me if this is
> where things are going (one less driver to maintain), but I would caution
> that this will result in an ABI break for users of the hwmon driver.

I think no one want to move such old device. We just missed binding doc
for this compatible string.

Frank

>
> Thanks,
> Guenter
>
> > >
> > > Fix below CHECK_DTB warning:
> > >
> > > arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@400e6000/adc@4a:
> > >      failed to match any schema with compatible: ['adi,adt7411']
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >   Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > index 27930708ccd58..38bc1937ff3c9 100644
> > > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > @@ -41,6 +41,7 @@ properties:
> > >             - adi,ad5110
> > >               # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
> > >             - adi,adp5589
> > > +          - adi,adt7411 # Temperature Sensor and 8-Channel ADC
> > >               # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
> > >             - adi,lt7182s
> > >               # AMS iAQ-Core VOC Sensor
> > > --
> > > 2.34.1
> > >
>
