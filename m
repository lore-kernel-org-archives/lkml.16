Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438812AEE9;
	Mon, 19 May 2025 18:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680474; cv=fail; b=Wzu7Pi8ppviePBmxvxWKDSfI3cLSYki5gHAwSzwwP2TGCI24XDzJ6zq11dMLDTOhK2tZ1pPJixI7qLkQ4OXM5XHGi2HNrSmFK2K8HC6QcEidHJoMc3IdN+yalPWFo2ueEKTvN045gyNm80yZHlP901bIhLCLbm7uSl5depfJskY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680474; c=relaxed/simple;
	bh=XdQiupPAE/XQuFVVuQb26ZE3fsWe1of0vAZ4YDrY08Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fYHbDoxdZRPfjUBQchUI7ioTrmY8ClbKdjUM3zwi3DyDwh3i1EO6IDxOPFGF2ocgKoWLI6aipf0TzhSQsP3ui9NlShQZaimVyt2vhevW+DiSRJguYyUNETsysR3iFydP1EyEiBfYiI7YC/h683w2eujVy5QSUzNMxC5OkJFhBmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BErnjr6B; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BErnjr6B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l38TT5owdTzgwaRYwFywzSMz2d0R5TX/+K8UjRD273uH9hs5bUKyw+vqALRgh989FSJ2DlPZrkvLDVmWvaYgsaXkCdMwpENXr4njk1OqjilU2N6ay1gU4dVbTdLKnQwoSUts3AhZjr2FVlr7NZTYVzlQMzeJoLNW3wuZ5xOKMtOassMHugrM8y2wOfWXm7lBrabTSY+iOgJMmJ3JJY5slPx3HyuRVh4mr0oJqIPms1r6/SGiWxNv6Ih+8STrm8kH66+QHDqWfqyCg+ER3UdkkF7vp+hFCZtiVnwatpIUghC1DFfRh/uSIb/hEFOwT/2RAqUqZETeCHWcHFrPhuiCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiQ20UwFL9OZ8gt6jmQKPhpd6Gpphuw77WNXAr7/NcM=;
 b=Jt9/1wy+rPNOVnAGSZeyD9yidU4xbD4e3f6Rq/JiDBCRP5SYuk3RnkLmWT2nqNEdqIf8Frx4XiQ7VAQBnERK/GOIcbcXJ99tAmzzfnPEq2keXaNSJhHZ4c52A7cP2z8aMymmSUeFFX3mO+Z8h563QU6UJtiSS7hcV2xAXAAG1jZmYsYtOtUjKdjWQwu9+ef9CoLUpmzp+R4Krbqd4dsJozrlg+Ms5FVAz5BTtwK7TIWdy29+Gk0vLvcVxT3ImIiq8EMSpICGgDJujzZjeITm6ZPm6MesB89IicmNOWDLV1/5sqAaXsFexLSK4gFVREkW1Z975QuyKcMdYxzoVXbjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiQ20UwFL9OZ8gt6jmQKPhpd6Gpphuw77WNXAr7/NcM=;
 b=BErnjr6Beb5DGIBNEHoGcu6G7edRW2xwnJZAD3Dnl7Q8zlYT2L/xkbXMR2UF1wVe+SDX+5vFCupxpFbXRpUR2bZLgqbiGWQSX3+0fr5fofY87XRk7yi/4laTWBDwFNrGMVEaTp0wBw2B+uybG/ciuoqiPQXviKyRMsztLeXtOHV1gkNIEIy5zsJKJ9LIPMya8cQG1foQYRHPB3T4/ChF8TkCS2UNrpslRNk53K5FZ4nGFklk9LXLdcYj5AUO/xG/rd3/S8mcQPI9P5VTRjWWxLhBirBRu/Y3JYKW/EFrdgsR8rWzUtDbASoJ3bhOdIZFyzR4tN9/CSbQK+B1EaEYDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 18:47:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 18:47:47 +0000
Date: Mon, 19 May 2025 14:47:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH 3/6] arm64: dts: imx943-evk: add i2c io expander support
Message-ID: <aCt8zXnIZCkh8/HO@lizhi-Precision-Tower-5810>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515051900.2353627-4-shengjiu.wang@nxp.com>
X-ClientProxiedBy: AM0PR06CA0088.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 17341689-33fe-4e2a-b127-08dd9705a5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HfxYiCfY0TDGt8VZ23UMYSy51SYHYpx8zy6W5pSz5gsqCCfoMzgJ7qNp/4CU?=
 =?us-ascii?Q?Z+1+XzFpmaHn6/LBSFEV3YIFtZtCUcIfNHrPtWy6bPhdD9pBJa+1NBIMjA5S?=
 =?us-ascii?Q?4SNs3+hHaQ2tvC4B6dfUdavP0uaG9+MYPEPAKXV8lDaq1IgxXq9lI9QoMoRs?=
 =?us-ascii?Q?I0E3qbbDhUbMXOuYHA+IWdN3lH2sF2jDuUojCAx3017sAb//gfSNzMB5sX5o?=
 =?us-ascii?Q?vp1bALRVR/gy/bgGuY8pdst3EkIzIZevpbejw1z/hYWQKAAxSj2O//QUYMeN?=
 =?us-ascii?Q?VtmoosaDENJM2V8F8wMn6suJMG8kVasflNJEfgnIV+LXdlYjJ1hmSwMRRL9Y?=
 =?us-ascii?Q?bCgE04eaVuv0gUhmbs3+l9+maCxwCP2sdmiNkw7pU6Xr1RIYE3J8TgB9a6GR?=
 =?us-ascii?Q?829EJcZy+Ossn7wvJnC1F+aBoUvRHSoPMdQgnPFWC66GFI6iWBXQcwoSFqz1?=
 =?us-ascii?Q?ae7cdIJsnR27YuDqjN80F6+riMtlkoKOmrMLRB9R7D66aRPBuHzvnpr0CoNi?=
 =?us-ascii?Q?w9Wv6YdlfHDhrxGEiTByK3H5JBR6Uk0I4fDW1M05ahSSeq25PVi5l32N+ak8?=
 =?us-ascii?Q?gKtqLCTTlf6KsLE9L9mRjAoB5ekvVSp8CelSmgXe6IyEzEwfjT2jt721jmAz?=
 =?us-ascii?Q?xw37J1yXvoFaZnA7uiBbsUehXKhVtN/PAnsCzSO5w69tye3ZJjZk5fdiiBe/?=
 =?us-ascii?Q?dq38wvUwqBkk+wvumEUJPZAZAX5q4fbbBaRLPYVcuUnM3H4fTOq50D5HoOqd?=
 =?us-ascii?Q?PFH9fJxVTIzQYwhV+HzVifESKWYhfIRSBTcpzUllrJchsv53uIGBwxiujS+a?=
 =?us-ascii?Q?Gxgv3EIhQ87xNFMtnS9mCOZcF69/xgYpB3SbKNbcE/T6MABU71Hq2jGyda20?=
 =?us-ascii?Q?FvaoVvHIU0SlXATjcDANFQvMejghhBcL15J8eZBtHI2p6ZZH9Q6aUGOjk9rL?=
 =?us-ascii?Q?zflfAWxfe1glrvIFfuy5q60yXoREnsMd66BDLek0l2paxb9+0zZYtaYQQqQe?=
 =?us-ascii?Q?k5ehN7aFaNZA/SfhHrlifGgj5d/tw+IF44T2uYI6jxt7/x9bFbeFJnCu1fNT?=
 =?us-ascii?Q?EfXoQR8kej3qOJT0Fnx5hjtX4hVyVDDFibHMKzVO1dd9ARdumN4my8riW9Xh?=
 =?us-ascii?Q?1acQ67nSQEj/etCxxQs00Irbhu/W7T6uWn8c99zeQELlgeAUX2Et47uAwbbM?=
 =?us-ascii?Q?zAxklOq7Vz0Nw49hu9vIdpMdHkuFm3TJ5mjkbfwbnMlqFQwBSQ/E8TMMBkmE?=
 =?us-ascii?Q?pAClT+w1oiY5hnJiSOntH7HImhHXsUh2g+827oeHCmNIndtOdCj3Qnef0irR?=
 =?us-ascii?Q?NKNSDv9CmGX6lE8YXxmruvvrqsWuPdcL+3v0qGPLmVHazP68bCLaq0upyaPn?=
 =?us-ascii?Q?rnxP/iyv+Kh0aFPDkGfXZZhU83OkVbASn4a56EnlN0AxQ721nMyS0mSGhkI0?=
 =?us-ascii?Q?27QeT53db31PzSXbYH0AaPDxHmqTVWlOoDESCCyi8t8JwbnjNyijGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JMvx71Y+gsyO3uQ/Hobvx7S5quVzhbpzhZHJPVUEsEVBJoxTaqPjbLj4wSF/?=
 =?us-ascii?Q?2qemfP7Jtv5GTtBtMn2pUoA5E7kTOOMM4gzKHQKwbAknNEq+YYt/7XRrmN+9?=
 =?us-ascii?Q?XqLvWSxO/Myb5Dj2m3cT7yjtU2OjIdYnWHmas5uCO2xZnapvKd84x6oEAfHR?=
 =?us-ascii?Q?xhMuNvtvcgHt98t6f7ZhqcCuwqPPPgNNbHjPWlpegFLbZyk5Xvc+Y6fbPzBp?=
 =?us-ascii?Q?S4YjZmW6VCDjdYLOKvuE/ayE7QPPbecm+7GDck2nusxJ1jWfXp1jGsgjO24l?=
 =?us-ascii?Q?5EbpyPZav81PQol3HidwpWLiYBoDuoogCQQstxOVUAVbX/DWq3f9ZznFRNEe?=
 =?us-ascii?Q?qkUpTcwnkvtH4w26hsfXhpoTbaLV4k1QhwXNCVYLfnvkZzNTTMsjvs/Y0hS/?=
 =?us-ascii?Q?kXAP+8M8lY7LUQRsXn2QdgVCCP14uxDym41W9au6ZhoycEUcnWel2I0fj4V3?=
 =?us-ascii?Q?98Urgt3GdmOQMnJKF06tO0bnbRRpZAfUs1BTnlLjzS5xbWIqOLexNZdKVjwq?=
 =?us-ascii?Q?JCj8+l92qowN//gXntB2BDe8g+fqnj+AWx1l9lTVyIzEhxDczpaCILXShKNX?=
 =?us-ascii?Q?q+AZ4kur1uQQbW/+qPSxGUbizHVw2gH9sGvNTDIzWq5mKOSg4koGdoMr8ZEq?=
 =?us-ascii?Q?rPhOtTjKk5zGOg/fKn4XT9TQzsG+ZW4iRo2o4RNiOyYlfteMfYJFBBpGh9+T?=
 =?us-ascii?Q?J6Lgy9DSgLxDRKidUPTJVZfM+EI7Ty+DpmzMOOPHlVg3WV6Lb52PIFblA5oN?=
 =?us-ascii?Q?kCLfEsP7qWkYUyHQyK1H2IU6WeFilJmR4m3Fw/ijDXvJRPzICQDT55v0v//H?=
 =?us-ascii?Q?hGY9KZCKWORJjeaMJ/XCyeS4fgYXbhqiEspfjLKljCKm9vrw0HI0RvyyQSEL?=
 =?us-ascii?Q?pjgCxwsgcUL1JYvMzbXX0LC7fd2kXM/A3sfEW1Yj0O/mp7feYROPQsyVVLuF?=
 =?us-ascii?Q?FMnVEAKtdbHggn3c3zuz65WHZSm6EnI/IymKtAFMvtmMShT6qNSfJ9ETvq9A?=
 =?us-ascii?Q?0mB/lGiqldBkC+HzoJJJJwue7Zx0oa4wCGSGyz7fFAgkq9Tlk4+IOjOXGhDO?=
 =?us-ascii?Q?u7yuUQGOpmFGzMAN9VaJBIzbpVdQdQsAstIlT7vc6KYkZi4KGfIpmPbIFrJk?=
 =?us-ascii?Q?mQHnL7gcsBtqm4PZkYoPNsl6fPjXYKAH7fzTM9HkECNMKUtALZCTuovpQisU?=
 =?us-ascii?Q?w09jMRbzRkJArbKfaHdMM+BanMh256Ra1Pf2rgKqlHSS3NQnpjfNgtLp+JtV?=
 =?us-ascii?Q?vQ87ln7+x9eJNOweU42dcRC71dWyX5oJSsoHQWkrEAEvThACcJC/wyRSKwFm?=
 =?us-ascii?Q?PePBy8r1RF9GhxBcQ5Z1X28k0e6nATKWKbeI/1pmiUYGWSX3eCszsTRSwu/r?=
 =?us-ascii?Q?QhOrgT0QIwUcfM3fPk7N4FGPa/8nUtandTcvuKfzVWyWjd3D/QZvFVZTHtHp?=
 =?us-ascii?Q?LD6YMtWfqa0QgmiVBTlYv4YxZvV3GbnwePCjM5Lw/zoojqYJ2Ui7ShtE0GWP?=
 =?us-ascii?Q?Ddg5UcXIsmwXUor2ZMfOMltgjEWXeKqSLExOpDcYqUpzKjOLKP9MVJyKfV16?=
 =?us-ascii?Q?yK2OElG0J48iUwHUWdIqr/kAqRpm9ex6HDjkO8gG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17341689-33fe-4e2a-b127-08dd9705a5c3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 18:47:47.0450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHxHybgIEdaNdqu/jJo4Wv0+w4kKpaIlphJIad4XFltMNftA3WI6fmJNXbg4EDLVvbSq2EQAhzLJC/FvuFc1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

On Thu, May 15, 2025 at 01:18:57PM +0800, Shengjiu Wang wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Add i2c io expander support for imx943 evk board.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 105 +++++++++++++++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index a566b9d8b813..ff6e9ac5477f 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -62,6 +62,13 @@ &lpi2c3 {
>  	pinctrl-names = "default";
>  	status = "okay";
>
> +	pca9670_i2c3: gpio@23 {
> +		compatible = "nxp,pca9670";
> +		reg = <0x23>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
>  	pca9548_i2c3: i2c-mux@77 {
>  		compatible = "nxp,pca9548";
>  		reg = <0x77>;
> @@ -102,18 +109,63 @@ i2c@5 {
>  			reg = <5>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			pcal6416_i2c3_u46: gpio@20 {
> +				compatible = "nxp,pcal6416";
> +				reg = <0x20>;
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +
> +				sd-card-on-hog {
> +					gpios = <13 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-high;
> +				};
> +			};
> +
> +			pcal6416_i2c3_u171: gpio@21 {
> +				compatible = "nxp,pcal6416";
> +				reg = <0x21>;
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +			};
>  		};
>
>  		i2c@6 {
>  			reg = <6>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			pcal6416_i2c3_u48: gpio@20 {
> +				compatible = "nxp,pcal6416";
> +				reg = <0x20>;
> +				#interrupt-cells = <2>;
> +				interrupt-controller;
> +				interrupt-parent = <&gpio3>;
> +				interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				pinctrl-0 = <&pinctrl_ioexpander_int>;
> +				pinctrl-names = "default";
> +			};
>  		};
>
>  		i2c@7 {
>  			reg = <7>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			pcal6408_i2c3_u172: gpio@20 {
> +				compatible = "nxp,pcal6408";
> +				reg = <0x20>;
> +				#interrupt-cells = <2>;
> +				interrupt-controller;
> +				interrupt-parent = <&gpio3>;
> +				/* shared int pin with u48 */
> +				interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +			};
>  		};
>  	};
>  };
> @@ -147,18 +199,59 @@ i2c@1 {
>  			reg = <1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			pcal6416_i2c6_u50: gpio@21 {
> +				compatible = "nxp,pcal6416";
> +				reg = <0x21>;
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +			};
>  		};
>
>  		i2c@2 {
>  			reg = <2>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			pcal6408_i2c6_u170: gpio@20 {
> +				compatible = "nxp,pcal6408";
> +				reg = <0x20>;
> +				#interrupt-cells = <2>;
> +				interrupt-controller;
> +				interrupt-parent = <&gpio4>;
> +				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				pinctrl-0 = <&pinctrl_ioexpander_int2>;
> +				pinctrl-names = "default";
> +			};
>  		};
>
>  		i2c@3 {
>  			reg = <3>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			pcal6416_i2c6_u44: gpio@20 {
> +				compatible = "nxp,pcal6416";
> +				reg = <0x20>;
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +
> +				/* eMMC IOMUX selection */
> +				sd1-sel-hog {
> +					gpios = <0 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-high;
> +				};
> +
> +				/* SD card IOMUX selection */
> +				sd2-sel-hog {
> +					gpios = <1 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-high;
> +				};
> +			};
>  		};
>  	};
>  };
> @@ -171,6 +264,18 @@ &lpuart1 {
>
>  &scmi_iomuxc {
>
> +	pinctrl_ioexpander_int2: ioexpanderint2grp {
> +		fsl,pins = <
> +			IMX94_PAD_CCM_CLKO4__GPIO4_IO3		0x31e
> +		>;
> +	};
> +
> +	pinctrl_ioexpander_int: ioexpanderintgrp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO45__GPIO3_IO13		0x31e
> +		>;
> +	};
> +
>  	pinctrl_lpi2c3: lpi2c3grp {
>  		fsl,pins = <
>  			IMX94_PAD_GPIO_IO16__LPI2C3_SDA		0x40000b9e
> --
> 2.34.1
>
