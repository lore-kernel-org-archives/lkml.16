Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624951E766F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470962; cv=fail; b=tnWjDOvJmoTp+Dky180plecQpOLVnzcscWGX2vC7gkAW4qT/Si3yuTsAQ6XKRdyVBJgkUndzjL98AG3Qd8aWrndzwu3WQkrZQ/5OY3onqPpqDIMPy8KaJkmDs6J6FSQbTSA+D5SIyKnUQPBLxRr4EAPwKKDtDqqc6z/jmD7H6fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470962; c=relaxed/simple;
	bh=/xJ/tb8+cJJOlGUT21UJRT6Xx6iavURfsTKxuN14Rs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nuP9GFYdT7aRZozsm0DjLY3jnFe2gYc9k443SCqyxZ2khPO2r0tG237dt3H2S/efNJ7RdbNUSIjuqE6demYKPiMrV+AP8gkk6Y937vYre2bTN+M1yxNGyEYeP/AiNHlZiT9QB48GcZfUhtg2EjID2Y541JeeZE0eA/iHM5LY0dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oSreuABe; arc=fail smtp.client-ip=40.107.95.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oSreuABe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2rkuY21sALKxOdZfK47vCuHY6XQRBqDtjDCa+EVIK4fcligflBcgrM7QgW+UAkPiotHjoCPErQIQSzYr3NewwStYJbVfWkKbxCWM5nJu9yOjPwbVLsOo3XHUCopuIglbo1ApLRn3LmEHoguEz/Mu0H7/V+InUY//n9knxWYp1XkxISuMz/3z6ubytixWpgYEAN9ZXRRlSUdhXix4w1rX6y8d2kHXrdQMGVEsC+/JANabl2VdJlnf7lwp5l+z5RHjYE52eDVi827I9USMYCH83JTe7g9k5Cov4CXMd7VUOfseP+Tyb4LKmnknA82phnAUxGAW2miTuOEelzxglEh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB8/gP7r+68kiNK9Iv5pi60Tq27zgJTCmfwh8qk7Dzc=;
 b=MELdXFfAhrMKTB+feylhi9CJBHTuIPDl6lq8ePjbbUIQzP9L8pyO6p17f1HZFDBTHefyAlBeY5YWXT2PwdEhZmN21wk1U/7s0vYQKh2u+7H/cczX8q7pgZAD6x9+kCpeNCN3KzOuhgvyxumK2z1ZgWc7VIVsvttP8CuKO4Rn/8oUOZTVDmYFK0uo5HvZLyTByTiFhkW0cza2RWjK06eWqXZD385V0Y7iV5kpSJOvQoFZ0EE0q7iJW7igpBssjutjCrrZFhNE5FhrIJxNIcrdJoOBvefMRDON7GMtG1CvHsbY41jnwQ9p5k2f8YeGLXeym02sD7zDpK7dKg8BP9CNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB8/gP7r+68kiNK9Iv5pi60Tq27zgJTCmfwh8qk7Dzc=;
 b=oSreuABeziYpiW1T9Pc2dhI+g9GFyoAx5H3KjuQkExan09lptjNLnxWQQQGp9+eiP+loXCnUacLowGP70JFD4MP2FrJGur1+hZIJiFnYIQGQ1Zy524lwuZF6plxfOmOHv1Aoawlvlpn6EAlUp5j+sO/1A9qKvq1gZTT6XvfZns/Ci/5lioUs2STT4jkGImlqn4JDjIEwkJVWThsbDfeTjLc8xA1GSXJf6bbcwezOepBkY2fTcDlU9NpNKAJea049LX0HPdFy7H3jePJFGdVerp6zoawW/gVuS8Enkq1y5/mBWYISRdG3Yh7ImA+clE5ceSgP4VB7IXp+5uteYGqCDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 12:09:15 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.039; Mon, 9 Jun 2025
 12:09:15 +0000
Date: Mon, 9 Jun 2025 14:09:00 +0200
From: Andrea Righi <arighi@nvidia.com>
To: liuwenfang <liuwenfang@honor.com>
Cc: 'Tejun Heo' <tj@kernel.org>, 'David Vernet' <void@manifault.com>,
	'Changwoo Min' <changwoo@igalia.com>,
	'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>,
	'Juri Lelli' <juri.lelli@redhat.com>,
	'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>,
	'Steven Rostedt' <rostedt@goodmis.org>,
	'Ben Segall' <bsegall@google.com>, 'Mel Gorman' <mgorman@suse.de>,
	'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sched_ext: Fix NULL pointer dereferences in
 put_prev_task_scx
Message-ID: <aEbO3DmwY4Tg6HT1@gpd4>
References: <dc2d908cd429473a9d46255272231f38@honor.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc2d908cd429473a9d46255272231f38@honor.com>
X-ClientProxiedBy: ZR0P278CA0106.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 674fddff-888b-46d1-fa8b-08dda74e7408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eW5vQdf0/DbqZ0ENE7shrULWJNROsHrErtpZxo7IU49dkcEgcPrNIwiOpuMD?=
 =?us-ascii?Q?pcWTXqxItgY/InndQ9gHBlBE9PcXN5eaZq9h10fWcBJcBtUwrvc4cwGweSLl?=
 =?us-ascii?Q?mKkWI0S7lChF4JJV6kSUtMOofILT1BpSQ4xM4bXEOQXub5wo6Jh6gfptl1+l?=
 =?us-ascii?Q?FxL+JhjoJu61CUJ34tzHRPF/PBLwMghSlMdZHMbp7BkOwsueQq+3wkq4k8oj?=
 =?us-ascii?Q?HdN4BmJw7RPyRFBjNzQ7YYjuOLOd3OZRWQGX+WcEgFXLA57qMTZFUuRBiDPy?=
 =?us-ascii?Q?nH/g7/NVfJ7jRr20AFGncY+flIUmswpfbI97ttu9EMMNvo7eGI03r4gc2UJr?=
 =?us-ascii?Q?b3FYsfl+4vtgl/rrFX8xBjPzNgf7FxXTUcY9HJnaPTZGCkHlT9igX0zWexim?=
 =?us-ascii?Q?eEsq6R1Uvfey79tq2XekfMB2Nz8J84iNAQr1pbaBjHJLCpqRRe6HWVFBDb/A?=
 =?us-ascii?Q?aBr1lUyW1gxACFKhedEmf52cL+8TcYXBasW8RiFjlm4C0FirTPUspm9K1l0s?=
 =?us-ascii?Q?dRcuUhSsdt+YVYjuhIaCiMjgNyUGDpYtq1KU1KU6UKw3+JwT5VfmXqxWiuJW?=
 =?us-ascii?Q?fyHLltsseJjlGyw/24pp4olW76JXk3rXtC6JJ7Ti+/c3mML91A9H5KAFeUX/?=
 =?us-ascii?Q?Ti1JkFfxiJWbue4rp5lniv9ZHfdNXa2re70QIzJpwHlc+JkKGlHVu6ULnXw6?=
 =?us-ascii?Q?9A7HuQfKZ7QQJylduyIiA30KWHK0VFJsUBukATGGjib8ykTXM07Ly2xUmzXV?=
 =?us-ascii?Q?+Uhe0bC6T5uSrpq0DYNoD7Lcajjomlx7S6bmMF9LPDCCv1/F3BN5wISd37V9?=
 =?us-ascii?Q?OUWfgzlpT2OnJRt6MspAAJLlWps7S2QCyxw9lGZFAY8u7ItSs9jWTtrzdduR?=
 =?us-ascii?Q?/pOuko6rbcFRIahknQcWifK8uJWv+7e83kBoMz1u6LO9iijee9HquFf6LHFH?=
 =?us-ascii?Q?L5kU2wV62j6Fnz68TCW9sdeF05Zf+7FU5BFASfatcg2yKttGoT3PDylLbR7K?=
 =?us-ascii?Q?Y8jcAeidXuyjiIXmGvl1b7UrNOXJLaTHgytMziLzkDUBUVhL0uc5RVTxVkZy?=
 =?us-ascii?Q?5h1ttzJlxhS2mA23C86a9ApYs9HQdiqPieSXdbk32NAeNwfeYgGgqT4G2TfE?=
 =?us-ascii?Q?IDezJYf+lTiK60krvCHE9XUj99u5LD5J86j1a/922zGEdmmiF4+ZRrYJyol7?=
 =?us-ascii?Q?dYR/rjzPr9yaL3MNxNzN/S4MtRh0bMHLpCUuOKszxDxx3mr2o5+FG1cDPsX+?=
 =?us-ascii?Q?uSI0Jvj4uJ1mo5THjZ5yvVCs9jhctIRMcKKL3Yrb/ApxaMsf0uuHk2ZfE0yS?=
 =?us-ascii?Q?Uyr554bZ7vF9nsmdfSTQZokvo6CVsXjd0pou63E/i/Y8NolMaEiXs2RwEO1W?=
 =?us-ascii?Q?O2ZVdJheI5wpl93G7VY8so4CJXzdGKcPty3QsSyBtINc4A3ETAw3lYYv2KzM?=
 =?us-ascii?Q?Xh+7J7nzj+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oMthcZD8vCCJF6vGy2K8+8eRwJyhlL5Oqmrx7rUoM2wLKw5PihltgwNNkWmA?=
 =?us-ascii?Q?3Avs025pyd5RzMePx6u10PgAf+NaO5NZYnocHQryXVF4c3DuiVGg1slF9tg5?=
 =?us-ascii?Q?+z2dklE38BJSxsaLCPyxpIF18VQe0d9A8kqeJLbVktQl8VgEI4aE7YzfhBsP?=
 =?us-ascii?Q?6N8uXNeI9/l1AmovhmDmO+pgIx9MmYTeP5M/0VRxQF7c4duVSLYFb22i0BN0?=
 =?us-ascii?Q?ztN9J603rTabBWf/LxOjRUwTkj3DErIXdw9Rfn/pSOZooN4UlBCBClbKbSGH?=
 =?us-ascii?Q?YgEJkzLRKJeD5gDh83bqW59QtdNWjduqmxm8opXhQ8lo28SjCjrP5nNobioT?=
 =?us-ascii?Q?0J7ugkJhUVghR1GKoQnBMv+hR9dA9NxxJHA6/SnD6a59lpa7obkikddzz2ts?=
 =?us-ascii?Q?00eHgxeB5oiXP8YGfG1Y115O3CBEtY8QgYHDhAi+TF97rh/OBQg59qgO78dj?=
 =?us-ascii?Q?NYiEhSg/Qohoy01+UcGgvky4VdNvsXXJn+2CokxMHSuT8xwDGWnYEW0GlRjn?=
 =?us-ascii?Q?GMXA2ZKLw/7SVvZiLzSasHEUGkuIR9wyDvvnIv+ZZwKNX2fIIKUW1w4YqWzS?=
 =?us-ascii?Q?bM0JRsB1GaG5/uEtbho6Upip0AY1R2SQxMZtzDn+DifmBQNX9qKDlBGMTtSm?=
 =?us-ascii?Q?MvXmya3lmLjy0KGbZBhqcDholBVQIBKb1g3pPufPhrG0AJE5eqHklubFG6aq?=
 =?us-ascii?Q?sNZTzxiEEBAY/WffczLLwMTpkxsV3CPKAODIG9WPlN0SyErZejVInaJzWWA0?=
 =?us-ascii?Q?WIop0dZ/8luhfY9kfCHhzgQVIGnE8/i8kczIrLAZkB4HzFWfTzTzJHLQM7Rf?=
 =?us-ascii?Q?b8k9Y8FvXkzyH1iI8wka83OqTPNXd5jByYpDUvjwxFPvhsB5ytpMeGBk5iCP?=
 =?us-ascii?Q?4txnsc8JznOauqJvg2BIcX6qeresqkwOL/b4dFNi3GZyp3OP9y84bWQI/9E+?=
 =?us-ascii?Q?F4YGnsxHky2VW9B4NGpL4pZ/F0BaFHYVmgfSfksOR7TyxO0bw6C7mKR5zdAU?=
 =?us-ascii?Q?NmceO/DBsX3FiXbF3YLqmiwsWm4PJm0zssO/KqUToqZJYDLDeHSF3UVTBTrX?=
 =?us-ascii?Q?P4tjNXKlQ8754uF/2WNdlMViXK8ee4xMlTy6heJDDtPhmQFndJuNzWBwUMd9?=
 =?us-ascii?Q?jEII5Lx5G+WiAfpNaPWStSiCOrig3cElDm5tlK4+zTeH9Tnpid8mPeSO42hf?=
 =?us-ascii?Q?e3RU5KC818HBdpr517MZllwGmt7Ug99J2hvHauewrwdmhJt+x/7+QsdZpVvj?=
 =?us-ascii?Q?+Y5rkCK6+33qAL5/gppw+8UihMNuiU6b5ALe2tvM2Qm4ZeAvD2eSK59UbV+9?=
 =?us-ascii?Q?FTw2Aw7aPzJnlDSRQg+VQ7efZjdtKwfsMnQjBNIl2ty4gpZFSj5DU+HJffNz?=
 =?us-ascii?Q?qBmmYGc4dfOzTEgu9G4ewU4qOWQAg36iZjsiFORBgUIkvd1P7YCD2i4/+K/R?=
 =?us-ascii?Q?dUuEinADvFV9m0udBCIlTppU6/DNCQEQcps8QsKObI1WRWlS8TMAMczWXMHR?=
 =?us-ascii?Q?bZwxwYIRg70gxBKlspnVwuu2uhVXGG8+2r6n5SWsm+2Ne+gDfkEqznQpxs/Y?=
 =?us-ascii?Q?MqQTQr2RmFkSEQlL/0aCWyoDDfryWx6m2zrtA7yF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674fddff-888b-46d1-fa8b-08dda74e7408
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:09:15.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMWIVqnJBEK18C/eT9AsxOVblan8cJ5+wMhFkJriwN5yfbnxD9aduJ5Ex+svziXJ4bpXJMcPsawdqfnNiKw9iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039

On Mon, Jun 09, 2025 at 11:36:15AM +0000, liuwenfang wrote:
> As put_prev_task can be used in other kernel modules which can lead
> to a NULL pointer. Fix this by checking for a valid next.

Actually, put_prev_task() should be used only within kernel/sched/ and, in
theory, you should have done a dequeue_task() before put_prev_task() in
this scenario, so SCX_TASK_QUEUED shouldn't be set in p->scx.flags.

The change might still make sense, but can you clarify how you triggered
the NULL pointer dereference?

Thanks,
-Andrea

> 
> Signed-off-by: l00013971 <l00013971@hihonor.com>
> ---
>  kernel/sched/ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index f5133249f..6a579babd 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -3262,7 +3262,7 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
>  		 * ops.enqueue() that @p is the only one available for this cpu,
>  		 * which should trigger an explicit follow-up scheduling event.
>  		 */
> -		if (sched_class_above(&ext_sched_class, next->sched_class)) {
> +		if (next && sched_class_above(&ext_sched_class, next->sched_class)) {
>  			WARN_ON_ONCE(!static_branch_unlikely(&scx_ops_enq_last));
>  			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
>  		} else {
> -- 
> 2.17.1
