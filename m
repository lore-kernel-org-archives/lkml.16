Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED701E521D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 20:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745699125; cv=fail; b=UpoNLdfezV8kzWrY9UcRBT6SVmjsYduG+2VsBVCI+AAZvyfUKEiUIknKewwszH2k4j+zJ0RivvITqhemdZ7qsB03TTMgMnArvbk/59EDQFmdRw+0yW6rfYG1sqLvYe5QqG1lUdZGu1SFQ2f/EVIZVNUq8hU78+3SdywYeCHhKG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745699125; c=relaxed/simple;
	bh=z9FJha+blVGrr1ImES6Q0u2ECzA4sZt/GTKkRY7IjCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X2zt+757sKvJAjOjAG2fjZIUS4MmDGGrOKsBlBTRUTvR3uUW5gM9Rowg1w+Nfex3rC5Nmslct2CO15TiFzyAnw7bwqGW4V7SKQzNdbViCd1+k2FOvyXstRi1V1avwW52dS6Zu/RMUjVl6lejcGs3KmgV+HZGJjjmQfFj/mnpgfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=htnv9v6M; arc=fail smtp.client-ip=40.107.95.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="htnv9v6M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2Ucl4u/F/GuNh68DDwirWgX1rmKXy6WQHis6QMYtPxIhnxS0n8t25hvFcZwVvY8GpGcCsNkH2Mra0lwj7lI6QhMxI1PBMMYnqpUKQuCaCsTRGl77CnOiUvwQ6SUlH6ZUOoOmTLYa9HjVrlLMbqoUXIdnyHlSg0vhL70UKGnXoFVIhYmgPq7+27OA1rmPAnV4Rsy6E2IwMnY/XhP3+zVOLHwf3n5fauTjbbQM2FibsvCY40VnjJqmKl2pjaVLIz/q8subQjZcDmg4wsfxyKliRiRj5iOyAYllNaK+2M2mBQY4mngH/7eQrrrh5EZmW6t4V9x7Hf17x7eNIajl454jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muHf+qzq9Xjr4/g7onravaBO0ED6BGStbwFmdu4TZpw=;
 b=nRbv6vtWkxk0Ab2EwON2x4qNh0Dfw+NfjwNUF8Kzzz/v5bsETUa2yZ+HOoNSpdjFXh+3wEEuSAy3moI8rTajzV8KTlRJbw/OykezwyfC+jNqFc5KG4YWwjFaV9aCB1MIsAvmV+/L4KnVdbwgT8dLcVj6uU+MsxxHtq7+gy0wZx4sW5JdpbC1tD57gxaFdg7P1puMUb1eRR3rSF0dQiZTK+aiTQPT4yBlTFTQgtclgxXtzkTzRGmkl/ecdWAGUQKeuw1mFEyaUkr6soacniXgeY5zdRAlkmpAMF1BKeoVp980KS+AFefLnlNjhw3xw2nTpzqDd51dz/G5CfuIbPNnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muHf+qzq9Xjr4/g7onravaBO0ED6BGStbwFmdu4TZpw=;
 b=htnv9v6MNps9SQJZc/I2WNbeE5wJGS9JvgxAi91vTNLKrqoyLICYpee6pFvSyvYhGP1CeRQJB7HSg82VI31uIohpHdLLaQGHj/4Cug713fJw1z3qis8ZSKYxhztBG0r2Q1KcLath0EgbO/lUEJQFS8vVwkaLmmQjOK/SVgn2Iqz+bEz33WItVLzu4qK2/f/ZVwU9qWJk223yWXS5NeI/xl57z/uwewzW32GwiB7VXiTpXoN8gkyCGo5eQRtGdncUmfP1BL+BPOTppa6oQXsus5388rsImZBpZERJDgYg7xVTo5/t9aTBoQVp/CqPa13Vcr1RrmjzpqHynUZLV0X+VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.48; Sat, 26 Apr
 2025 20:25:20 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.028; Sat, 26 Apr 2025
 20:25:20 +0000
Date: Sat, 26 Apr 2025 22:25:09 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 06/12] sched_ext: Move dsq_hash into scx_sched
Message-ID: <aA1BJewva-MMTabR@gpd3>
References: <20250425215840.2334972-1-tj@kernel.org>
 <20250425215840.2334972-7-tj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425215840.2334972-7-tj@kernel.org>
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 906eb21a-9f63-4bd5-f433-08dd850076f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eFlHOYd/kIFkOlw0cagwiliFjcJxU4SSkYIoRw9TXN1vIPgz93QOQ/ietaL1?=
 =?us-ascii?Q?VrIvjPmVDdnfLng9NDUq0yu6L5qhY6PMVyxaHk/rFvZkXoIMI/oFUUx7qvYt?=
 =?us-ascii?Q?eHXBiYkJP6ebgItUO/kIhJoBVHqCY2Q8waCrMRyzSOWhZxOKNs74Z+c9k+Y1?=
 =?us-ascii?Q?d/mkMQsPxTgDQZ2BwnEy7pb7HdJMp+AN3gdv36d8+Z+77k57Pf0j+o7IHFJw?=
 =?us-ascii?Q?K0CUx2rbEWpve2s6PgfThsOT86IE07t0aQM9FDNn7evbEc09KQrukrSsqfn3?=
 =?us-ascii?Q?YMeHK1IpwKzyoV6wNeOZLSGeUcG9T42AOY79VmZTS6XgUU4hPMVrEsJAInpH?=
 =?us-ascii?Q?cSsDEyNqbmezAW5h6JirjDISJ+81M4X5+SlS+HgGuvqcP80AFAsG+uR2CNlQ?=
 =?us-ascii?Q?FUueXcb+eASCZ4aEzMI8DNmZN2CGTSfRmJI+NxczucvQ3g/pf2jLUZwkiDDp?=
 =?us-ascii?Q?4wIU8fECdTUByyqWRorcdRfAfSf7b4Pjhd3QmDLQhxAa4/iCy5+GSY3fNiVk?=
 =?us-ascii?Q?76vqEWGp0Nssw82Qqf+i9x6+uEYK5ZGZRW/fUBQfndBVPSoYNFH5L7Jvhy2u?=
 =?us-ascii?Q?/MMhMmecc95bXxViShessEpElig/g66hg1TunG/BFi5Sdrl2szmbJtCycD6p?=
 =?us-ascii?Q?0eoQwzx7vOjcDcuLN5dndOf1I/F7jVlwaLUsTUv7AYY9NcIKjlH0NTT+2jmb?=
 =?us-ascii?Q?kaP2uoaPWfzBgU2+TMcTzISBn6bEeN9buI5ov7qHnLoA2ltuNTr7bhpuoWGy?=
 =?us-ascii?Q?yWZPym+pI3EYK/CKibr2LYi7fjFX1xaVQWNi7IYLBsbT4CKaJm/TWuvgbcGc?=
 =?us-ascii?Q?gvrOhp7QfOUU1C6CP1kuplzJpUKdcEk0tgKNCXszIlFOg92WE8VIGqDRI2Fv?=
 =?us-ascii?Q?7iLl2+/Od64x1bnIAEbh2ZouS4YTyfjvN8khY5Kct2coF+q+spVd0Y5BVjgF?=
 =?us-ascii?Q?hkWm6Z73RClZmeYQMKMM5c76Ixfvr8pFYSYCd6sX+52WDNvzaaNQYQ7x+Ipt?=
 =?us-ascii?Q?KcTJ2UNoHWB46SgzWTUdVmI23bfaJgntJ8MAIfCa6m5T/z63nwgX6VPCtiqW?=
 =?us-ascii?Q?2yuECg+c/DL5/+aRA0bqzHJv4XSjCd68BhuI5ds3CgCfORc5IwTYmPo2pVtY?=
 =?us-ascii?Q?bmjj8ValCqeRF+idhrFBpZCzs5fKuRWLjuiWf37K4zSFlffvO1C3mw0buWTY?=
 =?us-ascii?Q?jrtq5BrKcNVxfRPQnjaJP4Wqq+hooff1iaeUJ8D2+GycTH8hNzS0keqSCK2y?=
 =?us-ascii?Q?kpMiPaL+aMjAZ5pRIcrBYNy9Juk8yCxK1iK1CNaW1gRFSZmef/sUJnQt10Ht?=
 =?us-ascii?Q?z4FkUVEZsmDJXT5D6ZG5TY0xiu9v+EO5uXOOyVAvJYlwuKymSKW6KZ63vJNo?=
 =?us-ascii?Q?gEu40pO9zyf1+9On9SXO9UqPHMwOUwlrcGQkfeAePfdjjnrZGePqF8YNv4Mg?=
 =?us-ascii?Q?J+6sv7K2ZSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Ljb6wCPe0PaRWiHGgdBPXQCCyxWypLSAaqfBqAd4/PLKdRrgHA+Cc2jTZus?=
 =?us-ascii?Q?S6Uzsyc2sLrc8YjsEaAhjiQugkmJ6Nx2BGyh3DoJ48IMQDMI3JfqgIkLeKqk?=
 =?us-ascii?Q?mdntOVHic2hNehNPM3hmEhsU8AILQvt+JXra3pPiSARL3W3ElSPoirQn89ub?=
 =?us-ascii?Q?Iwx1kEALMBaQnlbHWWhMHbgwLSfq2W1voLV+RATX7LI7zCVKwj/3sisNykZF?=
 =?us-ascii?Q?xAvP8hbLiDUU5kUEivJPv2tn/rfJUi2SRQjAOON8Q8R/3W7n9q/hKC2wvM6w?=
 =?us-ascii?Q?8w123s3rHHkWSM7FR7DFFD4QLk3ogWB+k3nQyRYgB2o2RYlxTrg5w/MPsq2N?=
 =?us-ascii?Q?Ld0uUkCYNBrERkndzY85Idje1FD+tBnrAPr/WFyGCE2j1s6AEHaac+jyhyK/?=
 =?us-ascii?Q?8+b6i682vqKGeNnTjDrRDVrt9ngYgtuKPLg0wkXrSdEMKjZfJngcsZz6LZmT?=
 =?us-ascii?Q?S/vy0Fnx8pvy4walPhVuMh8WhubSgao0x/x0RpZpxVLYHR+3bO6Bqpj1rG3a?=
 =?us-ascii?Q?xZTfr6MKc01bXbVjGrpqSLr+dhUcXNrsw0GGCefLmLgoKk/6t6RapnleddTu?=
 =?us-ascii?Q?4QW4LovlfbspxNOytfJkLD/+8IMI2AuQ/SOJ/8hmjpwLY3f2vtZsWWUoKcjz?=
 =?us-ascii?Q?3BG2p+GeTlySKeYmfGg8BhEvvNNpLIJOrdPtzf7FNWrM6ZpEWZGE7SWpTavE?=
 =?us-ascii?Q?g8vjp3ULIuDOpfnr4335cRlqwm93k2T2dWP8nDvdijIgFj5wmHqwAQ+dPa9x?=
 =?us-ascii?Q?EE5C3YEyQiMHdLnN3HMg6JnxBt8yGsj4JYtKtI2DPQkOXmLNeY68P+OGNEQY?=
 =?us-ascii?Q?+kOclKzetifigzdFpLyuWXpow1cnqnYA7VhLOFW/oo8ivP0FIbV4et1qNf1U?=
 =?us-ascii?Q?txwYMNslUosIP6YX5I/3nbq0xorODk34TL1kUCODGwDJH85+m6hyJi/aUDwY?=
 =?us-ascii?Q?FRUz718+vqj9brq1cLFs1OmKrHsNJi6ApOz87TvFtaqHrwfVrE4vuvyRV/92?=
 =?us-ascii?Q?qUWfNipEOwIqPH5o/CPQc/TkLaGMN0ZU1gDHkxfYfdNzNM0YxqsnCzCH8d17?=
 =?us-ascii?Q?smR6tlUAo5aSHNy37OrdUi3wQt2SfiNztHknnFY6gf5AY0RL1JHeYZy22t1I?=
 =?us-ascii?Q?SBuwtwt9cJQccughhLB6TfLvrorlNZTnL5bQUN1dqlgK5++vpHFz+cfs8Nf4?=
 =?us-ascii?Q?pw5wc3QbPFMG8bjkRiS5Pnuck0eFdbF8rRIkfxBab/A7pIJoEOime5hOTiwY?=
 =?us-ascii?Q?50vv5Wi/K4gScagNHf0LZWv0RCOsL1o4ik1PFyMDPCmnt5ay9sPUiMdraNGy?=
 =?us-ascii?Q?qqnPjHtQIxh9PqVGu7T4rmxCiGU9GQl4LSxiPFc2Ad3IwHjkLjVJGE8SMC00?=
 =?us-ascii?Q?j2OHr5vO1PqxuW62J6A+tTDC2BL1mQGXhYRncdGQ3WZhknEt3qWvuQnGsFFp?=
 =?us-ascii?Q?DQg4S1CBRhfOMOXXrt4g2F0r0rh2C/QwibQ2yf8remzBOX2idLBGeQpT0GEp?=
 =?us-ascii?Q?9nH5LE5NF5MP6674ZzUNiTwrWNQ8uNVXXMDWmXJ65Wubs9urqKACu+OjYzb2?=
 =?us-ascii?Q?RANEsyFaKurboPrCahdd63tVdebhZxxaTemwfuIr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906eb21a-9f63-4bd5-f433-08dd850076f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 20:25:20.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnO6MXUVhIz1WJOJqDvhMMdu/mEdYQRe4tqwD/GixrqgiDmehKzDRj7UbPfoHqduC6KIO0XhlrtHzCPdSDYMtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689

Hi Tejun,

On Fri, Apr 25, 2025 at 11:58:21AM -1000, Tejun Heo wrote:
> User DSQs are going to become per scheduler instance. Move dsq_hash into
> scx_sched. This shifts the code that assumes scx_root to be the only
> scx_sched instance up the call stack but doesn't remove them yet.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
...
> @@ -6858,7 +6889,11 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u64 dsq_id)
>   */
>  __bpf_kfunc void scx_bpf_destroy_dsq(u64 dsq_id)
>  {
> -	destroy_dsq(dsq_id);
> +	struct scx_sched *sch;
> +
> +	sch = rcu_dereference(scx_root);
> +	if (sch)
> +		destroy_dsq(sch, dsq_id);
>  }
>  
>  /**

I just triggered the following lockdep splat running the create_dsq
selftest. If we call scx_bpf_destroy_dsq() from ops.init() we're missing
rcu_read_lock/unlock(), should we just add that?

arighi@virtme-ng~/s/l/t/t/s/sched_ext (scx)> sudo ./runner -t create_dsq
===== START =====
TEST: create_dsq
DESCRIPTION: Create and destroy a dsq in a loop
OUTPUT:
[   72.890532]
[   72.890621] =============================
[   72.890652] WARNING: suspicious RCU usage
[   72.890683] 6.14.0-virtme #33 Not tainted
[   72.890720] -----------------------------
[   72.890754] kernel/sched/ext.c:6879 suspicious rcu_dereference_check() usage!
[   72.890819]
[   72.890819] other info that might help us debug this:
[   72.890819]
[   72.890879]
[   72.890879] rcu_scheduler_active = 2, debug_locks = 1
[   72.890935] 4 locks held by runner/2097:
[   72.890967]  #0: ffffffffb239d968 (update_mutex){+.+.}-{4:4}, at: bpf_struct_ops_link_create+0x112/0x180
[   72.891050]  #1: ffffffffb228aa68 (scx_enable_mutex){+.+.}-{4:4}, at: scx_enable.isra.0+0x65/0x1420
[   72.891141]  #2: ffffffffb2274c90 (cpu_hotplug_lock){++++}-{0:0}, at: scx_enable.isra.0+0x516/0x1420
[   72.891242]  #3: ffffffffb236fb80 (rcu_read_lock_trace){....}-{0:0}, at: __bpf_prog_enter_sleepable+0x27/0xa0
[   72.891331]
[   72.891331] stack backtrace:
[   72.891377] CPU: 1 UID: 0 PID: 2097 Comm: runner Not tainted 6.14.0-virtme #33 PREEMPT(full)
[   72.891379] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
[   72.891380] Sched_ext: create_dsq (enabling)
[   72.891381] Call Trace:
[   72.891383]  <TASK>
[   72.891385]  dump_stack_lvl+0x9e/0xe0
[   72.891390]  lockdep_rcu_suspicious+0x14a/0x1b0
[   72.891396]  scx_bpf_destroy_dsq+0x71/0x80
[   72.891401]  bpf_prog_4b98ae790b57e181_create_dsq_init+0xcd/0xe0
[   72.891403]  ? __bpf_prog_enter_sleepable+0x27/0xa0
[   72.891407]  bpf__sched_ext_ops_init+0x40/0xa4
[   72.891411]  ? scx_idle_enable+0xf0/0x130
[   72.891414]  scx_enable.isra.0+0x54b/0x1420
[   72.891440]  bpf_struct_ops_link_create+0x12c/0x180
[   72.891447]  __sys_bpf+0x1fdd/0x2a90
[   72.891470]  __x64_sys_bpf+0x1e/0x30
[   72.891473]  do_syscall_64+0xbb/0x1d0
[   72.891477]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   72.891479] RIP: 0033:0x7f82b9508fad
[   72.891481] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2b 7d 0c 00 f7 d8 64 89 01 48
[   72.891482] RSP: 002b:00007ffcd032fb58 EFLAGS: 00000206 ORIG_RAX: 0000000000000141
[   72.891483] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f82b9508fad
[   72.891484] RDX: 0000000000000040 RSI: 00007ffcd032fc40 RDI: 000000000000001c
[   72.891484] RBP: 00007ffcd032fb70 R08: 00007ffcd032fc40 R09: 00007ffcd032fc40
[   72.891485] R10: 00007ffcd032f9e0 R11: 0000000000000206 R12: 00007ffcd0330dfc
[   72.891485] R13: 000055e7e8854160 R14: 0000000000000000 R15: 000055e7e8854160
[   72.891495]  </TASK>
[   72.922754] sched_ext: BPF scheduler "create_dsq" enabled
[   72.940151] sched_ext: BPF scheduler "create_dsq" disabled (unregistered from user space)

That's the only issue that I found, other than that, everything else looks
good to me.

Thanks,
-Andrea
