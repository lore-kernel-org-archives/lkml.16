Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70763221F30
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099120; cv=fail; b=kqQezJEeAGjempwf96jN4ch5TsDr+revh4kzZHMqEKuSv6RS4ZBY1VQBodyrYUWI5qSaomoPRtt4nixWbHMSATSK1sgZRKZ1sb73V20YQyNpTZLL+7Wn0RxpOvvEA5KoxaKjE6IfEVHLSvplveQA/Fwk4IHNaWloIKydB8R0Trk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099120; c=relaxed/simple;
	bh=gMQtzqdG8S3ws9bZAYC7u/Zew0/V600nJVf4xQav1nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eLlIJ47yb5DEcGP+JqRJLzmXyj/HTnICdyedkRHr+bBSzq3sjviWegvYc0ETvzui4gTnxHcAS3a+sfVbJsYxtxcmi9EoFOs3AIRyCbaWuqXrfUsdNnC0kSPJUFwzdECsvJd4rwCf8nb3HklOcm+BztVGWgJHChwr4n3HTGLbVps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DjIg10iq; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DjIg10iq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+2RuSxxWyrELbzMFS8Oz0ejMLhcbft3lAgUNKwF25CZCLLDTHaOo7IR1mOiKKJxkbAw7AF3utjYcFZ75e9Eswhj+jN6aO7LP+bcNYCQtucuotKzBaDG9LOP0KHjDE2BP5ZIQ5q8CAy5TtWFkaNz9gppCFDqAv4J+/HEreJ/D6SAtCNNFgaN7lQ4xrAjXQDST9XjNliTriQ07VzakvDg/kLBT+/84JjaJ1EjVrW54aDp0dDwbCJ0CAPAmxRq0mjHIjm639mXxQwNEAUVGOrOq26HSutEdR8dvF08DLelblhVRiSlA9uGPq8BKm6Hs6YW05I+yd9IPFBXEnqFtFyeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWhyx37bCFdJUhhwOjP4RWDDBnO7eYR7TxGGRTzMpIo=;
 b=bdjkBlwhk7BkLPDVGQrQus6YGnlQjyqgmhPy5Y9OUFXtHHO5/5WKgaL43xdX/NQssZIkUvgb42E6b0P030v49D6K0P0YoOIbZqBLQsi7fnicgapjfKC4FqtadpIjDAaciVmx1nlhv1vgWDtrjMvBLP+UQ3polfKSNpOVwTBdiPKH/oeku9mum+ynpXFyhM0UfIZfyVDnQUI5yBpHCWo+lyzzjGYOgu4bdYMRKp6IDP5ITpI5XU4Q5hTwG/pD+QMktC7DIGQN7IXpAaenRPYsFyqC4E9XNuhiSLWH0QzHUlG1wdrfFlzB3RSmYLQEQ6gtZ2svF/dOWMlwA01uSoJusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWhyx37bCFdJUhhwOjP4RWDDBnO7eYR7TxGGRTzMpIo=;
 b=DjIg10iqXIW8rlNceHWp5L5ITdTOivtPCieD30wHPdbG+OnzTBbhmvJObTRUD1uYtgJZRD8Xmu6prxWqV1YMbKCKfrWGlPyaBYcokiV4gX/4ZnRH7ZCkxc2y7UGM3nZrpYbswAD5o6jJdw7Mtod/z6sEqtCKVbTiwZaKaAGIv48t95AMYBjjjvQuxayuSBVuRWk60l8thGrIdIAtLJJ2S6PhzSUy9RlJo+CB+iM/QHGK16BQCsW+3WBuho0qMIIkjNAS6kuxIalahLMueib8LGpazyHbrhZXjqMDqaiQkOxvdxltWzxoB6P8cpOmuvEK7elZSclPMFQkqgKuCDX0DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 07:58:36 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 07:58:35 +0000
Date: Tue, 8 Apr 2025 09:58:25 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Remove cpu.weight /
 cpu.idle unimplemented warnings
Message-ID: <Z_TXIe2fVpAt-CAg@gpd3>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_RdpDkLCXm140RT@slm.duckdns.org>
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 434f380d-873d-4e6f-2be0-08dd76732a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tLCRy56uqEFYjKrHSFdNW9naLwGZw22uv0Jav7UU1MLN4toetD3m/aMwZbRE?=
 =?us-ascii?Q?IlFvFWsywemg0peCZxilEQoU+YJ5T6mG7tk3Cznf/6cBvCZMLPZ4nR/C62FD?=
 =?us-ascii?Q?K4M89mR/8Wt7/yuFAgWfGJM6E2N/5CkVTxLBrpAppAc9AtrmsREEj17NZOOu?=
 =?us-ascii?Q?rnYWAxtyMk9Ovr+qgbNKWIjI6u9VWhhUJUkTnOO5dPQCgNXfC9cWNB3l5abn?=
 =?us-ascii?Q?cG/kMJtCIdenwKFvvEs4v1jeDglqOvWcjudNUbOo3NhUUYgtjp3XVDRYG1Wy?=
 =?us-ascii?Q?HeyOklXh/Hja5Al0Ts4U7FBi6q38apSDdk23NDUbQPrbTQj6SkMOmXA1ui3v?=
 =?us-ascii?Q?YIBlcTTE2k073Ea5iEijdVdkYjebNzLtojxJutUck/A+4MIGD75HSqGqCNMa?=
 =?us-ascii?Q?i+QrmJZQezv7x7wTaOgrgkMU3lvr+/9fTF8gTUiZF16cNEbEAAoaN0g6qjm1?=
 =?us-ascii?Q?J4Nilg0wHpQ+IhlyEjYHmkpWWwDTs8B1z1dHUxEUM9/FLnzrdtz5u8n2LmnC?=
 =?us-ascii?Q?Z/YM/16XGeddmDiSLzbz2dYkUFSyMEpTZkcxwz+0XzUH9FtOmpj6HIPuV05Y?=
 =?us-ascii?Q?N4vBoM5QzCAEWtDCJsSVGKJ/A3IdMUs2CC4LjbB+eRESsYWtcg3R+XzfqeJT?=
 =?us-ascii?Q?8TWo5QLr17oA2QB4DuDWr4ePzm9gd4cPr2qajaJL6/L4v80f0SPkTbPqev8p?=
 =?us-ascii?Q?IkbkhaRXSdfkECtgRcXo+zSyODHVuVFWnmsl4iGNKnRg3H6fabvaGt4ae0Wi?=
 =?us-ascii?Q?5Nx4mQlwl6fqVha1Wr3uYVR2L66XSRwxQyWsEziz1VARSa7IEWQz/Kl8D9f+?=
 =?us-ascii?Q?pmB4RtwfVwOg6Fk4l5fQvvLOLbMX5cZVh6zjZ7o/jxUhWL0ubMtNBBmqEDWA?=
 =?us-ascii?Q?MCnQpvaRW5ZvQ9rwWELa2W4BL1SVdAd1MDBSW/f5IvhCBj/cFxXFYb9R+SHT?=
 =?us-ascii?Q?iGC/3Xw1b8wiLtjzpVaA+DhTffw5f+ALPs+CStyiyBLZjtuB8/VZTnM7SWLj?=
 =?us-ascii?Q?xOL4bMOKUzklEX1ymHd5NArFBtG8UWJXmvBKY4Dmq+OJfwNNj2Vc7MrJ6ZR7?=
 =?us-ascii?Q?3fYbK8TV4kt7wQ8dPhJKl8t5+bhBKJpqcPs4w/BIg/WR+RD2ay9kEkusKW0G?=
 =?us-ascii?Q?XGgVNEsC9dirPVIbbvlTjEjd8GVaJpWWqx3UquO1lxXiPF49Ip4ICf3XNJws?=
 =?us-ascii?Q?+M/TK6uvJDuZY2tiqzKndbbwiGhlZDIzFDrvLYIo0WLizvQcM1vWbN7QWSfC?=
 =?us-ascii?Q?gHL47rYye8xz22bufQCwJ1F+gkU1hvUnRQ1xzhWG4oIa4UGp7WJ6l1WAO9vQ?=
 =?us-ascii?Q?5DIrnSmAIWKAH4KgVzpXmW9AHZNFK6jKhlNdWk5VTI8rJoRGdFRpalxKWkSZ?=
 =?us-ascii?Q?49++wgxRdX3A2IV99hsSj/llr/AKCusbCFJZOzwNp/DIEqyJym/lTtW4k5IA?=
 =?us-ascii?Q?JFvSn1mKxv0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0qWPVuuo7BynvfA5CLRp3WNCEubgDOWyawxMqBWf48NUafmMwkrFNB/S3ykM?=
 =?us-ascii?Q?h1Ah+5Kr36nFD1MXTEYD5xhhg/bR5AneEHCpccgxQ1Dau86DWNlM64WV2232?=
 =?us-ascii?Q?O3r09hW9+i6vCvq4fWLDL4IoB5LyDK+NK+x9m7z0IG6f15y0eLfgb2BRfyd4?=
 =?us-ascii?Q?umgziel7ijsBq9GQeQ/apImKU44/6GuDpdLqp80JWCP1517fXrY87tq3RGHB?=
 =?us-ascii?Q?lvFW3c7UyxDhF49cR8CuOy3TnmTkJdTST7/WsMtrDN3V864ZLT44RVMw8anl?=
 =?us-ascii?Q?222GttHSBcYJLtbxkRf0b5B8MdL7XAFnbQ+LzW6tEo0TMbANArMVWPE3T9aX?=
 =?us-ascii?Q?q4XuFEiJS5shaFeYQrrO9XWagC5WvOZ0K2BKiIAGdr1aKdPtcaarPB35iL7c?=
 =?us-ascii?Q?37rqTa51KSzypTFi/dzV2uTx7fVo6LoC1l92Mes0fr1WKMk/ckhRk2LJHHUC?=
 =?us-ascii?Q?6RDtzuF6Xp7SAG5exJLKc8kQ0ARNkVbbgcTjp9Wvd4Td5fdlzQQeyD4b92JB?=
 =?us-ascii?Q?gw45qjZKO/QkUkHm/vt+EOrx35fysQdG8cWZKMUWGXzfRthWO8Pl5QA4qIlv?=
 =?us-ascii?Q?BNwQl47NwYZm5UuO0s1wu/4bc5kX+UK6v/R1LnJE4PeJtCuJpL7cq78W1LKy?=
 =?us-ascii?Q?r3GJJCnALnnu0oZ+ruXih5mpADjy/8lZPQi9LUaaunvkwO8Ff3kzuPPzqsNK?=
 =?us-ascii?Q?i4SAAULZ0YIryaX2E/8U2X8DW3RTGGPTm5/3sWcZc2LpKHtA5Q8oqPmyvMe5?=
 =?us-ascii?Q?+efRixdnageIxTAsI7nosxrgv8NBEeiucNTQ+xsxFsSvv9EZFXNKPN2ECFk6?=
 =?us-ascii?Q?gi50nBWHBW+h5PEtZsS6Ka8rFzGYpzHekQTb/nPpa8AVtxdGSusbh0c4xMB6?=
 =?us-ascii?Q?I/+yGj5rlOUuZZ858dH0lRT+SSrGNi9niloaXqRTtZHUuW78+Ahn0i4uV16C?=
 =?us-ascii?Q?0AoAeelYpVnU8v1W7Lpy6cXbseKAEOgt+Lo/IHMN21GPbECalSb9sjWSVaiq?=
 =?us-ascii?Q?tmiyFIb5DzrLEnBlMtM5jXybVvy3QTPIAInfWwDhZL7KKGRKF1oDugmmvLfj?=
 =?us-ascii?Q?lculiCpRiMHMKK+XnlY2nxab4jkIMgBswIhMZ7HnsfxJ/N/qV3Nag1OMWCTq?=
 =?us-ascii?Q?xGquE8PWcGUbt9dmmw+rAoGP6PihJ80Ugj2GW9kmY/AwXv90yhjpZzUQvjeE?=
 =?us-ascii?Q?jHj3PU+6vg4trhODRykzuiZ6Cb8KWk0KL7G6rKOk1NCeWq3z22uxLbLWY5+m?=
 =?us-ascii?Q?eQlw+Dar2oeFbz9ZAkjD7epibkby68cOgfjE9V5RyDfvij0CLHPqOie+3f80?=
 =?us-ascii?Q?2dIMrc6Xy99IolWcTdSIqNOoVWgrb4EJmPF7mSDRfByhu7hOt7zk1R00tvR4?=
 =?us-ascii?Q?w1MaL6ra4LbE0vzYmskg9ARZO8xPEtd1YfCBapuG77xMGlALh9r7YJC1PFa+?=
 =?us-ascii?Q?tYm5LtYiwTzmS/1NTMnfojFH8vrSTh1Z2T2ZhbQ23qTwN/OmwelKKFMdofZ/?=
 =?us-ascii?Q?4gbyqAWsF9AhYkG+DgZJr91U0gl85khgrCA16gzofiNSThJunR+C3Ur/0dNc?=
 =?us-ascii?Q?kz/g9fZ/tinygiJax4qjwxGSZ6npMAVhy4FOiIjj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434f380d-873d-4e6f-2be0-08dd76732a22
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 07:58:35.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SywCiAb0Tec0PuN2m0nJHE+WkD8aAFKe8C54qW9oABP5/zVYjLZgDzDedeBfDc5cw9EbZTcqkpw3L6j6qhepnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103

Hi Tejun,

On Mon, Apr 07, 2025 at 01:20:04PM -1000, Tejun Heo wrote:
> sched_ext generates warnings when cpu.weight / cpu.idle are set to
> non-default values if the BPF scheduler doesn't implement weight support.
> These warnings don't provide much value while adding constant annoyance. A
> BPF scheduler may not implement any particular behavior and there's nothing
> particularly special about missing cgroup weight support. Drop the warnings.

Thanks for dropping these warnings. :)

Acked-by: Andrea Righi <arighi@nvidia.com>

Should we also deprecate SCX_OPS_HAS_CGROUP_WEIGHT (not necessarily in this
patch)? It's basically unused at this point.

Thanks,
-Andrea

> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  kernel/sched/ext.c |   40 +---------------------------------------
>  1 file changed, 1 insertion(+), 39 deletions(-)
> 
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -3896,34 +3896,6 @@ bool scx_can_stop_tick(struct rq *rq)
>  
>  DEFINE_STATIC_PERCPU_RWSEM(scx_cgroup_rwsem);
>  static bool scx_cgroup_enabled;
> -static bool cgroup_warned_missing_weight;
> -static bool cgroup_warned_missing_idle;
> -
> -static void scx_cgroup_warn_missing_weight(struct task_group *tg)
> -{
> -	if (scx_enable_state() == SCX_DISABLED || cgroup_warned_missing_weight)
> -		return;
> -
> -	if ((scx_ops.flags & SCX_OPS_HAS_CGROUP_WEIGHT) || !tg->css.parent)
> -		return;
> -
> -	pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.weight\n",
> -		scx_ops.name);
> -	cgroup_warned_missing_weight = true;
> -}
> -
> -static void scx_cgroup_warn_missing_idle(struct task_group *tg)
> -{
> -	if (!scx_cgroup_enabled || cgroup_warned_missing_idle)
> -		return;
> -
> -	if (!tg->idle)
> -		return;
> -
> -	pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.idle\n",
> -		scx_ops.name);
> -	cgroup_warned_missing_idle = true;
> -}
>  
>  int scx_tg_online(struct task_group *tg)
>  {
> @@ -3933,8 +3905,6 @@ int scx_tg_online(struct task_group *tg)
>  
>  	percpu_down_read(&scx_cgroup_rwsem);
>  
> -	scx_cgroup_warn_missing_weight(tg);
> -
>  	if (scx_cgroup_enabled) {
>  		if (SCX_HAS_OP(cgroup_init)) {
>  			struct scx_cgroup_init_args args =
> @@ -4072,9 +4042,7 @@ void scx_group_set_weight(struct task_gr
>  
>  void scx_group_set_idle(struct task_group *tg, bool idle)
>  {
> -	percpu_down_read(&scx_cgroup_rwsem);
> -	scx_cgroup_warn_missing_idle(tg);
> -	percpu_up_read(&scx_cgroup_rwsem);
> +	/* TODO: Implement ops->cgroup_set_idle() */
>  }
>  
>  static void scx_cgroup_lock(void)
> @@ -4268,9 +4236,6 @@ static int scx_cgroup_init(void)
>  
>  	percpu_rwsem_assert_held(&scx_cgroup_rwsem);
>  
> -	cgroup_warned_missing_weight = false;
> -	cgroup_warned_missing_idle = false;
> -
>  	/*
>  	 * scx_tg_on/offline() are excluded through scx_cgroup_rwsem. If we walk
>  	 * cgroups and init, all online cgroups are initialized.
> @@ -4280,9 +4245,6 @@ static int scx_cgroup_init(void)
>  		struct task_group *tg = css_tg(css);
>  		struct scx_cgroup_init_args args = { .weight = tg->scx_weight };
>  
> -		scx_cgroup_warn_missing_weight(tg);
> -		scx_cgroup_warn_missing_idle(tg);
> -
>  		if ((tg->scx_flags &
>  		     (SCX_TG_ONLINE | SCX_TG_INITED)) != SCX_TG_ONLINE)
>  			continue;
