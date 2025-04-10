Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2051.outbound.protection.outlook.com [40.107.247.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DE1EC006;
	Thu, 10 Apr 2025 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301657; cv=fail; b=uamwGiIhYNf0ym8IYklGKwSHhZm5cusfygXuSJrtA5SvN8eJkyPLOnfVUkOSJIvd/4qL0ObLiWyIzNJrvVP7e11t10/jGn4mOC0CNEByvR8F7KVrEytnY4WL0W8rOPYyWrAKWhxpvLCxVPhrTC/MtjqLvDAa09NVvFItBpkaXTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301657; c=relaxed/simple;
	bh=iK4zw91/TxjCXEG+au4Ia3E0wKTOqWBFSp0Sl/kfo8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MlHWY+jVnpAmzSnCHBM0Lg1UF9dKgkbf/xQO07b+dxeYUOrfZYCn7iDKhbJFHogIuWF2EyCxZshIbMlAN+MBr+H5QE/uaOmOV90ew7qEUpoWeh1Jf2BPR4y9J/LLqhM4FKN8ozrzru5IN3wAJ3gZpk8zPD9xC/uE85OK9B1NFh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DbLTzQeK; arc=fail smtp.client-ip=40.107.247.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DbLTzQeK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM/7cy2frBtx8NVJWX/sGwL2D9+csJR+irCS4IoaM7sgsAwU8sXeau3e+rk1ZliBRzFNvqC6y8SW6ibzfNkTgf1gGkZpVvOt8kHMT78whqgpO+LxEiydNcMRf3oO0j3w9HcC/nKDYZhZYyxIGnpHVabQeZy34RUVn0ZxqVAIJZFywAZGwID5Z0X0qhXnI7sMcfid8Zv1PURTo/64izByJawzc68NVjh8KXf4RlLDjwy1/QeDG7y4amvx4f5kAF8E+HncZJxcftvrPjJ+7mnE7IhRkRgA6tJ48KXm0fXwaAjY/fv9yhwdh30Z+ze8CbQErHhoZHFqQUv6EREo/BQA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ILE8H9NQb63ud9M/Eh8usfRsdP+E505V1P2o4Q9l9k=;
 b=H6G+/03ZKca7izQ+SkdRcmgLZf84d1Hi8pm/eB0N6G6sSzzfGvMA9k+kqRq+/AaJtrRr8sHMM4nr9zpl/J9Na2lYdqnKXubgocoAH0gM4+kPJ8MN+THo3TLjUiU1OpOrb3R+GYu3PU9IfCigmC1g8To2+SnUFnRNlXPCdH0RbgxLzdKtj0Yv4lNFM558LnZo5KAgTthznYWHvR9F93I1UWE9DMlc7o0J2UlMlGeeTk1Q3IOuZBApTskGXbpuiaomEyQkSr+4U3Ci+RCdcHh9fM1gc/PzQurp08qicIHO+ICP/ZFBj8op01M6PoXGvZH9qDfNPt5Jdg2rsBE2FgF8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ILE8H9NQb63ud9M/Eh8usfRsdP+E505V1P2o4Q9l9k=;
 b=DbLTzQeKxZ31joh+UMkDZWyzIcuDOo+iITNwOrBSmS3pAAI7YAYmNjS8HDkgNSZRgKYdMRLjKOenQLk3rRq6QkQX53Fz4N1QGNbBY/0GOgH3XOheUEbSBCD+quG7OftS1qYtI+MwdUSuUXw0irLJDxTlqhtXwZHv4FbwBpkZONiQ0jdraDGh6kj1qrpjexhxM6bVlIhd8ImsFWLksPd6STicxxpqQt5En3p/JtNfpF50nmjr4Alazoh1L+CSkenACkx+kWYVetnAmeIhMYWjqg0PUl15bvk/Zwj9/+VfmfG4MPr+tA1n03C4M0pglrAGZoLBjkA2f29n1tbZ/Ut9fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.38; Thu, 10 Apr
 2025 16:14:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 16:14:11 +0000
Date: Thu, 10 Apr 2025 12:14:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] arm64: dts: imx8mm-beacon: Enable RTC interrupt and
 wakeup-source
Message-ID: <Z/fuTHDdrbp2yApZ@lizhi-Precision-Tower-5810>
References: <20250410005912.118732-1-aford173@gmail.com>
 <20250410005912.118732-8-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410005912.118732-8-aford173@gmail.com>
X-ClientProxiedBy: PH0PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:5::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: cc28ad3b-7f66-4936-2a07-08dd784abac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lCXJv7gtFhzREtyLua0gwL1H71TQa5+9zkXnGVccEwigeDGaAZBSD2LjOdKh?=
 =?us-ascii?Q?+fb7sAQPjSCZHcOEMTKDpHOZ7vAcIN7QPmc4LCK1ST0qhtowugHtvnLLISAO?=
 =?us-ascii?Q?b/7WBpCfSkWvIo95X9NAJLu0llyh7IkNj7JCsNMaCL2JL4aCkJlJTWrBpkwZ?=
 =?us-ascii?Q?Membnn38CO1BKjvNoEJd2c1qxT3gvq0CzDmG4ai+k/6kWQTPUKvhQvjUXI9q?=
 =?us-ascii?Q?lGedGjxUTLSTa9H6f0PeUZMQWgAx0uwVkdYCoeAW1xQ6ApBF9YxYQotj41p7?=
 =?us-ascii?Q?lqQE4eVRfRkIkcBIeq/AFoczkLoYF4DxGkzrnKDu3EyQKNqu6f8fSlybfMun?=
 =?us-ascii?Q?xwCfbqCpjIWGN8LQlkPkqBetUgILhWxOlde1qyWCLmTIRpyEITii7Lcn7o08?=
 =?us-ascii?Q?J/PX3+FLdL+ZQplbDShl7ubAa4RZ2Hs4G7PLJnaPZ8Te/fgpFOTMt7JZzR+Z?=
 =?us-ascii?Q?tIxO/0Dw2mH7cdGieAVbyjXP+ARSRQtE7q5w/E6RuUyRf56JyxbrRQNWopEE?=
 =?us-ascii?Q?1SMqXwinybYFnn4YqrrI7CMqdz/apPjFyKLRwdmPbSFQl6I8S1Lq3Hm23xhX?=
 =?us-ascii?Q?E1g1rYO1rxBR264imX+NgPJ2+tEq/LMI+VVGq2LGUsziPa/KFcJaLMUV/yAL?=
 =?us-ascii?Q?h8J6GmwoA/XW9W+rFO5IEFVw2AuUNGMvYuFIbO+yUOOmmIirqwb9NEKxJXrk?=
 =?us-ascii?Q?dc2I0fheLT5Zh+2/39YR9iGNQss9GPh/8RR4AJCMLOgY2yUuyfVAnzFIfb69?=
 =?us-ascii?Q?IMkQoN/MvXVOfU9ZAGNqgWm6BBmd9VCHj3e0gdaXOi97XiurPH4ff1BqKy4j?=
 =?us-ascii?Q?z/OHdPDocpp01JMekwu3Dxo8zuFFqHptJIymTW4MnN1v1pGSkToFnQs8n6xs?=
 =?us-ascii?Q?SCZ78vutu5ksQXU/pMiP+1h+6REcRE7OAG/AfIqAzonf4v21Aur+H6mHDTWH?=
 =?us-ascii?Q?2VYU0dY4cWa4YhGK+noSs2KEpDC75W/uzF6LewWk5DrrzlMHFTB/y/InSma6?=
 =?us-ascii?Q?NZyOqYCXwb1QFNIA/6MTVY+oCiGfYPu77w6S4HFQNSTn76WDg1Oj5tEdFug6?=
 =?us-ascii?Q?ty+JtbEQqrcBWLQLRsQT4vfh126ekHxl2Ugq7+v5CSZeAnR4SPifraNWnVud?=
 =?us-ascii?Q?cUzpNOOWLUI+hdZj2xDu7s1TrwXR9ZZWEvbMeTu0J5Kd+fSLReIzgjmaGDMQ?=
 =?us-ascii?Q?qoqD4mpE2KcfeT1bGtV6A64htBcnBB2f7laxyBaVXPzOcz6dtxacf6rAznuM?=
 =?us-ascii?Q?slhhjpkIT0Nu5rkfCz8P0PC3JgbMlwMwubC1IBir2EnbzwznItE5thiO9NJa?=
 =?us-ascii?Q?LJmOh0CRfzhA/E8NqCuKo0dsn0vtbTTklOnQY6VDO0tXHoPJGONdI7Krc+Jm?=
 =?us-ascii?Q?1V6jbVMiZQYWqhQ7O+7gtkFiaBUazTDP9VMHHJhjh0AeWoZgAy6Rx1Dc4OwN?=
 =?us-ascii?Q?7QTMJQ6/Nlx7GwO+UyJUzFlaMG6+zT1FYfXictDB61FIa1vP8EtmCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dYjOH/Izp+qXvWggeCpFQMyIxhrfH2yF9OGzVV/F2a0e4mslQF/cKcpCcGLb?=
 =?us-ascii?Q?MWsgcyaZw9cbZQjik0c2pP0O7Jyra4/61OjSwE49dU2qctXSjWH6cU6LKPK2?=
 =?us-ascii?Q?hhazbymbyqIvBa+kkyTjtdOPS49QEa9NG1mq7JcuZpbVGg5u1BJVIPlXTQZe?=
 =?us-ascii?Q?sxsDCpg+qSjywNjiNkkNkISM+1lTsyOIyB8bjEWwA5zqZrtYdYnpS/99qLj6?=
 =?us-ascii?Q?GZ/gdST3/5gBmMIvu5K50l6VyNgEMc0r6PGlkR7fnroShjtyUH5/GH+NNkPc?=
 =?us-ascii?Q?fdfe4bKDAongjJGubCROfHw3Wmh9CAzAfqREVzQg9DoW59ogj2R9G6Fxmaac?=
 =?us-ascii?Q?1aa5C2lo3V1pZKVvTpzfCeyKAs1P8sng4cMzPO3kUsuzpPRk/al4kIGYmbBu?=
 =?us-ascii?Q?H5oj/u3csRgTWCKuOYxVBlTioZGMshxIj9/yBqu1LmtsP7/qfTFCqI81Rhz5?=
 =?us-ascii?Q?bm+usB+2TqsZjk25s5/7Gld7LB+JUP2IcgUMXsDFoPac39fTXKOe9Cb99nsE?=
 =?us-ascii?Q?CDFRRWdpJIZv/w0h/+ckoF/ffp62vhpdU7ixnuVH4IFZD5kCVvly6wMzf1mK?=
 =?us-ascii?Q?hTzRI8YULlf9rUkttnkuz3NP/ABX5mqctbs62/oCKQrjaj3RHCJ/wYHZ+WTE?=
 =?us-ascii?Q?OhqYZQl8nPY7xmvdXmSn37i8YJHoE3Ijll5okmt46I5gynX0Ocz+rH8MZqFV?=
 =?us-ascii?Q?ojDR/2aX4+0wM6VhNn76qnWbMrON/Tn2vtbY+03BNBLVb35uVu6jsaeAWxh7?=
 =?us-ascii?Q?JxJTfVRWDNuekiy5D8szSSbhwjWvu9MZoYDNbXlehaGAWyKT9SehNQhBMQZL?=
 =?us-ascii?Q?ivcLEPWIDFxlPDcQd6V5/cfM9CsUP5u1cm4T6ZktRozWjK/XHkzT46/T8gVp?=
 =?us-ascii?Q?TeS1Z98s8Opslx1AfsuZM7Pe6ZTbNHGVtn9s1oxiBZ9fM/XtFdpgMwwMne3c?=
 =?us-ascii?Q?ypLD3Zi1Tk0jnSv+oU6jGnfnc4y/7bj8AxULZrCst0pZt8bt21frVv0LoeP/?=
 =?us-ascii?Q?0ToR2YGvE8Lg7gXyhFn8CbdevUROoHYRVbtamAeTM4V0kct4Bz3qL9YBLL4c?=
 =?us-ascii?Q?UfQMeOljHoLsYgQPHhH5iK4tRpafZBfIleGxj89K3hxiCbjJKjqxWSdE97MZ?=
 =?us-ascii?Q?VpuqRWuZkwx/mu2YhsA+HOWkcPevGDRv7c6vr8hwwsRKAreoVN4na6aXvVka?=
 =?us-ascii?Q?N1DFWJGYP3VAFZsqVe1qTHv7yLFy5VgoPfELAJOrSl+1vFBba0GkVTf2j0t7?=
 =?us-ascii?Q?s5oTyaHMNZmYgXQ3smar509vBoqkFaQd/Nr34f+Zr+IM1xJzruAtCeOu9Cd5?=
 =?us-ascii?Q?YbyZh7QDob41Z/0LH+wZe6WL467KeBGkvrQsF23v7H8KdgUemgdB44eQfMGX?=
 =?us-ascii?Q?nrAzEgf9VIOW1QotVgakznocoHUOPtXIOoc70j/52ciihj8/Fn0q0p9L31H2?=
 =?us-ascii?Q?hE333KDRgONd04OT8wys2rhayROCEeU8lFTbH1b/TBvhkd81WkwitCbpuwZ3?=
 =?us-ascii?Q?OfWZ2lo6PCRXNUnz+DSMjHHz1E3y81dXF59TcVkgI//Z0UqWggHJlczthg4o?=
 =?us-ascii?Q?dEw5SCoAeRI1slLfDOvGE7r3GjiTH3pIa7L1ad5N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc28ad3b-7f66-4936-2a07-08dd784abac2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:14:11.3866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/LMnbMcZaV9sV1SBCbmEHU40Q9R9KPetNXJMokxUUbPRX2xPkZTdYgsDwDSCbJdsoRa9mUlolNPvKHsCMOuRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258

On Wed, Apr 09, 2025 at 07:59:02PM -0500, Adam Ford wrote:
> The external RTC has the ability to be used as an alarm when
> interrupts are enabled and configured as a wakeup-source.

configure it as a wakeup-source.

wrap at 75 char to max ulitize screen width.

>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index ed7a1be4a1a6..8d4d1c86ad71 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -235,8 +235,13 @@ eeprom@50 {
>
>  	rtc: rtc@51 {
>  		compatible = "nxp,pcf85263";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
>  		reg = <0x51>;

reg should be after compatible

so pinctrl-names should be after reg;

Frank
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
>  		quartz-load-femtofarads = <12500>;
> +		wakeup-source;
>  	};
>  };
>
> @@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
>  		>;
>  	};
>
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
> --
> 2.48.1
>
