Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B5B1EBA19;
	Thu, 30 Jan 2025 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254811; cv=fail; b=h3anLI9aW4xpOPFruN6VUr5YTqMPjdDOZyibQ9jsQFViEO/aG/+BDG0vjVna8vk73IF2z8z5VAqDUmE0fNMayJumBjEbI9drZGv8gcTIjq+Bm4du3rrJu2WFePnt4G3+AY/UCw+g+FXnqWVVuMT264Zg9aK/JRwG4lWFS8IkqRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254811; c=relaxed/simple;
	bh=Vp75QxFjflgAnZyJCEqTCWe2kFs86U5dgNFo/SZ+4tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SD23lsK9VryHtNk6Z+JnvvFh4xTg7kYpAcE8BKHDB9i8+NZGgxoyklhKwETL2OiCIUX5XEu/mZN4apLUfDS91vI244tetGbrrQAO2IgLdqMMbW5PPYR/49ZmN9qx+SxSlgNvPiRtG/Dx3NGeG8oL/nWwumdKO6BzqrQUbZ/18Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H7/WZjh0; arc=fail smtp.client-ip=40.107.21.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H7/WZjh0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZT6yIPvcVR4EsBKtKlHfbG1xIaeT2JcSzUXDnKL2x5bvoTjRnkzFEdrRamoBnFvrbhSbKdkR2//un/edWh6nvzMuJCgLqc2N9VgxbOeCpioEDgcutZyCHq8aqXZweQxez6Wt3zt/95nT/zDH2LnO2m6Mnu9vBslvJRCweyxD8oZl7QFgfUVzpkEW0ycqZmwUu5Gw5j6P/tc6/prXI/5eFUZrd6HGJmVcZ1LGvTl47Pj9eGbyeI2pz10j2IkuJ8cMbpXWpj2PLM7uxbd89Y/ShI3uMxHf1gl5qPZ5a+L+KJrXwu7lEZRRHa+F0Cj8I2iQmRegBHU0+DJJEGYRGl4Ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn41vEiNf6Yo904vddxx0rT2dhSjU57jj7ycq62R1zE=;
 b=cYyZhseOVYfU+CY6Lgxxdek6YjAd9CPD88VrgYZ7Jz2cZ3J+oX7oIk9Rh2AYSpeFNaEUE8qtZcBW/vB3vSOM0wh5dzf1u/O+quOEVEA3VvJITJbzooe0ViUJfiqjDqb+QR8wb5GMWbuF1w+GFBX0+8A3qXDTlmeYzTXp9tTKdFLbekeLYzwzVg1rfQreW1HkqmwPn6lQG3OwZ0OTZwQCkF8pVROo62csEKbtt0b3M/xS6bQMDAA7TEglneh/0upmZbwdpaW+jnQCKlIF/UEnjnrsMdhcRdL/5fboRQOVWxFzs1rG3NnbGHk1c/hgTc+ATEUrZN7YHFGp5ERkF6LrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wn41vEiNf6Yo904vddxx0rT2dhSjU57jj7ycq62R1zE=;
 b=H7/WZjh0UZATeD3BGIrWiM3yI0yUFpCPTmD/Jv2hkm/DC/ymPQMw7zDVGDsu5WzEAZj4KY94+KWHKozwL10IRRz3UPhmDCvtLS5W8SOrlfLqox65zlPOnmhhE/1U2uGngOo+CET6IbNLWjCMU4/X01NWSgPTXAsf0eFe9r5XBzWraFhaSy1xQFl0bjG5ekU8U98Lt6Zt8ArTTDtzLMYCcoHFm1rd/5NDfAFRpJANSk9IuG5jLHBLqk8mUrO6eeq2QKls90q+BjnDMf+J4h0hocFIRZfYmx+bZ2yk/Oh1RHJTCY/mmCW5E3zklQQ80zLNbYuS8ij2Ve3rL9t0jG4/nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 16:33:25 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:33:25 +0000
Date: Thu, 30 Jan 2025 11:33:17 -0500
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
Subject: Re: [PATCH 2/4] nvmem: imx-ocotp: Sort header alphabetically
Message-ID: <Z5upzYu4+wjRepvL@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <20250130130101.1040824-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130130101.1040824-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e05e82e-71d3-4913-8479-08dd414bd17f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tCu/1WqyD9hS9vRTuj/fTFQF6DRLz5B5CGJ5hz2mfqOe09+HVSitfY0+UQC0?=
 =?us-ascii?Q?Sj68Xnqez/t7LUaZhUnCXn5oSS6gyuyTR77ViJfzQKSZZH/c53mdCCJMADZ9?=
 =?us-ascii?Q?64R9I1eD11zX0b48dxbd1NNTLQxqcO/9Lev30m9UifUNAvzpe+R5L3xSwpP2?=
 =?us-ascii?Q?MhjXke068dVC3geJHkXyrV3QrZYoqWXlngVr99OQAy1CZPh4ufmJI6cAL5mA?=
 =?us-ascii?Q?1A6QQzVK53uzZ+vkpSCZhUriiT1Ra0Ag3GwQHf2kt+E23i/VgVNMdl7j+F9A?=
 =?us-ascii?Q?k/B7aNHpR5D6ycjv5G/eK6d6Gyosa+5LqW/IQdAb5LdNqF4AwZzdocrNyGwe?=
 =?us-ascii?Q?jtgdoHdzkvGNEn73vxYwoRfxbja7YmyA2ILlVn4NtT1A5Z4A3SY7R7OJPQ24?=
 =?us-ascii?Q?UAcuffNhyZWKMim5kj2NDvVA8R+A+I48FMPo8GXFZ0x8YI7DjzOg4vMQbzB7?=
 =?us-ascii?Q?GdSOF+vRt/oORa9/L2C4sutzb59zvEQMR/3ihheoUvhn1uEctBlCIS3ZKhnW?=
 =?us-ascii?Q?1/GmLwKUo9HVq7RKuOi4OLSY6m6jAYb1vf17e9rp0uqh/+Ppn3H8wJ7Iwf6c?=
 =?us-ascii?Q?t2BHs+mbSgG5+iblqXB7WQaVNtJGHzIv6h8OkV0M4xfWMPWURZ5sTR0zc5GJ?=
 =?us-ascii?Q?bX8aQpRjMZTqdSaB5obzxAFTg840aKf7pAjq4iPb8Uwoq/m34lY0bXtO5/+E?=
 =?us-ascii?Q?+QvhIuXgVlP/Qod47C996LhoNbKNfLt8KtnJw/KX5ccahtCRolZD9rlZs5X3?=
 =?us-ascii?Q?b1fxkt0egRqKx5SVAT+jqlmCBYi/VG/CL62HHWusNkI6KDzSgUs5eW+Z/IkV?=
 =?us-ascii?Q?lrEs9jFFHSH2V+nHcvLnugc1YGxhEQCb40Ws354fOgNO9AsGX3iPuw2iiGCV?=
 =?us-ascii?Q?/iyQs4547UYkaioDUFDTpNUDpydnfr/eEqLMsj3q6XgF8+qUvZEWYSsncLT5?=
 =?us-ascii?Q?5WpCRCNiC/q3pvZblofUHcfXNavcQSGnjzZxRXQIHlA8u9op7olnsrzHk00g?=
 =?us-ascii?Q?VGsA1HzJt+nqU4EQDBwfzZ8e0TGaLHrLDfBg2KcEBvxuhdK9FTAyb6dssLwG?=
 =?us-ascii?Q?utxF0KEad/EOsL6whn96j1dvQjRKH64j0Q5ZqYkDpogHpsOMLxkhXwaqlytG?=
 =?us-ascii?Q?WdVMXkUTeSsIUZQ8md6Y2ndCbwOQcKy5KlW3KR3P8eQLesHUsYIIZ2Ry5Bmk?=
 =?us-ascii?Q?n2dwN736uW40Q9aTNAMLIDLnelQhq6LupZ8Qzr3Ie3bsAUxur79Gx2swSMfz?=
 =?us-ascii?Q?oc7OtHHgxv3C6Ap9DUUDlYvDbbSJVvFYgGP/meVARhzSCvc6qyTVIDmYDBr+?=
 =?us-ascii?Q?ZGw1wa8d0jELBeP1rVsqv05f4oDBhI6N5ILwWsacF09d3dmSQMv3D/NgOsrs?=
 =?us-ascii?Q?QxOoDTTXczSofP5QPfg2MNEs8JVpwh9yUrd5sOiAF77MxjKl0Z8KiGWH4uEu?=
 =?us-ascii?Q?tnd0CaQMhlhLUC18kfr5FfOOidd7I63y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1PdnPulL59xtcjFOF9XgMDa4ytXiZDptWudJ4cTWPtqZ+pxGVBqgdkPN8UTN?=
 =?us-ascii?Q?KHxAnmE3wLZ+CBiPLlupIx4hA76OGm29xX6kwIS+fqBRGOLu4OSmD9v2FE2r?=
 =?us-ascii?Q?01c0tLFR0IJHkyjLuIytjq0+2hbigJUJzoJX54IEStpJW8moGc7PlO8lb0vr?=
 =?us-ascii?Q?xpkAckpQkzQ/I+JWDGI4HsvaqMvERMmh59Zjv8uOa/UQIAZpK1eojbWqTOs8?=
 =?us-ascii?Q?8FTnksm+ewOkZa0nsydAy4lBCnA6vnGWwDXIpMilg0KdVfZmmH739t/rEcVz?=
 =?us-ascii?Q?YCvVhsWE1IX0TATe4o5van2hNwpz5PXwIq2zpjh7N4dRVldKWNb8iVYP/Nze?=
 =?us-ascii?Q?oHY+7j6lJrS9YJYJKcG+iqgr9tU7kcsxDeJMPVpqXnfbx2Ss9b7/iwSwA1+L?=
 =?us-ascii?Q?j/ow/fCE2GJehEMRW75t60xotKFqZNof8wWiAK8IekXRk4mGYby4L7ejMpwN?=
 =?us-ascii?Q?FVChsCNWBj2paD2Quv8LXYPqYcD4KWnCoq0m61Q0IfYq0haa5GcPZe22kcjE?=
 =?us-ascii?Q?Nm6sBfnhkN0KxVawyvCZ4OrVTXSzAwwvZ+vxIlSXPzGtdGnHeQS4LQ78L6AP?=
 =?us-ascii?Q?tBqoq0PurwglyvSuV0auPZH5xwxB81ojjv/YQ4QC8hFBcV9MA+nYbNsh4KCC?=
 =?us-ascii?Q?27yauDMkC2UdKc5DI6nRwTZDtiB0Uo3A4G7uPFwFIICAd+e/nDGPvQc1mMAr?=
 =?us-ascii?Q?gPRvZBkZwM7nmLIvsoekLExtlsnVyJbR8t7M2fFL9k8CeB56geiHEQk/6l8X?=
 =?us-ascii?Q?eZPfc8CCAFCIRhRLI7xbG8TiJVro/lvCX86ZOYAjYDAecdge5kVySgsWW7Qo?=
 =?us-ascii?Q?fT6JVGXoJhGe0c7uKKt/2D8xXEznopHB8q5fGydlwpX9/04MR0/+SO4lh73J?=
 =?us-ascii?Q?YehoVd8QO4GHkkPKz6FiHO0C90hvIMK2qdd7c1RG6cgq96JmoHKgWraSKHBK?=
 =?us-ascii?Q?5/vnMKRyYWv+hxuUbLKEmYxhX7wDqOd4trUb2N7vumAzJ5XU8CedZzgU+ski?=
 =?us-ascii?Q?rJ8lSI5H+iDEYch08/ibnYTcKZCR9DzHAXnMAJL1BhHB2WjAeIFoVzlsIOpS?=
 =?us-ascii?Q?KnI11qC1vZiIdIgyXxPIRggWnY89PGayD0MXjYpkN1kDdQ5K8WowZaWLHQ+Y?=
 =?us-ascii?Q?tOxRHMSTrx8emy/pKbuLLqEwby+V/8q9LwQVamjiTqZ7E5Kj+mm/jC92S/tf?=
 =?us-ascii?Q?a6LgzRQROYw5fj7IAOiZfoIx5jJGTrXt80tLJIGVEC3qgtTTFXRwgzlYushh?=
 =?us-ascii?Q?dHN+Sz78kEV2VcdVYmPQRjDfhiq9aDMGYUhbqCld0QEdQ/WT0h2wYQLD+sK3?=
 =?us-ascii?Q?1Hpy9yubD/ziSwjgObFuiPb9A6Mnim7Jr4VVB0KEIzEwd4pVZvQerUhdJK8N?=
 =?us-ascii?Q?0sw9qGMmZMzSnErL0uR9rLf0Q80BQpJxShc+ayMoG49LFOVJmtRV+x6gjCf+?=
 =?us-ascii?Q?2LlN+4bykTz/ETMPbEwwfwx6gTAchorhSUK9DPMIM+VX5d3qdObWUrXn6caO?=
 =?us-ascii?Q?4WW6OPEEc6my/ps/JEShDJGX6RFdmvVbR5796i37LM6YsdzeyHvyU6MLAbqE?=
 =?us-ascii?Q?HHPfpjGfKp2++u9jzGWGx7oQul4xqyrD1bhBd+Ct?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e05e82e-71d3-4913-8479-08dd414bd17f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:33:25.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxtjbxqUmf87rhOnc2Kf0BLme1e6b88Rbie7GcsBs3jPznSy6CbuR27W3sw575D69nTZytcdxxnIPp48U9cygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456

On Thu, Jan 30, 2025 at 02:00:59PM +0100, Alexander Stein wrote:
> Move linux/delay.h to the right position.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/nvmem/imx-ocotp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index 79dd4fda03295..c5086a16450ac 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -15,6 +15,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -22,7 +23,6 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> -#include <linux/delay.h>
>
>  #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
>  					       * OTP Bank0 Word0
> --
> 2.34.1
>
