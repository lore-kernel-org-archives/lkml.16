Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5771FCF66;
	Wed,  5 Feb 2025 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774087; cv=fail; b=OYD6CWuXki96dbO79xQmtmO3dpu79E7bxuGao0ntJ5WvZHwJlExveUKfo6WCvj5XPWWMK0QaWKzq7RyL51Z+SA10wyMd0vJKT3tB4f7LtQOXHnKOJsmJkFnlvuUDycdRe3Uofu4oZxkBkRsaM4rpwMN6otVhlpvy8n0wuk22K00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774087; c=relaxed/simple;
	bh=PoKfXYjwJRRKOWX/F9/Q5J+Slt5kzDzc8HxdbEBRTkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T7emkmI4sbhxA8vryGAgaZFcmpUSSxRMH1Kapyj2IKxSUXRh4T727u9m2muHaQDM3Ce+Da6AnqB2+vN2arigoEWYn0GD9decjem1HV3Vb4qLTFIXWWq/fVO4HGEx8sjXD/AKHAaf8tb4m30Iq63DaWUrNG3qaSdeq9Dey19S8qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RcG7O7P5; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RcG7O7P5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt0XcAmIKdjDgsOxIoD/fmnwB/Xaem7VOnE8xC1tHGTXLQ4YmBSberbx12ZmlFcbokctruhgsm2y7Y6zENe5drX+cTFohfDwZj3QKSpxWf9J6sG5etS1ZlANqL2f5e4za0M1YTJkyULKuEt0iE3STyLsh71u7Os7uAnszD2njzH538ATH8UdiYnlZmkadzA+/KM23f08jgpHpuyeUECdtcoOl0J/bdnuiXhva6PivEWVq5N1dY3IUTGM6P4My8mcbeUjDGRM+apYd9S8SxzHJVqMy4f7cBavc9uPl/r4m6etHWcLbqkgsSimp3DvwVb0KgXjQoTSi8wnvgEsK+6oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPKpWj9rorpBfk2QG3TQl+0Uir2U9QuU/kq+qfqarzw=;
 b=jNacO5J52z156tHOWYTv4QhKCGBGVvluvZrKCisqrVXquJQM88le7Ja5rqaaRDC3+DG1ZqTi8toWdKv31a9us8q6bziyLe7e3R1J+YnmjGBuB7w0PsjnwlnO9d1f5Xjb4Rdg0s0UK1QMAwRbG0C6o4pidTp5LK630XmomaqUjVlVToibF7+KDv0bosXBUVKaFW5eiRtfd5qpjdsmJa1QSxeI3hObtP0UGSsWWmaRnjNvqXKRQ2vBgKBz3x8E5Rulc4pXfwxyg2RDUvPRaPLLyk9xH2jhmvk//DH+VMvbzI9FQlSwrhmNv/2A4uSfTVSM0JjudOYiUiw0MdKWvRG0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPKpWj9rorpBfk2QG3TQl+0Uir2U9QuU/kq+qfqarzw=;
 b=RcG7O7P56s0ZhgG3B4l4kc5mZgeSnFmwFA32UgGZVfzjO5YILy1hta6BcnET1Z95kQ0VfMt2XxpEyKSRDp62Os7sgrYIptuje2OgOe0ummxmHYAC71eTPhz1mSWh0wWsQA5N/1a+ZXiuNLL11eO23QXeLXqNEzZuA8uX1VJK1lm66ZIxlsnYiiEqxrVZYjK25/ftvgTD7bpnbRakXbZGO/wkeKJfPQcFKmHPEgp8OSGv1oj6CRFXgJx+weaEqVoKBiQhbkIihptyecYrXIMl5VsmpXkqQ+uprlVxGV+ThXI+ba8mAaBp2gx+2PkbiezwYhc8S+pXG+WqrnwTD07wRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6932.eurprd04.prod.outlook.com (2603:10a6:208:182::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 16:48:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 16:48:02 +0000
Date: Wed, 5 Feb 2025 11:47:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Message-ID: <Z6OWOfTKIi0EBdZy@lizhi-Precision-Tower-5810>
References: <20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com>
 <20250204-imx-ocotp-v8-2-01be4a4bb045@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-imx-ocotp-v8-2-01be4a4bb045@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ad4829-1ccb-4288-2fdf-08dd4604dab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZGF/mVdEIaMmfvGo8EPVfDUoskA+Q/bhmGNdJVCR2YkY897fYjL+oF3djquV?=
 =?us-ascii?Q?wIOEU257m2OQPaHDFs8SQrN9jVX53Tl0d105hDwMjWAQ0riEl0v2yLCUIKfM?=
 =?us-ascii?Q?Rm+1to1bVhSLI+j91K+hEmGOf/76jcRRUy+HV/UlxsO0NBc47P6hoh4EnSUP?=
 =?us-ascii?Q?3Dh9H/3HFrcPNXgCd2dLfzcYE5+NqF4nLzL/3PP+v9CNSvzg39e8uXsDHZp5?=
 =?us-ascii?Q?P6UMABTk7AsMduVJbzXpCNSY7UU8nf+g1e73qq7htn0s2zMk4q6Jd50JhQfD?=
 =?us-ascii?Q?ym9q7juXQqSCgNEJXR+rfRf+pBwB1pH2pI8ru7wwz8zl4dM+xSO4hTDTNkoI?=
 =?us-ascii?Q?fMIklztdhQ+Qjd2i9PbN3xqX2qKh+yPK0zs40VmHPZ+65IZatIYj9wmWVZ4d?=
 =?us-ascii?Q?T0wiS0uqr8h6uN2jGHGVq09+WbqXr84hlIi4/WHekFWMk/8a4FLExOYVQXt9?=
 =?us-ascii?Q?2f/qpt8EbAPqlR+SuATVkwZPadTDXxTSAEqag/yXdrzRF3iJq7KvpSrvU0lw?=
 =?us-ascii?Q?kO2gbOD0rhR0igs7uj3EuZtD47mUY/tEOvZRqA3dUrB37+fZzi4LaOdWAgw0?=
 =?us-ascii?Q?FoW0ROL8iBwXPgLQfY9jdUlIRCn2rZUmEjKQeZj+pcbmRDHDNb6vEffmtXOO?=
 =?us-ascii?Q?t8XGEnSOZXu/tFhZHrj0w/BDt5xw7A3X6vy4TvkVdjseDcMiBnqUm/DYRs6P?=
 =?us-ascii?Q?yJwY8RKmjf0PXGXucIdtLooqDHxZMsjYcXpsUugddfLdj+x5iGE4DqvG3Uqy?=
 =?us-ascii?Q?u+b6/KH0ocxRmBbShkIrOXStGt+nwlCldYBX8E21eHMFUK9hLQtgPG6WBNHJ?=
 =?us-ascii?Q?XTNfjeORXmeQsqtlLMzHwIGprUACQNAddZW4AEPDYFTi03OkxCwhNB3XISYp?=
 =?us-ascii?Q?/pMpDBSNKd+8fOo+8035mp2r11VYR52Cn0GUCo1UjoRDvfKQUDavTfYVHDr8?=
 =?us-ascii?Q?N/nuNtEISI2jN2Hx6MCTyIgFwt8STB/XJnIIkdwv6HC5L9SLh2karNZ32I+X?=
 =?us-ascii?Q?7xmRhD9LkztiNv58K1/85A2xeGDrDHbhRkrNHrT4mEB96pLj19peJs7w4wz0?=
 =?us-ascii?Q?PC88XT/Arjv7aL6r3SZ/+CKzs/QUnjy/JCXLrcwReauc/mI46x/o8FriuLsO?=
 =?us-ascii?Q?vcQCuHrMLOA41jLNKVktjOZ0UMwIvMkOJaBAA079b6t/U/HE+sfX59RxqgCs?=
 =?us-ascii?Q?IDTarM0QAFZYbnd1JyM8lGfHF6banhsYMl03aoxHGdRAPbaPnXskKYX+h5/2?=
 =?us-ascii?Q?IHFOP0Fs8ROOZdLgeSwLsC1LzRFCYWqX2D/B16JRoGSPPVKO1JkLI+4UiZiM?=
 =?us-ascii?Q?SQyg3yKideZiii8gmTGAYcoYHMC28OAfcNMmthNtMjCbzgw6AElwQFRoS3Kk?=
 =?us-ascii?Q?ePN3IABRFbRIDPhKAih8FdzrRx4+Lnt5AD3ST+8+5x97s8+6EA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iufBgqT3EZb3dKkgWqxIfjFQ5hPrcuEvGcPlUVSS3f2przsp1qeqNFn7hh0v?=
 =?us-ascii?Q?6Nw1fRaKcTU8vBykoqAGFl6Bbz68TaMybiT/FJ8/riq/KXz3Bk9cmTW+o38g?=
 =?us-ascii?Q?QFvdYxbvA+gmfA+zg6n7i5YSrVuoGI97E+1LoAdW8avpfI3I9tk6+oHSaQHu?=
 =?us-ascii?Q?yxf1D8tbtkOLYM1h8OtTA/HI0mBJx8eFt+PQaPiF0xikqEMAWm5MK+XYiJtn?=
 =?us-ascii?Q?6gIv+qhq5V8ECqmZqlux+faxM2MZLpPuGsI6VbYRcTMTDoO0Pbc0MWjYAddJ?=
 =?us-ascii?Q?pNfIRrcFRUoINHhGl3LKi7D+Q4yMMHY90Mtnw7gI/bjobm+P248sP03yOOLR?=
 =?us-ascii?Q?cdy6tV1PRMN0GH9qsaIBuAiOQHzX2x4ggQoiN8B3Lt3B40gRUKMQKnbBdxZT?=
 =?us-ascii?Q?JEYQgQmnY/9H98m57vYBY/J23gAIxh9mIhe5XRWSPb0ruYVcm36/L8Ke7S8p?=
 =?us-ascii?Q?W3O+uIKQ0Fskj64ZmtsPYqknNsrAGnhRE8C3T8xbsObHf/xwvb206A3dLt61?=
 =?us-ascii?Q?4czn7FGeL4Su3Aw7NIW8r5k9QMFzytaTeNyl+C5ZXi8uoCdCWlGAXw842UOn?=
 =?us-ascii?Q?4o3rCdulZQ1LawHatpD5cf7WJ61pkWcDyrhFv/gdJrP7tddptp8nWOKx7+F+?=
 =?us-ascii?Q?5nUsxHju1s9r6D77sygoI4s/wVTCoDBIFBTyzfKjstQmC5DBhcqEQGz13Gd5?=
 =?us-ascii?Q?0sM9rwcOxi/e8q2uh6EMwi8ai6tn5g7W8L3FH0hXQTToWg0ywbUx/6rQCSoI?=
 =?us-ascii?Q?5zzU9dgULM7qczXAJMDVMb90iiTnK7bDgD/vTtTfWwjjoyn5Qz9BeMkI1Nvg?=
 =?us-ascii?Q?o1qpnY6LwcSHIyfYoEx1tIon15M0+X4WnCbPRewczCGFhk/E/R/aKcyRJwI+?=
 =?us-ascii?Q?Lixa15cs5nS0MxvnmDA65BD2TX0iFnAewR1ufgEoM58xqs7GWe2oBqqGAiOv?=
 =?us-ascii?Q?Vhf+ODYMFfDynfVloxI1fXpXOxvdOnn7TT5VWLDxARAzQ/u1Eqqcywpm/R10?=
 =?us-ascii?Q?Fa6Dy3Doz+uksnTTePmk3egr8Q1JqHtZIia0fCYH656g2/BlfZeP+HyhUtfY?=
 =?us-ascii?Q?XfnnGwsNQ0wYp1ZdiMY/FqQcUwYjZ98d7c6UREexRLfncToTzB3HJslJM4zp?=
 =?us-ascii?Q?5XM4kJIYDzA9iz6SaGGy+f1lWK8ikFt3NUmWxXWECXTWvB3t8XEujiK8zysj?=
 =?us-ascii?Q?tNfGn78UpC/AYNIYl1CLgWTkUqtQQUXeP7ybGZSjXaKAYrUOjZW8HL1Mb1ky?=
 =?us-ascii?Q?uSuTWDJ/YzH+cy+5epHMX1WmKLx4vOXQ0N7s3AS0P8qAp16ub9lcQ/VQLtWc?=
 =?us-ascii?Q?6HnA1xSzimsbVEzBTg2OBtniFJgQuHlQt1Y7rgmNpmSonf5twzcNqX4qg56l?=
 =?us-ascii?Q?ZFbEM1idONY987O4DnUqjFxyRFEQNnwWoXdeAh51O2gj0VDX7/AlRhZM6qsr?=
 =?us-ascii?Q?ilzLy3KveBIWAb1qneAbwgtucjHWbKaLDcViM1pk58yq5RV1yyCxn2MoUvKR?=
 =?us-ascii?Q?LTr+2dG6wZOJaRbJoo2aYReaUtjx0IcXYQoEdUiZtAC8yxV93fxbxYHq2ZJX?=
 =?us-ascii?Q?l9/ghCRFSKr24cMZmWYu6PAKQCioqY1UlOv2Gtno?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ad4829-1ccb-4288-2fdf-08dd4604dab6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:48:02.2428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yipWVipK3g34uWuwIxBddYUj+LQFxA38fJmM+6gb9vcz8bArNumJ0kUe7LLeh47/GB4j7T2C6O88z2iRGNUIdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6932

On Tue, Feb 04, 2025 at 08:41:14PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX9 OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>  - Introduce ocotp_access_gates to be container of efuse gate info
>  - Iterate all nodes to check accessing permission. If not
>    allowed to be accessed, detach the node
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/nvmem/Kconfig         |   3 +
>  drivers/nvmem/imx-ocotp-ele.c | 173 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 175 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1afd753534b56fe1f5ef3e3ec55 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
>  	  This is a driver for the On-Chip OTP Controller (OCOTP)
>  	  available on i.MX SoCs which has ELE.
>
> +	  If built as modules, any other driver relying on this working
> +	  as access controller also needs to be a module as well.
> +
>  config NVMEM_IMX_OCOTP_SCU
>  	tristate "i.MX8 SCU On-Chip OTP Controller support"
>  	depends on IMX_SCU
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..fe243e4d3377e98a21f660ebad92dbe9bff94330 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -5,6 +5,8 @@
>   * Copyright 2023 NXP
>   */
>
> +#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
> +#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -27,6 +29,7 @@ struct ocotp_map_entry {
>  };
>
>  struct ocotp_devtype_data {
> +	const struct ocotp_access_gates *access_gates;
>  	u32 reg_off;
>  	char *name;
>  	u32 size;
> @@ -36,6 +39,20 @@ struct ocotp_devtype_data {
>  	struct ocotp_map_entry entry[];
>  };
>
> +#define OCOTP_MAX_NUM_GATE_WORDS 4
> +
> +struct access_gate {
> +	u32 word;
> +	u32 mask;
> +};
> +
> +struct ocotp_access_gates {
> +	u32 num_words;
> +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> +	u32 num_gates;
> +	const struct access_gate *gates;
> +};
> +
>  struct imx_ocotp_priv {
>  	struct device *dev;
>  	void __iomem *base;
> @@ -131,6 +148,83 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
>  	cell->read_post_process = imx_ocotp_cell_pp;
>  }
>
> +static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv, u32 id)
> +{
> +	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
> +	void __iomem *reg = priv->base + priv->data->reg_off;
> +	u32 word, mask, val;
> +
> +	if (id >= access_gates->num_gates) {
> +		dev_err(priv->config.dev, "Index %d too large\n", id);
> +		return -EACCES;
> +	}
> +
> +	word = access_gates->gates[id].word;
> +	mask = access_gates->gates[id].mask;
> +
> +	reg = priv->base + priv->data->reg_off + (word << 2);
> +	val = readl(reg);
> +
> +	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
> +	/* true means not allow access */
> +	if (val & mask)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv, struct device_node *parent)
> +{
> +	struct device *dev = priv->config.dev;
> +
> +	for_each_available_child_of_node_scoped(parent, child) {
> +		struct of_phandle_args args;
> +		u32 id, idx = 0;
> +
> +		while (!of_parse_phandle_with_args(child, "access-controllers",
> +						   "#access-controller-cells",
> +						   idx++, &args)) {
> +			of_node_put(args.np);
> +			if (args.np != dev->of_node)
> +				continue;
> +
> +			/* Only support one cell */
> +			if (args.args_count != 1) {
> +				dev_err(dev, "wrong args count\n");
> +				continue;
> +			}
> +
> +			id = args.args[0];
> +
> +			dev_dbg(dev, "Checking node: %pOF gate: %d\n", child, id);
> +
> +			if (imx_ele_ocotp_check_access(priv, id)) {
> +				of_detach_node(child);
> +				dev_info(dev, "%pOF: Not granted, device driver will not be probed\n",
> +					 child);
> +			}
> +		}
> +
> +		imx_ele_ocotp_grant_access(priv, child);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
> +{
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +
> +	if (!priv->data->access_gates)
> +		return 0;
> +
> +	/* This should never happen */
> +	if (WARN_ON(!root))
> +		return -EINVAL;
> +
> +	return imx_ele_ocotp_grant_access(priv, root);
> +}
> +
>  static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -161,14 +255,45 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
>  	mutex_init(&priv->lock);
>
> +	platform_set_drvdata(pdev, priv);
> +
>  	nvmem = devm_nvmem_register(dev, &priv->config);
>  	if (IS_ERR(nvmem))
>  		return PTR_ERR(nvmem);
>
> -	return 0;
> +
> +	return imx_ele_ocotp_access_control(priv);
>  }
>
> +static const struct access_gate imx93_access_gate[] = {
> +		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
> +		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
> +		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
> +		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
> +		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
> +		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
> +		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
> +		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
> +		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
> +		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
> +		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
> +		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
> +		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
> +		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
> +		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
> +		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
> +		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
> +};
> +
> +static const struct ocotp_access_gates imx93_access_gates_info = {
> +	.num_words = 3,
> +	.words = {19, 20, 21},
> +	.num_gates = ARRAY_SIZE(imx93_access_gate),
> +	.gates = imx93_access_gate,
> +};
> +
>  static const struct ocotp_devtype_data imx93_ocotp_data = {
> +	.access_gates = &imx93_access_gates_info,
>  	.reg_off = 0x8000,
>  	.reg_read = imx_ocotp_reg_read,
>  	.size = 2048,
> @@ -183,7 +308,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
>  	},
>  };
>
> +static const struct access_gate imx95_access_gate[] = {
> +		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
> +		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
> +		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
> +		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
> +		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
> +		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
> +		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
> +		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
> +		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
> +		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
> +		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
> +		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
> +		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
> +		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
> +		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
> +		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
> +		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
> +		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
> +		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
> +		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
> +		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
> +		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
> +		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
> +		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
> +		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
> +		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
> +		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
> +		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
> +		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
> +		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
> +		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
> +		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
> +		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
> +		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
> +		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
> +};

In another thread
https://lore.kernel.org/imx/173828013202.1872493.8212881147597194221.robh@kernel.org/T/#mce7b8226138d0523b602b69de679f3857fd86706

Suggest #define IMX95_OCOTP_CANFD1_GATE 17 0x100000

#access-controller-cells = <2>

So we can remove these static data in driver. If want validate input data,
we just define low..high region and a validate mask to check it.

Frank

> +
> +static const struct ocotp_access_gates imx95_access_gates_info = {
> +	.num_words = 3,
> +	.words = {17, 18, 19},
> +	.num_gates = ARRAY_SIZE(imx95_access_gate),
> +	.gates = imx95_access_gate,
> +};
> +
>  static const struct ocotp_devtype_data imx95_ocotp_data = {
> +	.access_gates = &imx95_access_gates_info,
>  	.reg_off = 0x8000,
>  	.reg_read = imx_ocotp_reg_read,
>  	.size = 2048,
>
> --
> 2.37.1
>
