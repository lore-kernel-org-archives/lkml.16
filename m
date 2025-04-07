Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289708528E;
	Mon,  7 Apr 2025 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052763; cv=fail; b=FpTKLnekk6lTxA9zHXOIP1yEVsq1JEqTtJhdm8oMwRMnRzUQQWSix4oTTHdcbCS3mMxUYmw8LYd/ihRl0lQEmh9UQcdUN3X7V5NvYI0dSwoAlj8se7Hv9DPorpkzXcvNAPiO3C9RsZvNLNhPa43TtAFaGSF9+zopk8IG27hjv0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052763; c=relaxed/simple;
	bh=byN4LJNQwSTzGB4V0aVK2f1EN69s85o/oOPZRfVTPiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d7IBWmC49rVSeYaB8O4Z7az5SElEIkgYd4yOpFfUIO3vTZV6vPBCeOT6lkvp8mX18E8yPfw26LecTdjOUutJTf9ehYcKmU1txHQY2PHQ0Ro1GnpWLpS9lTaxZY6/UgvxPlVj5YZqqofXOOPfC1RGHMTuRVvrLV2wVzWnlRAC/oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DDi7BNvi; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DDi7BNvi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePOfc4cL+diuxPy4iVZcCnfKC3ujoGWercHlIMmBq49kdHuO3QtdFZdsZ9It35yk3l6Kp39CzUue9nvMJtep8EZA/u1Opv07vwqD8pJ9oh131lJfPk/UC9p7HdOmrpE6m6DMG7J90g3hO5XBgazGIJK8FAfaaHRzH+Biy2sDRVy/ZmWc4sv39VDTfsfsFrWsQUKnffrfGt+WNf4BtONm9kPPjIKRKzn7ZhFyMUMw+M6HqLYEnhwjZGfS2TvoW3vENj6xeXAxpGvdWBPGqGLSXWtwCdp7b+btU5dR64jLj9IL4GaWEpwS52qtfxMeB2G3XGpF1wm6YvlOJLb7lkQh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFSPB2Esstnw7o9Wizz12Z1D13AxYfacj62fdsuu4pI=;
 b=gK/raIFr0Qvq5JO+OLQ1VwkYTc7yXbcnVW5EpWkhqIZDRjL5T+ftlmu7+Plyhee9GrvZ32vZZk/C9zvkWh7RE4PsZCOpJmx/6c9Om/Iz/VeMRJG9j1cdTQSQh1PPLAqP3Cp11GDD+03sCHvdDbyKvMnP5UtnbfeUx6gdO0Dwu3fO//VXZshHgvOn4HIwt5z6Prateai3fC2yyM/nvpj+5bDTGuRLjMMTvfM/fweWT+sSbGHbbtHgFl5wZJ22JCkgiESQPmnwaRi8noLWC12zz0BBS6ttRW7NAoFv6Rr7aW3MjHuRwOpPSXEjPYew9DzgU2FdSOAPBNtS8WYzp5Of+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFSPB2Esstnw7o9Wizz12Z1D13AxYfacj62fdsuu4pI=;
 b=DDi7BNviFbo2yzYqjeuQr/VHAOqn2NigZPEYFHNAf5KLmzyUaJU3zWt4/5ou1MQiyYUEz7wRcqWniyAicEHH/jQC7/j5zX6ha3+5AfZSY7u2sAQdHmt7nMFp9ZYC7tqzgSkSH5QjH7Dj+TywQ+rOObpatMOwsTeqQtWrW3u+aL8aKM+IzGv9ODBj2D2yqRrYhRm6hjz05kcBwoP2SzAmE8dC3TIW44jKBjIA/nkPb2PuJa7GuU6tVzHwpICsrNVPIvJ8/68gXb8fY1n/aelmV92sb4wDWZzqhVghSZrkJkFBUMNgIObABh48Vvw8lXYNZR4+muDaiAQVcVWwSlU1Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB10064.eurprd04.prod.outlook.com (2603:10a6:10:4d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 19:05:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:05:58 +0000
Date: Mon, 7 Apr 2025 15:05:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 3/7] arm64: dts: imx8ulp: add secure enclave node
Message-ID: <Z/QiDQCgq7utUs54@lizhi-Precision-Tower-5810>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
 <20250407-imx-se-if-v15-3-e3382cecda01@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx-se-if-v15-3-e3382cecda01@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB10064:EE_
X-MS-Office365-Filtering-Correlation-Id: cacd1586-c281-4159-24c1-08dd76073af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8k2mpa8/Y7YVziwJoPunQRYpl3Y+umhkGWV+txwU9Pr8vTOJNJcVBe1k3OD0?=
 =?us-ascii?Q?qftVOR2J1970SJm5Yw02KnwQarlIBUMGvG5ba0yPzdYr7A4om/Mdw1mYjGpv?=
 =?us-ascii?Q?0zBDuGRToiBFBe+jDfZjbsuSTE8tULuZRAi6K1wOQJ067Agpuce3cG2L2F0U?=
 =?us-ascii?Q?cm9YFUEgGomeins3msp70K/wNAIzQden7wuKMIBCDdcxLeDfDDeKBF2QfAvA?=
 =?us-ascii?Q?AO4zgOw96U6TBhTvncdmOHS/9IbHRIfJYO8wGBIJLUI7MRISxyZtUui9axRr?=
 =?us-ascii?Q?5SwN+ptL/0VODPnZ9AwtJs8f1V9UU1E1+zaBzgA8g6sNzjAfLsBN4WgdAQWt?=
 =?us-ascii?Q?AXLWhUVeXpaxFxh1DB4Xyz5NxDVlHrykmJwrA0jO90EIkgxPM7DmEDqVVh8j?=
 =?us-ascii?Q?Ur/tkEtxT0geLyjjKhkJgirMEo78BCnFUmQd7aWNa6EKUf/FtwhKh2v1WnRW?=
 =?us-ascii?Q?vbdyKl7+0oFGMmYMaK6dN57XGioxtgtCA49B32KzXLL0zI0lPxMZE+7kkKBh?=
 =?us-ascii?Q?9h+uaJgoYh/blNTmnhuX762fkYAa3x+UZ2S7pgr0Yddbe2cqbfTiBVH0ASAW?=
 =?us-ascii?Q?/rR0ysPHoW77Fv+LT/CAMU0F1d9RKHgHgXfLKL+/A8vcVD0J/hH6VlVeG7rk?=
 =?us-ascii?Q?+98aM+qPMAu60H92pZAKsrBWxQPUlMdRYjbJfJAAKZQCCHqzilkMEkQm6iuM?=
 =?us-ascii?Q?XpCGdZMo/dvKcgIT+EC3ct8noTfNoHA5bWntfZlZqsnF9WXdfS/BHA+/VB/b?=
 =?us-ascii?Q?LcBQgr11+TKJm6VFc9bxHcHrEAnJcBpmi0Xv734xe/fBO4de26r0mpVe+pXH?=
 =?us-ascii?Q?xUwN2Ov5z+TNtc2Z2vIqcgp8P+JGayO1G0dy1LXNVgUEYCEwbs1TNDPZaFNL?=
 =?us-ascii?Q?HHP319lex/AHGnNXM0+rkU5Lo8ZsZWM3qTG8sbLcv2RTFm0+M2zj2T9VvN3A?=
 =?us-ascii?Q?fzTurgzjMm4I9L3TW49fAe1h5bSOGfE6PSj8deB705N7ccKun+M/2dqJ4F9M?=
 =?us-ascii?Q?qvWkpJ2arDoBRzFNxWrt1hp00eUfYYVv4q64hSROpdxfMxbQ+4p+hWWZ+VEN?=
 =?us-ascii?Q?YUuD342iXsmbpPKjxvel423KrcLl2ZDGkz5MLrkvDWEhQo77KjVVQB21HGqq?=
 =?us-ascii?Q?eOOgKS2dmE92W9wslM64z30qqcrK7/BDjprMuYQv+le1E6by8sbeFDBqfr4n?=
 =?us-ascii?Q?BijA1UFF73/JUJoS7tFc5C40vEGej7A1muV0s0lrPQTSAlavYjltXFx1YSW3?=
 =?us-ascii?Q?wcc93PnZRDpJdsMsMWgymyDP7du2kBBA+jEUzg5wxdVUKBA07g6j0uUNtncC?=
 =?us-ascii?Q?QFFgxjjJYZlnSwAjo2u1PUZ4C1fxDGNw9uzNHawaMb91Z7JZNQDLn19Ngc1a?=
 =?us-ascii?Q?AsoAsSCMNTgQ2Fr7zn0K2GOT+dwlxmU0zP/w6Fk2VoC0Ry7gplSc9q7al/Ng?=
 =?us-ascii?Q?zcyhQ+bbkIs8k0kxU57rSyBoeIpRNc7M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LtLKwW0bDxl3WUYEdUSON2fclgdmjW4rnU1xz2SCxzzFde2D17LvH5DXu8FG?=
 =?us-ascii?Q?LSMoM/1iGRO82KTXvHkbp2ybbo4FQTFmLSKG5tYpXa/SqnwGcwtn6t5Jgsm1?=
 =?us-ascii?Q?km01ioEThOwgQ2Ry9gMrUWsWB0QBlEVMhD3MzKwS1PevM4KD/PXwQkiquDeY?=
 =?us-ascii?Q?Q9eWhH25w5u3u4p3T1qScRcmbTuxLrdf5ZgaGtaxO+cYB6XX2Cbi+otOxxnG?=
 =?us-ascii?Q?rL9cRE4CYt9c51m9KCdY3Jtn+Pjhw6bQ1HNxZBfrdPS/xw5huQfK8Sq/qgcK?=
 =?us-ascii?Q?32hCbMRv0nuEUqFfKywER5f8mTprq/npgg3Z5H9K6kiKer/y5AcIhJyGxTi0?=
 =?us-ascii?Q?CbLi7P3lWTyZNgpehE9z9Gy19nbmatJipP5FY6psMa2S3k4K0ux71BEJtmKe?=
 =?us-ascii?Q?PVxPsoRjbILWGQ6d9GgJstmeVraX4pezvU4rQYlEs37bh/oaCIuTT18d2I3m?=
 =?us-ascii?Q?RiKhNTQPMAFEG4i7poDSrbKtgxIpti+i8IB/CMoeIMV44RJxvqITrWXpXiIX?=
 =?us-ascii?Q?y/51pV5WZeRV+l+dgyNDdfh3BBnqbMF5TTPgCtEbtup47hahgiHv1i4GHdom?=
 =?us-ascii?Q?5S1BWCMUB+ybafBJauAGz2PVN7lvHb3U6KNDER3tT3ntsPGjuhk+TbrcOimK?=
 =?us-ascii?Q?HgO+kmVpEfoMkSCzIBHPRcHBaCoWUuy5PGxE3aROBz9YbkJJ1iYSG1eJVo0J?=
 =?us-ascii?Q?cl1MPPo8hBxMjDI2RJlOEM7AvvrLXIItSRD7s0AxgwtNGnWYrRGYOZKIJHZd?=
 =?us-ascii?Q?uvqWARZ/XGj0IlUkBJ0h4u41ElEoI4V1GX6L3jOhaJwe3+hWoPgyg03OdnFD?=
 =?us-ascii?Q?399EVUP82zhEpfIaU5oouo9zuzJIByqjmLKEGEbdSyu73O2RiCFs2ac6tqEe?=
 =?us-ascii?Q?M/sJVNhAkg97KhUC9/MPow+2nOwRm23HbaF+Bns8KDx7DitA3q6pF6O3ydf2?=
 =?us-ascii?Q?B7QP4gu2NhlMEYXLPl59AsbaoUg/T5YNW0tSBzruzi6DNEJfeV5UDIj9iyBg?=
 =?us-ascii?Q?OLdmkHyoj62hr0fhMACrXsdG90YVyrXazzvwzkBrOfgNUDFiqdi92EbSMtwA?=
 =?us-ascii?Q?tsVD+I0yVJEHfQoEguxeJbOk4KNxQsOwdUD8fo1av+l2CMJm2yHWqL/zotUg?=
 =?us-ascii?Q?aBNubIq6kMj3DBdnkQ4e6aclTxssC6sR2Ka2oBAlVk9ALt7PEfgv1hDxuwbN?=
 =?us-ascii?Q?ffyugeqGWBNn6a0pS9I2nnFBBnsz5L+W6dnPkTEX4rxPomtGvFHSG2HzektN?=
 =?us-ascii?Q?1tJO8vT8olUDLYHl+iscrhSi/xRKa+/NPUqaQdB/Zt0abgYcP8L7YKe/eNLo?=
 =?us-ascii?Q?tY1+wwBENkwTPJbS4VBDkYepR6jHoOfp240g5fWChpGxoXgqa65kw/0qfWL2?=
 =?us-ascii?Q?myyIVNCn5QQ9aB6CQKRc94V3m9aG+6aWgtOG3T5jfxDvLI9NRRUWp8KJ3wxr?=
 =?us-ascii?Q?bKG9tWP3zJ3LiK5edldCZ3086LiaD8BeKnyWBbOAoLcSVDQiDrnJiaF4WY2Y?=
 =?us-ascii?Q?SiWUws5u8he7qNF6c+xuD8AxgbchblZylA1bEuFcEt2uK/Fvk4FOKg+p9zAO?=
 =?us-ascii?Q?sqIjrl96Rw5STzAdI+PxxO7pmksYrQVgaKWUahtD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacd1586-c281-4159-24c1-08dd76073af1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:05:58.3872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8XyVLBBq9K9mNvsTw3lgd49hvlppM8KK+E3TKhe/BqVUggpRbn6IH/k9ABKS84lH/zTaby1A5oc7qQUdHtvyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10064

On Mon, Apr 07, 2025 at 09:50:19PM +0530, Pankaj Gupta wrote:
> Add support for NXP secure enclave called EdgeLock Enclave
> firmware (se-fw) for imx8ulp-evk.

Pleas wrap at 75 chars to use screen width efficiently.

>
> Add label sram0 for sram@2201f000 and add secure-enclave node
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---

Move dts patches to last patch because generally driver patches was picked
up firstly then dts files. driver part Maintainer will pick first N patch
is easy than skip some in middile.

Frank

> changes from v14 to v15
> - Updated the commit message.
> - split the current patch into two:
>   -- 3/7 for board dts, and
>   -- 4/7 for chip dts
>
> Note: copied the change logs for v13 to v14, to cover letter.
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 2562a35286c2..05db47668b7e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>
>  #include <dt-bindings/clock/imx8ulp-clock.h>
> @@ -154,7 +154,7 @@ sosc: clock-sosc {
>  		#clock-cells = <0>;
>  	};
>
> -	sram@2201f000 {
> +	sram0: sram@2201f000 {
>  		compatible = "mmio-sram";
>  		reg = <0x0 0x2201f000 0x0 0x1000>;
>
> @@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells = <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			 compatible = "fsl,imx8ulp-se-ele-hsm";
> +			 mbox-names = "tx", "rx";
> +			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
> +			 sram = <&sram0>;
> +		 };
>  	};
>
>  	cm33: remoteproc-cm33 {
>
> --
> 2.43.0
>
