Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251CA231A55;
	Tue,  3 Jun 2025 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962769; cv=fail; b=n5FaF5qe9z7E+MPRYxsjCR+0Nm6HqKwAFXTUJic/22A7m7E9yAcma2qHHQ7VFGcJxB8Fcis+Kj+fXUHp8SRqP07f6AHGfGu4TPCqe/EPR3mW7ZWg/aK4BO9VAzb3Hx6rL3h3g09Ip/R7eozfV/XdufLrXceA/RHN7EcRFNb6mPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962769; c=relaxed/simple;
	bh=4W5oAhzOHI1RMfpXSjN9mcCJ39mF20Enf1EEU/NUczU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WpEWCvTqko/OXyak2d2z1P2q2R4Mdn8fzIJx8jYjjz4NLwDh7taIyG7eWuVY+MFbeGKCAG8WcG14xDitR9okTgHnOpW80Qr6qPZ4xlhsodQ3hFpurMnmH+f1ivA+SWN67rOFhrkgMm4qn/GGfXzKamnp5biCse+2s3dbUrM6pww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=naSpZpPp; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="naSpZpPp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWF9ytieQQhrL0dlANE0UWAX0F5gL6x/zGUdeHqhnkYP+CXP4DIJjaBJFDR8Peq4Fh8eDbVqElZ9OFiPc4Z5hoDCX2hq81H5E2jMRK3oe6u1GbFFq+KqPmgCCOLqTAq0ROrjdBOqeXOkcrNtaQTd8J0+jWgxoX6s91HgFWa2uSP9HOat4O8cALgSDPGA2F90kJQMvdgh08hInhsLlD3Ez8Iy5bwoz3pEm07tjYS6iJAzdaws7tmg7oCSVozmKxyNAEUbtJ20RHHEAmYhf3UaV5R6Ayk43GQY/BHoiEKAN4y0CIEXZF5ycTW/j2t3x2gifKmGJmDa0ESSnPY9VW1aUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipGZ4icafR69h4+TEVJ7FyDt4dNtiqgVjhECasxU9aA=;
 b=x1XvPh5+55LbaJ8MAudyQi6/Elf9yPzMxRZ6fw2Pve+q1IQ4MLSEgItbjEysmxFOKp338YRT11ZKyD+6kWb0JMFMbSiRbeVsM06AuLoPWOTVLYzIyGYIy0edlFi78jUSVguy0wO1tU/i5VLEbtuhBhxVe1QegCREEBp5bKeyqEe0MEC34WuovM2RloeVRWgocH1CeeZSaVrI/29+EeFpb+tAMVgB2Y1Ks+PJVe90Vh0C45yJe5VcKraYMnys/DBxpSSipC3YEisrMbA31gXUa/4u3pKkONa9tgrdyH/yGZOsMReT67EFBk2lEVZAwZ1yfCDXPaNxNEz+qCpbZwXL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipGZ4icafR69h4+TEVJ7FyDt4dNtiqgVjhECasxU9aA=;
 b=naSpZpPprES4yNCn2ID8wT9ZFlVwG6fFPR9/VeEZjk3p14JkDFqE+9L7AUJrSK50xzWzg+Wk83V3QK9YNZlxM2JlR0lnoFADtzUxQgmrCC2AA1s+A37l9T3SJucucKK6vY3oWfSuoGIEqpuQQch9XhfGxDRDc66+Tgoax9HoVa7en08zGC9C2szDmRfC/sMySKZMsIwIiV85b53Ga2wPiyrSoZKX1GDOSevk36oSqScT0sjT2AYBaY5NnoD/spiVW2aGMSnM9C/64/EdWKobne4Cxaha3YlrW+m+ByR89+XLZLbuKV3MXvqaOMQhAftrLOBSbzcy+CuWfXLWB033yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB7194.eurprd04.prod.outlook.com (2603:10a6:10:127::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Tue, 3 Jun
 2025 14:59:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 14:59:23 +0000
Date: Tue, 3 Jun 2025 10:59:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bjorn.andersson@oss.qualcomm.com" <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add layerscape dwc3 support
Message-ID: <aD8NxfmJjSMeQKOu@lizhi-Precision-Tower-5810>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
 <20250602-ls_dma_coherence-v1-2-c67484d6ab64@nxp.com>
 <20250603012259.gyat6ungxyufhhbe@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603012259.gyat6ungxyufhhbe@synopsys.com>
X-ClientProxiedBy: PH7P221CA0049.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f93af23-3b19-488e-de86-08dda2af3a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mj2LiIrQBh0MYOqM/vFMqoQrprvt1ansIjGKNY0x+Nqb5X64235K5XF2pVpE?=
 =?us-ascii?Q?gzijXjmBUlE/WFXTdcFaQuWDcKCYn8dGGDuK5WXZyA/OQ0UWeDnhz7VFdfwj?=
 =?us-ascii?Q?BZh2PD0/rd5Q4hE889JEf7BTKos3uNjQVLUlIHMdhibYsbh6UThlSX/CUaQQ?=
 =?us-ascii?Q?ktaW6ulEYL7NywztKrzv/wv0UtOcVTtenwMPLtpfv7M/UvO+p0uuDkZenbE0?=
 =?us-ascii?Q?vvKthiPvawKXjC3zGEtLZa5KCslvfvRN4r8JJjxXKbYPhC6rgiEzqKYo/aZ2?=
 =?us-ascii?Q?F1uxX4B2f4+7k1s5jlGZPIzxsZAvFqb8VWNqoiWtUFVZfW9P4o3aLKmW4BY/?=
 =?us-ascii?Q?7z1pTWJJKPEOg6xRxS0IvXejtvQUFQto7D31HEKk5c9CMLSW7SaubXIMX4eE?=
 =?us-ascii?Q?UVVLSeyc1bvmk8fE7WB0VzTkhoWs8De2e0JvCe12ejirFSLWH+YJOveI6O7R?=
 =?us-ascii?Q?clYWBhpY3QQHubfsYo238D88Ox2f2RxOqgFRXSVRvc+YHCA2ZViIBrw09GDU?=
 =?us-ascii?Q?zKHyKt7zPMgtmudyPZNC5fIDg+Eyx4MXflKkY1AZiKqq3icsxeMzsf3xjInh?=
 =?us-ascii?Q?qqTlCR0bqZ1Aec7aYANXwRgKrgKKTXs670gkUQ6stCo50mJ9ji0Wkp2BlGiE?=
 =?us-ascii?Q?nEOJq6EPiBoYmhVVJaemsOx5bXdDN8mij+OLOXAezvUK8cnnpphVb1erkTWF?=
 =?us-ascii?Q?z8jUui1NnYd2YosMJVhk/Zh4QoyEtBvLglzAeRbdlZl/wPCkGNTQ+rzBKFtt?=
 =?us-ascii?Q?q1PaTEIriVSZXqT7MKqk57hynYDv/0Fz5eYcFUIObPf3h24J+9SfPh7y3v8Y?=
 =?us-ascii?Q?rAtDG8U8jIkw+3lBDyEcRXQRTDjnGa/TUHdAR1wZDbrNBd7Jsj+H38R5RYUi?=
 =?us-ascii?Q?jq7rtBThJlC3R8O3yB71Fq0snCig/6AptHxPIpq53f6baWgW3k2ncU5AVNkS?=
 =?us-ascii?Q?sxk/Bhsd21Unwuqb8jfxZPpGynxD6sYTM/6OGq1mqqeq9pz9lx31ibU/rP4O?=
 =?us-ascii?Q?0F+oCyH9ybRxJHTs+cKQdLe3BLfJSXCy5LPm1wv5oyUYlMTKVOZxN75M1rjC?=
 =?us-ascii?Q?1QZtmp2Xpux5szxaZiwJl2m876BJgqD/xeLQxpH7D7lYUhuS1lkQA2muRQ1G?=
 =?us-ascii?Q?quTCnbYwoNf4KwHBM+aQiJeP75Ts1FzEJCBlk5pstqrnb+SMoYMrd9YrRozy?=
 =?us-ascii?Q?lEzFpQO9o5AXGgxhuoxK25yxUEvM+EHCqv4brCqKk4Z3AF52/HE6Ri7qUL1O?=
 =?us-ascii?Q?mGzDslKl5ehwQWL9CRUE5kURiygXuhoEcubTFql0EChl30Fmjrf193LHyA3N?=
 =?us-ascii?Q?9dRWZpedzYc5nUf6zGgd7S9Y213v6NI+QEbYdJ1tnToWGbaEAN8UVwDAV0xa?=
 =?us-ascii?Q?WHxzHnROyO5DRMmAXWf7XCnQgIgbTPjHKkGi+Cpo72KlRme5unX6cny3DaQM?=
 =?us-ascii?Q?ApV534zP4Y8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DyJsy0wWBAkTkrjVFLiuiIUr+KMs6yo0a9d7oj4V9hzKyt8F2/oMoXHQo2/i?=
 =?us-ascii?Q?/LBEKqkWwiBULD2Oec8NHuOT0oNrt/mIKkyDRerO0A0RMXTL2incnQ+ccUcq?=
 =?us-ascii?Q?Oi8NmYiIAaosp3mPihuZSfMp7cVVhKbRsC574lcNVugwaatsmVPwsEBihMj2?=
 =?us-ascii?Q?Ey4tlyXGmJ9/32RA2ExXI8ZXqctGc3VyiSVvNWjE/rT9G94irlz0lzSR77NA?=
 =?us-ascii?Q?NR/+fo+17/cU27ZqlSwSESlzwOJXLoRibxN4Wqb1mh93eLJxOr1S6VudkyB6?=
 =?us-ascii?Q?ODYYLh5GKUH5gYDldrFS3K9AhwjwXe5hrK8zBNPYsaVXkdF/795+Y4BPXL/N?=
 =?us-ascii?Q?QXZmTpA+ir3sjfLXqDa2bjXPB3mU4o87pDSWcyHkmuGrcfNZKVt2DzI9GxpL?=
 =?us-ascii?Q?62HyUvClefpOB9CfbvmRs8PNMsFHw90rxmocWQWKaxn8X1Edb4MqlZsPbI/F?=
 =?us-ascii?Q?5Gf2K9N90yUzgu2MmRosZ9VBsQ2NOBxwtcdb6gqrtjqESiwbjoVLzmJxgeD0?=
 =?us-ascii?Q?YjFrm8TPZqpOjr7Of5KM2koSYpAWqkcuN7q0KU+76whOx35EALyKS598K5Nd?=
 =?us-ascii?Q?RJdRvutsAK8i4pQ7UTjQ+cTFMS9kzpg48JA4OLPnICqCU95S+CWiqVKiqO0K?=
 =?us-ascii?Q?sItFHnJ4NlhciJYj+sLbB5c6KDN6Hf/eqaAE01WVaQdqULw8oicnZqxdLziK?=
 =?us-ascii?Q?boN+G/U+TVkLqDTshgaaBzWAP0EYyhQYkQbKnUgYSI1d/wKNP4trMwlZ+ZeY?=
 =?us-ascii?Q?VZtROqwv3Vfsy4c1a/T8IBeuuIFioodi12KUMfijl2I3qrQCwNADcMKY/N8T?=
 =?us-ascii?Q?t1EPSM9BgQFDAhT3ArXHTHoifLIOmm5XU491CYdmtY2uIT8VjNK2tROzOwaC?=
 =?us-ascii?Q?mzSZx6ELH6K1jcoYe2vhMv5Kn2iLBOPLXQbIWgVGw+ybgJYI/BD3wQE59Djy?=
 =?us-ascii?Q?keWzbB3f90fTrScgyZFKA0Yvoat4Ktf+VPT92OykV7KzL7LRG3ydkJG2Daws?=
 =?us-ascii?Q?PklI6UUg44n/6c8BTVewv6TyGJ0AArbm1PRCS7saKCEzLXX6izVoO3lb04rX?=
 =?us-ascii?Q?RgFJ5fs7eFC/tLe8TDwbdJTwkbN5RL43C+0caas6faZ8g1SNpNx1XCMp+XP+?=
 =?us-ascii?Q?bLBgjdiSeBH+g6xrSltg1oRfENKKyanNbwXyWm9VnFiVSge32/PUna0xIwxT?=
 =?us-ascii?Q?DFkb763EiJDFWwXuJ/pqCJOmFVIbUiQPi4NXQ3djYwXByTuUoO4Y5O2F6W5i?=
 =?us-ascii?Q?43Qgp+h62PC/VfbDPAwhDnGc0QpdzRSTkpQPe1FaHdTDazpLkTUpDfzXjhfw?=
 =?us-ascii?Q?FwZooAD01Q9l3VUxtbyE9FVvWifsCZMWvRHj8aadB15jU6BSsfEpqDdQDm0K?=
 =?us-ascii?Q?06S0hSSdAkgbHEjpV/wedOBJytwLa/QUH/V0PQBaOEPsQSUTMOCWrRRKw2KO?=
 =?us-ascii?Q?FOKPfwoUIl8PnBxGoVaQ4EFjn0FHkf3ubN+sQnrMC9LRX2jg5I6zuuqncSxt?=
 =?us-ascii?Q?EcPbc4OsmlLFAEODsp4GIiHxjuugEk/CbOsD6klo28Cq+ACFrNttnUCsRtpW?=
 =?us-ascii?Q?0hRT5G6HqFZbkwIh6wqSzCJgc1m5ZJMKZYJ+llZJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f93af23-3b19-488e-de86-08dda2af3a47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:59:23.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spLnKiKMhqxDGIlxos4Pb1AyOerwamf0LBpCkCL1HZkTZ3s0YaymkNDZXvv8RYPtWUoOJtSokSwObsfl8DSL7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7194

On Tue, Jun 03, 2025 at 01:23:03AM +0000, Thinh Nguyen wrote:
> Hi,
>
> On Mon, Jun 02, 2025, Frank Li wrote:
> > Add layerscape dwc3 support by using flatten dwc3 core library. Layerscape
> > dwc3 need set software managed property snps,gsbuscfg0-reqinfo as 0x2222
> > when dma-coherence set.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/usb/dwc3/Kconfig           | 10 +++++
> >  drivers/usb/dwc3/Makefile          |  1 +
> >  drivers/usb/dwc3/dwc3-layerscape.c | 88 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 99 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 310d182e10b50..13a86cf03b94b 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -150,6 +150,16 @@ config USB_DWC3_IMX8MP
> >  	  functionality.
> >  	  Say 'Y' or 'M' if you have one such device.
> >
> > +config USB_DWC3_LAYERSCAPE
> > +	tristate "NXP Layerscape Platform"
> > +	depends on OF && COMMON_CLK
> > +	depends on ARCH_LAYERSCAPE || COMPILE_TEST
> > +	default USB_DWC3
> > +	help
> > +	  NXP LAYERSCAPE SoC use DesignWare Core IP for USB2/3
> > +	  functionality.
> > +	  Say 'Y' or 'M' if you have one such device.
> > +
> >  config USB_DWC3_XILINX
> >  	tristate "Xilinx Platforms"
> >  	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 830e6c9e5fe07..cd635b77902fb 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -54,6 +54,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
> >  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
> >  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
> >  obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> > +obj-$(CONFIG_USB_DWC3_LAYERSCAPE)	+= dwc3-layerscape.o
> >  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> > diff --git a/drivers/usb/dwc3/dwc3-layerscape.c b/drivers/usb/dwc3/dwc3-layerscape.c
> > new file mode 100644
> > index 0000000000000..d093f178e1e35
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-layerscape.c
> > @@ -0,0 +1,88 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 NXP
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/usb/of.h>
> > +
> > +#include "core.h"
> > +#include "glue.h"
> > +
> > +struct dwc3_ls {
> > +	struct device *dev;
> > +	struct dwc3 dwc;
> > +};
> > +
> > +static int dwc3_ls_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +	struct dwc3_probe_data probe_data = {};
> > +	struct property_entry props[2] = {};
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	struct dwc3_ls *ls;
> > +	int prop_idx = 0;
> > +	int ret = 0;
> > +
> > +	ls = devm_kzalloc(&pdev->dev, sizeof(*ls), GFP_KERNEL);
> > +	if (!ls)
> > +		return -ENOMEM;
> > +
> > +	ls->dev = &pdev->dev;
> > +
> > +	ls->dwc.dev = dev;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		dev_err_probe(&pdev->dev, -ENODEV, "missing memory resource\n");
> > +
> > +	if (of_dma_is_coherent(np))
> > +		props[prop_idx++] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo", 0x2222);
> > +
> > +	if (prop_idx)
> > +		ret = device_create_managed_software_node(dev, props, NULL);
> > +
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "fail create software managed property node\n");
> > +
> > +	probe_data.dwc = &ls->dwc;
> > +	probe_data.res = res;
> > +	ret = dwc3_core_probe(&probe_data);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static void dwc3_ls_remove(struct platform_device *pdev)
> > +{
> > +	struct dwc3 *dwc = platform_get_drvdata(pdev);
> > +
> > +	dwc3_core_remove(dwc);
> > +}
> > +
> > +static const struct of_device_id of_dwc3_ls_match[] = {
> > +	{
> > +		.compatible = "fsl,ls1028a-dwc3"
> > +	},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, of_dwc3_ls_match);
> > +
> > +static struct platform_driver dwc3_ls_driver = {
> > +	.probe	  = dwc3_ls_probe,
> > +	.remove	 = dwc3_ls_remove,
> > +	.driver	 = {
> > +		.name   = "ls-dwc3",
> > +		.of_match_table = of_dwc3_ls_match,
> > +	},
> > +};
> > +
> > +module_platform_driver(dwc3_ls_driver);
> > +
> > +MODULE_AUTHOR("Frank Li <frank.li@nxp.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Freescale Layerscape USB3 Controller Driver");
> >
> > --
> > 2.34.1
> >
>
> Is this something that can be enhanced in dwc3-generic-plat glue from Ze
> Huang:

Yes, I can base on Zehuang's work with little modify. Please let me know
when his patch merged.

Frank

>
> https://lore.kernel.org/linux-usb/20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn/T/#u
>
> Thanks,
> Thinh
