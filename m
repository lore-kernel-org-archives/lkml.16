Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802C1D63C6;
	Thu,  5 Jun 2025 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103131; cv=fail; b=HQhYHu7tN1mw9ZEpw9JLOTzwWFGZQQoGIipylxh4Fcrgap0sueqRJCz2a1AloTgeA0KkEK8UfNizQ0V+li2O+BKv1OSvhphqYvu4lC6t440vJj8QiLlYBqes13HkXBcOMldvgPXJU/osl8CTfhnPLpVBV2h7a075iukj4JOr030=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103131; c=relaxed/simple;
	bh=B6Meh0vJmQe73mDj4qA30kj3Ycd4OcbeGpJFHS9gteE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TREqoHTlC5k9J021E2M6nxpDV4ErBxiEj3EIUCHZwVhAaEOSms6PSOPXt0LWSILKZlsFk1gehM+8iGuqXt9qB/1cSbUKlGnElbwjWtWvjJTJfjDGglByCE4JCIS3bi/eKrjm4990AhyqrqkMrC/+9fwdGeVd4cnRbCBVuqiTzBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RZHI/1VD; arc=fail smtp.client-ip=40.107.241.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RZHI/1VD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7gL7gYYxMY/1r34cSS/ZApd/5EWl2+LTdX4WjCxqauFHf3Y18H94/cJtzc1V0QfTM4+/WGfGTVUN312H3T0gOee9My+y43ocKAuu7xJrA5tJzcI3QZcbc4hsREsmK3hXGVEus3C+p3s4O8b4hbx1v6NrmJ8N/V98uFlMNuL6rky4Rq+fRjoZundB6Ay8ayvDYNMC07k/0OyT5BHTJmIOhXmuvD+el+XBvO91XT0Db14nRoLCTkzYdotqPpXxnUoSXpHDd4//pIl1HgKi6iYK++BNy63+ehhRd74G2G3N68aFGNRaJBWJNRdkjRsy2ZAtXa6pIqIMlqbHiIfB0uxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1hOQmkpsflD/+CcZH3UNpeXbduMr+zQBBS3YBIfNS8=;
 b=Wv20kZChY84UPZyF4/Udo+ZvfwCjQr3voLckdMfTRByozXef7BxrVOfqEmsT6s/IpfyQrmm5kzOKAVII9A2Q/eSiKSXBae0G8ZMD2zbtF8X05V5rWAclIHFm+AKrxH+cvZd0eSXuFEc9gbv1y4x6GuXLv2pDWOOnSHdMtKSsFlhJQ7pdBLeP17dQ7FmLR14ZPAj72YgT0yXRqt/rACOHUMunL395RP2xJV+edVzcYXhxcBDDKR95QsljbIaT2D7lzGaubbsSbiDc+ZG6/DPPAXUcPTWb3RIy76EXTMMVBpEUSH4esnS9mFgZguKweD/PR36zfIjgCLI13uHG+w6+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1hOQmkpsflD/+CcZH3UNpeXbduMr+zQBBS3YBIfNS8=;
 b=RZHI/1VDZuzMoJPwGxCuEu057vRwGakgSRvt4sXMPyHWqO8ZSN4fmNUDzER+X853qiZq8JDFLk06hDE5uYMfksURRXkI0JxIDPLpc/XVi68G2wM7BRsLHX8f/4I1FwUiL2svGJgLViQVfzav2+zgdRXlR82DqWQfWi7UuDkTXnsBxwHqWonrOoEbFAdagAvYRfW9rxB2v+EBv0JMkyeLRtDVRdDAHlfUqqy8QQwYqJ0SzjfF94daRsnqJZKQISdNzXzdgWHxULLVLR86razg5RdqqeW2rtyqg9EGE/eADNErKktYlzBsgg0LhSuvKTMK3kNRD15uj5YfZFTa8vsihw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7206.eurprd04.prod.outlook.com (2603:10a6:10:1a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 5 Jun
 2025 05:58:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 05:58:44 +0000
Date: Thu, 5 Jun 2025 15:04:53 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add support for NXP i.MX93
 FRDM
Message-ID: <20250605070453.GA20292@nxa18884-linux>
References: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de>
 <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c669fe-5526-44b7-da0b-08dda3f60750
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BQX2PIcTwDYD47T9EJ7R3BHJVrENfNCdjXsJlVoI/g46cx0NFifX1xpLS7c+?=
 =?us-ascii?Q?EMXXw+53Z257ICe6y1O3FzFDWyPorWuobJYTK1IWF2VtcsyOgCtr2la0KID+?=
 =?us-ascii?Q?8zKHHaiG0tInVQzxrWad9kAzY1lknOaazNOxLKKm61SiRW5dIgorY81i4VoB?=
 =?us-ascii?Q?e+kX4XrcZdSnPH+LnKHg+YR1JSTsAWjIJ8IEyiKArq20yo86vj4MfkK4j5KN?=
 =?us-ascii?Q?5tqRJDyN3mfissVMa2g2koY/38Hq0M/IBLOsNTTqU35W8zS7OeTeDy26SvMx?=
 =?us-ascii?Q?c7Fc+ZNF4kfIz1q1LXzldC6CmPnGihY0yuTIMzSqblgNMVM3lMhyDsIDWayL?=
 =?us-ascii?Q?jBtnkqfIxxoSWDeperwpyorMggJPUV8jZ3jKfIa7RzirqWlG7PH1uRvyGkUK?=
 =?us-ascii?Q?dWCaCpHfXuPRy3mYuHlM4Wu/t+jlhd1AP3LQN4p9Nu7IH6TroKwU0lb7leLH?=
 =?us-ascii?Q?HjnY23WR5YvGBL8rHEYkG1FLr868ovC7op1BUzVe+FhwQPJHGVFDpikAfg6e?=
 =?us-ascii?Q?yS67RFIPfn962t1TxDA0SfLaExQFx+XeO8klNkukUzUwWXIeYlRa5KnLTSdE?=
 =?us-ascii?Q?L1MAHAzFnt2o6of0NeFwRucnaZvoj+dcjxjAI9TR+Ym1uX473XLiw0sTXc6m?=
 =?us-ascii?Q?4muH1Tt+Vm8bVlEM8Izee7Wf5otoFaYkemNMDysekuSaAXaPrQeitqrmzbkR?=
 =?us-ascii?Q?lUBAHXl3qkWi2UnG1GM+UmXGPxlSIL2oEtqYJfWy4r+5/jVHBEkJmN2vnGfu?=
 =?us-ascii?Q?KoFT47rb4JDyZ1X/MhvMM0Qh7GSwNALU+w981Io0v4KlokOhIbKx4MaiRxjw?=
 =?us-ascii?Q?FNOYqVew5goDgXZ52LSzpUPdNQ3l5lzoRYI915hLPWqwvymCbgGWEQhqPJ6+?=
 =?us-ascii?Q?GAgmEQq2AMOiXDBfm81TbsEFJlRmD/+r2QFFCv5cW5THqB1cI6xSxQiS3PxO?=
 =?us-ascii?Q?pZOfMW8YEHMV4bvd+2AbxZ3DeplJNRzy4OZV84zFnK0pY0GT6Cz0Xj5qfXsv?=
 =?us-ascii?Q?5f0qgP8b74A0dYiDlmIkMpnRBgnXlBsnj/pbHk1AP4ZdIefKWtHpm7afRJJA?=
 =?us-ascii?Q?cmTUUb0zbCKcuHazmSCjRAuxxuBaalGefTlGTcfNmwCEYzlZ77IfNTF6dVih?=
 =?us-ascii?Q?FRMqDnpByP6aM/IT+I+nvthWlhvAJKmzqHHsHfzdkYsCpfpQC4OZ2UVXaOrr?=
 =?us-ascii?Q?YhZnRoMHElkVqhwfFG6hlRV1XZwwv8tzDAdvTKS7iRbj8vEGNpAaGABEDvqG?=
 =?us-ascii?Q?07Jh++uSpRDYELRi9JhyMeLuYDfeo09y0m4cXkc8u4dVZOLnwd+2l3SuJvOz?=
 =?us-ascii?Q?yJfKZ8tFGvBVDkVqMS+E3bL87+AlNuOKtoIO0zP5lbWZCkaNX+7sho1mhr0Y?=
 =?us-ascii?Q?rJzHjMs5NGaZU0hfE73Rbq46XTFSB6L2fN/aeyDNTFmb3PqhGcyt0NFT58/P?=
 =?us-ascii?Q?9ZF9sNhmRIIwDrRVbvvVzHxjIQyVc07Tlm4OksiOsW8zPXzMHPtkHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tet4SPVTE/BXEf/07Sx88VHeTx0+ZXzduEOTgp26C5TV71c9H5a+hhEPsztR?=
 =?us-ascii?Q?0f+Z1lInxi0osNub/xTGIyhoen8/xV2VhKoKH/0izsI5BoPYAhPRE0y4tcdC?=
 =?us-ascii?Q?RCIPZI4BrUzTjy1fhc/ZtRFBlVYvyrKaKrZTxnIqc43NevW/QnqY8+iftOzk?=
 =?us-ascii?Q?Vbb6jTEE9/BJo2xYiB59l2oml+ygQ5sbKHaXwhKzB6zBquUq643mE/8EmD7B?=
 =?us-ascii?Q?RY1EE3+8CZ75Hodx/83k0/cxIkX1xrJ3hPMTEoK7pIg86OgAWgbWFW4qv0QK?=
 =?us-ascii?Q?tW0EeaEnwUd8U608cCXKjcoS310gLKI5O5ofuXoDExMby2ZxoDCKAV3MFZPw?=
 =?us-ascii?Q?JldbDMfc46CQRL0H3nhzpoZSMUtlT6ND9bO0AtuWIcV5ShciYVkpE5EszNBo?=
 =?us-ascii?Q?Ca48qK2R5jp5V3VkXuJX4AJlzXdRThx90NxJhX3IhaNmDWc3mAKPhtfWicoN?=
 =?us-ascii?Q?GJ9WtbrHO6pvxD1LxiFGCEduI5WFrRvy/EBghWT0vBli0GVHzLGbbVuwALel?=
 =?us-ascii?Q?ckDQJAbYCbdbYp8te4EOw4Jbi9y7l7TsO0sGqFsHnst17cCgZhsDArf4uRWD?=
 =?us-ascii?Q?VsRY3sd1w2z60VboZlW5+40SZfGYXhJgPtVnTLcg52lB67ilvQ1LSJbjzT5n?=
 =?us-ascii?Q?7XX+7uqnCUIAwZHms2zpFZUfjBt+AyvDwZUZh8rxGUI0/CqwafRYJAwfBA7A?=
 =?us-ascii?Q?KT3SagXw3ReBWC91WVRD8xkig/kgvIZlBFVK7mhL+IgZqAfvQ0/ff3E5E6g0?=
 =?us-ascii?Q?5t+xKm0xBUzMSbtBP12UP/6bYinUmu9Za0JVXGj0vLRJB7Jxep6wp5AJVU6r?=
 =?us-ascii?Q?r3cKodDYXbi8EruDCUornyyPgfWTG7gZL8AD15w0zZYJk28tUGUqnr+DK3bq?=
 =?us-ascii?Q?ai251NftCgS4c3uZLePv2qRYdj+4bEEng4qiya7I3TLtVp1dLwp0jxz5nDG5?=
 =?us-ascii?Q?omQayWQCNa1u7chMNdubF0VW7+9nrcq5LkkZdhXNWL5rXNXiB3szMl9Rigzh?=
 =?us-ascii?Q?6pespAJ5k0FntWnZfxbEdOyNuKz0TLBZD3d25Oy0fWKbn4pVc9OTDuKKdW0S?=
 =?us-ascii?Q?FipM2XZwVheZYo32eoOodBH6+HOHt173l59WQ5kdz9c736dcTKMcC5afR39M?=
 =?us-ascii?Q?4DYXLyb184OAr5VODcGo+KuuRSwFm9k5cKqHMC9vteiuxJ8U+sKCwxbgj5ke?=
 =?us-ascii?Q?cGsHnln0hrK04Rd+kf/ztdntmjuEmvAl5F+NiWO+otZn1dEJusi8/ZJlxcVa?=
 =?us-ascii?Q?woKwdgvEfIYeQW/duzymlKV4MdC3D5o/eXRpzi6MtHiF9rFbb4gVi2AoVwpD?=
 =?us-ascii?Q?vuSieADhbx7iby8M1ht60uonEYmyEMFG8KdaN7w4YfoteoEU6dVhyejXi+EB?=
 =?us-ascii?Q?ymoHgPfsmf/EBOW7cgdb4c402NInrQIM9fuUlBbe5vAqnShiYqfxJSKoX5W5?=
 =?us-ascii?Q?TdwVO13zCaS+svppzV0p42KuBnpHTyJ4TqfDfIZSaFve2vVsguVSprDmV40Q?=
 =?us-ascii?Q?8omB3Vb7iXs0dOO09wpDKANmlY/htCoH1xW8LECUOE6+r7ekXVEBl1jYCdX1?=
 =?us-ascii?Q?YdH+SycVbeKkZFHjKWDgmOgsSzgSQm+6qPyS+uXK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c669fe-5526-44b7-da0b-08dda3f60750
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:58:44.6589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twxJ2I+EpSOOq4ylvMWrgw4VGTcls1j39iJGUtxy0aFpn/+ayABsYcZCzKuT8bdRBjgeqwEfMhiVYB9BwWbaWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7206

On Mon, May 26, 2025 at 01:02:36PM +0200, Fabian Pflug wrote:
>The FRDM i.MX 93 development board is a low-cost and compact development
>board featuring the i.MX93 applications processor.
>
>It features:
>- Dual Cortex-A55
>- 2 GB LPDDR4X / LPDDR4
>- 32 GB eMMC5.1
>- MicroSD slot
>- GbE RJ45 x 2
>- USB2.0 1x Type C, 1x Type A
>
>This file is based upon the one provided by nxp in their own kernel and
>yocto meta layer for the device, but adapted for mainline.
>
>Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
>---
> arch/arm64/boot/dts/freescale/Makefile             |   1 +
> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 613 +++++++++++++++++++++
> 2 files changed, 614 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>index b6d3fe26d621234ab84353165d20af9d2536f839..c703fce2ebfd8074bd0c6ee76f3c6f9bbd9cf179 100644
>--- a/arch/arm64/boot/dts/freescale/Makefile
>+++ b/arch/arm64/boot/dts/freescale/Makefile
>@@ -295,6 +295,7 @@ imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
> 
> dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>new file mode 100644
>index 0000000000000000000000000000000000000000..dc6348858024d833a450a6b5d2e54e4fefe9e9cd
>--- /dev/null
>+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>@@ -0,0 +1,613 @@
>+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+/dts-v1/;
>+
>+#include <dt-bindings/usb/pd.h>
>+#include "imx93.dtsi"
>+
>+/ {
>+	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
>+	model = "NXP i.MX93 11X11 FRDM board";
>+
>+	aliases {
>+		mmc0 = &usdhc1; /* EMMC */
>+		mmc1 = &usdhc2; /* uSD */
>+		rtc0 = &pcf2131;
>+		serial0 = &lpuart1;
>+	};
>+
>+	chosen {
>+		stdout-path = &lpuart1;
>+	};
>+
>+	reg_vref_1v8: regulator-adc-vref {
>+		compatible = "regulator-fixed";
>+		regulator-min-microvolt = <1800000>;
>+		regulator-max-microvolt = <1800000>;
>+		regulator-name = "vref_1v8";
>+	};
>+
>+	reg_usdhc2_vmmc: regulator-usdhc2 {
>+		compatible = "regulator-fixed";
>+		off-on-delay-us = <12000>;
>+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
>+		pinctrl-names = "default";
>+		regulator-min-microvolt = <3300000>;
>+		regulator-max-microvolt = <3300000>;
>+		regulator-name = "VSD_3V3";
>+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
>+		enable-active-high;
>+	};
>+
>+	reg_usdhc3_vmmc: regulator-usdhc3 {
>+		compatible = "regulator-fixed";
>+		regulator-min-microvolt = <3300000>;
>+		regulator-max-microvolt = <3300000>;
>+		regulator-name = "WLAN_EN";
>+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
>+		enable-active-high;
>+		/*
>+		 * IW612 wifi chip needs more delay than other wifi chips to complete
>+		 * the host interface initialization after power up, otherwise the
>+		 * internal state of IW612 may be unstable, resulting in the failure of
>+		 * the SDIO3.0 switch voltage.
>+		 */
>+		startup-delay-us = <20000>;
>+	};
>+
>+	reserved-memory {
>+		ranges;
>+		#address-cells = <2>;
>+		#size-cells = <2>;
>+
>+		linux,cma {
>+			compatible = "shared-dma-pool";
>+			alloc-ranges = <0 0x80000000 0 0x30000000>;
>+			reusable;
>+			size = <0 0x10000000>;
>+			linux,cma-default;
>+		};
>+
>+		rsc_table: rsc-table@2021e000 {
>+			reg = <0 0x2021e000 0 0x1000>;
>+			no-map;
>+		};
>+
>+		vdev0vring0: vdev0vring0@a4000000 {
>+			reg = <0 0xa4000000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdev0vring1: vdev0vring1@a4008000 {
>+			reg = <0 0xa4008000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdev1vring0: vdev1vring0@a4010000 {
>+			reg = <0 0xa4010000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdev1vring1: vdev1vring1@a4018000 {
>+			reg = <0 0xa4018000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdevbuffer: vdevbuffer@a4020000 {
>+			compatible = "shared-dma-pool";
>+			reg = <0 0xa4020000 0 0x100000>;
>+			no-map;
>+		};
>+	};
>+
>+	usdhc3_pwrseq: usdhc3_pwrseq {
>+		compatible = "mmc-pwrseq-simple";
>+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
>+	};
>+};
>+
>+&adc1 {
>+	vref-supply = <&reg_vref_1v8>;
>+	status = "okay";
>+};
>+
>+&cm33 {
>+	mboxes = <&mu1 0 1>,
>+		 <&mu1 1 1>,
>+		 <&mu1 3 1>;
>+	mbox-names = "tx", "rx", "rxdb";
>+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
>+	status = "okay";
>+};
>+
>+&eqos {
>+	phy-handle = <&ethphy1>;
>+	phy-mode = "rgmii-id";
>+	pinctrl-0 = <&pinctrl_eqos>;
>+	pinctrl-1 = <&pinctrl_eqos_sleep>;
>+	pinctrl-names = "default", "sleep";
>+	status = "okay";
>+
>+	mdio {
>+		compatible = "snps,dwmac-mdio";
>+		#address-cells = <1>;
>+		#size-cells = <0>;
>+		clock-frequency = <5000000>;
>+
>+		ethphy1: ethernet-phy@1 {
>+			reg = <1>;
>+			reset-assert-us = <10000>;
>+			reset-deassert-us = <80000>;
>+			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
>+		};
>+	};
>+};
>+
>+&fec {
>+	phy-handle = <&ethphy2>;
>+	phy-mode = "rgmii-id";
>+	pinctrl-0 = <&pinctrl_fec>;
>+	pinctrl-1 = <&pinctrl_fec_sleep>;
>+	pinctrl-names = "default", "sleep";
>+	fsl,magic-packet;
>+	status = "okay";
>+
>+	mdio {
>+		#address-cells = <1>;
>+		#size-cells = <0>;
>+		clock-frequency = <5000000>;
>+
>+		ethphy2: ethernet-phy@2 {
>+			reg = <2>;
>+			eee-broken-1000t;
>+			reset-assert-us = <10000>;
>+			reset-deassert-us = <80000>;
>+			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
>+		};
>+	};
>+};
>+
>+&lpi2c2 {
>+	clock-frequency = <400000>;
>+	pinctrl-0 = <&pinctrl_lpi2c2>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+
>+	pcal6524: gpio@22 {
>+		compatible = "nxp,pcal6524";
>+		reg = <0x22>;
>+		#interrupt-cells = <2>;
>+		interrupt-controller;
>+		interrupt-parent = <&gpio3>;
>+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
>+		#gpio-cells = <2>;
>+		gpio-controller;
>+		pinctrl-0 = <&pinctrl_pcal6524>;
>+		pinctrl-names = "default";
>+	};
>+
>+	pmic@25 {
>+		compatible = "nxp,pca9451a";
>+		reg = <0x25>;
>+		interrupt-parent = <&pcal6524>;
>+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
>+
>+		regulators {
>+
>+			buck1: BUCK1 {
>+				regulator-name = "BUCK1";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <650000>;
>+				regulator-max-microvolt = <2237500>;
>+				regulator-ramp-delay = <3125>;
>+			};
>+
>+			buck2: BUCK2 {
>+				regulator-name = "BUCK2";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <600000>;
>+				regulator-max-microvolt = <2187500>;
>+				regulator-ramp-delay = <3125>;
>+			};
>+
>+			buck4: BUCK4 {
>+				regulator-name = "BUCK4";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <600000>;
>+				regulator-max-microvolt = <3400000>;
>+			};
>+
>+			buck5: BUCK5 {
>+				regulator-name = "BUCK5";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <600000>;
>+				regulator-max-microvolt = <3400000>;
>+			};
>+
>+			buck6: BUCK6 {
>+				regulator-name = "BUCK6";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <600000>;
>+				regulator-max-microvolt = <3400000>;
>+			};
>+
>+			ldo1: LDO1 {
>+				regulator-name = "LDO1";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <1600000>;
>+				regulator-max-microvolt = <3300000>;
>+			};
>+
>+			ldo4: LDO4 {
>+				regulator-name = "LDO4";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <800000>;
>+				regulator-max-microvolt = <3300000>;
>+			};
>+
>+			ldo5: LDO5 {
>+				regulator-name = "LDO5";
>+				regulator-always-on;
>+				regulator-boot-on;
>+				regulator-min-microvolt = <1800000>;
>+				regulator-max-microvolt = <3300000>;
>+			};
>+		};
>+	};
>+
>+	eeprom: eeprom@50 {
>+		compatible = "atmel,24c256";
>+		reg = <0x50>;
>+		pagesize = <64>;
>+	};
>+};
>+
>+&lpi2c3 {
>+	#address-cells = <1>;
>+	#size-cells = <0>;
>+	clock-frequency = <400000>;
>+	pinctrl-0 = <&pinctrl_lpi2c3>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+
>+	ptn5110: tcpc@50 {
>+		compatible = "nxp,ptn5110", "tcpci";
>+		reg = <0x50>;
>+		interrupt-parent = <&gpio3>;
>+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
>+
>+		typec1_con: connector {
>+			compatible = "usb-c-connector";
>+			data-role = "dual";
>+			label = "USB-C";
>+			op-sink-microwatt = <15000000>;
>+			power-role = "dual";
>+			self-powered;
>+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
>+				     PDO_VAR(5000, 20000, 3000)>;
>+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>+			try-power-role = "sink";
>+
>+			ports {
>+				#address-cells = <1>;
>+				#size-cells = <0>;
>+
>+				port@0 {
>+					reg = <0>;
>+
>+					typec1_dr_sw: endpoint {
>+						remote-endpoint = <&usb1_drd_sw>;
>+					};
>+				};
>+			};
>+		};
>+	};
>+
>+	pcf2131: rtc@53 {
>+		compatible = "nxp,pcf2131";
>+		reg = <0x53>;
>+		interrupt-parent = <&pcal6524>;
>+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
>+	};
>+};
>+
>+&lpuart1 { /* console */
>+	pinctrl-0 = <&pinctrl_uart1>;
>+	pinctrl-names = "default";
>+	status = "okay";
>+};
>+
>+&usbotg1 {
>+	adp-disable;
>+	disable-over-current;
>+	dr_mode = "otg";
>+	hnp-disable;
>+	srp-disable;
>+	usb-role-switch;
>+	samsung,picophy-dc-vol-level-adjust = <7>;
>+	samsung,picophy-pre-emp-curr-control = <3>;
>+	status = "okay";
>+
>+	port {
>+
>+		usb1_drd_sw: endpoint {
>+			remote-endpoint = <&typec1_dr_sw>;
>+		};
>+	};
>+};
>+
>+&usbotg2 {
>+	disable-over-current;
>+	dr_mode = "host";
>+	samsung,picophy-dc-vol-level-adjust = <7>;
>+	samsung,picophy-pre-emp-curr-control = <3>;
>+	status = "okay";
>+};
>+
>+&usdhc1 {
>+	bus-width = <8>;
>+	non-removable;
>+	pinctrl-0 = <&pinctrl_usdhc1>;
>+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
>+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>+	status = "okay";
>+};
>+
>+&usdhc2 {
>+	bus-width = <4>;
>+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
>+	no-mmc;
>+	no-sdio;
>+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
>+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
>+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
>+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>+	vmmc-supply = <&reg_usdhc2_vmmc>;
>+	status = "okay";
>+};
>+
>+&wdog3 {
>+	status = "okay";

Is there a need to set WDOG_ANY to trigger pmic reset?

Regards,
Peng
