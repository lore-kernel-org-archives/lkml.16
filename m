Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5710B237708;
	Tue, 10 Jun 2025 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568872; cv=fail; b=ae0Ity39LqnrWxbyKkF7PwjRqCSIX7LETKZxvQ7aVZuOE+ln5+d2YGmbA+afaJliE17WNBaDwz1l6gD0utnzAd7EEviTwr2FiVi3lPPsSX67RD02gzf2Y8b2q9JrIjsDblLAso6fylj3Q8ZCxlT8Y+o5qI4iKRrETNTSq6H0Z1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568872; c=relaxed/simple;
	bh=p7fv4tFHJuG4pVvaoIwb3DIbZXSxe+OciqEf3ze5J9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JUHcEujZ8GlDTI8T8qX83EfS1uVmejDRximYy5QH+goZMp9eelHdSLr+4RGS92pzFJ1C3PJPUWWIL2J100GkC5Oj66JKjgmr49kTxE0czOVr5un8XUzqKy3C3xI30YNajtGbAQB24H2ppWqPPMPlc7j3j63Vw6n62YifCcDJZIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e4oa/JaE; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e4oa/JaE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/bbYHioN9oxxeO6lCU/X7PXv94jFyDgCrh2+X17RmH6SWcp88nTV8vb5dORPseAhyQoHDgJ1uLTf8bsWGAbmmMa++PtmUMxmIErke5NSx/PupjN6NqnhuQ2A/CrFB9jem1ymgFqke3dfiKK0d96Jj6VE9/pq028ONJXxBvgbkXrlJAhy2w+S4sDeReVNgY6+81iXOSQqa0B8/QnTwpBlwI8Z1LikBhCmlKt1ogrzjDe6kDS6Wpupz6YPXK2cmGElJKJnEo8Q0cD3F5w4zYXGaggmU+838zi3ErwqnkUT24UD3QKNKYMQlewhC7DlydA8lbjTIDYF9d4NawssW0Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skT5YMr8DKXHCRPrUrith0vrOMaXGsU2Jb48m2reU1o=;
 b=orh+rPNEBrCJhcR0sXc+OeVHbORYS6vrcuh/vgv7fdF7bIWAxnRwiBx6wJYQe6Wx0n8JDBEyZNOv/GOyeyZ5Trir5gcd3H4SZqQjKREndRXPghpaTu/CcXkiKklKQDcOUgTz0n/EAqiVgW40o3xKUk5+visVltB1me2DUsLchk44978dETGvLRjAhR5bQyUXrib/GbU+OZ0KPnf2BU1xxyZvRQZb486JX+FKu29sAnifXFuohxwoJb3HjEUTXCHnDkquHPLt0amQT2DcHl/9NuhZpMXuxjXZio/uwNgtqr5WSvmGdQJ3VDV8d8MjVOU4Hvjq/8KzX2lWe3Zh7PVgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skT5YMr8DKXHCRPrUrith0vrOMaXGsU2Jb48m2reU1o=;
 b=e4oa/JaE6Gkj4kGa3K2JR1p30mMP3HWI9cZgGb9zG+ldq+fqzf7QqSsthkygfR1cBWS+7jHVqytdzOn/mScVjXWcXhMWpHkUOyeDV8fvpOK5aufTTc1gLe48HYJnfTIFDrsKlPMT8iaMKbI53sB3eXwguVLaiOGyx8D8LdheSvXFDrIUD3pX7dcpXeB7sENyEsAdjsrLMO+MY7VCQAV4LHZpO9Lye1Ib58XTwciATAo1nH2/F7XChQ+blBx6rjwXcjnfye5DlHj4Df7LzUlvZtftE0tAGYKtHorIRAmvkQzhtfz5VU0lkdJa6/HVPKUf3c0iW45CKLRLZonMxfgkfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 15:21:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:21:07 +0000
Date: Tue, 10 Jun 2025 11:20:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW
 board
Message-ID: <aEhNWWRfXZ1r284H@lizhi-Precision-Tower-5810>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
 <20250610100139.2476555-10-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610100139.2476555-10-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SJ0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b1f941-04aa-4679-e263-08dda8326c18
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?zgCi6QAdPczLK1N25mukT5/2VGb1BBgcqokjYqv6m3PVPqYoQ2Ou5yz4hat6?=
 =?us-ascii?Q?SA59KiNM1K/bI+x14kNWnuFVMc5aeSPhS7BpwBlKLfIWDrfS6dBjEN3yqHwk?=
 =?us-ascii?Q?Hewc5suDFyws+cRTOKto8sY8G8nLz8Hv6XFqOudqDEuCIkEy10p6huMBfkqW?=
 =?us-ascii?Q?WpIZGkrDpwaJEUEleCNg/8yb0RIjwSPhHOhRQQ/jFTTiUYMsfUgIYwrXXOBy?=
 =?us-ascii?Q?dzdzPPx9wtfs5qUGopomM3G178eaV8PNVIwKSSeR4UoSaQRDfrL5GsKmWgBC?=
 =?us-ascii?Q?oSUNpsqrHe5Wv6Dj4EHm/w4zqz6DPW34cpw0Omqnp46q4Kq5+pzQCKeoIOYV?=
 =?us-ascii?Q?9wLbzb1+24caKlXniKui9GbjJJuruYiuyzE5uP9nucP977jbBimceDytbi9c?=
 =?us-ascii?Q?TqK3glJoXOI6uFoDqPXj6Nk8D5yNCYKc82jpdxWJirOgEIjfoc3bugEFnZED?=
 =?us-ascii?Q?x6yvXyKyt4nzO3redczj/DaukRk6SXTP2eEwuryTcsHsjPsml1F0AbT6EwFI?=
 =?us-ascii?Q?mlqEvowR3gjFbQQWDX/QW/AyUR7+8/wuYYdyGA+eX2ncwUc3BJyKIG9YFJFB?=
 =?us-ascii?Q?I0h2QHszd0c/6wWkySarO/aZH1BqwIAFuY7iF6UNXU3tSYe17EmD71SvO1+P?=
 =?us-ascii?Q?4c2sg6a2YsizfjtBdA/Btk+ngOzyKdj60hmASa9KwIVGyO+uO6j640HY6FOB?=
 =?us-ascii?Q?rxpqpXZbF/riVxGr1ZxsMAfoBlptQAJstnj81n0LDkBO7OhMooKeusHt+9bZ?=
 =?us-ascii?Q?yek5iTEdjF8BnfjCn4c+U6F2FvTJmEiY3W15uKJBhU+5iQdoMHUZs7OmluRb?=
 =?us-ascii?Q?ztY/uIkkrX8Bs/w4lASSTNzpoUJc5C/8SFGaFp0JPN5AjdajWuL/90i6xEkm?=
 =?us-ascii?Q?1Sake3IrYqzJ+b8B3A65b65dw+SywbDzPouFie0e31HxskrON5DHHWLEspjV?=
 =?us-ascii?Q?ibJTgOSW66RY/LoP5Tp0OQjy6jGuFoEi2zoRE1NbHEyhGbpdQGwoAzXZel44?=
 =?us-ascii?Q?w1RnAat6tSivZHJiYP2XoAzkMeb3OnYSdc7ZBftAq7+Yia+cFBubpa/BRC/P?=
 =?us-ascii?Q?87jzLcgmoYzEnUsCw9Fp7kT+q3vwC4ad8RUUOeQuiAwuJKJfQxX2AMOJY8Dv?=
 =?us-ascii?Q?Qp3bVbKcCzs2phc5ycQpm1LnuAvlOK+m9i4q3pj7btI6apeZE3/HIHwpPqCb?=
 =?us-ascii?Q?8mFebJ8WDo0CWBpV124/sF+oOvn/FP54KgUtl4IWbx5k+4uYIGLXDDjmiPEk?=
 =?us-ascii?Q?O/9xEkMrU5E4CHp1uDWpqRIgwFhAt3TpJ8y80ximzsbV0eCS6pQnm2rG1UKd?=
 =?us-ascii?Q?RwSGW/KuXU6Uo32xNubsl6f5Qxj4/aGD/ZV16wnNGA/RhTSYI10S4KVwxovS?=
 =?us-ascii?Q?to0A010ipaYPNEyOUIsyjZm/MUQuoAI37wTe/+is6WgfygI8dSQ8YmeZ/PSb?=
 =?us-ascii?Q?4ig+Hq3oTzi0atTM2/d6W8IELKtmLZL8imsH5YF8IfClvpomJpzqbA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1hyW8UMGG25jLtZ0ONYsEkC5XhM8YnazzwoL5LBEDVvCaKtqc/7o2bF3j9oL?=
 =?us-ascii?Q?Z9VHXHElxJb4/hAvfru9BdVAUrgFswWoiJGeLdRy3IVuIElUUZCsikMVbaPx?=
 =?us-ascii?Q?Qm0+VpT7fun562v2q8eM045sHb06YB+NZEWXMeUJz1DtLgxBiEYeSE6fkQiZ?=
 =?us-ascii?Q?z7Y3v57IvxdlsfpGH/OnmHYAYodUGq6SExIdV/HRWOamkHvuf+gKVUmmyDSi?=
 =?us-ascii?Q?1St3Bz2ppuag9SwIphtpwBjPJL7eRFRgJe9uBbX8+V9xQXoUYCD7gG6wwdVy?=
 =?us-ascii?Q?xcBQjvQif3PNPrIbN9PCuScgdeAq8qay9YL3B7DPfI0+UqQl2Y7kPqCeDrir?=
 =?us-ascii?Q?ZM2XO2PGtbccy43obdcMuwyvjwP3Yr88V7eLpDEc6fi2rzpa4s17vCUSw9tT?=
 =?us-ascii?Q?DGS65VoJ25ZSHn8DL5Okkio+PNkW3e1OiJCt3UgRfo9n6EXFDCYLW4XHa5OQ?=
 =?us-ascii?Q?myZr9wiLf7T4RnwVNRDVxAyRtZrKCyQDlvAqHcGeHyKxDmqHBkIno5+TouS8?=
 =?us-ascii?Q?PTpKJ656RD9nHTZEXQ4T30liq6nygJ6HTpaH/asOySG8lxcIWWSQRBRwQnmu?=
 =?us-ascii?Q?jQ99tLkAvvj5Js1OW5x4yd5T+eT5odWx0h5HNsJFp5WxVIYeA7a6vDRDcbcd?=
 =?us-ascii?Q?Lufyheg7stPmwM+bTfdSVUl84wzISrr4t2wS3NhcHNfp1J1YhoWnbG9mHXzk?=
 =?us-ascii?Q?CfSqnGeqaPx4WaqaMQUQTWdp/OfX1UrJib9nQ9k8BAfMFPzg5h1AmS4f0nAf?=
 =?us-ascii?Q?u0aCO8HUnAeC0sVbg8jAkkofxUFJAX1uyCuiVwUyxGffJ50TDBehPELcqXVg?=
 =?us-ascii?Q?rMKerI85xyoV03tywxvpHJP7b5qoJYoUHrCVPpx+nAmX/E4NcQssEdxKnmfC?=
 =?us-ascii?Q?2aA8/NoIxoTRXjR+tZ6pxzx872KRIh0DRHtYSKa3MZ6YtFNzlFCgPczgRL/G?=
 =?us-ascii?Q?Rb5sve5eb5GrBjGc9hivOFTeBR5BsAzlc2F0gQ7wA8RXvvjFhTdQsLnVh2Hn?=
 =?us-ascii?Q?XE+6j2vxYt5t4gNXkHzLa3z/LgacUr5FQ2xa70Q7I3inScJDP3WPVCiiEu9l?=
 =?us-ascii?Q?bmjjKgcS7h0khouEe/vRf91pOjYu8cff0IbBTsa2n464YwZbSeUp4LTu+PJE?=
 =?us-ascii?Q?wiDJoYxYdzp+mJJs5s9wvw5x/yO16VOiTWw+O9ddmvmr3DxAnpO/Quac5P9J?=
 =?us-ascii?Q?mgLjd1ORE1CdJGbbOiGPw1OvwyHhhilx0VUBDwObZkdimWOjSd6XTK7pLgJR?=
 =?us-ascii?Q?VWYrRcaabDUmYpPX54NWV5x3f+7aKUO5n29whw6Eo7Zz0B4lK5LlnVsYAthd?=
 =?us-ascii?Q?4Us5KHcA8vWFLSO+wwGHtDNgwuHG0DLjXT0tPAsvYsPX6Rq12N0ujqLTucNt?=
 =?us-ascii?Q?hVhv7TxRlaoeuPVle0tf9T2uhaxrINOr/0657xI4A6wepyZXJw5LQejjVn+m?=
 =?us-ascii?Q?JA1NpP6e4ux1P6q3c5UHLtE2l0Fy+Qgc3etMJXutCcOFdvW29jokshQW/rXe?=
 =?us-ascii?Q?1biIDrW+syVPXmMZoEo2Oips+X2WII9K4haXsN2idMNqD1HW0eQfhIITvx4u?=
 =?us-ascii?Q?mC0EiM06psljNMzKOacRC9N613KAgB14uJz+qf7Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b1f941-04aa-4679-e263-08dda8326c18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:21:07.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cviZuF6ewXY593NXavLMp0St+7LgJ/UzE4xalDQyOSAuq+Ii2iOEf/3SndSTwLyG/dnv2WG95RHNELswofpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895

On Tue, Jun 10, 2025 at 12:00:22PM +0200, Dario Binacchi wrote:
> Support Engicam MicroGEA GTW board with:
>
> - 256 Mbytes NAND Flash
> - 512 Mbytes DRAM DDR2
> - Buttons
> - LEDs
> - Micro SD card connector
> - USB 2.0 high-speed/full-speed
> - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
>
> Changes in v3:
> - Drop an extra blank line from the iomuxc node.
>
> Changes in v2:
> - Drop an extra blank line
> - Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
>
>  arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
>  .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 162 ++++++++++++++++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 32dfd69b8d8b..de4142e8f3ce 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -357,6 +357,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-dhcom-picoitx.dtb \
>  	imx6ull-dhcor-maveo-box.dtb \
>  	imx6ull-engicam-microgea-bmm.dtb \
> +	imx6ull-engicam-microgea-gtw.dtb \
>  	imx6ull-engicam-microgea-rmm.dtb \
>  	imx6ull-jozacp.dtb \
>  	imx6ull-kontron-bl.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
> new file mode 100644
> index 000000000000..d500f8839102
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + * Copyright (C) 2025 Engicam srl
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-engicam-microgea.dtsi"
> +
> +/ {
> +	compatible = "engicam,microgea-imx6ull-gtw",
> +		     "engicam,microgea-imx6ull", "fsl,imx6ull";
> +	model = "Engicam MicroGEA i.MX6ULL GTW Board";
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_keys>;
> +
> +		user-button {
> +			label = "User button";
> +			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
> +			linux,code = <BTN_MISC>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_leds>, <&pinctrl_pwrled>;
> +
> +		led-0 {
> +			gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +
> +		led-1 {
> +			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-2 {
> +			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-3 {
> +			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	usb_hub: usb-hub {
> +		compatible = "smsc,usb3503a";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usb_hub>;
> +		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	dr_mode = "host";
> +	disable-over-current;
> +	status = "okay";
> +};
> +
> +/* MicroSD */
> +&usdhc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	vmmc-supply = <&reg_3v3>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_gpio_keys: gpio_keysgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_JTAG_TDI__GPIO1_IO13		0x0b0b0
> +		>;
> +	};
> +
> +	pinctrl_leds: ledsgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_JTAG_TCK__GPIO1_IO14		0x130b0
> +			MX6UL_PAD_JTAG_TRST_B__GPIO1_IO15	0x130b0
> +			MX6UL_PAD_JTAG_TDO__GPIO1_IO12		0x130b0
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
> +			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
> +			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
> +			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
> +			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> +		>;
> +	};
> +};
> +
> +&iomuxc_snvs {
> +	pinctrl_pwrled: ledsgrp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x130b0
> +		>;
> +	};
> +
> +	pinctrl_usb_hub: usb_hubgrp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
> +		>;
> +	};
> +};
> --
> 2.43.0
>
