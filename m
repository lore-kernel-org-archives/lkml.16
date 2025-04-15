Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012023.outbound.protection.outlook.com [52.101.71.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B073729C32D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733707; cv=fail; b=aCKP/jGUuDEk1ogstSkxBEyb3icSak0i1xB5q0dj38GV/LfspV4I/UvIeusX1oNgsEEMqm7ig5VePtFxCchKxCQXdZJiHyNbpOQddjk1BkW+KkaW3gd8TSm4xi0b3J5oKzVuvGI7T8tX9o+NiV7SjJR3lIB58icP45gbgdPOwEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733707; c=relaxed/simple;
	bh=dlGL3rnXNjRkMH+dIW4JhQjJUmtXWnl12GMSRA3CzEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ah13RU//8aop4bGWikWl1yK2uQd4WsXmCMZTZPQH1M9xgLY7iehPnSdhQKAp/m6n52V119mBe4lKFAjPmiajCu206qsUi7up0uC9iqZ9CQvr6OWjTMfkN2kZoAJ5CyLHmEGOOlOS1So4MbQjHwJY8YLKYWBB+wXFvRnAeodJ7yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wxe8xh0z; arc=fail smtp.client-ip=52.101.71.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wxe8xh0z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXzrqcYTI2GRcQzR6uD/0UdbsMbSH8Q0JIszC4EOHonNUVq/UR5iiQeZB0UvKrZlzN6ubbyciO8rwnHYfKnnPTBrkxYWfR76r/fOHVHP86Nc6xhy31ifY6nT7xmGlLd3mfRcc8LwNEVAk8+OSttPjj8GMVBQmzVsavew050mgG4DYRyklj9veo/CPLsOxfruTL44+3YV9ne/o/8DGiB69atfwqAawxuJ6orbL3W5+qdxwRjgCpCQloSvDLaRVHN8X1pERjRvt7JtQtVdyht6+I20L+kT7zfzbYILIKL5RlLKcNjnNTm7yZizSwtAYvNwmm2OylleZeJAR4vjprTEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb7FdvjjTlfawT1iNrJ0TzoymtzRclN7W1P93TT39wc=;
 b=B3xCaY0y09/Uq5jBznNuecyHaunftaIhn91Af9Xs5VC3Ntii3jVZMvsv32zoTuFp35rOmmmwbv8P8TFHo90549wDJP/ArUDRU53Z+RQ/I387c13nRytk4J+fnoppxJLJP9UFX0KWh/3KzPQQ9X0x8IZJBUyv03eXfKLPphKChsW/6SsgnYqneNLFWbdmUCjwoyi4MyngVuQz2FAoauOIJrpikZlAmsLbMEfi0FKcaX3IDE0nE0oNLGingPTsz/2WoLc4wkkRn9yMnxeILnW8/EA7DOUwvcUFtes6LtXJYiiim4QZMP4k7q83azUGlz3MODQASBMVNDXDFBN4iLHU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb7FdvjjTlfawT1iNrJ0TzoymtzRclN7W1P93TT39wc=;
 b=Wxe8xh0zi/KvTbcFCfxCYojnWw9JuZ43iw+MeuoWT0B8ozNXiB2VcI+1trLP0EJN0R/I9E6D1wcWFx/wd8J0bejfQXIgEAKVAuvFLqCYt8JJvg0BB0nw+qCjhyyZKe3gDA+MzUB2TPKrD6N/ZgVFHMZXwhMwa+06XgEMd0t5p0JC93jtnCnVM4+fitQ7f9U6eIvCl0I8j5BqLM3iCZ21nrIxvoHxk7g56tM46vnZrPrY2/r1L7+iwnHuYuzdy7yJ4aqU93IHQY2XYY4Mtabj/V4v2JY33VE/lbybKO4IgBrKuv+kYOhU/zPa5D3QbKXDAyCUo0c0EIkQBeQWKn0WYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:15:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:15:01 +0000
Date: Tue, 15 Apr 2025 12:14:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 1/2] i3c: master: svc: Receive IBI requests in
 interrupt context
Message-ID: <Z/6F/5fFLWWbfoae@lizhi-Precision-Tower-5810>
References: <20250415051808.88091-1-yschu@nuvoton.com>
 <20250415051808.88091-2-yschu@nuvoton.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415051808.88091-2-yschu@nuvoton.com>
X-ClientProxiedBy: PH7P221CA0078.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: e1543485-6c0d-4ee7-ef94-08dd7c38acc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?USxgwrctIpSnQQ+f+dAQVghlkoSJ+H0NYsBKLInBeKolCW3iuKiHR0lHDACp?=
 =?us-ascii?Q?AbuLAtNZceo+rWyqOd5Ns/LApGw7Kxx7B2yj+kYa999M+yJLkPaSa7iKZ67O?=
 =?us-ascii?Q?J2gAsdOIxU/MOSDgT3vFZqZNgnfcVrqxI9pDmq6WOJFgAFBtW9ld4Xj+hH+l?=
 =?us-ascii?Q?2SvywwnfVHsUMfydjmpRpsWZbphAr6wVVcaH9ebvzoFwl0tz6R35D56AOWpZ?=
 =?us-ascii?Q?nzHytbdiUrF1IMELVOF9aNk9QVtaf6HSMd7lUTd5wOO7AX5AvkCkb+brsqwp?=
 =?us-ascii?Q?/oaFhEy66CEpiAJ0vO+rEdkAfTZXF1yEAxMuqvjFV2gIPaaHsGYA81+GvGWU?=
 =?us-ascii?Q?/8kNvmycOOG3707Epxw18USTatM7GuU0XnwF+OqbbDKU8pbqGH+TnPNc8Ej2?=
 =?us-ascii?Q?gxdGehS2kDCSasia4+3pDHWkwiWeJSeTQeAJsDQqmHxcg5JR8UrPyfqSc6HY?=
 =?us-ascii?Q?W8XjPGUU9WgxUil9BZdGd3JzwCD2AMK0XH23nfl/j8+yIqwt6E35mxodAI55?=
 =?us-ascii?Q?994N+qBlCvzBB7NmVWb+uiq7myJRZ2bt4uMQaBVFn2mU3dbDX+fUSTcTc9j9?=
 =?us-ascii?Q?szNHkeb5jD55I2JO1VJ47OMGyAC9ZA1qEG0XqEw+WocI5gLxeEkGcmdefqyK?=
 =?us-ascii?Q?Afj6npqyky6TRlSvW169AN3W2pmAywZ7QA2rCfzh6E8mtIFQma/3eubLPke/?=
 =?us-ascii?Q?dRJWxSxHlQr6CGpcPR+vgZ+CuLNHpw8g8DCz5BaEv88ReOKj+3+kCeV0blno?=
 =?us-ascii?Q?Ir6Bs37NHEmUsppTK0CSAy3clkvYkHFseKdiYi+yMExsTm/4XnV81HwYttqc?=
 =?us-ascii?Q?ulsGdFx9e0FM70Z/rrcuYLioS7wWFnSpb0Dn53toaQyxKfNwQ2+j9yyrSIdI?=
 =?us-ascii?Q?0ycgQaHoJ7GMZY3HivjMgR8Dc9kKFYjG61m/t++dOry2WJ+VHi5W0UNq3yu1?=
 =?us-ascii?Q?H79iwM3SwXG7rmWnTqvh7t/Z7BEvFDKijG62NdaW0f9XQtSYYgoOnyJwcx2M?=
 =?us-ascii?Q?+6pmitY2F+L+GOdGtDk9DsCOHGwAYaf2KgfkTs0XIKCoQ5JGP6O51fG8KDuj?=
 =?us-ascii?Q?mfbjG8DTIeys3E5vmO4ObxIIuyjikeDd3YQOWXLsRmKPIfrQKW6N5pUvl7SE?=
 =?us-ascii?Q?OKlHwKuIh63qSv9DkW4LmeUQelUwo2XofonmtKdshO+l5J8hsQEfk1hpX297?=
 =?us-ascii?Q?MrLObGUu2adWyN2grQdPT1KHCPkgRcFD2m7CD76RWjhprKCoxGUAvpUHvn3I?=
 =?us-ascii?Q?4BFtRZM1zyUbpSJ1D/y29ifBeHzKFElqiIRDaPIS3E3PnsBSaQw+zVAKBBeO?=
 =?us-ascii?Q?RJ1WxRKH2zMA9891SJqFr0fK3jJOkEYti5cfBQgcz05y+Lq6R5FzyjqYxJXN?=
 =?us-ascii?Q?DZ0RNYXeRK0Q3hjV8mgskWwuZRJvkYnbXQwDZsx3ZqPI21dnu0kVbjLyzMdG?=
 =?us-ascii?Q?hmRDNkxpwXjI9JpKBHNb+xI174uhQc9XXIjeHM5AfAbeoQVQTI7NQw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VEq0RW4p1gvxuTwGD4Kga0kRm5FUl7oDRNTvlnjBW7FUtf/MZB3eBq3FtSSk?=
 =?us-ascii?Q?oM0NDhrSKJdnIMvMY7PMhHLaST/4n/IJPTmkc/q62nGoxFG9EaoIsTg/61LG?=
 =?us-ascii?Q?LJij4zq/rp2BZ20oqtCkJrWQRKrtpmc8OCmH6uPTAW4SeOiAImtN6NowVTDF?=
 =?us-ascii?Q?lKtATdugBLIX38ajFDHqTtO5IiRBProNaahJcIAOlIle97kc7n/JDlw+pbbn?=
 =?us-ascii?Q?uI4ibEGHS04ellzcCHQ4HLJyUGey75v73a8vlNnlSfBe4ummCIb/CsEOCOK1?=
 =?us-ascii?Q?maxu8L+niLBW7j80hkSzqG3KpjcFZX/Wuk6eRw4n+l4aFK9eXv2XiN1wtN/V?=
 =?us-ascii?Q?lHmWJsk15bwG/SvOTS209JV8Vlv8kV1FpM7rcxla2yLD66aHXpK8q+rbDu2W?=
 =?us-ascii?Q?wpWPn8oFPMTLfw3/7PLx2P5CZaOEr0Npx9SCMQ4oXk1lNw0Dc4e+lTuWWqHu?=
 =?us-ascii?Q?gtpGUJh1Xp0vPTvvGspbufVOWOnblHpKrAHQ8hqFr1afnj6UQQXPe1e0w98S?=
 =?us-ascii?Q?TkYnqHSra7KE3miEffD2XZnBnGzmP6z4UoPf17A04Yf8C6bUeeLckujGhJYr?=
 =?us-ascii?Q?QDvGoksVgNnAXqmbFjeJhawiwiRbSrvgCtO35bkvQoMlvh2z3PXRGUsRxhoo?=
 =?us-ascii?Q?ORwMLWoxYUk5lvewv3nLO9j2/pi4IdPVK+46tFrQAFDpfsDMd1gnc1sm9ozn?=
 =?us-ascii?Q?ZkzoaNY8+jXxIrk3/ismETSB3GkQDy09FcIQVB6dpy/pQn/iXoXATjSn6dqU?=
 =?us-ascii?Q?GjRd4yEY4lRzQHulX/SxepvqDKma7Cu8QKO4qIz3v/sl4O8LfIAfVKLwC1Ef?=
 =?us-ascii?Q?JZzUXFgxW89d2LkepC9dddJ/NFN7vC9xgnRXhsZ+YM/TMv8S+Xqhp5fyiMwk?=
 =?us-ascii?Q?5HszKLgmgAXBBzVnNSL4BgFhqcMQpG9+zB7dDna9UtQwSSjlRVUFJY4qWh+Y?=
 =?us-ascii?Q?KYHqa00oGlxfoUBE37N6KvJWCLIKF2YMaNhz0YmjwkulKAWxq2hs40nQpGWI?=
 =?us-ascii?Q?oQ4DCsX88I1AlyHgOC2v6OuTHHKxxvEomOtBBgCxeL0psq+/Ry3S+7sfGhAr?=
 =?us-ascii?Q?FD0OOJdOUwC1R8pgeQ9mQJ/Dx0neFe8zXKkXJWYdQZXWK7mCqSVzH57LaaHn?=
 =?us-ascii?Q?lpa1oHCKOYD4SumSct2P4e9Mr11GjbuZAozf9b9TnfPvQkpNfHZtbJHWxbF/?=
 =?us-ascii?Q?1bUCaGtnKHsQvkg8MJp0MnzHkNiwj0vrAnIUD2RR4tp59fG0ujV1uFy7SxOW?=
 =?us-ascii?Q?05JUdDUEn/rAxsgNsZ7msigxqjq+5igRuXmxuCXyqkv8vL2E5pevPtsBEZMs?=
 =?us-ascii?Q?A3gYu+cR+FikPr8kroJ74gxJIe+MnFnhPqswMqmr/KgK9sCcb4acQLWMNyYj?=
 =?us-ascii?Q?A/iZHBdnJY9fl7qukvuiRLcQN/AKiuEle42u3Blop6oJNesm/8bGFd/6e9QR?=
 =?us-ascii?Q?PPQVYgRYDAmJjQCtZQEHl5M9pQgEcCZRCW+QFnYT9p9oKV+D5vAHo1x2k0J2?=
 =?us-ascii?Q?40YphjNob07Bpm2f/QeOOk/QR8Efe2SUC27Bsr4R4rvOzDjpihTjJSAMNGwg?=
 =?us-ascii?Q?a2ORzfoog2180p9SbXbdggBuf9S17uEu6K3lRLoY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1543485-6c0d-4ee7-ef94-08dd7c38acc4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:15:01.6622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9jfQDwkL22iON1ELi4Ujqxz9cF/bRZWK0zllLQbk/NhQ6OjRalYiH653ohdEG9jlVNk8gjl2M+kaZToETLqfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

On Tue, Apr 15, 2025 at 01:18:07PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> Moving the job from workqueue to ISR for two reasons.
>
> 1. Improve bus utilization.
> If the requests are postponed to be received in the workqueue thread,
> the SDA line remains low for a long time while the system loading is
> high. During this period, the bus is not available for other targets
> to raise requests.
>
> 2. Ensure prompt response to requests.
> For timing-critical requests, the target may encouter a failure or the
> event is missed if the request is not received in time.
>
> IBI request is short, ISR can receive the data quickly and then queue a
> work to handle it in the bottom half.
>
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/svc-i3c-master.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 85e16de208d3..7ceaf3ec45bb 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -201,7 +201,6 @@ struct svc_i3c_drvdata {
>   * @addrs: Array containing the dynamic addresses of each attached device
>   * @descs: Array of descriptors, one per attached device
>   * @hj_work: Hot-join work
> - * @ibi_work: IBI work
>   * @irq: Main interrupt
>   * @pclk: System clock
>   * @fclk: Fast clock (bus)
> @@ -229,7 +228,6 @@ struct svc_i3c_master {
>  	u8 addrs[SVC_I3C_MAX_DEVS];
>  	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
>  	struct work_struct hj_work;
> -	struct work_struct ibi_work;
>  	int irq;
>  	struct clk *pclk;
>  	struct clk *fclk;
> @@ -487,9 +485,8 @@ static int svc_i3c_master_handle_ibi_won(struct svc_i3c_master *master, u32 msta
>  	return ret;
>  }
>
> -static void svc_i3c_master_ibi_work(struct work_struct *work)
> +static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
>  {
> -	struct svc_i3c_master *master = container_of(work, struct svc_i3c_master, ibi_work);
>  	struct svc_i3c_i2c_dev_data *data;
>  	unsigned int ibitype, ibiaddr;
>  	struct i3c_dev_desc *dev;
> @@ -504,7 +501,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
>  	 * schedule during the whole I3C transaction, otherwise, the I3C bus timeout may happen if
>  	 * any irq or schedule happen during transaction.
>  	 */
> -	guard(spinlock_irqsave)(&master->xferqueue.lock);
> +	guard(spinlock)(&master->xferqueue.lock);
>
>  	/*
>  	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
> @@ -530,7 +527,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
>  	if (ret) {
>  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
>  		svc_i3c_master_emit_stop(master);
> -		goto reenable_ibis;
> +		return;
>  	}
>
>  	status = readl(master->regs + SVC_I3C_MSTATUS);
> @@ -574,7 +571,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
>
>  		svc_i3c_master_emit_stop(master);
>
> -		goto reenable_ibis;
> +		return;
>  	}
>
>  	/* Handle the non critical tasks */
> @@ -597,9 +594,6 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
>  	default:
>  		break;
>  	}
> -
> -reenable_ibis:
> -	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
>  }
>
>  static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
> @@ -618,10 +612,12 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>  	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
>  		return IRQ_HANDLED;
>
> -	svc_i3c_master_disable_interrupts(master);
> -
> -	/* Handle the interrupt in a non atomic context */
> -	queue_work(master->base.wq, &master->ibi_work);
> +	/*
> +	 * The SDA line remains low until the request is processed.
> +	 * Receive the request in the interrupt context to respond promptly
> +	 * and restore the bus to idle state.
> +	 */
> +	svc_i3c_master_ibi_isr(master);
>
>  	return IRQ_HANDLED;
>  }
> @@ -1947,7 +1943,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  		return ret;
>
>  	INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
> -	INIT_WORK(&master->ibi_work, svc_i3c_master_ibi_work);
>  	mutex_init(&master->lock);
>
>  	ret = devm_request_irq(dev, master->irq, svc_i3c_master_irq_handler,
> --
> 2.34.1
>
