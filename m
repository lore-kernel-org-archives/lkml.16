Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C323C8A4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576078; cv=fail; b=mK4+2VdpAw9ukLlfsQR6QabvusnJPJbNtiPXHGEPVC9RvK+lVShAd63d535TVsdElCbgv2yR7jnnT19ItU/wiMZS7EaFE57QYIQ2fM/wVuBTfl71O5YHidXEU/9T4Rb+HUzh+ZagocEVTfBGc66WCNuzHDAojFmC677hU7qHkQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576078; c=relaxed/simple;
	bh=cngrGR+zmy79fVBR+qe/8eQuslLZMMcbBoVBKhwvMCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qid0b9SvmRse88I/sCB8IUJ6BgPiAHAGS/eg23H7HF6qNH2NTloDJyb046034X4FMVnRYTWgGYK0u4alwDvuIfhxY0lhRiaVbnt81T0f11RgcARkXJ2jw4gnxAH8coCIDYaRIj0M8ro/BQ2SNp8EVfARSyaWpvMRORzJXSLAsdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CF2ZRMqL; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CF2ZRMqL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXGyD6OaiTR6fAu63IPinuwcqI9IHuMGwlkAf51mte2u/q22etDIGhuyBKfw0SDaGdPR7DJcMbln5FmoyxjkfX5rW3ysuZaE7YKADBqt2jVZypF1KZO5N4X2ojYFBsiFH4ZiYL7eQTq6OvPsUSz/c1S4L7jaLq/NrDVcFaH+7cXyuD1C2fcqOJYtzcScZVlLHPi+7ItxUDKCXtCRn3cNjrdZREt5BH4uegGjgwF1pYmGrTvy4PJDaVQdiwm5BxTp0UZDJ3M24AOAfweN+/D0nSFHjujCwoyYGHWeT5hCwrVdQ//YE/Mh56yy8dqGlGzofmFTjV58D3SLd8qajez6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/r6FXXi4q/JWTTxmbmLH0rjvV07dUdZdRNCgarfkBo=;
 b=QLPM48PAaA4xduGuSUCUTJ9ILVz1ElfS6YCd/H6p+eH1IIb6PGDG/T1LUKf+bp9s79Ypedy3SK1OzgUnWgRPCz64+XzYexX28jwwOl3r4P7Fa4VA0A+4FY7kv/WJhowInmXNyUo16nlzzEdEPoxa5ptivn19GG5w8mMWGTbIeUMhbNy6AeD140/D7EsRXnL+HUEmzyM8RLURWJozTkjzNmuCCdJI0oMDzzcRgpABiHqHuP6Svwex8W0VYWxLcb6AYqo6Rr+LOn+2KqQlRKaW3n7PZaadS/sQ/sptcTbBE0Q0CmpfxbGdxMAaPMpLjuA0AdpbTwEiI8xdLUFxkFCmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/r6FXXi4q/JWTTxmbmLH0rjvV07dUdZdRNCgarfkBo=;
 b=CF2ZRMqLS25WonauSAhRMkn84R2Efr+Cj2kDmakvhunygSoEHeUGI1yeUvwQjZrWrQWeTM/a8poLT1H0irDj23g+s1mqSc0cOv8THgx59HQgbtfpGPOoPU3vprfVBQk3x8GREJZ2APgE3iq6nIFghXx/+kN3Zcu9JB4DhzuYGsxZm+ZpCH5z7bSblfpWmaG4k77Pkun2F7NxN08sZ6xh6hZeSqbxh4TedfQkY0QvBLgiCfwJFWq1A98nvCmIX/wX5bOwzw2yJ1gnS3mYwfLzHT8887HpBVDLmbnY/JKB0awZnPd1fqyBqg6Y67yeCHwRBugxtry1BH1BBrrSVMtRAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 10:14:32 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 10:14:32 +0000
Date: Fri, 25 Apr 2025 12:14:13 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] sched_ext: Use dynamic allocation for scx_sched
Message-ID: <aAtgdcpNW6Rj4m_f@gpd3>
References: <20250423234542.1890867-1-tj@kernel.org>
 <20250423234542.1890867-4-tj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423234542.1890867-4-tj@kernel.org>
X-ClientProxiedBy: MR1P264CA0183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::17) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fac247-5f51-4d60-e079-08dd83e1f70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IPVQjeQPoB75GMekNo5wVOT/fmvh23BRP421+z/QLRsCJN8dtYq4eVBfW/Jg?=
 =?us-ascii?Q?diektOYjdBhC1BrwSWEgtEQpR1CECLC+QfN6cdzm9dywZTR+t4R6BHP8zMAJ?=
 =?us-ascii?Q?9Ch6kB77LmJgtiJTSP/gZnhzEWNchq8PpeOuhEI44r5vi3amEKKQxEbVH7RG?=
 =?us-ascii?Q?HL8Dt4GY3t933DjBr2HVuxIPZQjX5TiD20xUzxWLi6HgMVxqQG+mfT1seQz9?=
 =?us-ascii?Q?IMmIx7w7Q2ejKFyfgTK+O+EV71wIcJTvj5mFZQD0230AyPbx387rgjPQ+uZQ?=
 =?us-ascii?Q?j77A6oH9AW9j2jWMccPP6nq7E0Yh1S5SddZSgQQUGBH6G+/mNMeJOMY/4Eoy?=
 =?us-ascii?Q?5dSi/3/kWcs6YT1f1yp3ZeO01EkIlltsYhW38fw/ShZums5OOiP+6ZKbmxjY?=
 =?us-ascii?Q?/HTtHExs5iMxiA8HiLP5rwdV2n5ToN5QLUxTPNDoEYhTGK6JZPC/PInKEzYz?=
 =?us-ascii?Q?HNboNfRKop8VBJJDGebcKCBu+qdSrocpoSDk73N12GMdX8zlv4qXLiAZFjwC?=
 =?us-ascii?Q?7eXBculCNTDdGvKqhhK/zQzUPVaA5tbzkCyM2XV9o8XLyBw8vYQgxFm6t9l1?=
 =?us-ascii?Q?9wfMIfzdE44QT+hqpQcctNSkcZijsH97DGc0B/x6UNKMo5UJDB5NApauslKX?=
 =?us-ascii?Q?AOFisVwj9Kvly/Ca3JIVyX58hLUNjrsnzjPCCYLW4FFjjTe72us3+gJ+luIM?=
 =?us-ascii?Q?ASLVNqYznJIyFno/SW74n7DfCDMdtHS9m866sBadVg+QH2ZK7UKYTQOhgj7o?=
 =?us-ascii?Q?tccj9E3FZFDbSwX/N+y5qrGtPKdcKfVuL1R31WSsrrDZblnY4/RK9Jafi+9n?=
 =?us-ascii?Q?l0sI5ThGrPulR85sUCRj2BPs3zbJPCBcz2oQ0xzEMcfG9ULJwz4n5lfpb7M8?=
 =?us-ascii?Q?v+eK413TpdALgHdbcIETBz6DAmbEIC1uqft4qIcrxGdkbvtxPHzS6x0YmM+y?=
 =?us-ascii?Q?Rvbkl3T5S6OEqkJA3f4Cjpe0+S5sptuQmo2KzzNcnW9i8BBYt+uW1uY1G+Ov?=
 =?us-ascii?Q?X87PuQsyvs9eZNv7OGmiO9l9ilSjHh4faOPuPsrPwwxmSyFXKq008RDBtLCY?=
 =?us-ascii?Q?NxSo3tkdrSkGjrNxGMVc+5nHuanFPSwAg3bQhZjWhdxzJ+X/MycKchdxYFvQ?=
 =?us-ascii?Q?W0h4JqhJXrG7driCWuL9Rjxb+vfoUMPBruVGg/0NcM2BXYK3eiLZHgG0DnbJ?=
 =?us-ascii?Q?NDX5AN9gjhZlffGK+3IwkeHlGJHcNtXhuK/wTAomyiRxWm6riwKsj+eO/JAk?=
 =?us-ascii?Q?Z+OipekaV3tl0lXUW8QDN6AdBSivw8bivpJfuR/JysYwWG49EZohxIk7V+8r?=
 =?us-ascii?Q?e5aEmCDXtVkzOSItwHQIVWye2GOoLnAYahGvalrxikG43Db+q9dbR/Bk+E7Q?=
 =?us-ascii?Q?5Gi9RCTnyLQn4/O3knIrqL/dON848vYIRYz1UeaRaUwSEPumDZso/fZlwigH?=
 =?us-ascii?Q?/gV/IRqM71k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q+c8JN561TmnGU7pLvMXGIQ3RqhDPtIxEO7UU+zTu+iQyMdmKivRoV97K9hB?=
 =?us-ascii?Q?Nn7VCsBazXQyPdDFBvapuZMpvJ+B9oO4QUz/S93NE5+KnfDhdkvRUQs5KQU4?=
 =?us-ascii?Q?lIiep8/jM1gfLjsSLD3J1zgmqGGydrOXewnuukQGDfxZjH+t18ZmRcyjfHCx?=
 =?us-ascii?Q?Jo0P/5fUKgKTBlVb5tD/azOwVBOL904yMYjhn5CDLchH8D8eFuLtWmhpSlN9?=
 =?us-ascii?Q?hQVcUrIABBVBzoi/SsUFlBJjcNXfkllXm20odFU7cKFSov3HErHwd9aKxxIt?=
 =?us-ascii?Q?Sdz0qQx5pQe3F1bbr6uy+dru7wNjDjV8n+ToANIKpF6LULaOtTPgSJfI0wRo?=
 =?us-ascii?Q?8iazoUObOqaWasU7NB4ZOnNAqRNCX88tHmN4sT62tY3mSlbOMfNEAePZvwZt?=
 =?us-ascii?Q?8t1HwZbgYko3h5zvOpQywyITCLCF5bdQjsoHX9s8YdKO4EwHHoS3NeKxMl9r?=
 =?us-ascii?Q?6QfOCN16UPL9DwXAmDOhVnK5txrN60knIzJSyqf8tFK4XxDUO+BrV6FiMpKy?=
 =?us-ascii?Q?8D6xGZzAMQIZSP7Misqd0TZxzfwjVXylH8fLmzrhxC7IJbP+J8jI1fX5e/2B?=
 =?us-ascii?Q?8Bqy9fDqAx5jsbyJvAJHtoy/LBAp/NxLJi7lNLk/Qb3mNNUZvPNFNSZ1Nhhm?=
 =?us-ascii?Q?F16hfrbGUdzjYce4Tsn/SkdS2Vf4ZY6thm6uPM7SjenmXWN50BKBOXlUaTsK?=
 =?us-ascii?Q?MJvYoUnQCwevj6+mnA4oFFg6MjJz9h6dG/CMLy/eLfe4Kl4KyGaITI1/m0aA?=
 =?us-ascii?Q?qe0tNCeu0GqW+M8GuxyHcvsWcufYfAd/ExFQwzl/671wNibUNMLYCSbIXfjK?=
 =?us-ascii?Q?2agLeOp+maAFCPTh6VWq2K68/6ov9ky3l0a/kYgTYsB54t75F9idJsGOQD1K?=
 =?us-ascii?Q?4EOsUzJY62fmCnbQ/60Nbk/DZCV992Zx8l+mKV47K7bVyVh4R6ilmV5NM/84?=
 =?us-ascii?Q?96y3r06/kFC8GSANUiTud4qccCWxDxILueTTyW0hKv1G7FUweNWkc9Bd1fBZ?=
 =?us-ascii?Q?hfOLLfPA7pbLU5SwfgrbLet7bdYXwEwn52sJGs3wXSPZ6xIYiRzJ/YcFd2pS?=
 =?us-ascii?Q?RMAaayS7r6/K9KWfOYhcKWOF4tUeVUgIYAekzQBmq1pJ9Gok6Sc1J8eAwBGT?=
 =?us-ascii?Q?zQxmj2MSsw5HIQcBfnu7S5yTHEotoaKsFMID9yFxlQRdOHEQdk1q1GYoZNm9?=
 =?us-ascii?Q?Va6TTUHPnp3u5bR46Ih2OtI/4CI5p0Ii+kxilElfZ0a4aEBo7FelLGuCJeIV?=
 =?us-ascii?Q?h/bERMUAl3V+f8X4zwP0lI/P4dXw8MQwefC23tuUPzWuKybYY5uPpOhSu+c0?=
 =?us-ascii?Q?/CliFgtLUZNEF4Yq6ljHDaHbvauLczFun9BNN770FWOKHnKNP8wDyd3I6FOx?=
 =?us-ascii?Q?9Rgj8xGSN7AHPTK2856gh0i8MIoPtQ7/eGs6xH9C0RvEb74Xn5l1cZlOG/yV?=
 =?us-ascii?Q?pQFiai9dQeM7IKsdOyInAwi/2RT5CGB89yUc6+0+5AbAIIbwJcc1LpQcIaV5?=
 =?us-ascii?Q?PKjkGOPlrS6JsEAndDHsybrmsf7NnvlKA9sJNyjUATYQE71+O72lel78RsHJ?=
 =?us-ascii?Q?6YfWygTXcz+FwFtFlqa8F1XGBG3+SEbQO0MsWGaH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fac247-5f51-4d60-e079-08dd83e1f70f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 10:14:32.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRXaTy+9E67JlAKji4xrSPKCgOOtt2Lrt2jdlStz/jb7vdb5LmBGQG2I6Taa44uzA5xZhlymrjuynalZpeOIcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111

Hi Tejun,

On Wed, Apr 23, 2025 at 01:44:41PM -1000, Tejun Heo wrote:
> To prepare for supporting multiple schedulers, make scx_sched allocated
> dynamically. scx_sched->kobj is now an embedded field and the kobj's
> lifetime determines the lifetime of the containing scx_sched.
> 
> - Enable path is updated so that kobj init and addition are performed later.
> 
> - scx_sched freeing is initiated in scx_kobj_release() and also goes through
>   an rcu_work so that scx_root can be accessed from an unsynchronized path -
>   scx_disable().
> 
> No behavior changes intended.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  kernel/sched/ext.c | 151 ++++++++++++++++++++++++++-------------------
>  1 file changed, 86 insertions(+), 65 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index ad392890d2dd..612232c66d13 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -772,7 +772,8 @@ struct scx_sched {
>  	atomic_t		exit_kind;
>  	struct scx_exit_info	*exit_info;
>  
> -	struct kobject		*kobj;
> +	struct kobject		kobj;
> +	struct rcu_work		rcu_work;
>  };
>  
>  enum scx_wake_flags {
> @@ -933,11 +934,7 @@ enum scx_ops_state {
>  #define SCX_OPSS_STATE_MASK	((1LU << SCX_OPSS_QSEQ_SHIFT) - 1)
>  #define SCX_OPSS_QSEQ_MASK	(~SCX_OPSS_STATE_MASK)
>  
> -static struct scx_sched __scx_root = {
> -	.exit_kind		= ATOMIC_INIT(SCX_EXIT_DONE),
> -};
> -
> -static struct scx_sched *scx_root = &__scx_root;
> +static struct scx_sched __rcu *scx_root;
>  
>  /*
>   * During exit, a task may schedule after losing its PIDs. When disabling the
> @@ -4417,9 +4414,23 @@ static const struct attribute_group scx_global_attr_group = {
>  	.attrs = scx_global_attrs,
>  };
>  
> +static void free_exit_info(struct scx_exit_info *ei);
> +
> +static void scx_sched_free_rcu_work(struct work_struct *work)
> +{
> +	struct rcu_work *rcu_work = to_rcu_work(work);
> +	struct scx_sched *sch = container_of(rcu_work, struct scx_sched, rcu_work);
> +
> +	free_exit_info(sch->exit_info);
> +	kfree(sch);
> +}
> +
>  static void scx_kobj_release(struct kobject *kobj)
>  {
> -	kfree(kobj);
> +	struct scx_sched *sch = container_of(kobj, struct scx_sched, kobj);
> +
> +	INIT_RCU_WORK(&sch->rcu_work, scx_sched_free_rcu_work);
> +	queue_rcu_work(system_unbound_wq, &sch->rcu_work);
>  }
>  
>  static ssize_t scx_attr_ops_show(struct kobject *kobj,
> @@ -4709,14 +4720,15 @@ static const char *scx_exit_reason(enum scx_exit_kind kind)
>  
>  static void scx_disable_workfn(struct kthread_work *work)
>  {
> -	struct scx_exit_info *ei = scx_root->exit_info;
> +	struct scx_sched *sch = scx_root;
> +	struct scx_exit_info *ei = sch->exit_info;
>  	struct scx_task_iter sti;
>  	struct task_struct *p;
>  	struct rhashtable_iter rht_iter;
>  	struct scx_dispatch_q *dsq;
>  	int kind, cpu;
>  
> -	kind = atomic_read(&scx_root->exit_kind);
> +	kind = atomic_read(&sch->exit_kind);
>  	while (true) {
>  		/*
>  		 * NONE indicates that a new scx_ops has been registered since
> @@ -4725,7 +4737,7 @@ static void scx_disable_workfn(struct kthread_work *work)
>  		 */
>  		if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
>  			return;
> -		if (atomic_try_cmpxchg(&scx_root->exit_kind, &kind, SCX_EXIT_DONE))
> +		if (atomic_try_cmpxchg(&sch->exit_kind, &kind, SCX_EXIT_DONE))
>  			break;
>  	}
>  	ei->kind = kind;
> @@ -4740,7 +4752,7 @@ static void scx_disable_workfn(struct kthread_work *work)
>  		break;
>  	case SCX_DISABLED:
>  		pr_warn("sched_ext: ops error detected without ops (%s)\n",
> -			scx_root->exit_info->msg);
> +			sch->exit_info->msg);
>  		WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
>  		goto done;
>  	default:
> @@ -4807,41 +4819,43 @@ static void scx_disable_workfn(struct kthread_work *work)
>  
>  	/* no task is on scx, turn off all the switches and flush in-progress calls */
>  	static_branch_disable(&__scx_enabled);
> -	bitmap_zero(scx_root->has_op, SCX_OPI_END);
> +	bitmap_zero(sch->has_op, SCX_OPI_END);
>  	scx_idle_disable();
>  	synchronize_rcu();
>  
>  	if (ei->kind >= SCX_EXIT_ERROR) {
>  		pr_err("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
> -		       scx_root->ops.name, ei->reason);
> +		       sch->ops.name, ei->reason);
>  
>  		if (ei->msg[0] != '\0')
> -			pr_err("sched_ext: %s: %s\n",
> -			       scx_root->ops.name, ei->msg);
> +			pr_err("sched_ext: %s: %s\n", sch->ops.name, ei->msg);
>  #ifdef CONFIG_STACKTRACE
>  		stack_trace_print(ei->bt, ei->bt_len, 2);
>  #endif
>  	} else {
>  		pr_info("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
> -			scx_root->ops.name, ei->reason);
> +			sch->ops.name, ei->reason);
>  	}
>  
> -	if (scx_root->ops.exit)
> +	if (sch->ops.exit)
>  		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, NULL, ei);
>  
>  	cancel_delayed_work_sync(&scx_watchdog_work);
>  
>  	/*
> -	 * Delete the kobject from the hierarchy eagerly in addition to just
> -	 * dropping a reference. Otherwise, if the object is deleted
> -	 * asynchronously, sysfs could observe an object of the same name still
> -	 * in the hierarchy when another scheduler is loaded.
> +	 * scx_root clearing must be inside cpus_read_lock(). See
> +	 * handle_hotplug().
>  	 */
> -	kobject_del(scx_root->kobj);
> -	kobject_put(scx_root->kobj);
> -	scx_root->kobj = NULL;
> +	cpus_read_lock();
> +	RCU_INIT_POINTER(scx_root, NULL);
> +	cpus_read_unlock();
>  
> -	memset(&scx_root->ops, 0, sizeof(scx_root->ops));
> +	/*
> +	 * Delete the kobject from the hierarchy synchronously. Otherwise, sysfs
> +	 * could observe an object of the same name still in the hierarchy when
> +	 * the next scheduler is loaded.
> +	 */
> +	kobject_del(&sch->kobj);
>  
>  	rhashtable_walk_enter(&dsq_hash, &rht_iter);
>  	do {
> @@ -4858,9 +4872,6 @@ static void scx_disable_workfn(struct kthread_work *work)
>  	scx_dsp_ctx = NULL;
>  	scx_dsp_max_batch = 0;
>  
> -	free_exit_info(scx_root->exit_info);
> -	scx_root->exit_info = NULL;
> -
>  	mutex_unlock(&scx_enable_mutex);
>  
>  	WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
> @@ -4885,13 +4896,18 @@ static void schedule_scx_disable_work(void)
>  static void scx_disable(enum scx_exit_kind kind)
>  {
>  	int none = SCX_EXIT_NONE;
> +	struct scx_sched *sch;
>  
>  	if (WARN_ON_ONCE(kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE))
>  		kind = SCX_EXIT_ERROR;
>  
> -	atomic_try_cmpxchg(&scx_root->exit_kind, &none, kind);
> -
> -	schedule_scx_disable_work();
> +	rcu_read_lock();
> +	sch = rcu_dereference(scx_root);
> +	if (sch) {
> +		atomic_try_cmpxchg(&sch->exit_kind, &none, kind);
> +		schedule_scx_disable_work();
> +	}
> +	rcu_read_unlock();
>  }
>  
>  static void dump_newline(struct seq_buf *s)
> @@ -5288,6 +5304,7 @@ static int validate_ops(const struct sched_ext_ops *ops)
>  
>  static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  {
> +	struct scx_sched *sch;
>  	struct scx_task_iter sti;
>  	struct task_struct *p;
>  	unsigned long timeout;
> @@ -5351,33 +5368,32 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  		goto err_unlock;
>  	}
>  
> -	scx_root->kobj = kzalloc(sizeof(*scx_root->kobj), GFP_KERNEL);
> -	if (!scx_root->kobj) {
> +	sch = kzalloc(sizeof(*sch), GFP_KERNEL);
> +	if (!sch) {
>  		ret = -ENOMEM;
>  		goto err_unlock;
>  	}
>  
> -	scx_root->kobj->kset = scx_kset;
> -	ret = kobject_init_and_add(scx_root->kobj, &scx_ktype, NULL, "root");
> -	if (ret < 0)
> -		goto err;
> -
> -	scx_root->exit_info = alloc_exit_info(ops->exit_dump_len);
> -	if (!scx_root->exit_info) {
> +	sch->exit_info = alloc_exit_info(ops->exit_dump_len);
> +	if (!sch->exit_info) {
>  		ret = -ENOMEM;
> -		goto err_del;
> +		goto err_free;
>  	}
>  
> +	sch->kobj.kset = scx_kset;
> +	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
> +	if (ret < 0)
> +		goto err_free;
> +
> +	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
> +	sch->ops = *ops;
> +
>  	/*
> -	 * Set scx_ops, transition to ENABLING and clear exit info to arm the
> -	 * disable path. Failure triggers full disabling from here on.
> +	 * Transition to ENABLING and clear exit info to arm the disable path.
> +	 * Failure triggers full disabling from here on.
>  	 */
> -	scx_root->ops = *ops;
> -
>  	WARN_ON_ONCE(scx_set_enable_state(SCX_ENABLING) != SCX_DISABLED);
> -
> -	atomic_set(&scx_root->exit_kind, SCX_EXIT_NONE);
> -	scx_root->warned_zero_slice = false;
> +	WARN_ON_ONCE(scx_root);
>  
>  	atomic_long_set(&scx_nr_rejected, 0);
>  
> @@ -5390,9 +5406,15 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  	 */
>  	cpus_read_lock();
>  
> +	/*
> +	 * Make the scheduler instance visible. Must be inside cpus_read_lock().
> +	 * See handle_hotplug().
> +	 */
> +	rcu_assign_pointer(scx_root, sch);
> +
>  	scx_idle_enable(ops);
>  
> -	if (scx_root->ops.init) {
> +	if (sch->ops.init) {
>  		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init, NULL);
>  		if (ret) {
>  			ret = ops_sanitize_err("init", ret);
> @@ -5404,7 +5426,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  
>  	for (i = SCX_OPI_CPU_HOTPLUG_BEGIN; i < SCX_OPI_CPU_HOTPLUG_END; i++)
>  		if (((void (**)(void))ops)[i])
> -			set_bit(i, scx_root->has_op);
> +			set_bit(i, sch->has_op);
>  
>  	check_hotplug_seq(ops);
>  	scx_idle_update_selcpu_topology(ops);
> @@ -5445,10 +5467,10 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  
>  	for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
>  		if (((void (**)(void))ops)[i])
> -			set_bit(i, scx_root->has_op);
> +			set_bit(i, sch->has_op);
>  
> -	if (scx_root->ops.cpu_acquire || scx_root->ops.cpu_release)
> -		scx_root->ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
> +	if (sch->ops.cpu_acquire || sch->ops.cpu_release)
> +		sch->ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
>  
>  	/*
>  	 * Lock out forks, cgroup on/offlining and moves before opening the
> @@ -5547,7 +5569,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  	scx_bypass(false);
>  
>  	if (!scx_tryset_enable_state(SCX_ENABLED, SCX_ENABLING)) {
> -		WARN_ON_ONCE(atomic_read(&scx_root->exit_kind) == SCX_EXIT_NONE);
> +		WARN_ON_ONCE(atomic_read(&sch->exit_kind) == SCX_EXIT_NONE);
>  		goto err_disable;
>  	}
>  
> @@ -5555,23 +5577,18 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  		static_branch_enable(&__scx_switched_all);
>  
>  	pr_info("sched_ext: BPF scheduler \"%s\" enabled%s\n",
> -		scx_root->ops.name, scx_switched_all() ? "" : " (partial)");
> -	kobject_uevent(scx_root->kobj, KOBJ_ADD);
> +		sch->ops.name, scx_switched_all() ? "" : " (partial)");
> +	kobject_uevent(&sch->kobj, KOBJ_ADD);
>  	mutex_unlock(&scx_enable_mutex);
>  
>  	atomic_long_inc(&scx_enable_seq);
>  
>  	return 0;
>  
> -err_del:
> -	kobject_del(scx_root->kobj);
> -err:
> -	kobject_put(scx_root->kobj);
> -	scx_root->kobj = NULL;
> -	if (scx_root->exit_info) {
> -		free_exit_info(scx_root->exit_info);
> -		scx_root->exit_info = NULL;
> -	}
> +err_free:
> +	if (sch->exit_info)
> +		free_exit_info(sch->exit_info);
> +	kfree(sch);
>  err_unlock:
>  	mutex_unlock(&scx_enable_mutex);
>  	return ret;
> @@ -5593,6 +5610,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  	 */
>  	scx_error("scx_enable() failed (%d)", ret);
>  	kthread_flush_work(&scx_disable_work);
> +	kobject_put(&sch->kobj);
>  	return 0;
>  }
>  
> @@ -5741,8 +5759,11 @@ static int bpf_scx_reg(void *kdata, struct bpf_link *link)
>  
>  static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
>  {
> +	struct scx_sched *sch = scx_root;
> +
>  	scx_disable(SCX_EXIT_UNREG);
>  	kthread_flush_work(&scx_disable_work);
> +	kobject_put(&sch->kobj);
>  }

We probably need to check sch != NULL here, I was able to trigger this bug
(using a buggy rustland):

[    5.048913] sched_ext: rustland: invalid CPU -16 from ops.select_cpu()
[    5.048984]    ops_cpu_valid+0x4a/0x60
[    5.049039]    select_task_rq_scx+0x10f/0x200
[    5.049100]    try_to_wake_up+0x17a/0x890
[    5.049149]    ep_autoremove_wake_function+0x12/0x40
[    5.049211]    __wake_up_common+0x7f/0xc0
[    5.049259]    __wake_up+0x36/0x60
[    5.049306]    ep_poll_callback+0x265/0x320
[    5.049354]    __wake_up_common+0x7f/0xc0
[    5.049401]    __wake_up+0x36/0x60
[    5.049448]    __send_signal_locked+0x71e/0x740
[    5.049508]    group_send_sig_info+0xf3/0x1b0
[    5.049567]    kill_pid_info_type+0x79/0x1a0
[    5.049627]    kill_proc_info+0x5d/0x110
[    5.049674]    __x64_sys_kill+0x91/0xc0
[    5.049789]    do_syscall_64+0xbb/0x1d0
[    5.049855]    entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    5.050315] BUG: kernel NULL pointer dereference, address: 00000000000003b0
[    5.050386] #PF: supervisor read access in kernel mode
[    5.050439] #PF: error_code(0x0000) - not-present page
[    5.050488] PGD 0 P4D 0
[    5.050523] Oops: Oops: 0000 [#1] SMP NOPTI
[    5.050571] CPU: 5 UID: 0 PID: 284 Comm: scx_rustland Not tainted 6.14.0-virtme #27 PREEMPT(full)
[    5.050670] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
[    5.050782] RIP: 0010:kthread_flush_work+0x60/0x140
[    5.050847] Code: 80 00 00 00 31 c0 48 8d 7c 24 18 48 89 24 24 48 89 64 24 08 48 c7 44 24 10 30 e6 58 b0 f3 48 ab 48 8d 7c 24 30 e8 40 6c 05 00 <48> 8b 6b 18 48 85 ed 74 69 4c 8d 65 08 4c 89 e7 e8 0b 0c d3 00 48
[    5.051021] RSP: 0018:ffffad01816f7e08 EFLAGS: 00010246
[    5.051066] RAX: 0000000000000000 RBX: 0000000000000398 RCX: 0000000000000000
[    5.051131] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffffb2f34d80
[    5.051196] RBP: ffff9b140268e800 R08: 0000000000000002 R09: 0000000000000000
[    5.051260] R10: 0000000000000001 R11: 0000000000000000 R12: ffff9b14804c1ea0
[    5.051325] R13: ffff9b1401b6cc20 R14: ffff9b1403965728 R15: 0000000000000000
[    5.051393] FS:  00007f1ff0550800(0000) GS:ffff9b14cbdb3000(0000) knlGS:0000000000000000
[    5.051463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.051516] CR2: 00000000000003b0 CR3: 000000000553e002 CR4: 0000000000772ef0
[    5.051582] PKRU: 55555554
[    5.051606] Call Trace:
[    5.051634]  <TASK>
[    5.051665]  ? __pfx_kthread_flush_work_fn+0x10/0x10
[    5.051726]  bpf_scx_unreg+0x27/0x40
[    5.051773]  bpf_struct_ops_map_link_dealloc+0x36/0x50
[    5.051824]  bpf_link_release+0x18/0x20
[    5.051863]  __fput+0xf8/0x2c0
[    5.051905]  __x64_sys_close+0x3d/0x80
[    5.051943]  do_syscall_64+0xbb/0x1d0
[    5.051983]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

Changing bpf_scx_unreg() as following fixed the bug for me:

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index d963aa5c99e1a..0e52a8dbd593e 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5752,11 +5752,17 @@ static int bpf_scx_reg(void *kdata, struct bpf_link *link)
 
 static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
 {
-	struct scx_sched *sch = scx_root;
+	struct scx_sched *sch;
 
 	scx_disable(SCX_EXIT_UNREG);
-	kthread_flush_work(&sch->disable_work);
-	kobject_put(&sch->kobj);
+
+	rcu_read_lock();
+	sch = rcu_dereference(scx_root);
+	if (sch) {
+		kthread_flush_work(&sch->disable_work);
+		kobject_put(&sch->kobj);
+	}
+	rcu_read_unlock();
 }
 
 static int bpf_scx_init(struct btf *btf)

Thanks,
-Andrea
