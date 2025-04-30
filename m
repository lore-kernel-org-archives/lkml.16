Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E6219A8C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002438; cv=fail; b=VfUwx1yWDVRLUdeCjNInu/QMN/JCqf3JjouKEgQrojxHYBHkriI2P43AK6VOEzyFRYrhmNcsaisRwlXL2F5PQ1qRelp7wqB/VV63fTpNK9s3KZm3dwmeI52s7tWdy4rvK3w2oHemF1tN7WZURtW4QForHXCcZkvGf7wb8xj6Eqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002438; c=relaxed/simple;
	bh=gdvArZKNBIbiQwexYYmijKhJgtgZenQRGtIRVpWk3Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tDmba0m//QAjAA/PmTSeFnICMy1NSjywavXPgNqXVd/bZIEVw42Is0CeQ3KZLVTfBjiXXWLhPkgcSuUK5nspMqFfvmOSgWAWhYUWoYtP+bzcS551XOK66NAV9sLIDzlT7J4eVUKIh5xKH+gYRS4gt1OOQCatUPP3UDT6Ako9lGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tDWWlEr0; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tDWWlEr0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqr79AUArUsna1Ppdgd3Gv9gSNybr5gm/FQPmTtgk3J0LnFxWnUERPBCdWzjUp0H1ybePtPd4UlzOdZyT3amuLe9AON0JYJBaIF0sZuoSkgXu4jdjKeqhqOkfO+MQ/fO+s+CgrGDBQidu28c+lFhrGd8GqH3OQA3nh4rYZI8YD5ZH/Ir8pjpU/a7H+ptooAdAe1tu/WetbhHzvnbVuZGnwZ7237SI1YQ7M1lqM2Ww3AA38ykMvAK1QXQUSMFxVlBJV1gQ8kQZ4P7963Bc9hJOA6yTDMRsI/RiIcbyqE0Mliqc7XETj1rtKnzPEt9uPAV02tJi0szn54IGG5bUf3SAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXRtfivEv/wtkzP9L6V3H6P9i7Uo+sXcED3AlYKLwbw=;
 b=p2HL9o7Z2eey62RT1QRXEkAPzcJaUmMBQL6HjtzRlsXlPHJS/bWt5DI8owdmitb7TmjGHMTYQVPwCYGTu41UPZmfGuCXnPZmjKTEZfVzPopRujd+Isi9yzn4+7Bp7Tb8wykAY6J67/Doo1mm3R64vcVRlMH64Lpz8pPOIwLtFoXIm9Hd/vUGgGlFaJoSHvcBiAmX0U9a4/GuwDK7UMf2clld3G2daXJOlleKow0vnm1JTLOKbongcGGnUGL6UvvSJuHC1IgCLXc0Ko+44rqivGeBo8JCnuX8+Toz0N+Pgq/aPWdeAjuXvM8fKPA0Ra0U5yqINogiSJQ77LJrhCbHVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXRtfivEv/wtkzP9L6V3H6P9i7Uo+sXcED3AlYKLwbw=;
 b=tDWWlEr0XBUtGjsXtdZE/DG7hFGuAhroGyfG8IEjPUzxhRqOA9xRTCTFYGFKcLuO/mEERjzA1ln+j4SL1ehBTtCXRgIeap6V7FuDlNGBoEqtF5obqMhQZe2Uj228bL4DLVD1m4S7V3vk+Kt/CifXBc8nnkrBOHBYHcXU/ik7H6u86fCBeY79K/kaIu3BGaJab6bzHNxRFC/tsYGuCymJkatCXB8FDBjRCAfr5/hDNrWTWpSOQSc/jy1tgmKtrnDS8YBkG83zKie7W8V+R97TZZ8o3pAYqnsUhzXm21pZy8mjDH+4N8UetwHMcslBAfLoF722yj+ECn0kuf5re6pL/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 08:40:32 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 08:40:32 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.16] sched_ext: Avoid NULL scx_root deref in __scx_exit()
Date: Wed, 30 Apr 2025 10:40:21 +0200
Message-ID: <20250430084021.348347-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0001.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::14) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c6c7e8-1fd8-442f-abac-08dd87c2ab0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BNsLj1/UpBpccmRYRWF24zv1KyC7bsU/1WCY5pzLamkXx3oU5tD4AGQxavuS?=
 =?us-ascii?Q?9q/iRlwoDdUoP/2LM6RCFdaux5U6RBFduUdYFUOveJQ5KHZG0tLC0s9Z1L8Z?=
 =?us-ascii?Q?AVpR1Js11WPyrN/NFcZ2iUWZWFLnV6822+WdfrjK8E7KSxXGS4Oe1xDZ0cAS?=
 =?us-ascii?Q?PGvOl2pSKmPZOjfsxqch11UdCQErB38MCiSUDND7e7ATwKhBPxmBa68MfGSc?=
 =?us-ascii?Q?F8GrjTY6s/vE2mNsv4dS8j/54GIXLI3xHDED7UcePpYeCeiuqm5SwRKRbS2y?=
 =?us-ascii?Q?m4g1kW0mq5COWC9avJp1jkyM2Hwc2THArQ0t2GbGPm5YSwY/wuIxUwL682qI?=
 =?us-ascii?Q?r0lmdV4WvIQ99hh03xn+9tTQOYNkMTVmhM7euyIrdfkgbFogg1xBfGGNmuGO?=
 =?us-ascii?Q?uh8Z6Q0WFYgx/OyV01c1uvYWP4j0yp4UrBjg/BbnbOsWTWarh4/DrU2eNS8Y?=
 =?us-ascii?Q?ucjayJVE/XuBfLOSRQ2lcKQoT4uGx+MIUEZUih38RHU34VTVZraUsFIbmphh?=
 =?us-ascii?Q?yDXSgbSgQHASgsG5WHOrkQKtxcPVYNJuTT0Rrkr3me+YmCrTERaw8KuryxWt?=
 =?us-ascii?Q?dmx1Ho6LEk0w3YWgipkv44CgyCOV/DCd8OiQsQrFUZGVT0dBJ9R/Tys0msLp?=
 =?us-ascii?Q?Rtt8PYHZrhj0e4s+CvWWOtcGwcrtpaSydYWvhMRZVYsAsVVdNTW+nCc7KiH4?=
 =?us-ascii?Q?Gp3EogUruXJaqF/tGhk/2tyrpwQA29nEG5BvvvZ9vN78blzd7DXwQOv/Aujy?=
 =?us-ascii?Q?6q2UDgsjSMdNF8TbfzlMe0fH0UztQLIvyRKyBefTeA/VMejAEYRvxFXbqo2r?=
 =?us-ascii?Q?j1gBa/Z7pIhJhreZjym3uthLghYISIEqlXLb7gLynvbJu9cvYuRLcKXvk1zM?=
 =?us-ascii?Q?R/yQl6BlJTSlu0HsU80S/xSSMoP4baxS8OqJArbKhN820eXhJA1etLVZihPM?=
 =?us-ascii?Q?6BR/H0lyJuYHLpXn7g8kxgG1CjKYz/ZTwJ6KiWk19VLwn51mmDxOgxTogO76?=
 =?us-ascii?Q?eySoRpUUJlB+TwL5QEqW+/6TysQEqwYK2WnRef7o8A3sD81+6hiFTy/GBOg0?=
 =?us-ascii?Q?6HMFe9WayriOMKy69a3vPALhO05LsJpdcuAr9f7K+YkapWhwJZ7lOK4PVTWI?=
 =?us-ascii?Q?vU4PGDLJ3V0NTXkmp0jLOXUECjm+CYG2ill1uTUPbQFBCUmyQHFAlWkKjMKG?=
 =?us-ascii?Q?NLOe1dJu4HXUtwL9fq5RJs9Hdt8cZUrU2OK7MpR9CtMBmByDPjCCSvhhUb5R?=
 =?us-ascii?Q?PnRJ5BbcKhx31Xz60CUvvusjBPn5wKOSpbg857uTJfJIClk8MAiLZj5k+V9T?=
 =?us-ascii?Q?AUASKK2BXSODBX8tVNhWDznXpYg+PjSApV2tBJlSEh5kz6lMFHuHmBsnTm/a?=
 =?us-ascii?Q?nZRyyE0VBk71opacHUgPdFbEZvO/fJZUoAwLDGhBV9eynPQX3ZN43CN8vLQM?=
 =?us-ascii?Q?v+8OMy+AYSw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ajJKPHbFkwbPTNtUeqIJsbClRJ5moZEC78rTZhn/t3gbVTq1ijq3JvCZeOH/?=
 =?us-ascii?Q?eg1OzjSjPepKAJ7I1tKxRMWnaXRFQBaklpbjzvScP0eywv7IRQ+UeARBpaTo?=
 =?us-ascii?Q?WNiO5GAdC6mKscr8Qg96+ea5/38clEgpbmlEEpUsPX2qk6zSwLpJbUm7NRgr?=
 =?us-ascii?Q?FGuZ/A4GbaGb3ZvRKLB9H3+gvwtK0sFhk3nIlsRA9UAGRGEtVLmNIlXjC/RM?=
 =?us-ascii?Q?VUCg0Av6NKaWX/9iclYn3s6xGvP+sX3kGtjhf/JvAojggG9hWGgoeaxR00YU?=
 =?us-ascii?Q?nYe8DrjDyGPYPOliyZb+Yhx3ticsStp00hrMJqL+bFyuBXzGA17qXg9OyMCl?=
 =?us-ascii?Q?2GvcTOWUEzDxmi5D0RafIQJ4eG3zTUmQwxUrFAAUv1/RcUrI3JWloha4Ac72?=
 =?us-ascii?Q?m5KcfyCGKpI5wpNeEAmw1Um3ZWL9jrAgZs2rRujerXcV1xrDo4w7jKR0V1ba?=
 =?us-ascii?Q?pD22NJfOTV1YmQGC3XzRkgbScODLRoO5ylz/CUbYKRxznV381+FY3R3DN5Ah?=
 =?us-ascii?Q?0EoxRhNW28Kslrmo1MwJ+F+Vs6aSGrNm/tH6liS6DhaH+CkcbFp/5tZIumbV?=
 =?us-ascii?Q?mlKGDTi/ydnXHgiwNsHXHUlYBT0hBeHRHhVf4Yez+YFJaKZhDFSUTGye1REv?=
 =?us-ascii?Q?/vcOHO2bVXoAoQKGhy8gxEDAFvjbFj7K7jNDjAch2atV5E9PNabNkoWoM8jm?=
 =?us-ascii?Q?JQw3IURxpAFiHJj0VtYJ14rjPKYnlnvz297RVd63nXzRETaiv6H4lAXNOu2G?=
 =?us-ascii?Q?ru2OYSjkL8wUQNHqQ1W8StUPI7UdxyRCR/75X8b+gvSayWGTIq2BJLVXS42z?=
 =?us-ascii?Q?2BAQL1h/0pUQafIrt5fMjkrrvjj8IQZWrJhxmUMldlx7cRxWmXdM+YL4Jcbd?=
 =?us-ascii?Q?FiE9WyIexOdFMFqOshBH+TmYYIV/MTIJo+k2BpSCVx0SCi9+cpXPlM7yAXO7?=
 =?us-ascii?Q?L8T8ifPbJvToihyZRmAXnGY0yMmWFzCyyBYxjnTu5M3hSDnvWaWh66hsvpHd?=
 =?us-ascii?Q?l2P/HslVrXhTMCq3m+N7uKFMVgE9pkyFhvmrCI1bXojXAdc0IXkRLBpbHYVg?=
 =?us-ascii?Q?kcl+DKNMjk2iPEDlINvaG7LTPJ6EfXY7r69nVW5ZmfMRMCEY2eS2vf6K9BNm?=
 =?us-ascii?Q?+jpKJLR6uaJ3rsCqynQuKBbaNYeHdmA/lZIXxx4I5y4icMGZbaUOPqKyXvD7?=
 =?us-ascii?Q?e4/l08AHwNnzuymx0+br5QfZjzvoT5ipbJgoDVE/6kgg4X8HKZbxf0lzPDVx?=
 =?us-ascii?Q?IJyaxrle1sYn3IrNDClNYqJiNITEIHcQWMvQP5fzJaGBGDFPnFG/7WwECMCD?=
 =?us-ascii?Q?Agz+rXfqRXzM1rnu3KEvQk5LZS5/yuRlKnA4D++mdiTAkwwRGNOT1/nAN74h?=
 =?us-ascii?Q?Ht2mLuevI9zTU9en4gfzp/MEzfOA4kB3hamBdgE/5KtGzTaFIpmXNuPR1Mgl?=
 =?us-ascii?Q?e4SRRGs1p8LRpIqczhg18Xa2mVD6RIGBBbUHo9nTlub+bWzgzRlKvKH37j+m?=
 =?us-ascii?Q?NXwkcPucw582M8qeEy+m/FNOe7STRK3EbtRoZgF4E0e173JftAZvUDe0SXIf?=
 =?us-ascii?Q?vhbpXYJuGvrcJjIs7PvOiIyn0hPL0+Ue+PWrTOK6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c6c7e8-1fd8-442f-abac-08dd87c2ab0d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 08:40:32.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AviE5hNrGNzbzzDoMBL4BWRcstKjIqFSj9CERtNRIy+P0ADqjW/USOYnOxlxLQH38zLCXpshy69vCtX/0Xol0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928

A sched_ext scheduler may trigger __scx_exit() from a BPF timer
callback, where scx_root may not be safely dereferenced.

This can lead to a NULL pointer dereference as shown below (triggered by
scx_tickless):

 BUG: kernel NULL pointer dereference, address: 0000000000000330
...
 CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.14.0-virtme #1 PREEMPT(full)
 RIP: 0010:__scx_exit+0x2b/0x190
...
 Call Trace:
  <IRQ>
  scx_bpf_get_idle_smtmask+0x59/0x80
  bpf_prog_8320d4217989178c_dispatch_all_cpus+0x35/0x1b6
...
  bpf_prog_97f847d871513f95_sched_timerfn+0x4c/0x264
  bpf_timer_cb+0x7a/0x140
  __hrtimer_run_queues+0x1f9/0x3a0
  hrtimer_run_softirq+0x8c/0xd0
  handle_softirqs+0xd3/0x3d0
  __irq_exit_rcu+0x9a/0xc0
  irq_exit_rcu+0xe/0x20

Fix this by checking for a valid scx_root and adding proper RCU
protection.

Fixes: 48e1267773866 ("sched_ext: Introduce scx_sched")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 66d21c7cdff7d..1ee5a0088b1a1 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5212,12 +5212,19 @@ static void scx_error_irq_workfn(struct irq_work *irq_work)
 static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 				      const char *fmt, ...)
 {
-	struct scx_exit_info *ei = scx_root->exit_info;
+	struct scx_sched *sch;
+	struct scx_exit_info *ei;
 	int none = SCX_EXIT_NONE;
 	va_list args;
 
-	if (!atomic_try_cmpxchg(&scx_root->exit_kind, &none, kind))
-		return;
+	rcu_read_lock();
+	sch = rcu_dereference(scx_root);
+	if (!sch)
+		goto out_unlock;
+	ei = sch->exit_info;
+
+	if (!atomic_try_cmpxchg(&sch->exit_kind, &none, kind))
+		goto out_unlock;
 
 	ei->exit_code = exit_code;
 #ifdef CONFIG_STACKTRACE
@@ -5235,7 +5242,9 @@ static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 	ei->kind = kind;
 	ei->reason = scx_exit_reason(ei->kind);
 
-	irq_work_queue(&scx_root->error_irq_work);
+	irq_work_queue(&sch->error_irq_work);
+out_unlock:
+	rcu_read_unlock();
 }
 
 static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
-- 
2.49.0

