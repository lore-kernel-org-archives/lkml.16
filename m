Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9FC2AD14;
	Mon,  9 Jun 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463373; cv=fail; b=P/au+5o8hoVYybIooDJ+QdNfYZFgF81SYX5KCVYZO36lgTr79Um7BybwVGqh8dmZMwD8uLiKX6hWjKuVuX2FoKWpkX8Em3f4TAAiBCXVFMI0kqgCsIotdjnTcQSJ0d+Gyg+XoL9SYq3Ld5BalfOZ7mjRXAzUb8zdm9gPYaW8sBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463373; c=relaxed/simple;
	bh=MaDQ3X6JuKvxVfGH3LdIicdYzLQg0cRdlYh4NqZEPXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k6b13515rk97mK0o0R68zuxgBouwQnE3qwvPDZ1xGcFpkooOG61vyooCGfpiNvmp85K1s3PMF8oeKwxl+8IepJkAIMawrKrRDlqw41/01IiAYqAl2vL5HIyI5DEEK+XbRcZt1BvChU+KHthUcnzCSudwkaHKeh1ODB71uLW6IYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dGifSbSO; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dGifSbSO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKW2al4IZprWhGdS8ovb0tG9gB6GKbO/hHMJV3Y6thvCUeAPcMOCy+ViMXi8f+8/W04v3HKGEf2JRYtlisO9xl8X09R699ovZMFSfrVTDya0QuOU7+LL3gqm2QgJTV48iu0KPslxDTOEjtQG7Z1U0Z4BzJcsum3Q7L70cl+FSzXxlUxdKYgar1SAdHdEcWSkPuBlv2W5AquAaa716b10fvylJLhgWYaF+1R7iZlJufpdeK9djj/PqFu2YcDsTRne52B6cG9k5OAurUHykM/+z1gChpSS9kRvjGbii3R5abAHUSRNqyFMwX8ytXQHh7rg5XOKat6ZvEQlYBGA5sk9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYN/dYsIunUIVF2gOPn/xbh68UDLfmZNhu4X59Njb3o=;
 b=QuPAQ39umX8iBK02K3SI618U8FDk57ssrhEal3PfUmiMdIcOeQ48Uw/eSAzLNitoYfKGt1LHZru34PSkb+mp2ZMLEuumgl5svZV+2FB3E/OWUCmp8bXXMx/YzHB0ZVKwPKEkMhQZLT1dOpehGXDzL/UHY16WeKp/iNBm8DhPNpisfDpdGAvRYO2VlodVlMfutZjrf7RxXg1gZSBSNDvZnWOL+YgB//Zpeu12N9wtL7wZmTBROoBUJF5OYIn5suwiesBwfPVnQEZC0O0WgIAWGqfL4PtlaS6igLtWBJta0s/2gJVcKDS34phLA3esUSb8RWWzOoF1Lc14lmWEkZ7lzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYN/dYsIunUIVF2gOPn/xbh68UDLfmZNhu4X59Njb3o=;
 b=dGifSbSORwSRpu1gNkJShY9YRnFw6umOmDC+0J6YisovQVcsCCZaKPH0OEHhFpPdoS4Oeaw/J5vZz2vVwC5glISJtyh8KK/556H1yLbk5g6EfR0MbAB7bQjyQSPoPXXlYVTP9g6vgPvq1DYG+3TIk/p8kKQvoiwudyqkMIbA1NFhDsiSfygl4xUmpM25q6lUOepSPNUoaaQyAWV7uCCNE/mj1J0ksc2Swudo+v+TL1g38L8iiF52TnQ0kVYMnLZtmDxyUFq52gpGQ9F+8cCLr6m1CYHtYVem6lh04cSUXNQpvDSHzHm1M51tJhlgUmFlme3Xm8fkrHTvg4DmPP1c9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8434.eurprd04.prod.outlook.com (2603:10a6:20b:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 10:02:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 10:02:47 +0000
Date: Mon, 9 Jun 2025 19:12:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Richard Hu <richard.hu@technexion.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ray Chang <ray.chang@technexion.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mp: Add TechNexion
 EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board
Message-ID: <20250609111252.GT13113@nxa18884-linux>
References: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
 <20250605-add-technexion-edm-g-imx8m-plus-som-v2-2-db5a7bbe3c84@technexion.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-2-db5a7bbe3c84@technexion.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: d93b6e2c-84f1-48ba-6509-08dda73cc8f1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?8mSEM5nc8fZcKtLMA411sDW6yQVDfR7AgcWgv80s5ghDeShr2AL7usZKT7ID?=
 =?us-ascii?Q?RDDADBTPigbjvr/ZOvkGg4pZYNoAIG3F1+4/8R+my2pKVIrXU5eGyyw76OLK?=
 =?us-ascii?Q?TAW7QQImtvkn4ZxTF9m2mE+34JQoG5dPSJJ3kWDuYXjuiIFD59yaBleLsrkI?=
 =?us-ascii?Q?j9eJb20XZ4eWM03wUciCRG/3BXq58utuo9kaodtmEBR//bRDqOzdSaxPx8tH?=
 =?us-ascii?Q?j5PuJxHY3N5NhYdw5ARf0wV5RwOmaI0101f7ohGEYvkoMboGCQY3UEa3tO03?=
 =?us-ascii?Q?J1e8Vx7fM6jgZo9vc/vVmHAJu81Yg2b14zsujxrg14sD5vZ9dAdFLJbXm6YX?=
 =?us-ascii?Q?1d4ZCB1uooxNBmcLhBAEaao4mr45I2ka+/tGP232DUoahiNfJ0ZIgzMC6Bic?=
 =?us-ascii?Q?Ymwe1hW8kJYYXrO2gb7ZtcoFl2W6KuURyx2+4byPQs+NoqhN9q+IPTU+EKxK?=
 =?us-ascii?Q?iKilTYuPoJnyXY8/10+nU+lWY1sf1h3rpQa0yU8vUwRtdX5uGkeF6RBOLr0W?=
 =?us-ascii?Q?yu2smfecM7DNWn+UpU4xU9UtA8Py1UZwyOV2vyJZ2woFLYl5hGOsnk2RBoe/?=
 =?us-ascii?Q?zhoX99ASPOS7f0n3jc2vkpddB7DYytyA6utqQD5S1Tj6gtp5ylTatr4ZYKG8?=
 =?us-ascii?Q?v5pvKwrWgMsHNNPjD1tSr2ckYiNlK/Yf8gnZqFZWS7TlU1CICrxmUG3+P2aY?=
 =?us-ascii?Q?w0GwoECeLN4UfSNDL6gTT/AIv+8fqEXmIKPfGiG+kYIe3ZHMyEZoEZ0G/m8w?=
 =?us-ascii?Q?rqlqm9g1J75uyYSVrJdJDC2qt4p4rOrydjXD1fZsiJRjIKche1z8XU4czXz3?=
 =?us-ascii?Q?MCoHXBJno/5f1ju68Z5QSfbDAWkrScGlSgCUWEYDD6DO2m8lDbMSpeLh3goV?=
 =?us-ascii?Q?Ap3DgXYLNwLT4QZ9snVbyGPG33ur7kkH7pRetAvChxd5XuXwUvpI2EuTji6w?=
 =?us-ascii?Q?BCFzMldNfwvXNNhXneZ0YXhbotsmBhmCiQtcrCJvPsdNz3hXQ1/h7mReAdwi?=
 =?us-ascii?Q?a8TuIMGp8vEfg67dz5vCWiaGFX69iFgqOQ5achbDiYzNFjMej7pMyzQNM60P?=
 =?us-ascii?Q?EEIzLzAe1YTxgh/ppY4vDWDpGK4SOhdSZp+iV8ds7kS9VHpTi1s1WJlGQPGJ?=
 =?us-ascii?Q?CcwCRF6OEbrUNu+Z0mc0s85OMcL/RE3ayzoXWilxCHMiFYFfsw0lu+G0m6It?=
 =?us-ascii?Q?mwynmHHoZBepo1+JlW6/2yYnoTzR2yGhQESkfx6ZHCDVyAhhHNke3nCjYtxw?=
 =?us-ascii?Q?PxXDm6CjHdTAtoZOAisZVnxpqg+gNEuZBBfh6rVpGRyzX0pomvzr+4aaPHRk?=
 =?us-ascii?Q?n3kFkPYeA/uM+/yLYkjBa1WdE0UBnEYPSq+woukP9exNsPj1LDO78T60664S?=
 =?us-ascii?Q?FuywzGS89JvLnVPJvRaSZyQuvMtwKfmEq7iCHLjKGwWoJQaneDJZCDqMFIC4?=
 =?us-ascii?Q?6t6zOcTGrpndCf+/1K2uBmQwXJ1pyKdhoQTN2888dnqkTMwJfi4yKw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kYtibx2Hkgw1AEz7eBBBoX1lOz8KQov0oJHICdWQ0aR0GtdYJjRAHJZRVvYV?=
 =?us-ascii?Q?YV9WOvPqQrgksKiSNxobuc7KawmaEbq2R1JNVhmsww71tUCwaIZqFqducfr/?=
 =?us-ascii?Q?U61GBDk8AFwLVgAJ3Tz2ayZjLBUWggncOGXOh4X8LJ6yb8YVvHPov6czzQpk?=
 =?us-ascii?Q?eXehh23IAjbxEpDiHo3I4jOLQ9wm/kKUgHg7v/rcPbo2BZ2mdm+gahrC34ql?=
 =?us-ascii?Q?uf3K9I7gNWc4j+1v+IMnFnZqEoPLAz+ALf0Avo7sVUtMlcbbOeMIfFTbWwV3?=
 =?us-ascii?Q?TeNG80W47CIAK36z10dbpWns5KsmM475oH75WdObXWQv4W7ZEfVMiMTkGThE?=
 =?us-ascii?Q?ILTlQiiGUs3ERyBxm9cf96CmwGa/WRzbeAkV4Q3t3aj3UfnazKX6XeNSmhZt?=
 =?us-ascii?Q?tlOtcKzc4jBzmrNytvVjYOaz5gW/y1aGyFEj3wPU5eOs79oFaEXXayyBFkF5?=
 =?us-ascii?Q?khf4nHLxWfnt6DP9cioBDGgAEp5IpNy/akmadw9wcyttQcrg+8bWsmJlEJHP?=
 =?us-ascii?Q?VnA373vzhSZy3rASgnT6VwZJEa5Gonk7ylb81NF9j8ZGQDHTPYFcqMd5SY61?=
 =?us-ascii?Q?gOGzSHJpCr2nHtec8jg9FRspkhqgkEZDTkOb07PMIaIymtS3IBhh1HfKXYnd?=
 =?us-ascii?Q?YWx/msENSXJWogPUlG3q8xkyRRAvSzMTaW9CAjCQLGatpIovvAYzhpLS9Z7P?=
 =?us-ascii?Q?gacO+NnMdTRaHQLWI4U0IDS3nx9sESm2j3rVwyrNaH7E+1PTBTgIYLhJe/PG?=
 =?us-ascii?Q?Eywm8vhZPRiJgGa44RNNl8gzHHLISpL2Bm+gati/b0jnTrqV690IGrIDHsqk?=
 =?us-ascii?Q?rOGolBrokbSBtQhueaM2QFwxHTZYyeYMOns+hnyOcCuVUhmeGgafP0AHnO6z?=
 =?us-ascii?Q?Sw55u6xVEII+b2enQfwaa5W5cPvBfFo20xGY7oWVi9/yWzsj+B4GxDQi0AfS?=
 =?us-ascii?Q?qI9QHBdUPC105C2fELCQcB/qs8bCLggJZwSEmKXhFLhixAjjTBX31FJd+mEM?=
 =?us-ascii?Q?K2xof1G4oaJzF+j1geu/tSyRlXTJqh5agp8R+t7ep6OR2SDIV5ZZnRrtts82?=
 =?us-ascii?Q?G+f4pPctUBgsxQ+4MO78aWW9jaS7lZNoQFlZXQBDzvVKh/7L7P8IiGiUch5h?=
 =?us-ascii?Q?DE+9r1dd99ARL21U01AkzbZqc/slkqR4UG69aKihxn1gUVu5LBP7HulZM50m?=
 =?us-ascii?Q?YKOFYcsWNXeh5lyqZurF7ozCV4YXNncg3tiqyv3QEVEEDIXlDTUtE0Y1/yiV?=
 =?us-ascii?Q?kucrO754xRqlvl9/Gb35ReACzL+WwIH1KOOnghwFrBWuDXgR3KoNLaF4tSwh?=
 =?us-ascii?Q?nX/GUNg4HZ+OAIBKmrBf6aCoYYiX8xBLn1v7LVAZmI1VdultQDHCU8lHtpfF?=
 =?us-ascii?Q?5Y2tL/Co9EE2yPGc73OaT7CLBPHQG+XGffBjib30wn5q1nvWpWsMtpKvc2mP?=
 =?us-ascii?Q?Z2oTZwKpqMy88yS/84+TUFxySe7Xt+OKShLlDph7QCkcleKHRgETQZoKnxiE?=
 =?us-ascii?Q?FZjzu1idEyFdgMMhzg4Quz31SFBk1HQxYtkdRXuq6zzvNDUZOqArjehjz8ci?=
 =?us-ascii?Q?gT8Wbc3WKS/tYjQwRXWImWb0Izihp+hAmKZ7+ux0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93b6e2c-84f1-48ba-6509-08dda73cc8f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 10:02:47.5240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6VLZpI8y9F7UTKrjyyMdHrVwUP7bt4CjP2ZWx3dl40MFRoUozV/0otFQDbrsmEtAbIZ6ERp1BMfJNP9v3z4VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8434

On Thu, Jun 05, 2025 at 03:09:42PM +0800, Richard Hu wrote:
>Add support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board.
>Key interfaces include:
>- Gigabit Ethernet
>- USB 3.0
>- I2S, UART, SPI, I2C, PWM, GPIO
>
>Signed-off-by: Richard Hu <richard.hu@technexion.com>
>Signed-off-by: Ray Chang <ray.chang@technexion.com>
>---
> arch/arm64/boot/dts/freescale/Makefile            |   1 +
> arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 403 +++++++++++
> arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi   | 839 ++++++++++++++++++++++
> 3 files changed, 1243 insertions(+)
>

...

>+
>+	reg_lvds_backlight_pwr: regulator-lvdsblpwr {
>+		compatible = "regulator-fixed";
>+		pinctrl-0 = <&pinctrl_lvds0_backlight_pwr>;
>+		pinctrl-names = "default";
>+		regulator-always-on;
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "lvds0_bl_en";
>+		gpio = <&gpio4 14 GPIO_ACTIVE_HIGH>;
>+		enable-active-high;
>+	};
>+
>+	reg_lvds_pwr: regulator-lvdspwr {
>+		compatible = "regulator-fixed";
>+		pinctrl-0 = <&pinctrl_lvds0_pwr>;
>+		pinctrl-names = "default";
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "lvds0_vdden";
>+		gpio = <&gpio4 12 GPIO_ACTIVE_HIGH>;
>+		enable-active-high;
>+	};

No user for up two nodes?

>+
>+	reg_pcie0: regulator-pcie {
>+		compatible = "regulator-fixed";
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "PCIE_CLKREQ_N";
>+		gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
>+	};
>+
>+	reg_pwr_3v3: regulator-pwr-3v3 {
>+		compatible = "regulator-fixed";
>+		regulator-always-on;
>+		regulator-boot-on;
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "pwr-3v3";
>+	};
>+
>+	reg_pwr_5v: regulator-pwr-5v {
>+		compatible = "regulator-fixed";
>+		regulator-always-on;
>+		regulator-boot-on;
>+		regulator-max-microvolt = <5000000>;
>+		regulator-min-microvolt = <5000000>;
>+		regulator-name = "pwr-5v";
>+	};
>+
>+	sound-hdmi {
>+		compatible = "fsl,imx-audio-hdmi";
>+		audio-cpu = <&aud2htx>;
>+		hdmi-out;
>+		model = "audio-hdmi";
>+	};
>+
>+	sound-wm8960 {
>+		compatible = "simple-audio-card";
>+		simple-audio-card,bitclock-master = <&cpudai>;
>+		simple-audio-card,format = "i2s";
>+		simple-audio-card,frame-master = <&cpudai>;
>+		simple-audio-card,name = "wm8960-audio";
>+		simple-audio-card,routing = "Headphone Jack", "HP_L",
>+			"Headphone Jack", "HP_R",
>+			"External Speaker", "SPK_LP",
>+			"External Speaker", "SPK_LN",
>+			"External Speaker", "SPK_RP",
>+			"External Speaker", "SPK_RN",
>+			"LINPUT1", "Mic Jack",
>+			"RINPUT1", "Mic Jack",
>+			"Mic Jack", "MICB";
>+		simple-audio-card,widgets = "Headphone", "Headphone Jack",
>+			"Speaker", "External Speaker",
>+			"Microphone", "Mic Jack";
>+
>+		simple-audio-card,codec {
>+			sound-dai = <&wm8960>;
>+		};
>+
>+		cpudai: simple-audio-card,cpu {
>+			sound-dai = <&sai3>;
>+		};
>+	};
>+
>+	reg_usb_otg_vbus: usb-otg-vbus {
>+		compatible = "regulator-fixed";
>+		pinctrl-0 = <&pinctrl_otg_vbus>;
>+		pinctrl-names = "default";
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "usb_otg_vbus";
>+		gpio = <&gpio4 0 GPIO_ACTIVE_LOW>;
>+	};

No user?

>+};
>+
>+&aud2htx {
>+	status = "okay";
>+};
>+
>+&flexcan1 {
>+	status = "okay";
>+};
>+
>+&gpio1 {
>+	gpio-line-names = \
>+		"", "", "", "", "", "", "DSI_RST", "",	\
>+		"", "", "", "", "", "", "", "",	\
>+		"", "", "", "", "", "", "", "",	\
>+		"", "", "", "", "", "", "", "";
>+	pinctrl-0 = <&pinctrl_gpio1>;
>+};
>+
>+&gpio4 {
>+	gpio-line-names = \
>+		"", "", "", "", "", "", "GPIO_P249", "GPIO_P251",	\
>+		"", "GPIO_P255", "", "", "", "", "", "",	\
>+		"DSI_BL_EN", "DSI_VDDEN", "", "", "", "", "", "",	\
>+		"", "", "", "", "", "", "", "";
>+	pinctrl-0 = <&pinctrl_gpio4>;
>+};
>+
>+&hdmi_pvi {
>+	status = "okay";
>+};
>+
>+&hdmi_tx {
>+	pinctrl-0 = <&pinctrl_hdmi>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+
>+	ports {
>+		port@1 {
>+			hdmi_tx_out: endpoint {
>+				remote-endpoint = <&hdmi_in>;
>+			};
>+		};
>+	};
>+};
>+
>+&hdmi_tx_phy {
>+	status = "okay";
>+};
>+
>+&i2c2 {
>+	wm8960: codec@1a {
>+		compatible = "wlf,wm8960";
>+		reg = <0x1a>;
>+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
>+		clock-names = "mclk";
>+		#sound-dai-cells = <0>;
>+		AVDD-supply = <&reg_pwr_3v3>;
>+		DBVDD-supply = <&reg_pwr_3v3>;
>+		DCVDD-supply = <&reg_pwr_3v3>;
>+		SPKVDD1-supply = <&reg_pwr_5v>;
>+		SPKVDD2-supply = <&reg_pwr_5v>;
>+		wlf,hp-cfg = <2 2 3>;
>+		wlf,shared-lrclk;
>+	};
>+
>+	expander1: gpio@21 {
>+		compatible = "nxp,pca9555";
>+		reg = <0x21>;
>+		#gpio-cells = <2>;
>+		gpio-controller;
>+		gpio-line-names = "EXPOSURE_TRIG_IN1", "FLASH_OUT1",
>+				  "INFO_TRIG_IN1", "CAM_SHUTTER1", "XVS1",
>+				  "PWR1_TIME0", "PWR1_TIME1", "PWR1_TIME2",
>+				  "EXPOSURE_TRIG_IN2", "FLASH_OUT2",
>+				  "INFO_TRIG_IN2", "CAM_SHUTTER2", "XVS2",
>+				  "PWR2_TIME0", "PWR2_TIME1", "PWR2_TIME2";
>+	};
>+
>+	expander2: gpio@23 {
>+		compatible = "nxp,pca9555";
>+		reg = <0x23>;
>+		#interrupt-cells = <2>;
>+		interrupt-controller;
>+		interrupt-parent = <&gpio4>;
>+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>+		#gpio-cells = <2>;
>+		gpio-controller;
>+		gpio-line-names = "M2_DISABLE_N", "LED_EN", "", "",
>+				  "", "", "", "USB_OTG_OC",
>+				  "EXT_GPIO8", "EXT_GPIO9", "", "",
>+				  "", "CSI1_PDB", "CSI2_PDB", "PD_FAULT";
>+		pinctrl-0 = <&pinctrl_expander2_irq>;
>+		pinctrl-names = "default";
>+	};
>+
>+	usb_typec: usb-typec@67 {
>+		compatible = "ti,hd3ss3220";
>+		reg = <0x67>;
>+		interrupt-parent = <&gpio4>;
>+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
>+		pinctrl-0 = <&pinctrl_hd3ss3220_irq>;
>+		pinctrl-names = "default";
>+
>+		ports {
>+			#address-cells = <1>;
>+			#size-cells = <0>;
>+
>+			port@0 {
>+				reg = <0>;
>+
>+				hd3ss3220_in_ep: endpoint {
>+					remote-endpoint = <&dwc3_out_ep>;
>+				};
>+			};
>+
>+			port@1 {
>+				reg = <1>;
>+
>+				hd3ss3220_out_ep: endpoint {
>+					remote-endpoint = <&dwc3_in_ep>;
>+				};
>+			};
>+		};
>+	};
>+};
>+
>+&iomuxc {
>+	pinctrl_csi0_pwn: csi0-pwn-grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07	0x9
>+		>;
>+	};
>+
>+	pinctrl_csi0_rst: csi0-rst-grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08	0x9
>+			MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1	0x59
>+		>;
>+	};
>+
>+	pinctrl_csi1_pwn: csi1-pwn-grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05	0x9
>+		>;
>+	};
>+
>+	pinctrl_csi1_rst: csi1-rst-grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_RXD2__GPIO4_IO04	0x9
>+			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x59
>+		>;
>+	};
>+
>+	pinctrl_expander2_irq: expander2-irqgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_TXC__GPIO4_IO11		0x140 /* GPIO_P247 */
>+		>;
>+	};
>+
>+	pinctrl_gpio1: gpio1grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x16 /* DSI_RST */
>+		>;
>+	};
>+
>+	pinctrl_gpio4: gpio4grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_RXD4__GPIO4_IO06		0x16 /* GPIO_P249 */
>+			MX8MP_IOMUXC_SAI1_RXD5__GPIO4_IO07		0x16 /* GPIO_P251 */
>+			MX8MP_IOMUXC_SAI1_RXD7__GPIO4_IO09		0x16 /* GPIO_P255 */
>+			MX8MP_IOMUXC_SAI1_TXD4__GPIO4_IO16		0x16 /* DSI_BL_EN */
>+			MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17		0x16 /* DSI_VDDEN */
>+		>;
>+	};
>+
>+	pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x41 /* GPIO_P253 */
>+		>;
>+	};
>+
>+	pinctrl_hdmi: hdmigrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
>+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
>+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
>+		>;
>+	};
>+
>+	pinctrl_lvds0_backlight_pwr: lvds0-bl-pwrgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14		0x19 /* LVDS0_BL_EN */
>+		>;
>+	};
>+
>+	pinctrl_lvds0_pwr: lvds0-pwrgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_TXD0__GPIO4_IO12		0x19 /* LVDS0_VDDEN */
>+		>;
>+	};
>+
>+	pinctrl_otg_vbus: otgvbusgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI1_RXFS__GPIO4_IO00		0x19 /* USB_OTG_PWR_EN */
>+		>;
>+	};
>+};

Put iomuxc at end of the file.

>+
>+&lcdif3 {
>+	status = "okay";
>+};
>+
>+&pcie {
>+	vpcie-supply = <&reg_pcie0>;
>+	status = "okay";
>+};
>+
>+&pcie_phy {
>+	clocks = <&pcie0_refclk>;
>+	clock-names = "ref";
>+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
>+	status = "okay";
>+};
>+
>+&usb_dwc3_0 {
>+	adp-disable;
>+	dr_mode = "otg";
>+	hnp-disable;
>+	srp-disable;
>+	usb-role-switch;
>+	status = "okay";
>+
>+	ports {
>+		#address-cells = <1>;
>+		#size-cells = <0>;
>+
>+		port@0 {
>+			reg = <0>;
>+
>+			dwc3_out_ep: endpoint {
>+				remote-endpoint = <&hd3ss3220_in_ep>;
>+			};
>+		};
>+
>+		port@1 {
>+			reg = <1>;
>+
>+			dwc3_in_ep: endpoint {
>+				remote-endpoint = <&hd3ss3220_out_ep>;
>+			};
>+		};
>+	};
>+};
>+
>+&usb_dwc3_1 {
>+	dr_mode = "host";
>+	status = "okay";
>+};
>diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
>new file mode 100644
>index 000000000000..f235c6aae924
>--- /dev/null
>+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
>@@ -0,0 +1,839 @@
>+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+/*
>+ * Copyright 2024 TechNexion Ltd.
>+ *
>+ * Author: Ray Chang <ray.chang@technexion.com>
>+ */
>+
>+#include <dt-bindings/phy/phy-imx8-pcie.h>
>+#include <dt-bindings/usb/pd.h>
>+#include "imx8mp.dtsi"
>+
>+/ {
>+	chosen {
>+		stdout-path = &uart2;
>+	};
>+
>+	enet_power_en: enet-power-en {
>+		compatible = "regulator-fixed";
>+		pinctrl-0 = <&pinctrl_enet_pwr>;
>+		pinctrl-names = "default";
>+		regulator-always-on;
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "enet_pwr";
>+		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
>+		enable-active-high;
>+	};

No users?

>+
>+	i2c_gpio_brd_conf: i2c-gpio-brd-conf {
>+		compatible = "i2c-gpio";
>+		#address-cells = <1>;
>+		#size-cells = <0>;
>+		clock-frequency = <100000>;
>+		pinctrl-0 = <&pinctrl_i2c_brd_conf>;
>+		pinctrl-names = "default";
>+		scl-gpios = <&gpio4 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>+		sda-gpios = <&gpio4 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>+	};
>+
>+	reg_usdhc2_vmmc: regulator-usdhc2 {
>+		compatible = "regulator-fixed";
>+		off-on-delay-us = <12000>;
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "VSD_3V3";
>+		startup-delay-us = <100>;
>+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>+		enable-active-high;
>+	};
>+
>+	rfkill {
>+		compatible = "rfkill-gpio";
>+		name = "rfkill";
>+		pinctrl-0 = <&pinctrl_bt_ctrl>;
>+		pinctrl-names = "default";
>+		radio-type = "bluetooth";
>+		shutdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
>+	};
>+
>+	wl_reg_on: wlreg-on {
>+		compatible = "regulator-fixed";
>+		off-on-delay-us = <20000>;
>+		pinctrl-0 = <&pinctrl_wifi_ctrl>;
>+		pinctrl-names = "default";
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "WL_REG_ON";
>+		startup-delay-us = <100>;
>+		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
>+		enable-active-high;
>+	};
>+
>+	memory@40000000 {
>+		reg = <0x0 0x40000000 0 0xc0000000>,
>+		      <0x1 0x00000000 0 0xc0000000>;
>+		device_type = "memory";
>+	};
>+};
>+
>+&A53_0 {
>+	cpu-supply = <&buck2>;
>+};
>+
>+&A53_1 {
>+	cpu-supply = <&buck2>;
>+};
>+
>+&A53_2 {
>+	cpu-supply = <&buck2>;
>+};
>+
>+&A53_3 {
>+	cpu-supply = <&buck2>;
>+};
>+
>+&ecspi1 {
>+	#address-cells = <1>;
>+	#size-cells = <0>;

Drop these two lines, imx8mp.dtsi has them.

>+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
>+	num-cs = <1>;
>+	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+};
>+
>+&eqos {
>+	phy-handle = <&ethphy0>;
>+	phy-mode = "rgmii-id";
>+	pinctrl-0 = <&pinctrl_eqos>;
>+	pinctrl-names = "default";
>+	snps,force_thresh_dma_mode;
>+	snps,mtl-rx-config = <&mtl_rx_setup>;
>+	snps,mtl-tx-config = <&mtl_tx_setup>;
>+	status = "okay";
>+
>+	mdio {
>+		compatible = "snps,dwmac-mdio";
>+		#address-cells = <1>;
>+		#size-cells = <0>;
>+
>+		ethphy0: ethernet-phy@1 {
>+			compatible = "ethernet-phy-ieee802.3-c22";
>+			reg = <1>;
>+			eee-broken-1000t;
>+			reset-assert-us = <35000>;
>+			reset-deassert-us = <75000>;
>+			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
>+			realtek,clkout-disable;
>+		};
>+	};
>+
>+	mtl_rx_setup: rx-queues-config {
>+		snps,rx-queues-to-use = <5>;
>+		snps,rx-sched-sp;
>+
>+		queue0 {
>+			snps,dcb-algorithm;
>+			snps,map-to-dma-channel = <0>;
>+			snps,priority = <0x1>;
>+		};
>+
>+		queue1 {
>+			snps,dcb-algorithm;
>+			snps,map-to-dma-channel = <1>;
>+			snps,priority = <0x2>;
>+		};
>+
>+		queue2 {
>+			snps,dcb-algorithm;
>+			snps,map-to-dma-channel = <2>;
>+			snps,priority = <0x4>;
>+		};
>+
>+		queue3 {
>+			snps,dcb-algorithm;
>+			snps,map-to-dma-channel = <3>;
>+			snps,priority = <0x8>;
>+		};
>+
>+		queue4 {
>+			snps,dcb-algorithm;
>+			snps,map-to-dma-channel = <4>;
>+			snps,priority = <0xf0>;
>+		};
>+	};
>+
>+	mtl_tx_setup: tx-queues-config {
>+		snps,tx-queues-to-use = <5>;
>+
>+		queue0 {
>+			snps,dcb-algorithm;
>+			snps,priority = <0x1>;
>+		};
>+
>+		queue1 {
>+			snps,dcb-algorithm;
>+			snps,priority = <0x2>;
>+		};
>+
>+		queue2 {
>+			snps,dcb-algorithm;
>+			snps,priority = <0x4>;
>+		};
>+
>+		queue3 {
>+			snps,dcb-algorithm;
>+			snps,priority = <0x8>;
>+		};
>+
>+		queue4 {
>+			snps,dcb-algorithm;
>+			snps,priority = <0xf0>;
>+		};
>+	};
>+};
>+
>+&flexcan1 {
>+	pinctrl-0 = <&pinctrl_flexcan1>;
>+	pinctrl-names = "default";
>+};
>+
>+&flexcan2 {
>+	pinctrl-0 = <&pinctrl_flexcan2>;
>+	pinctrl-names = "default";
>+};
>+
>+&i2c1 {
>+	clock-frequency = <100000>;
>+	pinctrl-0 = <&pinctrl_i2c1>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+
>+	pmic: pmic@25 {
>+		compatible = "nxp,pca9450c";
>+		reg = <0x25>;
>+		interrupt-parent = <&gpio1>;
>+		interrupts = <3 GPIO_ACTIVE_LOW>;
>+		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */
>+		pinctrl-names = "default";
>+		pinctrl-0 = <&pinctrl_pmic>;
>+
>+		regulators {
>+			buck1: BUCK1 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <2187500>;
>+				regulator-min-microvolt = <600000>;
>+				regulator-name = "BUCK1";
>+				regulator-ramp-delay = <3125>;
>+			};
>+
>+			buck2: BUCK2 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <2187500>;
>+				regulator-min-microvolt = <600000>;
>+				regulator-name = "BUCK2";
>+				regulator-ramp-delay = <3125>;
>+				nxp,dvs-run-voltage = <950000>;
>+				nxp,dvs-standby-voltage = <850000>;
>+			};
>+
>+			buck4: BUCK4 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <3400000>;
>+				regulator-min-microvolt = <600000>;
>+				regulator-name = "BUCK4";
>+			};
>+
>+			buck5: BUCK5 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <3400000>;
>+				regulator-min-microvolt = <600000>;
>+				regulator-name = "BUCK5";
>+			};
>+
>+			buck6: BUCK6 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <3400000>;
>+				regulator-min-microvolt = <600000>;
>+				regulator-name = "BUCK6";
>+			};
>+
>+			ldo1: LDO1 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <3300000>;
>+				regulator-min-microvolt = <1600000>;
>+				regulator-name = "LDO1";
>+			};
>+
>+			ldo2: LDO2 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <1150000>;
>+				regulator-min-microvolt = <800000>;
>+				regulator-name = "LDO2";
>+			};
>+
>+			ldo3: LDO3 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <3300000>;
>+				regulator-min-microvolt = <800000>;
>+				regulator-name = "LDO3";
>+			};
>+
>+			ldo4: LDO4 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <3300000>;
>+				regulator-min-microvolt = <800000>;
>+				regulator-name = "LDO4";
>+			};
>+
>+			ldo5: LDO5 {
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-max-microvolt = <3300000>;
>+				regulator-min-microvolt = <1800000>;
>+				regulator-name = "LDO5";
>+			};
>+		};
>+	};
>+};
>+
>+&i2c2 {
>+	/* I2C_B on EDMG */
>+	clock-frequency = <400000>;
>+	pinctrl-0 = <&pinctrl_i2c2>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+};
>+
>+&i2c3 {
>+	clock-frequency = <100000>;
>+	pinctrl-0 = <&pinctrl_i2c3>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+};
>+
>+&i2c4 {
>+	/* I2C_A on EDMG */
>+	clock-frequency = <100000>;
>+	pinctrl-0 = <&pinctrl_i2c4>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+};
>+
>+&i2c5 {
>+	/* I2C_C on EDMG */
>+	clock-frequency = <400000>;
>+	pinctrl-0 = <&pinctrl_i2c5>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+};
>+
>+&iomuxc {
>+	pinctrl-0 = <&pinctrl_hog>;
>+	pinctrl-names = "default";
>+
>+	pinctrl_bt_ctrl: bt-ctrlgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05	0x41 /* BT_REG_ON */
>+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x41 /* BT_WAKE_HOST */
>+		>;
>+	};
>+
>+	pinctrl_ecspi1_cs: ecspi1csgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09	0x40000
>+		>;
>+	};
>+
>+	pinctrl_ecspi1: ecspi1grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK	0x82
>+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI	0x82
>+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO	0x82
>+		>;
>+	};
>+
>+	pinctrl_enet_pwr: enetpwrgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11	0x11
>+		>;
>+	};
>+
>+	pinctrl_eqos: eqosgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC			0x3
>+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO			0x23
>+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0		0x91
>+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1		0x91
>+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2		0x91
>+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3		0x91
>+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x91
>+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x91
>+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0		0x1f
>+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1		0x1f
>+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2		0x1f
>+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3		0x1f
>+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x1f
>+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1f
>+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09			0x19
>+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12			0x19
>+		>;
>+	};
>+
>+	pinctrl_flexcan1: flexcan1grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI5_RXD2__CAN1_RX		0x154
>+			MX8MP_IOMUXC_SAI5_RXD1__CAN1_TX		0x154
>+		>;
>+	};
>+
>+	pinctrl_flexcan2: flexcan2grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
>+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
>+		>;
>+	};
>+
>+	pinctrl_hog: hoggrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000019
>+		>;
>+	};
>+
>+	pinctrl_i2c1: i2c1grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001a3
>+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001a3
>+		>;
>+	};
>+
>+	pinctrl_i2c2: i2c2grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001a3
>+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001a3
>+		>;
>+	};
>+
>+	pinctrl_i2c3: i2c3grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c3
>+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c3
>+		>;
>+	};
>+
>+	pinctrl_i2c4: i2c4grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL		0x400001c3
>+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA		0x400001c3
>+		>;
>+	};
>+
>+	pinctrl_i2c5: i2c5grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL		0x400001a3
>+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001a3
>+		>;
>+	};
>+
>+	pinctrl_i2c_brd_conf: i2cbrdconfgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x1c3 /* BRD_CONF_SCL, bitbang */
>+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29	0x1c3 /* BRD_CONF_SDA, bitbang */
>+		>;
>+	};
>+
>+	pinctrl_pcie: pciegrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x41 /* PCIE CLKREQ */
>+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x41 /* PCIE WAKE */
>+			MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x41 /* PCIE RST */
>+		>;
>+	};
>+
>+	pinctrl_pmic: pmicirqgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
>+		>;
>+	};
>+
>+	pinctrl_pwm1: pwm1grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT	0x116
>+		>;
>+	};
>+
>+	pinctrl_pwm2: pwm2grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT	0x116
>+		>;
>+	};
>+
>+	pinctrl_pwm3: pwm3grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI5_RXC__PWM3_OUT		0x116
>+		>;
>+	};
>+
>+	pinctrl_pwm4: pwm4grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT	0x116
>+		>;
>+	};
>+
>+	pinctrl_sai2: sai2grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI2_MCLK	0xd6
>+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
>+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
>+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
>+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
>+		>;
>+	};
>+
>+	pinctrl_sai3: sai3grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
>+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
>+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
>+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
>+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
>+		>;
>+	};
>+
>+	pinctrl_uart1: uart1grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
>+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
>+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
>+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
>+		>;
>+	};
>+
>+	pinctrl_uart2: uart2grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
>+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
>+			MX8MP_IOMUXC_UART4_RXD__UART2_DCE_CTS	0x140
>+			MX8MP_IOMUXC_UART4_TXD__UART2_DCE_RTS	0x140
>+		>;
>+	};
>+
>+	pinctrl_uart3: uart3grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD1_DATA7__UART3_DCE_RX	0x140
>+			MX8MP_IOMUXC_SD1_DATA6__UART3_DCE_TX	0x140
>+			MX8MP_IOMUXC_SD1_STROBE__UART3_DCE_CTS	0x140
>+			MX8MP_IOMUXC_SD1_RESET_B__UART3_DCE_RTS	0x140
>+		>;
>+	};
>+
>+	pinctrl_uart4: uart4grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_ECSPI2_SCLK__UART4_DCE_RX	0x140
>+			MX8MP_IOMUXC_ECSPI2_MOSI__UART4_DCE_TX	0x140
>+			MX8MP_IOMUXC_ECSPI2_MISO__UART4_DCE_CTS	0x140
>+			MX8MP_IOMUXC_ECSPI2_SS0__UART4_DCE_RTS	0x140
>+		>;
>+	};
>+
>+	pinctrl_usdhc1: usdhc1grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
>+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
>+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
>+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
>+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
>+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
>+		>;
>+	};
>+
>+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
>+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
>+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
>+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
>+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
>+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
>+		>;
>+	};
>+
>+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
>+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
>+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
>+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
>+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
>+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
>+		>;
>+	};
>+
>+	pinctrl_usdhc2: usdhc2grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
>+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
>+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
>+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
>+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
>+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
>+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc1
>+		>;
>+	};
>+
>+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
>+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
>+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
>+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
>+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
>+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
>+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
>+		>;
>+	};
>+
>+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
>+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
>+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
>+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
>+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
>+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
>+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
>+		>;
>+	};
>+
>+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
>+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
>+		>;
>+	};
>+
>+	pinctrl_usdhc3: usdhc3grp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
>+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
>+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
>+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
>+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
>+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
>+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
>+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
>+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
>+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
>+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
>+		>;
>+	};
>+
>+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
>+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
>+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
>+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
>+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
>+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
>+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
>+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
>+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
>+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
>+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
>+		>;
>+	};
>+
>+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
>+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
>+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
>+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
>+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
>+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
>+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
>+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
>+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
>+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
>+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
>+		>;
>+	};
>+
>+	pinctrl_wdog: wdoggrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
>+		>;
>+	};
>+
>+	pinctrl_wifi_ctrl: wifi-ctrlgrp {
>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00	0x41 /* WL_REG_ON */
>+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x41 /* WL_WAKE_HOST */
>+		>;
>+	};
>+};

Put iomuxc at end of this file.


Regards,
Peng
