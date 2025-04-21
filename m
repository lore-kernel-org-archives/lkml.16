Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92AC38DE1;
	Mon, 21 Apr 2025 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745258316; cv=fail; b=d+ra3hhA1XFNRlyRwYooyePZVHPdLD15xE+hxELBDTPW7c7Wyr5jBLTwi0WMluhdYOeailN2z0COD6SNIW2YrkRnX6qV1N/t5+cpDgKlC1k9VUUAzSUcTRep9G3ENjzICrMeqPlSQw9wl44tR4Kp/E9t0rvdYefICz8aqpXm0Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745258316; c=relaxed/simple;
	bh=hRY9ynWrMF7JnAjfx1NwM2SOK+pPU8VvC2TFoPv4Mjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BfdSNhAiGf+Mo0zT+mrHS6662fj/3WVvRQRtmGxEPQxuOkx8yYR0ki+T61aQFQP8KLtMgayLrSw6f5gxFu+2ab95wRMOSVFyY+2W9v14bQQYhcetq8mrmYj2FbPJlJ5ChllPqEFCi3JBDEFTKxFxV0cGc9jpN16qBT03skGnMWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jKJkyB3a; arc=fail smtp.client-ip=40.107.159.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jKJkyB3a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9c4FHHldum7Mi74ZhsgK5utpJ1WBv1IYkO04PoAfmyhsrfuGzd1xJSsaVP74JruFaFtZOeu/XfDoqQmYSY8j0q9eXVN+4H/o71qvkeRRtwK7aISlcSKiihwEO9SwTuSVdCY3KVWzHL0epdCkNjfdQ1T+yuFwh7fNKFyF4qA8YM4fdEJu6HbhW+oOYg5gRYjKxsAaJiZFMSwHD+5QyJ4fvmfibXwFa06D06rS0VsakaOyjBIbMfDNVismHCpvdHzltoiuxDRAF3KpQDuFUx5NQ0fJ2pc9rlagbzgjh4gvgyND5n6cmvVLsW0z9l0i1h6Mu9JT65aPVM9yINSchch+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyLOA2erkKM6nmDpTyIoevqSNDnbZ4D4/emCBKrfUdQ=;
 b=Y1j9j36aJSK8g+McAwNau0t2w0AxA3LabC08uQfcrz5+8XoF8QjYcQ8H/J6f2OTjoVhAWj2pvdVBf6g2jOsaCmPQwgycfq3bW1TTwRWwltR2DJKcWvL5mOlaHZ8ChYdY+TGYdCyA9dlBBcz4X7PnjDhymKIhpozCjEK6jgKSrYnBR8nLbLvit74ins4grlMMDmHe/5RLiO+6UJbplX3sVzM0Lo1Fgd1/VEU9lu+f8DfJd94CFKmJtUFAi1LdMCkt5SpM1n7fG1Ku96vIGW1z44GrTIV6aKSmXCstKz9B4ApGFQJse+RtGnD+pVFWU7QyZuKtaPbkru6SZCG3Yg2s/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyLOA2erkKM6nmDpTyIoevqSNDnbZ4D4/emCBKrfUdQ=;
 b=jKJkyB3aYUmmOeG90u/irzwQGCVej1nCSPUWJFA+uM87CwvkpOV8vttKkcvJIOb4t9xpBRxgoe/6x4ZvfgQ09mA+6ofhonOj0XvV0aQSuMJjeI5DSCvtP+soaDbEVfI5VPUwkdV9ffWfc/SDULy1QV6MCyZn4XrcANCJu1CFyQ5IDS+gOQac6QWK9HpQDDntq/C56ckMhmub4XVva1ZFISAHFI/oXoGJB8RvSYtqpXiTzL7QwpB1f7ii8K14juj6NM3gunO8FSSvXDrJ/BBe38ENyjfNohp+ZyuAQc2LibDA+QsZlT6UPo7PPMQwYTiyNeRfltvh4aISL6kW6MsBZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 17:58:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8655.025; Mon, 21 Apr 2025
 17:58:31 +0000
Date: Mon, 21 Apr 2025 13:58:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, conor.culhane@silvaco.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/3] i3c: master: svc: switch to bulk clk API for
 flexible clock support
Message-ID: <aAaHPiuR1b3TI8s+@lizhi-Precision-Tower-5810>
References: <20250421111513.2651797-1-carlos.song@nxp.com>
 <20250421111513.2651797-3-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421111513.2651797-3-carlos.song@nxp.com>
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: f63df1a9-5224-469c-42c7-08dd80fe2061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G0eVc4QzyI0AJYYkIA3RaEaI3HdnOhWAHDjzIE+fkhxRIIeSXHJo0YAHqwqP?=
 =?us-ascii?Q?hvYECST6AO2agaJtt7zRjxd6QEsXAEmjujWpoOuNl8vrC4QrALbmkiBBDff0?=
 =?us-ascii?Q?ikzGwqHpVPTySLpE7lPol9mUVqHmYYN96vSMPeZeqo2vMzdI7o/PI/nty3i0?=
 =?us-ascii?Q?xvTngXM4SfIs3Ub8OL9wOk5XDJhTzyPUvvRDRgcbTe0+v3huvEo1IRzigYtu?=
 =?us-ascii?Q?Bgl081znTIUxqZ0LGnYaOJ6CcjmXQiIVi0Xx73xxjA0S30E/rPfosozdFcZ7?=
 =?us-ascii?Q?epH4bkbz6Y8TDfxJiq3Lw+oZeA+yA7jPA0aliocdJhsVrGuSAYgBibIH5PMn?=
 =?us-ascii?Q?J4UTmZyMNT/GvIsi+ES2S3DLiTr317K83AdjDjiM1vXUR372j22BJMh/OXjM?=
 =?us-ascii?Q?ozjm7ofWvsQLGHPr6lHZwcnxozh6VvDJTVkZW4f9xDf9FopRNJX/tWxprTzu?=
 =?us-ascii?Q?5yvCpK5Duhb0xbk9l1XNwl6sptHDdNnqIfTJ0ClY9yuYcnSD+eyrfNdMmZ3b?=
 =?us-ascii?Q?YxoLeDeHlBZSFiNMxBjpp8QdCDDwWH4K36XX5kyFcdE07jBqw8IDimsvpvQK?=
 =?us-ascii?Q?3m65WjA8W5DN169Rdd++OISaWuoOCbfFmZG1ywfM41iy8aodpukKneeVHewd?=
 =?us-ascii?Q?0duW9x31XN2b+4uv09m6HPBniF92QFyf2lgYcatasnkcXl1xT90gy17fjK8c?=
 =?us-ascii?Q?LALHERitzwjynRMYxsocZikQ8xFFLDpXubZCSmUvlMFEKwo2hwkLJwNWpGoJ?=
 =?us-ascii?Q?e5wRfhpJCKkqLMdh1Jcv6woJWJVfLcQb7mvuE/AmjcBJxcMv0+ybUpkLU6G+?=
 =?us-ascii?Q?R2OGicpgggCqk05tsn6Zp2191/v7O66U3J6yqG/jX/TR2yGSCvfkLZtqPafM?=
 =?us-ascii?Q?Nz5J3+oCTmiJRbFbZFGfEcX3nSzdcQMAvzVy7Z+AlA67h1f4GWrDktHBn0k/?=
 =?us-ascii?Q?IOOyCgwD9eID0mJLhlUvCD417c1DA5uqcTGwXrfrlo7uYk4dCYkc9MW/MOYT?=
 =?us-ascii?Q?P+aMJZkmygi5WvQTNL2m4vKs5vzGv5HwAH3YYzvojTDMdO+V1sjLzFDZAaQO?=
 =?us-ascii?Q?LCgFkPVZfCRl8N2FM3v5/Cbw0WDRig8Y67ENPbQhIzT5GsqJiCM1sfiQZLuC?=
 =?us-ascii?Q?B0vbizBawWfY5xYmCjhZg4/9C22hRdlb6xQJ14clBh6GGKOrDXrhnGmd6ZIS?=
 =?us-ascii?Q?W0a3lFlqNGIVb+hPuCN9rEcPBjcQo+/WxqAoemgpRnAhi0mq+Xb7CaNAdENM?=
 =?us-ascii?Q?sOB4ATkMtgLsxzzuomhEpcA9SaW4OsETs9hc1Uu0JZ82/UyhqB1WCTPmb2Yp?=
 =?us-ascii?Q?nPV/K5rqnGBIUVfwBBPot9lV8srwt3Jpg0pa6hbnS7pifucrqLhIUER3y2cA?=
 =?us-ascii?Q?RMNLtf+mJZQIBNi97eido7795q8dRnIUbccl+PCzIodZP1vrHaMFmatKGs10?=
 =?us-ascii?Q?Zrvamy2Uahwf97Tavj5gmjsokBdQxD72S1rDMlvZ1fYb47o018eXxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZhWPXlmKl22jI0H3hRIORU1mLRP2u3+W4c3wGGe61G+1EUrW+uxEmMqSa9Ww?=
 =?us-ascii?Q?sQO97Z70jsgrjKyJc1gQyrR+30j3cEoknxxb0Q9TahiyfskemhShhyu/Q/Sn?=
 =?us-ascii?Q?QhuIv/v9piEUEzQDBlBW4azyAMuM7gTeDexdLywbUX+3DmLlZ4V4i1NNeEMP?=
 =?us-ascii?Q?5roQQJoDSBtnGwlCfgSGTnyjF8cO+m0Gv0qV8JZ6vfGPUR4TAgcjlGZaw59o?=
 =?us-ascii?Q?lwwMs2jKeieDJf+CwW6J1R2kEJnUfmOj3uvR13ZR9ogodbqdiaHIItnwsOly?=
 =?us-ascii?Q?PR153hksZAQzCwMi2EtanDaEDlJIpkYIEaTyJdDggU+L58msZefLWH2a+gaS?=
 =?us-ascii?Q?Xd4Q7IzAO6i1F/4ZNhZ6kz4bUFeTzxPrMCDA2/t84pmdJAohN9J3+eGXd6yh?=
 =?us-ascii?Q?h5+DSGe44e/iAgbQqIZy93Fcy4oNNz4yEItykF52JY0HjZVPqRodIeiRxuFv?=
 =?us-ascii?Q?z6Kn3ghxYXf2qeDdeyUBlUZBxwXSjeLRA4+GsgV7MpO402ujTmisN7gIATnr?=
 =?us-ascii?Q?hpTNy1Tz57x1EwHj2WzzAkXwO2FjbT1CqvP+/TnOaESqecqY+mXpz3DHOAAU?=
 =?us-ascii?Q?HeiDh6f7UWiKzYhOBYMnUWRyOYXDyYnYAoS0A8rNanlturVB1emVJk0LpfKF?=
 =?us-ascii?Q?jzxB2ZugrVukkQtgdPxd7W5lz+nJ7KgEBgB61Kp6H9k4xCdXrPzH2W5qzw4M?=
 =?us-ascii?Q?Sx2Gy+f1GI+yU2WwFP7QUTS9dp6iYBteTucaSapNaRn5NylQp7jTUkRKB637?=
 =?us-ascii?Q?bUg5RTBUT1dvEdOdcNuFY0orR3J4cqFM7pVQ8Kxa01TrxvsHxDLjzm5S3DEW?=
 =?us-ascii?Q?tQ9ewU2b0T5mSUizsD/KtZMdYc2mkWQ9y8FGjAqNjhxwIFHDQoZ5QnCXLGKl?=
 =?us-ascii?Q?Bs/HsajsvyWxn2pGKfZXPKpPVhm9zoq039r/sitWiMqU40BxuDfUfYa5sxMs?=
 =?us-ascii?Q?8hCrpvepc0IuJVbsmn9LkJU9gO8Ez5lp88knleCq92Xt2OLnwuYEMEcqOIFU?=
 =?us-ascii?Q?TSem/PKwP9U/BTsTrqMP2PQaNneBRa3uOWQsps4RhL8smWVR7jKiMxIJdwFy?=
 =?us-ascii?Q?e6EEEu3PXMtMNYkrSDpKzOdvt7JXy0Bjlt0DhIhasOFuXPPeqHjASWW94NPW?=
 =?us-ascii?Q?recChUy4L2uItW6KfkZl20ZR0rbujft0ihuG9xJ3QirglWmHQujSbyiasCIN?=
 =?us-ascii?Q?lHCV6CmE71OR72tg1TtqXkVFHCn9PYE7UGgb51yq97OUCj96hf6xGsuIAVSO?=
 =?us-ascii?Q?DcPyvNjN4bVipoZ+8EoLZDpwq8lERCWbF7NiLwKNDLd5VJUtob6+VCe0cquo?=
 =?us-ascii?Q?XaWSPF6VHZyxp2Kw0VWOgGkv3iCnSRLbJX+/y6KcKF5EBm3l374Bg8bVxdMw?=
 =?us-ascii?Q?9sQ+DmllSyVWswFrFj3pnIkpZNQBYujuyKHQQibXJKvFKCH8uWbdf986aeC9?=
 =?us-ascii?Q?3AYWQRfMkTZCmomb7zPWLcoqpLfy8b0mp4peprQ9N43pIzr0G2BVCpmTnnL9?=
 =?us-ascii?Q?J7QtLaSzhboo04cUrJS9UbrfDgivvheNBO5bDBz+jRy1a9XTprPUCpFT+1JD?=
 =?us-ascii?Q?WpC08GeMrgDhBuSmBhU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63df1a9-5224-469c-42c7-08dd80fe2061
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 17:58:31.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJ74zOtQiDWE1XUOAklTlZB4FTfdGk2FqOUQFci6EUuHGxa6cr4UJlbPv21/yoMzdGxaG3tfBGqXYyQcsEYEgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

On Mon, Apr 21, 2025 at 07:15:12PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Use the clk_bulk API to handle clocks, so the code can support different
> numbers of clocks more easily. Make the code cleaner and more flexible.
>
> No change in functionality.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Change for V2:
> - fix warning from bot test. Use -EINVA instead of uninitialized ret in
>   dev_err_probe
> - use master->fclk = master->clks[i].clk instead of devm_clk_get
>   (dev, "fast_clk");
> ---
>  drivers/i3c/master/svc-i3c-master.c | 76 ++++++++++-------------------
>  1 file changed, 26 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 85e16de208d3..d8cb0b9a2597 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -203,9 +203,9 @@ struct svc_i3c_drvdata {
>   * @hj_work: Hot-join work
>   * @ibi_work: IBI work
>   * @irq: Main interrupt
> - * @pclk: System clock
> + * @num_clks: I3C clock number
>   * @fclk: Fast clock (bus)
> - * @sclk: Slow clock (other events)
> + * @clks: I3C clock array
>   * @xferqueue: Transfer queue structure
>   * @xferqueue.list: List member
>   * @xferqueue.cur: Current ongoing transfer
> @@ -231,9 +231,9 @@ struct svc_i3c_master {
>  	struct work_struct hj_work;
>  	struct work_struct ibi_work;
>  	int irq;
> -	struct clk *pclk;
> +	int num_clks;
>  	struct clk *fclk;
> -	struct clk *sclk;
> +	struct clk_bulk_data *clks;
>  	struct {
>  		struct list_head list;
>  		struct svc_i3c_xfer *cur;
> @@ -1875,42 +1875,11 @@ static const struct i3c_master_controller_ops svc_i3c_master_ops = {
>  	.set_speed = svc_i3c_master_set_speed,
>  };
>
> -static int svc_i3c_master_prepare_clks(struct svc_i3c_master *master)
> -{
> -	int ret = 0;
> -
> -	ret = clk_prepare_enable(master->pclk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(master->fclk);
> -	if (ret) {
> -		clk_disable_unprepare(master->pclk);
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(master->sclk);
> -	if (ret) {
> -		clk_disable_unprepare(master->pclk);
> -		clk_disable_unprepare(master->fclk);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static void svc_i3c_master_unprepare_clks(struct svc_i3c_master *master)
> -{
> -	clk_disable_unprepare(master->pclk);
> -	clk_disable_unprepare(master->fclk);
> -	clk_disable_unprepare(master->sclk);
> -}
> -
>  static int svc_i3c_master_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct svc_i3c_master *master;
> -	int ret;
> +	int ret, i;
>
>  	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
>  	if (!master)
> @@ -1924,27 +1893,31 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
>
> -	master->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(master->pclk))
> -		return PTR_ERR(master->pclk);
> +	master->num_clks = devm_clk_bulk_get_all(dev, &master->clks);
> +	if (master->num_clks < 0)
> +		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
> +
> +	for (i = 0; i < master->num_clks; i++) {
> +		if (!strcmp(master->clks[i].id, "fast_clk"))
> +			break;
> +	}
> +
> +	if (i == master->num_clks)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't get I3C peripheral clock\n");
>
> -	master->fclk = devm_clk_get(dev, "fast_clk");
> +	master->fclk = master->clks[i].clk;
>  	if (IS_ERR(master->fclk))
>  		return PTR_ERR(master->fclk);
>
> -	master->sclk = devm_clk_get(dev, "slow_clk");
> -	if (IS_ERR(master->sclk))
> -		return PTR_ERR(master->sclk);
> -
>  	master->irq = platform_get_irq(pdev, 0);
>  	if (master->irq < 0)
>  		return master->irq;
>
>  	master->dev = dev;
> -
> -	ret = svc_i3c_master_prepare_clks(master);
> +	ret = clk_bulk_prepare_enable(master->num_clks, master->clks);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
>
>  	INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
>  	INIT_WORK(&master->ibi_work, svc_i3c_master_ibi_work);
> @@ -1998,7 +1971,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  	pm_runtime_set_suspended(&pdev->dev);
>
>  err_disable_clks:
> -	svc_i3c_master_unprepare_clks(master);
> +	clk_bulk_disable_unprepare(master->num_clks, master->clks);
>
>  	return ret;
>  }
> @@ -2036,7 +2009,7 @@ static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
>  	struct svc_i3c_master *master = dev_get_drvdata(dev);
>
>  	svc_i3c_save_regs(master);
> -	svc_i3c_master_unprepare_clks(master);
> +	clk_bulk_disable_unprepare(master->num_clks, master->clks);
>  	pinctrl_pm_select_sleep_state(dev);
>
>  	return 0;
> @@ -2045,9 +2018,12 @@ static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
>  static int __maybe_unused svc_i3c_runtime_resume(struct device *dev)
>  {
>  	struct svc_i3c_master *master = dev_get_drvdata(dev);
> +	int ret;
>
>  	pinctrl_pm_select_default_state(dev);
> -	svc_i3c_master_prepare_clks(master);
> +	ret = clk_bulk_prepare_enable(master->num_clks, master->clks);
> +	if (ret)
> +		return ret;
>
>  	svc_i3c_restore_regs(master);
>
> --
> 2.34.1
>
