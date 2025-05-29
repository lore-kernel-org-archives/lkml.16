Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD971E0E14;
	Thu, 29 May 2025 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748533768; cv=fail; b=St1iM9fucoFoXLEMIPdiMg5qssS593Xd87NEkkk4R4JxqL9Duwh5yl3vVKNVBkcv7BNa/htlc4yMLA8rzsKS1ObBuj8vbqWI04OtV2cKmL3G4WwJlqTnyNo3iIZl04/Ba2NddtvKcDjI5drpscplpwUvocGL6Rszbrzl9A9eXuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748533768; c=relaxed/simple;
	bh=4NBP6enlEyLfEcmqw45aS7PRnkawzVnRmSIKgmZKkk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sou4DagKmrMOKDy0au+IjI6Wh3E5alj+Fm0FGfFDxpKInHfjkma1gqEikVbjMSL3vnInY2j/7WOOKFCVM9G6m4zC52U7gKlAuvhGIkBMe8xBW/96yKMzyaMXmxRR151Zn+1iiHvZdVOBtwW0U3XaRpTk6hypT4B2jvjrMGn/bOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gc0+KiCX; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gc0+KiCX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX/BOvKuBIo0wsR3IlTnpCGYvjaFM95jm9K3eXm+U1QoI93kJh7Mxf9idvZo+3mAHfUYhVAIAPig/FIcQV6oYow09BPxRgqCfoClhY3c0cvAzmlzcXoq1J67eKhVqpuUJrclmlJi2UmPlXi7+VbpoCHz1bUJbyjF/FAiMjnQ6RaAxyxcnNDnQeKOOkygRW+Q+DIbwdKFbWazkMgGZj3IZiKxJzDWRuNJzvEfV3NqrHfRznT0C/PhFiC1653t/ykF/OrfAJqzIDq2TPJcr2MBJEzJBxCsYhphN3e0DGprEN6/I2egBDzGHUNQXtcmgwg72CFaL/AjwyNIQKHNjCATXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMbjaPsxYuVP31GUR/ks0DXJQn5uzSusZw+6ciAJV38=;
 b=wBl+dcF4wRteUiwY3psPducTEQIa13VdiKnuraMAY3ce4gNKZrGvpDJMJf+OaWzcDG3X2ZoEW5yu4SnsDLoIF+ckr1DssePqJ9jdMzDpuv0iP3L851Heq35SGMraFySI/hQQpejj/aVVePooqLV1NKuY6uGHunOodCQR8uuAfbm6floQNR4+FzZztHuNPlk/HakhBVG3El0bZL6kYPvPGN+YcwxB2sxqtzdt5MQm04qUxfzceNgU1yJJldfNgNaUtwh4RuhLyPPo3+LjSF2ePlEcHvJ/Q173GfUA0O1vzQ7pJ44pLFAz/DiKaS/1fH14I7xjc46aDZY+JJK1zj/2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMbjaPsxYuVP31GUR/ks0DXJQn5uzSusZw+6ciAJV38=;
 b=Gc0+KiCXUq0UP357I5J7YE649t9AYGdfkfDkUhMpvTydTi+ZgWMc9V9NkojGkVcr0a2aXg2EALISjYcjKSkeDJMdI1jieH55VacmDbk1YhXC3D4TxX3CQZHoxXpVaAb6CVoUC2jaE2DC+9jCE4/wS9hZ2/5WQMp4T1O2aCgt6574G06pSKcnzApjOosNut0ZBxIXh9mjeXfg/uB0m579oLamb8UQyM3A5bqrLWZIvNNQBjvFJcRuG7FcZ04BeefQy7I9/p/jj7wBoCcll8eZm84MLSbdaccX9hDsgf17fFC1UfD3hXudtV23GRdXVYehNkMU7Her/an5i1rGqd5ijg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8414.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 29 May
 2025 15:49:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 15:49:23 +0000
Date: Thu, 29 May 2025 11:49:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/6] ARM: dts: imx28: add pwm7 muxing options
Message-ID: <aDiB+ZAPwZbkhWWE@lizhi-Precision-Tower-5810>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
 <20250529143544.2381031-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529143544.2381031-3-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e82ea86-f652-4fff-8c03-08dd9ec861bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rQ8vHicIK/hWGtnJpOT7ITbs/Pq8RdreKdvMs9pvX3OMCG6dr0l1xA1d0wba?=
 =?us-ascii?Q?d4wCzZ7wTIxrlzHDJH0EVVGfOidd7OeKUFDW7DsyhU56jJb5vuyzzpr2hHd4?=
 =?us-ascii?Q?US9xG5Cvr6LbCkbjvoaHddMtOJUJPq0ioNXYxsT54cxGf2u+vtbXhQFKVg/8?=
 =?us-ascii?Q?sigxR74QIOjq/nG0tvzjd5CnpwYB+aTUOZINn44nTlzMUm4zReHiMEIiu+H4?=
 =?us-ascii?Q?cVYUYhh3dhA2qgdb3Lo2qSN7VAxBcYkAoOSwnjL/D5DIPRlMFyQ09IhqNuyZ?=
 =?us-ascii?Q?J9n11P0Tf5TfoHAKgt2JJQEiz6BiZaO6HprbHbQGDgOXCK0l1g4riiQtZUeB?=
 =?us-ascii?Q?ji56E4dX/DJxsDleXASKgLZ1NBYd8YGvBwKrN1PHCVu5XHGn05DTaY0cD5Yj?=
 =?us-ascii?Q?DNGU/9LlbCwg1MVrhMlR+mhsG5UAAi1nGD0RG1M3afScrg8ofRYMBshNo743?=
 =?us-ascii?Q?z+H92hLTHrRSMb58Risn5PlJP2F0TwdRE99C3jgZoBUKrCt6gbC/tiTqdO/b?=
 =?us-ascii?Q?aMqNVAaJFFNbFX7GnZ8PwtMRCEeTt8qqKgKIu4yv1nWQedMokIELukFTF8JB?=
 =?us-ascii?Q?waMP7b04gwqIEnbHru3yK6wyKqWgnQnwIdg8iQeW3+8483wl6R4XhMJGP2Oz?=
 =?us-ascii?Q?Au0jNUEEFabYSbA+trCRBBsoDGcE8DJO1X/R0F0C9llwfXgT+I9fcRrOVD0g?=
 =?us-ascii?Q?Sonbmd0u4v1nM2W2B/qGMXk9VSXGmsNs1q8dl3AueAAIpt1le2Ej2CBIg/t3?=
 =?us-ascii?Q?6IY3byF4+Cu+BaNPW8JUq/kHacvHlkj8w8r4nTl/fk1G7i12fOX8UYE8s/Qn?=
 =?us-ascii?Q?/cE/9M38vFgzkUjp5cAvnkjFbgC8xP6RLtBmcJdHvnuLPiVORllJ6STJ/nKG?=
 =?us-ascii?Q?pMPebGuGoNzeZIPREFPjEuHiBrX2cQvgx84yYdyJ0pE7LymNVwrCgh6XHeYY?=
 =?us-ascii?Q?G9lShWF+cOEFjkFYNJN3u62kPctsJWwyeiirQ+oKKb5si8fH0D5GJ/U3ma/X?=
 =?us-ascii?Q?Ikqf92iVmgz6SqOjc7IMuUvBWfNrvKPwP4t/dBHp0ZYTwe+PSkdm5rAUbERY?=
 =?us-ascii?Q?nsLYUbkqycLASjKRoHM8UHLmsjxKfo9WPJOfvzla4A2g1eaSp2wcalCeHNfX?=
 =?us-ascii?Q?VClEoVYd2QmR6AOV9i25VC+biodL5Lygg4baECuxg6MIuucaL7kIRTgAP3hE?=
 =?us-ascii?Q?fhF2W74ib9PJePc3Q/WL0zbF1NO6gJIMiFty71fYDw/ls/dOvKTB/PbFFk05?=
 =?us-ascii?Q?veZuHM8JMYJ+ASSZ9b88StcdABCxzf1iRi9yx6yCWQVTAxeHyPIonixNpY+H?=
 =?us-ascii?Q?c9Kxd2idfp9nmeoPM8Lbg2z85HhEVzxMcMYekU4BjNde03oVS61ZNWgyqMGw?=
 =?us-ascii?Q?AYKxq0KZwK7bybfaFLusUlR9TwBbe/ukjXqXTyyo/gflhDncabRKfSnq0Fhb?=
 =?us-ascii?Q?y06eFLUZhLAXFMOOq6ViA6/5uOo9MsgQ2iAaarcMyu5HN6Q4snqaVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EnRQHmrrdivaq7+4cbhHpiXP0rSysf95t+p36vpuP+0YhO0/9NOGc+BiNDuG?=
 =?us-ascii?Q?9szxyix+HCBOQeNMuVXsOgD3ldg8WVnRH0t5YA5DDQShdn8wqtYrvhXtwNbv?=
 =?us-ascii?Q?/czsuBGu+8RDLwk0tqXndFzU/VMNkIiFtJvjTAbPFtZoHpMh2NzQrB2ziqCb?=
 =?us-ascii?Q?apCQrLnjNBRnBb8yGVgu2k2QizbbaHBYwvoyzW9nyd33KSLwtIzhHsSGpzhs?=
 =?us-ascii?Q?XrP7xw3+bjOmQkXl7soF3W3r6C23262lnnNDUFnpOFog6T2RD0Mxd4C8XFGL?=
 =?us-ascii?Q?ZEghkStoWTKGAr1W4jKvx3UfuWKj77mzn8fZgydjD5NB4RTEwDIrfy3hART+?=
 =?us-ascii?Q?FoX1K+4Oc0w2j7bj62IZel+gXOLW86LnHpGqf1SLwIbqAjVyQvQnuIlVyo1g?=
 =?us-ascii?Q?zCfoRRqpGQ1ymSCz/GYE4ru07R8xFELj4bjjic6OxLP+pCABLXDf+AOQmr/T?=
 =?us-ascii?Q?Xun7Fnx9iSekWndbtezwjfZmGdGq0z9XoaEwgWjjci4ROSPrTwadaFoA6xTQ?=
 =?us-ascii?Q?+VCcq7l95OkXShwkvlbs9DqVyIzxRf4JcwbPdvBnD/0vnuTsoFdCt0eqrrDN?=
 =?us-ascii?Q?xOpoIrfuo8k5xrdDl00zh82PYWiKRFcUZ0P1upykdJ+1eyRHtqf0ZNHyUQQr?=
 =?us-ascii?Q?T4pI52I/gFmzP7L7UQWPKzduozC5To0J/CGmML4yKjOSS2pVnKwwSxoG/0ke?=
 =?us-ascii?Q?Eifu0VqKKHSa7aurEa4aEPh4Ubaq66zAZSsjeZ9pc74m2jNq9ShUnPlA+ddc?=
 =?us-ascii?Q?ZgcG5HwsieTzxidRoA7X+GevPizE5SvkD5uzplJla51ifetU+trskw6RqW2h?=
 =?us-ascii?Q?mXV+cIsWn9pD+qcTr7tuewky3rimkhZxOCwlBfid0Iey5dICXvCgoflCYtKz?=
 =?us-ascii?Q?vcNTxIdfJC68JeyHuVdpMUar2r41uTy9PbY2Ie8OHLULj6FgiQi4PE7qwBNO?=
 =?us-ascii?Q?o2z133m+XDcQkMKuxQ1DkecL03YCc6QDMmOeiYPHBVXck32bmMgPnL7VGJ1s?=
 =?us-ascii?Q?T3IMT7KKk6CLK1b0p+/a351WO1iRJyy7vogERMr6NQlEH94nnM+JttdwJGZ/?=
 =?us-ascii?Q?Mk7QcYJ/aZt/6Kd1ev7Y5Dlix/E3eXeekypI+wf3v2ssccK+Vd8tdcNwpseA?=
 =?us-ascii?Q?6zqYZJMA2hFUToDiF7hk4mFmSnS9t+piLcoacdH7qISOUQxjdtoqcjudO3PB?=
 =?us-ascii?Q?oEedbEb84soFWOrL95QylT5epWIbBf9sWqTUb1suJcQ/gqteAwL8OibhfRfB?=
 =?us-ascii?Q?br5gwxswZE55n7I0C4b3/jYsRaMn4+qrPDidzT2oX4UJQPfX72G8Q41Att7B?=
 =?us-ascii?Q?TrLLy5z0ERT8ff0fnzOoi5BXcryw8htLlK28ucqllQirweRk7uI7X1u+spkT?=
 =?us-ascii?Q?6fKxTg6Nrm0umEnGyqJoD1WIUbYoF5iBnH6hRJu0RCLYdlVIICbl44mCI20T?=
 =?us-ascii?Q?64DKbR7pwJ8wQhegXALnJqtMzl+QevyO6wa9M2vALitrfHEvnFDylQSdqlcH?=
 =?us-ascii?Q?5jE7HF2WSJ5nQhKc3VwSScZv8gQDw/UjRRlfMGoHIKmolzSaEdz6HKYTsg6a?=
 =?us-ascii?Q?L3XXx2busUlSHfu72Hk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e82ea86-f652-4fff-8c03-08dd9ec861bc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 15:49:22.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+NNfza/Uct9CJRUHpOnyZVU+MRs0wFJcISE5Ql5gnpsiLri3Pu7VGTnaeMh8tnCcHQT4+165Ude+Rv/lvrW4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8414

On Thu, May 29, 2025 at 04:35:09PM +0200, Dario Binacchi wrote:
> Add alternative pinmuxing for pwm7.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> (no changes since v3)
>
> Changes in v3:
> - Add commit body
>
>  arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> index bbea8b77386f..ece46d0e7c7f 100644
> --- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> @@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
>  					fsl,pull-up = <MXS_PULL_DISABLE>;
>  				};
>
> +				pwm7_pins_a: pwm7@0 {
> +					reg = <0>;
> +					fsl,pinmux-ids = <
> +						MX28_PAD_SAIF1_SDATA0__PWM_7
> +					>;
> +					fsl,drive-strength = <MXS_DRIVE_4mA>;
> +					fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +					fsl,pull-up = <MXS_PULL_DISABLE>;
> +				};
> +
>  				lcdif_24bit_pins_a: lcdif-24bit@0 {
>  					reg = <0>;
>  					fsl,pinmux-ids = <
> --
> 2.43.0
>
