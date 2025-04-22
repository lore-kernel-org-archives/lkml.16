Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C242F872
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303245; cv=fail; b=q5ZLwFVDM6qoaUiIQ38ZP2uFYhyWQkR+FP7b+cXNNRubbWRRqNKjMC2xDpiBLFnAjV3P5vk46M3jhq7PQ2UcfOkz7j3ZGkn3saGwgmGA6N/Bq1CP6yUteHVNQTHSxzMv/8Q6hpGP2Ir7QXzJ23cVAz/FcBeRif0vMMJJmdmd4Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303245; c=relaxed/simple;
	bh=swXWExjsWPIh4k1x2qiVY5g/k4jbOBxLp0YwzhHOT1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mc6VDm9f8mZ2qXmdjxbVYB9/y2YWF4troZz1L204quCg7Bb25RL4mbBETTWnupH3WKt15wk4KueME4M4YksCCOabpjI/QmnWbPNSDFkCG3Xp+M1fJQxDzAQjzetxNWx13RmT7Nsr4SXboLni0H94ujKqelj0jVCzCImVsoc6rY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jcsRqxe5; arc=fail smtp.client-ip=40.107.223.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jcsRqxe5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rG17B5XS1znf0lWUR2XTDQiY+3RhMtzJCQpSVCJ0uza/zPWc1FHhs+icGTPPO1Az8p/RjFKnJm+stkWL8iZ+oCCW+BxWHlMofJbtOj3o1iQT6FKWtDvcG8EVq0GMeHK71oU2qRMwNlPGtoVOpdJhkD3DpO2zv0lZKeY4mqJ335+yRWbA/bZN0nWVCkVeeZXJC00yU173t9UNh4Xg/JN9+bflW126z1u19vDsOwzrEzlPSJFF4/ayFcHe05pybODyiXQcuz5N32zgb7L7t+Ni7heW+anMQ83EylrhyDVM18bp5sIbU5HqqUHDam9fs+hBZtT7JdFn01wup63NuX640w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TTB2LD+YQFa3N7DJLw7VXGOv5SV+xdynHsnsUzm3lA=;
 b=ysN3xCq993tkeVLJqGE0B49yGMMXkRiX2zVsxEgJCk+Ay3pU1G3W99RemW/CbRnG5PbhGFrk6r1JIW1s+BamOmRpUVkfHtmzLDYocjDSsEeU6w7HISpZ60xKLcvj+kJ5qqMEnKH2A83b/RJfSr2rHnJkQby18ZKGp1iaQ+bG0nQn2IXoB1zU8idHRXrDE7HtS3nFFalM6Xx3KGeDeAyfqqr/imezEQQn5ZMKl3GM5UZM7gxYMScIwWNtB+ANOEpEjCq9Ivx6IfRPW+YEc7HWKifUVKw6j4SsHOFA/grHdK+DeaK7x7d2n46Rd6aD5E3jaDHTq2jRf7duz4Wj8lycXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TTB2LD+YQFa3N7DJLw7VXGOv5SV+xdynHsnsUzm3lA=;
 b=jcsRqxe59AHxF4I+sfe5pN/6sBg21jKYwVM2G67z8IEIQ5deJ2X/54NzWTaynCehDmnz5XMHOuuf8hz6qGEYx6eQYbD6SMICm1BbaftZWWK+FkyCwDcuRqvhxc1csmpbebU6RNYst0F7KfEGfQRtysuikyXOEBEnQS91Q/z19dq7wLFZNV0y0JNGOzhAEpNR8Kz48BYl5BWwa/Hkehis+4/l/C+VX1CGdQumAtFGhh9qd+XdwzdKFrlH6G+nlqaN2Yelx5jStuW5SrFMQmNI93m0OBi4zvNMnGOzn90GT7uFUgncRbmfk73ccbehvjhrYDZqFM61cr7vzR6YMvoHHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CY5PR12MB6347.namprd12.prod.outlook.com (2603:10b6:930:20::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 06:27:20 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 06:27:20 +0000
Date: Tue, 22 Apr 2025 08:27:09 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAc2vdLzhR2BgL_q@gpd3>
References: <20250420193106.42533-1-arighi@nvidia.com>
 <20250420193106.42533-2-arighi@nvidia.com>
 <aAaWbDu-WKEhQYq_@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAaWbDu-WKEhQYq_@slm.duckdns.org>
X-ClientProxiedBy: ZR0P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::15) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CY5PR12MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: fac06b7a-b703-4f75-3896-08dd8166bc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7yGbxJ19rkRrJLH98bYKUV/D0H1JSeSIYvkpcLHqPDsdCyvWHZN26hrf6bzd?=
 =?us-ascii?Q?WYWv1g42mYzUkV3HSWD8v53m77zOVEiq+0lbXhQiIll9B7h086XHSZmCuPzJ?=
 =?us-ascii?Q?UZ3jZSqHa6p9tIan72Oir3wu2rXaLXcp4DWHNtdErKhUk2cKst039OW8qT/B?=
 =?us-ascii?Q?FhePMRIdEWS6OjrnHR6yIjmHgD3rNp+kTwhZibxeBvlmIFe4YeK/MbsIYdSO?=
 =?us-ascii?Q?XA+q7rL3TntqiHZR8k2Q5J46c3EWwg1wEWEjyh6Qye17ivG0kOMGBtILzvDs?=
 =?us-ascii?Q?lQOsPggm4ZxxrnKWX8yH9tvSVgAiNn0+/Tee87afX8/ahkZfz9rnXbptZTaF?=
 =?us-ascii?Q?vKpCBW6Vy0J6fnkfxMbWpHd4Iva4+Dr0w50Jm86JMextrnpZSmLT5vxfF47v?=
 =?us-ascii?Q?pd9nYjaZ4WvACeR247y6m04iZ3diAnbaPRv7/O4diLG3IXiQrzf/CnN/TvBN?=
 =?us-ascii?Q?zue++7EdJyXyo7d7z1ismcz4Mu/RE/re1xVLPunDiP4zi14KoQoSpeD+/R4j?=
 =?us-ascii?Q?hb5GMc/m84CJmUjZuE4/5tPgyb1K/Cw7B+Xud+FeY38xXdRrrzwoj279gbdM?=
 =?us-ascii?Q?zTjQ2ZUx6lqlPuH0IQeMUbosnZVmNsuTf2r4rVZnU1CER0ytu+e0UpdiLaLt?=
 =?us-ascii?Q?ANOXFl70pLF8x3a07r0/zTeUH69vMEBxZ6BphU2gqamhgJKYhBhoCCUCzsRD?=
 =?us-ascii?Q?kr3YFiv4/e59pb/yVNL6yaQEFNysNXNM0p/619t3izDfShm9F1A64+fMS10m?=
 =?us-ascii?Q?KJHMJzVftMDncechpyP5uXtwgS7nOwWHKe0NDb0oEIpEVotDrsg+v41vSdBO?=
 =?us-ascii?Q?KVlVh/U2nGCfgoDZzUiVOlCVKtdGOpFJO7P9bodPwedqyeKe7qLDo6FwEBSx?=
 =?us-ascii?Q?ygsdeAl3WN+PHuDdxOw4tsCZQzFUgI9mNV4lEhCSKjyckuW79u61skF+V6zH?=
 =?us-ascii?Q?YvEwi6r2yCJNwNRRA+4EuCaG7VEVYZGNuygcXfe8phyt9AOgZuSbbXQj6A3V?=
 =?us-ascii?Q?D90dh81EfVrYbaP7EPakP3++EonQltku/1Bq3XSeYjbX01pXgDw7SG+UQApy?=
 =?us-ascii?Q?U9Fl/zjT2TitsQAQPuKYBP3UPe+RvuaU8CbRRi5esv/H5hobpaELrEVyXK5y?=
 =?us-ascii?Q?fJniSF9+b3h5hlkxXKEDAidsm0+0HkriBGccxCMlscky5t/5+Up3/dQe8eFy?=
 =?us-ascii?Q?l2uqMCwpUaioK1QX1OXhfyzzwpwxVx1Nwjhoty6wNBnrDzJRvJtEL/qin0P6?=
 =?us-ascii?Q?Cu54HsDlPVR2YOsbSixH4j76KkMxyh0ExqY9ch7eyYS+rQbx8+VQ9x+dSiNA?=
 =?us-ascii?Q?FzmHyXwKgCAeLPu9/sJ6VrJL9vqW4LtZOwzaobfz6FO9I0C2AjL4fcupvAMN?=
 =?us-ascii?Q?GDaVCJ/OJa/UNJNHj1WEqtNtwcNs+NTtUotsUB3v35i6ouDD1FEpbGOvHl61?=
 =?us-ascii?Q?Umd8QNWo1/4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zcRrm4VoHW2YlXGvF+CWtG7vuUVztjJs1jjgjryRkb1NcUN+uvo/z07T3tck?=
 =?us-ascii?Q?CFYid03m3ZFGObHfbzeN9bhCb68c0ZSaXbOmILPO3UZdnJvt+gOqA3QngD4Q?=
 =?us-ascii?Q?QkmfBp+X219XooQHag2lqvdf/x1G17e4XWwdvrFJ2RGb+eUgr4reNTxKgV+b?=
 =?us-ascii?Q?bZYtojv8XLinLfgLDWT1w9g+Aj+5LlycOt1tOUDMZViGtJWeYnQZ0Chgjnih?=
 =?us-ascii?Q?0holt7NBIS5/xrepBh5tjzf+oss06/vyw/KeVSX/+gmiB7ZmND+PodAElXcU?=
 =?us-ascii?Q?7q2G5bhqmCvwNyqZneuGXRsoO8zZ22DIm/9nV/0oRKUuembasIV3irvtP9bj?=
 =?us-ascii?Q?ikWtQTSJQdlyFeyWq/f226F6i6x6pL1FLJcYkKpxa5UzxWStCiHsEru9NQZZ?=
 =?us-ascii?Q?E0e7GYGxpP8C7+3/58wo4YUW7Gy+z3Kp0CQOqzTaowNYP+SlYLqn/RbnvhHW?=
 =?us-ascii?Q?0g9nK5qzfgC/6+iitvR2VpOUV5uiDYFmUYNdjc0tkbFg5l/HRbP6Y7hs+xcV?=
 =?us-ascii?Q?7tdD4GWWtw7G6M0O82UCgkoF2Y0k2xraj3Kj3fR1tWBSuJTbFU+2vUrpE2i/?=
 =?us-ascii?Q?1zsOWWecePQIOKCBy/SEg4XVgc/jN68qi4nN9v/Mi48mKaVecu5xvJzbtJbd?=
 =?us-ascii?Q?fb9lE6jYqjQ9NsDgX0BRi29GUUOyP4YXaLn8WvmCfLcV4Hu0J2eRxuGx27gk?=
 =?us-ascii?Q?0gU/R4DjUJy9XHrJcr0U/NtFjXOOlszmxfV3l7ugWJpUeajDhpsRgWuWACBD?=
 =?us-ascii?Q?0cy36I/ic9W5ebjGcOm1h7TJPLe6cdQTdCga612r6OwmXy9NAoJzCajEhuXB?=
 =?us-ascii?Q?+v7AiWUwI1ZZfV/g9BFxPGugkowFcrOX5+R+1VM0JvSsoWn2dd4W8SikBj52?=
 =?us-ascii?Q?XOxjy2uNCg5qIVuY/96BiHXfVFhwT7NhyNNXCUZ6bj9mrGVQWqy/5F1LePDh?=
 =?us-ascii?Q?cy4noZgHlx/j6ymNROBJnrM7TULGriPLurQNfQwYeYHJyb2ITRSDOMd7YKxz?=
 =?us-ascii?Q?51Swav7L38Uhr3okFxtq3bT5TVY388HHvwgRbvBv8ZGbDutVQvG/dfK092uw?=
 =?us-ascii?Q?T9x7x7TreCQb/2FlhzNFeG5R27P0IdvUhhA+kCqScm3UYyKFta/RcoTcqyOI?=
 =?us-ascii?Q?/mHw2Fg0kak09aj9rfSthD0xlltHF2bFH0ngHSreeb1TXBEQdtRnTitrJenu?=
 =?us-ascii?Q?f1wTg21Eu0UfBzs7uSaoFVcwClUuDcaIRy5TPtH9K6USK/1cg5fniu+MrTAI?=
 =?us-ascii?Q?+rvEhMzHkeAbevXZXvLOOIbI401LZb9rXsKqykQVGDDzCYlfwExulvJxF+TQ?=
 =?us-ascii?Q?hOgvhoyA9Um7Q2aQwsh1gLpmYqmE1Np23J5/pE5hx4eKYxdT/mUB8l+NGMYj?=
 =?us-ascii?Q?+9DWAIjAXDD/n0ckFzZREI7x8I7r6R5UlAvCG+REbH6EFPKsSTApSoHJ3Apf?=
 =?us-ascii?Q?2AjMJyY7qxTHOFtuGMdvialB7Bm3B81h/Dnaj8ZruoN/7KjePddEeEFs7e+p?=
 =?us-ascii?Q?ZNeuZvzbWTlNMC7/5pVuWbOAH1+tcSbs9LoeeZXJC/JxuvQDxTBz+8gb/yU+?=
 =?us-ascii?Q?Dal73hXUlMoPXuwEl4NzSATwC9pBtg6TZgStuA9d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac06b7a-b703-4f75-3896-08dd8166bc24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:27:20.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4TfZ5s2UZhSmIhSTO5gQ/jfIDc9DlWEGiFyh0CLwIakb77LT5c67M3oHzP09yd5i8FNDxWxcNODjEg+qj9cRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6347

On Mon, Apr 21, 2025 at 09:03:08AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Sun, Apr 20, 2025 at 09:30:21PM +0200, Andrea Righi wrote:
> ...
> > +static inline struct rq *scx_locked_rq(void)
> > +{
> > +	return __this_cpu_read(locked_rq);
> > +}
> > +
> > +#define SCX_CALL_OP(mask, rq, op, args...)					\
> >  do {										\
> > +	update_locked_rq(rq);							\
> 
> Minor but why not
> 
>         if (rq)
>                 update_locked_rq(rq);
> 
> here too to be symmetric?
> 
> >  	if (mask) {								\
> >  		scx_kf_allow(mask);						\
> >  		scx_ops.op(args);						\
> > @@ -1125,11 +1155,15 @@ do {										\
> >  	} else {								\
> >  		scx_ops.op(args);						\
> >  	}									\
> > +	if (rq)									\
> > +		update_locked_rq(NULL);						\
> 
> Or alternatively, drop `if (rq)` from both places. That's simpler and given
> that all the hot paths are called with rq locked, that may be *minutely*
> faster.

Ack, let's not complicate the code unnecessarily, that's a negligible
optimization (I tried to remove that `if (rq)` and I don't see any
measurable difference, as expected).

> 
> > @@ -2174,7 +2210,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
> >  	WARN_ON_ONCE(*ddsp_taskp);
> >  	*ddsp_taskp = p;
> >  
> > -	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, p, enq_flags);
> > +	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, rq, enqueue, p, enq_flags);
> 
> Let's do SCX_CALL_OP_TASK(SCX_FK_ENQUEUE, enqueue, rq, p, enq_flags) so that
> the static parts of the invocation are grouped together and we usually have
> @rq and @p next to each other when they're used as parameters.

Ack. Will change this as well and send a v3.

Thanks,
-Andrea
