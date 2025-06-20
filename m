Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216C228C9D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451598; cv=fail; b=UQbLHy3sWGQVrxZ9bGX3fiAS5RDrd3pxHQFLGdNeDYHnEhLhH8NonMI7z8cuGnKHxsl19kf/SZSet45e4Wl04b4HKPFag2oqq5sTC43kGXb/X+OrPPMdNjcKtqvskL3gN3SF5Lrx/m4M3hZsiAZXo3nQPwTUM+AUDp+GRezQ+Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451598; c=relaxed/simple;
	bh=lV0I3ZXFlxnXIwvKSyWMOuPxSeB/SBfMk6OH9ngVv1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mrx6FpBxmm1UvA3Gym4iJN+0quG+neuHUyXyR6GAjSUY0oVcpCPvwQ+oPLg2VkRofe4SE1dvIobdXazW9i69+wEBkMFufY+FyEAWtolJ3TxDepR/7MSd2iNl4y/SwCPTySSyfHjSHqwW87vMPnTaW4aexhmvLmrprbYpga4t6G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mzkKFiQ9; arc=fail smtp.client-ip=40.107.212.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mzkKFiQ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lf/dDslC7fgf3r4X3qxWeMcb/gC9mnufBvo15jcqkhGlHqJidCVGI8xDwbxOlI9iL9M5HXmUtmUZmfQOFeCzwoMwt3C9or2scxzgF/56voNNvxjFp402QSmbVAe/BraYp81b9+VZ8zAekA+P7FQfpSJ1V//zHW7OZDdi8aqLbpYmHZdORvqC9QY3TXQzJnbH2z1iSCAFvWChNo1zBc+akb5ZZRIF408zSgrVNUpJ0Oq6wF1loTaew2SSZsQ6+1FbH9flX5uDJ4xp8aE7GCBcSjIdc6XgbnLTGCa60rObPKQtuTp4ulFU2LVe0ohmHe3fzAoBiNMpEeLxequaKE0IJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/cMEur6cT4v3bbAwOPSxcOH2s52jYS64Du/TiqRPkE=;
 b=HBnHCUAaRD8m5xeRHkyc34W+QknOq8VzuBIgSbTpeljQ8o9ZG+EBlvDxWnihvURqVMOVS8YjkVab77002nQ2V9vYu+8z1YSP5ayeO2ZRW3n8ATqGuLwCwmPbOYifaxq3eNJXCZv8F8qjm3SIiqe6xihRRma6YEF8xTkPooPq+zsZi48DNKFugh3sbOU1uSP+HX/jZUZyrtM7fMFb9LuaomfBIvGhmkgOXHlMPzVY6FvfHxQjUTtIlKDFuytzLJtooR38vFcSALugJwGOvb8JHAC+wTfiwYEC/G+9HdMtQnMiG25FrZKLQ8GHhlfvJtsKMMvzrhx8BCNv30ZeIu10BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/cMEur6cT4v3bbAwOPSxcOH2s52jYS64Du/TiqRPkE=;
 b=mzkKFiQ9ysDAr2mcevGfNyWAMFHEgXKDm6ymGRy2GirrYQTTHZP+3TEMz/paZENVv15fnujMbQKs+/4jiLImAF2TN2buy3eA4aLlnEGEqcb6TtYnvSXDyhYzT1JhZgNRhJX/kiJffJMzgbusC1TqRg/hYJLu4GGJjcKQO2+xe/K1xt/EI6ft740SCUb7LVFtUEJhJZxq2TKU4v1QRD+ZHMHMOr12CODliXQw/K4UmpzxyLNEO7zlKkzlVG+sJwSGaKO6egRa1dF55F9+gKqQ3TrlFg25W0RWE7ou4VR1BtuICtt8TWoTbOXTpASrzBCTp0KK9iuWGF7Eaw7m2Qt0ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 20 Jun
 2025 20:33:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:33:07 +0000
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
Subject: [PATCH v5 13/14] sched/deadline: Fix DL server crash in inactive_timer callback
Date: Fri, 20 Jun 2025 16:32:28 -0400
Message-ID: <20250620203234.3349930-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0927.namprd03.prod.outlook.com
 (2603:10b6:408:107::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: a81187ec-6d7f-472f-da99-08ddb039aa50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rSLxiIrLeKmQcmEGdORmPhiyC4qNAumRKg7mjSbFg2/zOKFcrsR8ZTuY3PmN?=
 =?us-ascii?Q?k6XoKGtyP7r9QvoqxjOuvbaqdnWlq+ZLOiIQuSyojzSxZD01HwzgxpFAccQJ?=
 =?us-ascii?Q?082aFF4lBLFyQ/B7Z85jnF2+9msRZfCZDIzFgeEvTcyvEgu7nqerXmJU0Ri0?=
 =?us-ascii?Q?zwx4iKVk8b1UYkaEe9y+Db2YlI8jIrIp45b2FE5yreWAiQxeNCcJpTF+ogXb?=
 =?us-ascii?Q?+PeM+C9vXTgXveIh99KTn47oTZprZPM+Sx430ljPwMvh9xvLLrM6KWg2uvF5?=
 =?us-ascii?Q?1pq7JaW4p5zRLWzCMWH+n039RqXLIEIUWDXcd6DP1DWpzasrLTrF9G3JUHW8?=
 =?us-ascii?Q?qBWioRnALNioZam69vcNALGi/zPXpL+0nm8pCG7AGB0ibUQgyu/t2PT8A7pR?=
 =?us-ascii?Q?GcDDnptTFxLu/UKDTi9vtB6u+EXttv/ZNx+MJZQ7SC6cGF0VlxIjVEY/oslH?=
 =?us-ascii?Q?TfCdhphvAkx4BpyoCRqJpKwACpsATUkZIUA/iC1d1NfJuFTC31/hSuXOVUWk?=
 =?us-ascii?Q?geEc1DArlyC1euijdmTwEow49oSpWk//ViP/Zfhq96J7N2ZuT5yEGjK4Y43J?=
 =?us-ascii?Q?JLIdKGKUlO/v7k+ToapJpaWU+Kl8HeN3SPbq/yagSyA9wkZCMkq01aiILeI9?=
 =?us-ascii?Q?0tqURkFrHIFm64342KGR/OcMR0S8hCzIsxXbTPsZMOIW5kwzklfLus/ErmmB?=
 =?us-ascii?Q?ee7E5oyCHy1Owjs8oB/IB735DfuGreE6aZNsecOQT01n1/vF33zOf1bs50Vq?=
 =?us-ascii?Q?ybrDcvlCrAWhe44hfa+Nnan50n4LVOGyjhWSFniVVC5FziBYYQTCVGCTV7Fq?=
 =?us-ascii?Q?TDULNc5c9qqh6PZsPSRuONWpCGP0uCuEWTY5iG66gp1uA3u3CFLuPDUX62Je?=
 =?us-ascii?Q?IVQa6BK99S0vHsMvfT5o0p9v9A1wHtYxzSiZj5HGLMWnMMxX4RCQbzrNhwFe?=
 =?us-ascii?Q?ck+aJ3DYAHbYej0KUnYP4zoph1FtTG8KCtM96+Dw+4VCuFwOpxWSwuYIxm3t?=
 =?us-ascii?Q?8aDfL6eAu3aq18JODgy7SPG9XgRx0QY7iYcYGVpE7ODJ+w5FPBOVJKDNfpCi?=
 =?us-ascii?Q?0GfuV0GOo/TjD57zU+jWM8CDIdPu0kZWX6/SW6z3rV2m1UiGnVSL5Y7iXsdQ?=
 =?us-ascii?Q?8C4cmkM157wESEzVUukBjYn1600aQqYmAqn5Xg2RIIXAoT0HKUMmiWd0IjRv?=
 =?us-ascii?Q?nuIAxzzw2MyM6ZK91YeeAunLxYydlCxbUAinnYqcKif/Vr0zVH32KIYuSEDN?=
 =?us-ascii?Q?PbrrGuq+/N/vcdGnUq1Oy/vIug0iAox5eJR1YPZ4I6EXmhKgZrjRltCQawFg?=
 =?us-ascii?Q?WzV0U+aFbfWYP/PzLPtSkMsk6vCUWI34xROvdAT0hAFiciC9r75SKnp4eC+L?=
 =?us-ascii?Q?kJSE/FN0J830N3E11++ymMa8gvCOWe+aR6WIoXeph47p2RgCWzdRX3VW6mvf?=
 =?us-ascii?Q?lzfq3500wbrtXopONfdZBPugZpFTAIHiWpOvKJTgTFFNWLz8dxmvmA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzKmBJqUK/I4Bu+w55sz48Ypmalcw3rhIj0uUZoiagGLgcztVZ28qmeMVCcz?=
 =?us-ascii?Q?qRAfijpA/nsl4i4qQXoviWnIkhDxmaM3OXjn0DYmIFSnaWG/x2d4u0Q+AhCS?=
 =?us-ascii?Q?ixA9xUaQJzuDFh+zN+/OZhP+lDExEZy8ZD/HDAMHGLCpDhayisHxqZyimkYx?=
 =?us-ascii?Q?E+BY4PLgeqv0JJ4uEhEynRyvdmDSe6MHRwgPcdkUk/c9cGX6i4pBxJVzaBZI?=
 =?us-ascii?Q?0rCSsDFA8l93L8WSzlMy3+xsz/oTlflGSXZ2IdEIUWUNEiaRcA8myNHIHI7J?=
 =?us-ascii?Q?vffAZRUXVvFGyvtOQ7x594URO3IN73O10KumJOPK+te2n1gxg47+W78O2bGf?=
 =?us-ascii?Q?/apUgF0DEn+X3G9YnM+fGFsBRhJvWkPXCL4J0UiLM/AVmAMZMWP4owNaRlqZ?=
 =?us-ascii?Q?3eCFrS4pvNFRXAj+6wnbGiQZlunV/dVNZBuxqdkLA0S5i2A/ipzaM2eEEjH2?=
 =?us-ascii?Q?HxIn4qeB3EiGbTHbJh3CkNeD8+Qu+jGRbx7hzWb8blqrIBbDCdJMLjuMVxEp?=
 =?us-ascii?Q?Axv12zwncK1loiub4Ca5bY9M4m6Bqc2x9Tg2cjbvurlxmHTPk2WqDNQX6qsU?=
 =?us-ascii?Q?oQJhmNgQc+0lG8VDo4orwgPicsT9kfKENrVx9Mt+MbYhZH1DnS8B8KBrW4MO?=
 =?us-ascii?Q?6w4DtOOdYJZwbR4IP3zcI33REjrXHJ/OfWHkwTHrq0742LP+KyReBvHFvrz/?=
 =?us-ascii?Q?TuW3CkVvfJn7FztSnUGcRrH5dyyoQPilo25vsBU0vhTblEfG/7VjCyqBZN2M?=
 =?us-ascii?Q?VRzTYFu49IrHziCeK1YCnCrIihqXoloGP+1NJOzi5CQvhpTMyjoojGcwOrdl?=
 =?us-ascii?Q?WPz2uXDI8KQLcr0xs34KuyS+EWYIR2ll0qQmMP/1qYkP4tauBj/owxGtv16B?=
 =?us-ascii?Q?rBCyjLDM+lQTLkzsKXvNqqXt7+XAAmKFw4zVJkxP3od5ONqlHc4KeveYvxEj?=
 =?us-ascii?Q?Yc4rqJ4gt2UFDepqfAUdzd0OUxPcjUB4nETdIavukToTqNhYdh++EIOj44zH?=
 =?us-ascii?Q?HPuvVhsLDuGeyNqPOitNAcTNHBrJe2mwMgowt7SQsCRNvtmftsuZpmLWRN+L?=
 =?us-ascii?Q?C0dzdbH82HEIvYc821SeUXEQ/jse2PDMZK5UElKVMFJajndxMEwKVU/hhUO8?=
 =?us-ascii?Q?3907+pEwQHY3Mz5GfIJ3BL7Ds4hcoyxUAs8pZmG/4E4siwvj3eRWG1QkPcAv?=
 =?us-ascii?Q?xY60eD90QPUB7XRgVVNq9b9QjTrJcWkXfyuo8FYEOP3EPsU87BJCSynolJ8c?=
 =?us-ascii?Q?RPjnQyjxv5GCk/rXD00kf++2UUPKW6n1z1TcwkeTxH3zLRkeNVN4fdVKPatv?=
 =?us-ascii?Q?lt4nuXPNMSCm3anzHJayIPl7VHSsirSDl6jF7oAkHhZRBckDDg3Ash93SGXu?=
 =?us-ascii?Q?zyW2eqz3nMJmDdP3fSB1LZpptGItenS8mfgtuxY3Pdww1D+OVyzM9/y+BSs2?=
 =?us-ascii?Q?c+RC65hVfUrNcyQbbfed7jpae69K+XkkS2B3Lt5YQwKAXaMsUMXrpxaAabzf?=
 =?us-ascii?Q?0J5HTqVhoqfNTMwe3imrxkB/5BnGs1bHKILBoeR0rQlnj6nGoz3BxVXur9r1?=
 =?us-ascii?Q?SZYlhl9j/mJbCppmhkFXjrVGy32jPQPK6f6rkiFD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81187ec-6d7f-472f-da99-08ddb039aa50
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:33:07.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6teQNnFaSC/LvomNeV8DokKMeFN6fASzkw6SOnyqosxOMkZA3VYPJiKnxXe7RcUjIECmwj4oJ7zOpCb0ZFXgXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407

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

