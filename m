Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2064.outbound.protection.outlook.com [40.107.249.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C96017A2EC;
	Tue,  1 Apr 2025 21:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542275; cv=fail; b=GQiu1wbvL2s4vefdJsszdJ3mfWV9hNIgxfstlodoPqIXNNeFq6hWrhVdLjNoLkMUvHZTv5KFX8AUQOxiyohYnIW0wJu//pVzEjf3PneUCjvz1/F3WyyHKFZ3AuicIdnOQUI1+5AuBtrU9FhAYx8T97Kgr3XjCLlXktKbeUUQJdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542275; c=relaxed/simple;
	bh=Lvq00JHXyW6Q7vW5LhNzst3qVf0OJtNwULmrhYprtgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FMuVZXWaplgaQslhyOpvz2WjXdebaN+nMKAWduNGKsJ0Nl0uO44iA7FuBpgm5iX2+i/OY8mJzBYsZGYDmtaoS3F0NXlCB8apN5ZRJb/xMCvexnk7kq1Bfto8CADP6LgeZ8o/ZP3aLdfIQ1fGarOp4ZWqx1dmcEzGA64asklATEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OrH7+1sW; arc=fail smtp.client-ip=40.107.249.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OrH7+1sW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N360zx/Vu7b3sKwHSq4TKkPw0PXacCGoEDlOfme0AXSBjYSg5zgnutYWEHS0s0tiuH5yj0FIWQzSNBDhF12xqtWesHPmoQzHlQNUKhY+2j1dqusSD+sHuWrIIHMDQnwMUK0czTrpRcZABtUX0S4Q6iT/jV/YP7sdBlpGnsYsBMeoC68E2ukmn6hwKGe8Qt4cnf2PRjG5rLTw+5on3DqVP7x3PcAR9CpTEoaPyelWhw1x3YSnI0unX1xXhHcN0VrNhC77FrUb3b6iGQ7Fh9JYmMQRqDXdlgLCztfLFc6IkK2hXx6V/UydYqefg5AGOUkek7ZlO1Jf4Aw4Tohz96eDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9C7UEXVTcLEMk6N8WA6vOlaC+9nim6IfvSkjRNiScw=;
 b=aejm775jdHV4o3kC7SFYXWuldhX/QJ59TEY9ZdAlTAbhohrH+94Xx3OQtOYmB4McWcqbkEJeMIq8Fjg4xgMvlspmItx5dY7r2lMe8Cr4qLRSqeFdYbZA1g+pA+nzJrWdZJGfH+pMHFAzEcrBw3BhIQ9B+FJeLDUn2PUqSoVQ4/z3x2YFBXzsL/3mYFwT3EQRvgPe5+Fe9Dwi8wz/ACDIt47SZ747O2eUsteLgt/ar2h1yIV+VNWyAk83mYEFIuTXls9zrXxqqvkInsp5D514aPiY3ARpcnD7XBql0bxta6aPXq3UmEelQ3NmYI5+oEJ3DsNur7jZv72pfh/qQ92fbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9C7UEXVTcLEMk6N8WA6vOlaC+9nim6IfvSkjRNiScw=;
 b=OrH7+1sWQ3uFiFiOr4RQDJAHkylLfz0xOgfzg3x1dCvGN0ZN9VQM2HFivAIiysMCR9t6tWvbnaduNCzrELnwUUUnqNyScDb67PRvX9ayQljbP66dW3HwElpU7H7ujIysINiYAUdtcPpm/xTUm4NV/9H3bLxs3IFhoMMqTgfRzMBtvtJWFQfWJRtDwLG/E7KzJk+W8OjOLhkfMDEQJUl4GEPX07rD1sznyQTDLR4W8uSxa+PNmIuggfs4bxIHxrGaxBo4L5HtDBV+NPQXKzH4NuJeDP8EPCSQAOPzAPW0Ifh9y9GYtlXRFimSRvzCAXNzAkJv11j9bq4Z56s84ywxfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9908.eurprd04.prod.outlook.com (2603:10a6:800:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 21:17:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 21:17:50 +0000
Date: Tue, 1 Apr 2025 17:17:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qxp: shrink dsp reserved memory
Message-ID: <Z+xX9/nwhfYt0Zik@lizhi-Precision-Tower-5810>
References: <20250401155244.46239-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401155244.46239-1-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH2PEPF00003859.namprd17.prod.outlook.com
 (2603:10b6:518:1::7b) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ac1e2b-d542-42e6-5022-08dd7162a859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8EZjRp8bVJS6V7DnJYOBxhPw3zLzcUDIvHmBy94Xodb04f1tNZDRgAvvXRu+?=
 =?us-ascii?Q?j8mY+nE/gTxuzWjGqSgr5G2foHYloF1cdPxQIfRwn7el0A7VDXpvfyhr8M6W?=
 =?us-ascii?Q?Bil1u2SRC1dryPzSblOLKnK7rw7Ba0b5t9uvQtR5EMMOxzLhLcVBv1zL+XJx?=
 =?us-ascii?Q?uYfT69pu+lrxwM4Qlo715xMI3HLF+hBIugifYBZ0vXTp85DQVr84TYstnK0d?=
 =?us-ascii?Q?CiPx5uXMMJv8OSe6bKy0N9iSU1vbR6ChIdBZWz3Rz+6dSy5bjj2P9Ekfm6Qy?=
 =?us-ascii?Q?cePhR978g83LehJ/kwds8Rm7fXuB2KTHf1h5zyMWFIphefLYwowd3jx9sxHT?=
 =?us-ascii?Q?AJ38LkSJ+2Az4JxF327uclcTQAS7bbO+ebjHDw0Zpn/YboTRuZrzHZ7tpUT9?=
 =?us-ascii?Q?C0zKZK/sjQ2hJ+di1kpz+00QwYCcP56ml8qAGMW8naQUSyJLTLGRIjwzVLs+?=
 =?us-ascii?Q?n9RZbAhvihpk0I9mGbxlaiP+iFFUz0l0eJzqzFOgrs6EwUkLpeGmKZl6Uxqb?=
 =?us-ascii?Q?XNh90co26LbFv6tY/C+Wzsz6s+tcO3e5h8zAG6UEtYcLCZK5fwZhvDXmhdJJ?=
 =?us-ascii?Q?equZHmB1DCt40bR1l1KFNjTKKg2dPr7sEID3mbQZWaEestycffswzKhGrbrB?=
 =?us-ascii?Q?S7Jrk97EQDHLSzAIlAR1x8vyIPBnR75fI4SbkOW0QnkN1MbGSGQSsGCgofjr?=
 =?us-ascii?Q?Vl1NirOOt32yzTXyhRtyO3YL8uhJP/kIWwjoEQfKGGb89NfeivVAKnR0FXFF?=
 =?us-ascii?Q?nuux+gwKihZ+NCW/FiFEmXzQcU+FV7zFSP8P0kaB5WyUzgQpPnQcumxvup1y?=
 =?us-ascii?Q?4YV3Nj5E5inN+OEaFlxxb3EibRyW48hTTTMmhEVmBKqKvnurrLkur3FQznJo?=
 =?us-ascii?Q?1CQIh0Q/6X6fRdg6g4J1ONMoYjAy2AsRdx3DvmTn1d1VHnWk4H+lXYwI+MA1?=
 =?us-ascii?Q?1xQPHQxRYfQSdPeyazm5uqdZuPTJeFu8Nz9HZGJtF59o0l2avuF87nC1FL02?=
 =?us-ascii?Q?1HRlKPwWESYMuRlih6H2MlFfahIPt900akyNzWaRrjpyEcg6VuCJnJ6SQypK?=
 =?us-ascii?Q?vMIdZTu34w9/FQsR9NDvpNkGttFnqdUwV19ENhFh8Zh6W9dXzhrNvP0W8H7z?=
 =?us-ascii?Q?QW5GN0D0Y5dhBS3Fs7JqMnqa6st9u/FrKDDYX3UHNXDfLONZThnXDVnGMUSH?=
 =?us-ascii?Q?BiAF04dlZBEkrbweyX0E99br8gL9NdtPJfzpB7HXExnma14/Pj4N/vB9e2PR?=
 =?us-ascii?Q?tafgLY9S1MyfhwDEgrLL22aFQXKli1VCADSLuuizUB3YtZ8Df/MkioRv8Anr?=
 =?us-ascii?Q?2oVGkA6s0KOXszDgfSOtmMhSXRfIxcFtbUIHzPDpaj8c8T71Qct1FAxAOUe8?=
 =?us-ascii?Q?2q23JXdkOiga4jMdeU6N02q3cUe98tL+mDcUWW9U/7J7uZSI+OMzQy/AmIKB?=
 =?us-ascii?Q?6OhCmznsMJ7qJFdW41aawXZLb209wwsd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ACvDoFEPKIaJibTWeojaEKY1B90O8oOliZkINi5b3LpznlZWPKx8YLRbUFXp?=
 =?us-ascii?Q?q2qz/0k7HIeKjrKP1wsPN4ABdcoweGoPs/6nbeX5dAoMbH6vfbxp/t9IIHHV?=
 =?us-ascii?Q?gMsyV0xeObr9e+e0C8/iO2PnFhoePA++iagOhl1q7roRulgthUJp802M9gjF?=
 =?us-ascii?Q?xeLQSlj3boKDbu+mRK3EJO30Czn93ygLGcFSGadvKPp2YX5DFE0J6mbzv/Vl?=
 =?us-ascii?Q?oKWvf6jzND6qpxDPXR1vwzMXlAUylnYKCETAFaN+n127cgbjmJzxhDUA+kWz?=
 =?us-ascii?Q?F46QzmBWd3+y2i26OLxly2snGe0Qa3zMhERXR0mLY7di62kdwAm0z69YrdBf?=
 =?us-ascii?Q?fWkGUo3BugMU+5McbFZQer9KY/p2h2o1CXK6iV1KYnPEExAF4F5IMvADsrSP?=
 =?us-ascii?Q?DpRokFkWy6XRolNnaevuI5RhIkf7SC5DUUhtQ4xXvviEepvVAJ3Cdm7V4Th5?=
 =?us-ascii?Q?TY1PPGGSFcindeEpWCjv8ZmPTTgoWGshvonMz8QVOt6WzrATdCxnWy2BFwxj?=
 =?us-ascii?Q?faJyP4aO+r66ma5sOPORg/EcivZx+DNXi4DT2+fPx+2CA4GxgFomz+aTpSvq?=
 =?us-ascii?Q?Yi+/Eaapo5a3rpSoQMdTM7517PkW2WOopLVqOToUb+9/dPkbh56291tvMtb/?=
 =?us-ascii?Q?cyST83daIZIM/utu0kI4rFVmp/tyzS6i76BZF6I0YyuqfSFZilVV0eB4ZEyR?=
 =?us-ascii?Q?P6ReKMJXT+apbijpyrHxi5gyidBHrmDRIe6wNT8nXC68GQAK9FWSX+SAyn5K?=
 =?us-ascii?Q?OWtvl7xc/kgiyGrVM4ApN3TP7PfAZ8Vdyk7iAlsDmlO47ao0luTdPIaTaLNp?=
 =?us-ascii?Q?36yQGOMjJrlSeTcDygMcW5GOem57ucH/AHwYWc7RaXUVUcw1TWtCegHHmvvq?=
 =?us-ascii?Q?jf3q+prmj8QjS/DGfB1GyOTf4SoK+qRjOhITH+sZ2cpJdHa/EmpXjxq4C+ZN?=
 =?us-ascii?Q?x1HRPHhUlfrI6kA1WWO3cqwyKjIOuRJ45DSoO9a2th3v54MhE4ueMWq0ct/4?=
 =?us-ascii?Q?fEOTuXhOX/B8lHbkmty3tSySgcj6mtSL2REW2IJ63vXQNBYZMHgW5w5e52YW?=
 =?us-ascii?Q?VYJH+mVlMHbhDdksv2SowS0VyULjAjgO6Ei2d5mwaL9c6Nam48pvgXnbc6i0?=
 =?us-ascii?Q?veUSUO0Jo6AcmQAp4avfaLbBMXWf9YieiMwxtvDhG/nQW/XNueqbiKUDMvVr?=
 =?us-ascii?Q?JJVg+IaY6LhlstFSi/kHShA2ze3DcxkYWuoNPL9WTzKVSG/lqKb0IoBG2VOV?=
 =?us-ascii?Q?es3rqJ0M8RHL+CBEewOw5FT+GjtTgZCALN4cDRIZU3cOouxt0++RDFYJT8HU?=
 =?us-ascii?Q?jliVw/6l/zqDzyQk0hHFo99FcohLiZj567GXAyPGKFwR+z8SXxCP1joBCKks?=
 =?us-ascii?Q?7Hd/0SkTHwCMhsGCsJoc3svaZfuu3woU/KM21si3w6Nhu5foxYRYfgPZ+DdA?=
 =?us-ascii?Q?3ZC0FRKyw/Scna6BijY4MVJ58qj9nTdEuA8t0tRLrw3j7bkC0JPh4cPv2Gh+?=
 =?us-ascii?Q?XRkFZGK+Ft89isxDKrhlBGevar/Bzw7cNJhSe9r+i8jo9zkgXD9ugCvuxoWT?=
 =?us-ascii?Q?0Lzu3p24i9supOrx6QWs1h8XvYE0qD81+0/xjHYN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ac1e2b-d542-42e6-5022-08dd7162a859
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:17:50.3200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JfF3Qdjs8wzRY4N2rKH5A+yE6KuYGCjc1apKlG9+bCumBZ+5XKkfk7JUSxkD4Ao3pr5fpgpcOpj4ITq6J3krQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9908

On Tue, Apr 01, 2025 at 11:52:44AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

subject suggest because avoid overlap is critcal part.

"shrink dsp reserved memory to avoid overlap with 'dsp_vdev0vring0'"

>
> Shrink the size of the memory reserved for the dsp to half of its original
> size to avoid an overlap with the 'dsp_vdev0vring0' memory region. 16MB of

       to fix overlap error...,

It'd better add a fail log here.

> reserved memory should be enough anyways.

I perfer provide reason why 16MB is enough or just remove it.

>

Add fixes tag here and Cc stable.

Frank

> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 05138326f0a5..a65c5a2c4a81 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -185,7 +185,7 @@ decoder_rpc: decoder-rpc@92000000 {
>  		};
>
>  		dsp_reserved: dsp@92400000 {
> -			reg = <0 0x92400000 0 0x2000000>;
> +			reg = <0 0x92400000 0 0x1000000>;
>  			no-map;
>  			status = "disabled";
>  		};
> --
> 2.34.1
>
