Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20712E5D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745174071; cv=fail; b=ZDCcfLeOcwvUJJud+QtZzPjjrrI0VMHM67Jc33+GzCuVsE+lUU79WQ/YRQ11QblCTu9e1N7gs0v57oXKngtByLXF2VdyVj6ZdIyr+OyFTmmjdIkYz8iU1GJqTTskjcxi9g14xgWK1abjah9PQ4TINil9YRx+uX28N+pdYijLhcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745174071; c=relaxed/simple;
	bh=z8XlqRHTmn0xj+SakeRS5P4ONMcySSUyf8bc269ADZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GXtPBxTKlitH5B4V8vhkk6xTIBLnsLXcaRDN0wQ9+Ch/H9ftGk01vGRG5AgIn01kMyO0ntmI0oaoTtHo2mgCC1PMvXL0TRy6OFN6uWB5+ZBV1Ln7WAcqVdN2usYZVab3FzB4bGY3FJCjS50N1q9ToLPp3tKt2C+pfEH1BB7o/yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VeV4zb09; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VeV4zb09"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygwphjMw+ZuB3EoisnRK7enMZHs1OotDSd5gost6Jf6Zx0EX3htAPLyfuYxHiJdzwkJtz24uCaM5XVZ2dXRRrwhynYwCaOrHjlz9t17KHrfAEm4x2/FyfBPROBTCH7hCBfCZFCJXtd1pgMU73TILl+QEzKjyh7+8bPE4Was2Vm/99c2fs7lGdxaObBR1IZbbwsNxq2udaAEKAUEmAAJkYssH9EOF6ywr49fK/CSoRkJo4scUGySHM4cp56O4Nxj01n/XWNauxlLasJrL/XQYhsAGdPWRKgRRhL73V6AqxmsS1tF76VmnKfxrq5lwh6O4LsyZ4G5AfshAQeO/1Igmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN+ZUwRuZ1aFbfh7+NZFB63ObSo9ZaQHgj9s44IVKsU=;
 b=VpnfVRfHlHn7OUOajDf+l3c7mCGhT7vfEIC+Klog/XkDmxXaRZZwzAD1yC5NmdtKGDkOpDzLoB0LT3WomzySLoto9JyFM7zmuZhHbXgYycJyqxfwXyvRJwf3pjYVRFdupPRxSj0YVT3wV9gjkcl4w5PEKkQkd1BVWlYukm8tRS234GCKoQiGz/EukcKO7NLSBV7+bi4gF/Uj7OHqUoyRHCPfTXvFXR//YpLUdVBImxLYd+8nKtvYSyLaQQjowu728JP6O/2zQYDHsMfBt8s/djRxt3+JI30RFnETWXpIo7yPrdfD5/BHG6n6U3wySqZQgxUlu5ZjxYAZZeTCjKmvTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN+ZUwRuZ1aFbfh7+NZFB63ObSo9ZaQHgj9s44IVKsU=;
 b=VeV4zb09JRi1g6l0R+nOiqDOeknLdYo4bc+IpxzeyCIb8bGj1gH3Y3ams87oCaeSJ5H6xhdYyy79y7DfDm9QLxWbkuzZY+qocUl0V+uXoEr/UFkKDhryMYo7kMtjif62rJnBV+c6kOt5idGmg/HENHJMxse/dzbmsUt+g0bLbe86peqikkWUAHKpFN+rnrjF4/ZwxQO39WSmh8gpKecaIC81h20xZ6NUVFZ5HoDiEh1bnwN6MKuJhLDDYtXfmLexkUhYCfw3qj4zw8/PLp8OJc/+Ohwlby/3m0Zgt21khZAs9d7pf+CKDJ++Dbl0dFBxugfrMp8CIwtvkoJg3opvnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Sun, 20 Apr
 2025 18:34:24 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Sun, 20 Apr 2025
 18:34:24 +0000
Date: Sun, 20 Apr 2025 20:34:12 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAU-JMwPkBBORCar@gpd3>
References: <20250419123536.154469-1-arighi@nvidia.com>
 <20250419123536.154469-2-arighi@nvidia.com>
 <aAPemAFUsJaF_C2X@slm.duckdns.org>
 <aAQDIIPOUAU-nB_F@gpd3>
 <aAQH6Q9tTmLvozyv@gpd3>
 <aAUybKUc3LyKZ3F4@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAUybKUc3LyKZ3F4@slm.duckdns.org>
X-ClientProxiedBy: ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f48ec1b-643a-4c01-6010-08dd8039f94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLnhmIkiBJnWiG51cWSBnrzt+V/x0w0GulLAmXUTmGRPURiDikovh12x0WZC?=
 =?us-ascii?Q?1DOtUcuW7MQwLvycL+Tr5OiOqYMj5g1pxnFymklPlNzwbcP+ZwxiIiRHAoXg?=
 =?us-ascii?Q?61NMMH8JlM+d0UQZlbOfT1bNu7FV2BQGfkodnwLqAZ06pq1yO23Lc1yEV1nn?=
 =?us-ascii?Q?tcs5J4jG9H40OAZtIVXCifhWaPJTS5jqK5KuxGzWHKF6C3AxDoWRzZvEpGMh?=
 =?us-ascii?Q?ztCVsB+FCc0A/5FG8+mJtZr15IV1nLRxI+hi5qpNyFLdv05LbwD/F8+uevFl?=
 =?us-ascii?Q?q9mDPwmgYHVs7Tb1drScHAU7ryS2GYYTrMtUJLf3qw/fxY8O4w22jA0mVKzK?=
 =?us-ascii?Q?Y50ItYG6N6taypMUhxncaho6dWE/ZLLKH3Vc+5PubyBWzHVTjMMTHbrf/1Bx?=
 =?us-ascii?Q?gwolQ9piS7GxO5zm+eq3GhrnomS6lX5714alcap03nE7Kfz4QmbLruF2hfy+?=
 =?us-ascii?Q?Hw2HAoOE7meTtYJGWt2VCSsMVZ7GEfuqcUOzclZK/4cuCJcExoROwXDFLQKp?=
 =?us-ascii?Q?LPwfL5n8wD2Qr9/fxM6vSw/RwzUTLD1+2JjwbnWtYIS/WCD3vfOy3PiJomVz?=
 =?us-ascii?Q?8cRRE3Lm3Rgvi+iAsT90OfkIQ41M9UfpwbmURrB92XIx3yGFWE6KbrlY2Bfl?=
 =?us-ascii?Q?FoLgHVmtlBcEM3zTPzRvZngbkdyAS73680VgfNlh9a+PywwaOxAUgnna60Vg?=
 =?us-ascii?Q?/KPlKboRwLp/srcN2KdRbTOK8BAD7WpwW33h4MyuQPZg1JGKSU/a1PGiNXyV?=
 =?us-ascii?Q?YZIH38t8MTaXmWF4UJN9cbR5ORMRElldLQH+au0S6fugqTgPCE4E9fyQXYCW?=
 =?us-ascii?Q?IlFs1AVr6MWnaatTqkMKKyUTU8IJpmiNuQcDBMCxyoAzcN5NKBN1mhwi6R1W?=
 =?us-ascii?Q?/IMDvcjba9gkvYLzf0G1xvHXMfjbl+4z0MtNU7ux8AmtrBn72/xKHjETE3dV?=
 =?us-ascii?Q?xsjWMqNZwg9PXp7JuVL4Zn6C8TxXHkOWuSV+hqirGG3E/NKKX/1Z1hNH9rvF?=
 =?us-ascii?Q?ip2t/8QD8a0ynzxucz4V9J7gn107caYRvv7tE/brNfxOAJZqKnxR/Frao87J?=
 =?us-ascii?Q?18IrtVnJ7swhI683VQWUEpU9KHmAIgGvim1AAe4exQDeoAd67LsYR6EP4YXo?=
 =?us-ascii?Q?nH4ux9grJhoneJ14TySUcFbNVkt2vI0zNbB7VqD+F0XuMuBwv6A6kVojFauN?=
 =?us-ascii?Q?h+d+ZB3v+nHiUO4U7T0ugrLybFo2aDwqqKQoXiUJhRtaLzpGc0mCl9IE6iDZ?=
 =?us-ascii?Q?5gQRIVHCMF+oZnv8ENjblL8yTXm2AIiskU8i4AuL+bYvQVSj/F/GffkZZfqW?=
 =?us-ascii?Q?jRlVYIDFmK1jfZP7yRhU+eUQPPMB5jMTHWUp+oUipYk3OJ2yvLf0bISWcghg?=
 =?us-ascii?Q?V+XF+8IxdEJCLgFbS2L+fFo2dxR7hfTKGRmHSdPDMdUDnbl0hQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x+fyyx5l7SbT7dujgFHolGfoHjoOAkdqAe/74PSyD+NQT0i3NRlFLbsR+vjY?=
 =?us-ascii?Q?fO94v8Mwir3Y85qWu64ax6SNfuRBD5ZsSR7ToXTCrp5bordsYhYVqnHicmvB?=
 =?us-ascii?Q?cQ2J7o3uBZI0w5mHrObwMtllFyZvx3ypmd9D5kRtvuU3YQZY3fq54o2BKlUC?=
 =?us-ascii?Q?b8GQgXUOaM8AHmZU/Xw2lUNbq55S+ftG/S3GBceIANl7kYp216yRdDsi2XC1?=
 =?us-ascii?Q?u4a4ntBatn4/VymlwwQOuXm6Yf/+aK1SuFgk4JkQunMRngW8dinbRKDPeODX?=
 =?us-ascii?Q?tI6YkpPGelBmsBgxpBnf1iZgVZZwXplnrqgpOH+uaFEaP+yTl3OlI23E2qtb?=
 =?us-ascii?Q?Uk8q2kHH22ynhfX20tzKuPdkHI2c9V0U1gic4WCylxqSnb7dAOgSft9CgVpd?=
 =?us-ascii?Q?7/mrZmiis0OXoaKsM8xPrjoFuLOXlWvl/AI8TuFa4omdtvgIVhL3oPIfJBzI?=
 =?us-ascii?Q?sRTSdlNse5B3fzUfH50HwpuDQ1BdZg80cN7Z+KUuWueeEvoc1B39JQ4CZL37?=
 =?us-ascii?Q?4dHw0/LjFhi/T9mT9WHZcHwiXQ2eArufH88ZnNb78ROMrRA47uWRsAeBRRRB?=
 =?us-ascii?Q?QviQu3NMIE0Gu0oWvDaLsKYj1IgRxEC8ZFfMQSDDfF+67Pqx+OGz35lbNTVO?=
 =?us-ascii?Q?QiKJn3XV1vmX5xHSfB7wAlht3BqeKqHmlLgkirT4dm9Q0Zlljzc1W2f90pUx?=
 =?us-ascii?Q?nXNSfkUl1R6tyUcKgoNUj5eAtuI+hVjvSJK5Z9ZPbzJ26T+uIDYUiY33c3Nc?=
 =?us-ascii?Q?A/CzHoR84zCTB/Yo68AO/RqqxoGIhduttC1pAHxu6NyO1OOke4R1DjzIpjkE?=
 =?us-ascii?Q?rKTz0kglSmlXMWA5R2d1sarAEnAqgGg3AmoNxA8jPb49QWzKbheSOHYL2H3R?=
 =?us-ascii?Q?qFUP3LvljjDezNTuMK6IZ9MqBK8w9V+5+1+B97dBSWgQKl/FPhdIaLy5ybAL?=
 =?us-ascii?Q?LLcWGNk1dxT/CBICJ9EVI5kg324VkIlh1ixfMbjqVLacTDYjQqYg2HRjm7VN?=
 =?us-ascii?Q?lv9vt0/4LHuuzI78c6Dr+1u4NQVTnQtxmmYHLE2vXqa5U8jl8ztVpOXZ1gmT?=
 =?us-ascii?Q?qzopkJAkRCkWOxPcv6ABcj1+b2m5ZsZ5C0uoEumwJkJdCNWsY4JcH9/kO1Pi?=
 =?us-ascii?Q?ER205leu+Qbtj+ohGDqZJ1HhpRCtLwepLiXci5bz+zq8DQX136WU+WD3KXqF?=
 =?us-ascii?Q?EBlTvAZ7zLy8hKgkUJB8zIZfGOT+Dky9t0ilvZhVuplVQ83O3t3IJo9YU4qH?=
 =?us-ascii?Q?sEFE9AUovv9D3nL8bzH0Is6DKMsA8vX4EodjEa/YEh7QTSabZXfzyGP7Un42?=
 =?us-ascii?Q?GfOOFkjndP8fFUHka1vGj+EVlItb3Rd/6EofnILKh8I/gfINB1Z8t1VEX+mN?=
 =?us-ascii?Q?uFcgqhSZdzrxYw4CSOJFB1iDAYHZdZLMTf2DpRa6mLdIEetHomA1SpAvVSyS?=
 =?us-ascii?Q?93XVjmqzvvLznotjKGbvnAhVmVPIJ+PabsN2WWaIzryP7yAGIQdsROiciqfQ?=
 =?us-ascii?Q?7YAGZtu7uGChESf5pTw8MEYzHxLqRV5x4CE7oUYI0+arn5/KNMRWROt95bF5?=
 =?us-ascii?Q?X36QdfvEn5B9Td+EGdOJ+CiBmbc2S4atolQvpAyj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f48ec1b-643a-4c01-6010-08dd8039f94d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 18:34:24.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cM2ZF3RtdN34N5nix4Oc+ZICCfCE51JrWnoXN+oTTZ7AI5HEKb//J37+HuF2X1tgGx/690wZ8PB2bJPIWxcBmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925

On Sun, Apr 20, 2025 at 07:44:12AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Sat, Apr 19, 2025 at 10:30:33PM +0200, Andrea Righi wrote:
> > Hm... actually thinking more about this, a problem with the percpu variable
> > is that, if no rq is locked, we could move to a different CPU and end up
> > reading the wrong rq_locked via scx_locked_rq(). I don't think we want to
> > preempt_disable/enable all the callbacks just to fix this... Maybe storing
> > in current is a safer choice?
> 
> Hmm... I have a hard time imagining a timeline of events which would lead to
> the wrong conclusion. The percpu variable is set only while an rq is locked
> and cleared before the rq lock is released and thus can only be read as
> non-NULL while the rq is locked by that CPU. Maybe I'm missing something.
> Can you illustrate a timeline of events which would lead to the wrong
> conclusion?

Oh ok, I was only thinking of setting the percpu variable when we call
SCX_CALL_OP*(), but if we clear it after the scx op returns, then it should
work. If no rq is locked and we bounce to a different CPU, we'd still read
NULL, so it should be always correct.

Alright, I'll send a v2 with this logic and the percpu variable.

Thanks,
-Andrea
