Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9915F2AF19;
	Wed,  2 Apr 2025 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622703; cv=fail; b=tFxBxDwIUdmghK3VY3meUMIf18IdJGdaQjwx4cYOtaCKInbhCe744p5x6DR6WbyOby3vGyO5DAzmkQATd+kls03Tk+yURjWFJQvu/Dw78N8s1ScElZLUZ4qwXfX9mADzBdJQnfCJcAc+t4V7nTSUGtvBK+VGZcR3r7t0b+DcKz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622703; c=relaxed/simple;
	bh=IvlwZNCURwWPlPKqJUCqpoz1/QvhnyGWWewC/zDVoDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p8mAmH6w2TA6oZyIitO+J205/SsZXO+Su7gAnpZrg/TYDTxaQ8hv495LH6kfur/snrkcGxVCey7Op0xfBSLw2ahezc9dKdt3oS3q7mF2xW4HzsmwDedqsc9+W99Vo8hQHkYjmYx/teMDs86/TUJwWI3u53yEfBIjD5Ey3C7R83Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jiCbqWPk; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jiCbqWPk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sN8e+uadKjgqdw5EGg+sVW/wD0aQsLPDPjWc9ZK0VKItZc/1klBBslI9wX7jlHEUcL6cc5RXhR6slNFNVpRC5Vo8zE8icQOQZi+DVqlngGb4+Bc7+BivZadWWaBbbIFR0CD8LU2p78sqEtHFtPSlpDnnEbidzeb7oQbYdAuf1Nh3Bqyi3EsEJ5wC3pojmd9brfDfhEQNM566dwAPp64HM9t9QJjXto4/bq11yjAeJv3vsfsrTGDHVWuZNrL0biO3uHQplANAjS1c66i/IgDytfIYkQDHi/Y1LZCleuq6q12T0N/nMIgwMUsN77GJhrafGjHKEIT7PaoypR5FvJ+Qug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5o6AbIbvZVy/nQSqqFuCabYebHyuX3Kth3SY8r7+8c=;
 b=E+B+WzjSXVmqbItEMFah814ozYETUfZr4HQ3kqUVug/3XIEkL/0OaTizs94yayrod5Mo1uODWwf8CtHLvBYAV6BJoNnQ3whkaHR5hogn3Qxv9lkYUlr68MdeqX97T9b3D9GcV397SbHxa3DfUyqHTsTH826XnWgmUscY9e+JnNp62OThx7AsiX0vTZeinYqV37jm4soUNJlyaoZtBR4OVpa2OmCBToZxyHZN7IHx9Gf8I99sg1rWCDxQ+lRx/xZ03iwJ+xgO/+u5ZlMGQwpBiG+8oxKMYMLgOSFwawsoEg+z6h7PzetPA5KnTtSi7d5I5ybbN0DjYKf5Xm1iChKcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5o6AbIbvZVy/nQSqqFuCabYebHyuX3Kth3SY8r7+8c=;
 b=jiCbqWPkjvH8HfwvPRaOBG+dl12tGFI/AZuShjSZ2ac1aOPPZ6/WR5J3JTfnOeFf7VvT99NJS5uOnqvf2Uc4uk8xx4xc1/YBQhJPFtgoOc4F2yLO/qKc3mPWcdvUJKkusIiu/3M8QQmiBkegfphxh+L9xDDbUCRJYbSdf+KZSZQAgQYL4r0gyB7Iq1o841bGBMz+TJalhbnJzk+fzdo2YTZaE8vIJtYfYswxe5WGNbm8w02vf6ezqlcjWVNsBC82GGlbRPD76Ff8GmGNo2Koe6yx1hEnd8OSMqhK+MYkTDMq3t1JmVcy5Oso1Es4e6eLP1AlV5+aWACYjhWxALko6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11223.eurprd04.prod.outlook.com (2603:10a6:d10:170::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 19:38:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 19:38:19 +0000
Date: Wed, 2 Apr 2025 15:38:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 9/9] arm64: dts: Add Moduline Display boards to
 Makefiley
Message-ID: <Z+2SIxFFTuf5Iy40@lizhi-Precision-Tower-5810>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-9-9f898838a864@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-initial_display-v4-9-9f898838a864@gocontroll.com>
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11223:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa2d2a4-c88e-4653-c250-08dd721debae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ZhGs7cn9B3uA68WqmhoErtXWCR3nrx+RGAwCyskGfm/t+Z3q2FPgvqeKIAx?=
 =?us-ascii?Q?jiskf9SJEPMVhDOmnVFzQfADjbAu33dZxfDTltLfOtPEZblfwYYQySIXkdnA?=
 =?us-ascii?Q?Dwt0zGSHuNO04ACqxS2uBfK6kHB27utbg0RlpyINsDWuIx3D3qPaT6Dtj5GA?=
 =?us-ascii?Q?e+oKNPtz3Oo+4AHnVr1UTkc1yA7pOWUA4fp7zdtZFvZ+gxigM0pV8V8K5Y2T?=
 =?us-ascii?Q?G6nehyt0LiB0BMwMoxz6WUBx4/DVurR9BtKM6ys7/MRpamF0A6dRm8KQB+M0?=
 =?us-ascii?Q?pyydlAFhER88f7AIq/kx66RQfa+/F93Gmf4+1hSfOdReTr4Ug9jwh0B/Ighs?=
 =?us-ascii?Q?dAvnzVp8jMXxr4urjIiU1cNx41nQA4LwilcEEhq9aLPjwbS4rWm6b+5Jnajr?=
 =?us-ascii?Q?6Y8h1I+gyEJpwN4gxmMGNQgbZrTpio79hFlaArftAeoen3mCSuukH43heHQG?=
 =?us-ascii?Q?eePzzAtx9+rs4SJNWcbEeIhMyx4znCDB5elmerGWp9bwwD8N/MmrXKJd/mLl?=
 =?us-ascii?Q?wuA2ZrQ+8hU4hLmSWyjimUkwxb3vjMfCoDnYJZENUvm+4Vi/TgV9Gizh6HlF?=
 =?us-ascii?Q?GGuFU+hWheeDOvv6w0z5KTCBG1e2DgTrWle5NEAo/yyDrTm8HhU8bWXdD1pB?=
 =?us-ascii?Q?s1ffrBidds+HOqBUkBw7fTDlWDR9JR1k5lEeAZK7ui51AM8XLqV0CGXqDkYu?=
 =?us-ascii?Q?gLTNtgv5VqCHpTBTlCMnugDXnrdS968EjBj/7qIVCj1wOVrYGtrsG8/wVPXd?=
 =?us-ascii?Q?bMrVKC/lPuWMYWjxoVUn/4C8XedGohxDZh+ch/fLFsRAqNvCrFf4OIyulfYp?=
 =?us-ascii?Q?rz0VeUvLIswRWgo519d03sHsy3h6ILkcTTaTpInBuWXWQIXRkEewUqdYtqBC?=
 =?us-ascii?Q?gnBwxkrPcjkuvIu6NBb3bPYA3iq4tOF/iuqeVRiktqfy2aw1dD4EWnJVAukI?=
 =?us-ascii?Q?lqy2u3SP1dQDFaCwjBd7p2YFJZPuopr2LXc06T8eBAWzdpen4JwGSL02Jv1y?=
 =?us-ascii?Q?PleivBno7HPMQkQDYrdLKIoXhk4Q3yzjxCRWt8I+BNP+kryKKdMrG/s0/7f2?=
 =?us-ascii?Q?iR85ZDtF5/GjwI8upmDMoNVZSMrRo/y5tgEkeT5zFeA0m6b78I+bswTIt25j?=
 =?us-ascii?Q?DU+3gvFFW9vnkCb0rJlvorPUw5ZvXKHtDU6wlh4ED6OXt3eHGX5HNNJCzzpp?=
 =?us-ascii?Q?C5Sg5ytupS+poq7sgzWpbNH01CMx9smDnKSpYopKjMS8Y8njaR0IdrwZQsJc?=
 =?us-ascii?Q?KXpViguiLnkrc0yrA7C/jY0wmCKu5b8dTQi/0PoWrspz0QXkcQJlXdApVCvz?=
 =?us-ascii?Q?ZINT0jhIli5Lzt6N2nDqS9oSC+rrenc+HX+ALZuAMi3tJ1cspvySovmuO9op?=
 =?us-ascii?Q?UwKeyP4GG90Soel9N3aZhE54J5/oscIxfa1vDeIyVSsSnIxTtjRfHcAYRjyj?=
 =?us-ascii?Q?MN1vxPasP1PS3H5oPfJ3XVtp4Zot6eTe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDHApxmJY2H+/Bm5R7GX/DNuJOfGtMR5WhSt6O2BTBiyWuwpJNUFtGaYhCPa?=
 =?us-ascii?Q?lRI5mA3A6QzlgnL+C7ooE0j4E68q3d4damB4oVT1TJApgUm5nVRxKk64IfBi?=
 =?us-ascii?Q?XWIXUwxXd9cKjb+XQebVdYhRAvCfAHPxsmUM0Cau6ReQdSlkrCOMHx8FMiuO?=
 =?us-ascii?Q?33iU5BWhHGMIUuBTcniKVdANzZzA0rx9u9ILoD/LOelFv8Z1XXqZPbYK70oR?=
 =?us-ascii?Q?IBsVIwB5KARx51D+QtFlvMOuPlut4pHj3Sk3qHxTalKIc+CJ8t4MldBbR6Dr?=
 =?us-ascii?Q?KNsqKotLSXYSFq5kJ2rJ8veScOIPu3dh7W++2wjauFHmPol4PrBw7xre3/80?=
 =?us-ascii?Q?beKQ0omKOio/Kd+Z+dq93xRtEqf0F3zYfZkjBALKep6uFwiVQZW3gfcDWoGu?=
 =?us-ascii?Q?unN/r2VF2vYHxHx18tIG3ep0U4+VLgf1ZXlX5uKRLXZ09cqQVvTkAmYhqEx8?=
 =?us-ascii?Q?UF1p4phhHw0ENdXVsKFDUXM6Q5ltVlYF6zW2xbVG1HKUEKoNEKGI4vvbLruJ?=
 =?us-ascii?Q?pdFygN0Oyhov9wgcGprB9Hj/WXT4ELiEkqRgXBT2rfMXLRzV1sdMIPaj3P7f?=
 =?us-ascii?Q?gtcmu2IzLbn86E19g2IhO+0D4XnRhYO6i3aeKklxuZpXWQ0bXi9CjYGHdC+d?=
 =?us-ascii?Q?w/0w5qf2UEoeRacTylDu3KeJAhvyyRqhsDFOBkMWtLgXJepyQ0KVn1/DzJel?=
 =?us-ascii?Q?cN0lhxRUUN6p6Cqv9mpMer2NTX+sT5PhlE9Oji9Ckj43lCHMpe7l67zj/bNB?=
 =?us-ascii?Q?XhDsv2nj+FozDUSFz5RC7zdJuMpcy/T0Lj/w5ttRWJfwTQG2DtfSp6tsvZls?=
 =?us-ascii?Q?B/wd95DoBznCJ+im9ZxcrCKjHO9POXbGDMdkgpxdDRu1fqYRIo7J+0/HiQZ8?=
 =?us-ascii?Q?MrgZl2hHCtuKpk4dJb2r2FMB8KD6Ds1caFph4asmvFb3c9at+vD0EllRfxO6?=
 =?us-ascii?Q?w7KDUBfn5wCl35wrEz/mCg8sPdFdXfzniX8a8k6/olc9QBbjGvbKBUH87DY0?=
 =?us-ascii?Q?a+zR07eJb4glRmR0yZ6E48CZTTiBjRqZbk6C/PweLpWV+tliVAr1UxqcMc+m?=
 =?us-ascii?Q?XdQNrVyAM4e8okHVHeEcQVAOaHtE2/TweOb/Ae89G/zXQUgZQH2XiD4VOY4Y?=
 =?us-ascii?Q?SjLD8gN4mfK3Is22TaOAdMXBf4Yvkc8P1bdE8FBmXUdZCYaBh9eAJtzoWjhb?=
 =?us-ascii?Q?oftrsp+GoCvfLw1h0MSSACzdaEedEkPGEm4f4pQ4vZDEoVSwxrAtNOFTeZID?=
 =?us-ascii?Q?ABzGxTLli6c8JQye1bc6lFcM+VYLfoA5J54mKcZ3e++wgkCxcAVoKyiD+1kF?=
 =?us-ascii?Q?azddwpHBbM0L8zUFtBsEeDVaXjEGnmtRavs9axrnMyuKgqEzem0knccFMOUE?=
 =?us-ascii?Q?pd8jYC9oc20UY5loXfJ20Ho5I720us0RfviJwP8GCu/JnCXtD/M53hbWDL3V?=
 =?us-ascii?Q?KeAgYDbcKJtOhhW+JbtaFSTXQA2V3aY+vHi3amYKim84Lt8/CcIM2/qk5TBV?=
 =?us-ascii?Q?WZ2SH2T/v+YeeL/zSimAGCr5LjX1EqU0xdw1MV+Lv/kPzgDm38+3S00+ydzH?=
 =?us-ascii?Q?n3XlPN3FObUvzTDS3vGHZYH/UoG23uTyRrGIvJuV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa2d2a4-c88e-4653-c250-08dd721debae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:38:19.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CprmNMdrXDMl53O39JbzYAGsmOGYg7mNeN4BWsrqKntga5SPu5HnWkJ86xRZ28vlHjzQjX7DuH5YaZrM1dA9wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11223

On Wed, Apr 02, 2025 at 09:07:12AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Add the new Moduline Display boards to the Makefile to allow building
> them.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---

This patch should belong into pervious patch, which add dtso file.

Frank

>  arch/arm64/boot/dts/freescale/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index b6d3fe26d621234ab84353165d20af9d2536f839..fea25c7f997cda9aef73cd643f0f0279ee0bfffe 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -214,6 +214,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
> +imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
> +	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
> +imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
> +	imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
>
> --
> 2.49.0
>
>
