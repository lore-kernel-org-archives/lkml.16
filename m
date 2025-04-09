Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BCB25B677
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185495; cv=fail; b=C/mV01PxmZbaY32X83FZOnCFUeTv93ljaowXx7MHnAvJqz09o2GQVIAYb/STCKY4wxOqZaqYRibGGwobfMjVpJiwzhlAp5oxau6Aw+dxZj3eQKxB0zv7k0xQf0WGjqzuJjoNunCctmEk5tJudaWA+YJu3BAphTrxmJBmz9pHl0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185495; c=relaxed/simple;
	bh=0CN1o5HTTjqFfL0CY27VsAPF3oErvyk16yDqz8dDSh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uQgipSZQ2E181RPw2CI+GIOZaowIHttPgRDwTFXvSYn7AS9nmI5mej4NMLNRNcInMDjeWkEJV9ZbVnCxZ2nXvF+euTMaQvOOi4E1IfgKhPOGKTXXGmY5A8O0kN5RzMzqPCVZaLbPAoKkI700AHJw9DJN1sJavhm/UnScN0rvDjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mTAFsQd5; arc=fail smtp.client-ip=40.107.96.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mTAFsQd5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBr+3tZOqHOl4iRkQ+FMpu+ch3vmF2b93uNfyl+wSfEm4DmcuDarWLbJ3gn8O8bITMySSWwypHpGDyVavXRHUP21A07f9qi4aSRraD4Pn7TgBJTsPvOfN7iKRi7tnMug6ZxuuMol7TRjYrETGcTXdTfkQJoFL43rXSTpEqn27kRopf/tY2YdwrRXK1aY8A+xZUbF7oo8kyF7BLr7iGornL1R5QpJuXNXIUivkBQewS1Ew5RSvN5bseOvV80pL3UBp/79KSRsztaTTPA3s/Ox1R7RGh2kk0JjBoUzCkCKqm+9EopIDoGOQmkpJcLJ3AmmZdDlVI8HVVINEMWPTLxlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZtrxjomHWewQKfP6UC7djh9LrTKdoifWzLtTupJCmU=;
 b=y/gbdwfHHHQ7GEGQX+DIceyBFQgn5uft17K/q2jYdfJVc7cOLtLmWxV+OKvHFljZm88y4Fqnu2RmXkIKvOQoqdmFfOU/STI6nRoUvGs911pw2gnt5juI/904oJpel3p/7Xw5zf+OUBn+G3JxtDY0Kl9E7SeREI/+yro8B86Qnc4+nb7IpeWxsSALYRIEOSXOhUs4FzyteUAt4m5d2pu8+x/SC2u9GjpW/fHCqTlIxXbVjVZjtDUGJ6sLROZ0OdFBK1jo8uVR+hwoYicu33jnJTswU7Tqq10WqP8ykEOSL553Z3sa29zbLZ7tlUtgKrId1cfq5kc4iCQtx9+eBhB2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZtrxjomHWewQKfP6UC7djh9LrTKdoifWzLtTupJCmU=;
 b=mTAFsQd5kszpPfPWpRbQyYOZGSzWjnunx7F484HBLCKbobPdatLdo5UDQhKM6RHcfqyzN6ZHaGk2cG1lR8UvTi8Zx41PLptkr5SUuDVorLaUJm9lZ60nsmuxg1VJl1Iqofk9Vr44BLtB272F8mk3FcRf5Yug1if+c9HVXpoF1ga74hD5sn0YpGIGLKgeTnFz1K3RIV4wVW6VeGdBG+9k8jsHwOZ7SeE1bb5/yu7PRXfQcIbBWk5/fOVkCiYvK1xYz8pqpJBWKfd6aDOC071341+aPKTP83qTJzREjA7lvPhkQawt1PPQ11QtRAruXemK/zwx6bkPsD2vQZeNH4ISsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 07:58:10 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 07:58:10 +0000
Date: Wed, 9 Apr 2025 09:57:59 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 5/5] sched_ext: Make scx_has_op a bitmap
Message-ID: <Z_Yoh6Is2BaxwdyC@gpd3>
References: <20250408230616.2369765-1-tj@kernel.org>
 <20250408230616.2369765-6-tj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408230616.2369765-6-tj@kernel.org>
X-ClientProxiedBy: MI2P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::11) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a863ec-4239-4e94-f59e-08dd773c4549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wPiiCmr5hqVFjNL+pZqFVxXx6oGmo5lkZIwPmAbhzadKBBS5O2qVnWhAA5Kc?=
 =?us-ascii?Q?7fDEy8p0/hn1AvbxWaE3DevIwDpFtF5VgmDvY3SeyvaqCzE92n8Xp9b7FFo1?=
 =?us-ascii?Q?L7CJDfKDBq52EYmWL1dNILdow//e58SHe5gIcKnDFsvPLNAFSndth08A19/o?=
 =?us-ascii?Q?S6wWi25KsRGBMzxDnT3UULiHpQZ/yedm0DV7BoucAq8fOntVoL8La/bGOtZ+?=
 =?us-ascii?Q?2ia99QM64A8kYzDQO1Si8i33pldzb4K6eAZXDVQXXp8sai+C/d4oVq5Y+TNk?=
 =?us-ascii?Q?XBcoHjXs6V5n9jxG/aHsG91SBbRfmpdZOvNSPysN3rqlZs56KKaE5gWX3KrO?=
 =?us-ascii?Q?/gQkVYhVROmEi0W/JInJL6sBEUKHjZBvf1oWsFZCVnwEWvInguL2c7RR3WRE?=
 =?us-ascii?Q?M9ArRuk4wBL0CoeQYAdvLHwboPJrQYAuJGpeldKZTHHyg61her9Xls33Fo/F?=
 =?us-ascii?Q?TyWBqHD+dJfyKSclbUaRAzQSMO+68Ae4hkSQxVEQXzCflmEeFcGlHMsMofo2?=
 =?us-ascii?Q?yD2hzMq4DX8kEuNlezefiBwrmbHIANoxG1bvSdrjOS4KNNiV2as6XLQmW5p1?=
 =?us-ascii?Q?V1vmHqvTEujF8VQcQ5IXw0sxyzvsLufeN2MeB7XloUO+itpbg0IQ3KoU/yVx?=
 =?us-ascii?Q?gPkZAUv4G4TrC/bkwWPCBxnHWwvR+FxlH7DP4axCxO11K4ODXj+hmk/xA87l?=
 =?us-ascii?Q?I8oG2aUNKAFuaOeZQ1DIPMQxCPCLOoA08dZ5/yDAZ30oE4tB0oMqK041r0a0?=
 =?us-ascii?Q?+iVu9erWljXYayqBPG59n7QtpBf9HgyPDY1qH3cu4XsomxexjZjU9uWqSvKq?=
 =?us-ascii?Q?VYfctsaxG1VA0xVCR0Y330qA74NOnLUCnX/Wvx7JiRlm7joK7L74nH8PEuql?=
 =?us-ascii?Q?XFDN3KVxBNwb5E9ly1XllIsOutyx4+qHH+DEEOcoEtgZirnQCzKh35mAtrvx?=
 =?us-ascii?Q?nmsofP0/PhfQMv8tslkRCdFuDbyJ/yI2LIrnFCIyxwSHAugLgNYOnL5zoLwF?=
 =?us-ascii?Q?6Etz6HNbTyHtNDj6s9nQd62H71xeJsHZuEKImGlZcQrU0+rTGmViYE6ncCh7?=
 =?us-ascii?Q?ApCp6bid6kLAE2OnilfO9KF0+N2BARuhg5Z18EFZzeoaeDoDXXRJr7dOGWum?=
 =?us-ascii?Q?kr5BwVQ/xXBW5kmxnB4QQ+qBHL4Nh0Kdv91tgtPKxtz5mooZpJCl6bZiqdg1?=
 =?us-ascii?Q?qVnBhv+EANdzXNTVrfGKk6xj2E+ovZ9ORUS7rDcGvzS/bHSpx3W7tJJS9a3N?=
 =?us-ascii?Q?l+f2Wo1lH4c7Gq1kBwfWSooy0Bc8r12ZbeCB4HChzDOQufrX6Td8chmUKrAF?=
 =?us-ascii?Q?IwRTyibq8a1j5BpRtPABJPNt76Af7YCx042FbvTLaqDKp5/dcDOS5QWeqxZ4?=
 =?us-ascii?Q?xURMYK+t/Fts+rbu8E/+9Vjblo0h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xf8nPkrAisFx6+gwex0zV3FXaxejFB8LwO7xO5nDutRdOnbPvNknobYOkNUR?=
 =?us-ascii?Q?LjueT0LhlfOu2j3cTcbyyS0HtlTtnvQ1oYsoLdmFVn2AlIrqENViP9C7RSv2?=
 =?us-ascii?Q?yHV2ktdjibT+4mhB4QQ8X37eWB/diuWmK1APDsuDY1vtnhSUqfj6+WhMBk3T?=
 =?us-ascii?Q?euoEWmcwH1DMCNq2LYxzuGE3glh/nP+qk1gF3E8X5D/uSQZVOhZw3/pkhYuf?=
 =?us-ascii?Q?vga1SXrqYODuCjtrgCe2YqnUR2Y1FJAR3Q+6KYVi3b59T3/WiLA5abF2mBUd?=
 =?us-ascii?Q?E9bsC7ZENP8Pstj2y7pRFdJ4LibLQze1Ji8LNf1gISFATMm87HaAPkkf4E+9?=
 =?us-ascii?Q?cyJu+Uvqaw7rHwLH6I7CFLGX/TWmpAMP6/+UoGlFQyz1jVK2ZcAKTzH9txa/?=
 =?us-ascii?Q?U33mv5C4ad8rO07o1GkzIY65bGoFL+H/U5q0LJkU3mIZD7wG4NigosIjYoxj?=
 =?us-ascii?Q?N5KQHchMG/QTdLURqqf5nbG6U1ffHC5+VYgTdLArSiWFflTEXpZwDvWETlMY?=
 =?us-ascii?Q?lH3P5cZp3xWc3CkUdj+gqBMSUNPuWe/9hnjiTdbQSuKL6Wo3z1MVrZwEVluf?=
 =?us-ascii?Q?2+GZaiUvG771uDCq6RsrIURTvEGrhA8BrhLP4v4coB0rIvuljZbO5frRpBLz?=
 =?us-ascii?Q?fI3BA8za498V2gWBu37eg5H1xwAbPxEv8qJTW9KuyasmdJKFtMGR+w6+hI9v?=
 =?us-ascii?Q?0LNKOOOn+MwWtnQV+FkTqtes8G0ZOyERCw5G7eD08gUWCHI/YXb+trTOlAdy?=
 =?us-ascii?Q?gKOpk3PRV8hEt+S1kvdrDNzXvOj4wG87wLRtQ9p5z+wUpJQ0fhbOL0+XD2oU?=
 =?us-ascii?Q?g0q+E2d2EYi93qm99CJJ5EuU6NlQrw3Y2L41c7EAcWOzwJIQRJ11n+62UH5O?=
 =?us-ascii?Q?qESm9LdA8Bz6GpyHtGK9eAozGW+vZ+3w84QHP+zjQyJysifDOs4FEIJfExnN?=
 =?us-ascii?Q?CEHvS9WVwPpCoP1YMvxyrKlmzBCEPD/l84iLaJ0yzlZEWP+G7nM/9xzGKPfA?=
 =?us-ascii?Q?ztuaL/qdAz/SStHaaqQLQcz3TO2u7sacU6nki7JDQhqN+DpXpSwQ+wO9vBa+?=
 =?us-ascii?Q?QJbYa8dqgKNACEg6hSTWQ0mAUAfzpoXzDsahWoLQKERC3BcnKCW+FiM2Tyh9?=
 =?us-ascii?Q?L0mztKBp2XHguY4nuNHfg6F186iQIcbFM2Hmj/PRwcNcKxJKr93nnP/trLoP?=
 =?us-ascii?Q?KyyrlvbanyUjib3Gh7pYVJ4Dw2otS+skHG3Cbpc2XW4xUrx6HmBuAlFD2iBu?=
 =?us-ascii?Q?6ufh9sR5XnLPOkjYt6XkqE7khgw9PJJqrZnc/o+9HLppIiTi3kGM6GXTZ1WX?=
 =?us-ascii?Q?T47RLPliEw2SnXN3qHe+5zR3fUuJwyh+bWp0D1XpMkJ6fsHy/jbX0e8Xj1pA?=
 =?us-ascii?Q?TzrNL0WEJ0+tUhIzuFtU06AsX+wJEgrpf4srElq+fJzPaOdbGiiBnlr9t3D4?=
 =?us-ascii?Q?EeGeSuAijwQSwc8mfFsJM/OF7jEstE1NObbt/iexalwRvUyHHuMmo1JT5pUM?=
 =?us-ascii?Q?TzNz/fBo3hzy2RJk0CU0VqaOlplHdtncH83uKaX8I2tUvqEp6T9S6MbMOzAZ?=
 =?us-ascii?Q?5Yqsd7JSBjrEx8SPkaJ4YVcwBYGa6azyDt6y7K/e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a863ec-4239-4e94-f59e-08dd773c4549
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:58:10.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNE6SIuehB0urKti0jWqSXvRqrC3aGPAuTTFbYVj3c4IyXp7t2X8WdjDNfP4t1c4x96EeNp+otv7EsGG4sYf7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681

On Tue, Apr 08, 2025 at 01:06:05PM -1000, Tejun Heo wrote:
> scx_has_op is used to encode which ops are implemented by the BPF scheduler
> into an array of static_keys. While this saves a bit of branching overhead,
> that is unlikely to be noticeable compared to the overall cost. As the
> global static_keys can't work with the planned hierarchical multiple
> scheduler support, replace the static_key array with a bitmap.
> 
> In repeated hackbench runs before and after static_keys removal on an AMD
> Ryzen 3900X, I couldn't tell any measurable performance difference.

At this point I'm wondering if we should just do something like:

 #define SCX_HAS_OP(op) (scx_ops.op != NULL)

Do you think the bitmap can provide some measurable benefits? For the most
frequently used hot paths (enqueue, dispatch, select_cpu, running,
stopping) we likely have to fetch scx_ops.op anyway, so cache-wise the
difference should be minimal.

Thanks,
-Andrea

> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  kernel/sched/ext.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index f0ed0cec4c98..8ae85ec6d9a2 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -928,8 +928,7 @@ DEFINE_STATIC_KEY_FALSE(__scx_switched_all);
>  static struct sched_ext_ops scx_ops;
>  static bool scx_warned_zero_slice;
>  
> -static struct static_key_false scx_has_op[SCX_OPI_END] =
> -	{ [0 ... SCX_OPI_END-1] = STATIC_KEY_FALSE_INIT };
> +static DECLARE_BITMAP(scx_has_op, SCX_OPI_END);
>  
>  static atomic_t scx_exit_kind = ATOMIC_INIT(SCX_EXIT_DONE);
>  static struct scx_exit_info *scx_exit_info;
> @@ -1055,7 +1054,7 @@ static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
>  #define scx_error(fmt, args...)							\
>  	__scx_error(SCX_EXIT_ERROR, fmt, ##args)
>  
> -#define SCX_HAS_OP(op)	static_branch_likely(&scx_has_op[SCX_OP_IDX(op)])
> +#define SCX_HAS_OP(op)	test_bit(SCX_OP_IDX(op), scx_has_op)
>  
>  static long jiffies_delta_msecs(unsigned long at, unsigned long now)
>  {
> @@ -1774,7 +1773,7 @@ static void touch_core_sched_dispatch(struct rq *rq, struct task_struct *p)
>  	lockdep_assert_rq_held(rq);
>  
>  #ifdef CONFIG_SCHED_CORE
> -	if (SCX_HAS_OP(core_sched_before))
> +	if (unlikely(SCX_HAS_OP(core_sched_before)))
>  		touch_core_sched(rq, p);
>  #endif
>  }
> @@ -2156,7 +2155,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>  		goto local;
>  	}
>  
> -	if (!SCX_HAS_OP(enqueue))
> +	if (unlikely(!SCX_HAS_OP(enqueue)))
>  		goto global;
>  
>  	/* DSQ bypass didn't trigger, enqueue on the BPF scheduler */
> @@ -2972,7 +2971,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
>  	if (consume_global_dsq(rq))
>  		goto has_tasks;
>  
> -	if (!SCX_HAS_OP(dispatch) || scx_rq_bypassing(rq) || !scx_rq_online(rq))
> +	if (unlikely(!SCX_HAS_OP(dispatch)) || scx_rq_bypassing(rq) || !scx_rq_online(rq))
>  		goto no_tasks;
>  
>  	dspc->rq = rq;
> @@ -3373,7 +3372,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
>  		return prev_cpu;
>  
>  	rq_bypass = scx_rq_bypassing(task_rq(p));
> -	if (SCX_HAS_OP(select_cpu) && !rq_bypass) {
> +	if (likely(SCX_HAS_OP(select_cpu)) && !rq_bypass) {
>  		s32 cpu;
>  		struct task_struct **ddsp_taskp;
>  
> @@ -4638,7 +4637,7 @@ static void scx_disable_workfn(struct kthread_work *work)
>  	struct task_struct *p;
>  	struct rhashtable_iter rht_iter;
>  	struct scx_dispatch_q *dsq;
> -	int i, kind, cpu;
> +	int kind, cpu;
>  
>  	kind = atomic_read(&scx_exit_kind);
>  	while (true) {
> @@ -4731,8 +4730,7 @@ static void scx_disable_workfn(struct kthread_work *work)
>  
>  	/* no task is on scx, turn off all the switches and flush in-progress calls */
>  	static_branch_disable(&__scx_enabled);
> -	for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
> -		static_branch_disable(&scx_has_op[i]);
> +	bitmap_zero(scx_has_op, SCX_OPI_END);
>  	scx_idle_disable();
>  	synchronize_rcu();
>  
> @@ -5328,7 +5326,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  
>  	for (i = SCX_OPI_CPU_HOTPLUG_BEGIN; i < SCX_OPI_CPU_HOTPLUG_END; i++)
>  		if (((void (**)(void))ops)[i])
> -			static_branch_enable_cpuslocked(&scx_has_op[i]);
> +			set_bit(i, scx_has_op);
>  
>  	check_hotplug_seq(ops);
>  	scx_idle_update_selcpu_topology(ops);
> @@ -5369,7 +5367,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  
>  	for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
>  		if (((void (**)(void))ops)[i])
> -			static_branch_enable(&scx_has_op[i]);
> +			set_bit(i, scx_has_op);
>  
>  	if (scx_ops.cpu_acquire || scx_ops.cpu_release)
>  		scx_ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
> -- 
> 2.49.0
> 
