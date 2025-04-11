Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118B1F3BAA;
	Fri, 11 Apr 2025 14:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381954; cv=fail; b=PSvCZ2QruSSzNVP4w1OgcdhGg6BQ+Fn6PN61dGmFYCG3t0qE1u2Icc290tvW7kDGQD0foS37zmO/7HP9aT81ygdwRY8Lx1qzrnu6RTw5Tsm0QOKKcK1YxCOSom32uWcNwE/8xwcs68+RbWa89lHun8QvHB6EiTcST68x3vdHPrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381954; c=relaxed/simple;
	bh=BV2J9W6VLvcEz1+9c8TUopxkjyYxa8AS7+LQdT/r+8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GaOuUpZaX967ZeY/I/uiD3FQZryDC/HQidTM/c8IhmMVTfVQpIxGwbVdnUpYJ5w0V+eDN47kJe19dRzoQ9OgJimR8/OMlSyHH5CsryOl1tpAyIkQpmRnjnV+XOwcpjwzXaK7YkbC5s8CasaC0N65l80RtlabWkhf6FeWqwxX1Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e9OCpE/n; arc=fail smtp.client-ip=40.107.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e9OCpE/n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6H/COG27teIlbES0ypH8+KBHATh0Hk0lx3m9kARdDx51tsUjD/E0lFW6fpgfUnkmcF9KIKHH7Q7P4ZXv/VSK3T9rfJk7Hiw5NB8xI+eO0f6rfYQR8MUB6zmPYPRxPoYNSXqA+bO6TOiKxmZ+tfx1U6WSHRgDjegm1HSisKSZs7YN86AoZGiIWhTF0BZbLBvdn2+CJa1kKExeMYiz5bgYkNMCE7BqFDGdPOTQasJKpYtnCsvmlYi+S6NkARg9itftXYuVQnTSrLfxGBFUvFozK4pLGjqYikX985FMkJTqjULS6MJqqI+HFuFQA7xhAErZ0JCQx0DDGvW8+Aw0bjGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuY25K0ZERb7njNnZMZ5EpxWBUigDQ5zEolo1NdwIgQ=;
 b=UoslyFGPHUwoFSXmyTkDZ5oypB1ebLZO4hDe8psv0d3/ePbVTqfJ5klHv14Lo8m1eAD3XvYoRN5xF1tNax5GAD+mOYiqqs5KXplKrAAMeVxWEyCgXYdrm2CTIZUfG8gqxN6ZOGRzHT0Jxdfvgxt9C1jXKyZdIHq4Op3p0yx94N9V40e4xeBa4jR0kvxtO1NeMhkd7vWDbC2PzaP/03uzjZAJ3xdCgN441PquczB6MmCLmwz1OEUIWyFDbY1R34NO3JKiuLEehEHgnjXsjQ4EAw+IoV9Z48INW0B4CRSh1bVjfpCWOrmoqZWu6lSU4+p8/dGBlyc9x5adJIBOLrX03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuY25K0ZERb7njNnZMZ5EpxWBUigDQ5zEolo1NdwIgQ=;
 b=e9OCpE/nuufjEdXasEV1lKiXYVaTwBUSAsCu/TMFWXBJu+7kbWeQxknXjhiYvhILW9GIZkHZ2r9QsbVUGC9D3rez3oOUpyddPIeSOX6cyVqXY4ku91v1dPKtHmb+bVjUWccKYLz+yAyqWPFZ1oqun1hBGvA7Zblz6DyWnXOHob7CgklJyNZS8EcGu+iFjrCiaHDK/W0iav8CGEYdzL0tyx6xFBuF/M62vNuA2ooBGYE2mYqOLuhy3HTZnqOdatLrlLbItzrGukf2MlI2upzkLGPKLUz6cl8/DZAReASdr5W6WaIDD2bo8AIo8rKpiL5/bkEUPETqFHe70UQfluYsRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8324.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 14:32:29 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:32:29 +0000
Date: Fri, 11 Apr 2025 10:32:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 05/13] arm64: dts: freescale: imx93-phycore-som: Add eMMC
 no-1-8-v by default
Message-ID: <Z/kn9fGfH1PeyMxW@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-6-primoz.fiser@norik.com>
 <Z/fdR2C0IRUfUv4U@lizhi-Precision-Tower-5810>
 <cffdcd6c-88c5-43c1-9f00-d1c84af73f4c@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cffdcd6c-88c5-43c1-9f00-d1c84af73f4c@norik.com>
X-ClientProxiedBy: PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afe6c23-cb21-4055-9f88-08dd7905afed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xxDq1LhT8ycNkRocExIq3l9vVm41p+xWYeTapWGrdC8Z1qFBqzLmHlZFFNgI?=
 =?us-ascii?Q?toOyX4RpHul+LQ/TTjhaCUCotFl1hP2N/islfS4Adezt4LrgD5nULMRFngtr?=
 =?us-ascii?Q?tQueTvZEKdVU4iq4JxfgtAI5qRb3/1tyz0qnLGRh63siVC8zRuJ6J1VLko/t?=
 =?us-ascii?Q?4o2CBoHpl6A5yxZ347C/EtaVyTEXw5QBe21ExC37Dxeou5/muZDp179rbzY5?=
 =?us-ascii?Q?e2CGJCEQqemSvdJ3I0rwxvNpsJec4ZyXxNnXj0dsDW1O0QV1hfI9CvEmyk1l?=
 =?us-ascii?Q?WsKZxHrAfFNhMaAUnz/Owo356uAU2aNBtnrNAR6pHoLak9N6XZvkUDktTQKP?=
 =?us-ascii?Q?T/+Jj3k1gmyHxov2LfHUB5Bwk5aKrfMuToKvs7mUgIsLvG51W309lU3+thT6?=
 =?us-ascii?Q?40v4ETDajSYD+oohxIL5LG/oRpF6MfBWXJ12V/sYnRquHTfd7jtXVuG/hvOh?=
 =?us-ascii?Q?fYNMMzGIJDe1IpZ3yVd96nl/yrud7uKIDA795OJF6OJcYy490VgR0rptxxuy?=
 =?us-ascii?Q?PFDGganrgODE6tHEKzKVfwwteK6y5kQoEy6BPLOQ2qfZ9Fo9XBqcPKCrZK9w?=
 =?us-ascii?Q?TM8yZ8MQySRkL7esc2NwjJHtla18oChcUBYmdzXGsbOqzrfAaEVUVxMm5aMx?=
 =?us-ascii?Q?+87XJT/wM6WOcO2mlbFKzRKClnw6R40YuClAu3cGbn8IXNaYx8IEJAdUWiIv?=
 =?us-ascii?Q?hJO7cd7ylkTisZUj72aA9uFe529blV/oy3dVThDmz9pQ6I6nkLEuwDoaR9wr?=
 =?us-ascii?Q?YT22cFUdNd7a1JcqExWW1GekQe+unfbYO9Kov2nvLF9t5hdALdfysPfKEXQQ?=
 =?us-ascii?Q?9DVA2doPKCI7HjGt4z0S7lkP2EGxgCu1FquB9WASR6qCbUy1qv4WCsWC2p6U?=
 =?us-ascii?Q?HWFyPLptO6LfZh0GjjoCnezQ5XteEzJXHRQgcQTT9jwts3UInI8oiMOuUn9h?=
 =?us-ascii?Q?NG8ZYTEYuAUv0SQK3OwKNwPLkJ8U7nCRRl7/9UBTMrXKGEdC/tPbllY+uzed?=
 =?us-ascii?Q?MRibq8QdUqG/h1SUFpEuvCtV7mClaw27oHXpEWbNXOy+Y17j7ElGXyY9LMvh?=
 =?us-ascii?Q?d09+WFE8E9DS8WtKuZ+agXLk1kGgeHBVmyjYA1WRsHMwAK/9GlcKmMLSPIto?=
 =?us-ascii?Q?9AuOeYyr+oBIcoRwihWqx2eHLwPU3VGn193SZhttqXwR7Rceld+nPvv+1t+V?=
 =?us-ascii?Q?kGznUeMHTyEp8518FIAtQIACYqRLnCqzM6FI9VKXnPC8COWE2aMjtgV6i5Zc?=
 =?us-ascii?Q?wf39+pHRgdkZP0VdARYfs/8t9bSG6RiouU0ewrKAakcjevq/RKokZXY1oF2n?=
 =?us-ascii?Q?DxrzFFxL5k5/Ov9g7ctGfmHkimS39s/gCy/IDfyrI6cc0K7EMTP16zJKAHkZ?=
 =?us-ascii?Q?nyYBO8xTpoZJ+m2mqwJ8RucNHM1EoZR6bn/DhZLPbdHDWdzOWGFe8mg22nOi?=
 =?us-ascii?Q?+JMaUMDyDYoPZ7RkGZF3QSyUVAX0UZpOYXp41xGnBqzf8JaPtOQLVTlN1n9R?=
 =?us-ascii?Q?7mfV/Q9fDtw4dD0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+lo8OepxDy880hiQcWpiKPZdH1njYBxlYU9IhLHolcTcWSCfrzEjLO1I+W+y?=
 =?us-ascii?Q?VEPayZot23hSVRS6TEMdwy6tHBWioSAkyFUrXSLlv3mpA2/3NaJYhL5e1ojp?=
 =?us-ascii?Q?pPtTHB71fmHN74PVjv28RPJqrm1nh2nlo8EOXVAlE90Sqfy1C5pH79syK1RQ?=
 =?us-ascii?Q?zN6fO68OihSKe0rvSsL3ei3t33aQ2K0onKeRI2vxA3I9pqnE33Gm1CLGqcq/?=
 =?us-ascii?Q?It1i2smmJujaehqTVpnLma86mEwEV18wqRFjAK5L4+zyFK5VbxaKuFZiX8pK?=
 =?us-ascii?Q?hFHL+gUArqsO6zlFlrtdfVkX0MD5qMPjl2terdDKxYkZk6J0ZXf9Dx+oRhz/?=
 =?us-ascii?Q?1OHNjnNrCszs8hvafOy/NlE6UZPtHmG0+nqBy7bGac9FKV4h/aDhO8B33UlJ?=
 =?us-ascii?Q?WBs/nsrsFQO4jHLM+EcNwvGCGiTAVPXzTs1XyYmb/1KzsTssN+a4ysBirJOP?=
 =?us-ascii?Q?Clron9LdD61rVFGPFh4NGdkwfgCIO4SDi0gVLPFk8ArXWR3RK+iOD5eE5AjW?=
 =?us-ascii?Q?k1HBqPbA/zQEEPSK300P2jt0owuZuBqf4OMyBw9Gxj7rr3ntAB2MDgU0nfOg?=
 =?us-ascii?Q?PAukMScNkipogGEkMKzege1V+TVlwRR5Af6goXbqRxWQTpEWyqYOeBwMaj1q?=
 =?us-ascii?Q?aCYb7tiCZThR1GG5Z0VF+Rr2xgKoMe5NdVNK+mrCL4VufvkL36allPem1MQ4?=
 =?us-ascii?Q?LkO3aqH87XqqKp9uRyfTEiVAVF7wEzL2hrqgzO3jnPAd7dWLrCN6Y+PCWIVF?=
 =?us-ascii?Q?R0n/nP7+RPoKMVW3Ne6Q+pWn2EVZZ4heDJto3/zPlnihNDhy5dwyZgT6jOw1?=
 =?us-ascii?Q?GytPr/o+lICOLNPy+w5+/gMVpldBGU8SFpU4SwiTnEV4jXlok1wVkB6a1x7m?=
 =?us-ascii?Q?r9nVeCGDeHN4mRD/TkvgGTuIoiDvYxulEvYxdljJ2QrcinnBZUP1UQzbVz21?=
 =?us-ascii?Q?8217MpsbRwBXRtZJfebEJTDvudACXSmaVwmU9s1IizStbJZqKdJDygxUGZl6?=
 =?us-ascii?Q?jv9GyCv4VL84qv3u9MJhYvbjnwjbdh+NwDueC5ftjf6IhYhE/Y4xTmdsxOQb?=
 =?us-ascii?Q?f/OdyvqXg7eIdlScUo9SphyGHw60pZEkB6wBTmwukaDkKqe1Z5C9O4/cbVLr?=
 =?us-ascii?Q?f7peDpJmbuxROB1GysCdrpqLV7gEMB5a+zUFm3UAWohkjpOVgKvutyMZEoU8?=
 =?us-ascii?Q?+sbQWuGpIOACdDXVHupb2G7TC29/GtdXHSxmz8m7L9Pk7RNnEZCyKCwvpi8U?=
 =?us-ascii?Q?Gmv8XADUGXoMNkjm2ko2SrUIk5M6P48lSR5PXMlwwfFIrr0hnlmD4BhUdJY/?=
 =?us-ascii?Q?V/NZh1M+kkE2gxBBQdbPsMYvP+HNaGv1U7fpRGPfbUypsNRpTZBzvwIUP1zi?=
 =?us-ascii?Q?E29C+sbfq3JSGtlMOpeOnnGsfz0+lW5gLwYTnld+17Y/W1tuUL0JHSQVL/zM?=
 =?us-ascii?Q?4t7ltQWJG9xQsExZ0OnDDLuBoLI4l0TR6B5Lh0QkRbTWVPezmo0FHEaQ5/sj?=
 =?us-ascii?Q?d3D0Wf6Qyp3MQdmgFMQ4KIEYxeVA08qxmNj92fcrALK+bP4e4XubyuLUZmVx?=
 =?us-ascii?Q?u7fY299iRB6ks9e9/Rmj8zGtZGFfQr1BVLlGivGx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afe6c23-cb21-4055-9f88-08dd7905afed
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:32:29.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDQO4QOn93nt+En7+fPx62E1MihZpyxW7wBqXbBDrAK4T6w4aoUZYS3xFiAXWlC+Fg9n+BzV4FFkYZlEPbdrsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8324

On Fri, Apr 11, 2025 at 08:51:18AM +0200, Primoz Fiser wrote:
> Hi Frank,
>
> On 10. 04. 25 17:01, Frank Li wrote:
> > On Thu, Apr 10, 2025 at 11:02:43AM +0200, Primoz Fiser wrote:
> >> Add property 'no-1-8-v' by default to usdhc1 (eMMC) node. Bootloader
> >> will take care of deleting the property in case SOM supports HS400 mode
> >> (1.8V IO voltage feature flag has to be set in the EEPROM).
> >
> > what means of EEPROM here?
> >
> > Generally eMMC worked fixed voltage, why need 'no-1-8-v' here, even no
> > HS400 support.
>
> The phyCORE-i.MX93 SoM comes in two variants, one with 3.3V VDD_IO and
> the other one with 1.8V VDD_IO voltage set.
>
> The 3.3V variant can only support DDR52 mode, while 1.8V variant will
> support HS400ES eMMC mode.
>
> The information about VDD_IO option is encoded in the SoM's EEPROM. We
> read EEPROM in the bootloader and clear "no-1-8-v" flag in case of 1.8V
> SOM variant is detected.
>
> In case of EEPROM error (erased or read error) the fall-back option has
> to support both SoM variants, hence the "no-1-8-v" flag has to be set by
> default.

Thanks, can add such detail information at commit message.

Frank

>
> BR,
> Primoz
>
>
>
> >
> > Frank
> >>
> >> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> >> ---
> >>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> >> index 3d84eed33074..d6589d26c875 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> >> @@ -172,6 +172,7 @@ &usdhc1 {
> >>  	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> >>  	bus-width = <8>;
> >>  	non-removable;
> >> +	no-1-8-v;
> >>  	status = "okay";
> >>  };
> >>
> >> --
> >> 2.34.1
> >>
>
> --
> Primoz Fiser
> phone: +386-41-390-545
> email: primoz.fiser@norik.com
> --
> Norik systems d.o.o.
> Your embedded software partner
> Slovenia, EU
> phone: +386-41-540-545
> email: info@norik.com
