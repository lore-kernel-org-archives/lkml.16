Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4805336D;
	Wed, 16 Apr 2025 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814689; cv=fail; b=qDXCZNYBmX/LUbaPug+RFN4VHMiaID5VOFiDEDDfvy9drk8/7PQsYPLumMVaZN76Hab9d82FsKV0G5unZBh+DD9f6a7oyTC03lZRpIiJDVQuYzbITl7AqaxDHmngcJt0vOlLjoXeO66czLiAzSXnYS5MYTq4aw+rN4IpVyO/kX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814689; c=relaxed/simple;
	bh=8AQEf8d4JDvrBECSA9nOaboCF33RKVwqXN4TVd9diW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DaFznr9PK4i0w4Y/MAywOZXGjPSufUIyWyrVYu3prcFBXLGiUkfJ2fdcemu7Dtqx8MUVLkdN+iIcgdp3Ug4hhxxHgXi/vnyNt+USC5SrkKil007cY8YidkN03C6Z2fyOda4FqUHZsNKEvnUl85zA4coUB4bvPB6aONe5qdVqsig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K5YMRSKi; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K5YMRSKi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5Mfp91DFVUtcMYAfHQRuwcv28f6a0Oxvz0tU5Az+EuEq2Dr9LIw8IH/l9YBfFYzKKCjjBP/FOk49mXGRNevgj2UWX+LKjh8bir9XiN90jeaHKtPhe77XW25F+iKLX9vtpaPr04sn/MGxkzr7WUdlFsl9J56M7VPI+NANG9yvspcNNbKF5ggZtYb8zkyscbNA6q7pSe2eL2c393u6PxcI1aQE99yka/rB0NLZl9ONcGl8HQsCy+GTtyKHiR+p8dM34YgCZVC72QttekGwI9liRsz+I0ykxE7m+HCVSHo+iZEwfVnesR9nmDv9Zv0Aop4J4D/Oy0Xu6JgaKUtwA4VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aFHCQ+w3z1DHLGeLnKOMTgH2XFE4XyRf2A5IKQtaM4=;
 b=QnSiQO+5XerWMji6Kzk32xN1yh3mouIgr5DTNebNncTjZwONkh8zqsfQztuFH6nrji7Nh0f4fDi3xqe+W1LVuAXf3ZWzLd0a63UgNzvCPL2FmNTU8RUus6yrU/s4JCVvA3GQwiodgAgue/jE3XkPf6vIMzEbCxqfAOotFSPnIxXUfPFe5iDmFs9OyvSdZOvuOs7mrPBrA2iAIgadqJXDpnV24nDN/8zMqO6l9glAx5CRhP6YInrZHAVcsXHohb1pziGmbH9MWTq38KDA/sQG97csWyrg79Nx31ad6r83s2y7jPpcfq18jN929ebbtIwBwhD4Guyv3GCvOTZN/S97+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aFHCQ+w3z1DHLGeLnKOMTgH2XFE4XyRf2A5IKQtaM4=;
 b=K5YMRSKiiD2HcDnI6i3Z+z0HpWs/b7eQzdK0it/vTEW21PQCYKbbFThvOQpFN2qsdppXSuHpQ9QobE9Ig29zFxA47WqqlksOSE7UD/LbMH6saEnEtPFT/trTO0HrOXhJSP7zk+41KPB7eE6FcYCQ0CDJY16xoiwkrhXb1/plU45jsnNsP7rijeZOWQyV/38PH1B31Q2hCvx0xxFFvRr0f0sa2tfV4gKMfC9iQ6oAV7DBTWT7dzWClv4bv49IMyIN+Fs1gG0tv3XNquDJ4sH9By6P/ebzPMgq48eQRtv7yocWoPQiGnNHxNeHD1boLaCclH26SHcONpI81wYzk6Hy6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10647.eurprd04.prod.outlook.com (2603:10a6:10:589::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 14:44:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:44:44 +0000
Date: Wed, 16 Apr 2025 10:44:37 -0400
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
Subject: Re: [PATCH V2 09/10] arm64: dts: imx8mn-beacon: Enable RTC interrupt
 and wakeup-source
Message-ID: <Z//CVVtvdb5kU/UB@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-9-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-9-aford173@gmail.com>
X-ClientProxiedBy: PH0PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:510:5::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10647:EE_
X-MS-Office365-Filtering-Correlation-Id: 83830941-9ca8-455a-d57c-08dd7cf53a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oLxQdNn2JYsIqmkU0Dk2vSfOJ5rmApvUZ5BjBqOo7vUWg3b/r++yuCD/+kJM?=
 =?us-ascii?Q?ftI6X2jWoJB5oswDK9pV91UPQ2Xs6txzBz16zuuJM+LyuyWPO80TVx72bq0L?=
 =?us-ascii?Q?k2CJxDLHyfHwNPqyOxR+tgZPBcJzUDBW5QdB87weRBVbRCIJAhj7osFYIVbN?=
 =?us-ascii?Q?XaptR09QZa0DjDaW5hrRRnXHS8a7L9VwHpfnADK3/cVg7M3gB5OXYpUD6No2?=
 =?us-ascii?Q?JTAXA6uP8gg2bZRoYZpI1l/u8tBc9WronXga1wvsQaHFUu4iFlrp9umUR7tC?=
 =?us-ascii?Q?vKF0b2DpquwkSL+QI8gSUJig2YFQQO2kiQyTBajzBmVFXJYuX+AMVLVbetnL?=
 =?us-ascii?Q?VeUURRDg+ZmZuB/R8F94O9u7lLQVNaT0RYQfjaJsE1uZh9HFBgHnm9hvf14x?=
 =?us-ascii?Q?UqH+wyzTA726XXGNvGnEypNO25VAQVlvuGrQ11Irpo2X3qCVeHwsxThJuvlq?=
 =?us-ascii?Q?lAvMTwRual7oKnaBSas9jP2g9Ly4uZN0RH8sI0FZH51HSmyieFFjqjKnhaTC?=
 =?us-ascii?Q?uGwQdjjn/VzKVy2I6hUdzYCeaM1GMIYJe+DOLvJt7DsqrdIGm3U0SNOtfjLG?=
 =?us-ascii?Q?qrqPowYg3t5nhvddL9UGTCq1oBu8MMCf2SG/awHaTwUP+otV+OfRhcmf0oyW?=
 =?us-ascii?Q?19J08gsXU3DvKMfGA73vM8hjRSGmMzWEdrDhdAFAh6MKuV/UbQV4hhGHAJjJ?=
 =?us-ascii?Q?5m7d7aH/yPLrriph7RUaO/C+8dur7t+XSOJTNw0B5VwuQE1maQhvYWf24qoI?=
 =?us-ascii?Q?T9h6RUd2kI2ipkwtGRT2HuZ0IVt9XcDURmv1mNgzUJ5Ig4mrUoXAOEeMDOsD?=
 =?us-ascii?Q?n7/rbQNW0rV2viy0Ipi7Q1de+O41+v/345bCeqc96yMAc4s5n9TcsOVzvpjg?=
 =?us-ascii?Q?MBcyckorUO2/OgMWET08EoF05MvD5TUHMSrIEAcXWKQDH9r2re2HIKIL1yBi?=
 =?us-ascii?Q?gDLAxxWwEWQ1ddOjTnio01X0eMf7sN39UH/WofQcIkTuHB227jrzaqoBQL/M?=
 =?us-ascii?Q?RXO7d8k+L5NWzp9DgWRvX1BSYTCBwM1V8mWKJlPDZmYLiqihnZDcht7nSvaj?=
 =?us-ascii?Q?iNEuipa7jEz7O5Q4chpv1qBFp71GkWxezcOa39JDN3n4ET1//iOvKxI7yg1Y?=
 =?us-ascii?Q?tnQA3eQsGxhJhEBCAGxYR41W2tVxB/OoDDdbmKI+co6SafiAaTQHseQ4h2Wc?=
 =?us-ascii?Q?jIfzeleKL1NyUOPgfzotdoPPcsOte44VAdDMxltqjwEaY/s/fCRCE5g0gOEj?=
 =?us-ascii?Q?IIvJqhKzU+3sn17EqmT+r8U+UWXjGzcxPcPaps7cY89aPt+WCitZMfpPUTXX?=
 =?us-ascii?Q?P9F5MAPyQGZ4llNZpoqaZ/HVJk9cnmWXPF595Eart/6+M3FyUJR9C7x6GWf1?=
 =?us-ascii?Q?ATJU4E+hoZLfI2/m0FuAp3gZ4gPTxL/jHIOvALmf7aM2xcjtA5djr5qnrvHd?=
 =?us-ascii?Q?6CHn9UfL85G4SrctqcoUo4N9YVqQAnSXsu+E4F3jy+4tyMMdRwcS/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PhflaJ9Rijcu7uhzBzEJasbLkVAqxQpzfewZmidVV/2HJ0LIP4ZKoqPdC6Vv?=
 =?us-ascii?Q?kWBkHMXPFYuheyHKlfQWjw47skQfYGNdM6j7OaZd/o7Hx72Ed6O5whBbFyyC?=
 =?us-ascii?Q?PVY30viMbh+nlIXf+3lQ7/Ve89uq0oyRPgMBOJTBjL21JXZOIliN8Z8xdlRl?=
 =?us-ascii?Q?XluFudc1oAq/3YQRq8IKYpp9RNMg/dYehh/ISGK2P1qzy57zfKRjimMpu3pj?=
 =?us-ascii?Q?ODiv6HdVaOr3aGP0atWQerlXcJnfpQ9H1cywczvW89UQrsX/w3DtV/EHaihf?=
 =?us-ascii?Q?1G3DvjmzaqoaQsOqjdAXmFG9xYjwPPZjW9T/HNJqS+Bhnp2E8S6YepsQ+Vwy?=
 =?us-ascii?Q?a1awECLKHXj2V5QZnh7XYkHuheVucurkz56rhztn0IKQJHEMCpVdE9rs1kEg?=
 =?us-ascii?Q?amsdjyxm986RGGJVypweL8jLXfEPNF2mLJJJpAfpCqRFk+L8x5M8BPiiWQMd?=
 =?us-ascii?Q?mSphV9jqcps2gUIg/+rpfxIBdTcpNMjthn4U9BtADUh+I/lR5y0i9Ej54cro?=
 =?us-ascii?Q?kx7BmWM7M0l7UmxadRDZ+z8glpes4cS0IyEmDNEZQbNaE082TcyE2FnyQC9L?=
 =?us-ascii?Q?8BKACs41rn8oKj+zMcIoWBA1paKSCNO5yza/kpn3bGtCvhu46vAra0sB6SoK?=
 =?us-ascii?Q?y0QbQCEfn+AKd3nV1FgCPsQGsOI4T5w82W/+BYRJNIx96Aj9yU3IryIB2zUg?=
 =?us-ascii?Q?YMl45HZRpOjU3CNTcEohSEU+8etAGJhdbfnQfUGsm81qLljOMnA7xDrsFLEF?=
 =?us-ascii?Q?mdILbT22uzuzPbamq7tbzmtp6xdCI5lQ7rUUxV0HYGRHeD3DArMa5IsXW9uz?=
 =?us-ascii?Q?UwzIoWtqmBk4dkPgsOn/u+JnCdSuaYBa50MX7u9MCHlg7/mmNzgdSblzKfaW?=
 =?us-ascii?Q?7xLOq+4yRuoTDdPvggIyo6EZspVyGVTQt45P/cSa3m4btcTn64JiYcYcjVSV?=
 =?us-ascii?Q?YfevQ4f+we2qLAz1HqDF/z/XEMLlTnfriGm/fPnxVL9bvrCQaTGGobuP4hlz?=
 =?us-ascii?Q?dc+IvoK+khNTFb1sercqC3Vv6pO4DpIrAeBOAy111vMPqcwSw6DaScoJpAWD?=
 =?us-ascii?Q?VrsXj0ITixijFxz5Z8+9RcBg6AcJLqQ6WODkxQScQ1KGNYhObarq4HXXZUJm?=
 =?us-ascii?Q?9+fNRPzufh0RUcET7BwjW6qXY99OzDg3z8ZprWnoaLFmLP3QbBQW6vP2B7Wr?=
 =?us-ascii?Q?kH9jiSFOBHHaiPQ5RhOOi7fMaK408iSusSTdVFctYthpa4BsJ0E4e5DJVKWL?=
 =?us-ascii?Q?CE8yPqSKyPG8OV+gpqd96zxqS1UB2PY/YbXEstyBz7DcgE+lvXRMIlRhdFOe?=
 =?us-ascii?Q?RisboaxPrCA7mQ+E+pIhp6ZtamXH15fiI1A//WCDaOEGeDfpl+zZZpMPx+b7?=
 =?us-ascii?Q?rXqZmNpkxh4yF+LRd4dkTnbMw3u3yi0BVQ7UIWqEneOkHNk1l9L24qtv01dm?=
 =?us-ascii?Q?gIYQb5F607PT5/g1nOpksvVZNthIgAgWav7XSCdg3+Y3yIiMM4JSMBYLYBSX?=
 =?us-ascii?Q?gHQpPA3QoUFA5LtsbQ9n/Ny6qQPmZeL860OWqttrxKcG8mets91KH0a9udeW?=
 =?us-ascii?Q?hOFOZdlnLLNgOEvhv5NYU8T9YFQymalVAHA8DC5X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83830941-9ca8-455a-d57c-08dd7cf53a54
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:44:44.5708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oh9FMuWxGaYu8bLdYBhR0SiWm13M4Cc7DYpw6p36Vh0e5reAE1WBvk1x5G4Q2t9xkVQKlId7NlmQNSRkgx8G6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10647

On Tue, Apr 15, 2025 at 08:01:35PM -0500, Adam Ford wrote:
> Enable the interrupts and wakeup-source to allow the external RTC to be
> used as an alarm.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> V2:  Update commit message. No active changes
>
>  arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> index b3692b367a42..987c14d3af9d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> @@ -245,7 +245,12 @@ eeprom@50 {
>  	rtc: rtc@51 {
>  		compatible = "nxp,pcf85263";
>  		reg = <0x51>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
>  		quartz-load-femtofarads = <12500>;
> +		wakeup-source;
>  	};
>  };
>
> @@ -365,6 +370,12 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141
>  		>;
>  	};
>
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
> --
> 2.48.1
>
