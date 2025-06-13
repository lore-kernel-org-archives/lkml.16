Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB0315278E;
	Fri, 13 Jun 2025 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749784683; cv=fail; b=mZKmbjUYaIlqd+/YP7v360AH+nXcFYJ0Qq3gcNd3z1gWbtn8YgtjEvZnwPuhB3pcNr4/jC5I2xnBnwxy7eca6v3dMISnHnA98z3yq2SxUesZeiWG2jO2o58qrgZIaz2HP3n+3V6Kj8YSEchyh1bPModNVbl+WbXZ1wqagCwyIMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749784683; c=relaxed/simple;
	bh=rrhZPLG/4kC1jemhmqeV9MRpZugXMWEtdRevNp8RRPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=USpQVAXgN8eAbjm9ctzawwP6y9f1XAaYh4qEH5Gb5WHG1x10gai2qVHIDAKnATfxuku6Hl4l8WRydyZRNzwDCBF5Uoe7JPLqvv5Kbcwxp+und3//uV3hGlFyJEGc+0uOUR4pQp24PSsWBZYB9uauAYWdCMZd0v3B7BF25NMdwt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KvmRPvVC; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KvmRPvVC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bikrkvImVQsyvmf/pDH5bMUSiUm2muIAVLjmISzUYijbngQYDnAW/o+vpYkMglFIpfMEY2LJRtVsX0bGZUVgUiypLPWeQAxfbqjnV0iKusSeZmu5aqCDr2SvBCeu9h/4aiMaPi11brVOmrGKX7Nya6n8QCaea2LlsXmZl4c5S05kFiLvBsZ60H9gHdmizqtXlzWu2p6oEHXaDRPE1ehz63Y4cvgd9lMWT/g5WhE18wNjT1DMEkyLnjANqS3RcL/X42Y3f5JUmj7evUNmaPylntzR0P8xIQMFMHa1s4BzMKIhqtDfvEst6eW1wR9Go4q/cxSYUrif2VA3IU4pu3YOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQeuvsW1zLn9988/s7voTAzfc1HunMaRyQgmYQXieS0=;
 b=DZ7IEKRpmWt75TMNsA1ccFCpNCACCipMg08KRGjCVcPR29OCqp2S7h5evCCGCePKc7+ITJk/D5FstZjOedJ1Q4rauzEFSWIidp+JfY8WWjDbYU3F1b0Gmec51DjLg45LpjJr5GcWzbbzxU+DF0bsEamAxBNiA+74wBaF0oed1pDKq7btwVYRaJlBXC2z0I1ylVPaMj5gAIK9LYNKXenLtPcf+jL+mAGy3orwGhQqa0s6lziakMP7/nmHX6y5PLHAuzrjWH2fBokRus9dTTg8Dku2a6vxOFIoNj1zereepBHOxrS7fAnFiSacpz9ODr2VsJTM6cyFz+RdNEk2O+c6Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQeuvsW1zLn9988/s7voTAzfc1HunMaRyQgmYQXieS0=;
 b=KvmRPvVCcRx2CWrgqovTI1QauRFEh7YRd1lGqUJR0k8zVg2JlJOijzBSJU9aUE1zpp8eZ9s7SKVv8kHmF74swnXLj/gehbcGaIejt6VMOT99WIWnYb6ngrfqIoELh6JLUjzvSamxrMAtUa1NGvX3tt4aff4UGUgTWrcNUUZkrtCCceRFYXW1yPJRrM2w0OV5HiRwM/ZoFhV/qoc4DTac+3wKtnBk/yB2SphItxnKPQ9WIwkuJnjCgioxPEQ+3eoYhnkSAe7ATxbUDWHFvQa4JtHHsGfplBf2zoCQWEu6AfuBPZMZ6wo1GR2oMjnCvnR09l72S7UufALlontL7RBWgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10637.eurprd04.prod.outlook.com (2603:10a6:800:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 03:17:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 03:17:57 +0000
Date: Fri, 13 Jun 2025 11:13:15 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Shawn Guo <shawnguo@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Shawn Guo <shawnguo2@yeah.net>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <vgmbyikra4stccdspthialbaqwicf4bx5hnah2ufgzlrym6qvk@fqx6357jfep3>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
 <k6j2za47cp4ccyfkevwpx2x5s4bjrxxqhqvteyspbf2n7yxcff@ccztqeuhn2di>
 <5acfd382-28d5-4d74-997c-361499cc0bb0@actia.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5acfd382-28d5-4d74-997c-361499cc0bb0@actia.se>
X-ClientProxiedBy: AM0PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::38) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10637:EE_
X-MS-Office365-Filtering-Correlation-Id: 8368e7ae-f117-4030-b3d6-08ddaa28e4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Eu0jyxNmttEXveF7zk/ETS0ZE2vgE87zWoKQ+P+q6HJtOJYlmMc2F6Ozkwad?=
 =?us-ascii?Q?s8L3XrywCveErXp3G7U8erZf55yoTbXt7itQ5LfZJt5mZ0ho7AiB4m5hWcR3?=
 =?us-ascii?Q?XAfzFJYXbxtCOv1CNsYV0b/OG5kvkT02o6A7is7G97NGL7er1ItTDWB2Ef0A?=
 =?us-ascii?Q?iHUPikngEK6+lDHTbp/kNzQyqwravvkCa+4anIvWyyt/pIVe/EjfS/XoBV/N?=
 =?us-ascii?Q?5F+na101wB3SbXMz3uAMAOGn67HUqGjNuV1pa7hrCMg5UJW3Cyd7BhOGpmS7?=
 =?us-ascii?Q?et1QdU+o6GzVUGCxrXPq0y9hnSf3fF4XP5hf9kwoIPMjxPEYbHASHwdxKaHM?=
 =?us-ascii?Q?wurSoVTsjlD+8IIahGX4QOicD9KoRgz5AwQxZYLu7SYqTaWQaaUTrc8fj8bK?=
 =?us-ascii?Q?JNvtlS3+jJSGyo1Ean9p7HOeEKx7kS++Na7GLp7AaBKQO9C1+e4ZPwa/HpTN?=
 =?us-ascii?Q?lk+zDm6VvGSUOppapoNZdV1g8d+/aBJ378XG6ZInEky9pd12XVaxrP24wzsX?=
 =?us-ascii?Q?jIkAuiXWDW8FRdoNNw5AWDeqD6TAgXHPMxsKvMspAYIncd6k6FUzOkf2SaAz?=
 =?us-ascii?Q?bWVxK2MsFCVDOvR/ZSuhtQVqldE6kFqa/2EgrocTKuwawWKBT6Z5/bUj06k2?=
 =?us-ascii?Q?eMnpZkMXMt7MD6LU0cLkRf/3b1euOjJiEZ4opGDyU5NgQGjh4YAqHcbMArc8?=
 =?us-ascii?Q?+xD1SdcpDmvYkPxWZs/IcBsVBlcAZvu4fIsB/UZgXM6ZfP0Id1GtsjKU9lyF?=
 =?us-ascii?Q?J4FiMkGpXJLa8eb+qZJMf7IRlNfY9+Bf0I4z168J3dvxqquEPvvsUsd8lOyn?=
 =?us-ascii?Q?Vnmt/dhNGfpCyRuGfBQ3+VMHv9v4LFX4Qh5QduGNhFgb5Yb9Kq+75r85WYRJ?=
 =?us-ascii?Q?KoF3U70hi5ZW5emzmo9HEluDRp4e0E4pkU1eOPnreSm9/SH8upmp692HoZk9?=
 =?us-ascii?Q?TDx/VXfDZCehOOvnWAPQVl0GZQhQnBHddvBG8BHtbxOgSYaoCRfYVjDQzYZo?=
 =?us-ascii?Q?vWi4Jkl8KbBPC7nJe0sRm8XtpQ73scuNM6ODHjJu6WdR+q0NCGd178epdpvn?=
 =?us-ascii?Q?BRlhaCZkwwsbjmhFzbP+IZq3HVq9A9XmcnAXpIzrOZwAr37wbo+P31moatpF?=
 =?us-ascii?Q?bpFzVAm1sR992ykSvXiRCEjkXcT3qN3O9aLjH07cK2JWjiDbWrAWdzQKHxoL?=
 =?us-ascii?Q?Q455cmIXZPOR90JKE0cHOOuKtiBuzwoLiuKjUroPotpePXborVSFDHDyHsr8?=
 =?us-ascii?Q?Lzf3snmZzBnu1yrjUsxEnKWSSttNav5rG8gPC1bSaBzSDgPJrLQ44i3Tt59p?=
 =?us-ascii?Q?jHq/COrlvLbm7AzG9KCkJBKnaQVk5iPswPoAoV6+cEnETp7CvDEItSzId2yK?=
 =?us-ascii?Q?FXcBdyLGZHMnEAH8+YmYDIPix4/3OwbzD4ZKIzawodzHIq2VzuiHGIEaIPru?=
 =?us-ascii?Q?DPdvVLu9JGBGWlVXSbCYVZPsRJfzfTL2LxKl4xBveglp8ymVqY6Qyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HMeqMBUgsxt+cz5HFjCmNfAPXeGFeLUm5ercLLvVb+Y9JX7bGdYyRPiAIeR3?=
 =?us-ascii?Q?laATgckMZR7J15+Fpgles3EGAujY4RX9Pn9FccE0vcM1HcU8DL59s3ywdE/m?=
 =?us-ascii?Q?lrxM77cs+5OXAAQdoHnefX52ZIF9xdCAkcswRaob3WWBhjv3cM5L1WLEXqee?=
 =?us-ascii?Q?px46kcU8qIZSxhJ4BwSiZ+P2RKkMRclk2ssKqlxvjZrMEBQQB5w3BQhD4G1f?=
 =?us-ascii?Q?Zn08uKPjBHUYSIVtZXdLf4kAOJJRk9DUb9RtAJXEyZ7qrg9UOfk91nvjTm6Z?=
 =?us-ascii?Q?3Teq/Iy4HQt4RYA8RhDFqpDZXNxL+0hPcxztdSHA1fP3RqV7XzWiD1RdWSPL?=
 =?us-ascii?Q?UjxwBVP6U4WNr+qTsHl9T3RJbzH1JPK68rzK/VjPZVPIcgTMVP/JNcpmqA/i?=
 =?us-ascii?Q?BqDyIZigsD4PWqwOduUoL+YFdM/3MY74L98K4sZyghxIeL0Xs7x+cIYBofcX?=
 =?us-ascii?Q?y6hnW2unDr1BJCr3qq45nnmg8jUseW0Ps2xYNoUyFpvRfjOU2hWzOAmqEwgX?=
 =?us-ascii?Q?8+uDaHN471Yr5NjTeTPsa3/gzboVfHcaDTk9/Wz3TUJe3Ir5cHpWxJ02vlIV?=
 =?us-ascii?Q?NMwu/A/yIV/JM798mVqgEm5nJxyM0iIW13JEDtAlybffrv8ffgT3v1EO8ALD?=
 =?us-ascii?Q?ROMZb2oQBdvBjf4joXzZtArKRI6y1Hz5aUwnVqyxBTNlFccHai7rxjoXl3D3?=
 =?us-ascii?Q?kBMUX3kIDChfpAzdf8Zh2An4JnQpt9kF818FlQggpd7KmceZBpJc31qW43JX?=
 =?us-ascii?Q?Os3+QhP9mo2GVgzy+bhpzCRG5bW2Q5x5P4js5YhOQHAhGb7Fao570mpXQaAV?=
 =?us-ascii?Q?gPHNOILYCVkQBs6CWvCXya+5uDyPZiiuhQmyYyIE3fiaQK3+fu8fbSl4su3V?=
 =?us-ascii?Q?h0CGZToUNtHs/+DhocoDMDC6mxQo1U0PH45t5prIKER0oA1zDqodFCfylqHZ?=
 =?us-ascii?Q?lux2tTg3DIpi7JiLMM4oHBuReN2xErNE1tWdpNH4n7KX9Ta+hC0d/MiNDsUY?=
 =?us-ascii?Q?1z31FwXx+odCRMcYBNhvpXOdO9wDLRh/sl1G9Iw8eSW3BjgkbuWwoBL1eNSv?=
 =?us-ascii?Q?jwbYQPUMBVBN91oe3hELd2VRrne2lE3A8gsKt/PGXaYiMA2/yDVsVIflrYzz?=
 =?us-ascii?Q?FDGXSdVeIIrKWjDepcbhVUop7OV5XBPg/zjOTJFfn8o1KDVd/Wj7L1DUxUUY?=
 =?us-ascii?Q?iv93RTRmTTTRXKi6ov73uUGY8w6E1cIhUx1slyn6ZUZ5lcSeISZGlFnCRwye?=
 =?us-ascii?Q?8fIXNsDx0vEGt4Ij+kymo9dEfXFVTnocGoc3ivKUoUzqx564YYXwS4nIWvZA?=
 =?us-ascii?Q?ETlF0wMpgB+nb2ZlQPzwIqGl+8gGVfzzMSZUUNsSUOYlOEyiIlGZNjVxxp7Y?=
 =?us-ascii?Q?fYpza2NZeWJFIp4swxKcaHqsl/8eZdYCD+V3N4AaIaRzbqWj1GqcWd3lm/RK?=
 =?us-ascii?Q?HTR9lNxz+8ftUm8nsrlKCDe23akuFiBT6M06hOS/8udH7liKs6qJXuHqCANI?=
 =?us-ascii?Q?dcW48o6cKASOAI8a331V78+2g5eDCzWyt/GXf8L5Yw8RdRK/dTEi/d//HVky?=
 =?us-ascii?Q?miSbYdKY46yqLkW5ZS63qK/8J5B36mGYATyJhOgq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8368e7ae-f117-4030-b3d6-08ddaa28e4e8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 03:17:57.4779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CHYp/s43ToHeDDc6zJLcwpOp52lF4LrFdQpCsgezlAOsitpk5T1luDildBeMRZ5vEBH5bNDdibCboKbMwiU8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10637

On Thu, Jun 12, 2025 at 01:23:29PM +0000, John Ernberg wrote:
> Hi Xu, Shawn,
> 
> On 6/10/25 1:30 PM, Xu Yang wrote:
> > Hi John,
> > 
> > On Mon, Jun 09, 2025 at 02:17:30PM +0000, John Ernberg wrote:
> >> Hi Shawn, Xu,
> >>
> >> On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> >>> Hi Shawn,
> >>>
> >>> Thanks for your reports!
> >>>
> >>> On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> >>>> Hi Xu, Peter,
> >>>>
> >>>> I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> >>>>
> >>>>   - USB gadget is enabled as Ethernet
> >>>>   - There is data transfer over USB Ethernet
> >>>>   - Device is going in/out suspend
> >>>>
> >>>> A simple way to reproduce the issue could be:
> >>>>
> >>>>   1. Copy a big file (like 500MB) from host PC to device with scp
> >>>>
> >>>>   2. While the file copy is ongoing, suspend & resume the device like:
> >>>>
> >>>>      $ echo +3 > /sys/class/rtc/rtc0/wakealarm; echo mem > /sys/power/state
> >>>>
> >>>>   3. The device will hang up there
> >>>>
> >>>> I reproduced on the following kernels:
> >>>>
> >>>>   - Mainline kernel
> >>>>   - NXP kernel lf-6.6.y
> >>>>   - NXP kernel lf-6.12.y
> >>>>
> >>>> But NXP kernel lf-6.1.y doesn't have this problem.  I tracked it down to
> >>>> Peter's commit [1] on lf-6.1.y, and found that the gadget disconnect &
> >>>> connect calls got lost from suspend & resume hooks, when the commit were
> >>>> split and pushed upstream.  I confirm that adding the calls back fixes
> >>>> the hangup.
> >>
> >> We probably ran into the same problem trying to bring onboard 6.12, going
> >> from 6.1, on iMX8QXP. I managed to trace the hang to EP priming through a
> >> combination of debug tracing and BUG_ON experiments. See if it starts
> >> splatin with the below change.
> >>
> >> ----------------->8------------------
> >>
> >> >From 092599ab6f9e20412a7ca1eb118dd2be80cd18ff Mon Sep 17 00:00:00 2001
> >> From: John Ernberg <john.ernberg@actia.se>
> >> Date: Mon, 5 May 2025 09:09:01 +0200
> >> Subject: [PATCH] USB: ci: gadget: Panic if priming when gadget off
> >>
> >> ---
> >>   drivers/usb/chipidea/udc.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> >> index 2fea263a5e30..544aa4fa2d1d 100644
> >> --- a/drivers/usb/chipidea/udc.c
> >> +++ b/drivers/usb/chipidea/udc.c
> >> @@ -203,8 +203,10 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
> >>
> >>      hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
> >>
> >> -   while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
> >> +   while (hw_read(ci, OP_ENDPTPRIME, BIT(n))) {
> >>          cpu_relax();
> >> +       BUG_ON(dir == TX && !hw_read(ci, OP_ENDPTCTRL + num, ENDPTCTRL_TXE));
> >> +   }
> >>      if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
> >>          return -EAGAIN;
> >>
> >> ----------------->8------------------
> >>
> >> On the iMX8QXP you may additionally run into asychronous aborts and SError
> >> due to resource being disabled.
> >>
> >>>>
> >>>> ---8<--------------------
> >>>>
> >>>> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> >>>> index 8a9b31fd5c89..72329a7eac4d 100644
> >>>> --- a/drivers/usb/chipidea/udc.c
> >>>> +++ b/drivers/usb/chipidea/udc.c
> >>>> @@ -2374,6 +2374,9 @@ static void udc_suspend(struct ci_hdrc *ci)
> >>>>           */
> >>>>          if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
> >>>>                  hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> >>>> +
> >>>> +       if (ci->driver && ci->vbus_active && (ci->gadget.state != USB_STATE_SUSPENDED))
> >>>> +               usb_gadget_disconnect(&ci->gadget);
> >>>>   }
> >>>>
> >>>>   static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> >>>> @@ -2384,6 +2387,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> >>>>                                          OTGSC_BSVIS | OTGSC_BSVIE);
> >>>>                  if (ci->vbus_active)
> >>>>                          usb_gadget_vbus_disconnect(&ci->gadget);
> >>>> +       } else {
> >>>> +               if (ci->driver && ci->vbus_active)
> >>>> +                       usb_gadget_connect(&ci->gadget);
> >>>>          }
> >>>>
> >>>>          /* Restore value 0 if it was set for power lost check */
> >>>>
> >>>> ---->8------------------
> > 
> > Does above change work for you?
> > 
> 
> I have ran suspend/resume tests for about 12 hours now with this change 
> and not had any trouble on iMX8QXP, where it was not possible to run 
> such tests for so long before.
> 
> Please pick up if you submit this formally:
> 
> Tested-by: John Ernberg <john.ernberg@actia.se> # iMX8QXP

Good to know.

Thanks,
Xu Yang

> 
> Thanks! // John Ernberg
