Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E1A1EE7BC;
	Thu, 30 Jan 2025 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254782; cv=fail; b=gPB7XyrQH1Ji8Eei8f08ClRE+HvQy4g++D+Z1S0/q3F5AsGWg8QTmXiJjFouA43iHxkEIuX/Oa1Uoy+/Im7bJmFpyQGI9AUTnIfE6VJRdNue6NR1nCavaQ6I619GL/9NqBTPv92U0ESa/Spim5fob2A4cmRmvg8vLdaEPiy8q+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254782; c=relaxed/simple;
	bh=6tcivYvEul+h/dULN6KUyMVaQjDwWtezKEluG/dF6qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mq78mZh8NY5pqbv1y8QQqDCGLgBDj81V3/UlJ3LQ1HrjJTOxHmSXlGAWrTLuBIbXinwXrKrryaNy2zb+IoybB2JAfDwdIw8eMed4qEio1mxu2aL34XjiJxfyGaDROZgNta60sycI2qZj1WtMDCTbhol0LP305J9rO/VtZZsB0B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fkz8Nf0c; arc=fail smtp.client-ip=40.107.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fkz8Nf0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is5pfJ/6dbzeIv94m6oZWXCP7nYrdI6L8EW6HO6Kkvq1JRSma0zLOqsFlBMHfbbzfQtuGhZVTTrXMDz6fZpK+YzHIV5jTa+/R9VQ4qarLF5CqV2IPFa3DGz4Vko5dQIaJjNruUlrXH5cL8PThL9xGJ3hzCvkXOpVfE/C4OfZ8b1ox2Xcm8skupenSd2KELCogEREWsPiEg5wjqKkWKMaUvswDqkoA29OCvK6E5vZI1MqwP3dKHouHql3XT6dZl52MtN7Xk8aEDyZX3Aqvu48YU2JHdjHTGSXRZXt2Sdoj3mDus1R2tFybXIhK914gdpVJedi21zoM1CgXbQoPqylRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIFp5tR3BsKBuxP/57GqtZw4DxXfkj4tIWedjnangtk=;
 b=hQud4IeocGo+vXnjv9YWbAXFtn4nJqQXVthHKjCJRt3hjcQXo3ImR6q/JHD5W1XvjAsgyW2TbJXdQLQ4kXwjYcc7BCVplqfMTvyvW6/e4GME6jjtfn6WDSeXjw/oM6+rYkPbgjbHUbVb20C68kBeYqA/YSstnG/k+bEiRf5OY5OdHXP02hKV2Fe98LOZN1LSsyTzP6wunyWdozZRWDyEjttcwIJpN4A47svtmOjmTSZSfjyz30kVVwUzCrUzJdRaGhm1fEN2k+4gPmSgbsoP3oGTKV8Ohm+5b3W2Jh+nftbImrNufGnP/Tt8XdMYs7sa/PLmyoY9/h16KP3noikltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIFp5tR3BsKBuxP/57GqtZw4DxXfkj4tIWedjnangtk=;
 b=fkz8Nf0c7nrG3ZRJYfHS57uV7DfEbTFcvmHGWigUmyjk5/8BEUQxi9l9X3b3+iK5O2Vu1ewK2VoSm0g3dCDgRFFuLW0RBKqAoqdt+jN1o7Opa/l8ioJqLkjguCFoLkR8q/kgK41TXZsa9JWtgCqYifJ7swFfPN8sJZnU1DoRt9+9U6qhL1W0ZDaVl9BNY2JMY87zccQBrBaReyYdi7VV/vCWcP7ZVBnLhIN09clTkqtl+Z6/5FPm1t/V3yjfJslY4jj+tZk1BL7SGUDWUXzDwXJFHUyxtSyFrb8MN7lotIA6KEfsuhCk60llr6u9W+Xh9ms+z+HZ3jmo3mI7Su6n7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 16:32:57 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:32:57 +0000
Date: Thu, 30 Jan 2025 11:32:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano
 access controller definitions
Message-ID: <Z5upsp1NbB7/j503@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e93c29f-b473-4ae7-e483-08dd414bc11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CSwFHWYMt03MkAXQ2aVxWjhU4wIBy+B6TjEYSkxE477pYonBaA1mx7hvmsBB?=
 =?us-ascii?Q?0mtRXfuewNFE8TAYh5eSThNu1KkzuNwCJ0hwkmVgpVDzw1GDv1X29jEylsYw?=
 =?us-ascii?Q?vEWH9cw9L+QyRQg0VhVFZ0KMfioXc09rLCgrgMlevJkEKd7Npcub7zJTT/AJ?=
 =?us-ascii?Q?i8x7+AdpGULh4F/q/bw5LJBmRli3V/0r2IamMuGirov5+YS+HeRBQch8qfiG?=
 =?us-ascii?Q?iV0TYgbpcwgzlUkJ+LcqQfk50gM/PTUjV/SqEeTjqjc1jsEEQgFDl6akIJ3A?=
 =?us-ascii?Q?VxWEZs+xm89tjVx9CjZAa7SU3sF5jnWJg+j+wd8D+O6qnqzYvBiGkgp1UAyI?=
 =?us-ascii?Q?aPLera4d80QynacZS5vX+72xNCUqlvrBcJ0CnMyzWbagUqUkYSTE1TNMKDAf?=
 =?us-ascii?Q?LVlw5jcdTQnPiH4Y/PxHZssYpiUJoMLLlyMjOE0NknNE4tkQrKaOOMvWAcpX?=
 =?us-ascii?Q?PXUrPgZmyN3xrNYNbFeBl50itOcFBr/cLzW66izu1QNjQn+MuMeVFJWu8jhj?=
 =?us-ascii?Q?Ph1BEi/eHAfoFrP0ZZ6obrVtZIeDFbdRyVE8U2mZg1W61YGTC6TWAFPKgNrd?=
 =?us-ascii?Q?dorZGhK/IZwOsJHtj9GRrBgzj8n5DCE6FuJrDYveK1PFLKYOGvWmDvBVVm5x?=
 =?us-ascii?Q?HqvJJXFI5j/q5foXxm0eGfCc9YUBzr6DFnQKq/oh+vpEafahv/nr6v3l7ezc?=
 =?us-ascii?Q?pAflP8Gvp30iTEBx9j1TYP8fj9ohlCNN4IYZPMGnNBEjkYRIKHVfHQh2GFmZ?=
 =?us-ascii?Q?XenzkqEe6GYhrv406BzpLv5HeTG3fsv72UCDv6E4eqM4eRiFENovfKvTe/OV?=
 =?us-ascii?Q?8RTO4r28VRgCuo+0NYZrqdnA4u53oXx4b4sH5Eo89Gn8mHQyNthqpEKzWmIU?=
 =?us-ascii?Q?Ws/5LAVX9RX18vaag+Cf0Caa2SXbYpMcMo6s+iqjjilO9etPglCwueOkuB1H?=
 =?us-ascii?Q?CpyLEn2qd9rMurg9KvOHrY9ciYzUf0WlVkLIlFBChpX8zoXU9Sg5JJ1MEpVr?=
 =?us-ascii?Q?OgG+po+EbKVlM36inATWg+aPNJgYhbWRVNpA1ros6E8NLc4j5n8ZFUBZjD/X?=
 =?us-ascii?Q?zTnRRU4Omdiim9edmlm+GBOP78O+l6BAIkFnp3vKfOIz0MvBTbMMsXX+cKiO?=
 =?us-ascii?Q?CHJoEJ4+RRuL1rJwPg3mnpN2PInbjyAv/lyahoQDOM4FZdRF1LTB7t/QD13Y?=
 =?us-ascii?Q?iEpi9InobizxhyEWp0IBR1nrwfUVwP2EAlUV7QfIBlKsegTbVd8DZUsdhBUd?=
 =?us-ascii?Q?vnUGS6yLb0v7r1I2GyCRXL86/0aSRr9ZazcpPGLuGIkilgH7ryJWS0IPFwqT?=
 =?us-ascii?Q?taGWRtXCl2srYtNDY66S7qjBCFQgR9Cn8Ba0V4A0pU+OyEkNT6buGD7ud3y4?=
 =?us-ascii?Q?r6fw8bYsI7suo7uE0KMBqawSI2/w+omNi6flETm7SIHgUsRbAcJegqISFN7b?=
 =?us-ascii?Q?EcBT9+j9mB+ic6Ghknwk8F2qdpKEwHSH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w3fiAAsDx6MyKOXXhx/+kgmQtOHuD4/XPsRrbrQfIN8gaaBGDiMxrPIaj3Pc?=
 =?us-ascii?Q?pb1a0ZQ2ZoJoLjFp+a14Brjk8EnfLqHjiv1R0dgZdetBE7MNN7McVF1WtbTK?=
 =?us-ascii?Q?awoNTxDpQ6Si/++rI5ursJQKzDRNHv15ahN9a3+5Y1Oxa8e4cRA0Spgv933E?=
 =?us-ascii?Q?SLJhrEQON6t30obEVOUxmSSjewrRrvAchD5AkixZXxAWfktlDKb1KS3sEn79?=
 =?us-ascii?Q?/9HBk0Dtsf03SF8TiwS4Y4O4hY7QAEkAcfEW3yqJ77Mpn/QJmAJuZ9d7dBrK?=
 =?us-ascii?Q?twNcY6Ywkri6H6IpVX5aaKCcD9GiNG5Fgl97TjelJitd+7nmtpjEyjOOV+SY?=
 =?us-ascii?Q?2oijgpbc2BulcUHli+VFvMFXgw466CMXgQbg4kC6BPPRlnxDoBkBunh8n9Ng?=
 =?us-ascii?Q?TAxLKn7OOlPxpgaLQ3LGzZIsx/fErL/gwVTSKVm2VrhUPE+Zh+7MaaWlnClT?=
 =?us-ascii?Q?cJWn7sxsA080MmYpPmfSXdIUAtbYe8tNI7cUB3VzUtSKPq+sq9mXTktooD9l?=
 =?us-ascii?Q?D/du+h/Z2G2TnuWolNVMpccwh+Da53DNiMgcvkk5qKy01iOa43OOLMClaJgW?=
 =?us-ascii?Q?HBChs/utbH9QmCZi79JvDgFv1Y2pKkI3J4a+ke0gIlQNX4lOOxNNqoYLUU5p?=
 =?us-ascii?Q?H+DqmTwiT7AL1wYqYPKOyXZCQKRroqxpHLs0tgfDrVUemCZlWVmA0560+yc6?=
 =?us-ascii?Q?51BCAilXsHpasEZAA1EINNqkQnCuVf9770W3672jL9CcUxIL+MTwryV9KQ88?=
 =?us-ascii?Q?bIFCnv7qfyODCIdcbbDxjS9i9AFxcW65XK3HmgoUs/+wmpVL2Z3zqNkBMmqW?=
 =?us-ascii?Q?sJHsZeXZ8k4w7pHPgEgufWfu5t0jnjOOfr7i09IVnsOc1tfkrcwGhDBalPbw?=
 =?us-ascii?Q?F2+tsXprF4o1TXaZMKV3lJXzgDYG0axCxrJAfTHdb5IyUu9vweJ51liaZ+xR?=
 =?us-ascii?Q?EV+ewkVwRIo/Koo+pS86qwnQqvYR/l1hcgXcM52zzC48bkRlpX7ARzJr7Y/a?=
 =?us-ascii?Q?K7k6fQLZQoiwxsk85dDXF4x5l0kcDiO3M/Swj0jYQIRpCwYGov1YTeezuroF?=
 =?us-ascii?Q?v4iSz0Km4Ydj5zCj203JgtF9iZjdbcPtLEQZWUNPx3zpXccwH9vggMQLdzx0?=
 =?us-ascii?Q?sxPT6HHszRXtVu6dOxtByWKF0JQsdX3lsiaQbYPwxqA8K/N4PiBFOjVOQ6xD?=
 =?us-ascii?Q?LfZEceT3gbpYpUa+zx0gFWUZdNk9E7u8jceiTdnZwosqOKlpXZrqFny/n1OM?=
 =?us-ascii?Q?FXOZiUkyByYuwQI3nsHtK6gKqZKidxknCMEAv713mXdX1nT5/ydqXTaNCkSm?=
 =?us-ascii?Q?XR5hRXr3mx4XJZNpeDHhCt+c5AjplgZSsEx5VflVq/OrcdPlI+bRzmn+22zZ?=
 =?us-ascii?Q?Kv8g5l7vQ7crO5uR+xOGs3OWFedjcVC3zfOc0Ey3OW6kJ8BOZ8PQdGetqix0?=
 =?us-ascii?Q?jTazuddzU7masFAuRRZAM2sRS8xevb8FyZwc8mCkb7WWK2jNciwRQPkHwWeW?=
 =?us-ascii?Q?CplFH0u/spKnOa3f7ave2ap6tRAueOFMqj+azu+NVHoZDPoQ8+pXfJFqzdhs?=
 =?us-ascii?Q?PPRSYQwGNLYO10geb2nxE8ZVwJ5zQWkfBLsqhl0Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e93c29f-b473-4ae7-e483-08dd414bc11b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:32:57.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tpcU5LjdzftEqaZEHugmcn3bDJQ+eXCAht7G9+2T1Oxqx9HTAQ2hns5bFDz5kzsNImtXSHr/wxnE2svkDiEhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456

On Thu, Jan 30, 2025 at 02:00:58PM +0100, Alexander Stein wrote:
> These are the definition for the bindings of imx-ocotp for disabling
> fuses.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
>
> diff --git a/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h b/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
> new file mode 100644
> index 0000000000000..6e554edefd488
> --- /dev/null
> +++ b/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef _DT_BINDINGS_NVMEM_IMX8MN_OCOTP_H
> +#define _DT_BINDINGS_NVMEM_IMX8MN_OCOTP_H
> +
> +#define IMX8MN_OCOTP_M7_DISABLE		0
> +#define IMX8MN_OCOTP_M7_MPU_DISABLE	1
> +#define IMX8MN_OCOTP_M7_FPU_DISABLE	2
> +#define IMX8MN_OCOTP_USB_OTG1_DISABLE	3
> +#define IMX8MN_OCOTP_GPU3D_DISABLE	4
> +#define IMX8MN_OCOTP_MIPI_DSI_DISABLE	5
> +#define IMX8MN_OCOTP_ENET_DISABLE	6
> +#define IMX8MN_OCOTP_MIPI_CSI_DISABLE	7
> +#define IMX8MN_OCOTP_ASRC_DISABLE	8
> +
> +#endif
> --
> 2.34.1
>
