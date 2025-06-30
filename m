Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB1B14A8B;
	Mon, 30 Jun 2025 01:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247326; cv=fail; b=AuFnwEEae+ruz61iJsgKMcR2vrdVPwnRu2vTKEtRbsORmveAaBtF5kroqG0xQAk0hR8MRNSNooMAjb/ufCVhUqEuo+stw9HsKZQaMOOq2lTA4UZJalneC5PSFA1sYe99RjQpDCgQq/sWOU0DKyPiNq/te/7LZ7NX3XKSifPXuPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247326; c=relaxed/simple;
	bh=k6IzetGQxEOiI/uivV7RYxWRRMhJ70x+SbcomB9SKac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HQhetH3CZrgCdmnuPSCUXT/5JxGH2ZJ987T5tdVyg6jBdAVt+oIXXKIhAZ4XIE/ATPcTomiN1YWBd9dvvmfJSCTEbot0TmsKBs5jDC9gU+T3jv3SH3gj4w9mNC1cz+kJa3KkXi7B3MJMOkjDf07Z5EqiftDrWbKz5xsu8fu/ZT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j1yR9EIs; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j1yR9EIs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cjvy9a3Z7/bEB8GxndHiTLRs9YAGSfDbtDoCjOxix6X+pd9AiMJWlnlCp+2y6ZD45jp4fCqGl8KpHaDYpwIhyykOp3t8eGvuo0OvEuFMB+ROK0KsAH1EDkbhSztu1xSYTUr9mu8Jfq2EIFrjBKR+BJ5jRAhAet/3ynb5tdgzMqGjUEp44FkL/hzK3Nh2nEMNI7O9VfMBSOZ+czztVYf3u+P2LCSrKh1ghBstYKVPF107iPAorWmYVlP9dtzuT6JrVxdgtiep6uCNLe4EF2SRe5Dkv2Oc1+tDaErrXQ8FCFgCbqHXtEQiifNULxhNLGe7kJrxRA8lBjJTmzT8HCSeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuF/11qpi3IPCafM3lu241Ytb5iQhGNsB+i0BJIF3KI=;
 b=xqSM+dgMoF0pheUJtJE2iinzzCCPL+AoAnZRMN1GJCmHKtzFOM2Hb8K7rzJlyIiezFObknsiWQmkTZo7FtrmAzlf8suszr4CMFzyVlCV9wsNKJx9i6EZQ0SKOscaXajHIL4zeSnj3xW31yCF+IAQOW2ymcStqF9nlIsULeE2ApdBlR7S839ZOZy6/d1qYwdHOrXPa6OE8HX/ZI1IW6v1zTWYTa96/e6pUJ166pLX3vBKcZQrmzwkOF+SwKRE1bMGqH/S4GQRY0qu4U19IQYMagMrYiHH8sX/x/9PMKW6hmA8ZoGe4b9F5YLHHzrHgoqSiieSwZldO98PdnemEZb7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuF/11qpi3IPCafM3lu241Ytb5iQhGNsB+i0BJIF3KI=;
 b=j1yR9EIsKot4vxhVjvdjTaXLtUteTxfH5HrLuVq6PJMJOE03P8bX7AkXwHddBMQKkD1iWGFlioDcCm9NLT4mXdZwZzVdDafolDdrP1gcn1fwa+CM4Y+yfEIKWS9e28ahMATcoTnNYKYE0Q/lfwuxMuM/ImT561DHqOneXzBzbsSb/9yFUrSuzWbSx6WeksVvPOIJl2r4hOZ3h+G6355juoFK1w6tZtG6VINIZjKqThB0YOGGGG47RNEzUoTXPkPJAi/qICGILfbfcin2D6wok/HwtxX33h74+IkqISUPK7iYyw76CNsyiALXRPuiY2McwpTtF8RVf7dvtwj6ZndO8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7715.eurprd04.prod.outlook.com (2603:10a6:20b:285::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 01:35:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 01:35:20 +0000
Date: Mon, 30 Jun 2025 10:45:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <20250630024558.GB13878@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
 <aF6Si846xCR5_z-z@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6Si846xCR5_z-z@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: aecef9bb-01e6-4abd-b5bc-08ddb7766004
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6CgjZJLAFtyqx4qluFERMl8Ye2JfmAVO5jW2WCdNSyC5zoNad8KHMpN5J5nw?=
 =?us-ascii?Q?4xCaLU+1NjgGyIqB+qFsrGym6xVM4nZDn5XVb/k+MYybSAuDNSCaNrnq+3t+?=
 =?us-ascii?Q?FQiozmPgi8xI9gbcpP13lkdnugl8fSx8sjQ9dJBvy6unNKVAAEeetIQFbYat?=
 =?us-ascii?Q?gDSr9lbmyUUapAZIMlqHY4kr1pdjANblcIrRBW315iLpqn6uXkEolzH6skS5?=
 =?us-ascii?Q?ZIZnoKIKK6XNsJ/Oeh5T305nZ/M1jrWxUavPper8GzoC+jzvbvNYptIPRoa3?=
 =?us-ascii?Q?A67iq1vN4GNXBU9HfDivlp75ircftPoNGgqpGmr5SiqG2IGyeyLGzw0Zn+ej?=
 =?us-ascii?Q?QdLOzd4+1fNxFpxxRTjVnYdLCrQxlxrFn9tjNHDtR7mrbpb47zm7SJYV+dIe?=
 =?us-ascii?Q?x90v+y1BLAd7EYOukEj9Raf3XDqAjdiJC5WKRD0niQKtfzLd2mUyfJFTHtvv?=
 =?us-ascii?Q?BSVY6zKXK8INp74BW4WzXmXhLSYxxN2VphrdZzHyeME2vDWZ77KxwceuN4Po?=
 =?us-ascii?Q?J4MVAiasQ5iN74OkJbqvz4Alrtm5o27NEU/zWNAQBV2vgKstlgHafs2CG7dX?=
 =?us-ascii?Q?UD5I0xnSCDs/U46iu6LLr3zk+YGbPqcIkQ8mRN+R87pg3W0kWjEvTLPyji+p?=
 =?us-ascii?Q?ND4mtRjJ1f33WdLYSAacuKmOkb76zHVJUjKPhRU5/1/zddnPe1I2Xj7+h/Xc?=
 =?us-ascii?Q?XiO8Hk4bfnI2l3rifvnM5yra8ZToOPi5IoEgAselD0R2BtHRWiOiwlvWc4Xd?=
 =?us-ascii?Q?20yaamYlKEKjCQ5zrbTnpSEo8gT3Npn7cODlBZLpuEujgtDYeNpvvrCYMlGZ?=
 =?us-ascii?Q?+PeDgeF0k0lCHjL1KyNTBa4Zc/RwG9CeQI/9URy85LvFIviO6HfkMmSLP5v/?=
 =?us-ascii?Q?ojgZYBlC9JxTILKFRwMETzgjBORzCh7nTV2Q8XvvfwNKP40sgRyUt6woDukx?=
 =?us-ascii?Q?NodePys/lWwudkfBf5NniwF0hpbmGlKmiA6P20/pGqIVECvQXuX7QshQ6MbQ?=
 =?us-ascii?Q?p9pGLfg5xfsitJQbXymLiMob+aVrWR+mGLoryZ8Rr1QI2j8NaJy5sJZzkb6r?=
 =?us-ascii?Q?ipDDfAeHKHpjG5M/rWLbAS7XD256k3c9K1JTma1Gw9kdaE/VyNl7YxQr/2M7?=
 =?us-ascii?Q?H952Jgo3KuHIQ6aDKtaTjXlttRaXbu2sEFQV9afRWvmbCjkXunitmhQF25QL?=
 =?us-ascii?Q?U1W3UyLrjZdB7uROzR1jUHzIWXnl0D9hqzmf7oz7IZcP0iR8fr+SGgzWmB45?=
 =?us-ascii?Q?uPpKx7xvEqls7Ibt+zJgQEGFQmQRsEifodMzkfbZj3965rGkdNVHskH+Hiry?=
 =?us-ascii?Q?qBsNeWT+CMb6H8koNBXpsyMavKVeoczlyWogEnwB8WXtDTr8ISYo3ziaN+bT?=
 =?us-ascii?Q?ljcu1XRjzREXXm+buQk9CK5c9v7BP2nz0kIvv6trd9Sv8ZRyeUqUxjlRw+b6?=
 =?us-ascii?Q?QyfekdLzb6Pft7//2YnTG5Q/Z5jqRaF2Am1ayQFe3sUQWUpuWadb3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FdlB2j9S4ZEigeh1xLzoUvsXbdNEBHi8NYKHD+WlVNFO6/PtmDWy+ceg67+7?=
 =?us-ascii?Q?q3iSpA5R23bLCcLjhdT444RTVzB2LIeY0S93ChMIv8dRFGrPZd0xOw5yi7oV?=
 =?us-ascii?Q?mWCJ6PjwtBKfEcQnX0/1vZp3+YmSwhRE8He788Cw9tWmR+eoC0pVkMq1333r?=
 =?us-ascii?Q?i3DjFjpdVmvDk3y3f4fa2DKbItKME7d9cfdantHqIfTeSfEqL7Gz8LtgMIHo?=
 =?us-ascii?Q?VkbSHlODvU5bFXHNSP/hnHcSajJyD035X5GJ8TwaV1l9CzWGfdyaMMf8zkZf?=
 =?us-ascii?Q?nySdXRIAVtr0AcWqG1IxErtril031fQuJIAk/X7xHTB/fUej9Vccf119/Wk7?=
 =?us-ascii?Q?Lnjlm0oQyrsE5CjAb3t8+IYalwovl1QK4wVpQrM15ktVs1KmLMBv72nX9H1v?=
 =?us-ascii?Q?3DogIEi09qf+blfyarJDCf8OS5e744a5gTmjNHAYeLfHFDiyPTDdY0x0yBT+?=
 =?us-ascii?Q?GvpWozDWADuLjISxPReBY7JoauJpnG2guMW+/KHYMSmUedtM7XQ1p8xw6KHb?=
 =?us-ascii?Q?XPzPdV691mkOTuhRLN1TMwIOEn7nDgCamGSkp2CvNBXOw3oFrtJrQf+RQT3g?=
 =?us-ascii?Q?i4Gqu6G41IFnk+RNe2N1GqwSkLqulHCMg9XA6v4GS4LBCXl7NXcv5IU7Qlz1?=
 =?us-ascii?Q?NtaTJXMQ3egWtudoB8GYh+b/F3ZZWOZHilIcvdZyombxvWJtnkUIqcprCssv?=
 =?us-ascii?Q?b1HwpnAYQ3bp/slgAzbmvOWMJ67RGZr4Bmf7WqsK8SUPl83/NE9CzP/VRmjK?=
 =?us-ascii?Q?dS7qLnw9no8dN+ASWVzcjzGfzoLOmcHXCGDBZWMW0zI9rqf/TSq30pq9HyyD?=
 =?us-ascii?Q?QVVdVpcA+nDJzY5H1ZVHd52Fyh5mXM9psBeLsla8u4kr4SmaW1mD/0nOc5Ox?=
 =?us-ascii?Q?0pSgbsYFEoCbqnTj2NLbbQ7mP1Qo1DqmqN+GVKNXcMPs43Q4LudZgUdemSI7?=
 =?us-ascii?Q?9tF4zBqX1/8jH6QiZsldoHbM6mBI3yMPvVKPxexB9le2vJfRxT1NPpKqaGOE?=
 =?us-ascii?Q?xKs8itZo8PqA/6O9TKae9e+YYxTdP0CQi+TSvRKd8Soi2Ze+051UCMNpmGez?=
 =?us-ascii?Q?XtgUlDIsunKLB9kST7bF1DxO1IEo6ka2Gw86VwU2PjiiKNrsaf1N98JsBTRn?=
 =?us-ascii?Q?28bZBEXiGiXVOfFS5BBQ/+Bcky+20NUrKHANs12r7b+mOTc91zKgEaNu8QFa?=
 =?us-ascii?Q?hQzUcJWU8OG7RaZbVZ82xKv1D5wREJVl3z5ji4tb36gKy+gEhV4OLPtYFzty?=
 =?us-ascii?Q?+670QjvcKDkm1aiSX5eqk+4Ijv8uhMvq5gcnaILqoubsfrCnZX+UjK+Xya+j?=
 =?us-ascii?Q?G51yk43H0wR4OL2i6P2aBwQ8rWfafOohUiYxtqPZrh3iLhrjtfgp2C0q7Mh4?=
 =?us-ascii?Q?dKp9sogtkJcDnzmOCt6NxXPVGJsfDl3BWaCaisb+ljbCtcA2KmZyw+jf3RZ5?=
 =?us-ascii?Q?k+JQvPto+tKyMNiewiChqkHdOCVUEsmgvpomywtotfG7aa8O05SYSZ11zFmD?=
 =?us-ascii?Q?85T2e4BzqyE2I+U2lCxdTOdIOnJTVGXepJgSv5fApTpmK00+KrPMoGDi8up5?=
 =?us-ascii?Q?tgXY2xxS2jtU2hA0Bg9+iGoIHiNjGVyrcNogCDSC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecef9bb-01e6-4abd-b5bc-08ddb7766004
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 01:35:20.3977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB0uzbzQfuNqOiATyQ0Aaqdok80PSxdLKUErYXELIUqSzrgC2gabQz8m//s/j7RW6QZRGlTGZCp97MMDUAaPqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7715

On Fri, Jun 27, 2025 at 01:46:03PM +0100, Cristian Marussi wrote:
>On Fri, Jun 27, 2025 at 02:03:44PM +0800, Peng Fan wrote:
>> System Manager Firmware supports getting board information, add
>> documentation for this API
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> index 4e246a78a042a79eb81be35632079c7626bbbe57..ac82da0d1e5ce5fa65a5771286aaebb748c8a4e6 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> @@ -1670,6 +1670,26 @@ protocol_id: 0x84
>>  |uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
>>  +--------------------+---------------------------------------------------------+
>>  
>> +MISC_BOARD_INFO
>> +~~~~~~~~~~~~~~~
>> +
>> +message_id: 0xE
>> +protocol_id: 0x84
>> +
>> ++--------------------+---------------------------------------------------------+
>> +|Return values                                                                 |
>> ++--------------------+---------------------------------------------------------+
>> +|Name                |Description                                              |
>> ++--------------------+---------------------------------------------------------+
>> +|int32 status        |SUCCESS: config name return                              |
>> +|                    |NOT_SUPPORTED: name not available                        |
>> ++--------------------+---------------------------------------------------------+
>> +|uint32 attributes   |Board specific attributes                                |
>
>..what's in here ?

It is 0 as of now, per my understanding, it could be to any value that
board owner wanna. Anyway, I need check with our Firmware owners, then
update you.

>
>> ++--------------------+---------------------------------------------------------+
>> +|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
>> +|                    |to 16 bytes in length                                    |
>> ++--------------------+---------------------------------------------------------+
>> +
>>  NEGOTIATE_PROTOCOL_VERSION
>>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>
>..other than this, LGTM.
>  
>Reviewed;by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Peng

>
>Thanks,
>Cristian
