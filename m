Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B20F205E2F;
	Wed, 16 Apr 2025 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814607; cv=fail; b=ExoAp4NnpgA7uyChr9tgraHqrXAmRtFFvP2JNFi2dytBZJC9A3/fSICfPE3fPedfBAUGyXp17SrbkFqquwQwPSwwmT2qMp/Rc/126PjS4G4x94NSnpbvXWlQs6bs7CP8cAnDyaXQ/oDhPQsSRJaRN+PjpMStCfUPteoZQc9uD7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814607; c=relaxed/simple;
	bh=53rf5yv+uJYAeMUqmk6Stm15kRh75vIPFJ2ZA3d60ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jxJIc8YXH2Q8Ad4C0AINNHrFzzFURGeVPy95b6BrbqIe2Wz3FdfM6Z23RkvtZ65P9ZglPvmtB5wRlqFbMzLbrvUDca1wmVL4e37rQBkcIdaSphwVjkhlAVDao/c7u3lO25Z1rmepRd2lenLh+6v5ZZ1Mj/w2jpz6qV/PjfrrgA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n5ZBCKQo; arc=fail smtp.client-ip=40.107.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n5ZBCKQo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQQIlUqMgfuNIKASYprP2mE3fX43fmURPPMy9xc7S5bg7wBdhbBimtj3brzVM43KyuDc8G74nhw8DPb4IYg88jip4Rdo5RmhRYGMWiyeLHmHiic5ktP78Klctt9wWYgoMu46ZuDfxvfX+oArqq1yeFoOpZ34Zh1a0RO+bBrWnRrEm6gFfyhvOJe/oQ4RaW1D176i/knvFQBzjsRrFHAM+21h6vpaDKAu0zXeHXyDyHvIvM7A9RYCep8tRw3sgb2gddqTdX/bbqgkINju7EkS2Y8YIkPvo3QJoh2O55uPs77vlQnyt9jcigBlW9RIKPrGL/bziQ55ORjAhaoaLhz0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOUi9de/V5xLAiHTN9G5ffErPRTJOHvM6drDy5XJMVg=;
 b=TOdhuZAwwKYYNFeKtV7ItFwl4Nm2y64tfu1keuTmgGcC0haWMkG44wK0VeHDCszs67C3b50UUO8boL+8d/2OeoVIYhINIPFmBBKfwgF1/v61abf3GA6w1owzupmVf0fz4w23NUY7FFmqXh6fGkJ13PROJiKYcqenOuyz+0d02xyjLtK3KKm8OEKWgXPOn0ZK919zLqu/9VVatyB3/H9Yeu/49NlfUmTdQYXYOfBrERZNvjf2eipHetJrVnbayDVJbZDEFdsZ8Hna59vD6sn1a1AO+gDlMqZfrJSAOMS+nLeAPjUFj4BnHApUo9zvPXaYjQYxjOz0J3p5ICCPN2KShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOUi9de/V5xLAiHTN9G5ffErPRTJOHvM6drDy5XJMVg=;
 b=n5ZBCKQo41wfFv8ohTY6+1Ws0vbSsrAQyO/9nXuXXJDvsE4CDvMwsIPe5Cb7S5p4lyfeLg/VaL2R2vpaemXc2NltfSvSr71elqyMovQjBUJnEmiTY2CMe1tOy6Rxzka6BS0XFAXlTGK96WGPVsh7vPc8xmkdJWK4YCFOdN5rWemJCFNZWtwm+tOJ7u+ra+qzgYdMm02zBF8y9WtdSLRLPCtM8sb1IPGHM72I6j2qHuPzEgG3FCdJoQt2J66wG2fCcKuddStY8TMbxCXkmZ3Gp+WkAICHCxJIgILXosJRk+mW35QUnwnQjVCpU2vT/IemonGM+TqQyrucbw4UtxOLYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10732.eurprd04.prod.outlook.com (2603:10a6:150:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Wed, 16 Apr
 2025 14:43:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:43:23 +0000
Date: Wed, 16 Apr 2025 10:43:16 -0400
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
Subject: Re: [PATCH V2 07/10] arm64: dts: imx8mn-beacon: Configure Ethernet
 PHY reset and GPIO IRQ
Message-ID: <Z//CBD7dVNW29JRW@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-7-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-7-aford173@gmail.com>
X-ClientProxiedBy: PH7PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:510:33d::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10732:EE_
X-MS-Office365-Filtering-Correlation-Id: e30c9d8c-b7df-4817-eaac-08dd7cf509c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gLSu1DmwLXK1O5Q5KUW5DXqQ1BwBdWih1k/9ryVqmIE3Fm5GA/Hv/nDlmdGj?=
 =?us-ascii?Q?+Bb2x7xPVGB2Z50Vxw6N77tR++KaaybbUTxpL8Ol9VLnLQtgJwol/ENxib68?=
 =?us-ascii?Q?Ic+xHsIuc7fqp0ZwCFf2rS3dBuvdkCELpfnuPXSMuZzeQyS04fhqrswqR+d4?=
 =?us-ascii?Q?rb/qNb5UBlSKJN0mGm9nu7taF1xTI97nhHQjOyykFn9hjgh5H/WVMrwPRPBW?=
 =?us-ascii?Q?8FSEuib4pST4Hv3RUVwj32wHEvXb+0n2NWxI1WsRa9mAE3aKMTdjskczOs+X?=
 =?us-ascii?Q?58lvmSV0iqHJf5OCuffPQS0VPeO1vap/bF5gOazkeTjY0OZAxyBH9quCdYlF?=
 =?us-ascii?Q?LI/KvmAcRnm7ojKgu2kD1xNOe7NGKJy2x42TMt/l7udGNk8Hr8Q2pBO2gtDT?=
 =?us-ascii?Q?I2Ui+1qDrIiQbGZZC9eJWzEKsngXxpQagm2wNmSZtCOpAMfkTG0nI/v10qkN?=
 =?us-ascii?Q?SqGacs2MnYnn7JzBgvHg9MTzx550SVsLVfx9STM2gDR3GuvazQzx8i7M1/ta?=
 =?us-ascii?Q?fMeuatHX7oRXFSgyS6G4UfLWbqZ7c/0e9S8DkaSS0RoQlfDTUxGoprV1zHwD?=
 =?us-ascii?Q?W2OtijZYLVyapXOc9KFe/8yOMRtNC0swFqtvxd+c3t8slE+HWsmIN8kIOnVl?=
 =?us-ascii?Q?/bXfkvCmz0iCr4mEpl0yxC27eKBC8A8b7YVTf+/Hh3WfNfhAq6eBQ/N2IBwb?=
 =?us-ascii?Q?wxVEpfQLtarzuZ0VlPfYGWfwIAAq2T5+FWAnvP1URrOVHcHRjyS0p6kvRmBv?=
 =?us-ascii?Q?7FamPcxSOkGi65yDoFD/CR8NO84IAHdH+T7YbfJQ3JQxOquC4XX98cG7lvjJ?=
 =?us-ascii?Q?ZnGjR5joz4G0KlsupmuLtFGyrGZcSLWM5penX7xKE2/d8/cSrZfb7da3A996?=
 =?us-ascii?Q?3cpEtiQmkfoCUHZdeHEqKjrQ7g/xY/vpFawTahfephJqJ59qe4E8KnvgGF53?=
 =?us-ascii?Q?2H2cOoYTN6YgZk+7herC+uO4Qp+g4SuFwji6DxpEhA3gXX3ZEYyzmv2ysGxR?=
 =?us-ascii?Q?GOkgysDkL6EoFmiY/1y51a20eKBa3os0RfsguXjPODfNZ/zzBp2IwPx2c0mM?=
 =?us-ascii?Q?+IpgKvGaoIthKWXzC3JxHhgdLJElG8vYWHU42yelMcsRgIouds5g7Ne7bWXc?=
 =?us-ascii?Q?drIDpD4lXdk8uqEIyDjJG4BmRp15r/0w77CYzpOfSZx1+WQpF0TWSxzxQy6l?=
 =?us-ascii?Q?mbRHiCY2LZA/BuNptAV7D3d9yQrw3rvjobEJIWrF/rahDEOIOXMJFeBXX2Rf?=
 =?us-ascii?Q?p3fejFjXxsD8jMEvNayMnOvvU2/ZruCCj4r8GBLbmLey+EwSwqtoZCjVWJas?=
 =?us-ascii?Q?yy8dIkQfV+5ahpvVO0RvKNwUB144/T7Hu9piQJP0nqYkq/ynt4bjkv7tjqoo?=
 =?us-ascii?Q?WHFhkLV+h+5NxzBcBHeMkjHNaQ3Cw9U96A6TEFb8iDTLuxlitbC291/k7T3G?=
 =?us-ascii?Q?d+2iBI5ZmJJPLfm8TfnYB2tQKJ7dQr9Ky91D1d7TiNuncaSRn3tnmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/J8xjqj+wSHmh9DQBJt7roeMA71u6KXP7NjGmctDy1LLx0exJfX3zDCpx7Oq?=
 =?us-ascii?Q?DdFxKB6iD7qIX86mip6p4SPBoKBBvtpvY/Q8qKux0QPV7pKNLRHDAK7lxmmc?=
 =?us-ascii?Q?9IVL5UcdKmnWnEjDz/Atcyv4Ru5/10pq0xlqIYw6840Wy7YQU4SGRuCPAQw1?=
 =?us-ascii?Q?UADLhYnVCGjCfB8W1FbLFW3dGkp22Hn6xSO7UfvrZ6UtECPXNqfwUM/2Ov65?=
 =?us-ascii?Q?bItyrBbu0NbNSJ3nNJ5kO9KWgvIfj5rbH4fLo44SSbx63orw3l5ngz/zxEGY?=
 =?us-ascii?Q?1VAgnwcE5iWOayrRD2Ww+tTscQRMi5PvZNS+aEZ8HE1Wxuxz/jYGFn+lLh9k?=
 =?us-ascii?Q?jYx4toWZBN2NRzbDhocG7hzafUqF71KSmFRJowsfVDrvZMNlbLHJdK4YSWZt?=
 =?us-ascii?Q?cyvR3VOHkFVdMv3f/zIJN8WT0yq0dZmQoAZf5Hw32SO1FhRItT4g+GJuVsTf?=
 =?us-ascii?Q?W0VkHO6cyzoxO3a+HXPJDyzcV70OtjxvVG6amNokZmF2ty+PdBtPX2xfAGoa?=
 =?us-ascii?Q?pkjN7uHtZh0jT+a2bfmxRvBukrAr1Wp7igmhqVoK8y2GN2QJ7h/Mj5EM8W6d?=
 =?us-ascii?Q?pdMnAHKoozg7x3xMank9ctd/WY8ZmWPMSsCyP1JRFpIpqOPFYe6xUygEcy9J?=
 =?us-ascii?Q?Jok5+YWiTXa+S0QQ9Nr9gx1XSN+WvpZ+NjNEsweGDEVuJ3hzD0sWfP0JM/Cb?=
 =?us-ascii?Q?JLOHMtCFJh/Eb01rn5kCIJ7+lBxTYXdGlZ93FI7QkFyQ01ipsH54eygh0/Xt?=
 =?us-ascii?Q?+QONIYBHSZtQadTyasf3ekdjfbBlYHMKc4mt0jM4f3PMRpftP40RKzVTeOu1?=
 =?us-ascii?Q?gU+dHqX1I9DR5yFmw+1kCq6VqLUIykSCk6RJg2QK4sskQTE2k2eJD5oz1Nmv?=
 =?us-ascii?Q?cQdNJGPYmOpuRbFx/5ctKM9r27McVrLsl6W7rRaQ9I/CSlBis9PhDx8rwETP?=
 =?us-ascii?Q?xxEIJ4WxQihKYKiNztAPFhmNYm7DbFKwJSZIveP+u8fwkVAlb0Lf1zseQzZK?=
 =?us-ascii?Q?GDLhY6S90JYUiGkvSQbNInocbzvcrXt8GnQNt8CDZTdLBZZpuX2OdguYv0Og?=
 =?us-ascii?Q?CEX2R77Rl4fXamuDNpXyjTMyKr6ylUrG7a/J5Lis9rVGnBJQxRWXa2fy3TJ1?=
 =?us-ascii?Q?YUqxgnsKkFrEa0Jpq7bcrocRaMmP0vCyP3HPluKjXZ4R8CoDuKK/B05L9kvE?=
 =?us-ascii?Q?KfGUcK0DFyKshZ21UJ4ZLJLyTVU95VKF2B9snX/Qz2F4nqn87Ns3k/UIbx9D?=
 =?us-ascii?Q?j1AvbLvC40XMCVF8PEMKW6CDlEkGB9XYH7brTT7cayzJJureZBstAlV01Eh0?=
 =?us-ascii?Q?aOvYwrPBqPzh9tT25vI2krBpoF13RFGohZkUPgIXRLisSO8QC6k8reTvSZAV?=
 =?us-ascii?Q?h/ydW/+1WvKxnJii/2br8UgwBcsMeO6A7L1FgjIQn6qVqq54V8efwSzsh6SU?=
 =?us-ascii?Q?/9TPhyzvrlSK89jzgs/ubiZsU1cckbi9POn/9NDbF5iUyN/fcTyA8+R4OCvR?=
 =?us-ascii?Q?uSVHS5GUQL4fmOvWOuHIx4cAOZ97jZ1oz0VDPdhMjqNQyMEFWiZeNr96A8A1?=
 =?us-ascii?Q?0jQXNbheWJPbMqPPklk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30c9d8c-b7df-4817-eaac-08dd7cf509c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:43:23.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNJvTCKx5wvmtYn9TYkJNdc7xYse+8cqudzHApQec/GWaU/l2QbcrdVILT+xqhnDsoSAJypn2cnBS9ztG+BViA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10732

On Tue, Apr 15, 2025 at 08:01:33PM -0500, Adam Ford wrote:
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
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

> V2:  Update commit message. No active changes.
>
>  arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> index bb11590473a4..b3692b367a42 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> @@ -88,6 +88,9 @@ mdio {
>  		ethphy0: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <0>;
> +			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +			interrupt-parent = <&gpio1>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
>  };
> @@ -326,6 +329,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
>  			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
>  			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
>  			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
> +			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
>  			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
>  		>;
>  	};
> --
> 2.48.1
>
