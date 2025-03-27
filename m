Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D32215F53;
	Thu, 27 Mar 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087536; cv=fail; b=rqz+uQ7CHVH5pmaURLrUlxRnQW3I8kE+xxxcv+RkX1wMQwdoDcIpLKNbEZbbbxZYWtNIASoUwulzgY1c3Pu/rjbTGdFBvOCfjYibLw84IoJQQF9jLPsZEeg/OCGg+JQflLtqKpOS60DhO37A7P0rwADwwDGx+/8ZLXZIgpnAZXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087536; c=relaxed/simple;
	bh=QVGd0xDgw13uEQXVCV4tX2vSxs+/xLR9WhKNKs2pLqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ESY/wQ6g9RoxRMf8dXKho1U/8KM/upBsCbrC7JNhqXi6ByH7fcS3Iygqc/qo8o5lvxQRAdz8QanqlK84Z7tVH10FFw6XbsDgoi1DR3phxGDqFCvhmayc9RZS8SGDOdoyVcynUGPoQS1xioJ9TocvcRI3kRfpbX03rFieJ9b4J/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SS19nXBS; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SS19nXBS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3iezoRcTjeRYCZ8idzU4kkLL1+iZH6J/4baow5tB6MdMk72VYRi6jj1KrPNhzNqeInCx9rgUx5MJ9/6HMQMbeW80jDf14GqBOn2jOnvQsv/vEdrqcB69aQhpqk3i35MuPwrVceEafQad4OvBuuQgdlzFnGjZdavW1cWq/urqNQxnGRAIqkK7mKrLwgNWqqRrajWRYA0zsc3udZa9+MPZrU/EiMGiwZuwA+qcr8wFQ9ac4DXxxW1Iwg94QGF/aherwmGT05eGLHzrneBV8tSRLH9iHp17pozfMVZ1Iopv2PGhUnAOkYo5ABcrF1Lj3ljf1+6Kzh8TC5pamzqx+PkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcoPhU1CQH03PKYyXWeOHvAAHeOmOAIZ2DAwVBsKj7Q=;
 b=l3HoL8buPGndo+/O4V41yeZCOuk+E2g/CwYQo57ZzmZQECl+n/5KJwEiq5VysXQYBNQGVhYUuikUbsBKbLZzMTi5KqPmv9iORRVtmoAumUDrd/55G8zj+xrgmL8rEec+IN6w75tms8ZVjuNFZFpHjnsHjgI5qwwfoTUoYmfajLv+5b1hFff26nVK23doYNHnQZ5S6FqY8hD80krktbQtMNEnsV/RkkoYNM/sGfXGcczJegRnWMHhAiWiZbcttE6lydAqxjjjWV4Oko2GqLm0AiX5wXz8HmhcuCmFs54QazmEhleKMwk6Hw7Ql6w7s8ufUIZNM0b2iyoqNcJwcJm74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcoPhU1CQH03PKYyXWeOHvAAHeOmOAIZ2DAwVBsKj7Q=;
 b=SS19nXBS3utb8E48B1Q9KRO/qk9T2x8ijm0iKp58AsuV1SfqqM4Nu0SmoMlaHK7WqYEljlviW6OdAjIl4hBFzgsRB53ZT4IY3Pgj9a+U3ILaXc5sf4Pxxw5zlhDWuLUxV1zpGdBhwNrqgfrsXcfRZxRSsFVNjzUuOjQO9aaE6N5+YoKnDL/srt+zLklXSye787NwyhQlWB2+c/UA6Dygef2iglKEJydlW5DPkI6bwEOtbgM85BIMEpsCl85Z/zFcfWbA/ixXTwdIRylepJI4DbeGO2RyFE3ucGns/Gz/j2Nmucij50glTbQvzxnOE8jCHMArY5wH3UM/S5oCWjpk+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11133.eurprd04.prod.outlook.com (2603:10a6:10:5c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:58:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:58:51 +0000
Date: Thu, 27 Mar 2025 10:58:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
Message-ID: <Z+VnmkgpWhlLm/W9@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-4-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BYAPR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11133:EE_
X-MS-Office365-Filtering-Correlation-Id: e58b4326-9028-4b34-5ca5-08dd6d3fe232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+kmNiPOIRm6sXJ7IOnP73sfiNGvptHEcmrnA3Ae0emD33X+YEiYlWn58YfAt?=
 =?us-ascii?Q?BsvtI47+r9mT9nZEw15e0LZHWhx/s+ZYSo4+s9QNm9hLcZVQ5Ogv6B7InfMu?=
 =?us-ascii?Q?MyR42JxiuBgFEuy/XdgwL/lJekX/ZvzwzyXVcFWVNRgGI8liK1j/SvQ04B6w?=
 =?us-ascii?Q?bDF7rieYAsg/gUjPSqqeYIrclwlDcqr1nKpuRJwZXxHGIaiteBT0eB3P/vjY?=
 =?us-ascii?Q?muyciWyO8KEYTtQAEci0P7MbBsvC7GpDQNdoIIw294ejq4x15YObpdU88WuM?=
 =?us-ascii?Q?MIILaoKJa4+rwON0V5ayTZmqycjP66krYQ59x4d/H/8YWYFOji65gji633Fo?=
 =?us-ascii?Q?DNu1n6uGyOxoDw+ynZVsTQ1oGXd5iR49byjJzTFWApbDOTy7+O0Awu28jsOC?=
 =?us-ascii?Q?gM9CTRKsrUmVyFwCX1giyMiDrzLM8B9e45EJgVFtIu1nZXSV5MmCC4sToD4k?=
 =?us-ascii?Q?EdCKCaDXlzsS5U90PP0G81XJKjbYWKi0ytq4MIR38loSsR6V5XrkWfOpwhMd?=
 =?us-ascii?Q?qyRQyc9niV7YHovAGo9W3pdLU66btL7XA07LwY1hrq6qQQakVa9Mtcl3uhTS?=
 =?us-ascii?Q?CJDv0X9p4zb1ewsLBhSl697NQ7+nRbbfi/gFA6f+DO5rISlCJOLfc8jU64YH?=
 =?us-ascii?Q?QkZWYEd9i/U6FPAZ39T2qXsEd1uAY/ERmLOT5/N/UAkBdZssQAO/Qm+r+ehP?=
 =?us-ascii?Q?t8hi9PvnYUdRNSCJgdJmrB1+spR6YKZjrepyK2qhC/SHgdB0u4dimtJ0agdU?=
 =?us-ascii?Q?NFyYUP3kjdlSGH5patXgvCGZwv6VqWhx59OS8QpKDzzI7DNVAs8Dr7vd8AdA?=
 =?us-ascii?Q?MSiXFtIunEdvHIhNkWtmQfeifgw1CTQWTiIMwboQuAwHQYQDbT3lXr8fymMi?=
 =?us-ascii?Q?Z0D5+dF6mzMqMweZmH/QatyiRZi1MzGOkwlGp6QO8knAYSh4lXs9YvOb4ZZS?=
 =?us-ascii?Q?yox8FAY2cY7vKXWYb0iq9SGkb40lBjlT+NWuIvy2Ib8dqbP9zXZqoTFovnxJ?=
 =?us-ascii?Q?L6ak3Nq4UdQY8S28VP6djxsQTjCTVIOwPom56dtliHmy6FdQzS6dbRrpi5Ea?=
 =?us-ascii?Q?W8cuNtVB+zMLG2c4DntMgH69ED4IBb9ddJkw77jBy2lYrAVX4m7og5OHt1XX?=
 =?us-ascii?Q?4yrqrcA455ClOvl5eB7mkgZcbx/yMhsazzJ/25LKHtHkA5sqTNioSFMssb27?=
 =?us-ascii?Q?dCFx9Jod1e6RjJ9y/OVpsg8Fe06P0oWQxV3Mu1h3CmEDaaXWYgE4LXdyxOn2?=
 =?us-ascii?Q?NghFkdJfdG+QwpBzGvg+8BTuAYqU7vnKdgivDqVKqobelYitpTGkIRtTOOmI?=
 =?us-ascii?Q?8ANHFmjpzWg8CchP0r3lzMiQqcni6+426JQdWje6DMMphAUWHP5o2s2yYWGg?=
 =?us-ascii?Q?oxiaaMlD2lpv4xwt4W3jqD61nisIi86316msIGouce6S0bjAZ+eNqzo1se9C?=
 =?us-ascii?Q?Vg5SQxyd9Wsf4P4E//mnKcVi/4Kd8/+dTpkwhJXEiHAKK6imzWX3JQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vAYoi4/V3TWEwOcKAH0CekzjgPIW8d5SHRTWUFK7MdNti5YykloY75c44DcH?=
 =?us-ascii?Q?0tw4KCGj4XB++RuTznLFJNB54ujSkOBDHPgDSyiQTAlz6wAUkrGleKVJ6Q1+?=
 =?us-ascii?Q?2l3+VDUldCqat7zctrTZPUFO8t1R6aMSAKAeQEZQKiGl7a8XH7yF7KTWWzbZ?=
 =?us-ascii?Q?k1Om6P+6AkeECLeg3AR7oS27gyivtXvGPmmEERD8v+ZbMxhLB83qKDXnWiZB?=
 =?us-ascii?Q?JHjodf+DWHKp9cXOBCyS3WAy4CEl/Hyxyl/X0gqC6NtlySttYDOSQRavNpz5?=
 =?us-ascii?Q?gfg2ZwuP0wKG+S+Rx/hDxz/M9nTPzaDxsJPmqyTv1YjzM0XCLxhrP4RVSP5k?=
 =?us-ascii?Q?UiPgEFVb+mbB8cpmDa6yBu00VwYUruzcMq1q2fCbVYvIB8OMOPFqKNfDa+Qm?=
 =?us-ascii?Q?Iytrf/CoVHdBIbBpZjBJMKYUiLO6g56SJFYYr+iLHVQMArBwJoYe238o+GXY?=
 =?us-ascii?Q?1p2Pue+6MzTd+hpSZmgP6tD8BQy6Svg8wBqBWMz8AQOkpdaLovE/9A9iecyo?=
 =?us-ascii?Q?4Gak8NXAjwvkezjz3pxX2CX5jerUpkJ7KXmWsHbIrgcCS3O0i+NJxlCKVBUV?=
 =?us-ascii?Q?jAvRT/Hjqi2KApvYOQ7O0Mpkf4mobBzJOQOrj4tLUUrJY5Nf+OLqk6bYfi6P?=
 =?us-ascii?Q?Kc5A1ywzt2TQoWydTyVK0n+2q5Q6apU5K6ARB+rKHm1G12w28XplAhA1q58K?=
 =?us-ascii?Q?yGndcvrkuLbmn829CUAEqOlWEqSUQ2RyPlSllrQxg951V0yYuwdOjlep3FSH?=
 =?us-ascii?Q?gaiYkoyb8lBWSbnjGJIvtOrbMruZziF7Re+x0indm9V3TyqXHsF1rj8uODsO?=
 =?us-ascii?Q?ScQRWiZ2KKqU0IDSZZxQGnCct5+wu3lw2MQlWgGIdZj/93Q2FTBDIJrR8Kh/?=
 =?us-ascii?Q?EczyacLTlgYJSLXbqChrwysCE4DV/Ob/wGVYmFCeg4Be6WCRFjLxb4mIw02I?=
 =?us-ascii?Q?aHglH+ga3Sqb9K8FxkeU9t1mbpaK879sQ8uUIgwhWvKXBt2pQASh8eXmDIVH?=
 =?us-ascii?Q?dqy0JR4RG3UWF68jur8Z3FpjpW+TZbaDJ5NnkpFK+Z6qgcMOCATMPPxdayRx?=
 =?us-ascii?Q?6TF23YVtAys/VasQEh25kMnobFP3io5aZteJpSq6+Zquk/DopbBVwBC3xQ1x?=
 =?us-ascii?Q?x2TrAg9jbc4AecIki4mJD5bvHmt69aVHMnQt94Q1huTsO/Oxf/vldn4g2dIC?=
 =?us-ascii?Q?m2ywjUnbPApUG9Pl52PKmUdf6D4KPMje70sYqo1/xYKcc47j8iCPkRYkaE21?=
 =?us-ascii?Q?RI0duxe8hAm5zS/e9ZvK3ypgaIaKDhhC/uwz6lYpMWKtzv0/Ioas5e/+mGUZ?=
 =?us-ascii?Q?P/vUmnxoNUBKZKpzYtyf8BF2Js5I3zzsC4fkwCCcOccbdi12ham/zxpw4NV1?=
 =?us-ascii?Q?HkVeFhb+FLGkkvwwh53A1AGuEj5ur3bPK7rCwX/Uuh19v6J8Frl7rc/8CW3V?=
 =?us-ascii?Q?Gl3Nb4x1RjoYPyBVYI5hS3adVx+4bA1/rdzLbFbVRbQQP2OczObQaOl6CPMV?=
 =?us-ascii?Q?IaMX+Unkjj8XpzLHu+tyQa69b4u6EUQJySaHwLd2a6nz35WZzhSW+BkWdC0/?=
 =?us-ascii?Q?G5OOTPnG3OHJ4L6ort8uF1dhLaL9mDn9W9WrOT8q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58b4326-9028-4b34-5ca5-08dd6d3fe232
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:58:50.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81GU/Rriw1iTGtzqf5V1IZ8Pntff9JIqDKIq5smODd0nYclNtAieAUa+wcv20dhLm0c3LPznES7p28WFJdCwlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11133

On Thu, Mar 27, 2025 at 03:41:09PM +0100, Alexander Stein wrote:
> This add an overlay for using the RGB-to-HDMI bridge.
> Note: As DDC is directly connected to general I2C bus, there might be I2C
> address conflicts. Hence not all displays might work.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm/boot/dts/nxp/ls/Makefile             |  3 ++
>  .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
> index 14759331dba24..225a7665b8ad1 100644
> --- a/arch/arm/boot/dts/nxp/ls/Makefile
> +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> @@ -6,3 +6,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>  	ls1021a-tqmls1021a-mbls1021a.dtb \
>  	ls1021a-tsn.dtb \
>  	ls1021a-twr.dtb
> +
> +ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
> +dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
> new file mode 100644
> index 0000000000000..e713a2ecbfc25
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&dcu {
> +	status = "okay";
> +
> +	port {
> +		dcu_out: endpoint {
> +			remote-endpoint = <&sii9022a_in>;
> +		};
> +	};
> +};
> +
> +&hdmi_out {
> +	status = "okay";
> +};
> +
> +&sii9022a {
> +	status = "okay";
> +};
> +
> +&sii9022a_in {
> +	remote-endpoint = <&dcu_out>;
> +};
> --
> 2.43.0
>
