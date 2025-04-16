Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A151F9A89;
	Wed, 16 Apr 2025 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814531; cv=fail; b=YwNH/WEWEVuwaGBMA8c5nQWThKF2WWOs+PanBpf3IAhyT45OZHVguXljl+FvwiE4xd3FT11iDCVLsIogT4pdNxAuxIP8oSe7wEUk/KOEqMAoW9WdHZfNDDv4Jncxiupx6m+2M7Gz3fF6k0u0tPkKLkNcwBZFMJcxCJsZdzSyRxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814531; c=relaxed/simple;
	bh=gJ7A3/RyBUT2a8jOSsAcyBoDY1Rxv3dZmOU7OKPVcrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k13HaNT9yAslVgX8DJ7YstqU9al47yNQELMtXtsEURD4+YQsUI5nkBFnhJiIsuxhbgXhF8NzniRgJTenYFqMoAe1OnX8a1iVw3NQgYM+33r06d0noJjCvwcoKW6y7WXdtiT6Y4ZC0QKccATdmkIc6bAKf8yH/Z5WVDdVN22jbBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oXDERyIf; arc=fail smtp.client-ip=40.107.104.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oXDERyIf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEPfCVYAZuTkAzSuD19G16FH4KnsHGjjGZ99g48gTCKiIWFUZUEEgXyFkOjjJE6w2ZmbMnyowrUtafxAqZRyuX6NlimHxCOhtuOjD5AUkm9x8dlHdMVOak8LcldpgLCOTBDPgqirwv0TKK69k3PW5FwBbutovPeNITHnN02qYlO/rwK4NTf3+7aNq0xE76sWNazAhpcBOe42jQEc+7k3UZ/htkkU1puUpqqOGy9lfEEdqw+VMAzKJa47Sq7Zr2gmKXiW0p9F1ZhNSCUrj32ZV0OKHWQrGO8e+xdmX+j0vrTWbUawg0bJILluquWhxboXFWeYmPeuzYS7/Jrip4ifHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne2fXTvDvNP2Ot3uN+Pirpn3NxJl1d4Zq2XUsoVNJD0=;
 b=iLvR2/YC7JGunGANW+IVFpU/rfEcOAVqYjV/57lmQUfFjWZptQhkAc8JY74qE7VTMHmLUQzvCVk/u6BEoDc/nl+80ze9OFivl+f7+cUyi/2ubY83Rl+/ogUP/TMhChQeQEgbwmSDXJ/wCXEhRh2Hc4OVKNhj5ofDdqIZw0tqKtjuobu4XPoXdqflJaFzElKtppraoTgqjv9uG0Hh0pBoYIpC3pRJfMXG3faZUVXNh3PTCAdL535mqBv4DRCD74wgpu3U0cpArM+Ge+tvKKUCyGKh41owckWrDwgu1SxumjDem/BIp9iYc+G5CplY77eoLmEJSUO8PYEDyyNRlS+HSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne2fXTvDvNP2Ot3uN+Pirpn3NxJl1d4Zq2XUsoVNJD0=;
 b=oXDERyIf2/gwjN/cwAxLVind4u2OZuhH8oRHm9Wr3Ys0beNG7nZPRYPfgPOLUH7J9IM//DNEIxtfHvR1s0p2QgHgmGTevMSzFRyrsbwiseFH1ZdhJOX/gOTRGge6MlpkBJG+Z3o0Oibf6goghrdMTshd813eiAW6nWgHJHn8Sq5IXL4Yc/jLI3IcFdMii9AfI4Wl9KOI1L2yH73t2EjWYYWnjH+Wxlroi/WbdzHDujetd4/kiYf/nyx2lS77DGwnh2Eb0yh11RzF2g7lMlPMlQ5SbAVRWESGYprNNw6Euv/eSjeZPyvJbjL5LbcsXE5RLsu4NraOZNIOcEO1ltq+/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 14:42:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:42:05 +0000
Date: Wed, 16 Apr 2025 10:41:58 -0400
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
Subject: Re: [PATCH V2 04/10] arm64: dts: imx8mm-beacon: Set SAI5 MCLK
 direction to output for HDMI audio
Message-ID: <Z//Btmb7TytV1xLL@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-4-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-4-aford173@gmail.com>
X-ClientProxiedBy: PH7P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: a9048958-4531-4e8a-3ae2-08dd7cf4db9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y+J3xhmIJAzmMbMPETwQag/cJZz6AqYmUKZYlHYTIv780m5ZuC1WIUaMNshJ?=
 =?us-ascii?Q?5fi3i/22oFhSqrTMfR03or3pywCGVP/FeVdUM3+M8NKUtKj+EAivOHBzPi5H?=
 =?us-ascii?Q?jbCpyzbLbrcf+CN6grBTU1GMarRjUtFIOWJFZGcCCFSdPGL4CfRo8QFyqg3+?=
 =?us-ascii?Q?Omy+ZjNiXp2uQJwxtebhZcVt7wOP6cnITlmGJ35Z1qwQtMZOlJWEIagzx1Ai?=
 =?us-ascii?Q?moLF7jGCsrDoxSzffqV+uSxhIQwWcujaLVGQxpcD5/zaFTll0qTdNbtAZtm9?=
 =?us-ascii?Q?dgOKNangB2t7Sm1LR8o1tpYK8u6mfPZLl6uv68xTKauTY2UZgaDXXzU8BVBw?=
 =?us-ascii?Q?fX2x7mSKgceC988fX9Lwr00WXRqx67AHV+nY3r0yONJCIoqZVPZ+qz/ns782?=
 =?us-ascii?Q?MDFDgzxYSJsSvMIBc650MdM3XycCtnR0pcN4jgrvPClse4OSipgLthAvMzfI?=
 =?us-ascii?Q?V0nrwSRCNxW3mmLEw/IgK4YUrcfQ5AL9DA14ledpMq9zb6xF+EgKc7ac/sAf?=
 =?us-ascii?Q?3zQhlAaCiwLO2UhnZ1prIhsF/o/AeyuP0E7STKcKC12gXujWg5AwTvI0/rT6?=
 =?us-ascii?Q?MsDD7pNU4E2TjKsZ8ikhHYrCykVJuAQBkSDfckO0YmtVb5nP2AxFkgYRrWxS?=
 =?us-ascii?Q?EzQWeRsYWIBzx8By3C9k9oPBjs6axy1teNCi/0k6yaqI64x7obuxZczhoucA?=
 =?us-ascii?Q?Ld2SkBpaDSoSCLsd3ln6rjcrC8pfkspmq9wdAzbP2J+WQPJS8cOffbMcWHgR?=
 =?us-ascii?Q?KPDgjilENQ70PjE/z+SXB3Ts2rV8//KlwMYGwvsuMAvN521DrA27znbd+eVI?=
 =?us-ascii?Q?VKROvNs3pO5R6YLVfR0gNI+hvsqjur4NALPlvVjvqBXhN/QNrvCm81bX6GLT?=
 =?us-ascii?Q?2aasFUtq1BVAi90GLfkReDSlQSxM/11CpPvdMf10I9pNunYZpUmzOtcWgy1w?=
 =?us-ascii?Q?NIGFkfpsOa+WaVBOgff7FEhbcsOn4FOv2GFU7bkqlUx5Ory8O5zj33emex6L?=
 =?us-ascii?Q?NlqELmcXUbMaoxNrwFrC37m1wPjXq/LaLb4HRmsWKs88JP1hu0cJb+cjA12j?=
 =?us-ascii?Q?95OMHoj+JhYWnkCQSEQKLvX31ti91AMm4UxgaFp2+hKB+Qu4B1VMDj0U4TdK?=
 =?us-ascii?Q?pCSS+UQihBWKm64T8mXmP/Ef+ajq2cU1vR3tRQ5xjIcwUJZTmxLRBKnj305t?=
 =?us-ascii?Q?sYLmTkSgqBqaXHA9UtIFe1L6OlX2ysQpWHOOr9fx5GO76OvuqOdYtWHjK7Pr?=
 =?us-ascii?Q?zQHhbBOyIwvox2aeIjeNv660XrTTT0Nz254lSs0YiNvKQP62I4csf6XCMvWi?=
 =?us-ascii?Q?aWH5xLHsN8waygybApydASZSrvVDvQl/5+6TVA7K+Hdui7zmxUEZCU904+Ol?=
 =?us-ascii?Q?SNALQilslx3sgq+Pkl/k2SHkcQIzFrTQfV9JRfiZ4DGA1JLC/f8A+68Bnuim?=
 =?us-ascii?Q?GJIqrbqSX5sBxz9DTFzJVKGgtkDkwzUsBX/mLsB0fkwERr9vO129bg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?myC6OkxWKKu5Qd44jN1U5yrPFW9jRp2+AksKMA4hNmxwX6nCrocUmUs+nEUg?=
 =?us-ascii?Q?iR7Uo++b9bwVZ9RGWKBannxXMwDnKBUi8DrQgNdGdgAK2xGMybrDGhOwnUvR?=
 =?us-ascii?Q?iFV8OtVKgzJfEKLtlkJqDTIoBCeHQXtkpiWBnCFx7AxLPKX6k+eUi1tHuWYL?=
 =?us-ascii?Q?bDC7s9aCCaRCFKoiJOZJcrCW42FgXHmV5pOB+pKqgGDo54XXoRwVT9LQf58F?=
 =?us-ascii?Q?ZiegVmH8NZwZwtp1HuRaM+iLYNl6CHykps6CHiPqU+IT8NOQaXpDWplPjK7l?=
 =?us-ascii?Q?T6iSD5YIj0Hl5b9PcQOuDYIjU076k/gIvBhWJGMcXFatna3bU31PVP/emvuR?=
 =?us-ascii?Q?N7uhEHe+2jYnxfL9ktj1Jc5r5rA6PWn4Nf+TkZKbjw16m2U/p9977bXR/K8V?=
 =?us-ascii?Q?1ra9TrpUm8vMuMQJgsqc1Gs3UhmpSx6YhVTczWitZqmwj+YTtXSfK53Lt+cY?=
 =?us-ascii?Q?oJVgKQl6T3OceOAFZHhHl5enoS/W6wp/Fbnmfuv8RGUHhzlo/ttGo7P5RuI4?=
 =?us-ascii?Q?KqvX1b056OXI0sm/qx3GDe9Kn16ll9pQpW7RsQFtLtdVBDlIhu80q/PBfgZI?=
 =?us-ascii?Q?2sOu9B5zFabM6CINRLqKJDSUyDs0VR15pQ+p3d8TxJiPkY4oAqspTzvrKtdY?=
 =?us-ascii?Q?I+rCLl4QZIpoRoFkkVwDRqRWWP/hP36JzgYhF9rnMy8aTZvyMA2vEDc8tOvl?=
 =?us-ascii?Q?Txqhl+jJjuMyX5F5L6PvJg0xybdq9rzM5Q7zH+H0IkG916XIdSaPpnAJAzNT?=
 =?us-ascii?Q?ZNaJQP1nXgqBXjIoBG+OdUiY6CfWbmFZj0HzO5sgTmBRmBhcsDIzX1f+GzWP?=
 =?us-ascii?Q?aoloEX0oUK6rrHpCcCM0sDiFF/fqFSYmyEsOZLHKLMY93tiyJo3ti6t7jHlK?=
 =?us-ascii?Q?1wa/mEKyDWeFavdt8o2AjpKqbEk9IY4VuqvDfS9vKJxd5/cKQzCwpqqN9/PE?=
 =?us-ascii?Q?pEvQM8OMp9kFFIZuDK+nK/csJXzw4anjq/nfmkzdicKTfhfMti+VU05baM6E?=
 =?us-ascii?Q?C+5EVlEqgJ/oh0P0Dj9lrHtmTsFJIwzIDFTnS9DHjgll61Kg0NulVbXLWvHi?=
 =?us-ascii?Q?WP4EkBMK6XqK2x+EfJl29wwzaJ+iy2er8ZRHUtLwqtt8Hu9p7Euk3o7mXUqr?=
 =?us-ascii?Q?4DTvo7wkTNrAfnoM9X5c/pu5FCNZbqJ1+yclYowknwyd86+bjcyiKkVlbb3t?=
 =?us-ascii?Q?a8rBIDE3v9vvdlX5XzTrJcuDxmBCvEVclz8OsKzj6zibEDD56Cp1eKemYISc?=
 =?us-ascii?Q?aAyJOLbLYUwTUAsBSCjnYgsxQvw+40vVrc8hdap8Y2AUfyEgkiJR4koIFEL1?=
 =?us-ascii?Q?m/9mmVUoV0DhJ1yYtVzm7y4bjhkofgLzc1+F+e89kcxcn193BANayltutkUW?=
 =?us-ascii?Q?OHUYUT1t/uguCTiU43q7UEhs8BJf7gaElxXA30nMJ7HVDSvsxpMfIoRiXVMD?=
 =?us-ascii?Q?8JsPaH/zZACh4fQqiWivNpQWFTaegINCe90p4Tau9yTEvsv2zK4RKYh+impr?=
 =?us-ascii?Q?KU4S0Hg6cM4w7ayhx21DVcvbwXpU6xYAODTr7Ia4MjvfRq6qUetfNH8Jdc1H?=
 =?us-ascii?Q?4ZUGdowoV33XzLzfdA/Tn0LDxFpEUDR8u8sYeXpC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9048958-4531-4e8a-3ae2-08dd7cf4db9f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:42:05.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+3q4D1EQDWstq4LRcIX9/G5NYFxFvvtpJiWCFQjbOS66wEHdgMd4bDo0+i7ZtnRSpLmwFcer4MS9/GICb+vZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

On Tue, Apr 15, 2025 at 08:01:30PM -0500, Adam Ford wrote:
> The HDMI bridge chip fails to generate an audio source due to the SAI5
> master clock (MCLK) direction not being set to output. This prevents proper
> clocking of the HDMI audio interface.
>
> Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
> the MCLK is driven by the SoC, resolving the HDMI sound issue.
>
> Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> V2:  Change commit message, no active changes.
>
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> index 97ff1ddd6318..734a75198f06 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> @@ -124,6 +124,7 @@ &sai5 {
>  	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
>  	assigned-clock-rates = <24576000>;
>  	#sound-dai-cells = <0>;
> +	fsl,sai-mclk-direction-output;
>  	status = "okay";
>  };
>
> --
> 2.48.1
>
