Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E27726A086;
	Wed,  7 May 2025 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620909; cv=fail; b=Ngd39lGAssUe4F/6NXeJFI7UhdZlmpKu8DPUOIgNCQPlInMHhZ+LodHt/CBpcm7dQAPdhY/01CksDdmShOsAnW9uLIBC2BIjYun9HXO4kDcmv9yRNKnAPWG1KGBUdzYjjw5GjXdjajgndV3dAxrIAutBiH8CkdhWKrqbaYkA0Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620909; c=relaxed/simple;
	bh=C4Y4GsHHwsgcz+CQMAC50QWsRd9psATD8xZkZoa5Xik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AkngOq3DgFbg4byFODGeqlC+PHXP44hjgqmSzcrSKGBwd96llfBbl6szii/v+u3VhhOIR6D4I8rtYb4vtVUO8+OQjCWJ701+yl3kRF6Y5SZUwTvr90Txs21LKH1g96jPyflcIM+pqsmHqU0jfOZ9bHCu5udwj03/DbeFWZnW0Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ciI/KIMM; arc=fail smtp.client-ip=40.107.21.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ciI/KIMM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIWrai3Nfj9nAJx4kNXepC6Oq84NSkRt18skAV/pjASRA0+iEqD26ANit+vp2FNJu6aUxUMKyAF2yA0G9Au9boLcmp5+9NwcxTR8EgHZbObocV7SfPlmkyg1v3C8tEQdM5avUI+dYm9h+Y22v0vdkCvJLu6rxLf6FZRtynNT10yWvphxGgYemBVuoo9xrdqhO3MZx95VJg1ZRbt8lsSND3L5SO4Au+9muVcTXnvCuXICkT4PkF5SLx7/O/6vQ72VoYwAM/34FmOZUkeS1bjd9s0SmfeK48PKL3oZERILeqANeJl0x5HaeoIOkX4sEcubDQjLT8MG0KvslpLt/3YsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5SevuPPEVbAbrFwpiGbOmoTZ+jUQaGXxOtjpB0/8ac=;
 b=TWLSceQjetmtK56kXclySo82/iNHy08dctZBajI7N7vsGZn2SS4MjFLaxAsDeJvu7Y/JSbirnBki1FQQMBNSR4hrQRnUYxtcfX+NpHx/ph5vrrIYrfx+5riEwnQ1Wk4SbazWeIUNxlZElZSKo8gugU5XwKuOT/bZ5QrFudpUFOgtyfqaZ29g2dZ6GnVCslgzuzQjWNGtI/mhwDgupmR1Y/KcISYqyuybqwtM5UdEjebI5vj1Zqg7ej3uz0wxBf+Vgip+i6l0S01nWvPiUA+kXD74h8HeXO5lX0OPgopCgUGKvMbW5lESQqf9r3WyWY4CNlUy377DyIWtPDuLSef5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5SevuPPEVbAbrFwpiGbOmoTZ+jUQaGXxOtjpB0/8ac=;
 b=ciI/KIMMp9y/iCxd64OFR4hWzY8KU10QfxFpDe2O4RISxO+wAzRexg+LFR+FN9tiOwkdTASn/N9SNlRSxj0Q4g59oFiONTIdCSA/f9oZqnM0VI/TTm8RqnY6v5WLtEm+4VZkUPDWNno2XkAZO8zgqnu6MXceEwZvZdYRBoLiuSqedbu9bOVSrN+bH1DtoxIT9xzAVwPA6tO3fcpMSdIwjjvtR5+3o3CQKA1rPZmKu+3rz5TFQN0bXkc+/sgBzzs+XWNcgLnMHnk+v41+7MpJmg9mpTUssbUUw7ngtXQ5Ip9U+IjHpNHA8W3qvSPC+bMUI56Ms8OB9ibRs4GYG+Jb8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 12:28:22 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 12:28:22 +0000
Date: Wed, 7 May 2025 15:28:18 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the
 simple-mfd-i2c.c driver
Message-ID: <z7knkmi7kjhwlqwokikozos7whwaj5vmseh7kjrdl2la3kmj5e@wwzlsxpq573v>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-6-ioana.ciornei@nxp.com>
 <20250502-savvy-eccentric-hog-b4fed5@kuoka>
 <smfuskvhdhrfrgbpjflgymoadms6vfiwgjmipsmkrxldtor6we@tyvafv626bwr>
 <8ec115f7-1a35-4506-a20a-b4de27f10960@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ec115f7-1a35-4506-a20a-b4de27f10960@kernel.org>
X-ClientProxiedBy: FR4P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::14) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 732b9c20-2e0a-49f0-cf09-08dd8d62a7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ky9Fosmfq+w4yS/nFGmT8vgRnxF4Y6aIfuepserTvyF4HjBJO/02Hs+hNPOy?=
 =?us-ascii?Q?Fez52xpQF2OLYdvxX3WkdKblfAYhj7Ap5ux2WocFem4Nt3GKfBmgKILBtEd5?=
 =?us-ascii?Q?WHEa6/DPPiF91Hno5WDr0wN64eothJwxMsd699nX6BgmC0oPRRc3/nC6FMEa?=
 =?us-ascii?Q?8Rspuj3Ldn+kJ9Wkb9sBamkxVp67hv+vrqurpS5wMrF7kjJHUiyKyTnK3ITY?=
 =?us-ascii?Q?optkzr+IawgpdWHqssKTRlmksKcwjOfToJC4z3PFxzL6E50EdhuGookrlVqH?=
 =?us-ascii?Q?q/KGJx6FuykLxcG5I9B4XVLRMy1Liz5Ul8zNFFz/IlVgbr5Xd54Y1WYqy0Hv?=
 =?us-ascii?Q?McufHirnV3xAhzaSebxEEjmzoKdiP+olriW9+nB6AEarZlPhSc28zBf0y1cQ?=
 =?us-ascii?Q?TKd7rWRS7wT50z0ouM+cC7nJQ12oW3HV/O1tD1hk8/c0ImUlSUPvpPKNSe5W?=
 =?us-ascii?Q?T+530amPuo/j+atP8QwR2kC+Eml2vJe9ntTYJYM03ehiNVe4mOXtw7PvTE6Z?=
 =?us-ascii?Q?TWzA91EfJNYUFMHjun33Wtlw95GY5m47i3sMluHCSrYqtuRUxbc6YyEplF5S?=
 =?us-ascii?Q?9jHyGsaHfnq6N3OgKWqxY1uFlJikD8Y4B/Kat0sFCbLS/4jXXnvh7CKjnfpS?=
 =?us-ascii?Q?27q2OuU56/M5IMrjrTOLCfyu/KYuSdMkUls2XVWEF4WyicdejgYoZt1NI6ja?=
 =?us-ascii?Q?PE0U8ei7sQZ1DEeczVjSefQ9H20kdjA2u50ZfAN4EdMKfDyVKCQwxs++FSg1?=
 =?us-ascii?Q?ZLm/xiRsoqnsaXBUrTe3mjtuCLmBRzvNvYZ11W2+eSEYwsW23Vcp2FECPWQA?=
 =?us-ascii?Q?UtnNtlIHX72DGLbElWzK/EEOH99DP998KdjPBYpUWF/a5WWRl6Ka4zgmyt2C?=
 =?us-ascii?Q?9kr+Ae31kf1PPWPMi8kSW/nri2/pW4+28p+ad+PbTU5HA79qtlZOGrTvkwIU?=
 =?us-ascii?Q?3hthtvuuvG1OZP7JIjfqQe0YOsGcjEKkdmOvP5aWyWsHSfJTg0uDmUG2eDU7?=
 =?us-ascii?Q?Q/ua3RaoIEXKZF0Cvhi/sAHxoOZ4CD1UClC2wYLZsQtUbYq0csVJaRsKgw4Q?=
 =?us-ascii?Q?vvyflX4YfeRtsWYY0wVvDzJmxs6tGvCQS+GLPPKaan1uDgHQU4mjXHnPfA2E?=
 =?us-ascii?Q?W07UgnttEvN4alT1qQ4HEXU/2FsFZkyiuqKnqrOjjMbLtWNp7XC6r9HnNytF?=
 =?us-ascii?Q?G1XHa6dB6B+Wfz8nvlbD1Lnag2cCX9iO2UpsAOjrXxYXZ9WaOtspdEU/j7MF?=
 =?us-ascii?Q?0tvifF+gbFzmcQgARy7RWxLqCT304ofl3qkT0UKrKW3RQb8DCqU7dHlbLkqR?=
 =?us-ascii?Q?gv7kvSBXsfSQSDaldxI62uKrCuhUuiPhsSTgCyi+g4+mLj5WsrDfJL42bFej?=
 =?us-ascii?Q?bITfjxgZP2xs7zQpmyUO9dTjFpXcq058DLGGPvBEnnKUwjH5aFdwbW8LmxYu?=
 =?us-ascii?Q?kCrvc67TTRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6fmZZukm16UJ5yK8gy0dFSkWGUVWN3Bl9qdKbjB9fU2IibLHZhXVc13+Un1x?=
 =?us-ascii?Q?vCCj5UcG7hIugf0fJvpxtoskjyKTVaTBjHhxqSkzI2uogsOz6HAOXStQPxbM?=
 =?us-ascii?Q?WMdk8bdoTKrrQ31fGFTMAOiS6s4Lu9q+k0kIZAMez6tWvOXRsuX+N4u/PqlT?=
 =?us-ascii?Q?5mz8FHd3DIT2E4Fi6m+V/Tgk7Du7EGmuqPZ72UVez4+4qqRz/tgwxderz3cm?=
 =?us-ascii?Q?EtXden3/ztCoYLM/RmkwkqQBgwBBJbA/uEcJNolkkUD/vcQufKu0lpRXXPJO?=
 =?us-ascii?Q?Gh0YmB+dqEnUep6synM1u9EmA7tAT10cDvWJztMN4B6sVJpYUP5M33IRngDe?=
 =?us-ascii?Q?5XmOQXu9gibOxGmm/+EGlxON0qQk8xy1WvqNKoxROAzKSJ4O0EdgZgrocOz9?=
 =?us-ascii?Q?ajLpSr5nCfRyRlspJ7YbPeZMASF7aTLu/pOk6fZeUT/t2xPZfe3Bg/ZpeLMC?=
 =?us-ascii?Q?LjjMD89XmWKP8j7bvH5eTkv4xfv/SIQrHBzkP7dFIvZ9q0eNSTe/OohWCu2F?=
 =?us-ascii?Q?10oFNzFioHH5m6E8+n5T2p8d/XQNMkCBzo17wq+iOisoFNoJNhqPbroahvBr?=
 =?us-ascii?Q?T7T1cM74aNNQ6YFSC4Q0aKCvYfZtnyEU2uVWzg5Pzq/ddeQ6H/hKOo1O1QL4?=
 =?us-ascii?Q?q9gzoFLNNK/FvFs8F1+iDWrlMnK1uJxtyQmYH7nTMVYUtFzr2vLy1gY+TmJB?=
 =?us-ascii?Q?YqqVId9RrchWL0MsWw/mtKhdJ5PYAKYcuytMdYY93UmXnpqqu9xYEV+FaFvd?=
 =?us-ascii?Q?jGLSoNf0Spp+QZnKqgOlOFiLkwGi2LrNdFroilCeQf9MBstmkDcMWCyaWHAY?=
 =?us-ascii?Q?sgczXu4yYVlsJTx1VsGLM+1EtB+0DzyFy2y/xs3awbTXk9TKnNDT/WWC+jgu?=
 =?us-ascii?Q?io9yNhyf0z3LPZMSx3+5EOiSG0LAqP/XgXb0ucCY1ZhRVTf35eNfKJSCHKx0?=
 =?us-ascii?Q?VRY2TxMbyV1p619RxJmTCqW8JFjaND2pqPpZVYjVCFVgJXtFXfXF21SDny7Z?=
 =?us-ascii?Q?wyKUyP6q+QJfYgvHzQX6YDJPBJ0nsgnsKIKuKALr6rrIJGe21wYZgQ2jmFFs?=
 =?us-ascii?Q?/dKA2YBqg8d3S5gRWNGQXvrPZ2AEuEPUc/NtAel8w2zAtqbJPykQdSnabmNO?=
 =?us-ascii?Q?1ViScwLuKg6M0MtZaQKh+N29Xnx94XAwlDg7IN/aE+aTisL/kHX3j5v0X/IG?=
 =?us-ascii?Q?upfYQKYjvRBnDSszREtfLInMTwS9VNoMsXNJ2gNNItihQA/vNwO0mD7FNekm?=
 =?us-ascii?Q?1glSLRHTtaLQ30f6AXMX5ipfuYZv9yW6uZG83swT3Uq1YtZmioS5UXU8LKJe?=
 =?us-ascii?Q?RhxEHpvHPu7zUDDjLwQS+EIirga9WrCtQ5tp5JwAmhu+2sFtVR5lHik51A+W?=
 =?us-ascii?Q?flPN2gz2Q+x+/CD/GqmMiMWuOCgVMk3x5Ryy3EE70TE+9AXZmy04ehHb4j8e?=
 =?us-ascii?Q?nwBD99Pa+4myIecLRgSSZCYOpVtUVDNJ19qw9ikacMxJAErKQJUU6rhG70lo?=
 =?us-ascii?Q?wEcgGwxcRFlQajSLRnojhgiFzsFk6+CIU31U0gGr8HrRFWUmJGgw188QCIxA?=
 =?us-ascii?Q?8F5XgR5ttZulw2JXzE8ESi97AILsYayiiGYA69bI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732b9c20-2e0a-49f0-cf09-08dd8d62a7e7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 12:28:22.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9dIvehB+sOK7y/JPl099XrJiwjdkcpKgMB+rQtZbsEKmwmRsFSXS8KyFiSmBYEGYpyhhKeA93DPgCRvk4OkpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

On Wed, May 07, 2025 at 06:54:38AM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2025 16:21, Ioana Ciornei wrote:
> > On Fri, May 02, 2025 at 09:04:03AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, Apr 30, 2025 at 06:36:33PM GMT, Ioana Ciornei wrote:
> >>> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> >>>
> >>> The MDIO mux on the LS1028A-QDS never worked in mainline. The device
> >>> tree was submitted as-is, and there is a downstream driver for the QIXIS
> >>> FPGA:
> >>>
> >>> https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> >>>
> >>> That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
> >>> and the hardware works with the simple-mfd-i2c driver, so there isn't
> >>> any reason to upstream the other one.
> >>>
> >>> Adapt the compatible string and child node format of the FPGA node, so
> >>> that the simple-mfd-i2c driver accepts it.
> >>
> >> Why do you break the users based on some driver differences? Fix the
> >> drivers, not the DTS.
> >>
> >>>
> >>> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> >>> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> >>> ---
> >>>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
> >>>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> >>> index 0bb2f28a0441..58b54d521d75 100644
> >>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> >>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> >>> @@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
> >>>  	};
> >>>  
> >>>  	fpga@66 {
> >>> -		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
> >>> -			     "simple-mfd";
> >>> +		compatible = "fsl,ls1028a-qds-qixis-i2c";
> >>
> >> This breaks all the existing users. NAK.
> > 
> > Using a mainline kernel, this DT node was never used or probed by a
> > driver since that driver was never submitted. I am not breaking any user
> > of the mainline kernel.
> 1. Users of DTS is plural, so what about all other projects and out of
> tree users?
> 2. Did you remove simple-mfd from kernel or what? How can you claim
> there is no driver for simple-mfd?

No, I did not remove simple-mfd from the kernel.

What I am saying is that using a clean linux-next tag the child devices
of this node are not probed.

For example, the LS1028AQDS's DT looks like this in linux-next:

        fpga@66 {
                compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
                             "simple-mfd";
                reg = <0x66>;

                mux: mux-controller {
                        compatible = "reg-mux";
                        #mux-control-cells = <1>;
                        mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
                };
        };

        (...)

        mdio-mux {
                compatible = "mdio-mux-multiplexer";
                mux-controls = <&mux 0>;
                mdio-parent-bus = <&enetc_mdio_pf3>;
                #address-cells = <1>;
                #size-cells = <0>;

                /* on-board RGMII PHY */
                mdio@0 {
                        #address-cells = <1>;
                        #size-cells = <0>;
                        reg = <0>;

                        qds_phy1: ethernet-phy@5 {
                                /* Atheros 8035 */
                                reg = <5>;
                        };
                };

                (...)
        };

        &enetc_port1 {
                phy-handle = <&qds_phy1>;
                phy-mode = "rgmii-id";
                status = "okay";
        };

If, as you say, this works just by having the simple-mfd, I should have
been able to see the enetc_port1 functional and the RGMII PHY be
accesible on the MDIO bus which is behind the reg-mux. But this is not
happening.

Instead, I get this:

	[   17.635216] platform mdio-mux: deferred probe pending: mdio-mux-multiplexer: Failed to get mux

	root@localhost:~# ip link set dev eno1 up
	[ 1155.190391] net eno1: could not attach to PHY
	root@localhost:~# uname -a
	Linux localhost 6.15.0-rc5-next-20250507 #112 SMP PREEMPT Wed May  7 15:21:14 EEST 2025 aarch64 aarch64 aarch64 GNU/Linux

From what I understand, even though the fpga@66 has the simple-mfd
compatible, no entity initializes an I2C regmap (since this is an I2C
device) for it so that it can be used by any child device.

Please let me know what I am missing.

Ioana

