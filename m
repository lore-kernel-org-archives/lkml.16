Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012008.outbound.protection.outlook.com [52.101.71.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16819F11F;
	Sun, 29 Jun 2025 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751212566; cv=fail; b=jgAUnpB3rkuMjiddr/QAH3kjiy+WNEsC4wod6Ll66EHvO99i5yR5MFxaoJ5x7Qx2j7bpx5SRZ3HrE1pYlH85X+Y/VcftTonc6U9wGrRy9Y9GkER889927LOj6kABbhS/ZvNetvvqDJMJ7w048YRip7LJUPBEWcyNHEEHLCcbq8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751212566; c=relaxed/simple;
	bh=jfjZhrYarmp83OxPF0MtUiZkGTf1t25vlhEruY/NU+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KuEC6BVFKjlsq3P8OJ/yRJRS0SeSzF9Ww0x8BgbN3cDycPNLnaVT83QDxFtJfBZZSxrpuEAT4HKVAYgvDD8viujyexbWap5iXOmiYSbfafg6QkhRtF2Qn2rQ3obtxf2PQWWOwJHMAd+WN27Awzug3ZJLGmIjN5t4Q1gK2KO14yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ScftgrxD; arc=fail smtp.client-ip=52.101.71.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ScftgrxD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdxDEI6eJ+nFlpHCAFRGVFLwogv0UhoEr3Q1/mSBY9+d1ZAZ/C9B315J4l8Dno3nrxMVeyh+u3gc1Wi90v6c1xOwY3MCMAiz/KywwflNtd3K2DjORmU+wBcVl2GLg8agsmoY6/ly3iFX2nozXrn4NFCgX/wvuWOqHC5w3yuplUt1J0c944CCePEz8mDINxPmmBMrub+qx+nB/6HweoRC3Z47lcUznCfhlspQezACi6yJHT/OC5T6kppXyBMCQXZE2tTAMpfzwy54Q0LinikinQwX/FIp1yGx6V73oRIgoHdb2Ro6bw4ljMGBl4zjhaboaQ4/LB00b3FsVqfJuFcdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcku7PDS42cwU3Ir0thHEqd1507B2Em/0IB5xPwHQPY=;
 b=DJPwusApgBfbDpfylRE2m7Kn9w/ckbdaJ11+gbYVShs/JlvgrUwYiWjvJdX20sgL7f0m1ohcjnqLMpqkdtCNgR7EnFIzhjr1uJlTn0uI7TFZZxhm3xPcGNsjv/3MvOSE0X2DWUUVeKmYdsmk+EIOFgKmhvuBkt9R3d4T/OoUheH7NPKhhHSe2av1Kw6FtxY412fw7/uleJ4moK249E5VeQNhy1rXKSG5CxAmcRfqWn/O+ax8pyVIZaTVke8ITOGdAjfE80jZxhVndfd9ed0WdWVhwOPO+TIkQjGC6C87RPTlwfu03HoduUynZn6fpOzfNxd/SAZpafC0ZObS+Iav+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcku7PDS42cwU3Ir0thHEqd1507B2Em/0IB5xPwHQPY=;
 b=ScftgrxD95Fs3GGUJJp9IANBQSmCI7Ri9hqKTfpCOo8B4TdR6v2aBEq91yWZ4UgyIVLtb33TvleMqz5bqENdE38zHavS1KQEdBWUKJq73LYey1ACl4tntXQUTCswPZxlu2hwwZ70AftwxYU48ZkkG06ScGCVmV1lh/h6JB0hKIVjAUPWkD1kYH81WYYmEXFBdMpuZ3iaJ0ykEWq/FBZNKxirGDvZWzTeV3q/j29ZqkP7tnpxg5H2mQ5HVeB+ORiJxxjxKGD6Ms9hhE4FYyW1yPYCDhxIiA4GS1jeAu2C7uBFckI31oLIcPiMxwKZQm2/HpPhFRZvNz/PYFzJQuY4Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Sun, 29 Jun
 2025 15:56:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Sun, 29 Jun 2025
 15:56:00 +0000
Date: Sun, 29 Jun 2025 11:55:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: usb: convert lpc32xx-udc.txt to yaml
 format
Message-ID: <aGFiCsXWaubBBk7I@lizhi-Precision-Tower-5810>
References: <20250625214357.2620682-1-Frank.Li@nxp.com>
 <a15cbc55-f0ba-4c15-af27-44b05285bc16@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a15cbc55-f0ba-4c15-af27-44b05285bc16@mleia.com>
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 8548c83e-952c-447c-ef85-08ddb725714b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VRG71fM5/BNvkxd4N1H3DWuhR+NV1GJRP+zQy3Ai8IJGa3txg2IA+y7qkR0V?=
 =?us-ascii?Q?qEQ2nd2MzkRaiH3kNUw7Z3WqgleRsLVxCb1fHXpbuPJ9hf4KXyTLF4mTDpXX?=
 =?us-ascii?Q?VTrWNRn21haTz2FCtOiw/YCULnXZ+qsGTrp0Hp7MDaIaxLOJYh89H1AWtVS6?=
 =?us-ascii?Q?ybui/i8lKyuIGJLY+S0dNXTPVjwd92a8cXpuE6nU46cOOMy7T0TksL23Joj0?=
 =?us-ascii?Q?Os7rKjkbHxMwOvth0wNfhlNe848ukYHUu/mtjxtHQa+RDAEXojGKLY8u81ID?=
 =?us-ascii?Q?gqeIrcIJZkLXezO4dDw1FaBdCkVwJy+H12DaGFI6nSHiTuG+Ngw4KQpDlWQn?=
 =?us-ascii?Q?6oOWaFcUkW9idOGFsLRXp8LAP3aIrjiukDMMwE/GC3K+LNBhF69ZxjfxYMJD?=
 =?us-ascii?Q?mmFzHe9aGh058gBkBNVtOcRAqR/bhs5fHi+z94EOED4zxSs6BVqpVM6/5l+S?=
 =?us-ascii?Q?S7Oeo6RRwuFHqHreKha5NhyJwSvgn1CiB4bb9i3d0lbfyecVd/WOGOARsZ85?=
 =?us-ascii?Q?yL7Nj1CdlZ1R8pi/RlCcVRPKNf/05p4C7XmV3pNUPP/R25+Xnp1RZkFULPce?=
 =?us-ascii?Q?nWaIDtk+Ty2XF+J+B8/bKeFegmWoeQt5QhgPXfDWhUHi3pDI0wk+LXQm6fzh?=
 =?us-ascii?Q?BGoP8TIaWdNWIA17d0UBwQWKcSgu5qWulyLbK85bn+JqnSPt1Q1h/KEaYikV?=
 =?us-ascii?Q?RcsXJHZYHm9k/H1ikZfGOhjrY32N9A/QdN06LNFeiKxshHqjex552hN5oMb4?=
 =?us-ascii?Q?WMXqIOgbj5+xaPLrJW4cVkWPgDc/WcyI1Z7ujW97Ap/FhJR9SWsLmH82g1tC?=
 =?us-ascii?Q?erbYWrOJKvZhGyS2T/hbS5ADvjSjoF3bqNIha/ibmj1Y3CozOTdYafU4UalD?=
 =?us-ascii?Q?PR4Ms0rrH4j7Irt5MXxOkz2IUn8s6ghA4/R3r1REAg52a5XJzU2xXc5VCLa+?=
 =?us-ascii?Q?DgZ1hT+yFoV8Hc3nevM9twu0sCN4plcrerfEUPK0GMKpCKcge9bbmy2dxfi5?=
 =?us-ascii?Q?WnvQz2JdK3i8am8bjKkGEdbgRD0qz2yfae2rsK9WYDKad5ZTAcwKpoxBqdVC?=
 =?us-ascii?Q?lCJkTtVn96ObPJHfR3WxV6WN6zyQm6oqzT8wccx93/lq5v+65VHdRuCFwcZA?=
 =?us-ascii?Q?fzo2r7Mr8Obwos5uzUyovBGk2Ojr+5+PJ8TpZhFDwdB9L91RBc2oRk9DHa2F?=
 =?us-ascii?Q?Xe7Er+EvOS8d5P61iCPpqjSa2qR2L3kgJJYgzsyuXJXF7tWQ5aBS0HlcAMw5?=
 =?us-ascii?Q?KTWZMEpnvmxvioU0lRYEwJRmFDuX+StQw1xrVIru+SqNujTd/7OX5ow8GDah?=
 =?us-ascii?Q?WgfDE5e4RsJNE3F8Pd0M7pqo9orQ3op9zyAUXaTDgw0SH1Ox9C1E18B5E8cU?=
 =?us-ascii?Q?vYSkjub+qhyhXLbl/kgcapitxsVygW2FKPWkHK2Ckia0LxYZpKBqWyAZilMQ?=
 =?us-ascii?Q?+etfG+5ClrBaLP3BNJXbyulNSnGREx1yz1cPW2A9W5kkqS/RlrLS4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rprq70DRNMZXjKEZKBOi6u0+HtyQMNoqmOCehGspRFl+sB7vd+K2PkTY5evE?=
 =?us-ascii?Q?G1SQtYnANihKS5vem8c2S97ICvCHccKU7EGJ+3KDu6VpAAGzW1dXQ5uUZTYI?=
 =?us-ascii?Q?8nht+nbEwtdYkN3gX2gmPkik9veP4Alq1NC7UDrVeX7E/uRnwbFs04gSpVhq?=
 =?us-ascii?Q?V3wve9158dcdR4fon1ux9pGuYxIPVSuQpkr8M/C1PnfFXguQxtxOZmHSmJDy?=
 =?us-ascii?Q?9aeMZbddQZOIh6xcYLm4tLKXo4x7ZBZd3a83Yof5xg31uZf852cXJah5rqJJ?=
 =?us-ascii?Q?coTFbnfpXXFW4XMAU2cE9M8x8B+5CSNm0u43Qxmgx9Q2pKJmGVaQiuTyj6P+?=
 =?us-ascii?Q?HHylRBMrZfpqlz9XGEFHgcWq/bxs4+Hu5bjiB0V1V+YPWFXDGlyXzWMsuLda?=
 =?us-ascii?Q?t700U6wWjk71MPnLT2yYgshZOBgpKUbf/jpTvGeYIX7+pl/X1fV9PZRsW4Nx?=
 =?us-ascii?Q?w2qr9Nb+diuO39d6i+NJmjKkT1XXa+57UWMqK3jhQrDWdwJPH20A6WefvTTO?=
 =?us-ascii?Q?2eipaCervSGU2NBrCWKenXqMMfi87e1WxRtdtzO3AZPQV8BwCHsb5qR1eRIY?=
 =?us-ascii?Q?hs3emYNNZvl1/btkvnO7+t5aNkR5el7tIwDSWPGqtw5I07QvPGT2bl9LRTLR?=
 =?us-ascii?Q?d3DifIDQoVuwp6U/wP3BIT+jaFsGLzbh/Y4ZNUbEJZ+Fxb9aUxahZkZw5qwJ?=
 =?us-ascii?Q?IGFrAW/vfwvoVKJe+Hor+EbPFclOf0C7Yju2tVp0FMnir1kpvDyYrk77sLuJ?=
 =?us-ascii?Q?Is0CNciRlGEnYzyjynrfegAt1B5nbu/JYCUwyUexPCrV8SYyNOg0hbz2xFHm?=
 =?us-ascii?Q?urYcEj5yAJ+AoRl5qDOtEa7Oy8VzQHLVadKXTLLPR/5bHPP/jmsMZrogyElO?=
 =?us-ascii?Q?IqwDAtwVxL3GnHxKkhZTzjoBIpA8ZRbvbWaJcrNINya7Edgdqi3rU7YqylE4?=
 =?us-ascii?Q?CrJo6+/RnAu35J349SheEnEMfRDb7BFKErvU30CY08Be/OQbn+dzNsk/EKHu?=
 =?us-ascii?Q?9aMCZ04gkVH0v+76IBMM669+tL1yUGSGSYpvA7RYxb8M3zkSAFesgPY6g9sz?=
 =?us-ascii?Q?/e+U0RZmGQAZr5FfbWQOOY1eguR08NsbVnmBduwjKG4vCS9K23J8xomOwy3b?=
 =?us-ascii?Q?tCb8GTxH2Dovv+Df2+y/9SFI60mwlABLrNr/UU90+XDPj2lHJadyBb89LnAP?=
 =?us-ascii?Q?bXrrSVAKxJvA6dz12c0YN5Ct7Om6kHxJLo08fyf8qTw6B+p8QHKk9gyvGqNz?=
 =?us-ascii?Q?3w1dalFszqoCWyuMznbXnHmGKJNcVDKc1dWEEoaiwVGEiboi2LbBUJwOAugf?=
 =?us-ascii?Q?IBO2fBAvYXvaT7iwS0u0i1ejzdFv1qo2avQoH5NsAa0n+iNcGtsU+98ke2GY?=
 =?us-ascii?Q?iaMER9UrqAPpNo2XJrfEXD/E2aaTWZaO8w1Y5OTM6F4aR3a0GPMRmWaPA6db?=
 =?us-ascii?Q?RSo/hJbr1XHiacwairTS3kOc3dMejxBUAniymIHATItxncg7rJQIZN5vRYXf?=
 =?us-ascii?Q?nrYQIZHgvw7h8DzoU06o+MCFH+CkqvdWV3GB96jzsEpY/Lv9eIhI0TFBSELa?=
 =?us-ascii?Q?1zlaECIJ9wJ7VZGO0iMMlSWZ5wE2smyBBwEEoZqu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8548c83e-952c-447c-ef85-08ddb725714b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2025 15:56:00.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+RCwSz3JQiGYrCbF5sV9yXb/e9/gEn9gZXz7X7zHcrlmrQ0XswcjX6XMfr/lzi5tJBSQCuy5LHHHW3DDZ3lzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On Sat, Jun 28, 2025 at 03:57:44AM +0300, Vladimir Zapolskiy wrote:
> Hi Frank.
>
> On 6/26/25 00:43, Frank Li wrote:
> > Convert lpc32xx-udc.txt to yaml format.
> >
> > Additional changes:
> > - add clocks and put it into required list to match existed lp32xx.dtsi.
> > - remove usb-transceiver@2c at examples.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Thank you a lot for doing this massive conversion work of NXP LPC
> device tree bindings, I would appreciate, if you put me to CC for
> all such changes.
>
> While you do one-to-one conversion, you do bring a lot of errors,
> because the .txt descriptions are broken.
>
> Please always reference to arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> and arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi, that's the correct
> version of NXP LPC DT bindings, otherwise something important
> can be missed by occasion.

Okay, I dependent on CHECK_DTBS but omit the factor the node with status
="disabled" will skip check.

Frank

>
> <snip>
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/lpc32xx-clock.h>
> > +
> > +    usbd@31020000 {
> > +        compatible = "nxp,lpc3220-udc";
> > +        reg = <0x31020000 0x300>;
> > +        interrupt-parent = <&mic>;
>
> interrupt-parent = <sic1>;
>
> > +        interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
>
> Should subscribe 32 and correct the type:
>
> interrupts = <29 4>, <30 4>, <28 4>, <26 8>;
>
> > +        clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
> > +        transceiver = <&isp1301>;
> > +    };
>
> --
> Best wishes,
> Vladimir
