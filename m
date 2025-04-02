Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2080.outbound.protection.outlook.com [40.107.103.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B21F1936;
	Wed,  2 Apr 2025 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628833; cv=fail; b=AHiJMrXteabgiCBMUYsfuK5RYMu2LCaz2IACQdg6Ef/qV992GJvQSN8jyPKLnkfy5Jj0fiRYoQH6wgQEzaMYrLjEdKQxXA1S8p2koY/EfRPm4ZBaaxFIZAgini5tV8yoPeKEGpRBOjARV74NghcwPU4dAWeSOd2sLIFdj+8KKcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628833; c=relaxed/simple;
	bh=fh5eAzPEO+Y0iMJbGp9F6Gd1qyU4Qa3bQFexGXJEnUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tjdr6hy43aFySYUWYzWWMC6JAqFqeCkHdgH/DPZpEe5H/kORKlV82KOKZbXY9GXDhHnqr4L9/vWt2Mg+LfE55DZieJsDTrZSxVWiWwYzpl3FNt2G86CyvbSO41TuUB7sqiqlmaVsxeYnRY7RSjvOqG6OQVwXD7O2GQehIddePu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GCeEH1hR; arc=fail smtp.client-ip=40.107.103.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GCeEH1hR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEsZsl0t7SCUZAw+imoQWieGyZbNVPksZhhOdOY+vTqmW/a59tCFI3XT94PhpEaLBZpGVlpq1PBPlf9d99DDspdKEfaJuZvRwTKkfFhlu+T0egznzJAl5KlDubaQ9cfLnrevK0cvhAwX9DFaPgYUqz7jXZn1FyCAFD2dh3GscZRPpdoCblRJJhpZlTQWVPoDLUTU43E39irPsp9h5kt09+ouCfXjd4HS6p8XNPRYtN8+EnQ5Oa7fI1F2bansX5ECJOWCgcdpTcJFHYpJUgg4XKOKYkLM8Ssj8Pk7Pmga1gEqQ98SmPa9zhk2Rqdjk3LxknwaidytrpgNGKAPNzzJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++zR5SfCrMJHeYabjw6b9s9u8qjrgEdcxKx32alyjyI=;
 b=t2ESBXsSfNrxpzAYHO2gz7oklq3fg5O23DmauzrqOWSat4ez5DmyFZG0Wr1C/KUhAATVSNr/8oE689SP14cVG513eBL+M2+u5/qTJWd2Xe1zhDZUm3WbDMxR4iPXJ3YPRsULgDaJifzRNimnjdLv4qfslUDRAfB/2O33djAOmocmTStSe4yTmY74jAVYgJqZCGi+xy0hW+t+8Gp1EisrJYEJDuKcZc8ZmdIMO9Kn+iLba6DLZnu8C4ZuZipfyYg5ZEpqoPNWu1thjNxg0XzpxS3YOFH9YVzPJ8zSJY5kyoI4x8jVEtWQUv0UVYp4IAcCjuw43QtP0pS+4utgKqz5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++zR5SfCrMJHeYabjw6b9s9u8qjrgEdcxKx32alyjyI=;
 b=GCeEH1hRQrN279O3V0xlVxnX/tegZ2aMN4jFK28AvIPmRbiERoFWsEb7qPq5CuHP56+3peSyB1FCN7Fg7QL5WtE4Q96D0n7P9j5hWZlNrAqjDh33m828INaCuV88oiGZeD8j0fUZgdJm7qk0W5bsALCLKv72uTOB5D0Y9B2poMNxW2CttephKBrgC2VSKybbIuuSLoQAdIF/1KsDB9fYYK9O2NbQfcbdIn1mVmaIQq0LbsOsQI87AFsOtfOP/L78FZHQuGVGCwXiqjVAIjuNL6tvJ3TKMJ1ZPLWxQW5S8N9y5RaKsZh20vw8cRPdOLrSFu/TnO/oNIWC2PblODJz4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10214.eurprd04.prod.outlook.com (2603:10a6:102:404::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 21:20:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 21:20:27 +0000
Date: Wed, 2 Apr 2025 17:20:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v14 4/6] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <Z+2qFe/E0dbR+qkQ@lizhi-Precision-Tower-5810>
References: <20250327-imx-se-if-v14-0-2219448932e4@nxp.com>
 <20250327-imx-se-if-v14-4-2219448932e4@nxp.com>
 <Z+QePoixgnheYQTW@lizhi-Precision-Tower-5810>
 <AM9PR04MB8604C02C27C8C43FF89B95DC95AC2@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <AM9PR04MB86046B9A3821D8793877F1D395AF2@AM9PR04MB8604.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB86046B9A3821D8793877F1D395AF2@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-ClientProxiedBy: AS4P192CA0041.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10214:EE_
X-MS-Office365-Filtering-Correlation-Id: d11823d0-9d56-4ed4-c7d8-08dd722c3033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MN26g+afcAZy3w9yxRgUsGV/a60xXVhaFL95BeYkP3hJEnMGfDRKpxOiYeha?=
 =?us-ascii?Q?tSUpkCVjFbLYbZZuEApEUW+QzldydQIottq7IGlXjB/0prdXIQpMeJbdu8pF?=
 =?us-ascii?Q?3RMz4jf8vSNCs1WOFr47qKfITnsbdiEEyInvbmV9G8IBMHGc496rxgujet+d?=
 =?us-ascii?Q?SdWczlrYEYgAi+AkjQUU+S1veA//MDZyKwE7RAfiI7TFz8szI8fR/2MWayg6?=
 =?us-ascii?Q?9S7Lw9sj+Locz+AiXTo675QSUPXbx1gLNcG3wG+uuS76dpn3O3qTx69Dbl5H?=
 =?us-ascii?Q?mkAfvHAXFycrWbwvOZGgivcIa3J6sHf1uvMKQT20wqpONlOqCC/h7OuthHVl?=
 =?us-ascii?Q?Cd0vmU2nzPFw7YyG/hAKLIIpzlq8wG2H6PnRwLH9R+b1rKtVLQQpwYG3JSlQ?=
 =?us-ascii?Q?7XgmDHgKJ2ZznX/U6R0kUCJ4+URESVUIw3keFOti5zuJI63b3u+QGkKDGnY8?=
 =?us-ascii?Q?tUP0yblPxxgsNKXKFefiLddyhfufu4tXeCs5p81QZjHWALlu7umoZt2sNuMR?=
 =?us-ascii?Q?4AKQkfGdKUVGfGW7a68y7a9Lq/nrdT2/gHckg47zsN427RFMj9n0/bGn87zp?=
 =?us-ascii?Q?wZDvg4GnbDeJ2niXU1RokzihgHMl60V0FPYqXBxFdZvUTc3benJAFKkLZ8Ao?=
 =?us-ascii?Q?0trtJ2Y05ReowORqoOpmOlL619kinf+yBmc3dA9WosUXmYs7TVLchqqOoceV?=
 =?us-ascii?Q?J+WShc5dMfKoMMkQpzD0kS47KLAA5c9U0zLE/ZCTeRCqkMWzxXzPRRS5+9Cl?=
 =?us-ascii?Q?LblfGNpBTfS56ABiV82NtshUh9EEYYq89SWebtleSH504rN8fHV0vLtYm2NY?=
 =?us-ascii?Q?O/vQ5DhKuaeC2lBoUL4NNARhIcb7RdXkNt5SMEF4zQxhTDc/fU20NYxF7IUd?=
 =?us-ascii?Q?8xuycikpfAxkDYmTIiyXKqet6Cn+39shPOVTc3JUtmhzlbnEkxC8m59XWa2B?=
 =?us-ascii?Q?UMfRmGuaSJmC2eMwkMv+qwBnkLpOCV+eZkGNPaonFji6F6w6SIvF2QM6cJ6v?=
 =?us-ascii?Q?NgHPGJggfOeRKRzorT7hzp6bk/LDOOeq2PnxxQhvjmHKF4ty6uuggI91ZZ6s?=
 =?us-ascii?Q?ML3t5F1sQ/wD/O0xZHoVdG/jEceCtAwSoli5YiZ+QM6tSL4tTHrQlFVB/NDE?=
 =?us-ascii?Q?mxRELct0cClx9wN9idIW7d4AIVTNqb5uGy0e9DS6s+0NpFKk0Ae2BKAPkH+U?=
 =?us-ascii?Q?YtIhqLqBb6WfJTFVb4St1D4AxxIt7rHp3+FQ5Jo+Zy9Su9wsqntgd2W/6ePH?=
 =?us-ascii?Q?fSWwI11vzb/sG1CnMeNbSVH+hHxyuY9B9UbDTPuU5PKBPuk/FpfCP2+06eCt?=
 =?us-ascii?Q?3EGZtyWc1A1pszja1ZHXfZcmhcxQqgN30KfBb9zsuryzTBjo//m7XMREpJTU?=
 =?us-ascii?Q?3l9CTUnQ7Yj+T8oeWsM897OGXhm7eZp7yLY9Zot2qU9ydcnN0mhTW8uPkDnv?=
 =?us-ascii?Q?goEyRZ2uf8o/y7CE8geWZ6fCDuYUr0Pb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j86StCkOFF1a/Qiy4uly76ekknrKhGncEd94YOry/O/24riQUmtcgkxKrBsg?=
 =?us-ascii?Q?mp9Jtdhen6mUKEXVcq+YYFZfZSg+Ss59cN6n7hFtvn8F3viSopk29S7I8Qci?=
 =?us-ascii?Q?0I4TrvFok91GbJ/+yyNavOMqim98gUw5ocEl4u4espBVitWJ1HtmJI2dd1IG?=
 =?us-ascii?Q?5qQtbvUlasCQANlMRtW8Z4nKfFsv2dhJgtngNShEe/WejdCAgH2chG1ZivKG?=
 =?us-ascii?Q?eah1pBlMxQRC/O3eR/5uuQOYwWE5kJ4BVI3IZ/EHiVItSJDrcQSyMDYlUxw4?=
 =?us-ascii?Q?UhSawlXGW7SdEmhYEf+1g5wvtelw2u7BwtXiElcGJHLMQLWpo/52vScKzLSw?=
 =?us-ascii?Q?xuaZWANfdnm14ZAabG54AZ7XsyuD4cF70AXH5LUH5dZR7yJSKvN1Si4I122i?=
 =?us-ascii?Q?jTCZFd17xD9PD0xy2qy+wwWmMIQ323PcJCZ7HyV2mecTwYCIQSbgpqz2zo+f?=
 =?us-ascii?Q?YhyktXgE4WbA71D0lkdD8LvEXUKsLPYmihEDd8u8rVgMwaJ6+nV/8WceBcVW?=
 =?us-ascii?Q?y/ZYpoD44apd0uggRQ5PuMNoRukMjNC2Bh5SDHXhZ/UHsef7Kvb64Xc2dVEv?=
 =?us-ascii?Q?g19AuS/VfTYmB5UjKZ6/IOzvTW1aH5UW1PN2Mw9BcSYG6R1s5YRuJmAMZiWj?=
 =?us-ascii?Q?33b99B7BGnwQ2C/ce3bInOQP1/ugY/72iU4F5JzT+pM2sS7U7G2kjASSQM4G?=
 =?us-ascii?Q?LS4KKLICMSCWXLQhMBA/+Xt5YDhCEzSuu6ML5SYUKIp2zP6+6W796edmHTJv?=
 =?us-ascii?Q?vzcoqll/38DO7k1JGpGM0OyoS0ru9T+tECByc27GGxlr5oisK3moWv77i2Ij?=
 =?us-ascii?Q?g1udt8GAk1LzY5+ubHl3nA6cedv843ecnlc2WpKzTPOz7TJoI0cK1UcB78/0?=
 =?us-ascii?Q?jKVl8rXtqu7S/+qg/ovG2Bskf2xEBW1MjMZLCuzLpz6QBt9i6ReB508++UZr?=
 =?us-ascii?Q?N308P2INkaGEnL68jVvlRhnYEN8ZKYhNahM5HW4OtwRDCr77+eU3U5+pZKTA?=
 =?us-ascii?Q?sk9jzQjDHv0RKBms9bJqxr20PPlAjuaGEW5zk/cKTlorbnULWPc0JGXgO7sr?=
 =?us-ascii?Q?dJfzGUIiho1UKQxD2pbHOFOxRuOa3i3qHXr5OUXyf6wUfUkcxjm953bLbRmq?=
 =?us-ascii?Q?DeEnLEdugeyd8UC0XleSb/E0zH+YgIN991a/NLly2WAaUDAUF3X1uOopKx4o?=
 =?us-ascii?Q?tKf+8IxNEWWC0/XEMISx/Ep4tEnaFWyf7SNf+gGfrnA22Qmg49+sF1jZuRZM?=
 =?us-ascii?Q?hltofnpEeg+hH4sMRLX+lcidnmGjEZp87alDzkYeZ3XyqfuK+Bp6ECiHRUnF?=
 =?us-ascii?Q?hE6m7yJmZl0MGYzKcKV7fZFeoSeyp8waSKTJaAC7Ui6zlQFBCEELYCCglzgh?=
 =?us-ascii?Q?/ITIt5P2VQ2EAGV9P6q7qlbjlwJyEXLCt0xCPnjVFKHfgEzTK0Zssema6qAq?=
 =?us-ascii?Q?p8cLYpqLoF1SsS/eK6whCnKpHhSpKAtjTBmBZ+KWGif/yaZ/LlsJJ25K0qvK?=
 =?us-ascii?Q?E633spconReEfAj3EwyAlUJbAN7kQhKLZ1C4HiBCTteTdF3CXrY2QeRTWorN?=
 =?us-ascii?Q?4JIBerpD7UZAg8RR5nzqgcoLeAUaXX0DyFtISaHx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11823d0-9d56-4ed4-c7d8-08dd722c3033
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 21:20:27.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWQLp27CgQyOd6mCWbhLKO/d7n0RenfdPcEIm2RLtajnsUrFUAvIrQg18H4A3iWobiXjNvKFcZX+1OQZpS1MRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10214

On Wed, Apr 02, 2025 at 06:15:12AM +0000, Pankaj Gupta wrote:
> >> diff --git a/drivers/firmware/imx/se_ctrl.h
> >> b/drivers/firmware/imx/se_ctrl.h new file mode 100644 index
> >> 000000000000..177623f3890e
> >> --- /dev/null
> >> +++ b/drivers/firmware/imx/se_ctrl.h
> >> @@ -0,0 +1,84 @@
> >> +/* SPDX-License-Identifier: GPL-2.0+ */
> >> +/*
> >> + * Copyright 2025 NXP
> >> + */
> >> +
> >> +#ifndef SE_MU_H
> >> +#define SE_MU_H
> >> +
> >> +#include <linux/miscdevice.h>
> >> +#include <linux/semaphore.h>
> >> +#include <linux/mailbox_client.h>
> >> +
>
> ....
>
> >> +};
> >> +
> >> +struct se_if_defines {
> >> +	const u8 se_if_type;
> >> +	const u8 se_instance_id;
> Getting used at drivers/firmware/imx/se_ctrl.c:320

	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware, configured.",
		 SE_TYPE_STR_HSM,
		 priv->if_defs->se_instance_id);

You only print value, don't actual use it. It should be safe remove it

Frank

>
> > This is not used actually, you can remove it
> Getting used at drivers/firmware/imx/se_ctrl.c:347
>
> >> +	u8 cmd_tag;
> >> +	u8 rsp_tag;
> >> +	u8 success_tag;
> >> +	u8 base_api_ver;
> >> +	u8 fw_api_ver;
> >> +};
> >> +
> >> +struct se_if_priv {
> >> +	struct device *dev;
> >> +


