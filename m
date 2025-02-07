Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF161552F5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909059; cv=fail; b=Cfn1IEjvzAr5vVqxB+5TQnvZBSUYWiiq8/tZHtDQOaMb+6YnANVPM/bnGXLK6RmtYVO+nA/lW4Aca57u8cpNURetjpDaM7Dyd4fRoRQwk81QxSPRa7PG7ecguHv83Q4jdCnaApOVwfLKaREr0nYG/vb2eilsjCtlCBEpqgINU3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909059; c=relaxed/simple;
	bh=QmUdM114aMaKril8NBuYJCmOFJ3gfkWnceF+6lSiZxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J2Uu6JnRgQ2i0RIB60sHHMUIXmu3JqsM6DKuqQtqnV5iRSX+ZhXJNhIZC/nhZPqsSWBEFDhznUQwZsCRAAeB270T/cNezskNBQI8NIhAYMDfYLtZq0vM8MhGcdBrYaul/6sGgaq1Spyej7cL+HVisDF/VNFl1Wbyw1ECdaRBI4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Unf3186l; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Unf3186l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wjs3+jszbgn4nEdXz0DRCudn5llmr+ia1+pX2hMSSMnlnpKqMA3Db6egQtMpfOT6A9WffBqERqOglsQPt1gBk3wnK8clth5Qqi7rYUvlbkSX2HkG+uoADg6wl7hV2ZT4qoZ8b5s52i7rtAWtDoOWFW3sjXBdvMWjGsOvAOnUC8KzOdmWtHi9DLi68NBLl1GZth9LCoxrXJsAiNkJ5/Uf6STgeFFNJsUCHiJVtO8eYSWTb13eqW0nI8SiykAlGCUYH65gOGhcejaeuFGAv0QdHow2IQO0d4MfxQoFCvV87X76W9R1hknw2BFwPCCvMycFLvUWA45dVn6nl8eoN2ZFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6e0TzWnPELEk6QKk8CymqhMPegomO3dD+IDc4FrXYj4=;
 b=SPZqzZaO24u8XHf5UudNqfPtgoXsN2gCydwUil6dbA4JbER6ctNHKqF2S9wEC5bREywht0vAm3PnmdQKEI0pOr30JK1pGvlZlmJVdi+A/ekNIFz8xCqDbILTJcJDE4bJ1oNxTXlqaTB/TTBXSOtIaihvKgEOeD86Lsbmizu23Bf3jE+0/IJn2FwaIo5xKeIl9i2p7BuoTxgaQPvdhljsIGulUC13kJZJ3QjLhkEQw4760q5NAybbkMpOfjc1lHYyqWAQGfRYT79B30E/yUMBeufdPxF1+1TNP74OnbO9FDQB3F0Db7876NpsHzUuAaw3BPd33K6m2IG5qRpW2TLFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e0TzWnPELEk6QKk8CymqhMPegomO3dD+IDc4FrXYj4=;
 b=Unf3186lXNbJLjvga5q+ixF/ZrTUOLRRLXepgCLq/0B3tf8tGlpNZHxVNsSIg4XPG47Cu3KrIU9S98j/WEYCV2YT0BSvJyDQuOvPJPv6F0EFFax63gkBeTA2ThczFVhYiycTe7uYZGuQVb0SBXRYw5K1c7gXUshgqdxDUPyYnxJ6eZxqcfu94x5jgZJJRCFv7DzaORo3b4QpwtgRGkaQzz7RrMCxwixkLgX0ZSqyrli31wLl5ng4C0m1U6R/h6j4E8fecJBP4eckQ055WLD548ZZPO5LlrahvCU8shbcEk/Br9HMd1jZ6tP24CmHb9v5VtJJzbUCjdmEOtYsJNTuAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 06:17:35 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:17:35 +0000
Date: Fri, 7 Feb 2025 07:17:30 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: tj@kernel.org, void@manifault.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Add an event, SCX_EV_ENQ_SLICE_DFL
Message-ID: <Z6WlegLUWJjLD7eZ@gpd3>
References: <20250207031338.393045-1-changwoo@igalia.com>
 <20250207031338.393045-2-changwoo@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207031338.393045-2-changwoo@igalia.com>
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH2PR12MB4310:EE_
X-MS-Office365-Filtering-Correlation-Id: 3854b4f1-5e58-46a7-4bc5-08dd473f1d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ey4MqdZICVg1qZSPqAIP9YGrtFEaISBubVTS3inpql0gsBcfwYKwJBiNoAPW?=
 =?us-ascii?Q?CDrg2v1ESvLwr6UjZLiG3xlIi3IRArW3OMyLxEM3432rodRPRwnbUzIGAG70?=
 =?us-ascii?Q?nn7bGdmU35t8ZhIugkAEsX1GBDuye2GwrbtwVMPNYEr1ja/IwYlAu68ODWft?=
 =?us-ascii?Q?Gfa+ENwz1KrdGH0DXiE8qs76G8E3kK93q1WaakpYjK+DQh+hoBCHn6tVJJEc?=
 =?us-ascii?Q?VoyYyb0Y9qlhINHy71PelgDUQfalWt9ILairxSQ2VwaORdCV/KhmtIOKgeri?=
 =?us-ascii?Q?cwfeQG6oLw3O5vXzwMUiQdvKkoFFVRwdii/z/a/C553jn1wAm73zFYEO2Jko?=
 =?us-ascii?Q?NW0aKAiN9fyHaZU8lUT+RmKwLMPvcRd7JpKEHQBy97425Wd3kO8aD68S9xxH?=
 =?us-ascii?Q?bS4txobG6c9xF2dKRAqaKj0mF26Dq2tXOOIBoR8jaKMTH4G2+/WFbpxfsoOL?=
 =?us-ascii?Q?RXHmgjfWeDPx3eKZop8nXA2egXUhjZYb92sLF/JzrkXKGV37V5EYnsoKdisx?=
 =?us-ascii?Q?GsuJVNam7QR4mCJQYLSJWSjtofEfGoOeqYLVI71nNcCMAQ1WoM2LlIsRWLu2?=
 =?us-ascii?Q?v+932iPKgMPzEGF2HgU5TBJCvguPruVBgyxmNbHNv6+C7EvrdY9BeXqnNn07?=
 =?us-ascii?Q?Rk/hcg4XEcja7FrJdyq7ciOcA+AZ89ACpvrrjaefpnFtJFoU0zJ5ksRoMHu6?=
 =?us-ascii?Q?qF8+chIc6wVHmwjy+fjNN3V2/ACKfYI4WFE2wYRUrXpZXuT04m4zOBZCMNGW?=
 =?us-ascii?Q?0P9hXCba/x6U8T5PloF3V2hM5JtONtGM3s559wZnfLURgqbodXeOw+yZ8ri3?=
 =?us-ascii?Q?IDXB8odRxuP8HCCJO9JmVhxDaScXzKVRNatre6KUd+/BJC3waRycuiydJPAw?=
 =?us-ascii?Q?K/Z633VDDVl15yvpUFDxr2kaaMX/Ux1l9maLKGLPos+VOYd+Gt4msnhKqsH7?=
 =?us-ascii?Q?2IMAikXvZh8sBPY4OpcF6xclWk00Mbvkz1tJVrz59qO2dPAAo3BH2lUjesRG?=
 =?us-ascii?Q?C60hUORAwpSBQyStdjbhhgr7JajsWDMAb2Z5UL0hKmhOPRg/G3QNb8V5kPIj?=
 =?us-ascii?Q?0PDGbAtuXZkrPzr4k2QTKO/qPU4cGrBliMBixgmcnjPNHsLaV/AyqqUOfGP5?=
 =?us-ascii?Q?ne8yhgEQlXzcaGtbcDNLiydVVI4UhAb8GotLgM3H61Pn8bVx1/2jJxK6l5SE?=
 =?us-ascii?Q?lKV1AxYw8ztVLdH7niNuA4VqmmgpwzrN89s2+Fp3I8g5caJfAQhzZgxBTJVG?=
 =?us-ascii?Q?1TopQndhpGZ6Vza0yw+vLkiqT2bR8Oyo62+E6NpngjN4cx9+7aYjEcPIVrkc?=
 =?us-ascii?Q?/QkjY11pQsJtQN3TGdKLrEDib3D/isaUZlffp7i5W2w2pMQS6TmyYT/YFRMr?=
 =?us-ascii?Q?62R42txLkBrZ2iyrsyaVbNCxo/GG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vmBshL0klUZ5vtsn0P3yTP6MbBbE94Usiix+tPvCTbF+17u3b6BuJ990Snlc?=
 =?us-ascii?Q?0IO4dydYnJ9W9A0HZ1WAb3UyDuZxVvvIeA8x0qjMFcuJND3JeV+x+MX110kp?=
 =?us-ascii?Q?/epVAqQ4R4XD3IKtfXcNAwhNO4Q7cRDLSJt0DUJEtrowgq2FADOrDxT4kjdw?=
 =?us-ascii?Q?2vtYuTS1/ygh6BUANWCU8x9o0O/Kt909VMaM5VVZ+JTTe0D/00YXSqVGvVVU?=
 =?us-ascii?Q?DwT8G94puSh48dIHLY13ytqQmYDLYJiVefSDSYFYGXtry9J2QLxqYDiXAISj?=
 =?us-ascii?Q?2U02um3hxbkayfLGIEEeJS1Rs/3FJa7hYB31tGpMiViPnbf5d4Y60Z+wKC8C?=
 =?us-ascii?Q?NQrEhShvakG7BKP2zbdE3DqLL8Ma6mGi5aYpKp6eGIX2GlTabY0MXS0Zjt6X?=
 =?us-ascii?Q?0fW2icAsu+ywZ3/q1y8Qgk/5aCsf5SHJSdHkh2lNemS+wIiqPR166kyHcQSF?=
 =?us-ascii?Q?J93k5cEeK7ah5V/PCt/utoGVGUMhbHvbS01Cj5vwy4Bf3rXYdWEKQIfVJXer?=
 =?us-ascii?Q?8Y+TgLuY9oNTGOJye9Rn2i2KUZ9eUYYIz1oBuzcvXsMl/8GL1n1aHnWXESEs?=
 =?us-ascii?Q?HbSf4PXwqeCdETNJmTX7uJxAkA2D+76Dr0Bec8at3jV/prvOX0Mmq57ccJhn?=
 =?us-ascii?Q?Vd7YWvgsTBNTBwFRtVD0ZSyDokSEyaqdjHaK5LSPyEjU7pRmCHgntFuLsr6U?=
 =?us-ascii?Q?2GTG2f2NBvDWRheyGz8hjNhi7LImMlm/DkBv31UeyEEQY+tGPrN4wZKAKLWS?=
 =?us-ascii?Q?cWIpLz/PUC5EPPgE+NEacLuEWFCkx1gWPwydJQzcYCbgrWf9OXuK5iimgqng?=
 =?us-ascii?Q?EbMqlLPBAyUBkr1+uEdw0grDCEUWGxkFBXdbnjRFrP1zTBnnxKVGqhDwSUNK?=
 =?us-ascii?Q?y1DEMZBIPSeRtx3j/RyltU7Vbz/4GGy5WSsZkJSHKaeQt8kS1HKv4rYXAs7C?=
 =?us-ascii?Q?hx4nkAhaCrDKnkjCMtK5V0cfYutQxMEwFRu3jp7qv/InAdfi64oD+FTDaj8L?=
 =?us-ascii?Q?ZuShOgptWP/v4wV0mtLR/fXesgLCkTlqO3AjPufnXrevSSrAVpb4zdB96S17?=
 =?us-ascii?Q?rt1ZhKZwEuCT/qrCA0o7liwhoywaFdGhE2kxIADFtauNmo81PqGitg6DkwN5?=
 =?us-ascii?Q?mGrEyBZMprtpvo28wOV0HPEMMV/tJHF9XNaVSfCzWCDakThVAiNQKGyjgb8s?=
 =?us-ascii?Q?PaGrPxZpHBnqpnA5KbS0e3jtLeWrOkdmlIiPKAHGR4xnrGK+q3KxT5rGTB/K?=
 =?us-ascii?Q?0Rh6Ujdj9DskfgGLQpfLn+abQKMredA11OXigDCl1TLyi28flKRyIqsVPAef?=
 =?us-ascii?Q?jK6phAZjm7WI6gsYEqRKNwDrxRo9T8AskMxOAQmmKjJpSiF6NyzdaTZHsyUY?=
 =?us-ascii?Q?4fHsZbRiNRTH8R83eQ4Lunt1hwJ2PlAGfn0FzSSQTlJ+P7p2LwXm6kFqwZuR?=
 =?us-ascii?Q?TcTbYzOauk/JUtUt6mfKNA/Jh+Pf4i+U1iq70Xw3WK/JvKE6iuCA6SLzEIwT?=
 =?us-ascii?Q?8AsTZaBhv2B/6smfl3bTUiaRN/535GjWId1Ez1irfGla06XGy99INupQdx28?=
 =?us-ascii?Q?kBft6UAQeB8ZSn3yEgJmhrzySxQMDZl9Jkmw3wzb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3854b4f1-5e58-46a7-4bc5-08dd473f1d2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:17:35.6110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCvYpWBJ4VmNxIjqDrZUJacxetH0nDThrBfRvlQCqMcQBTLrPenXTky//SN+WOKoaMx7xhchsvG2HbmhkQ/f0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310

Hi Changwoo,

On Fri, Feb 07, 2025 at 12:13:37PM +0900, Changwoo Min wrote:
> Add a core event, SCX_EV_ENQ_SLICE_DFL, which represents how many
> tasks have been enqueued (or pick_task-ed) with a default time slice
> (SCX_SLICE_DFL).
> 
> Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
> of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
> Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
> scheduler bugs, causing latency spikes.
> 
> __scx_add_event() is used since the caller holds an rq lock,
> so the preemption has already been disabled.

We may want to consider select_task_rq_scx() as well, when ops.select_cpu()
is not implemented (or during rq_bypass).

In this case, if scx_select_cpu_dfl() finds an idle CPU, we implicitly
dispatch the task to the local DSQ with SCX_SLICE_DFL.

Thanks,
-Andrea

> 
> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  kernel/sched/ext.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 8a9a30895381..1077df9280bb 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -1468,6 +1468,12 @@ struct scx_event_stats {
>  	 */
>  	u64		SCX_EV_ENQ_SKIP_EXITING;
>  
> +	/*
> +	 * The total number of tasks enqueued (or pick_task-ed) with a
> +	 * default time slice (SCX_SLICE_DFL).
> +	 */
> +	u64		SCX_EV_ENQ_SLICE_DFL;
> +
>  	/*
>  	 * The total duration of bypass modes in nanoseconds.
>  	 */
> @@ -2134,6 +2140,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>  	 */
>  	touch_core_sched(rq, p);
>  	p->scx.slice = SCX_SLICE_DFL;
> +	__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
>  local_norefill:
>  	dispatch_enqueue(&rq->scx.local_dsq, p, enq_flags);
>  	return;
> @@ -2141,6 +2148,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>  global:
>  	touch_core_sched(rq, p);	/* see the comment in local: */
>  	p->scx.slice = SCX_SLICE_DFL;
> +	__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
>  	dispatch_enqueue(find_global_dsq(p), p, enq_flags);
>  }
>  
> @@ -3202,8 +3210,10 @@ static struct task_struct *pick_task_scx(struct rq *rq)
>  	 */
>  	if (keep_prev) {
>  		p = prev;
> -		if (!p->scx.slice)
> +		if (!p->scx.slice) {
>  			p->scx.slice = SCX_SLICE_DFL;
> +			__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
> +		}
>  	} else {
>  		p = first_local_task(rq);
>  		if (!p) {
> @@ -3219,6 +3229,7 @@ static struct task_struct *pick_task_scx(struct rq *rq)
>  				scx_warned_zero_slice = true;
>  			}
>  			p->scx.slice = SCX_SLICE_DFL;
> +			__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
>  		}
>  	}
>  
> @@ -5023,6 +5034,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
>  	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
>  	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
>  	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
> +	scx_dump_event(s, &events, SCX_EV_ENQ_SLICE_DFL);
>  	scx_dump_event(s, &events, SCX_EV_BYPASS_DURATION);
>  	scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
>  	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
> @@ -7163,6 +7175,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
>  		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
>  		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
>  		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
> +		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SLICE_DFL);
>  		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DURATION);
>  		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
>  		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
> -- 
> 2.48.1
> 
