Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0722869E;
	Fri,  4 Jul 2025 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751595039; cv=fail; b=fHHYfRAOLs/SRNYdqMagIlhQ2I8ui3P7Hd/S0p6d9Y3BeBy6p1+31TppGpNukflKc3CRbo6RD3WIfxfoC/+0Z6peeyXUOkC/YVW6aUkr+EaucS/Y0v+SN8KNyoW2WlbOn5VnV2MKK8DckxD/DyJVk6c3e1DZsmBv7KU6GSLcwJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751595039; c=relaxed/simple;
	bh=sKFZczL0oQ3eVEuXkmSrRI6KM19qlf/mnMeWx98/E3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o5blBhQIunZCm0rnnGseG0yGHXUcP2lwYltJfTNkYOxNIQBbULEcG8TzgBn/RROYIgkMwcFK+CGFj5JFMCtVe63QSJ8vRL32WEkoJK851upnbQMiIOFKiIwgjh5szXEP8WYFSh/nEz/XJewVIn7NbQifwHBuxnOea1PehSo9lPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VFOhmAN0; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VFOhmAN0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq950y51UK/Z9x5qQWkOhPLhApnODql0el6eaHUEAju5Owlrp8ymPcjStvLIrT5fjvMc4ozsvqYmNVPUBVYrhdF9ApxUp1TuowTOLNC10VFWIXxpmPOgbZhFpZJ/w9Vu3nIs4aixXMROjFtQax8iTvFHWSZJUrkskJ0eRl86MFrVKyXpvn8c/GCyU7X69hfK0h/3/xok8lxxciUr8ngUw8WRKSQC9iZwxvZF8LEWHQHQJuaIAFPyymsR/R6daPamX2nU/+k8S2c+dn4r/WulKpXY84iVtabwrujWgHL6r+AzNSlkrWRgR51clopzvCMzijfXhlsCA2FSMocKya0VJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoHakKGpa4Dzpiy9VJwri3mF0IXFOFhe5cdQRnUrMZ8=;
 b=NjmHklKpN6rgTtp3s2M9dG9j70LwZfebkXQMhTxDAQXrSONS6Q5hpZcFPnaPjADBsiyrxPMix4f4vjUEIAeIXbh4FA570r+k9OVKEqBMI2KGBokWdMK80pdNiQmuWHKI84WLvnCJnK7LpHhMjky1Cdu0nf64xbLvnygAfa/NVu++08XoPMLnncTMORNLaELDLY1Tx16IWZ9zegjv68+W3FjypEdCkDN9c6oR8gSRXTyb8cAtidUpatdb6rZnWrXF8VAMMtU8NoQNt78AQ9H2krmTcnmX/VDe+YP+Zg0u8n7ziKA2cFPThS6FROE1DhC4QhGEtox831CU/y1wL3UzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoHakKGpa4Dzpiy9VJwri3mF0IXFOFhe5cdQRnUrMZ8=;
 b=VFOhmAN082plQ4jnqDg1JMROeRV/vKxdtP2FqvJpw1w88t/xdKiOQBEaEQXHsoJU0GTemvZRLECjnxZUCMY5JBuQTxvJDmVdLGasYciTNiLehKIhVo0BdUE/Q8StyUdDXQTajVDiEokLiOc8iyLk9ZB2OgifTMYlxV1QSHAh4ek+0EQrISQLobpf83iXjbIc6ZFuG4/JYf9dDfYYyseaXJe8xpAHd3o447hFY76/kLILqPvom3nQvBisszB7sB/RwqUYPF9J7b4WA5SbtV8Qbb1Q1/fa/0iERbyy6BwS/QZZ7hNHxkYINgkOh8jnGwOh1IB2sLoNEwZDyhI1deSaGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7926.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 02:10:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 02:10:31 +0000
Date: Thu, 3 Jul 2025 22:10:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Message-ID: <aGc4EibLNTEj/H11@lizhi-Precision-Tower-5810>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
 <20250603012029.4agja77rdoneeyrl@synopsys.com>
 <aD5jL5DK6S8ii-DT@jean.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD5jL5DK6S8ii-DT@jean.localdomain>
X-ClientProxiedBy: AS4P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 9550a194-d80b-4923-7c32-08ddba9ff43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hKTuCl6XEhlbHBpSaAMvcV4t/gUoiEmfcC9h0tsjm/gx3RKBfwoKttAW7pkt?=
 =?us-ascii?Q?547Lx95YNKVDHtMW1+09m8RUkoj835zSt5Zj8iooSI1GCvd4pfuTttjQ2afb?=
 =?us-ascii?Q?EfhJtcr2CQfKDGMgLfFzP7u1oW5mtXGN3JOmy/OMWVR4MMAxCdnbrNOHKKNg?=
 =?us-ascii?Q?R/6NzR4LvPgeu+oM2iRgJR6LFdCp/2QlrKSgpcb5qJvZIPcRCFhOQU2BPPdo?=
 =?us-ascii?Q?vcLynFMRSEKO23eMxy85s7m+kk97CCWrmLJx7s5GhaUrcKE3XtD0TLk6n6Ft?=
 =?us-ascii?Q?vdeKbRhzNIr+r+0F1f2F5mnjEau/BH3/Em844FFtHYQIjWlfWCY2JvHeXooL?=
 =?us-ascii?Q?7nRsd3TdVmrISmlM428km4b55s7LIZYagRQjjk42kRnVq72WISW0afVnPPAr?=
 =?us-ascii?Q?9YYs6a1AbWMqrov5VsDnZF69ml3uwT7cAeKLb2UG2e3fKbXaUO/oMnKElkeh?=
 =?us-ascii?Q?Njt4CqQbI7nu2VQr4uv627bYGyEhhmK08qF+xKznF131jg8AqnnQTUVqAsry?=
 =?us-ascii?Q?ktk4bjFVfBrbMMeip5Rj+zCX1HYVznkZpNd7RL110h2nW8eorJhgzW+l6aUu?=
 =?us-ascii?Q?pd+Q1KSAl9qG/cDFmYwZvfq5LABUw14/S49ln6FV9eemkNUt2kWVdBIfTexW?=
 =?us-ascii?Q?hJerdx0gsL/kXoQnPYYdGd0nPrLhDYTlmUoEo+EW58raE7fiiYInQkBGZtZP?=
 =?us-ascii?Q?Ex+kncry2S2TN1+8RV396iO3SCqilX9BiTUdO+UyHfoytyz2CqzAkDMZ4/ld?=
 =?us-ascii?Q?LZxMuIMZNQUu0rY/fahOmbzbUQ78TyJTnJT5SbiouK+rrm1xqSVmbfVt296I?=
 =?us-ascii?Q?O0ASQU3lX/TrZYfwV+8J2m1KCEKSmOwA8Bu1i1Q/uGiloI7TgSs6WHCG+8Xw?=
 =?us-ascii?Q?wzboTvo8XC0wrotVQOVGgcM5cPA7BB5deDOJ8F2/Ct5/EHv8PlK38rnFLNad?=
 =?us-ascii?Q?Im2aZbi0eOIqysGaqDv3DXXce+v+Lgdf5uXrdRKl6oq1jea2qdwe+MS8kB86?=
 =?us-ascii?Q?WV6GMweTSAbvKPs8okm5ixHA6BYROOpWdO7lwFO7DU5Ka/MtZzqoxJNdubXp?=
 =?us-ascii?Q?2iuJZrJ/TPJD57aLGT2FOUIbrBrfIFS/2kQOvLa65Axv+pnGaPXrKc2+Dowq?=
 =?us-ascii?Q?JbA7MCAVgcx7osbL6V4AM6H3uURBpZ0MF2qyxdITkalSbnSFfezSc3BapsLq?=
 =?us-ascii?Q?HpB44S+lt2wLMcARfQPGf/j5vk2HRGSbxkC2N34ODttCJt0wa3R3j51jP3kv?=
 =?us-ascii?Q?a/VLxtKxH8KZA/hZuPUNiVszoAlofKO/DFsddwnMaebEc5e3w2cb1/sGysCb?=
 =?us-ascii?Q?l8XIDMU6YTb/bonbkPshp5+8T/A/axEMA+/+w1pkWfT6u2/YMstmfeqRTPmZ?=
 =?us-ascii?Q?9Q/0O6Qehftn3tv/TOgOlT9bFiX2ckHU6opwjMpiZAF9t74XucEmmt3O+oGW?=
 =?us-ascii?Q?UjVVRD4p0G3faYr33PJbe3H08ElbZGEabAxrYzVkh0YKIQdCoyxT6w7ABcdo?=
 =?us-ascii?Q?FG+HikmjEVE890Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ScseBTHnKIEF0V6CcMXpvr1kFnOcIk/+RWt9mLwJuZXYyBfZMiV7F+eGLNLQ?=
 =?us-ascii?Q?CnV56rEh4xT0nxHxjIl0F4dsyGewVq6HLP0hocoEZfny27wvD6D82pRKeH9D?=
 =?us-ascii?Q?o7cXNrKWts4xhe4uS5+N5SopKBHGBed8ekHbL1cwRHFc1KXBxYh9Z0eE7IQe?=
 =?us-ascii?Q?u8gFWmSJYYuUmK5nmxibWkCHC4KzkZYj69hvtBUC7d0UDAUmns+SN83nNgXS?=
 =?us-ascii?Q?IhaH4SB6FCRDpYIzu5253eb2RU8GoS9CUjprvqcQU1BDqz4pcHMq462YzVsa?=
 =?us-ascii?Q?h35XTrOAN6IBJY6TbFAAOXK9O7BEkFg1U+ZAezpa6nA45jab66ZAIKTIFRpO?=
 =?us-ascii?Q?v4gXGyq0BUf9EQ1CN8lYYdxxeXxmpOycNbCNYYiHlJVVvWhhM6lI6P1FOEbE?=
 =?us-ascii?Q?sPt/CCnNfQhG4bbF1h3LxuxvDpk+j75/60LvXasGpBpnmWiTv4cHg2u4SUdQ?=
 =?us-ascii?Q?i7gofvQMc6wpxoCxb0VavuMTpwEj+LApIL8Jh0EmrR06bh7nd/KMbCXIRkCS?=
 =?us-ascii?Q?UV/ngLuUkHeVkrIxhnntAGJ/pmhTWqHhC9dP+B6Gx6Lxig2bvfrOWZYnpusB?=
 =?us-ascii?Q?9YqKT6SvU5Iu5ACvsp1GM4CAXK1BrRml3ve0KoQKPhM4i+lsbolAOKs6BCcj?=
 =?us-ascii?Q?8gOMrTh/6P0AaGFidrjmR8C3VuLSa6iZMbB9UuhDoonlG7BV0wNj7sCELBbo?=
 =?us-ascii?Q?vXTMMDSkYbJFwTE2VEqDec2qwcVZhgR22Y+zm4OjIzpzhQ8uPMsdcylMU962?=
 =?us-ascii?Q?CuXwH9taMuyDuZnDrxXnJ8xwxvSCJOQnzhexKcHfWLpTXAvQsClVVFDfQdOT?=
 =?us-ascii?Q?vGY6K6XEBgK8VSsxq2o0SH3b4yUWBbBh884Wsi7CZrICCN+v25m7DFgSBhxu?=
 =?us-ascii?Q?x/VMkCm+fJ53av2AocwnYsxfGxns3l3qfrWsgKY2KRmapKMkhf+8Pt8xSyPE?=
 =?us-ascii?Q?Uu1Ezba42N/Cz9LbwxrF3BOnXCx3cIp5NiGwKpoGr4lcoMAG/UgjZJL8ZaQ8?=
 =?us-ascii?Q?OdFEHRpus2c1cAe8rJ23dWQenQwPiVi0Di+ufEb8KpV8CW5IvgRQvOxuLvty?=
 =?us-ascii?Q?tmflTpuTQAlPvJQQgwQg4Gh5Oj7bFa76dq/7vWchFboJiXXGXfZIoFv8eHtT?=
 =?us-ascii?Q?WDiRk5MB1hJeaU2JnCoUi+TDZSbVzP58vtBjB03mvq33FUZl9+SnzI7m/7Jl?=
 =?us-ascii?Q?Q6wRXVawxwGNHZqxnKm8PQ9TqmSG47GDyf8xCnTPYSBis2TIJ7mGyrdRqKdE?=
 =?us-ascii?Q?b3M2Wr9gQLK8G7D6T0RZ58AEBURRJscugY1TDIXjAUUqJJGZKSiLU47zSB+c?=
 =?us-ascii?Q?4Qh5E2WU67EwsIg3TFmmDrZQZkU0Rbzj1ebFXxXlOPxr3tYZC8hNNEzWpPwT?=
 =?us-ascii?Q?R7OdKRn1wFtY01nI3m8MTGfYxIR8MoDgwjy92GO20TleokW/urygXZDZhrPk?=
 =?us-ascii?Q?/sPpImuMFSFke9zJqJU9pKEHTvRlGzeVtIQm79yXXGXxxwCPMMSyeM6xhdiG?=
 =?us-ascii?Q?YgZhxuxqHB5iSMpPUX/4I+sj5B/DsSwHHR5croUuSXhY7MgMLvRfoOV95tC8?=
 =?us-ascii?Q?gnTyCxwADNvAk6fmGAIYWZOBocDWz/wMfl8iRmsx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9550a194-d80b-4923-7c32-08ddba9ff43b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:10:31.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTauH6/Gd23sfaJUpOTpB+TP7ejll/ftcYbF5C+zEfHLD1c7Ytr2qXcw7aMdVzozizlDywGcnbsC1m9qvwMTfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7926

On Tue, Jun 03, 2025 at 10:51:27AM +0800, Ze Huang wrote:
> On Tue, Jun 03, 2025 at 01:20:35AM +0000, Thinh Nguyen wrote:
> > On Mon, May 26, 2025, Ze Huang wrote:
> > > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > >
> > > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > > ---

Any progress on this patch? If you have not time, I can continue work on
this one.

Frank Li

> > >  drivers/usb/dwc3/Kconfig             |   9 ++
> > >  drivers/usb/dwc3/Makefile            |   1 +
> > >  drivers/usb/dwc3/dwc3-generic-plat.c | 189 +++++++++++++++++++++++++++++++++++
> > >  3 files changed, 199 insertions(+)
> > >
> > > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > > index 310d182e10b50b253d7e5a51674806e6ec442a2a..082627f39c9726ee4e0c5f966c5bc454f5541c9a 100644
> > > --- a/drivers/usb/dwc3/Kconfig
> > > +++ b/drivers/usb/dwc3/Kconfig
> > > @@ -118,6 +118,15 @@ config USB_DWC3_OF_SIMPLE
> > >  	  Currently supports Xilinx and Qualcomm DWC USB3 IP.
> > >  	  Say 'Y' or 'M' if you have one such device.
> > >
> > > +config USB_DWC3_GENERIC_PLAT
> > > +       tristate "DWC3 Generic Platform Driver"
> > > +       depends on OF && COMMON_CLK
> > > +       default USB_DWC3
> > > +       help
> > > +         Support USB3 functionality in simple SoC integrations.
> > > +         Currently supports SpacemiT DWC USB3 IP.
> > > +         Say 'Y' or 'M' if you have one such device.
> > > +
> > >  config USB_DWC3_ST
> > >  	tristate "STMicroelectronics Platforms"
> > >  	depends on (ARCH_STI || COMPILE_TEST) && OF
> > > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > > index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..96469e48ff9d189cc8d0b65e65424eae2158bcfe 100644
> > > --- a/drivers/usb/dwc3/Makefile
> > > +++ b/drivers/usb/dwc3/Makefile
> > > @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> > >  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> > >  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> > >  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> > > +obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
> > > diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> ...
> > > +
> > > +static void dwc3_generic_remove(struct platform_device *pdev)
> > > +{
> > > +	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
> > > +
> > > +	dwc3_core_remove(&dwc3->dwc);
> > > +
> > > +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> > > +	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
> > > +
> > > +	reset_control_assert(dwc3->resets);
> > > +}
> > > +
> > > +static int __maybe_unused dwc3_generic_suspend(struct device *dev)
> >
> > We shouldn't need __maybe_unused attr with the new PM macros.
> >
>
> Will drop these attr
>
> > > +{
> > > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = dwc3_pm_suspend(&dwc3->dwc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused dwc3_generic_resume(struct device *dev)
> > > +{
> > > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = dwc3_pm_resume(&dwc3->dwc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused dwc3_generic_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > > +
> > > +	return dwc3_runtime_suspend(&dwc3->dwc);
> > > +}
> > > +
> > > +static int __maybe_unused dwc3_generic_runtime_resume(struct device *dev)
> > > +{
> > > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > > +
> > > +	return dwc3_runtime_resume(&dwc3->dwc);
> > > +}
> > > +
> > > +static int __maybe_unused dwc3_generic_runtime_idle(struct device *dev)
> > > +{
> > > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > > +
> > > +	return dwc3_runtime_idle(&dwc3->dwc);
> > > +}
> > > +
> > > +static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
> > > +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
> > > +	SET_RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
> > > +			   dwc3_generic_runtime_idle)
> > > +};
> > > +
> > > +static const struct of_device_id dwc3_generic_of_match[] = {
> > > +	{ .compatible = "spacemit,k1-dwc3", },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
> > > +
> > > +static struct platform_driver dwc3_generic_driver = {
> > > +	.probe		= dwc3_generic_probe,
> > > +	.remove		= dwc3_generic_remove,
> > > +	.driver		= {
> > > +		.name	= "dwc3-generic-plat",
> > > +		.of_match_table = dwc3_generic_of_match,
> > > +#ifdef CONFIG_PM_SLEEP
> >
> > Use the new pm_ptr/pm_sleep_ptr.
> >
>
> Thanks for pointing it out, I missed this part. I will fix it
>
> > Thanks,
> > Thinh
> >
> > > +		.pm	= &dwc3_generic_dev_pm_ops,
> > > +#endif /* CONFIG_PM_SLEEP */
> > > +	},
> > > +};
> > > +module_platform_driver(dwc3_generic_driver);
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");
> > >
> > > --
> > > 2.49.0
> > >
