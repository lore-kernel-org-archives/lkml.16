Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1BB19A288;
	Mon,  9 Jun 2025 08:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749457863; cv=fail; b=F2GPxrjFxihMbriSkL6m3QFjg6BlNoZQI6V8Q7GSzV04FJW76cHlCbvMZxZpLnCNEiuoadHe0983GSFfKW6DNYbFvopo1tJigwx2o0XkZvNotVierq5nFfPJVlBQiliJbWnC0ev9f+bD5rfN4UjMfedlwFreYiZghvYiG3S5BZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749457863; c=relaxed/simple;
	bh=BiYt89ekPFciepbM+JOGCrYTdRvWg1a83DBgRF2TPuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UZDWa43z/cJSQMHSX/qi3LT1MAQa76AJdA20APINqqkjp4qHdiz9Zdcqi8QkZE7doeDz444wnnRxWq7aCby6QC7oRgbE2rTFfhSSuvOk93BjMvo4FPva+oOWm7bVmp234kSjG3eYRm5fQk+EwKvq3pnBrhseGf2kr9C3jjkovaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ql8sdbAJ; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ql8sdbAJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxFnC/7vFasB3CuHHFapoQWepWkVYUkoQELK1IERalJ/poygw6jICciQL4RnLQQApChwF8eyD95E5X6LUcofdVuBOSOr9EEb7Lfbp+S3Aci2UYzdphPlhsVyLjSWCtT5IZjtClhdAcWMTHJSMiqYE50RYT0edJzOvyGJZ28p8Z/7qp/NfgqZpoW3awIHWLUVdKFJ/sHGR9TIB/reSG6FBleNV/P0eP0rM9T8kLlmNSBwjCKJ4pfTiqNOuafWGRcN6R25pQAnJ5KXnXQal8zs11TKC3X0U0xDXCCxEfclY5D4maaE1aKGCY9pWqQ6gHvpj39dZcpKuOxQrNgiyVJB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiYt89ekPFciepbM+JOGCrYTdRvWg1a83DBgRF2TPuY=;
 b=c+YDH0E0B7eI2G5uOeAcofkBpTHzaKE4tUmberKquPyn5l6+8AtQx42sc9S1rG6ppYRLgF1sRSQq7cks0i15xn7H3VFYXCSzPZ9R0MWn5+k7KyYdVfHu39+HQRl360i9J6ALVHyTdngZnWs8dDFuvYwa5Jn9tkGa2t4dxeRVMKaE+1Jv1dGgfxJCE1YpKyUZ3Bu5xh2gXWLaSP+sBJ2BAan/rGO/Fktiol13sE2z8CUfVQVFMu1fHs5InD3MthXR1EUe2Q+0WLRfmx35MurnyBMTEVIuGHbfwmF8krkrG6KKoHPVzjYZf0HLKa+K73H2prGgNV7q+z8ov2urIV2dPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiYt89ekPFciepbM+JOGCrYTdRvWg1a83DBgRF2TPuY=;
 b=Ql8sdbAJubEwJojES36gZ664pyHBznDJXEY4mfGXkukutqngn7Ox9IjEiWvAKWQVQdbQSbwSmoCNoJlEBKeiWhjJeCm3ff6Ol/WqmF/57jDQ79VDQNFFmhXN9QKq4Vb5m3sBDyERfmNd0ly2UNsaYWUd/VXi/5T2Tj4iUWYWjv/FCyz6KMTG3LXF6gprMLIN184KxXclYYr3RG4RCNiSICluO4Z3U50ulSnP1/FdwZjiArVeQ8jKs0+2ncE46CYSuxcSgnPBLAJBBdVlobsvi5dBeNkJfcR6SleK5IbRBS0kmsW+PadFkLjPGPz3NB81pvfBGMvLENdUXOqOlnisMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8037.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 08:30:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:30:59 +0000
Date: Mon, 9 Jun 2025 17:41:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] ARM: dts: imx6ul: support Engicam MicroGEA RMM
 board
Message-ID: <20250609094104.GC13113@nxa18884-linux>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
 <20250607093342.2248695-8-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-8-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e1a675-30ef-40cd-2bdd-08dda72ff5f8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?CMZVipUuIA+sLmHgU9tRst+Qkuy8Fp4Xe44i0dTWIYIWmupxz8F8txvXIEDS?=
 =?us-ascii?Q?6fZlj9+nnTXw1VeJ+4EZHuWekdMUW0dHq1ND+bOFfSuZYVzTqow/TUuCUhvG?=
 =?us-ascii?Q?Q1H2mEfBZUw1JVlelrpdEYHWAPb7IUZfG7IsQLEKbcNJdYlA+WdRihUrzPCg?=
 =?us-ascii?Q?t9FoAmfX7qY27DCeuibk8e8FItl9A5t7WCw8CWDSqomEKuv0Cg75y0r8tXPx?=
 =?us-ascii?Q?21pxVjlHGh0n+N8eMgWKmH7FVNBVI5I8hPbt8UCiVD4otbxxi0Q5wFycmiWi?=
 =?us-ascii?Q?ht1dYjV2cKZJy4u4QCl5ciJOf/OMlTKtKtuHCj8UZ9xZ+rdu1uKvRnP/lCxR?=
 =?us-ascii?Q?SkR5KXbGXk4zqxvYjnwuRm+rOE+EOPM5n7IisNIaoUDJnPG5UQ63cXwLGomh?=
 =?us-ascii?Q?GlsP6KigBUyNWneWy5cK22WekYHY8QDqa74IioN/fCi3G76gQ1u/eIMIzzcp?=
 =?us-ascii?Q?uhb5ZvdyBFA1i4wKV7sCRlx7HWFVyRTw/13wcy0cO85vVMtk5/mgR5ogEKPV?=
 =?us-ascii?Q?+s0z8MprDEDr4nSyTAX+z0FaVGbyLBDa7Baff9E1KLD3J97NgRL0oqJtQqPD?=
 =?us-ascii?Q?0vp6kOvlhwqDNCSSQ2KzlUoHvIU4CcXMGXP9n7R0QlhasA4BgSomb8om/UyJ?=
 =?us-ascii?Q?/oo4wsrDCIiN2A+DsUQ42cKKzI0t4w736HfP1HsEx8CwpvMNansGVHnNzkwl?=
 =?us-ascii?Q?xIInTays8CDWS0gb2QTGp9Gg94K2AGhVRif4EYv1V5guSR2IdhDTOeKbhXYS?=
 =?us-ascii?Q?DfgMnSPyd7FIorn5sn0HqQyZpvStcr/LCTYqLcJhiNxmm/MoRUctbXR7UU6w?=
 =?us-ascii?Q?xnNZJe4MT6U5lbPWu+whD8xv+l5C90aTHPiWSuvZQUXAO5ZsCSGt2rm+7jIP?=
 =?us-ascii?Q?WgiNTphnEMCT5iPvqv4AG0/bIv4k3J9ZNAEsIZjzzFrJwbpD+gWgQqVtiTjS?=
 =?us-ascii?Q?j9QGdoKXmI59v+xGm5nwvNgq0xtHuQt8+5LsNyVUClp1axBV3QvOTNA5nDtz?=
 =?us-ascii?Q?hcZe0mSO3Iec2LDpWlmEoDZCybSRjadV/PJ0zAV13v8Vqs2+z5RPfBR20ELY?=
 =?us-ascii?Q?vUt7IGCkvsT4moNeb8G+S9kiiky6xPEIPVTIOu0gf5hs7AEJpQG5SFkj6+xb?=
 =?us-ascii?Q?RoPYCTrVUpboVze15fZit2+hLb5pgqK9vcEVD19eWmgAirRuhTYRDJYWijLC?=
 =?us-ascii?Q?Lyh7YgJckptArJyuGWt+mN0ZeYbbQKexCh+p/f8eHT1gd5NZ7hvIip3mO2L/?=
 =?us-ascii?Q?v4ci/5OovDfrZn+1oCBkjLwA60uVLJ5sb3BMMKMqaGU8FNO+k30dNpWOmLiy?=
 =?us-ascii?Q?87/8HyiaccTHIRh+X8bp1n+Zlh3CyJGHUJl1/uzFW+EZbFkA25tHujuwhdBN?=
 =?us-ascii?Q?gail/ViOWbcOgqu1nqs0qZcRCQ1P55xDNB29PDX7bAn9s6ZIbA21QyQmy54Z?=
 =?us-ascii?Q?y8XvCfjM2hCu+SYcsjtx876/70jTQd4YCM/MnCT8z//XM+Ejp4KtAg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ZobxpnE6NyQ2L4WjWU/QKGkDpjuTCwZsJPUFWo9OKeZ0AT99Vlj0P9pmeR08?=
 =?us-ascii?Q?IT/jNPyhxocwvmEBL5ayH8RDoiT3JTvB1fbGzO6KiXUBBTzmwS3N/ZfttZN2?=
 =?us-ascii?Q?LW5DT+/BtYaNUKA/8IeOF66RC5ZxclwN8pSMJ/RlPuGy+ZeeWg0/v3tEPEzO?=
 =?us-ascii?Q?DPL6FiNR46CB1msjU6llWHMbxRFCJOzNtPKGCYyOaZfj2G6GH3xh2YjR8ZY7?=
 =?us-ascii?Q?be6kwLEJkKNFZMYJQ2JvgP/Nf3dxbHDp7XBw9rcwtLsyj0TBDwdm+MIM2lvV?=
 =?us-ascii?Q?bwlnc3ZilI5XO/EaCvI293gWJ1TbI3vcoKi9NVDF/tM5c9JpI4QHr7oWO5KJ?=
 =?us-ascii?Q?U1xnnUt9FBw1nlNkeBfhmECyhaMRo54srhMNy83bJ8j0c8okBih7uVhWUZzh?=
 =?us-ascii?Q?cseE+KwqineqCeO01n0AnnnJwAu/zNQJtT/rmAdprnMs46oJ74qJBAd/vENY?=
 =?us-ascii?Q?5Eo9sKXJvAfupHSUXSJACqHGm7a6kt5vzg2dIoutWa1By2duJ+jDcYSAjG1m?=
 =?us-ascii?Q?1/oDw6WsVZSEVcK53WOyhh5GfMfDmQ732p4xMC3HSAPE80QkP617raVlbGxy?=
 =?us-ascii?Q?qMM5u9UsbkOtWpvHd9wS7dB9NB89/Ng0HCt+Ifv3gpldPYEkgF1w+Kk3kxHD?=
 =?us-ascii?Q?OHt0ed3QKgPtt7EbZiyW4JV4TDXuJg2mrROfVXwYIwQBSHwbGHqRfYS+jyzW?=
 =?us-ascii?Q?djuBXFwyU6vXMfHEFbVeiLBwPDPPcVE0Yt7iB4RYQcMogPg8gBZKWgb9kMP0?=
 =?us-ascii?Q?nZY07AeptG+GfqYWIBwjmYuv1mzkcbHUBlHA37B1sL+xCceF4QTEmZupKHzC?=
 =?us-ascii?Q?V2xSfq7BFleuRr/VAwFZegQABWgjAVu3AlgHmH908knxww8ljhdZoIHndYpk?=
 =?us-ascii?Q?FsjonSioy4aEBU27Wr35/dhIKSXWlRLHDO1gfadIod0KmGVbEXbjEXQY+1Q2?=
 =?us-ascii?Q?bCxKNS5L8A495x48LLezaZMDBKTedpaB32MijXIDfiVjJXl5nF3HT3QO2UZn?=
 =?us-ascii?Q?MHOviZlkJJdrUHCEMFA4K8hCBUEyaKNrDw8C4zBJ2Bfe7zAi6QMGc7tVjV4A?=
 =?us-ascii?Q?6sblxqkJvf+FVEVbMVnOurkpfvK49+GtgmROs/RUtMm1XH4cC68dxFXizRxY?=
 =?us-ascii?Q?4ZM6thpfXKQ2Vja5j6csjJxlaeaRijpPLGSzz6pQ65Uj89eiDF58X83WmEJ2?=
 =?us-ascii?Q?J1yZmuxW3Yc/5I1yOHmXNIzMH627M2RjjswmbmDWTnpCtiuTJUannygu5J9+?=
 =?us-ascii?Q?Y7kLiFdsci3HSocxVsvf3h6JP46govXp7wGqWLYlQZaxahWdYqJnkvmxj/ln?=
 =?us-ascii?Q?DgP0arHXHNYLdyZOGuNYX2Z1L72SpgP26X3e6n5ugnZhNVKdPJsYSJLycWJ+?=
 =?us-ascii?Q?+dPJ6javQblSBmuVvha/zCnDD0SYYHWts9Zh+HUROSwdvUhZZ3KOBDWmtzbs?=
 =?us-ascii?Q?s9onfvGB5mHxgVSSCgbB+qg4rlIv9J4BnE7Vjg6AsN74y05calFkimyIxnWG?=
 =?us-ascii?Q?qVyjw+ODTAVzstfwVIcPT66BqRGUv2q986cS3EjpQv2hNpDhkWxX/mErHF16?=
 =?us-ascii?Q?texszxgdpK0KYQiBnJ+q8iLe9C1QfDQnQojiClUo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e1a675-30ef-40cd-2bdd-08dda72ff5f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:30:58.9488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrTozQrut/YO4CsNxll23h2eqJgqVhn2wjSdLM4oCpM86jPJWHP7lGK9aFqjQC/qNKRd03FmGIVIgKQvNEWWwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8037

On Sat, Jun 07, 2025 at 11:33:19AM +0200, Dario Binacchi wrote:
>Support Engicam MicroGEA RMM board with:
>
>- 256 Mbytes NAND Flash
>- 512 Mbytes DRAM DDR2
>- CAN
>- LEDs
>- Micro SD card connector
>- USB 2.0 high-speed/full-speed
>- Ethernet MAC
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
