Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEABF1EDA14;
	Mon, 23 Jun 2025 06:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661463; cv=fail; b=LbXShUajMZQEnZdFoAbDmYRQVYogDKTFFPndOhLr/oH/9JS4m36fS136GD6+3mYDPklwNjCMaopJlWmDGiJoGjwpz0ZmhnySoGT8h/cHGu3EksqlaDdgXIe+MS+dKMVA6hZWHwDC7NPf5VAYhINYPrOS3XQZu9ujL50Byw5gzIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661463; c=relaxed/simple;
	bh=SfeiKNbN6evcUrkrG4+iadOWkWp9av7tOsXfv4Q0u0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ePxEZGPajGKgB1g4fHNzW1jG/0bt7BhHD4FAWkr2XHsC86dqDlcV/tk3z31+xmAPQv0M/QInZp2Gu4K7deP9Gfia4s6ovyPDNIo7/DsLC0GS9w57tCWdhsdUXACuxIXEyaJzLztmCSG6hiVtaIwqxf8bPW3pKvNVPRTDtIB1tbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Zo4IapKS; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Zo4IapKS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX/PF+gJrV/0NsTePAYfgjjVRextK49DvOTA9LApnlB8p250QvMjLz8wLzBvZoicul1BvPSB3hPon1fzWS5h3KqaNcN9t/UDSOZnd0kr68Yy85tM0aZ/B+2jFzsjMdUrH+xJQ8MBz1PrjGEc1/hDTwOhzyfGS34w5zXJ5Xu+06T87LBev5CI6XWnyUw+9yHCSeXLESvthLOyxm8bYTVvDpELV5sad7gahFQ+G4IKLqaB4fByhMi4ojfnFolxCtORN9a1MXAexecSKpSsiF4rkXhDoM/XIpQuWHDVoQ5P3oDNgzei5lNzpixOh/mnzEQCljAkEbXAKTSiuMSmNFb6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wh+n1qw27NXUQ6+D5rp4OzZC+nHOudcfQtXdZNc6PCw=;
 b=mwTV3P3DPZUTA/LeJ1j4/7iQUF9GKe8ZuWe8FkFWYq62MMCQ7PvCaLFv5D6bGpmdqrjm0DL29vLxBc9jcM0RK9lGfrmqkTnzAKCPGvEyZnJ+PoJMASLqc8GzR/Dva98MRY59qtzkfr2RU40oN/wYU++9crZce4sCmk4LljavdPuRC9qDnI/BI3DDEIgcVnjxOXiF2G3DQDDVpcOLNf14SReO4p30st4Z1WxBDbNZS/Xmpk7ssGvEgK1OhHqLqLO/wrkOzBye/PJnuu1YxpdCD4lllXUu8pBYNOzXEB6vzwVCfHJ1t7EAfFuIkxsVaRvrvahUkAFr7ObaSuW0WNUPaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh+n1qw27NXUQ6+D5rp4OzZC+nHOudcfQtXdZNc6PCw=;
 b=Zo4IapKSgPZx/Uimn50uAtdQYPjeW+uUUU9m9vj1s/W7aML5U//S9+UXnW1KJ0qjN41EkJxVBdnqEjGXPIIdxhlI87MczPpCHZoo4nk3sv3zM85d4WjaUGmLYK4w8PgK5YoGZ1spU439smP7/mE5t3LaZxYz+eGHe4cuDGv+wOnapGX34YwH/D0Fc1fKobgpLUfe8VA3wAR6MW9i+N6Ha+o6nkYMQ6p4AHUJNOMo95gd3Lc0RIzxAfbdaFWs17yiG9DMckK4c2mjiGjQB2oluBxLFI8TvHIDke26B9oVwPtwpPwY9i7EEq/3NglffqmyVO+Y36DfrhSHgb8/fFa14w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by PA4PR03MB6944.eurprd03.prod.outlook.com (2603:10a6:102:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 06:50:56 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 06:50:56 +0000
Date: Mon, 23 Jun 2025 08:50:54 +0200
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>, Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Tobias Graemer <Tobias.Graemer@mt.com>
Subject: Re: EXTERNAL - [PATCH v2 3/4] arm64: dts: freescale: Add
 Mettler-Toledo Snowflake V2 support
Message-ID: <aFj5Tv_3jVLB5DXB@mt.com>
References: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
 <20250620084512.31147-4-Wojciech.Dubowik@mt.com>
 <47a7209a-5f8b-40d0-9bba-19339fd4fc5b@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a7209a-5f8b-40d0-9bba-19339fd4fc5b@kernel.org>
X-ClientProxiedBy: ZR0P278CA0136.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::15) To VI1PR03MB3856.eurprd03.prod.outlook.com
 (2603:10a6:803:66::33)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|PA4PR03MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: f32822c2-bed7-4573-1232-08ddb2224ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wrk7ydSXo56V7TSfmwKyzVOTePJfXt2f+Hs4UZqCb2BmAuPPU/TLVZxmjf/H?=
 =?us-ascii?Q?29KxSSr4LCR6A42UXGp8ryisOmHFHVxCb8hUXK/mvKS/4SSEryvwEQCqRE79?=
 =?us-ascii?Q?d5KKFVhCqYsXvSM05iKBAPWF+lSbrfTlskgqV4kDBMXvitfvd65Q7Ntk8UvI?=
 =?us-ascii?Q?oi94topxj1/+Ytkep7QzQMlvM93ca0KgZfhaUVjDviZrxOmP9kBicGvOvnXF?=
 =?us-ascii?Q?YcS4Dyj92uuDX9WNofDrkmv+HeUgI9f9mQ0B8gj1yalkO41cE1Jd1vJgGBt2?=
 =?us-ascii?Q?GWvgCxayW0DrwDfEbtC3gV32dHQiMNhRn7pobBK8znC3U1jvSqu3McsKc8Nh?=
 =?us-ascii?Q?9G10hlchPRmiKChFdhpKUfwcKKYsyQXw9Rzwd1D7lZ9iZ2Y5srhe3HgxhtH/?=
 =?us-ascii?Q?nWO6/sQqaRy+6npyWDMe3HDVH1c7+UVT3SNWdU9xe4Og34ugCW+u22qMA8x0?=
 =?us-ascii?Q?D322IYucFzmw/n1oboDmMshwktnLmJoWO+MtCI3JQc9sFcGCK+Lr1EAGgSr2?=
 =?us-ascii?Q?98GSfxgnCYuGIs83vs3r6HzPsGQ7UUIc7Yf1G0diM8HZxd5q4rSjUWdzXrkN?=
 =?us-ascii?Q?Mfa7YlpXqNB5+D1WXkVNPjdNcYp4pZtx1D5KY6h09dYiSsAHrWLfvzlIqmIi?=
 =?us-ascii?Q?X4r655PMwNswuAbtK85MRN2QgXGYARhS0RnIZUsZ0Qu8JfHcszEJf5YwoeAz?=
 =?us-ascii?Q?VJQbIEYAGsD0YDsO1zzgQkwqXtXpdR17bKO8TxqGjOtTP1TIrEYle04ibTrz?=
 =?us-ascii?Q?6NtstQFgO0VrRMkCzbPKfNWE2lO7MpJ32yO8WtbrwOEyKbbryNduJIp/HKyC?=
 =?us-ascii?Q?iw2jhAhbmRG6D166vvNsIKuMKsP/2+9lWYyEX2S7Yb9BQHXD9T9gCJgwDt4R?=
 =?us-ascii?Q?PHJL7vZfnMBlDzJErK4DMYad2t+Og2zMzY0o1NS3GoDSo4lJfYc8tbmDzw5g?=
 =?us-ascii?Q?uoTci+VMKz3L4+4uz+0ZEVLf4RwlilG68l8+kk8//tk5kxI7g6NBgSwGGnWU?=
 =?us-ascii?Q?Zen1T5koCSJW0cA7e9D5dwyfkD4iSFJ9z8Mm2cEK5n7r/bABKY3fWAFgxwAN?=
 =?us-ascii?Q?ZIhvB0tNUjmWdd1jTfptiKF3XtJcoXF/pE7DwiNYw95a3zCFKwfhR8551B2H?=
 =?us-ascii?Q?33ZLp4Bwpi7l7fJjcnhZUdKUlun3jDW69eGKsBc/KaZZsl+VyyJdWw8UTQS4?=
 =?us-ascii?Q?HXRcXqwJoNaNvw74vAiWtNG6BnLF91+yW3tUEtRf8tfoG5J6GFfdR7w3u2vY?=
 =?us-ascii?Q?kxBSa8B4UjmBAq46Hc/w6IdAFBkCVW172x0B0z6vSvskvUxb085i9BpJWruU?=
 =?us-ascii?Q?2AC217+ibfkewuVqnxfbVecEtcYcGV11OsdI35YfmuSKWkPH1oz8gKcguJrN?=
 =?us-ascii?Q?SMJv0n2RAMWID+yOC0kxggoMA9k2iGNZLpzdRBDIwlVjKmt39e8aszJj/W62?=
 =?us-ascii?Q?iScqggRHj7w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wCHRg9wJ7bsqAa4HSEloB+RxtWDTqlNEH/V9oJsDns+549ts1re/bZ52mYZE?=
 =?us-ascii?Q?A0Wbl3A1kvAvaTgPgmsrAM2tw1NmvwbdXqpLLR7TDE55/1n3IGgV9nM+M4Ib?=
 =?us-ascii?Q?v5L9NPvIt5BsWSCxPDHcBAum2QkODAOrONMu2AP5VHkFqQdMc9U8e/5+ntlD?=
 =?us-ascii?Q?z1AKv5P7UT1MAHpGNR5ZwW5JoMqhZLncUwEL+j7rZD6aAcfS9bq6HbUd7xmZ?=
 =?us-ascii?Q?ZC55U+3pCX0ko33EUpMRHg0N+4S4VFY3vGsrJvspU5tHwgAAB4b7vcM/mFKO?=
 =?us-ascii?Q?19KQeY/ary/X/BXwzaxEGcJGonYJ1io6mrE2IEsO/MoEzk+GArVy0EP+06+6?=
 =?us-ascii?Q?uSgo/WUGfWobOpGOJbENuqq4XM7tu9bfk/r93ScAlRH/XSG6W2ERCETXtYTd?=
 =?us-ascii?Q?73VwBuB3XnUG9ApjSHK9K0Pu4BKYdBH/M3QcDTRM2rwYBD7jKcRJPPVnsv9v?=
 =?us-ascii?Q?cUy97pL5jmQ+gNtsDX1rGR3zq16w67qJcZVzzWPYvdFfuOLA4QnXRVRL0pSX?=
 =?us-ascii?Q?Mflr+FDPf3RBg2QhPK9HMZ52K10679BB3BZI1/scmZq5Bm6HieMwk22VgNG5?=
 =?us-ascii?Q?uOUbEnqtpnu0f+3U2Wy2n+2gw3Ivh/U2aGA9nyUkvxdWspkk499kZVANyUbO?=
 =?us-ascii?Q?cfALUFYm4lqGv9kXDPzvJ3Qj0cEj+iPUyMZlrt0WHidqMcWw2UycyE/sXg4S?=
 =?us-ascii?Q?JflqBrR3zaUjLLdxJwHxigy/m9Tje0LzKZVwECufQt8qMKzx7nFWnHy8z8Wf?=
 =?us-ascii?Q?ZhpWJanLgqE71r7jofNYpqMqy2bykfgOrhKIWpl3aWXZFIFJlTcOfBFmu+ya?=
 =?us-ascii?Q?uFFe8rlLR5R2KZdTwkuYYpoVE3qIlm++yRvnrB4luxkXu79X0+8ZtoC3v6jc?=
 =?us-ascii?Q?4MZ9Hlo8huPYzgQtq9N4Cq+tq2VwU8jcmErTVz0++PmApchEQtGCuOilQgiZ?=
 =?us-ascii?Q?BZZu1Q78dM78C3AnXeIymtOIwEelX5TFBzz3DrwgGC0+uPzr9nuzH80MAEVA?=
 =?us-ascii?Q?zdfG1Y677AmxQ53eWyGm1lcNKY/jbjXN2K8WP+Nkx+WJdFX9CQH1onq+2PCV?=
 =?us-ascii?Q?X9t/pcG43N5+HX5IeQm53M/J0QnUQv+iAKvWQAh3GpMKMVSafS2npbcvTWRb?=
 =?us-ascii?Q?rieoSTf/qzr946eHqLQUQ7XWLi0s3lwM3Iyox1gp178iad/aIuFXtaVQg87V?=
 =?us-ascii?Q?258LqtyKyhHGfQhaimVpeNJNJiwrAC2xl3foVlJOrQCWCrGpVC4yChyEGFDY?=
 =?us-ascii?Q?L/I1MFe+/eiF/0s601VOnknAWopC/ji/odQW4SUuQ5HYs1HKW4y1+YGGDSDK?=
 =?us-ascii?Q?ZV9dhMVomtEg7e8CXC7n7SbFHqtHoR3SJuWQ8FuwZ8+rs/fLITT3wCTqNYk2?=
 =?us-ascii?Q?2JZBDjfrQJX62PDrT0KyetxLqo6WdDzrZw85mVOD0CPdVb/msILTpubOxthi?=
 =?us-ascii?Q?pAhhbKRLt1PkRPXB8Oz/qayyGxlI/360PhwlrM0O4PG5tf8vdDKbdFhIYcBE?=
 =?us-ascii?Q?SD3DSd80Le6OZTTsx0i18ecl/2kuPUkL6Y8reN6zuQ07Gi3wlJDOl0Ltiz1D?=
 =?us-ascii?Q?8/Mu40I6P0wUyEUDoym/pyFOWU3StZsnM0jf83WM?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32822c2-bed7-4573-1232-08ddb2224ddb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:50:56.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL9ssn5QQJ2NyebL4GSteyiAA3iHAKsnCTdeWkYL7ngiay25ylhmMpPLFu01WgdfTeacEzHqt/44NpW0vheWQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6944

On Fri, Jun 20, 2025 at 11:23:43AM +0200, Krzysztof Kozlowski wrote:
> On 20/06/2025 10:41, Wojciech Dubowik wrote:
> > +
> > +	ili2511: ili2511@41 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
I will rename it to touchscreen.
> 
> > +		compatible = "ilitek,ili251x";
> > +		reg = <0x41>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_touch>;
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	lvds: lvds@2c {
> > +		compatible = "ti,sn65dsi83";
> > +		reg = <0x2c>;
> > +		vcc-supply = <&reg_sn65dsi83_1v8>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_sn65dsi83>;
> > +		status = "okay";
> 
> Was it disabled anywhere?
Nope. I will remove the line.
> 
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				bridge_in: endpoint {
> > +					remote-endpoint = <&mipi_dsi_out>;
> > +					data-lanes = <1 2>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +				bridge_out: endpoint {
> > +					remote-endpoint = <&panel_in>;
> > +					data-lanes = <4 3 2 1>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	usbc-cc-controller@61 {
> > +		compatible = "ti,tusb320";
> > +		reg = <0x61>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_usbc_controller>;
> > +		interrupts-extended = <&gpio1 6 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +};
> > +
> > +&mipi_dsi {
> > +	status = "okay";
> > +	vddio-supply = <&reg_sn65dsi83_1v8>;
> > +	assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > +			  <&clk IMX8MM_VIDEO_PLL1_OUT>,
> > +			  <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> > +			  <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> > +			  <&clk IMX8MM_CLK_24M>;
> > +	assigned-clock-rates = <266000000>, <594000000>, <12000000>;
> > +	samsung,pll-clock-frequency = <12000000>;
> > +	samsung,burst-clock-frequency = <891000000>;
> > +	samsung,esc-clock-frequency = <54000000>;
> > +};
> > +
> > +&mipi_dsi_out {
> > +	remote-endpoint = <&bridge_in>;
> > +};
> > +
> > +&lcdif {
> > +	status = "okay";
> > +};
> > +
> > +&gpu_2d {
> > +	status = "okay";
> > +};
> > +
> > +&gpu_3d {
> > +	status = "okay";
> > +};
> > +
> > +&ecspi1 {
> > +	status = "disabled";
> > +};
> > +
> > +&gpio1 {
> > +	bootph-pre-ram;
> > +};
> > +
> > +&gpio2 {
> > +	bootph-pre-ram;
> > +};
> > +
> > +&gpio3 {
> > +	bootph-pre-ram;
> > +};
> > +
> > +&gpio4 {
> > +	bootph-pre-ram;
> > +};
> > +
> > +&gpio5 {
> > +	bootph-pre-ram;
> > +	status_led_controller_oe: status-led-controller-hog {
> > +		gpio-hog;
> > +		gpios = <4 GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_hog_status_led_controller>;
> > +	};
> > +};
> > +
> > +&pca9450 {
> > +	bootph-pre-ram;
> > +};
> > +
> > +&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
> 
> There is no label to override it? Probably should be added.
This could be merged with previous entry.
> 
> 
> > +	bootph-pre-ram;
> > +};
> > +
> 
> 
> 
> 
> > +&usbotg2 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	disable-over-current;
> > +	dr_mode = "host";
> > +	status = "okay";
> > +
> > +	usb1@1 {
> 
> usb@
> 
> Why usb1?
Copy and paste from other Kontron device tree. I will rename it to usb@.
> 
> > +		reg = <1>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		usbnet: ethernet@1 {
> > +			compatible = "usb424,9500";
> > +			reg = <1>;
> > +			mac-address = [ 00 00 00 00 00 00 ];
> > +		};
> > +	};
> > +};
> 
> 
> 
> Best regards,
> Krzysztof
