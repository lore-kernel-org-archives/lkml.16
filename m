Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9A1C8639
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074975; cv=fail; b=up3aaFVTKKJDbLf5kmln8iyNJWP32wP64AAm0/RzUkJKdX5rK9nlftWqibvACy55i3FhEHJCNm5mogilzYX1ImwYZtveSKFNYRn6IC/xzvJ8T0kuab8KTBl7AO17fZNBPJyUoe69zgR0zFFdXD8oW3enFaJn2bCR5gEI0Yse/4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074975; c=relaxed/simple;
	bh=9gi9F+MTVLa+ISDxcKpFVk/fBavrdz4IM+Nd+jdPUy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MqbJ+GxXly1SYh4SmVqyVM2iOBfVLPsFojaOKPEOoxet8EzIbWI4tdaQOEObelyp/atf8LBmHezpdCUynAFL+uxokV6pcOzZiuOuYHx6uaI6i0hxHKeoaGUlLrTELAUV4U+XdmRwxXsPvSy9eSRe7xJA2AjI6WO/N6RNHeGrSPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qk/b+Bkk; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qk/b+Bkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G23lW6VTV7HYHjKY+6yeQGyj+9AAdigQX194McAm3wEEpR5T6vPK9abhLwscGUylfY2eRffbb/EfU0nKvSugJj9VCHBZT4Wbb6ulRbBq01BQL8dVBka/pcKYd5Qwh2L9nktNSlivRK5r3JHO47lBsoIwIfog9nEJIGKQ6hYrFlX5ICPX43GKKb7xSVGPa9GBcC0tx0rVt3+pi4k6ZOn9bYpso8He32+i8yg3oFOWbIWM17rirPqXt/qQOKN7XbLVH7XGgNqNmwnCXfLCWS+r05tjcRyQUbR3rlLEvSOo11GLS/fjWOLuN/P8Tq4/RPlqsRtgDw3Q32d7aH41QmiPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VtAtuP5e+2MsCBFSjwmsjdslp9PbOcH357LWssirXI=;
 b=i7xVXdvxrEJMZBGdjw14zEN7Ayv9972g+oEjO1AYQJYWuPll5zNEv45KoS6V596OLKuJ19/u0FaG+MAgDUe+RvAvz7BL4vXX0bqXKwbnpDWJFWrixlRCxtYnxNTyn9qiUyKvVLNqRwjxpG3EQuKOdm8W29OJgHwUBqUgQ4oqVOyvN2i0pDu+Plw0Mi1iMgzdacrdJsLXrUiXGDlP1oC80YAeNlXBMrXlojO39OQJ/D7naDg+nbOYrY9uRQEGh7b1adWrirZ/St36ldBHOypEGbaguUj6uZgFPhLkN840omlPKpUzm7h04OCV11jLlvY8NFd1UemZH0+mKSkvd48ulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VtAtuP5e+2MsCBFSjwmsjdslp9PbOcH357LWssirXI=;
 b=qk/b+BkkEOCAJFnmQy0adbsYraETpefKfRoagz53tg84eUbwXJwDD7GC/F2MQd5WmYQL2pO/GGkZ/D/lMkFpYNa3B2PE6tYolCkrj8AsT7D+xNVx2MpaG5A0dKN4K4SyZBlbkM7+Jx7HD95ao3VaEmnC199GDrPFKuxK681JyAxQuZh8kDZT58xnwX3oipuzBdL9kmeynyQrVcsXApE99X+YHi+ypTmSiVa8ZtSkOG9dbwKr/pbsXvp/B1h4f84qSS23jUdm3ecKQhJBSo2F8t38slb6X6HUNCZYL5xLGiEfR9e+v/lTqTLFCfJ2P66JvA1PcrGf0HBdor/3GXOFHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 18:36:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:36:07 +0000
Date: Mon, 12 May 2025 20:35:58 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
Message-ID: <aCI_jmub1sLdASLV@gpd3>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <20250512151743.42988-3-arighi@nvidia.com>
 <aCItuWh-BLp3jC6h@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCItuWh-BLp3jC6h@slm.duckdns.org>
X-ClientProxiedBy: MI2P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: f69d2e5b-80bf-4e61-9d44-08dd9183dbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?scc2ofWdSnbN/lEIF9Jg62IVUy+WnRV0UB2TDZ88jZ+65vYQRqI/t+QQsy5u?=
 =?us-ascii?Q?HzDLDhcD90Y0QzMQdqMvyEHBNhKSkmn5hSM8M66Ne5u6dluZjbz7cCFgYpOI?=
 =?us-ascii?Q?ioaWbrQt3sDMDc6dPsZ3oEVLlM+QscKLG/PTJmBgTEVGD2TWFROY1pl3TkZX?=
 =?us-ascii?Q?0YpZ+jXhg8CrDwtprnAU2r39N8E/q8XgPEslcvI2d1FVvHvHSRmSOxALH+jG?=
 =?us-ascii?Q?3Mi4hNl8qAis/tMny8cyM84YdobxJNPWwJZ7jkJhn2gitj6BfTYiBRsHiIle?=
 =?us-ascii?Q?ALmvvjDY3Y60HQ+SyfKBn9T+LniuVl7H/5gKzZx1iM8eYB5LbdNjRtp+fV51?=
 =?us-ascii?Q?uhg5g6QvgNWf926B2PY16XmufaykUx7cT6opkH0PCWhTJkV2UDnEtV5O+arz?=
 =?us-ascii?Q?1JiS/6mClwxryMjOR4X4FJtO7zi8vpHq0ObxsqL0MT5CWkwe0zJSXd/qWy+o?=
 =?us-ascii?Q?fMFBCfcj/qic1n5prp3+j875jGdUG+C5r8SfyUNPGZIzyemnBMipbuN0F3lR?=
 =?us-ascii?Q?aPW4RMUoYCuDXec/xPg8WjLvAS5F/4cLwmyY8u4IqPcpYg9yuE5he3LubP9i?=
 =?us-ascii?Q?hcPzH27Sq4zQdW8Us0rTonFjmSTRTGYxN2flaZSVtcG13sfh8S74Soqio+1h?=
 =?us-ascii?Q?QMDGpT4xZo2qllu/Ow4Qznvr1cE9RUhHMEAF8tyZlbvydrievBrAAFSvJq4t?=
 =?us-ascii?Q?OIsmzLnTfSEIrIgcRwgX14ZkPOV/juFzJDu7vWbvfy48SR2jQJaV7zrgC/VK?=
 =?us-ascii?Q?korGnS7KDMmySyW1+XPiyllpFQxKCjs+aC+z5dPIndgStLOBjDd9Fj7TkI+B?=
 =?us-ascii?Q?3Dr+hF8voR9FKTmonNuRS4EzxiIXKriJkwTb+eQA9KeM+yitdJ0uq4uF9RKL?=
 =?us-ascii?Q?V20l/UmTyZDEiQzFXixsfxjrAVAL57KpfsZpFfu85QMkxJW9FvaOK7egX+7a?=
 =?us-ascii?Q?HBkDGgVg/ZPbiUHPJVa+3D0NWmIjrd4oJ1KIoEURcBdDwQnxJGmHI4aEncOP?=
 =?us-ascii?Q?eyxUwkxlQmse3/aHE7au67v++O8RM3f7ziIf5YLpd6I9oEERk1rzH79yhtfz?=
 =?us-ascii?Q?leeT0BXaisbxRDDCk5EICCWGXxkdFy+fXLUvRNz8bO5ciVzbDusQdU2+ziKA?=
 =?us-ascii?Q?C4BUb7J6TWgAIvrqhzwv8XD7T9PcvApY2QHfazY5nPtXsrsHHY+D4QOPK57D?=
 =?us-ascii?Q?VuBuRp9HjmaCfwt1slAa6nFJOijj+0BUekBshqyrivVntjpAmYhCcK3NGFfW?=
 =?us-ascii?Q?IVwBvGVf6shTBMIGSVW8yRQ2Er6UEWCGvyuvcT5QhHYZ6nUZL362eeq/hzNV?=
 =?us-ascii?Q?TF2yD3LC3nN7QWEDWHeiL6ekZ1dlk4JQcsX+vOw0/6Xkv3jvMbW7bkYY0G3n?=
 =?us-ascii?Q?6tM3oiqlDTjCVRks63iKEOFL4hjwnPEVLNi7IaJlqNKhLbOGzg/q1mReUMRO?=
 =?us-ascii?Q?A2PLYVwz9P0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ubgMiIOnLKpn4f9YuHR/hgOW4Y2K3JO+NPgqblOtX/Qorbo9esD54MdMxGVV?=
 =?us-ascii?Q?0nyekO3oi2V85K5kWJEFz2e+fIqc9COHkmdn+saO0oNDukmGWmDU2nKRj45K?=
 =?us-ascii?Q?XNLS7GE26P0XG3xGN+7WbpCnWI6tzFN+OGMujEXCl8cE8O4hd2IF6GdFBTZN?=
 =?us-ascii?Q?CSiySx7uNTyV2kvF7/AcCn7MoQ7KYHANknalyHvET9gV0nEheGosNLpIovp6?=
 =?us-ascii?Q?dGN5gjUwe0N53RDW9CxUTmCdUxXkybq+NS7Xt9FTyOyKJUdTzJbN6zcvP4kd?=
 =?us-ascii?Q?gDpa8X6BMaFczWC0OCLsjAxiNfsjQJm7vtir1pZadpvoRm9rsxxKOeL1+aRU?=
 =?us-ascii?Q?sMFcZDe86DXUPHHIvdbpoIFa7EmdVQE/jzup/UMvKr6OHrHw13mMqbEx6faq?=
 =?us-ascii?Q?EW3PsrRY8q5kReuzzvIRqCAdzHDyS5L/Ht8LeGJxBQ4LqLdhC3HjXbJVet4X?=
 =?us-ascii?Q?Ttl+BlWTGHTtPDY8/9bg0VsduUj4RPg2tBqz4PZrSCb3nAFXzwO8pulsLX9c?=
 =?us-ascii?Q?7dY1Dsqf+5i9FqAdYpm92iaOHdu8DsJaTjvm2x+YFzo3dmjyt1nKrDEo1Omb?=
 =?us-ascii?Q?OIa3aqNvFkBAG0exTt8qJ52kQt3oQ/aiGkSlsyw3A48EhptkRuJX3CPG/7Qp?=
 =?us-ascii?Q?f8wkodYa+Z/2emw5TuumJjD2nO8NmqtwtHRtHtV3afY4h59EoCKRN0Deutms?=
 =?us-ascii?Q?8m8t1r4gAd8Yp5FoEnT5DbEfXqw7XiZm54ng3u4tcDWin+MVhFm/KSm3/4kk?=
 =?us-ascii?Q?15BWeRi/x/FsJDZ3ja/hIHuVscTLgzKVyAFEh6eQvgcmWTS5hDsU0pfw2qDI?=
 =?us-ascii?Q?NBWt/AQ2khLB/sa7xZlpBZC2r6vKeNDfDX0R7fijXEIKkCXky5CgMUMx3mXB?=
 =?us-ascii?Q?8tx0N+hIonqGWkDXXngBSQw806Y1TW2MCJ5Xp+2ShyZyILN/UfGoOt/WD41w?=
 =?us-ascii?Q?7P+oga1w7HBOgl0YwLTVNb3nwIh1x+i4jgkoYSGjLPe031PC6237DLwSdSYs?=
 =?us-ascii?Q?UCQx+Ckpv4anSvnvSU9YXAn6XXhkIansQsqunJYiqnYR1Y2DOvX5dZ5bP9jd?=
 =?us-ascii?Q?fygNM+ugo+r0qdh+noswnZGC8XReDC+jYeSCf3kInMDPaFGhccGcAufPrnyk?=
 =?us-ascii?Q?dRX7UXiOk90bYPWjKZPEsj2Wz9RzKL999hEuEGd5zazIyJGbOVFPS/JdRziP?=
 =?us-ascii?Q?TlOb6mgE9XCiJx88BXfhLUSRNs1+Q9tNunraPu5bl/Pxvi2Wk8XZCdHfIMzX?=
 =?us-ascii?Q?8Pkr/FHYkokVPyydmN/tmcETqWszXyGJ3ek3pVludV8bjCnEjp2a9aEZ0l+d?=
 =?us-ascii?Q?HIhv5ETjW8tjXX5b6re7IQyQWx0Da5MCuFza+gXezkccG2ZRtviuBAMmY2sU?=
 =?us-ascii?Q?i+RyYyWCDA3Z0OkjhkBFlKmKhZcSvh6klnmw777W/vezLqfz/+2rPVqI8Wmo?=
 =?us-ascii?Q?30TFpWETwfIPLJkqL5qjhqbGgYh2EtPk2X2kS+3sM5GaWNTx2XIwaQ5cFtgk?=
 =?us-ascii?Q?a5epi7X/z4t1RDd0TOxcn/Kp/q3HB9vDsqaq5fYFzj3fi3NXMxEjVu32qi9z?=
 =?us-ascii?Q?HyJw2IwSn6BIx/6VizbYLTRmYIV7Yhxk4WqvpsgY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69d2e5b-80bf-4e61-9d44-08dd9183dbba
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:36:07.0540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHa9USu9sNAD60XBV5sSK5Y/ifhKdJuyNNf6Gd87LJ7iU7rSzh8LXbpY9CIeGu7GrPH1m7WewSbcAAcpYOQusw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111

Hi Tejun,

On Mon, May 12, 2025 at 07:19:53AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Mon, May 12, 2025 at 05:14:56PM +0200, Andrea Righi wrote:
> >  #ifdef CONFIG_SMP
> > +	/*
> > +	 * If called from an unlocked context, try to acquire
> > +	 * cpus_read_lock() to avoid races with CPU hotplug.
> > +	 */
> > +	if (scx_kf_allowed_if_unlocked())
> > +		if (!cpus_read_trylock())
> > +			return -EBUSY;
> 
> Is this meaningful? The idle CPU selection is already racy against CPU
> hotplugs and we depend on the scheduler core to fix it up afterwards. Even
> if scx_bpf_select_cpu_and() is not racy, it will drop the cpus lock before
> returning and becomes racy again right there. ie. This doesn't add any
> meaningful protection.

I was concerned that accessing llc_span() / llc_weight() from
scx_select_cpu_dfl() might be problematic if a CPU goes offline underneath,
but we are accessing them with rcu_read_lock() held, we probably don't need
cpus_read_lock() protection.

And about the scheduler picking a bad CPU, that can be fixed by the
sched_ext core, so there's no problem for that.

I'll think more about the CPU hotplugging scenario.

Thanks,
-Andrea

> 
> Thanks.
> 
> -- 
> tejun
