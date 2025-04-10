Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E289196D90;
	Thu, 10 Apr 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299014; cv=fail; b=MbihJyNJh/SPj/E9MeGIbTJKV83KLunKzv4OvVf7hhgHGrvkMoHUrDowJ5MzO2TA/xBJ6ENz9V+6JimGak1T8ZEJ9GYyMw4Rh0kUiKMfYbyRtOlFggWGbcHiC3tapSdZggWGdSXgUisrcekNyx8gh0WWS8zRNzz+EyWcn4cwKo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299014; c=relaxed/simple;
	bh=p+JsLDf2J2kSRH0LSk6qGFjj9sIctdMmg8A6nUYlSWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mk7f2Mi6K1XlXNbJcm/SMPdx7ie+MzObh8yWjUY3WVrSGZwFeZFwyfG+9eADDJ7eQ7NrRnOhAvoY4su/Opw2B/j7n0+hSD2EpZSf6cjP4vuf1AlSksdshD4MNbOXmz7d8gkfApI7qCkwHD7YmlWMm2Jdwjz7LwDOM497b8XUgm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Erh9lFWb; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Erh9lFWb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0lvkJnRhV+ekMSRh9bE7YDGHehRvimVlWvAYGRkLsxQFDC/3KlhY4+8ixwrKyI/1dmskSm1JoAWj7zAPLJNDdl1TmJXVTVKbmrn/Ados7/hFFanOBE5J986nOSSGzBnp/fmzhJhUomY4yjjHeiB5luQWogaQsmrwK7E2wkqSF+RB4hiR/tLriAAursnvY2/tDBJ8d7tYhW+RJ19X0EHiiajjhQmsuNLpk/6NpLeGSmXn/QFUOU53XqVSE3qvsY5O5VRPpJFspzJnNVlSDvtdBaiHHpz4DsLhhItjNAFymd4CjI3VaEgFYoPGN3HVOTUmcOC5Ju/cY+jV3N5GHmLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD4ubf2pUxlTb5LbE0DnIQDQ5fDbi0xvIsObFaGy9JA=;
 b=WNLETFKvgdhXvdEaabnA8wGSL8wr0gZPuYEwkFCPMmAqn7CCRWwNmwhVLFYaqMiTxQI6l/ElHvVsafR+L8NEuMsD1/pCfBOTKVnksYgtQ4FWp9e5Nt37KI8EYQVixu9ppYuVM6UFW80FRVHCH6edjJdHaMvUMt56hIgCb9e65+uk//ohfOo0UcZVXZaptTaMp9XK6issfjFTva5u9Grfv3vxnsZnvUKEDO2Con1RsilKnuH3pYMSh9KySoziRcFFfSpnjbC1Io5/H1goWd4MZMnw5YR6dixeu3qb+8hOhcO4QythKZjZwjp61FaHDZR5CygQxiNLi2bwwPVFE1yiAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD4ubf2pUxlTb5LbE0DnIQDQ5fDbi0xvIsObFaGy9JA=;
 b=Erh9lFWb4YAiWCbMA7hE26k9VU1yU6rHNT8QfirrjfCSYuSG9XuwWj+CXms24F+y2MwKpImjvMveA1ipSKNnh6JEm3kgXD5vNyqJ38B8CjkqKH9nlDkst+UopsITy2AvAuk9JyQ/XNwFkYPeIW9VSyYluiyEMaBS8+h2VOERjgsIsTaFZr4tc25cnCsvOs1I6HcKq9vxM6UTPXJVBDR1R5Vq5DdWViCjdgijTWX56O4+cly8eXBH16aTyrOodKDlizb/xaKKzPj9UMD8pSFYEjhc8bvU/wE5pZWEcqtEekrrIyeAz0gsQgge2ZI4DOjwGahN3PRxeuc6RB6miluhTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 15:30:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:30:08 +0000
Date: Thu, 10 Apr 2025 11:30:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 13/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 EQOS Ethernet
Message-ID: <Z/fj+2dq1HrdB6ds@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-14-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-14-primoz.fiser@norik.com>
X-ClientProxiedBy: AS4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: f253e477-6da8-437f-ee10-08dd7844939f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1skfT7E/otyxaacAxRcXOIeMWLD5oXqCtXIYIixZWxuxbuafUl8DyOnICYdb?=
 =?us-ascii?Q?JSxXXliaGKNWRl2cw4V1TNXbrTa1r9MNgU93aH7Wl2BVptymkhbSgR5c5o+L?=
 =?us-ascii?Q?rTNmoqAGmbCic+iVWA8bzZsSzj9r8zrNge7wKHxfHFEBnnTCSuXHLONFHF+v?=
 =?us-ascii?Q?E4M3AmUHwsulRzmpuswR6JeNQuWXXXcC1V4VWIWw77sLL8/Z6i5kabFQyiEA?=
 =?us-ascii?Q?ZjFy9ovWElhFKlMayD54HbMbGbEweI/O/ifoyq6vEDuGI4mkaUirrTH8k9h/?=
 =?us-ascii?Q?Y0BcYTk6He6e1VC1QZqFNcrfIpoMa9IOsiKBAbctWrhuUZp/+kP4VXfd+HeL?=
 =?us-ascii?Q?jkRC3OjJVAvi7SmQnmXjlsgQmUAerbnsF9d/mNivpy8Xp5Fin3gCG1JPaa2F?=
 =?us-ascii?Q?NDgE5BEhhevRomQ9RKjaz3TQlNT6qBLU5pKTIpovY714bZ7Q7nBEdAuhObQQ?=
 =?us-ascii?Q?XRyMg/KUU9om9kZvMkXhvovEtdXQ8TxHEXjTfBCz11/iFycG/+SXKjoLf6lZ?=
 =?us-ascii?Q?xnhI8iHTK62uNqvMN4av43SuVX374e+KFPQXq6dhTBbSVz8ja+Om43Plsjjs?=
 =?us-ascii?Q?p9XUcT+gNuN8zI8lfR5kSoGcpnihioYBl3iWqME2tXxdj1LGf9E9lJC4ZHvn?=
 =?us-ascii?Q?lvVl8d2yfL/mQJ7gNyG6ckE/apfPz98+lLADo5MhjhXAsW0Pw9tcdV4CS7vj?=
 =?us-ascii?Q?G0XaJX9oCtyUPjEcuv5jD/XTyHRDI4Lk4QAKCSbVqfMh4w1mwtofgYZ+dhJg?=
 =?us-ascii?Q?ylSPUr9f2j3rn+WMZdw1BHlnkvgbdvif6tZtG7ogbmE9r4/KZ60tsATLGBio?=
 =?us-ascii?Q?7miBrexZvMXo1qN7mRc6lwUgFKjdVNpevOGW8+UBAeR0Qfe2s6/X6rUUZlmp?=
 =?us-ascii?Q?X5+SrJ6ykwAo/zSRrx5b3A+zXO+hropWFb1bY4XcdSKlyS3F6OTRUmuWPg8v?=
 =?us-ascii?Q?yHawhO7i2DCattmjiy5THpO0W5WRBtNffeloasrYX4YeQrwZhlXGoRWhUYG9?=
 =?us-ascii?Q?AcNAzLMk7IXkqYXzVwd6G8gFeh86pCZzhqQtgT2hOROYbg3mSti2ZxldkAv5?=
 =?us-ascii?Q?b4l0dq0M7pYV4Sjbc1j5ZwtkoPPGrSqhiw8FS42Hjfx5gFGCFaaeT3B+an0o?=
 =?us-ascii?Q?giuGLFMw4aQNtSVoYxaohzXlHPi6XmqGEz1N3tjwvBTDDsiwkqz0OU33d88F?=
 =?us-ascii?Q?Muzjpo7v7zb84xc13dh1P49iIXt3L+WcpyEq8gTxWwuKgHv45u0JCjauJchk?=
 =?us-ascii?Q?BG6S+4y5+WcCJBYDhS1h44vWiBDHuSXah8omutrIjiqOziF3nEgpc0ypASm1?=
 =?us-ascii?Q?MML2N8klfKBeYXHhN9WBSm/AE/ikmo1tvm4c3vJTwnhfnm6I6Hmg3BHkZls2?=
 =?us-ascii?Q?pzIlimsouZqfSg8ujjVp6QloQVKRkv5RQLg65U7ZYtC4w1gExMkWQUCAQxYA?=
 =?us-ascii?Q?pjtfA0CvVoTso4pfAXPw2zglQ9dKipgl7DCCDLhfn2la0kkoijPAyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xm/scy2BSbjBDYggHpZIIkeDqtYnA9dT/7ERVeUvlCGkeVqc+05WB5VXO00E?=
 =?us-ascii?Q?SQ2IjRtwoIvneClZMslR71OEXpb0R1HoZkFmAAd5AtFHwtVSKey6j9f/oghi?=
 =?us-ascii?Q?7+5HjdUHe7N36NL2d/xrCud2VZkW6WUlskWBlQ6uBOj7rx++sjL7yt1wJRHM?=
 =?us-ascii?Q?eeQZutnflhSMfd7T5xbYYB36leptj69rN1F6cxRpucw/aWZUp0Po2roLm1oW?=
 =?us-ascii?Q?jdQHjNPps9DyVO76NC71mRrgwtH+wOkatjJvZ0o55avnxZQE4QKOn4ZHQvNM?=
 =?us-ascii?Q?m4L3kbKr0cjIlI4O7gDXAptvxmhtRnobIv2dQCdIX2s6g75ZG88MFOuAl/1h?=
 =?us-ascii?Q?PDM3pfXEwcmNOfzwftETIZ1afF0vmotgVsuDFkk+ANPKvwMBKpLSxozZFgx+?=
 =?us-ascii?Q?nbKuif0iCKvE/sWXOUbVZNXEytrUzEJuIXJCiF2KIjF7Y7NBS9zoJc9Rxz+P?=
 =?us-ascii?Q?um/aS3n+Q2BhrPsa2i3GB8MX4lxeBr3XO4Y4H0rwLvPQD2RKb1nYvOFBl2L/?=
 =?us-ascii?Q?m7JApC1uxEOPCrTe0wr4XegIW2z851QeVhbirL3zI2ZSyarvmc6XdQxlWVxZ?=
 =?us-ascii?Q?wZNMA/UplTlKAr9dQLmg7VteQ0VRHwq0phxVfos1OTrMWshk7+Bt6wQxx0ZX?=
 =?us-ascii?Q?Uh5Lk1rtRz9GL5nttHQsw0wgOeNhmwVTR9KjDST0dEEhmxXIf2+itQlmFHRS?=
 =?us-ascii?Q?48slQox/wloDBHLa312DlZ2uEfltvSLqEHmi7ENYSus8DyAVSIc0kkbuNN4K?=
 =?us-ascii?Q?7SpMYfdkS6KOcu82J9irmENNtxUkBPdGqn089bDMySyguLCxtcKyNL+/dLg9?=
 =?us-ascii?Q?j/fP3uy7e+rh3OFfXfSNc57Uu70qkHIR6cvKCvZGxI3XK9ZiWIRVRWqrToPS?=
 =?us-ascii?Q?PxP/g7nO/zTqeAmpA2IF9KoSJJ+m0sM8OjGvzbb4MQNArNX24SFcFhMitctO?=
 =?us-ascii?Q?4NWmKZBYHNSnV4AZOmGu10TYG/vWq9hEfbzstg4vDRRZ+9dS4PF3d28GreSd?=
 =?us-ascii?Q?07nHOPhPTCjBAK6XHMIzeBuQ+WyHqCpuCR9VZ7SDmXdhQgILXOnfk2XFr7aI?=
 =?us-ascii?Q?Q1xL3C18s412CLe8xdqzS22JIUwCa6Ci06ubPACqpaHm9QjPiT9zPHXYJS+l?=
 =?us-ascii?Q?evGrbvUIjcEC6W0iqvtnJpatplMjtGH6zr9tr3QgxxEjXsOiHWEabCa1ZrlG?=
 =?us-ascii?Q?fTxB7gUPAbBviouVLUAH0ATgrCJxQBB7OJ+6VKtKNrgDLTfvTRvh1X1Ea11v?=
 =?us-ascii?Q?X78OzO0zciNLNA/VKl3WfnMvrLG5GPpG634kF+JqQhVdf0wTsNwViUnJKWDC?=
 =?us-ascii?Q?rPn8g18DdvAXk4/9KskC1cFzjPMGiWBYEAAVQ1mMfq95yZSN6lZtJLG27Ia3?=
 =?us-ascii?Q?kUhCTbE58Ru8DA2tiAt1K9l7Ok6TGtUxMwQV9jaO19VaFNnFULigdtIjG+hH?=
 =?us-ascii?Q?NuBeMnxRIMwnxbT9nAVE19QUzrE55m09T3Nqd9zg4WkDvG3igOKspGobYi3b?=
 =?us-ascii?Q?t4cr0as5pKMHflGoLtdcK3q6cUxe92cuSoAVJ0QK0IubwRnL80Tu8egC7X/T?=
 =?us-ascii?Q?kH2hjQWS0e0W6xYxgifZOvTAWqRuIvz+46UXBhuY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f253e477-6da8-437f-ee10-08dd7844939f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:30:08.8143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxx5fu/My6KEAK5BJsnuVlVMNQC6w2/+T/RBbw2e4OM+AA5bFftLxGf5YHTTcJISdnlIP5LKfYd5hNVf8mBVlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928

On Thu, Apr 10, 2025 at 11:02:51AM +0200, Primoz Fiser wrote:
> Add support for the carrier-board Micrel KSZ8081 Ethernet PHY. This is a
> 10/100Mbit PHY connected to the EQOS interface and shares MDIO bus with
> the Ethernet PHY located on the SoM (FEC interface).
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../dts/freescale/imx93-phyboard-segin.dts    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 08574b146400..92f0cb6eca26 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -91,6 +91,28 @@ dailink_master: simple-audio-card,codec {
>  	};
>  };
>
> +/* Ethernet */
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rmii";
> +	phy-handle = <&ethphy2>;
> +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> +	assigned-clock-rates = <100000000>, <50000000>;
> +	status = "okay";
> +};
> +
> +&mdio {
> +	ethphy2: ethernet-phy@2 {
> +		compatible = "ethernet-phy-id0022.1561";
> +		reg = <2>;
> +		clocks = <&clk IMX93_CLK_ENET_REF_PHY>;
> +		clock-names = "rmii-ref";
> +		micrel,led-mode = <1>;
> +	};
> +};
> +
>  /* CAN */
>  &flexcan1 {
>  	pinctrl-names = "default";
> @@ -176,6 +198,19 @@ &usdhc2 {
>  };
>
>  &iomuxc {
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x4000050e
> +			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0		0x57e
> +			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1		0x57e
> +			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0		0x50e
> +			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1		0x50e
> +			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x57e
> +			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x50e
> +			MX93_PAD_ENET1_RXC__ENET_QOS_RX_ER		0x57e
> +		>;
> +	};
> +
>  	pinctrl_flexcan1: flexcan1grp {
>  		fsl,pins = <
>  			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
> --
> 2.34.1
>
