Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD03E20F081
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797300; cv=fail; b=jFU4VjPLla+djTmw8SNXhUtprgnsyxBZg+ByRnPefrWoHA5RqohuxdqwQLucUnmo2iQwj6HEJdiyWrdWO5k2gMUXKYDnsMcG1YvKxk93YGp4s653FRbA3kpSSN3yqYmI+PhPqJOn/Z8OreWmt1EXU9BhT49WRgXtFatsXscW+fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797300; c=relaxed/simple;
	bh=gGR/XiQym/w1IKvnWRUWZ442rqhBv195ScJWfEF0r8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QQ8MkL58K61hFCoXjI1TIkMHTu/eqlg36spXMmrgYHhaeJG02GHEObAvkHswyTumU0CY4YXyXD8iENWFdbNvT5iLfppZ3PBWWruzx4WMW6CV/keHP2uPhpsTTpcPt2DS6lhZu3uclccazx7LCMGnAVEXtf2LeAevNKRhA0FeLP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kC/dJycx; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kC/dJycx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aw2MJVjTP8yXg0adqrGrRHqrcqjZO0G9TdAJgfvdOa35s6GU9+krpGp/fSdOqjNNrylfV4qB4dM5XsnircDKHu05FQUmj/+NSGp/4LLeuMzfpkpQXLLz/KRtNfbzUoYtArWsY9bgw/ms3EFhYLAcgZOZrjS3kVKZJpboSsJAV1wROc19LXxbVQAGr4Uyvm/4ejl+IE1e/+OoSevTbAVkP2qXUanewJB7swd4EByJXRG59ThIyEtsnQneTyEniBFo1VU2HdH3oGxQGYi2FsC0tdp5EYhBnih+vLOH1mkUMXR3VlfWc4AOyGrAzvdUZ3mo8+s2nYnvKOd6d5P218mzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HJ4hYI0xxOI2HYE/PbjpultgZ9FShfCARozmJQqfpE=;
 b=SjLEOgxf/LL2NknBgwn1Ke3ERkv2Ef68kSyu+do2C0cyxM8MHfn5X/8VJWLJDVKe/vdUBeNgVERTq7asVpGxaLINTV1RXIw0rYOi7KbPRhLM8tuXcgbtVVnF40gD0OLor2NFi7v+P56aWWvI9boiETzsrHFjLSB3AnyTKGTqVRSH0mI2pIZ5C/RsZ45IpI9Oj2SttPohMvYzPj01lRvBsr4zhXOALHjFV7la3aKO4lypFIlSWQme6adGHlDMqro4NJUDolSdmcAd1XpCB2WasiWtrky7MF6VPbpbQq+1e59C1V3lWO/VDW9HACiZJLczOFyDL1glR4OtfH0qhK9whg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HJ4hYI0xxOI2HYE/PbjpultgZ9FShfCARozmJQqfpE=;
 b=kC/dJycxIGfa3q4T7ZADUFyKhFQcbklMzA1QdXZigDk1L50Kvwa5nHain1FeIebIq2XKI6UbjAwNHozxSaXXK+aObxw4GctJBKKNJGUwaEXoLo87FV7PaQ0O+kyyNZMmJQkxS6QgJd7F+ssuvBT48NeVL0bUOzN2qjxVbvypJbr/wuon7PHbB7/XDEUb6GvQOGn1B2jVsiQL1q7lFMMkFQV4wS0b7vU1z5htyZw5w3ADQV6zwJKNmQgxBV6xYLRxwHYRZw9TiO8kCck+a/LXMUYaYHRtN/V6ASZ9jCcTaVr1ZgQYL8+fbkRs/M3QCd06rlOYAgZ2pa7213V8V+IIHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 4 Apr
 2025 20:08:12 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 20:08:12 +0000
Date: Fri, 4 Apr 2025 22:08:09 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 6/5] sched_ext: Drop "ops" from SCX_OPS_TASK_ITER_BATCH
Message-ID: <Z_A8KTXmYqKS1LZO@gpd3>
References: <20250403225026.838987-1-tj@kernel.org>
 <Z--NLGOGQe_9xULR@gpd3>
 <Z_AvCG5HcMV6b_xT@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_AvCG5HcMV6b_xT@slm.duckdns.org>
X-ClientProxiedBy: MI0P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::20) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7cb6f1-b4ae-4bb8-ebf0-08dd73b46da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BcMWlx4ZBFksRRE/pZZU6nY2TUU2ZbctLxRLil/p0w/iFdCT1TIff6aIVx+T?=
 =?us-ascii?Q?2VGzeYSiDTUosxOx/xXwlE3LTD4hH7DfLnMM1R3xMxZq4mkuqALbBK/n0BDq?=
 =?us-ascii?Q?D40v6qDO/+uKIErEoj/NBtxA3yzY1nSAQou7uQexInH913N8vPv++zLVV9bk?=
 =?us-ascii?Q?VysOcgi33QTCVkVh7sQzHpidO4KKjhnpnEv828mjFHFYqhRKOL7d1c6K+2g+?=
 =?us-ascii?Q?yE6/mdRtDRe3JQaR+YclAtufotAL/a0na93Ady3AxPZHmKwtqmLXAYsHsWCR?=
 =?us-ascii?Q?baA2yB1Ram3ypopmkOZX1YdyYPPaGrqWgm4Sw36XwnIGaREBqjllXqxmGE+v?=
 =?us-ascii?Q?YIrZkkkPIJr6POFHL+pYs5t0CrKiC0sCWfR0RsgV02YnPJtXZJeWiUoQjWB9?=
 =?us-ascii?Q?w3FAKIpHNpm30j3ZxH4ZcNjteo+JIWSCVhFXM1hLnqXdXZUbCDT5f11AUJ+9?=
 =?us-ascii?Q?e4bEvKhJqkmCmlxB/rCF8Yp+wFOMxO0Ejo5M4LmAwrwAwJ+Y84IO5Q881YJG?=
 =?us-ascii?Q?ve/obpnAwl5hBDVjMLKSSBjH6Ch67WBIkVX4f2ZCxqCzSPmbbX1oUvgrz0LA?=
 =?us-ascii?Q?X5wsmcen4Y7s51uZedb511wx9Vk74wI+OzYHJ/eOUASAyfqN8TSY+NvytNfs?=
 =?us-ascii?Q?NJIutZ/3X9LrYTkO3I/VCLp2CTcuIuCNLA7TCzhFjCiRJCioNEUEtVkYlui6?=
 =?us-ascii?Q?9Z4i6wAc4yRT6aU/X5yDLOa/LcsYrLaQYoRSOynU6urMi046/34OxCzRemJO?=
 =?us-ascii?Q?N9pqg/qw4OmwrYLD01PtUqjCuIPSBZJbnpSmPnPemvVL+zDoFcC7CcQwAk/e?=
 =?us-ascii?Q?TxgIUUt+DIM4ryVOAYbYJaakPheeC4+nCJWwKm8iFhzOi6ujAK72zD7tqjJZ?=
 =?us-ascii?Q?miKz61MmN9E9zCN4C0oWbW7Cj/shrekDzUgvzWmLqv6v79urFyXrATOh8Xm6?=
 =?us-ascii?Q?GdUkC+iHoZ0ymeczG5cMqXtyGGkOWGJ81xwpDDepil5ZsamP4WqthhsxU7D9?=
 =?us-ascii?Q?17a3ig+q1cMw+z6I2jxLxr/4iIGVCs4lCu6BXlQOGqBg8HOnzLnwNEoxxmh2?=
 =?us-ascii?Q?nb2lbzTqS/xCudiLZd8KBUoD1aKUSC4UvcmK/DKOR8A85PxlpV5Ru/pAId5L?=
 =?us-ascii?Q?VoEjpt6Bhf9K6DHP8TgYgI8cNAi/v5NGb89DyeU0FpR7BOgp4nhI55WNzjW3?=
 =?us-ascii?Q?aiwObdauntad3S0fTtAX4TebGohmKN3IIYE7SgTp2tEMcw79lv/07V4Oboes?=
 =?us-ascii?Q?E8mvGxiWQS7CSv4OgDNYKHwTheZNNCxl8qWnSx/GnK/nBvHz0I4DSFMxc1Dm?=
 =?us-ascii?Q?ePSFMwQ+tK/Jd+2tQfULQ5XVcZeAhayb0OHO9N4pqxS5AWTml4gkemY7EwqG?=
 =?us-ascii?Q?VOW7+9eRWpkQVyXvI6r5gjf+bfE2SCZEru7czFyV7J7ozQiNVvyKk2Tj9fyl?=
 =?us-ascii?Q?n15iS9hwFLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jRH3W208G7iFWBLZup6BK8+Me01AV8VTfWbzupSw7s6hKH1syNJwqIGWCUAq?=
 =?us-ascii?Q?demqrTMlOIT4opXb9jqtsTERPYo4kT9NjxAwQ0uinIb2t46W9c0NLnw4kD4O?=
 =?us-ascii?Q?H6sBn86VESP4TaapWQxjCfqMmoBKOkpL41XiQca2mduF8uiOODYl5/U7BroM?=
 =?us-ascii?Q?84hyCUxzuue0RqihY7Hp0KlcOyBaofwtD8jvZpOWtgjC3JGSdWtIdvYof26k?=
 =?us-ascii?Q?8s/QeLLzOCdWGhavvbIpugZYBTf6tJARCiqQQuQuFRMkgOltbzSBN0zeN94q?=
 =?us-ascii?Q?v3B0SuelyKzCRqjt6H+W1X5Sg8+H9szavvgZnw2b+IZIzhyCi2gmEAl2+FBM?=
 =?us-ascii?Q?JDjgt4rTbEhVv97ctTuocO7bjNo323Ntoc4ISptf43DpR6zApLkX92raf5rN?=
 =?us-ascii?Q?a8QJQsnXtoEQgx6KDR5oII+QoXKs3QbLSCrWemhtE+55OjWCTs/xB5UjzZoz?=
 =?us-ascii?Q?qhfIY+1byaIkz51m+W6AIPO3LEOHFSfKOxa0MIPgpDEFeAAL1DCTazFsYVAW?=
 =?us-ascii?Q?05GXHgY9y+CNHL1cfzUssVzUcyAMYarnukweRoyuC6GC/EXAaHKwC24j2HJn?=
 =?us-ascii?Q?qycrQmDB5mClqOxIXBdNBZZF9aqlntjDZipxHsO+P9srckmXsFrOw7IOho4J?=
 =?us-ascii?Q?Z7GAAbiX5fcacVrFWZeS73iDLYjhHoU8QMwC6dkkrcsj9wKdA0hX2rk7U2tc?=
 =?us-ascii?Q?l9mIcBK/R0fqGNSxrgjyQKlCoOrm7t5TG/T+mO9FkFJzhDCNZA9tErjqi+7Z?=
 =?us-ascii?Q?PWNC5HDZvPdXBDQRkXc9frTZJQyNqjxq8+vWS/pv2j/So56/pMMMgKUy2Srg?=
 =?us-ascii?Q?IfDtLHDLWs/qr4ir1e2bexZbtg6Qrs6x+DaChZPdvgPQfIuIFEcCrmXAc/u1?=
 =?us-ascii?Q?iNMD7OgPLamqmrXAkGWB1+FoD1tuWJCGLRILW0Y2tQoKVynpMNOHcvdxhPWz?=
 =?us-ascii?Q?DxbfO2JdMCzrqqjxdT53o8jERUBz0oAT1eIZPJW04q3+EKax4tQ0Y5k11lwJ?=
 =?us-ascii?Q?tx/qKQmJD+ZY51y1c/k4nzk7CX/poxzRuXkencTvbYKbiGthBhzCsFcspbKg?=
 =?us-ascii?Q?BoDKrPhf5SOubPxxdhvZ9kWpql1AufA14yCOQeahzCPzwdfeYeYseWF8IgT/?=
 =?us-ascii?Q?gaqcV6hZ8DmG1UH3KFeb4ThGdLplbuIS71jL82NQVU7GmxX3wSzTJ0A91HBc?=
 =?us-ascii?Q?8cRDzt68XH001zDW/4MiAzkHuknVn1gUZPnhQtAJ8NH2tSz7rKgxKn3PDdlz?=
 =?us-ascii?Q?A7zyD7QPYIH5xXb3KYqj7dGzQYOFyeG/cCGzDYrdN2QApo/zsfii3fvFqQ7l?=
 =?us-ascii?Q?CPvgy975qfNXCsF5AOdsDuq1O9Pu1I/CapWW4C+8/7ScwAMj1khUZSFuVfIt?=
 =?us-ascii?Q?7hoJPTn6dcUlkCaDo4UbxLsX6LELiSmC47Qo0NEYwYyESv7PSnNIFeqE+xR6?=
 =?us-ascii?Q?7ZousbCbwX9RperBnavZRfwigahEJqjTFw9NKQxNvYDmyUwoldlrJ01G25EP?=
 =?us-ascii?Q?lgeYu+99gRoJYo2YQX2CfK4x7TFklIAyd1Yr4vRleQ8JBDBQaurEmK3OOywQ?=
 =?us-ascii?Q?BQGf8vJC48UQqkxW4LO1cYbSR+XbCBv9a+TICIsn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7cb6f1-b4ae-4bb8-ebf0-08dd73b46da7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 20:08:12.8434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fa1excamMF018kvnz0dgBRjk5iYUb4P5gCQLqgTpkS0iC+JwbrBU+7FL6F7wxz8E1b4mJ2SgeEpiU5+JtAyVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418

On Fri, Apr 04, 2025 at 09:12:08AM -1000, Tejun Heo wrote:
> The tag "ops" is used for two different purposes. First, to indicate that
> the entity is directly related to the operations such as flags carried in
> sched_ext_ops. Second, to indicate that the entity applies to something
> global such as enable or bypass states. The second usage is historical and
> causes confusion rather than clarifying anything. For example,
> scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
> scx_ops_flags. Let's drop the second usages.
> 
> Drop "ops" from SCX_OPS_TASK_ITER_BATCH.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Suggested-by: Andrea Righi <arighi@nvidia.com>

Looks good.

Acked-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> ---
>  kernel/sched/ext.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -26,7 +26,7 @@ enum scx_consts {
>  	 * Iterating all tasks may take a while. Periodically drop
>  	 * scx_tasks_lock to avoid causing e.g. CSD and RCU stalls.
>  	 */
> -	SCX_OPS_TASK_ITER_BATCH		= 32,
> +	SCX_TASK_ITER_BATCH		= 32,
>  };
>  
>  enum scx_exit_kind {
> @@ -1401,15 +1401,15 @@ static void scx_task_iter_stop(struct sc
>   * @iter: iterator to walk
>   *
>   * Visit the next task. See scx_task_iter_start() for details. Locks are dropped
> - * and re-acquired every %SCX_OPS_TASK_ITER_BATCH iterations to avoid causing
> - * stalls by holding scx_tasks_lock for too long.
> + * and re-acquired every %SCX_TASK_ITER_BATCH iterations to avoid causing stalls
> + * by holding scx_tasks_lock for too long.
>   */
>  static struct task_struct *scx_task_iter_next(struct scx_task_iter *iter)
>  {
>  	struct list_head *cursor = &iter->cursor.tasks_node;
>  	struct sched_ext_entity *pos;
>  
> -	if (!(++iter->cnt % SCX_OPS_TASK_ITER_BATCH)) {
> +	if (!(++iter->cnt % SCX_TASK_ITER_BATCH)) {
>  		scx_task_iter_unlock(iter);
>  		cond_resched();
>  		scx_task_iter_relock(iter);
