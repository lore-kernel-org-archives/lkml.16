Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934612F3202
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190798; cv=fail; b=Iv3AFqxCsSdseVnWAndi4439iihUdqSyKfbUaCkIs4FSbD2kkpF8HCgmOF0hjU/q8+dqmnMIUdVslPS5iqReZLIj7AqCtAh88CwVkDJJ52F0j4kCow/xQDWzp/uYjvC4pw14KsS/Iz1wXMJU6oP3FYVBFmd4iNHHfDF7niwrznE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190798; c=relaxed/simple;
	bh=lV0I3ZXFlxnXIwvKSyWMOuPxSeB/SBfMk6OH9ngVv1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KyFvvUPPGeJWmA4crpCsw3ke4yNoIZHi6iVu5fobNdB2AruvBRI9DbgMq7wOqqC+whKSMh0RtPE2105LURqNNBZVA+7SYnb8U9nIxEXsE+XpZyDqbhDMwNQuQAGdasyE/JJheJCIesbzPqSPmcbpObO3fLLsSs3AixP4eNp+u7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i0wyKSqm; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i0wyKSqm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duUD28j+X98E+quPGi2OzOGUexvXXoXdjZFbRH4gTvlbe/CRUbFZAFHzd/cFNR1cfSe4K1x8Foa8ZeapvsfNLOGYvwzAo6nbY+4SKsJal3KI4/sE+x9f/twfZGwHiHvDWeKuJ7ffNMM7HpwjdX9/hCjnDVI6CIh9/fKIZeVCDnZlaSduBnAGK1ErKydBwPeL0u1rlWIqH4VaKqxM7jh9c2GJlcYaAUJHve9BpcZ8K39G7fkEeESYFix9VLXoVG5RX0f7psnlESZrpc6uiuVGijf3tioUE0wFX6whfKqHbLbk2Jrl9EsCxkV12eqTHALOKYQPIJ8DJyRkIep52T5AOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/cMEur6cT4v3bbAwOPSxcOH2s52jYS64Du/TiqRPkE=;
 b=Txq0cqbzrf/06Lu80NVGNez+L2XXYAJ1zo99SThVprl/3x7Eov3VGe36LM3RTQInrizocMPdWpYw24uqzyxA5NE9KtSbrc/qvn3Ym9PJxOTUWJPrzeGYRnlNAkkka6tEkMG+9OXad6D9H9+rJT8WnzrTMbg4gWFTlQu9WuKmRPBbqoq2Yc+rU5n+e8wYT7E2J5fjZb1DCP06DRaoUjkvT5ADcM85NcVE8U0GuYqF41u2sPSEtGX8xRrdrKpIKBZGiqTLpbOaHx7OBs6aMyv4Dvwojy5mMJQg4Jyc8q/gsj8OQxHZvdWprX0qgarB+irp/QBO/r/V1ouMsGAgmeN9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/cMEur6cT4v3bbAwOPSxcOH2s52jYS64Du/TiqRPkE=;
 b=i0wyKSqmrkKiYAr1XDMY8IeRlTyKczdjrzLQAZqhyZVUEQCKsDsv1rwe0U2ZI14tHwTpZVBBRsDGdfbFU8rZT+mFBCRAo7ZDJYNLuXXT8WUdSlw7pxiNqCPH8OfdW9PlZe+MlVqrKVApzYbdr9gbTuemMLOmWCzPuBn+tbhkamxQDtUZT2R1oSfQ297rJeed4IW5E3zD/GB2E+DbjjgFEDm66Y0eU7QvzNQB0q5Fb6nIT+uscLTcYuwbv5eIJcbm1o28InNAz0ELl+JGjB6cS6Z/EHOkU/IZG7wk3w2StMJY0BLZNcK+UtTF05Q855Sye3vzbBdXpZa/7L6Q/DlLSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB6714.namprd12.prod.outlook.com (2603:10b6:806:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:06:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:33 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 15/15] sched/deadline: Fix DL server crash in inactive_timer callback
Date: Tue, 17 Jun 2025 16:05:18 -0400
Message-ID: <20250617200523.1261231-16-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:408:fd::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7602a17c-d497-4acf-a1d0-08ddadda74e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+1I2sbSLXZKRq13NSrhgTT2iIqcRLb2zVCeIOzZ/FRPpi+pFlYox5JP8RpJK?=
 =?us-ascii?Q?pZ5ySSO/6tsZjYEU6KVz7Or/SV6kc8QT9gu0LF+VtDBqBHotoxlzaKBotjWq?=
 =?us-ascii?Q?d00YfEWB/AnR55qZPGi+2hQpnB5ixRdVjELWfW7Czm8Qmcwypyr1htHuYI6y?=
 =?us-ascii?Q?0TzV0mXF4g0d+6WHOqCLnlaaRk4tj4mu7nWUcoUcgi5Bzzb23SmELXGv1Mrl?=
 =?us-ascii?Q?Q1S/3v7D2JQWkmL0UJ6ARKKBkQubzYkQ4dCERJa5jbIdAq10OC3lwlYwdwbL?=
 =?us-ascii?Q?YOkIqpPxIiT87sovqxQZQuMD4gGEUoDVxEon0TKh3YgpBlIL6YdTBBTCnl9Q?=
 =?us-ascii?Q?1PHgvXpaoUC6GPOS0GRapeVUM/9672gZf6btVExywzuQauqvnyVvouvgeooq?=
 =?us-ascii?Q?KRpGa+l39nlBGqdGBbGpQFvoIVvCT8pht7RAQCJc0Sg2cRbtaHrRwnT5vptD?=
 =?us-ascii?Q?7YNNQkpQayxJ/QU4M7Rtrup37Xwn+vy3kyNJyc33yjdJMS/TaPXQY3axCL++?=
 =?us-ascii?Q?YBEdQgteFMwNOZkSosbQ7Pihgm3oaKqECKZampcFTN9EF6ojoVheBMie8juF?=
 =?us-ascii?Q?PfqgwXWiknrgH+7CbpWlr9o0gCyx4M9FeKkon829QrS0m3mzHZDR7RhTgjsP?=
 =?us-ascii?Q?120XfVxphuruFQEVJhOvxO9AZ0YEl/GyUcaYByDB2U2pgoH8wpQVwb2vJ8WB?=
 =?us-ascii?Q?J4wN/S5bSwF+DSelhy+8o9rwzPv7AG5F7a5BaXmsAK1A6JyzO41mCpGmkHQ3?=
 =?us-ascii?Q?EpIF4uTr4fH1PIM0Z4XGxse4HloJRYJx6s20XVysKjjBDNlnHo99+QK2UvAs?=
 =?us-ascii?Q?UT19A0X3Z5VVBehLF+7wScIuf0mr+MvSzN/+tzNDMdY57csIMtlpNNgpuf/D?=
 =?us-ascii?Q?V/SDEd4JsgPjkJkpPoNtT13bIHgdZF7i/E1qRWr6wjrhz/4Pi+/d829VtaBS?=
 =?us-ascii?Q?I4/fOI+SnrHV26IYT9S/2T7VMbAUvnnbxK8lrXWvNRX9pQMG2g0ej+THl1rO?=
 =?us-ascii?Q?3oza+N3YuvaQ7y+lQvTnWR3CXju+Mfz8kPEAF2g3KKgCbftYO/GOq/WMM1kD?=
 =?us-ascii?Q?f6ZGQGJcu0zpno9dFCc18B1BSJJnA2CR8VYxC/uQd3Axliel64zz6YrUgFBV?=
 =?us-ascii?Q?pSNjAfBN5gmD+gSoqFXV7rtYaan+PnOrvarYbdnZikz9yGFnsblWCFg+mIO/?=
 =?us-ascii?Q?XUppG6TkkzCIqgwbXjUfSu/Pln/bvLI0DXpnjsEohW21NYcQUFR+VkrS9Bna?=
 =?us-ascii?Q?j3yD5Na0eV672Z2sGyFF8/FQcNw+Gl2A/amdmzxcZbx1N8roXx53GN/MdwVd?=
 =?us-ascii?Q?Q8XZ8HDYeZUNN5CEqSPrTHGoQGYXrTXljLbIa5TbDiQkXEsMLtamdaIqdSdW?=
 =?us-ascii?Q?iS+rjbVpIUe3IbFEJNzV6gX/aQdryYLVl5PCSfw52NiOeLKO55wuE7KcGwsO?=
 =?us-ascii?Q?18SJDjj6XemeWDEFO8x+H1Eom36W+lscdU0wsrzotsa60jkBy0zJ4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5WY4QQKx3JXYUYIgIFE3A09F6Ho/B2FWsKKVeXd4ioTQG4gEvc9foaOVBAnf?=
 =?us-ascii?Q?7avpikB7mf2wpMJjrG+K5JO7hgz7eFq5W34jQEAvyfdNVe74yF5pU3xerEbR?=
 =?us-ascii?Q?gdw8VPff9UfAOzLGaCppWEZHagpo3RoauvRGbdu6jWhiWugOaQaic21G9OZR?=
 =?us-ascii?Q?k1EEq4HT9xbxd1VTkdwhkOFpwTEMXw1eQbxaY7aKmLQxum0IkNq2CYRPgFYv?=
 =?us-ascii?Q?yFVJulS/CCIw8bVrX4+s6tyOgtlutdIJOa56wvR8YqGfHeCBGZcxVByqdXfY?=
 =?us-ascii?Q?Lum+0xRfju+kHzppptIVLS/CIo1uKogVd+zm/7E4FJFqKmS4v3wBXzZsZuW5?=
 =?us-ascii?Q?jPIVaAzLNhwTax08WVxhnqcs4kQJYp8ydBNUGoA8Sj8GXEGc0744wzxHzYps?=
 =?us-ascii?Q?NaB5ADWDJhVfwPZsGiVQ13Pm+6MICM9u+I9QKnZjWcru80BAR1sLUfTUJLzZ?=
 =?us-ascii?Q?Aj87vkKNAKVphrZqLgQQxf2YWR6f2QKBmU+loO8IIYZ89KmiKiNGNlNQCzJg?=
 =?us-ascii?Q?P/fNzEpIw+PthwZ/MFIZXw98ViB+c8KOPqYb+eEfBc/RBRl/LS7YGCoEQYt1?=
 =?us-ascii?Q?iBl3ctywlAo9khrQQMPNAZ9AEg7CNHzU5DGPkeffBIQMGVR0Ux3n5U77oEuu?=
 =?us-ascii?Q?2IwJ744tUUTHWwfyIX2q6ydhU111iFotVeDbBFQQovKs5919+Nsoxl523Rup?=
 =?us-ascii?Q?FM3nKSHoT7naot+m4J8FPvm8+9j6iqopbtvxOrcwxTIgiWy1rmcx5zroSSuO?=
 =?us-ascii?Q?yKKHZMa7ya+UoNeXS01WOGBLyCqNibMJyfFtu5zOZig0bI63msllVcRKS8pI?=
 =?us-ascii?Q?QGGTRi1zoDi/RLHZhvLW2lrjzU3GTihIQhnhLoF6fz0nC9zTW16SQhnF8Mdi?=
 =?us-ascii?Q?NFZTM8gF2Lc3mU5G727pZ5ylAkMnbj6xTQxxqbtvmc2KqOiZEtgPX4CmU0cp?=
 =?us-ascii?Q?EALV+6U9zpMIone43k67e7icbDbIUdNyAxCtjsQnd86AkmBJQMIUDoP1MtAt?=
 =?us-ascii?Q?ECbElQ+WwDsqsclk198rb46nClbh87KGi1MDdjldFubKXASHj+GxuQY2vLZs?=
 =?us-ascii?Q?hsm5LeJsiwQ/L7n0XZHba61rh4i8Qz9v6QyjBHWwrPmHJrOcwqLptoV2dT1N?=
 =?us-ascii?Q?RQA2u7evAjaa4hj7NVxjNDMVXbP36UPEGJ/9af/NJMy5CP3aHp+saihTUp99?=
 =?us-ascii?Q?SUmk6VTAxexQ5e2z5r0ilKfHrj/Vlj1hBfgFzc9xrsymbXmoPr5naZfVxNGi?=
 =?us-ascii?Q?usFJm0mBrwA8O1mo18+UlzMe+DGIocX7dk3DiMa/rGx/WdkUCF5vRB1DimyK?=
 =?us-ascii?Q?R9rBSiRm4x0KWVqutI6scISEoqsqpzxAHF8zbVWt7eRdK8MW3ByuQDjUZ4Go?=
 =?us-ascii?Q?g2XxjNTmAV0HH9Q7S2QHkUspuDBDSEQTpiaYApS9FDCdvcA/cc2fMChGANx4?=
 =?us-ascii?Q?r+Ti3gO+V0zOXz7Waz6a/599fLNuFbu6OIjp1bbmITV2/FMmLnwH02Hbd6wo?=
 =?us-ascii?Q?YoLUvErnkT+A8m5PhdWapeEC51FSbYVd6s/hYLWn/Gdqv5PdykFHTeFH4mqZ?=
 =?us-ascii?Q?uzKe2uXzyEMMyqjb/KEEAKT/4vABPHkxnExfzqN1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7602a17c-d497-4acf-a1d0-08ddadda74e9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:33.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrpDRrXxJ4Oh3kJWnpEee7G1rodkL8lLX30dEyq2vjyap5lp0237K21oNyhnCs4wuf1iJU0Z6KbnwzXEETz8XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6714

When sched_ext is rapidly disabled/enabled (the reload_loop selftest),
the following crash is observed. This happens because the timer handler
could not be cancelled and still fires even though the dl_server
bandwidth may have been removed via dl_server_remove_params().
hrtimer_try_to_cancel() does not guarantee timer cancellation. This
results in a NULL pointer dereference as 'p' is bogus for a dl_se.

I think this happens because the timer may be about to run, but its
softirq has not executed yet. Because of that hrtimer_try_to_cancel()
cannot prevent the timer from being canceled, however dl_server is still
set to 0 by dl_server_apply_params(). When the timer handler eventually
runs, it crashes.

[   24.771835] BUG: kernel NULL pointer dereference, address: 000000000000006c
[   24.772097] #PF: supervisor read access in kernel mode
[   24.772248] #PF: error_code(0x0000) - not-present page
[   24.772404] PGD 0 P4D 0
[   24.772499] Oops: Oops: 0000 [#1] SMP PTI
[   24.772614] CPU: 9 UID: 0 PID: 0 Comm: swapper/9 [..] #74 PREEMPT(voluntary)
[   24.772932] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), [...]
[   24.773149] Sched_ext: maximal (disabling)
[   24.773944] RSP: 0018:ffffb162c0348ee0 EFLAGS: 00010046
[   24.774100] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88d4412f1800
[   24.774302] RDX: 0000000000000001 RSI: 0000000000000010 RDI: ffffffffac939240
[   24.774498] RBP: ffff88d47e65b940 R08: 0000000000000010 R09: 00000008bad3370a
[   24.774742] R10: 0000000000000000 R11: ffffffffa9f159d0 R12: ffff88d47e65b900
[   24.774962] R13: ffff88d47e65b960 R14: ffff88d47e66a340 R15: ffff88d47e66aed0
[   24.775182] FS:  0000000000000000(0000) GS:ffff88d4d1d56000(0000) knlGS:[...]
[   24.775392] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   24.775579] CR2: 000000000000006c CR3: 0000000002bb0003 CR4: 0000000000770ef0
[   24.775810] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   24.776023] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   24.776225] PKRU: 55555554
[   24.776292] Call Trace:
[   24.776373]  <IRQ>
[   24.776453]  ? __pfx_inactive_task_timer+0x10/0x10
[   24.776591]  __hrtimer_run_queues+0xf1/0x270
[   24.776744]  hrtimer_interrupt+0xfa/0x220
[   24.776847]  __sysvec_apic_timer_interrupt+0x4d/0x190
[   24.776988]  sysvec_apic_timer_interrupt+0x69/0x80
[   24.777132]  </IRQ>
[   24.777194]  <TASK>
[   24.777256]  asm_sysvec_apic_timer_interrupt+0x1a/0x20

Fix, by also checking the DL server's has_task pointer which only exists
for server tasks. This fixes the crash.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 50d938856b3d..f7ca022463dc 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1820,7 +1820,13 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 	struct rq_flags rf;
 	struct rq *rq;
 
-	if (!dl_server(dl_se)) {
+	/*
+	 * It is possible that after dl_server_apply_params(), the dl_se->dl_server == 0,
+	 * but the inactive timer is still queued and could not get canceled. Double check
+	 * by looking at ->server_has_tasks to make sure we're dealing with a non-server
+	 * here. Otherwise p may be bogus and we'll crash.
+	 */
+	if (!dl_server(dl_se) && !dl_se->server_has_tasks) {
 		p = dl_task_of(dl_se);
 		rq = task_rq_lock(p, &rf);
 	} else {
@@ -1831,7 +1837,7 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 	sched_clock_tick();
 	update_rq_clock(rq);
 
-	if (dl_server(dl_se))
+	if (dl_server(dl_se) || dl_se->server_has_tasks)
 		goto no_task;
 
 	if (!dl_task(p) || READ_ONCE(p->__state) == TASK_DEAD) {
@@ -1859,7 +1865,7 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 	dl_se->dl_non_contending = 0;
 unlock:
 
-	if (!dl_server(dl_se)) {
+	if (!dl_server(dl_se) && !dl_se->server_has_tasks) {
 		task_rq_unlock(rq, p, &rf);
 		put_task_struct(p);
 	} else {
-- 
2.43.0

