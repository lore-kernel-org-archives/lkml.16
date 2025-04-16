Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB461CAA98;
	Wed, 16 Apr 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814587; cv=fail; b=PLsbCztrpydhr1Lu5vXq77jOQ8+4IC9sJXuOSdsRMpScBCurq8pSqodL6Sh9rIxOq7KpNrr07SNblDkchdOkAvk+goPj4FGeCR9PLiX6zFnrje5gzvAXLgcwTjy18D/1vHvrJWMAQxVj9POcSmZ2nbmuixIo6TH8Tl/nR49dp60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814587; c=relaxed/simple;
	bh=PO0Z1ptazCBXQ0je8BKMYHCTfxvQVmvGBk+3ukLwFeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t//lgf5uFrY90DweayWyoM0tn6WeiFgAKF0mQbihall+r+YDMONyujdDDO70cMPWcQ+uv4jY/I+m8DA3YUhqeBonXYr69xpFBZEIwcOP238As3iPJUJVhe9LQY5eyP9z22+6Y5ZaxC4mVMTjviBZMm+6kO7CwL7EYDQBRSuIH3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ao1mnL0R; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ao1mnL0R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njevVcvZj5ZR2KgLJ4lR8Fwx5UBixrakBvk8ZWlMjnAkUNgjfQg1l/9ggrV7E+2sOumQuPFH3LZzNMD8fvAhgfBaRRKeRk0JyfUFbeAV8rbqT9za5AWOESiUpb34MHrGUEjtU6dXWGwurluUDd3RuU1UeAR8pzh/YVooFhA7dN18PO8Nro0iCpU+gTXeidKKqg8rKLYt6UCg28r5WrJyzryLLshEwMM5X/0PMWumFXxxjwqmDuMq/MqmymZ1EccobGchjmzTCiaDFIbss9Oi+IQ5NNKwdAWCy7x87niX7DEWpaYwZe06/hEEVpHFAVNq0l/M/u2YedCpR8Bs/qlZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U26IDWQsBDE1r69nHOhHF5X3lcKeqkg1hQkQfbPaw04=;
 b=U7VHjxQJFnGIhnBYgGcdqnRDMcBJ+MtKMLhcljhYTnLBRGoy2gp+u2WVWSGLxYAs90HePNPTtf+fqk75NNZE9IyaEX8jaaEsPTDpXAgAiPc5oHkInruD9rLAzOJ0ynI+p/0v1Xum3sddCbhmX13nLVms2Ldg9/yjHt4ql+8uDCl6XK8wXcwLFk9WldQTgAkA/u598+uJaAy0Sc+a8ivRL5qK0XIEaDRR/cHr8hhxwyMQDweZfYyohdC2coOuQOnnMtHmuv5eu6UJrmFzXB1S8oITLlienbHdwWMRMRbD8hRz5Rbyl7vovr/pVVUGo1aV6g/ydTnzQ1PTphLvO3Evuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U26IDWQsBDE1r69nHOhHF5X3lcKeqkg1hQkQfbPaw04=;
 b=Ao1mnL0Rvm5WmcRRHBgHE+4jn4SE6Ve5qcuqtkKjc0G7bulaJcTSk82EsQ9yWkW7yG8YGVIkt/j7acrHZYdFWvENRqfZDeiMbnEWiJaus1a9zIhpQUsfqFCPwB2IRFYErSwZgHNSt6yWultmpAcLyRYhF2+7qHS+K1+Y0jqQJupH5HTK68Jm33+VgHUVqwtbUIUCI1bWZAD8cOoJDdI+QMMpLxSh8jVvd3uLgzxbeyjapTBy4CGF3BGP6cJe8/mBEreNoPfdxn/QubSSCQ2+90wARsrXjk6MczJOksvHyCYHAPxtLPhRYSASwRCas3Uft2Vf8QqVnTxuzYwViiuj9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10732.eurprd04.prod.outlook.com (2603:10a6:150:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Wed, 16 Apr
 2025 14:43:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:43:02 +0000
Date: Wed, 16 Apr 2025 10:42:55 -0400
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
Subject: Re: [PATCH V2 06/10] arm64: dts: imx8mm-beacon: Configure Ethernet
 PHY reset and GPIO IRQ
Message-ID: <Z//B77ppZx2Xr9Dz@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-6-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-6-aford173@gmail.com>
X-ClientProxiedBy: PH8PR22CA0012.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10732:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae94f3c-ccc7-4d08-e5c7-08dd7cf4fd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tn3M3A+KFqjTBgRtDN5S57SguGVtsnlA1VWbZVIyX5Wa5+fimc/5IGNQ1XX+?=
 =?us-ascii?Q?fCyAyEH++X/TVL/rSEgl0FpUJ1sgVUimRgbMHGgoNroNx6cO5SEL8bO6zK0C?=
 =?us-ascii?Q?7Z8SE97txEf+TrIGUOAWpC0WCXwTOA4E5u5Qrt2j/qBNVdqbSMcss/CxTmBh?=
 =?us-ascii?Q?YVw+DGopCE1WvFDp0BoaY5xycRo7qeHBsWjD73Dw4KPs/ou1Mf3zEB+0zjJK?=
 =?us-ascii?Q?01xshlKiiX0H62gS02nbkFXVZyFHUk8czYR6j5pX4GyIENrjhIdBdSPlEBhB?=
 =?us-ascii?Q?xFs/l8OUUYAafIR6og5HL9a0KsRbwD/Cr+O1Ve4LMnlHg3OgOAr1NVF2pRBr?=
 =?us-ascii?Q?kj7DN44V0ANyawg3X1fO7dnNuqnpSb2HZA+3meYyvAxkGDq4bmg3WLZ58xqv?=
 =?us-ascii?Q?QZkLU9ABySJf7fbhD3qXScfqU2wTMQyx+eXUM64rWQj32GpmJT6Mj84qDP8I?=
 =?us-ascii?Q?AZWRHJFCmSZgUBdmMBcOUe6cvlKd0ST/9ceZaj/h/U0PwXD/15vqLLaJm6uO?=
 =?us-ascii?Q?XoN0gA0ORwUwgVW68UuaqcJi90SrLs7jKqg+IAUyDsYMd6FlUqL+jML1tyCa?=
 =?us-ascii?Q?dA+0UaOX4YXN7fpE+KNJxzJHMDLmVjV9z08aBuBBztItNHweeHt98C/3/NEf?=
 =?us-ascii?Q?jVb9RJOTdyDgNJcG5UwyWnTDDPjQcZ32sKp+mjb+xfEd+p+nBSu1Zpg04TWq?=
 =?us-ascii?Q?DKbr8DFTQBgul7vnk0igjYDChhR6rnMcDop1O5KN76fiGn71YHX9knaUj0o8?=
 =?us-ascii?Q?kGP/wNA+jz8CAEusrqwbmXMstRlxnPBINqdRVd3XCyTHq7OCbbgWE0fiuh/t?=
 =?us-ascii?Q?M+cbj2IqatRXVVbX2zqGit3sH3Phvqi3EFAZm07M0J5bQgHGd8O2fv1mVSGy?=
 =?us-ascii?Q?GWMsjbLP40hamOdnWeks6xGglMj3cfMqrxlCmgv7b0wnBKeJxPQDzp3uKgwF?=
 =?us-ascii?Q?AOTrT/xfh/cePuGcT1fiEu3It2EeuvikPOElHbZSADZg63ZrknvjzPEKu7Bq?=
 =?us-ascii?Q?muy94E35AcVxl2ebaEEiOpyrNUyvGwP9pdVbmLqAvW3Tihjr18SHH+sTrrZw?=
 =?us-ascii?Q?c/hUqSqUIkP0q/jkUazf4h4IYFuPArh7r2imXWIbCWkYmHlJHPbJLhCHwNxT?=
 =?us-ascii?Q?Ydljg1+TOcMaWGbM/I9vZLyyg4paSLdJh2nK5Zg49kLLaiEboVMMHsjFZSsF?=
 =?us-ascii?Q?KO/RuK5rs9MJTJVDHn6hJuVqLRK1tNtEM4nFcVAIFaecaZTonAvAhNZzsO+5?=
 =?us-ascii?Q?Cs6RvXuG2I63QHETw0PhCQ/m8psV2Pz7bKHz+Nq0uM6GvNP2+77WeP41z7K+?=
 =?us-ascii?Q?MHZsmeVhJvmS3UqEeHlGxULLRNtdf6NYA5eIyHyj42FuW2ND8/pInLW09t1u?=
 =?us-ascii?Q?CK7sRBNXobl3XC5YrChYBAfkocv1uO0OyGl5LV5fUC3AXCMZqWzPCz8qDooc?=
 =?us-ascii?Q?wniMjoZAliD6neI+Syjy+xvNEVoH3D46bra87D0gs7Kb3vxhqpdqfQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q2ScOKn+Lx6nhYvr0O6FQZkgqd/qkLvCjSfzzHo3dYn6j82hQzl3j1qKOJ/V?=
 =?us-ascii?Q?N5TfFHHg/jBo3FZk+zKIKI5AeOv4+yu0sebNa1+R1o8wcY7tMbQpo3gNgKfi?=
 =?us-ascii?Q?R4JuJyNNDDXot7RFiKPtRl2iQomFNGHxHqvkKdYr46+bFPBdKic7RgyFtKVC?=
 =?us-ascii?Q?E8r87C5gq6ceY0m48IwA89/S4E3GizM/Kui29H4DLHpm/e6EUKbkpJohcDfY?=
 =?us-ascii?Q?loOLN0PrIg4ALGosQ4Ne7fgFNLKQ7m8SUYW1Pd6p700rEd77xbyggmlPZdY9?=
 =?us-ascii?Q?1mAR/9fdkdMs0+Q0F9tXCn5qHSPoQflWwWgc4R2hcp4hUfH12iBMHNsRy5ZR?=
 =?us-ascii?Q?98YMH39x1yIAoa5ZN8EjIvQxZxjskif8Wpk9aXO2JKHWYLIO/Y3H58J9h22m?=
 =?us-ascii?Q?FMGai9bjPcu5+y+7Q2nNccyimBGiAoWZ7Vm/y45hR0mX7Fw4Cxt+OPFl55Na?=
 =?us-ascii?Q?WtlxFtn/SXp3g6tzBsrgdN4F9mJ6WIt2Je6p9PFw5Lz5ToDb/cqHveX+rqSz?=
 =?us-ascii?Q?qY/Pe3/YNq02cTgxIUQHsftgtd+nMEJv9tlXs3FgUb4uSgaiYtFIP9yMWtB/?=
 =?us-ascii?Q?9vNfWGv2TzoSYWNcs32Y6NLvrjujdWK2McGNM+eYq7OL01r7uxFtRWrMBAv8?=
 =?us-ascii?Q?cAShtze4cU3lykdjp46gZqz0hM4JgeCMg8aWWorE9o6gewGLc11iKkLcQOxT?=
 =?us-ascii?Q?GF5gvS5vU9FYcU8hQExxa70C+I82mHYLNSGSQdXlcy2D/SjiBmTcCeMp2Gnt?=
 =?us-ascii?Q?+dCUqxfleuQqGhCx5/BDV3aklKBTs7vUydDqu9hp0gVL3GV+FWUmvfEyAx84?=
 =?us-ascii?Q?qKkLN1JEdWL5Or1JILRQ+DKT1U+qpMSEYmSbDvFN+Z6x0iHhRjhb/EpMF21G?=
 =?us-ascii?Q?YMuNAc/vBRsDhi7JtIHqqsLu4B2Vi4pJXYblfC16O8+HHn4C9+G0PL1b5A2h?=
 =?us-ascii?Q?qqRBku7wynLbEovHMJfCyJym7U8RJFRDTW1CwrSf2e8EptLJJtEb3NpWMl3I?=
 =?us-ascii?Q?+M6CoOVSgbd9UlIes1fyZRaDSSEh8epbZ2GM3bg41omjzhbIcTMOwmwzzNAI?=
 =?us-ascii?Q?fTHPgzBWx+AW44K6vUQyedplPeTHWE3MCEZcgcakqBVJqI9/gCCagCnE8l+6?=
 =?us-ascii?Q?YOYTSer+C+hPy8FwSS6U7i5Ybe4PFFBTihKETPVR7XncOjBN69p1h2+6lglb?=
 =?us-ascii?Q?2CKvVWcp1JqzvLEWdp+WBm9sAWn0gbafhtLS0ALj2SRd+buMR7rybXlDmhMq?=
 =?us-ascii?Q?g8Ai+WCu8+KNX4X3ZQIHASSbhWy+34Ak6nVnEtBhOIGroMxkRjnZMmywNqe1?=
 =?us-ascii?Q?lMVSO4NSMSFLN9uT5HgICfhLZ0b1OMS0beEDrauyJORvap7CP4uA+vFJzLq5?=
 =?us-ascii?Q?TBUu9GmGisLA2l3xAgzFFHE2DfzyB+LLkXXQVK8TL8xME0Q7q6ewKLNPWA9Q?=
 =?us-ascii?Q?BrUJls65pDjpQpr9OdL710fmRZEp1Tw5xTgD5ja2srenk7hNWtI0GZdLC4FQ?=
 =?us-ascii?Q?khU91sOHprRzKLHjhofkvuIe1lMvZuJV+JpgHLJ9Jg+AZTED2AqQ3P2DWcHi?=
 =?us-ascii?Q?TCdj6w9nhn10GCO7xP8X3gBvyAyhLcOoZ7t5osSb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae94f3c-ccc7-4d08-e5c7-08dd7cf4fd2f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:43:02.0781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BNvIWuv4rJnf+O1f9jI6zJYzRWuDa0DausHIWe5eQskN0t+dQ9D+cPbb3WS8envpWEPNfgHJdbEHrA5s9+/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10732

On Tue, Apr 15, 2025 at 08:01:32PM -0500, Adam Ford wrote:
> The Ethernet PHY setup currently assumes that the bootloader will take the
> PHY out of reset, but this behavior is not guaranteed across all
> bootloaders. Add the reset GPIO to ensure the kernel can properly control
> the PHY reset line.
>
> Also configure the PHY IRQ GPIO to enable interrupt-driven link status
> reporting, instead of relying on polling.
>
> This ensures more reliable Ethernet initialization and improves PHY event
> handling.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> V2:  Update commit message. No active changes.
>
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 9ba0cb89fa24..ed7a1be4a1a6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -78,6 +78,9 @@ mdio {
>  		ethphy0: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <0>;
> +			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +			interrupt-parent = <&gpio1>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
>  };
> @@ -315,6 +318,7 @@ MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
>  			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
>  			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
>  			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
> +			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
>  			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
>  		>;
>  	};
> --
> 2.48.1
>
