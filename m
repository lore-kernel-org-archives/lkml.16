Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5B274B53;
	Tue,  1 Jul 2025 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376248; cv=fail; b=O5nKn4d7+owDrOV5W0dJFi82HChglU47d1VQ7RpjSl0q821nK//La0Ie3GHBrkvAfPgwzb3i43oHgCHgCmleIWIuzRMxIPbJMi4kAkmzDwe6yxgCGvixamEfEuQF71Wl0+VhJLoKIqdFHItW1iNvPy2pUyqJk/Vd8PBC/EdCXCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376248; c=relaxed/simple;
	bh=UvT0nuVA+YtswpL8TP4g5pL/7ZGieIKy4p7+WZl5+a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oV2Iwa2GtHKbP03a2aCVKiY7qQ77vQ8MjU88HA2ahvI0Ig3WR3GzxAlCTXuFFnxALGzZEi8AqD7AJts+UxFKPq4xndZRuPhW4YIuWz5n40Qr+aV8GV0xiV2U5WsIpwDYnejsBzffbxM2tVdIrTrFt6JOqKpnatCygCvFydVGv6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UvtfmaQS; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UvtfmaQS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONXUxtFAicoIpaCpxVfMxRmIKcLOQQPu7cPonGFm2UZiImmoPqGlEgl6GLFNz8I4lbOSz0zVYwcpIWqgIXtUW1dr92Zs5qaBcR1MckZ/NTNKcy3ix+yomFhExOyng3pWdY5Khb/al6LUrNoh/Td0QJPf0eHDgSIpZQxaloM/JJ5mlFKBTwDauF0kZRdt9kA9fhXNSq6mAHJiAxDE+UV7wIJSCM3Q9FxmysNCBMoDRQ2pffl+fIMdYp9nZQB+emOZi4xNabTfZshYCeU2j0N9ch+HJ0ZReHxU9mWfaIzLdC6TObPmmY3kZ+Fr9N3Eze8LDFQzuyshlC0sVhbmAMxB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wu3eB8uqgpffjIj3biODbLbSjeFmZ6za1NKqg+WiZms=;
 b=oN6RlPitG8OwrXOC+b+6NiB8Y31uNQ1u2+rUu2AqS0IlzhslGk78NOwhmzmfqlc+JEKwpMKUDF0ArXVM0MsL569pcpjY08cbVK5PJOgTXXynFO+iE1H3En0803Wu35uswD9eHNDqfV38LgUcjBAfWNi0f8d0jleGelQRfNtU4btUTy/g2GXZJF4xtNI4WfSwCZa2atOaN/licI8NLrCs1xfKKTby3nkqEuOpUxem+88O0wXhGWn9I3H4N9MIjZsoFvPSMb7XwSw2pf6xJQgCYsANbUqW7254Z3XvYEytX/OAW1QSgAqt1B62f/9/8Z6GSDy/PmBU4dqgyBvJ6EHShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu3eB8uqgpffjIj3biODbLbSjeFmZ6za1NKqg+WiZms=;
 b=UvtfmaQSWgifYOzRfVDlBpyneOBVH9kqoPntkv6nYrwfWliPN974n3jFkw66uGQIt/2u/WXSE9buWbCsPLSnFO8udA+0D/EGyuekdllq+kZUSOPIstki6Ae2zyIW2mfGluTj+5aXLTywHBgTIQ0VM3YbrgZcAv2T9FtRv9pkHDuUCJqvIlJya/BV68CYf87fjmc8GAtlg2bxs2XhWPBp7XlLOkqhR5bjRUqTxtLZZAG0tuX4BU0mFGj0zu4BaET5akM9yNrm9Ed/lZIOVvye7lol2ltC2c7RgvU7gcYR6ZatCqyzsBoFzI57BqeKges9FdXS+mpBc5pXsu3BxxqKQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7267.eurprd04.prod.outlook.com (2603:10a6:20b:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 13:24:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:24:01 +0000
Date: Tue, 1 Jul 2025 22:34:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Message-ID: <20250701143432.GA20538@nxa18884-linux>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-5-00db23bd8876@nxp.com>
 <466b4352-91b9-4259-94b0-b8228d8282e9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <466b4352-91b9-4259-94b0-b8228d8282e9@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e50c1e4-adb1-4be8-bb76-08ddb8a28acb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zVqL6F598ZprRyfFLVMH1hpGxZ+lRjzm1DxOhAmqPla5PWlM/znzV1zDVSre?=
 =?us-ascii?Q?alBreb3JxIqSyP3T97rytFpjNijdlNM6eBH0NEUiGB2A+eeZiZxsyjHAfJRZ?=
 =?us-ascii?Q?V2sXhnxyhFVQrrNmOcwrfO3YYshnW5hjfkXacrzG75illP7U0XhsFf8DITWD?=
 =?us-ascii?Q?RaMPqEJrkoDkdJYMjCMDdRC3zjOyV4wRBdTZqZeqQSsOe+KCyHiQ7qvgBe3x?=
 =?us-ascii?Q?p1yz+yiRMVZcSWyvJkBO8eji6wt2NPr4E72fPM3xxLpBf0+gdjIxNGg5mcsD?=
 =?us-ascii?Q?d9edNAYQ9X+2kXzmozX0MpU3JFlGTzl5pQ/ejZBUGyGaGZbFGJVHzPNmVtMG?=
 =?us-ascii?Q?GPrib+FXXS97rFOUYUgtCNY8x3KpKX3FQDJc0dWZAMDzaBL+s4/8pIdN++19?=
 =?us-ascii?Q?0gxwk3AmarvOnhleC+S/wQ2DkOr2mt5QSItgx995Z1GWLlcJsznHJ12nadPu?=
 =?us-ascii?Q?9XY+25MZ+td3/5xahaFzDBHyQbdD2S0G5gs59NSANwNBx9hAeC0IaD5O4XI7?=
 =?us-ascii?Q?eAlnr5awjYENFjEoNE9iA2xi002u2Ia8Ilh5sIHo8P2hcVFCnzihN2QniDiu?=
 =?us-ascii?Q?YpjAV2TyWUCiBIqe19bzhi1NE4G+ZkMXUI1TCSn6oiAT2TzjmgDnJe2sekC+?=
 =?us-ascii?Q?yl4gCeeU6XjRPAufvrEOCPj3rCpNjzj3oHl10N20kaAKtK39C0V1zcCpzHfa?=
 =?us-ascii?Q?oZdzRa9GGDgeRrRMLlXx/qgmY+cmwH/tNNZe+6Ur3Qb0L1jRbgup/CF1pVvj?=
 =?us-ascii?Q?twMRYeohtEt/O37lSUSmTl01zkuFB3V6dP9Z+taMcopbUtv6vHAr+eUnVjLh?=
 =?us-ascii?Q?IvVWP+WWHul8j4FcgEWlTh893OevuhVWAilwa8nUpCT5wTADF9grJFLNwT5m?=
 =?us-ascii?Q?UiwHJ86ACdltiVUnbVpiOekxU5z72vLSHhlq4N3XEvNmrMAho1hKsHUIAtMG?=
 =?us-ascii?Q?IyX1QuBcMohX9QLM39lKuk6auuQzhCMrvlxr9txvEER08zFDRmadyzypiofP?=
 =?us-ascii?Q?Z0cXi2x0ZvSsY+hRCpkt3bGy0lLxAKL9NvxNX9twXe03bxLWC6TNHyHR6MCw?=
 =?us-ascii?Q?lv4Vee1Do0P32rk9d3NbvABAhGmU1cw51Aeib5OVjGgESR9+YCwj2fSXUuWP?=
 =?us-ascii?Q?UqtX6dqkzV2/V4ize8hzTRdxnQ+WFqfVKnHZvU8EyO8sCHNCi14+CX7x1zlD?=
 =?us-ascii?Q?jDNipWJNYZlzddU9nuolOk/dF3PbWzBdYa5EWZ1ZGJc4dxnWIdR+Rz4ARw1X?=
 =?us-ascii?Q?TBLHjYBC1PsUKwIBH4CinxK6A5BMp1nBd9ikZv7SX/KnMcSiRMa/IyfYZvQK?=
 =?us-ascii?Q?YUlCki3rh7XbeQ6EpaYUavUtvNP1amGitDYBrySf+AsuFy2p/nz7puX8qpTI?=
 =?us-ascii?Q?TYyt++LvAVr3ZJL6/te+U70AwAGW7wq3jJI0lNf0COBsjflvlsJntDlDr0Tp?=
 =?us-ascii?Q?8vIxc/xA+uKBwONMqUkUYSWfnVtqx9gJdWoQrDDzveFhLyrdSdZtLG3EhqvQ?=
 =?us-ascii?Q?DC1My43QsIdTfLw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J+/hejWtEYoAvEj9bRjQ1LCY3t+1es3tjKjrzs3of9Mfdu6XzWs9JknBTaaG?=
 =?us-ascii?Q?8mdgJtNtOi7jANchvmP+VRtWsND0S4tCqKfUBFKMauMaWe17ljBx6YzVgi8f?=
 =?us-ascii?Q?ZHqvx3c1enmI2yE896DmVEXbxA70UaBAu91rC3ZjGuiPOFFMuV/9waMjIENM?=
 =?us-ascii?Q?L9ajPSrWne3wFjtJrHIEwW7yX/+OP/nI+yud5CvnbSeKTq8Ztru/ImCwP2St?=
 =?us-ascii?Q?HnVJz+PFfYuZ+UJk5J6DX+hLJHfm5dBU/1QJJquyXG0LZ+Lrjhpd8rxmNlZ/?=
 =?us-ascii?Q?/+ctG3dOrTA0Oi4Yg7N6NfODzpr7AJpJs/IbWDdQUcN7iF1AFUUxL+1IPYSA?=
 =?us-ascii?Q?e0x6NMWxgVcRM+gTwiWEg3A+Dety88hqxOsGN1TGLWdOJLRd8dzjycHK+9gD?=
 =?us-ascii?Q?0aNTQzfFY3KeoebUl4EjcjNTM46D+unA/zsQ6H8Qo6m4B1PiUTsn4THslk6o?=
 =?us-ascii?Q?DZbdehzexeVQldjDNvpWlEAdtOeFaDN6EhHi59EWmjIgELk5srymXCm3zgmN?=
 =?us-ascii?Q?EBRXg8yYb0cPHoo3bioTibJ4uz+fuArP79dnI0oa3jTp7yBu2W6YZpdKmbjP?=
 =?us-ascii?Q?w3iIb+JL37Urasjo7F4mmEApUg4mBCPqss5NwVVW6jzwTCUui0ff7wx8bfX9?=
 =?us-ascii?Q?2zzDZouphqIqqf/Np/ffgpBayBLECMMBv/f/hwKSxmeyk3Du+2WBMcEjtsKX?=
 =?us-ascii?Q?MLz4h1rW9qCVOxIlLVDvtPnSrGmPSNqQGETR2Sr6Vl3+qZqI4+fFHHVjJd+l?=
 =?us-ascii?Q?F+O9KoHHt8LySawnc8g7BcClBUVFV7ci77DUPfdNcLFcdvtKAG6LowPixAku?=
 =?us-ascii?Q?qlWO3MQcJ2wzl0JhsvNHVOtwFhh6sgiA0GEZei0xEgSkxOanNXNu9TTEm/OH?=
 =?us-ascii?Q?w1GC7vbBWp7MlQsJSdcGaEqa/R7M+qTQO+OxeDXpZG1jGbT/84KyXn2erUFC?=
 =?us-ascii?Q?mbTx2IZPVfVAugbSH4eotBWDMhaKczEgERobdF7Hl7nE0MXdf3NyAV74ITlX?=
 =?us-ascii?Q?+OPPZ7Vr4vOi5FLE3FmE45pA57HSqbUlFeDSK5Op9JuGy8ifjq93jrmwH9ef?=
 =?us-ascii?Q?Rjgo9O1Er699z4zI/Z7KHbHRG5j+PgZvWDp+ZQq9IKosfkdW7q0OAU17z23e?=
 =?us-ascii?Q?Ow4mm1NJIYJaFqDq5WnTKqkUj4YD00DkbOU9gFnICXdLGY/UyDpfQ8AVWjqr?=
 =?us-ascii?Q?tgkQO8dtmdh3gu8GPObfgsBCzO5ViEXKk7A4lQiOEuo/apmkLQkk3YCbw8Tj?=
 =?us-ascii?Q?e74gONUIABCjRPJuENw0NouVGGx2Xn8il3ojJ5ipB92YK+P5Yqe1MvFMIrHq?=
 =?us-ascii?Q?ceHf9rlO8LcrnK/zJVI8mLGSWkAF4vRl/wBKsi4LdKBEDsVfvpV0WMTazL/b?=
 =?us-ascii?Q?/U7ebG/+hYW/uwrh/TVTNQTiemu47Bk4ZrTZu8NcDMX8u7sYEDHz9I2AzRt2?=
 =?us-ascii?Q?dFvzuQyuBeHGhJC0CIH0uJNVJmNP/iWL0hWjpE7mO7k5mB9hr8KFZwqSOTMy?=
 =?us-ascii?Q?UiNd1IAB9KrXR24250DamzIzuqSmuSCkXicer0Hn+Tjb7senTzomkyp07gbW?=
 =?us-ascii?Q?+Y4b5gEtrmsLNMnYJRK9SJ0AJ6ufNsRLdFl5evTf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e50c1e4-adb1-4be8-bb76-08ddb8a28acb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:24:01.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKuXJPfhtoIFdIVuYEqVkQpzUyFztHz/cwXviUK7CJdRqikEK0kYs4yfIaeIONxNeCIfVOxObEo6NecrzTGkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7267

On Tue, Jul 01, 2025 at 01:38:11PM +0200, Krzysztof Kozlowski wrote:
>On 01/07/2025 09:04, Peng Fan wrote:
>> Add nodes for LVDS/DISPLAY CSR.
>> 
>> Add ldb_pll_div7 node which is used for clock source of DISPLAY CSR.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
>> index 45b8da758e87771c0775eb799ce2da3aac37c060..cf67dba21e4f6f27fff7e5d29744086e4ec9c021 100644
>> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
>> @@ -3,6 +3,8 @@
>>   * Copyright 2025 NXP
>>   */
>>  
>> +#include <dt-bindings/clock/nxp,imx94-clock.h>
>> +
>>  #include "imx94.dtsi"
>>  
>>  / {
>> @@ -145,4 +147,36 @@ l3_cache: l3-cache {
>>  			cache-unified;
>>  		};
>>  	};
>> +
>> +	ldb_pll_pixel: ldb_pll_div7 {
>
>Not a DTS coding style.
>
>Please use name for all fixed clocks which matches current format
>recommendation: 'clock-<freq>' (see also the pattern in the binding for
>any other options).

oops, I should use '-'. And the rate is not fixed, so not able to
use clock-<freq> for node name.

grep "fixed-factor-clock" ./Documentation/devicetree/bindings/ -rn, I
checked renesas,emev2-smu.yaml, fixed-factor-clock.yaml,
I could use "ldb-pll-div7-clk" in V2.

Thanks,
Peng

>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml?h=v6.11-rc1
>
>> +		compatible = "fixed-factor-clock";
>> +		#clock-cells = <0>;
>> +		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
>> +		clock-div = <7>;
>> +		clock-mult = <1>;
>> +		clock-output-names = "ldb_pll_div7";
>> +	};
>
>
>
>Best regards,
>Krzysztof
