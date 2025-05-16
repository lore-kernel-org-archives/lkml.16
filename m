Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013037.outbound.protection.outlook.com [52.101.67.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575F19CC27;
	Fri, 16 May 2025 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364170; cv=fail; b=iv7Ny+pwNziIAJfhNViN3Ycebt7SC624m918dN2Np2NxY34B3/FvqVhQP6nUiVOgVkFZmsowgIiK0+QGOOoJL2AY+hXWAyQYM8JeIUI3FJ2edqos7uF0O0edl/nyNOxbD7e5M0kjFuMT5BUJOxZv+RFp1m4hYWjliwYAPSM4Z8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364170; c=relaxed/simple;
	bh=p5ybwbJeKpVdPgd9vys1RA+ogs+ATA7q/7jECzIMSzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pDxZWuCVr5IEIJu1yAMnegr1GUjS+Ek58WT8+bnrqBUQ6qpTTkR1dDQU4qIJL2WjYbINAk1UJvirtTgWx9EF8bcUTVHLW1PzS/tTKDL2h4PD8peV0ZKMjCgt7sbtcsO+Jl9PV9Z/ulSrwOHVIeD7HuPj3S1efZblmUPdI6q6t8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=afVWV/eE; arc=fail smtp.client-ip=52.101.67.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="afVWV/eE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/+u/6eedYuyIoGFUb9UCQ9d1kX9S8o8HCgeDI8/6p/0Sedls7TO/ec+hkTMyG+Q2FzwbeNNgX9z5cexDbIOmHqNSKn4PKm+cn9fPepKHatlzOa2wSTnOdKj6ntgShKWIdgxm8jzXmJkVcE8l5wHhc1KoPDLj0u/Vr+kGY6wSERaNSvWr0V5AlBFMOAnNSAMUI+0eS5/JrLUxtzBquALJVP+TVja5Ut8SmSYWUKAg5V9UhTQb4G+AmNG/qvKu5QOutGsJtdIAFfA5sPohV5mPLufibnFS84OoiJsW0r5i7ucZCiG6fOpJ7E5R5AQHLT1QB2ebeLtT7Dqjw40YKLUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijnHL5UHpuueah3CZ3OvyVQsoRMz/ZyMDAIh8ALnroM=;
 b=MdLvKHL6SO7nRVNF/SjbN3dmRtrsxmwviXwBEdKzFrmTtzKu5EXe+mtiKKV11UoZFKAGm7hEV4zLdS4IyvFFwlUlGHSTPLb9lBRMTWbzhMXZqI/Bu5J16thxNfzlBKcHLCmbUTyr/V+XV6WxGnPNyAhisi7IAr3+cAUCx7xvwWE97mXmnyr3UM/xmGX7EneXll/Vlkp1Ylns6oG7ovUgQUyhmFgrZ9Ov4dvf5wmtOa2zj3ahoaxqn3yj1EuRLDGs5cf+hu6lL8DRNN5dILzB5s9XDCIh3iiZnWF6P1ZLe40Y+oUUbmdaZpxJ8YTQr7Jn4PlPxF2eUhZrHPRWgza5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijnHL5UHpuueah3CZ3OvyVQsoRMz/ZyMDAIh8ALnroM=;
 b=afVWV/eEyj9XdAf1srkDptkAWjgSD6h3ujU8FmLYubBdwzEw7XMfpQCBZY0qU1cB53pUK6lTfLWeoiCkfhXckxXPYUNQSiIDT6Gnzt38AsXwTLhs4H9vCiCXqOSdtpSPlWgNb2BJskxI7Xu+iVqVhS8Qs07KuNPHN8F0Go9mtqQp1Hc/KDPTWhKe9oTn8/UwByWLaxOzARuHurb1kWyCZVLxjDnKsVT/hORMV2CvK91SfUxuPZgJgifmTYSiothpzysinLObhOE2EG79wmHl9WWqgP8pX/w8p8Ohu7nHRtHnDmklnYcRkmGlzP6HX83rcmyscd+0b3Yf7KwZwCitzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 02:55:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:55:52 +0000
Date: Fri, 16 May 2025 12:05:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable uart2
Message-ID: <20250516040520.GC28759@nxa18884-linux>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
 <20250514070545.1868850-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514070545.1868850-2-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d305eb9-4a28-42f6-ebcc-08dd94252bab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gE8eHicCdelX6sUroxse/SIATh2baV9vX7ePxfDpZKXDbd5ZaSOCn3MPnM2t?=
 =?us-ascii?Q?ZVFrH8TMCTmXxMwrxxhNalasoISZ57r0gUbj3CxnTXwfyI0+LhEUKdrcujoC?=
 =?us-ascii?Q?o6q3MZTOF1qENmzILkUqK9ffOchilFd7T8ei0YRj1yLrU/Y3YPR5QI0Z+7Lz?=
 =?us-ascii?Q?/sBoiUrTKLrhElTF6NeDqqUBHMIByaewgJorRUECTORSkMbPESLvYttNLCRf?=
 =?us-ascii?Q?xluLK63kdWFQFEFB3jKVm4IKfpEDCOr8BRhaZYTsHKrtGF/M0Feb/3G5A01A?=
 =?us-ascii?Q?5o1qzsxyYP8ErJWFThVJ00w3VoczqjrcEjMPc0OsPAMxcGAxelM5tkIYaiLG?=
 =?us-ascii?Q?EAUh5nJ7smowtsyR6CbVA1JH0Ap55RNP/2OJUSelULOFRiS1naXL3P8ptJQd?=
 =?us-ascii?Q?fUPz7Q8iOS/6jB2SS+WEDsq616ICssRbe3W0N+aUCdy0gCD4xfGNV28g1GD9?=
 =?us-ascii?Q?yevKeXGFBtB5etxO+0FDC7wipKud025MjrJe4aWJbl4IEiSsVEgUDtn4LLOb?=
 =?us-ascii?Q?8vLnwBn1yMlmopbstRI8pDYGEw/ig9XsCAz+0X30Nd1q9gzOZgYLs+lxter2?=
 =?us-ascii?Q?tf7jnWBRELvh9bmoic8PGuxf6fBgjO3Tr8S7OoALMwo+69MaOGS7ADGdIceq?=
 =?us-ascii?Q?D7L34iBWjhL6Vw2swqbPgcTJLDh+8x1IQ1wyY4JFM+/aRKo/AleEctSBZBNR?=
 =?us-ascii?Q?Hkay76tvtGf0w0AuuisPm/83NVIZAUXXT/ybahNHSWGXoqDli5snym7u5VhB?=
 =?us-ascii?Q?Ifpu8eV4XrhhHXV1AdXMadVpryqNO9fRyE8/Gt1jEk3XIxOE8n4vGy1Qxdx2?=
 =?us-ascii?Q?WY+rtRhD8ZRhJJm/oZf+ANR+e1QIs/OZBfa4D2ZSVSVKCgALWV4Z/K4vQdmT?=
 =?us-ascii?Q?+DqGf9gXpj7piY7wzCiRfZULKki7+xVykd9JM6rF0dYeDbevXNojI3i1jlSV?=
 =?us-ascii?Q?gYpSs3BsrMLqZBhkfFRN+BeM6+TNNHcI3H/vehhj59mZJpX8fg7hpSArwsPb?=
 =?us-ascii?Q?Dep9SHW75MaXpth2i2t3IpKMje3gMNUdpt0wxZ0Z4j6rwc1EUs97QHpboP75?=
 =?us-ascii?Q?bPz37lyRKLGFopNNaELp9q+9rcsWqayhj0c/ePXJgkn3XSdNgCHBe6o2l9jv?=
 =?us-ascii?Q?M3v3RHsBjSH5TD6ogE6ZZAL4s0wAi2qxthyHKa+giJ2kfobMjqQeofTa+4zF?=
 =?us-ascii?Q?9Z1rFgINk+xIbsFk2ofDZbnEwfrK0JPKhM8zha3c28pG2vSwetH0Kxmcqp3h?=
 =?us-ascii?Q?8wnwh+qSdabVv3a8cQbzC0xGMN+pXErHKX4YqoU7FFRbLzAg2fvfOiYVlvzG?=
 =?us-ascii?Q?LLal0R35Guq29p+Me2GpzJ7DzfR6lESKjqU5C4ogQSRHKPTVNkZWCZr0OXY2?=
 =?us-ascii?Q?r4rtSqSyKhjYb7td5CYDf59LC6A/VGYtrzMX9pJ845Z6tW+yX1hLhFS6guR1?=
 =?us-ascii?Q?oN5ky8jCAnJ5x3ven1sEmVCPSJo6WqciSvU8zlfATgonTFiPURP/7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AIHJgqqnrpVyL6vQgEjD/hEzbv/OItkB1tbOYE1kjINiKHMzSnIUq3gJ3cNF?=
 =?us-ascii?Q?IVVcMMqOoCohABslI2Y7JzZp6yAV6Z92CJHwop/uj8XIr3ju62UMFgUc+ko9?=
 =?us-ascii?Q?clwt6UHm65AaPLBBiEEPohtBZX3CzJxL8kEeIlILK8AuwV2d+Wl/gKJCzmOw?=
 =?us-ascii?Q?dQCWq/amhl8Rlswky2RxOg7F0lOmZmZx1aV68W24EBj1kNwTuQfMax9BGclA?=
 =?us-ascii?Q?zeljkkKRGCJV69QT6ogS/J9BsnWAFvJoHUrPtyWgIJ1c7r7EB5JAGyhWS0Y5?=
 =?us-ascii?Q?4Geuof41chziLx5RBQ6Mig+PqJeFfwg+Ljtv7jzIfoFrP7qmBa9+msuzPDPo?=
 =?us-ascii?Q?5AJJJX/UX8ZSkE5O8c6l7NFp1TVY4pKq/VKoYLG8fyenlO25esNPNVz8e/7m?=
 =?us-ascii?Q?JZBXhvYpWdywsviHmF5OKEf9Ae+yAMCNirg3hX26D72HvZC24nuoQY7jy5J8?=
 =?us-ascii?Q?HmKl3A/EdXyMeegyHlSMmzQb/pH9E9+6jqPUJJRvffh3brNdtC0PTvOu3hAP?=
 =?us-ascii?Q?bkqmPAw+qYF5RTHIWKWLFeVSiO8arV5j5XGpBJIVwRA6bai7FwJpzqHiteW1?=
 =?us-ascii?Q?pmXFMDUXPiDRPSR91HMDi8iLj/+6wbU7lDyDyFIAvGUSlFlTQi4ckm9UeLRW?=
 =?us-ascii?Q?LA42j7GVRDJukfTVpHO8Fdss8x63aZHg0snr/x7mDFX0EzwQ02bkVYA4I6su?=
 =?us-ascii?Q?EBaaY+3Hs1Iz3j4H36lGn+nUzQnBgDfYvsy0jWcMY8D9YrAZmnmW1lkUldyS?=
 =?us-ascii?Q?QTNstwEiTapeVwlrddP3IoCSOixvPXHOFvtD30bGmgAtFrBcjX76YULcxTie?=
 =?us-ascii?Q?8ryj1YFLPdh0tPmE7tqcazXT5oqtbxXP04L7A5PiEfpA8AdOqFNr5DsX76su?=
 =?us-ascii?Q?0YFNfIFUMNJ2xAsJS+w/1a1/Gq63pFSxPlk1l7+q5OwhmmD4S1tuhR2Z8eFY?=
 =?us-ascii?Q?I24z7uVNommbaaP6JKgcG6/JMh0z6DoOx9Ui0rqu2PVHh3M/rxYpDn/AiXhr?=
 =?us-ascii?Q?IEQsau7wqcM3cd72F02/iM7ybofg192Anee2I7rJy/WTFu6615g5cbuwXMIn?=
 =?us-ascii?Q?QCSjaJe73q6+DHXfAr2P8fQ4IXmuKKn7BEyx/ma3A6Y2lgiTHPPlT1j0bo/5?=
 =?us-ascii?Q?KU7HALfiQirZ3DeQ31TScPuDVftR9xrSpV2pzoaTF/FBFdopRlLg+73zQ/AJ?=
 =?us-ascii?Q?dHKbzmdcf2DqeZsYevfstk0FT83o8ybvCx5WiGMuX6bHXPoQisogFnLMa1p9?=
 =?us-ascii?Q?iZjR/GWo6xerqpBcqmPvncAiDkNpS/gqddKhNist7DZK5KmR3vt5rHaBzRG0?=
 =?us-ascii?Q?avyAXUG8gSLzeGEJ/1BVCoW50n+zj3fcatqPZdDwsbYpJBXUWKdbsgH2qrXT?=
 =?us-ascii?Q?uh2AoiVuJ42ksbnYTy3npeKShvTNTHD02AHGu7oAZRNLzukJDLr8sY2E5GLb?=
 =?us-ascii?Q?IZ3rgQK98alR6QMxkCg5GXTQEjOiGx33jC6JTCo7s7rgYymUqH+POomaDcbG?=
 =?us-ascii?Q?EJp3vcGamlJzqrhdlTmvd3p49fzcfg6rkEGqLDndC6b7W4DAXH+9FdkM7DOQ?=
 =?us-ascii?Q?nFgXjVGsoFSTFEklyZhISlt51R4qZUamLJGtTkTr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d305eb9-4a28-42f6-ebcc-08dd94252bab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:55:52.5263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhqgeTpntxgAcitA2oxt5mgE78dTSqUnZuih6+LzS6HWERGnn6gUAKOMpV3qgps1lYSZqM5sEmOFfesJzwzRfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081

On Wed, May 14, 2025 at 09:05:34AM +0200, Dario Binacchi wrote:
>From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
>
>uart2 is used as wake up source.
>
>Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>---
>
> arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>index 5c32d1e3675c..fff21f28c552 100644
>--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>@@ -37,6 +37,10 @@ &snvs_poweroff {
> 	status = "okay";
> };
> 
>+&uart2 {
>+	status = "okay";
>+};

No need pinctrl settings?

Regards,
Peng

>+
> &uart3 {
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&pinctrl_uart3>;
>-- 
>2.43.0
>
>base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
>branch: bsh-202505-imx6ulz_smm_m2
