Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91D22FE13;
	Tue,  8 Apr 2025 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128340; cv=fail; b=kdh1HDuD3eFYtBPbVflYKEMxwld4nYp0bjXGdYIoJI0R+Wxy4TU01ZVpB2QU2nGMaC3UMIDbEklZnJspv5Y30B42XSj8dgbjKKPwXt6og0/BaMP4n4CDJMjaR8JMxDWsawV1/r5MvfNyek2AYmrT7jyLTLI0+BXyDT5Ar9R1WBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128340; c=relaxed/simple;
	bh=S84BTZKXqmsYzqhTSOf1VP1+vVkv1tvMOYqMlCP2qMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j55pBRJeA0DRBuCzgW5O4p2Hkfsifl3gwTJz16uueUUNfajW1ZFCUW4ByWFQuavQi+QawExrHM5bcRUxA9mUHgYOQeQ0SdPbaBFD1LDnYly4YgXK3sWLf7HaQPkhYd8oYhgvmUSLmuxjTq2RJX/iqqTKGWatu8ChLSIzPZrBr9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OSllZqlo; arc=fail smtp.client-ip=40.107.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OSllZqlo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSBYlGsYryAzpOqkPBz8EpEtYnyTZvS8Xz+lmzZ+xghRTWmV/BOZfAjdyTI5CnxjfmReurjyGl8L5dqA6MXJ+9ieD6vn6ZjsTjx+A2lrD0JDt5GyYZPivBhItJ0poFw7imPdDqJehflg3l5b1QHqiKPUou9lgRs746GVWwoE0tftC1UbGfX+7Lhda6FDr9N/tLNeQ6Eg3WEGKjyfgyeXvQSh/phaH7/dGzhCojHtGw/HceGpvLzD4RO7YFHqRBtqDtZ4UJUVmwdcNzY0lCrqpQnlmUMlob3ltEql7qMiSpM/16St7R2s/Zx+b5NuXWQ6iq13jIpHDSqHc3kIsqfNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjiU1jGWY/rNNiz7dw7xsADmeUAhF9YX6eQ31yBIdI4=;
 b=Yoedv0v+0nPoQJV2M1N9ShENxyEk6lSn+iohQAlTOp4AaidFf6umD3y/g4XhAlKcNPYXSyeElScf3r0bCCZlaOCXcGV4wA9+nVKHBco+o2wHZT3fIvTzje5OAGEfBeuAU+Dwo6qLlaHH2jh7OVJOIewWwwQlraUMNZipjvkRoGKoq9yIkqQm+KI3gGRtKad8s4xOlk0oSX7NfqvE7+VyGdMpk6kt4NgoB7RtPM3J9R274Pdt5acsSxUAGoKS7d/4SnNvu7Os3vkVqM8zzNRL4uwjUHQKY5VSqitNDvleQaVWoO4RoA1XkrmAAXc8lqgKBr2yo8s9bEwD8UOuUT9N5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjiU1jGWY/rNNiz7dw7xsADmeUAhF9YX6eQ31yBIdI4=;
 b=OSllZqlovZ1I+LKtaXeRt2YRgYIFKszlj/fiUpARVAHPEEvkZtO1ipx4lU/tGycqSv5lsFJ/bltDH6wPttG0PRwGJLqHFL3HsOpZXtbNqRknASNCzJBTKkXJVb7UhTei89ItLegeHO/kAVnGeMv19nBE4H+D8s5zE7YRn/bf14qA5ccsJWMHiGz5XBJ8dWoJWiOf3hsTUJGaMO+lX7LOVCU4Jlmf2fzRKytfDXcPVXsep5GaZQRLLiH8riV1oAxOHnuQeK9tRBOp8GxDDIGQkQdqpVoRrZbQb5WgeZ6sZ7VGikSobNJxxENje4puMaaMCFRR9+kzFI3K+6Rlw1naug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:05:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 16:05:35 +0000
Date: Tue, 8 Apr 2025 12:05:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay
 to include display name
Message-ID: <Z/VJRsjZF6Tsbnx0@lizhi-Precision-Tower-5810>
References: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH8PR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:510:2da::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: a9496320-ee26-4581-0c7f-08dd76b7321a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1u3Z/ApxrjhXK+pxME62cv2AwASjSJiJvsO2CjarRrpv5NcfkVq6gLqiH+JW?=
 =?us-ascii?Q?4VZ5O2780sKIcISWUMUQRZ9OAXgXFFFFPYpLY4KFyZMUxQS8XkyMABMD1g5n?=
 =?us-ascii?Q?fNdq23kSoYurbinNxfeU9st0v771BWqBRNwUcB27igA2RhQjeR32zV88aahk?=
 =?us-ascii?Q?13Kx757tm7CetkJr8g+vn2Q0ovmaxeRaylsDiRj8uygghpfqzhcbM6s/yRmY?=
 =?us-ascii?Q?iyF000e5PzTueUzmk1dhIRnx8olV5Qn6nUHQxT5csErMKAwf1BDIpc6yYe/m?=
 =?us-ascii?Q?YX3DLtDi0r6AthZNJN8ZaqW/hjic8E8OIJfF7qkj+LQpFfFdGdqWGbfkAV6E?=
 =?us-ascii?Q?3oj+wQk6pK5CnqRDSTHgqQdSmyz25LSlOtWK8S16hcvNnaLFvCSE0o7S967u?=
 =?us-ascii?Q?8EGnb6Zx8nnzHOVr3u0+/QrzWoPUTbiVOrSXHgvWqztr9zJWcNkKtFvYMRrO?=
 =?us-ascii?Q?Gg/DY5pkyYAGxI6FYDIU8JOW4uwHCjvkPRbmUl/a+lst+eIWGnLYiZM4bGUN?=
 =?us-ascii?Q?plgZXHXgyCU2ssPaNAAtHaHYQ9eo+aRuGjPUx7wrrwL0YG4Wsx/+sQpFWCfZ?=
 =?us-ascii?Q?HCFDE3qS8BoBiwUt7um6BhCHd9JYFapKcGxhMlSsGHtsCTxrPwlSu8CxxU+/?=
 =?us-ascii?Q?Q7E8eWt5TA2AueNvKoDpRxQvcJjfk/kMH3bIcPHs36RQ8azaiTl4XoZ6xj57?=
 =?us-ascii?Q?I6wnFeJ/N2buMEYdpNT1lpmbfTRA/diA7Y9oETCWYY7zSVEPsrBcscbYQsFU?=
 =?us-ascii?Q?YoSctMcqWixfTB0vAkqhCjgzrFTHNjSIL91pL5gAS4knSuKsMrDFZKLshy9i?=
 =?us-ascii?Q?qLi7c/A1jn8Zkd9Np9wDUKiw8Iue03ezAlQardhSEQ+4uxgiAtt0zDaoDMiA?=
 =?us-ascii?Q?hK0e/hzOpIOC6SjmbvYoI+yrdG5M/43MVYHqggBzBFqQDWpZPuzmgfscxe39?=
 =?us-ascii?Q?RSUdICUBSfAr0zNmIHqYW6l8dzKYvYhQBU7wMZHo1MIS6nIxyiFYw8FxITcd?=
 =?us-ascii?Q?k3OnOpRl3HdOCX3b3fas6oJPEdk3dUfBfSWJEa5gvPt9fGlqYujZQi4mLEce?=
 =?us-ascii?Q?AP3oerdggviE2OjSAHaK8fUpPlL77AcGYHQWiclLvySeicIiM/5EksM7aoYg?=
 =?us-ascii?Q?9G5yFFaSXg7DaZAMi40Cf2HyAZPM10W13Bf45wwQ+we4pncLD0Efh4guBIqp?=
 =?us-ascii?Q?2pruE8watp0zUTY+kglNCp7MEdQJIEub8y7YWHYp4rQtpYmQ3TxdrWB+G9uK?=
 =?us-ascii?Q?Tev0GozgL8n0xvmiXFmciin9GGz5VTIIUdDaHCXoGQEQS5PIhUJNO97dgpfn?=
 =?us-ascii?Q?zFxtfnD79PJspxTvzBCV5a2kOZ9Y0ulxgAYHT0xmvzt27RZxpYPnb+HRJsnQ?=
 =?us-ascii?Q?Xttdd3whbAdDBGjK4EONUgW79hdRV4mDQd2TmcdtoNI6jFrxlitWUoKJeie8?=
 =?us-ascii?Q?feVgjQ6jTg+qP6chyito8/jy12u/4kWP83JiHE0V5hFbrjDcpD1BRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zL9ySrOA19Ge7OQz1qBcb8EfZ4gfw5Q3QmTnMrSh7XjhQkhvNyKdpibkSNBu?=
 =?us-ascii?Q?gtXXYR2lSfx+vC9Vx0S6gMJtOWpRX6TqRr8XuGacph2CkqeF4JAZOh3xWspE?=
 =?us-ascii?Q?hS2LtIu4b/aMDYlzqlZy3bwlegfr38OoCX0l0IqcjVnOTiNqO171jO8R+4Ti?=
 =?us-ascii?Q?EJo1HDbKePFE8AzTX016Nxb4UjEFiHV6OQ+yKoCNyh907Np3vp+HKtTcPtyh?=
 =?us-ascii?Q?ltYCWbjpHvxRPUy+qXeVh75iIXUUzD5df/yZsSRMECtC4N2ZYZFZpa0vsVJI?=
 =?us-ascii?Q?D0ngQxlsxOGKgOz46TqbfYbDSGOVNscnkttuDRXk7I1cgozxEO1F5uMJ02wh?=
 =?us-ascii?Q?qe8U8MXBD+ciVwEDPYjduItxyC+0HSctxwnvYXcYoUxReRK9/D8Tqev9PBm2?=
 =?us-ascii?Q?FrMa77z37xZg2Jeb2PoUtfMyTRXWzZIbfXUjS3BF7FudeCtNhTddRUfac3Ui?=
 =?us-ascii?Q?pM/y/FgLGTuUhSckQvvvwLKd83uqq7di19S/cowBbmb5NuMiJ3uYHk3oqPzI?=
 =?us-ascii?Q?ggK8r9CYEKWEfyNLlCH9PORlF3xWVv683xR9IheZ7ErVAStvPSM/cKIbMY3s?=
 =?us-ascii?Q?JxAk5KpCQWkURbKSsRttvkGjhBmjvWubyHqfC4gnJljdl+u0dJ/y/ZO5ooYo?=
 =?us-ascii?Q?lUzZG534MqLkb4SFDE8MKL/E5eMM8YzB7pL2uLvzJ4KMvAINg+QOEhxC2onB?=
 =?us-ascii?Q?hCtSeSzt7hKSXgjBFwjR5rFbbUVHq9tHVvKDwmSdWmbKlwAC5D0myboED+bp?=
 =?us-ascii?Q?uA0FSdwL17b5ehirj5E7zJaTG1Z6CTSuoVfhqlfou7aGRzVGA3UqF/jCJftx?=
 =?us-ascii?Q?B5zd/njeTGXvfV/wF8qVPTIEuAa7CQSq57IW8tr2Zrxiyn36vBwu5Tm5GfX1?=
 =?us-ascii?Q?JoFx4TRrJ3NTHiaJCxfTYvYh7N3xO607dVXdJ/sYwapMUGnD/FAl9jV7lxM/?=
 =?us-ascii?Q?w9s/MDkvO17B/R9SWiT4QyJfsJ1Csjof+xIwefahU4mFg8sM8WhBqTIZpx2u?=
 =?us-ascii?Q?c4gFM+5oz0+MM/Cjo4j1nvjTTvj4cNIadV1eT3A/Qf02Qxk/+GGwaBVJlP1e?=
 =?us-ascii?Q?KczjrnulE4E+40swwlib4/+El+3065NxV4Wce3VV/DEF7fUkcp1NPV4JHYi4?=
 =?us-ascii?Q?3Jngu4ZZxLXby6jCJwY7BDk1wQnd4lW4M16D6V922cxkjKAwtKW6VVn977cD?=
 =?us-ascii?Q?2VC/jYpNHmJ4wzACwElq2Ut6P98p91mPvIW0HobQCFx2ahVMLvw6Sufrzmne?=
 =?us-ascii?Q?Tz8XuDvyZEpkZCFimEzObxbiN14iJxGg8gJclKJfRKu9ffTwEMu1s6A58pOk?=
 =?us-ascii?Q?XPraqlMG8tiW+XLSNKWQACAw9VXSSpUz2Wib0jmKhwkIxr+1UFnFS59+TEHD?=
 =?us-ascii?Q?Rdl5DENvSi4bdjSSJOab2hCWA7NonNRNvOhSnnzjmyPW5sWogZXw/tHBCWyr?=
 =?us-ascii?Q?3W7lxAg68JcsqTjcw7FA1ZA4tPoJru4ZMaB6pYAnXjzGIzD91YllU1JOTaSG?=
 =?us-ascii?Q?9IElLv+0v5KK2gNYiirH4u3tqfVSS4Xp5r2U4pvUnwceDP+F0j+joLI02xm5?=
 =?us-ascii?Q?aHyddYRR6yYKTS+Z/SWpRdZ5gyv722clzuv05Y+c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9496320-ee26-4581-0c7f-08dd76b7321a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:05:34.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GX89F5suO8+ZC5/d4VekeKp715qXjezaEE2c7voGs1tqrMn7lVl1LhoiPU59tTGh1U94dFNFGE54oDOpQQf9ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984

On Tue, Apr 08, 2025 at 04:08:55PM +0200, Alexander Stein wrote:
> This platform supports several displays, so rename the overlay to reflect
> the actual display being used. This also aligns the name to the other
> TQMa8M* modules.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/Makefile                        | 4 ++--
>  ...s.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 93cbd8d5081b3..38ce3d1c41c10 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -263,7 +263,7 @@ imx8mp-tqma8mpql-mba8mpxl-imx327-isp1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8
>  imx8mp-tqma8mpql-mba8mpxl-imx327-isp2-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isp2.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-imx327-isi1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-imx415-isp1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isp1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx415.dtbo
> -imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
> +imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb  imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-ov9281.dtbo
> @@ -277,7 +277,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isp1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isp2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isi1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx415-isp1.dtb
> -dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
> similarity index 100%
> rename from arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso
> rename to arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
> --
> 2.43.0
>
