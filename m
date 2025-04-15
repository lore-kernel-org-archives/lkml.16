Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641068BE5;
	Tue, 15 Apr 2025 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744741865; cv=fail; b=fPMjZV6cd4GcBAGe3EuV5PPzdsVjKrZl3wPgrCGWVruAph3L4CREfYWfGb5CbGl71nf1XMaifkcnjl7JIghP4phM8pSVwHeM/PIxoWqLf6XonTMKBL56ip6JYnfia6Wi59TEn5elSZk+q13Dw5pU0HEZrBlPMd+Vti/NgULchpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744741865; c=relaxed/simple;
	bh=P8wc3I6HtDdPCTZlx5mCLIgcRyIxN3PqLmX7QIVMY5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TVSL8x+nhJRCgLascAQigomGufMM1b4KWSa9d2Jc+hTn6YaNQVsZnLSyQ60T22HYT0C53VVhxgZGe3mSBYuKtFW/7/xg0GuKRr95Z0OeMUjRGgvHTVSEFnmuqOyo4koRGoo0NzTmqyZruT9PlvTSxtDpY8TwezStE6iI4qPjBX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RuPpJ6dU; arc=fail smtp.client-ip=40.107.22.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RuPpJ6dU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAquEF/QLhYRoEnIvNVz6GVw9WtlT5rNavYtR+DMrHvm/RkQA3K7b41IWmvX2fSyP9tnNLrDlkY/sg0f7/7L+y76Q++oagghI6MEC45hJGbJWDnZbjXxU+6btZvrEEc6DBhxejVC46uko2dBEHb+cKnkG6kKPXrIX+/34NjMAZfFKR3W3Btd/0ozg6onIOCevyy+4WwZllFSvk//95ho/oFo7zI1TjwifySUanJXLbvP4JLdMlBEYOgoW7Pxd53e+Cw/1zHo9PGtFH3qImiTONGVc3IBXmQOPHpcoMW4FKBOMozYe/dKdbFV7Crn/fC4bsVIQ3aydqhjKIDoYK/MUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMuIQjhmXCvM26ZnqO2A6hT2z1GDpQOu0QQsu7jkcnk=;
 b=RZ2tBxuNbsLQv7DjgTbgp82p+5YB+XfXly3BJzHR7NNe2LvlJpoX3+hmjxPlMyJHoznVKZSHVisiFg90c3sKvUR/rHhFhTMOeuOTnxlVI79RUVWynkyfFiD+MVR4+OKzynHdKE0/feBU6xZ+JvIFs++m/tF4W5M556yFoLdg/yfKj2uQBAn2l/tuohsggZHwV/58yIfIdtk+X2CR1aAwOKAyY4sLScPnfdpHeqEgxq+18/3xpDCgeiIFGbX12fIXeqOlpwnuFJ3BQa2Y34/ZPXi1JY3ixxRtZtE9/TuUxSpsjB8Oy5gRBlAEJ8xMmJ1ay1uyfEM026ODTuHXa/V0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMuIQjhmXCvM26ZnqO2A6hT2z1GDpQOu0QQsu7jkcnk=;
 b=RuPpJ6dU9GRlb8mIO0rRNhGCQ5MTpDzbmt8cYxHSgFbgfyMB+4Zfz6ngtTz2Z5YlNf7x55ry1Zl3o9TAjX1GSNB+S7PsQGE+jESdEhbPhmQ4NpUBQK4s5tCEtGGpqF9RSzHdUdsOe9pq7Vsn1NrfGpusxDZs/K6QbTSwVw8jRb3LK0FQtHD+hdt0g+JIVh/HoMpSeGrIDIgVxm6xz+U9SqMmm6oiKzxEYw3AO8hZefBq4/6dPlfXov8ddCTySiJd8qfnugXeXtoNHziYkq8E3Qm8XPkQStylxUHHJAG8Tc1lt/0oTaVGZedhmyyvGeDVWDDkGomoK3M475Gq3r6Ntw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB11059.eurprd04.prod.outlook.com (2603:10a6:102:485::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 18:30:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:30:57 +0000
Date: Tue, 15 Apr 2025 14:30:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 02/15] arm64: dts: freescale: imx93-phycore-som: Add
 EEPROM support
Message-ID: <Z/6l2btFEp1LsXWV@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-3-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-3-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8P221CA0036.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB11059:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfe6d89-27ec-4c8f-8d4e-08dd7c4baa24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lcg4YsBwj766APQ+XiEetQQJ0hNbFQIBoPvCaIipfImcPjRuNViPd5oTdEVV?=
 =?us-ascii?Q?tmhdjxV7nfby9dWhCFDrN7hG+c9l2SYYHslk6V7vHf4d0q9pKGG6OoadjZuA?=
 =?us-ascii?Q?89iiG0MNHAMIuboxcuZeWJqCVvjfAaPguYBn9YvuJfR6+TM7SP/SJ1iw7MyG?=
 =?us-ascii?Q?QJ1H2U2xn+iIe5UOkRNvXqiD34YzNqORTO6gJ1sZOXMm2jqtohZf1DjR/Jcy?=
 =?us-ascii?Q?23k7bV+tzfEH3GimctTEOKLSewkNz2dIss1XNdIScW96MQiIo9CHfrMRMO74?=
 =?us-ascii?Q?DE3iQW0T3mnEu+Mv2Hzj2Vz3EZ5uwzVEvIc600FnNMTtCGzcv/NoAZ5+onfF?=
 =?us-ascii?Q?+gmdSEfBu7WUo6RvRD12To2Zbxa3Y/FwuI7tCeTfxhMb8CiF7JNrh+tut597?=
 =?us-ascii?Q?xE3kb9N6iO78etunTlGD9ukZwocNS1o6y2ywBpyi1QBeecQHsrt/P6QuS29k?=
 =?us-ascii?Q?NwQmSP0Eib6fdGHSzsMB9Vv4zKTzXfuFVE9g6NB/OZBP7pG/BKZjhJ7SzI3G?=
 =?us-ascii?Q?TGWuuQL+Ciuf5S8nWwx7wCG11ZidSzSEX9hHRgFtN06xzTY/RGaH2PDPyVIL?=
 =?us-ascii?Q?wxZDEsjOYsyeC1/WdfA1cCq2jgeAh90hvKSk9l3Wh5+vOZtUXZYP9ORp+EfI?=
 =?us-ascii?Q?AR4TJki7FTlLS22pkxmuGFkjq18Lzsspo0+nKoTDAtJpa6Gt0SAmqiTCGkMc?=
 =?us-ascii?Q?K+eWdYfOA8+uUxnEmIlR6vLJEuUg5GylrH2h7u7yCWTS4H1e37HXdrUmiD8+?=
 =?us-ascii?Q?/siByY87JVgxSBCJ1XZkjuj8qBk6P63TytoNaxgaT2F85tvWYhBy4lwcldZl?=
 =?us-ascii?Q?ec0f1B6CAlU4d9nDdWWV75Lfao8rfzgH44xqN7v2IoQag1mdz1RjK4l5OBHP?=
 =?us-ascii?Q?odfZCIwnppk99tmhd9BFLOWQEdg/LQ9NaU5x6VNKsjQjqbArxG+i5h9f7lX7?=
 =?us-ascii?Q?vC9jWlcnuw1ssJoSVogIiObmoVEiwqdIf97A1UOChgMX3K6daujFwUm+Qc6R?=
 =?us-ascii?Q?ZJ08nSybWaMswmSbnZ7QAmUHW5vetGDFRm9j5xobGVeWSKi6DSCEEGUChPdE?=
 =?us-ascii?Q?MI94hLt79xyuFsr2j2BMLXwlBT+UBcHjHXhulCaJ1a1unRo6NAlDxguySXzS?=
 =?us-ascii?Q?hBasA3/Hn885UP0t/XQCJyNiNHAPVuu3m+jBseo8d147HbLHbOEEyLD5VC1r?=
 =?us-ascii?Q?YN3fomzpJzOTWcpWZMH0oKFWMqxhgPjQ7/La+F+8zMCVo5kxafI28DCMhMFf?=
 =?us-ascii?Q?9WhNoJgryugq5fpG0YGKSp+dEMT4kGXX5yAUh4U+PjT1HDk5wPRghYIsX9Be?=
 =?us-ascii?Q?YU8YsDKGoEohW3uq27nA6dswDJ6myNN7w830LJqaXbZfZMhyW0TKeVQekhBc?=
 =?us-ascii?Q?WDAJur99sr8xBA9T/Aj1Adsz0SpCe94YFdz6j8/QREpgnNpxVJcA2+b7Crus?=
 =?us-ascii?Q?K1ZiiOExf7pp4B2yxYRMZY+b34gKyMlxyX5d7Z3nLDAqSH7aIYevxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jMtZLSLz3xSBJd7Q4Iu6tdWa+G5+0VsEkpvNv99E95yc+BySwufaJIRe/gsr?=
 =?us-ascii?Q?TAZebyIOWCeNQONYn4ctBaF8N9aghWaKVdLdcdwWsTlv/ef+G8u8Qn7PFyKa?=
 =?us-ascii?Q?7EJl/T7ickY4XhARaLxhAyuwmXHopcTXAFk2s8lgZ7eGXf6i3eWB6Ljm1Dp2?=
 =?us-ascii?Q?j/N5agAy5ZZA+OmRgkRoKOhkv5cIZvqIADxbdwS/tgoMhHkH3hhxjTDbILv7?=
 =?us-ascii?Q?2QTzS39Zee+P/dSaf12bFMYUUwF/P/96TlE1U44YDI9uEk5xamGI/j5nVKAi?=
 =?us-ascii?Q?4W+3noTY3597+i9bHMdnrEIAlkCqJF6mjNy98aamlCvBaE2DXBwKEIpLHsal?=
 =?us-ascii?Q?8MuCGmynavOAr05/M5+9xhTJCPB8RyEdX6jVfjtTLX8puPPXk+x+hUDivTdT?=
 =?us-ascii?Q?gAnybS3ksnq3TWlLSUWueSUN7V/hxeZ3NNhYodCE0Phmt9s6gjbbw8xCx21x?=
 =?us-ascii?Q?vfLq+cnpkI/qU9DXJMkBFl0UkIH5Say9mp8eLt3K+hsxnqfH4N1jjrLQYN1L?=
 =?us-ascii?Q?8k5n0ZlPdp0jt8d88hD9u0LU3Q+154EgL5WtSF5JoWVTlOrxr41WgWZkIx5O?=
 =?us-ascii?Q?8WQZ15Q017vy+JfwixW2GJkcxvjPVyX9Kt9TtAwV2BVUHwYBtw9SEnr8IqhN?=
 =?us-ascii?Q?dV+OfpLCqRBXra4k/f3/8SYBHdKvaVtMt6Vbmz1GWUKU5BUw/9W5NaeIS6QO?=
 =?us-ascii?Q?npWyUvcUcEJlxPdHsC2ZH22qPhj3LocJihuZKocstfEQekv+L8+ScrIuzXjF?=
 =?us-ascii?Q?yFyvgB1BJxxSewwKJQNiSFIhCH0rJTLVIHwU6kbvzcsweCSXudBucyDZIuw/?=
 =?us-ascii?Q?E8S2yO7AD/B2L6ggwVSS1FKxHvFO5WBLcHcV6W3COzTDU2zozedm3ed9dk/W?=
 =?us-ascii?Q?dRCleqkl0sV2CCf51oQAdKfjIvodbHH6VXkzAYp75PkExhVrJ8ULccPYfvfk?=
 =?us-ascii?Q?sd6ds1AaiLdZ0GHqDsaQsgG1YTlesDZWUV+Yq5CnHEHpbMCbc2Kwk9MSfpS4?=
 =?us-ascii?Q?MC5XaFbQWd6YEmAIbCowmEWX4+i6awjEcdF+d0DNgP6UZ06uPfoXCOkDiTHs?=
 =?us-ascii?Q?3L2ujfiJJhPSDTsvpP4zWyt9flY92qb/kWgfDChYGGMDNhuwIcQ/5t/anRZr?=
 =?us-ascii?Q?474vpEyl2E1BkLpxJQ6klcIku29StNlDpAcXBai/sJwstyqQvblszcffMera?=
 =?us-ascii?Q?J/8/uTh6aphCO4QWKZjUmUvHDvbfBKo6PFRx/BlIYoe09fIumLCuaWKSRemU?=
 =?us-ascii?Q?6OJqHUuuwuqw2iNOLew+hPCsuSE8cDtwziuiyENY1T0WRpiqQ1PjzjXo2Cks?=
 =?us-ascii?Q?+ClOCEXceZT9VOTN55HQebA5J2fI8RCgoAX5eZ0WCzDw/vdRm9DrDD2R+MHb?=
 =?us-ascii?Q?yfKy35lrMIH98okg7lQNAuEhj22l2OnruK08NIGnFeG2CFBR/UhPNJ1G1EpV?=
 =?us-ascii?Q?611ZXeuC+B9BjxG8i1rBv5tdWkjeXxntY+tpa1QlUxuBIvyeCvGgGD3945A3?=
 =?us-ascii?Q?NDx6qWn8NG6E3vmciFPGnnebOcqPgYbXhX64A8U95VrO2+mT89L5aF0Avu1j?=
 =?us-ascii?Q?FxpKymxMuHaDZeesEEY/LudV7awOpET8YGsK+SJs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfe6d89-27ec-4c8f-8d4e-08dd7c4baa24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:30:57.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvrRpUBZpDp6nMsvaHL6pNwA/Exitw+jU2Q/P7NdwSMJeaj0W1lu3XYHcjtM/+Hi5trv1ULDZNNJioo0VQ74qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11059

On Tue, Apr 15, 2025 at 06:32:58AM +0200, Primoz Fiser wrote:
> Add support for the EEPROM chip available on I2C3 bus (address 0x50),
> used for the PHYTEC SOM detection.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - move reg property ahead of pagesize
>
>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 507a71f9294b..0528e293c03d 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -154,6 +154,14 @@ ldo5: LDO5 {
>  			};
>  		};
>  	};
> +
> +	/* EEPROM */
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +		vcc-supply = <&buck4>;
> +	};
>  };
>
>  /* eMMC */
> --
> 2.34.1
>
