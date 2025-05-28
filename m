Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013034.outbound.protection.outlook.com [40.107.162.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE04217F56;
	Wed, 28 May 2025 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467634; cv=fail; b=Wp0zWXk1wqIsCI+Lub52+zZBzfAgGSPVMfJTwbN7JvOc6gG0jeENpHc0ABP1FrnydI5eFc7r92+nxbXL1FobUSWiALPZYqXV9Lg/4709PwMuh3sd6eAt/tbafUFKC551fgWfWrvM7R2hAWbRXM2nHwFQBoTEWxRwyp61iLUcvuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467634; c=relaxed/simple;
	bh=cnUVuGqG4AvZbSFuRnseBPS+m7m3TjkTQ/CZneCKKOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k+EoBkjcg3gN7BNAKSpE/Vg4ptWoYV34kA7RdBYw26tvZuVNqq3tRsAFLiVuKH+KDMkax8LOuGx0ve/ZoO+2zwUKO7g7n/XKgMSFIhO+FsSezenklKFi5Un4F0K+ZYCYfzHT4BveY5VIqRxW4YZ0enEGp0KFITLFWEn1Xo6fAfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=du0BDBYB; arc=fail smtp.client-ip=40.107.162.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="du0BDBYB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuhWjAkpzekPFvCgr2uY3L8yBKFGMa/SxveBb4oKBBsQKIXINpnRATPAek11G55q/oPr1NaK4v89kZXDuo5JldAXX/kgCwRQzkmGOrrfo/wVy4TEWzNlGCqXpnD/nJhzZB/CtScUH14VeGql7sgWZddVQQsPAnHF0xMr3Okp2NQ4zgdeROT4Xf9xJVai/leBcG43UEvh5sOfw0w3d+u+SqfdyOSFjy63cRvz+unxlYQ6f89uqd7SGYrA48nPIPjV3hsJCkr2/jW0L9NB0cQdwQaXSPkxG0iC9XKRF6o0smnlsakJF7K+YvBAj2O/E92pdGIbPaDmyjFAhqhE/F9yUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auyMPcc629dAK9a+jKzb6d1UxeFdCDyOCswZjjLMer0=;
 b=LNUABe8/F8jZo0STMxHhxAKL9I9u3UG5kB4TBDq9mAXWLszNJIvENf2yLgjJXm/wi3dF9PIpOrJqa74C0l/nT3bxOC5hy2jA7chcv/NBPn+C70s1xgrJhPO9mhkOqYXGv3BUUoUgL2PzMglNQqBSFUd6lKeNqULaxNDb0XjkKwiyTIuF/5rMNkAy7PzEtuPrxiu8aUyUMYX9316Ni41uwuYWIG0mT2BUrmcgrylVNvpX8tF7++T1LQ0FcjmHHaR4eliw94wRZta9fz3BWLKjBZu1d1odqxyzTzBMGhlWkPaZ0Tosn85E+PimS1DMRw7g6uMKBZr0biGtOPqvpIrhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auyMPcc629dAK9a+jKzb6d1UxeFdCDyOCswZjjLMer0=;
 b=du0BDBYBiehQDs0pflgYdX6ftqkrsWI+fzt9ZiE4ba+LexQdzsLJHQ3ETIDqCtyuIJC3SBbNPpRZcsF4LUKX8jda/hTN5QfY2oIkMggHYjEUvgAkB6RjFbWx0G9fJlS6N/gYX0Lo+K7GLMVM/YAJcLkcM/6n7nH+j1wGCyaf8DBNZRjq84Cct+5i9TJ0QCm0cpzB4Oz1gPdQ7Uf2PA9rYFWHmhOIdZY0DIBDb1njVI+aYG3ZyrRA/zlhuXvyyWD1W3zF6Ovw+iJ8O41sh4PtkmRNAa5vJeOCBAoTrZyWr8dO6uoth0CEZrP3OZaLEQy61837yazfhDBjVyyPi0AEIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 21:27:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 21:27:09 +0000
Date: Wed, 28 May 2025 17:27:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a
 REINIT_DURING_RESUME flag
Message-ID: <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: bce559c2-0fc7-4ab8-065e-08dd9e2e66e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hKEgBY3Nn68voOtp3XEZLjdAVJ9t3mtbxalu4K0OfD5RJxtgWnrqRYVGPaai?=
 =?us-ascii?Q?yfurd3FbZph0vdS1wnKL4RqeMl2kyzyrGk+miTJPVSLVhlPkO3KNd4Es7UC7?=
 =?us-ascii?Q?C8fK/D1pcCVvRMTWJniB3K5Q87PrbDpuprkmCgXfQidesLiRYTzc7bokJ/fg?=
 =?us-ascii?Q?53QEz0bn38ZT09TdZLfQlkH2oXaIQI2nQnAiA5qznC67N+erRF+N194iFdkC?=
 =?us-ascii?Q?PeA+NFoRnwwN93OsHPUUCQSpD1PgFMbeHbKFSk/Fg2y8JKfe15HN1TeXyqgH?=
 =?us-ascii?Q?4C8dREzj18MCOYB4aJhyHZiKVa2wbpkkuOE0n9SpVWibdaY4h3AuhMdjMgFZ?=
 =?us-ascii?Q?R4TpBRJUN9IvoOGG8GB/zFGSNC6vyGffU9ZQvsFlYn9WcyirYGOH929mvvqQ?=
 =?us-ascii?Q?tmQQihAgA2RhqaMIludjR06y9U1MLrkB11kCX+oy21CLQCIMN3PpXRozD5l4?=
 =?us-ascii?Q?rqi60Qd5hpQt6aLKs+PCajQjgcboMUraqmNU7nnQXK+C4pyy6PNShP9YQMuP?=
 =?us-ascii?Q?9afE8bCuoiLEyaBDDl8De23ROjf8/fKUAal/nhyNZ9IH45cOjVayIWZvhG26?=
 =?us-ascii?Q?91HyiCSmxz9R1wLmEXHsYU3dzob33GuYBi9JMzeOFpa0xgawThG19J7ZYMpD?=
 =?us-ascii?Q?sQ7yKy4lXtiFDMFVbmvHxE0E4k4mC9HC6GW9Oxzhw8MxsD+3jC6LF9rJlyp9?=
 =?us-ascii?Q?f1qcMOMmdHtVaCXvWKYNZfrvKvDfld4DogIs6GNsRrOirWmZEs75EBq+Ayzz?=
 =?us-ascii?Q?rr8vw23GTmYv+UeBBOOf3VOLmMSVE1l2TUNWOtvL5qacp49Jl+tZyQqjJZaK?=
 =?us-ascii?Q?nO0SC8dweuSI+7Zh2wNpy5Vu6asIO5sgZh3816rAJcq2pro+F4Ql7nWWjMZy?=
 =?us-ascii?Q?uaL6WO/FKs8j8q5sWglDwYDmqgehVo5FfIlSKuotguz89SJvNLXVmXdU8wtx?=
 =?us-ascii?Q?pvkn8t39rOErt6NE7z8VOlL5Vq5rlE1fMwWecx9BgfsOYOQ76jdZjxdZc/c6?=
 =?us-ascii?Q?taX6Flsj3hGvxbIdgw25ZZXxR9EhOLOekPeHSPdoaHL1rs2M4LUd7Dkq2uzx?=
 =?us-ascii?Q?cOcJzEEE+gK9j3mnYc5UjB7cz5qdStRstHWJP9kYpik6hP4xQJYeXcmasfNg?=
 =?us-ascii?Q?06oSdaK2C1Is107M/ZkuWbBvmY45e8mb7QOyGjiOVOF89PPEnKtryNkltQNF?=
 =?us-ascii?Q?b5qgWxnXQ2ze26OCHPOcA6Zelv7OAyf+qRB1jZjCCSHbnz0zVuv4WUrZLc+C?=
 =?us-ascii?Q?oCH5/FXjMpe5YbHlOm7R45DR1zqoOD6hu7zarJmGxRitGOia6dHPWTplJBfD?=
 =?us-ascii?Q?HKSENzlCO+Wv0/5idp4ICD0m9Rju/1AxAz595zDMml7YZtPHNs3QsQZ26qaW?=
 =?us-ascii?Q?nefORS+aAlAgojJbIBQ/dbr0zsFW9dzC0R2JEIa0LDs3HETWvg/2gJu+J5/l?=
 =?us-ascii?Q?Zzn5oLNv42ydxPMUMnc9HePXLlS6L8F/RseR6xAT5cbaMiGfwBtpCn3X+yTL?=
 =?us-ascii?Q?k1I315h5VD8RsiE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2mQDkJXMXtbNSyNebbPbx0rwqi9EWG6eByFvkzmGq8PfIfYF0WTyAX9JjLVB?=
 =?us-ascii?Q?ZiSdn7Z+5e8kn6mxu7V6Iz4HD06hKq6mqzf2cXNByekFxhwLZ1ooscxGUyFv?=
 =?us-ascii?Q?ySAHnPMRzVZdSxr0Kf14486gUob9WhA/53ghs6+sYZ0T1Z8jbznMYS/DV3PO?=
 =?us-ascii?Q?85HoqmV7zPGgZexO8h4UaAh7HXCxR/Sin4dxQv02/th6DkB831rukXvZZZB7?=
 =?us-ascii?Q?UGRyH9oiuu8wp1WXKwQ9W+YGNv05brHWaerS0+cD5E4oHxcsJuZSOuPZJAS2?=
 =?us-ascii?Q?zdDZqkbFQcKDKhicdRHs360mM1itoi2GjU4wIHPx8WPuqzj/IDifjrauZdBI?=
 =?us-ascii?Q?U2/1rkfupm6d8BkTUE4UXFhTVqAxd9iHpgOlMLJLW/q69R+uypgOv2aMj7JZ?=
 =?us-ascii?Q?6Ix6e14yuqzmgs7WaMCZspgKCAzsTV1aHEHnxDU1VBvJzs4YnQSdMvkcF7Xq?=
 =?us-ascii?Q?jFWYTQDUROU40kAQmBYMvKNqYoxS9L1XSPz4SlF84ReX5yVSfdAevYZID/GH?=
 =?us-ascii?Q?QWJXIgM21XcESAmnySSaoPR7dTuIMtb8hWhCjxog79QyJNgV5Kf29Rqm0Mu4?=
 =?us-ascii?Q?XJgrb2RCz3Tczg5UJxhA/HzuXJVdVMYitvLCbqYcmhyN1ZQWjvDR+88G05tY?=
 =?us-ascii?Q?r4uaKW3t1jMcKer4AOQ9n4IL769tKkFkSmOtOArbSKgXvO6wIhM3l4aQmXMv?=
 =?us-ascii?Q?pC9g0aDlCSofpL5CWNIPom/v1wWAWucqyldopohepnIVQrM0DcVAR87H9DW3?=
 =?us-ascii?Q?YbGVo7oAO1MIWkB4eRwwgL4gfwI0HFjefuC1BiuSzMdM4RqwfVsTAeh3MjZJ?=
 =?us-ascii?Q?sketMwLbQz8aQdEw7xhR5aLKzRf2xhxIKV+vB7+l/GEZVz4PR1pElD4tZSUo?=
 =?us-ascii?Q?fW9jmO95PG2RIWyeu74VPbCMnarL6NvluwCQRe9UvkenbtF1WhmHke1hbUdK?=
 =?us-ascii?Q?ffaObk+68Zm1PFU3hlQFo+RLe60ykEoQxbPmU2b8W5UMcC0DQSWfgUnFpFMV?=
 =?us-ascii?Q?gsTdGmuFSkulwihWr1Wl35PkQTkURIyQA+5y83QsOxOuqxAewwdW6stxuuyR?=
 =?us-ascii?Q?ZhlwaHQfYMhAeJrGfk0rQjS62HbamR3Nl5lDHVYPr9Um0KE+zc0ZsdVhe7ow?=
 =?us-ascii?Q?uXin7STUCdkEVaOxyDmwW8ctGqZxOrNL7Zh0vAbfVOSbpSPed5c2Up12ycgn?=
 =?us-ascii?Q?zFkyGK1SG/l8mm2bT3HWxg5N4hwZGrL+Sf/eDl3B/97J5ctRMrNSI/+HYhYD?=
 =?us-ascii?Q?q9V5S+45jYpw0IL3NGiEqF4MdPThx1yIUtOUzRhiEW4av56N0aodALS6BlUA?=
 =?us-ascii?Q?UW7DBIt21WMscK7L8NLmTpz5/137cs6KHAPF5Z0g0ESlWd8lUkGg6WUseKIo?=
 =?us-ascii?Q?kFuGLrAkE+itcbCVhv2ZvQ8ND6JNzW0iyOTQunVYeRVBc2b5Kmcc2DwIYr78?=
 =?us-ascii?Q?YkZU3p1hIIOHnGkqcZNHpSyPMXfoaCsmYvg7iBFvGeUUhWA0bNls1FXcn8TO?=
 =?us-ascii?Q?zx3r55GivOuNXG62nyWcVPKUiK0z4uMTuBFCCK3Td9eJZUrAQVIQqMj7xl9X?=
 =?us-ascii?Q?UsGyM/3qC+ETskPehqev3PimMe7Vbd0rDX8nWuBU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce559c2-0fc7-4ab8-065e-08dd9e2e66e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 21:27:08.9747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPtatODNelVa0tS76s8KqpL6PKaqdJZYV8L8PVJXyA6NWLliAljw6AS5deA4RvPPIXQdlsdRQ59o4mGFHwg1Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9351

On Wed, May 28, 2025 at 10:57:20PM +0300, Dan Carpenter wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>
> The s32g2 and s32g3 chips will need to re-initialize in the resume path.
> Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.

why power_lost_check() doesn't work for you?

Frank
>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 118b9a68496b..95759a4ec60c 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -155,6 +155,9 @@
>  					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
>  					 BLKCTL_OTG_DPDM_WAKEUP_EN)
>
> +/* Flags for 'struct imx_usbmisc' */
> +#define REINIT_DURING_RESUME	BIT(1)
> +
>  struct usbmisc_ops {
>  	/* It's called once when probe a usb device */
>  	int (*init)(struct imx_usbmisc_data *data);
> @@ -171,6 +174,7 @@ struct usbmisc_ops {
>  	/* It's called when system resume from usb power lost */
>  	int (*power_lost_check)(struct imx_usbmisc_data *data);
>  	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
> +	u32 flags;
>  };
>
>  struct imx_usbmisc {
> @@ -1266,6 +1270,9 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
>
>  	usbmisc = dev_get_drvdata(data->dev);
>
> +	if ((usbmisc->ops->flags & REINIT_DURING_RESUME) && usbmisc->ops->init)
> +		usbmisc->ops->init(data);
> +
>  	if (usbmisc->ops->power_lost_check)
>  		ret = usbmisc->ops->power_lost_check(data);
>  	if (ret > 0) {
> --
> 2.47.2
>
