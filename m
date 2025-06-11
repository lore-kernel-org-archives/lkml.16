Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72738A923
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620864; cv=fail; b=bDiUWLn+oXlEY6PyXfILoBQyNo62m9qXWsIqtOjyxtvftyEKF+QEDezBbZ+i3Czn1ubmbjRHNQPf++W03a0/11IyMOBoCJ8sVitLlqMUsX2SGXfTax6zDHBrNQK6old21UPpRTNJFlTuAaPZkhkGQqpNnFziMsyV1qnn+cFOXmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620864; c=relaxed/simple;
	bh=6sku6cea0pE0Ki+1B0vBozlx7CjBALGs3o3Fu+rLPds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iVHKwnlnRthIlhrEJF7LDiITDY8zo8qU/VDoeeoKEV9DjTB9bzNGgHxVZ/4TgrLVI5h+Q6seUCQlybAwNk5nq0Hz7Xf7atWheiROhNLMYjPHUIIudB+L2CEITNiPGDGTs7dS//5qfnzn4NCLyldFWV+1NOHuKOu6oIBImJvBhqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lePWmQhF; arc=fail smtp.client-ip=40.107.94.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lePWmQhF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb9tNWUk+SvNXk7BXJSSt3Tar+5nsNTwbfGfIAzS66S+LK3eSVQZr1jRnJgHx76BBUZXG5c7qW1gQI/ZVdRxDthVaGnBG/PAVAbMCN4m0N9j5YC7IKb0D0qftg6WmUdwCpL3XjTqRd5XoGyGzClSu4LE5DyBuN+M+KM8s+yXOa6es6iI19Ac0l5iSXhDTzxYvDX23KNsS28VZ4OmcYraOpB6XKlLk5VbyapXvZ79T/gQkCJ+Ub22l/1S9V2S6NNyOpHxmhwFydbBxd5XwVujVHiXx6HRD4XCRqoo+iWtOkggr1T8lynHb0SrhM66Q4HnaqCf/SWe6X+AOrh+cSIi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+mBM8a1DO9v2scdjRGTK2qWMx7M77n4Q3H40q+glhI=;
 b=O4nCi3YuW9HCnZfcSlcIFD3Jv2jyK/tje7Wy0Od10Auqqe69t9D1tDxXVsu2ddcNkXJXHJXx7qIuGcXngB6PUXkP95L3qIx+GdIEOoJxqVxQvPd1rL+T/P6sobEdIHQR0eEMryC6sTMESWO45mgsBnhodDTbAS203Cx+iXQRiKWBKi/rOFDlz8XW9KV/t0qIdT9qzQYPHFIKCe8PTvjMo73FNcRcDUhz2YnKHJEUrC7ADo0/vBdxHaw9i10FlxfGutVPOs3Dxw90CzOEWZjyZQ4O6UzMB0Mtjgd5fpgUfF9w53MiMOI0fqLa2csjQ82vMg7N0d/ynrIc05vFp9moHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+mBM8a1DO9v2scdjRGTK2qWMx7M77n4Q3H40q+glhI=;
 b=lePWmQhFPiNfn1bM+u5k091peFLucJmw3D0Vi6jG5ms/1V4mIU85vnuXlDE6WbPaS65hX798cXfgCX30tDJ6iYGxYMePfg6i1bYjRLF3JYJLVfTtKuzFYtXMKAu8Lb7cwYJHD3//3uwJY3lgPg+/j1Si5I2a2h16LCKsncNkNHtQhHFORmpper8/qyjl1se/KJ3VlKvIHgiFkfeSmWdLLrxPtSbJBHMWYozJ05KODZVkQvlZK/reXBnDInBexfPGhQE1/4Afc7pEdunX8QjkSsJuuS+z/8SRbBAN8vjRPJieoxoOaK2lgc/VB2HA0WljYguH8vDnyabQ9VyJOeBohA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Wed, 11 Jun 2025 05:47:39 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.039; Wed, 11 Jun 2025
 05:47:39 +0000
Date: Wed, 11 Jun 2025 07:47:32 +0200
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
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH] sched_ext: introduce cpu tick
Message-ID: <aEkYdGS3qohjfEE8@gpd4>
References: <2d771c1f293845e09edf73f5db5b2837@honor.com>
 <aEhyZJmjhYJfVe9v@slm.duckdns.org>
 <7ce25e0b235f4339893f5e74ad9c7d36@honor.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ce25e0b235f4339893f5e74ad9c7d36@honor.com>
X-ClientProxiedBy: ZR2P278CA0074.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 5333ee8f-e97a-4489-deb6-08dda8ab79b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UNRkhHwEZUpH6l41halLhJ4P2LeUOKdx19OnGTKpWq3ErjPgfBvP7itrUtNX?=
 =?us-ascii?Q?sXQPaFb+b5Yjk9lgnXcOp+1OPCek3OsUer4V5qYcQv2m4IZdKVLzXeMUcdSo?=
 =?us-ascii?Q?KBL1uS+bZ3OPYV1quTIIMChN5zjpwC40WC4+zEd5CQJTXz1DQR+C+C7l2sTn?=
 =?us-ascii?Q?Idb/PWKmI18bWmAH1tnZ/sapM7BNeAMZvvX3iU5VnYGPV3wcYALEVpLN34uM?=
 =?us-ascii?Q?s77PpaGdDcRyWyDfgnEzKWqFkYW7CfcOIJEzxSaHjj/XPAmPNA0p80Ugjq1f?=
 =?us-ascii?Q?26rKNgqsRq/zo65SZJeIwSGAc5UZ4L5huEJUc8N405DsSgwuxvEb2UeLj857?=
 =?us-ascii?Q?i001VQVy5aQKpbbnT3iZumJz2XkRNAGS5O0uyUnbM05e2+1RvbilFVJZksnG?=
 =?us-ascii?Q?98ntEeCqaHdcjUsIMHCiqphaLa1ey/4S0UxuMxqGoARuEJjFUU2D7Xn7yN5W?=
 =?us-ascii?Q?SbW9gz9DkbQOuoa02EQZEOoBro6dg6+As3Enga9xjzxvnsHNVY/RoitavkqY?=
 =?us-ascii?Q?1m9vWOdRqtFZrtrSekttoARW2dt8SknmKLUzdqQnwTiw6R4J0eLjEbFOMi5i?=
 =?us-ascii?Q?7FUxx1ZJkxb9T+CE+tcytydsoG77mfliYylniJarbECe1XOJmDsHgk6sL1LK?=
 =?us-ascii?Q?RJI4viJb2XCcbHvt7ipVWx3RvtG/8u9bRFT1w8RgdT1TLGa0s5CH5vJa3mls?=
 =?us-ascii?Q?uGs6C3vKuFvonSgb+CCRQ5sssdD2LjVeOeb7YC4SCIuCGSMA0cqo5GRwWHvZ?=
 =?us-ascii?Q?afEDmaI/kA/QFQIX0xWhXw4NbpsooU1fVSvq79iOD8JdxzSed367CoqQWn7D?=
 =?us-ascii?Q?E5IgAESCSzmyPiHWt4o4kcB0P6LdZJENLWcbmZnBcke5cfdhUSWyWDVTPGEh?=
 =?us-ascii?Q?6a3HjwJMruh/JLe/Tllgz/neLt1DazBRvLA2kqKLkbfUShlKrHAMzjF7BIld?=
 =?us-ascii?Q?RpdDbDxI/bmO5C3Hz8qavM8jgrfGqVFUji8i5HQK1r1Hhxo5ITEhwxdfHqtx?=
 =?us-ascii?Q?DorjzP0fcbRtd9bxIY0dLj3TA++eUaKzvfaZkWGnBOCVcGt/HWZcG7lwOWSJ?=
 =?us-ascii?Q?m6yrlzIY+RbClxPfvgUHfJMegGXPF1FI7Br5DZuJYzYhYsv2wvbRAL4bJG3V?=
 =?us-ascii?Q?aolhOy4bayWhT5lxMym20cMqkoi5SEndIJhno3gHFAK7lZvKLtQ6+2sRneQx?=
 =?us-ascii?Q?UUXPWxWy86Rs53xl2EX2Cd1GG+jRwraMZgtr75Fu4yaq8N4wEVKaSvPFVgiY?=
 =?us-ascii?Q?BhDu3prLpUiaylywTQtmLSsJqPzlj9nQxiiTeWbyoYexOI2Z4v6och5D5SAq?=
 =?us-ascii?Q?PwYRfgb4lpDvSrhv6/d+aydfliyTI+w8Vc7AZEtNorS/lki/8RDMVb+jpz8R?=
 =?us-ascii?Q?dbRV2ePoSE6VpjLGVgwAIc8GwTdZ/d6F2fRbQniiZmqlnI2gyBUK6YAu9iL2?=
 =?us-ascii?Q?QLQFDpSlUPI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UytFeQr38tT8oyrQ1049oJUSt7JyQkOzZazkn5SxkEovDM7LZnUg5Y4IQ67f?=
 =?us-ascii?Q?5HGyLBkH+1hY7JAvrHMo2y16Pt4tWHCV9PN8R47lMkoz7oy8z8JSNV9C7aF+?=
 =?us-ascii?Q?+xdwVn387ktKX4Yv7EJ44RejUavyVGLaznFKgQy3ZxN1pFK99QNHd0TYQb0n?=
 =?us-ascii?Q?2gmVAq0EAnTr9tb4CyWN9yZpYzLA6Vot5p5ay5z5M5baVLdWRj8y7vhtzJ5c?=
 =?us-ascii?Q?349kka7xguvjZ4kTqYGHDmy0J4dfmgMhNs21hsttO5KnbdpF/6fCPx/2GVvh?=
 =?us-ascii?Q?5Z80/ledHAV6UraKdiWsk4zVbmmL++jVTsVLhl/wQiVV5KLHh2nM5sBYxI2h?=
 =?us-ascii?Q?tPCc89+u/mhe+k914NMYYpFb8mvVTpbWsmr06UNClmPV77H19PsQox4OgG8j?=
 =?us-ascii?Q?ACCJTXICCvIEeW/EOEY0OVGAm1XkRrPPoWLrYKm7Gtf/0pzG1zSV4yQUefrJ?=
 =?us-ascii?Q?2qEg18FrADVbrhWuFUHgtUOhxBPC7CNiEhfCByuw7rwdEqlaSHqCKJG3CoBi?=
 =?us-ascii?Q?Udqe/8zPJr3euPeVw2luwDPsNBGq368Dtbv01p6UxbXVkpoSfyuaNakorwxg?=
 =?us-ascii?Q?1hjmQXJE3HPGdykWQ2uzA2BOzR1VLCQCqdB4d+eTQNOXjvGHgJ+OkboyTSUT?=
 =?us-ascii?Q?yMPxFylm+KcTRwBHptVwKaO3dMVx92fb+LQsIwuP2e8boGyR50i2cP189Bjn?=
 =?us-ascii?Q?t5hn52PoP1/55k3JNZuWQ/6Su9oYuhzkQNs/agXcHwU7LjdaYWo5R2HgkLoa?=
 =?us-ascii?Q?xSVcQHnMx7ZH0XSb0dcWNm4do4/JAPtHsgtvkh5FE6lPjRN2AIGxXiAPQYdU?=
 =?us-ascii?Q?PEAKUYhMwMff3JPCsKGi7wvuRE1OpE6Ail/9n1Jppv3XRNaPoQkpj5NKPHfp?=
 =?us-ascii?Q?3OAasDhfevRoQzGBm0VgNkq3lUNjymq2c/xN1ucngK2gSUzfBOp/2sMDaYFW?=
 =?us-ascii?Q?MhcIf/su0yC8JJjuUtAfR2KivVweGY+d3MOz9niEYPPZSrw7Hn09f8YhtB6A?=
 =?us-ascii?Q?aQdxSMy7arQal/mYmhk+4ftN1gvBXWPhIXtA/o9YljNsyg5bL7tgbHb/Ijgr?=
 =?us-ascii?Q?slcY4/pKs4iVtd0sAJEbFeFYX2wilimok0YrnfDmtF7ghzsJ4IN5InykEg3I?=
 =?us-ascii?Q?as4BT+w9rbtfGYTvROAGCEzeD34bTNNuTB39t0iQepjlRmutSuDx6Uea0QMA?=
 =?us-ascii?Q?xTMKnqVjN6XkRAWy3crKK1cPmbyJ6DrsPeZNMbFQlyiktu72OgnEolbUTWOh?=
 =?us-ascii?Q?oT2+9g04CBEOLiK75TwrVw8u8xclEg630i0nq0yZQJxUmcl7PkI5c1/NzZgE?=
 =?us-ascii?Q?hZp3uYLZ/BmQelG5hRwiN/Rg/qSqSt9CkMJhYcnFKJw0JDgewOA5175ETp/C?=
 =?us-ascii?Q?mXbiXly6vLuQt39b83Do5SQa/ZJcT1B3xi/ahZJe/eXv7IeDhXL8K6Hc+Ol/?=
 =?us-ascii?Q?6dKAk9XTIXvvB/pzv+aEHaAJVcER6anvO7u+AvQRsuL0mF8Kffd1tdLHB3vx?=
 =?us-ascii?Q?8UfJmEVeGsyvP+HfI3WSWgsxqDTjWeVNBlM0eQrUGZ8J7pIQYqDv7UfWBFb4?=
 =?us-ascii?Q?4nGJXztqArJCW6A7i/kMjwXwHKcvHmoMrGD1sPvD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5333ee8f-e97a-4489-deb6-08dda8ab79b9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 05:47:39.2895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ule++B1mxk7o9qMx264VjFRl6KBBM5yNkkDwgHYB5+bQTajVyJp8bhKXw/H1Xf/HIBijpHm8MUGjkBgcxsJEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866

On Wed, Jun 11, 2025 at 02:22:11AM +0000, liuwenfang wrote:
> Thanks for your feedback.
> 
> Another one issue is that if a runnable local SCX task has p->nr_cpus_allowed equal to 1,
> and there are RT tasks on this CPU's runqueue, we need a chance to let BPF scheduler to adjust RT 
> throttle param properly(or other methods), so that the local boud SCX task will be scheduled
> in time. This is important for the mobile scenario to render smoothly at 120 frames per second.
> scx_bpf_reenqueue_local will not work for the local SCX when p->nr_cpus_allowed == 1.
> 
> Also some tradeoff methods can be taken to balance the performance:
> If the running SCX task is preempted by one short-running RT task(predicted by its history),
> then it is better for the BPF scheduler to keep this SCX task on its local dsq, rather than directly calling
> scx_bpf_reenqueue_local(). However, we still need protection for this situation in case the
> short RT task become long-running task(perhaps due to some exception).
> 
> Any suggestions and comments are welcome!

This will be all addressed by the DL server work that Joel is doing:
https://lore.kernel.org/all/20250602180110.816225-10-joelagnelf@nvidia.com/

Thanks,
-Andrea

> 
> Best regards
> 
> > 
> > Hello,
> > 
> > On Tue, Jun 10, 2025 at 08:59:45AM +0000, liuwenfang wrote:
> > > Assume one CPU is running one RT task and one runnable scx task on its
> > > local dsq, the scx task cannot be scheduled until RT task enters
> > > sleep, if RT task will run for 100ms, the scx task should be migrated
> > > to other dsqs, then it can have a chance to be scheduled by other CPUs.
> > >
> > > So cpu_tick is added to notitfy BPF scheduler to check long runnable
> > > scx on its local dsq, related policy can be taken to improve the
> > > performance.
> > 
> > (cc'ing Kumar as we discussed similar issue recently)
> > 
> > There are some race conditions we need to address but calling
> > scx_bpf_reenqueue_local() from ops.cpu_release() is the intended way of
> > handling these situations. I don't think periodically polling from ticks is a good
> > approach, especially given that ticks can be skipped w/ nohz_full.
> > 
> > Thanks.
> > 
> > --
> > tejun
