Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25336298CC6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336678; cv=fail; b=e3m3TjQ3LKLEd0L6IqfA5G9PQfabivWVnkxZhdY+9UAQCzAxRsKQWNiJmNhXluQT2T+EOONEG1cbSkM4cGDsHLUHQGLwBD9feIHQ2r5AeTATHMoEQpzHHN+9PK5Hlvbsc31c6vqdMpRw5o+KIVXjWvzKtSzAgsxHSfJfLl5Hco8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336678; c=relaxed/simple;
	bh=TjTxXZyhpGh7QYWwLboVUskKRfo7DDH2FrkNMaRPkcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MFGF66W64tJFWup43b682ANhca0cf4fzRQcB6Uy/9FXT26mdwjNqEVA9Fhv07jLnNoMWd4b7Xwku7mw3Z+RUJCE/Fnzc9r0VTtGWbPORH/owBOE/eScXVHsJN/MIXI+yJgR15Fp/T7I+aHOXpoXHR+9TcTR+0aGAsEGQgATpvFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cb0gqYnZ; arc=fail smtp.client-ip=40.107.92.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cb0gqYnZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnTTLPmofGh1A5Cmj7qNskwfrFD8Apt5XXCpu57xv3zNTSbaJPO+96c/DK75azCT1OABZuac1yK/DCAU6O5UNI24qWozIJ7ZDlVa3iXUKJgHfLu3MaM3gWT65MToSGbBS6GgHeoU4cBUaLh9nMOASkfzQcHMMAXn0jTX4jkTHSNlA3ctZVswhimXmTau2L0LwAdKK0NMtlieXrZm66F4OTPNs6iscQWFvDZGYzCVNkUvmYqymoGVK8wIK3/WaJx7n9QIienehckloA4AO+9ShwhZvHBMFXf9/BP6YpuHUJm7kz8mM43c2OmEHS4rYvstYjAoGFtTmfaNWsMBijZA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91ViedIuzo4CJXRCL4mv9BynUobW+c2nZgp+6TsDjl4=;
 b=hJZrF1HE9ckhmxSgkoxvB4A0CynyG3+lGHiqT2rWSNMgKh/hihVNpbWgwVBu1e8NGDcJ9BUP8rsg8RAWqD38P9J5Fufvw09y7t6KEmC7yTMvXK/M4rcELSXFGnt+lZblxRHUZ2+mbRahEEmUKYX9TolAFCy/uWzMJqPcuzsA341OzW9HCX5lJGW7Nb5QPn5r4scIk/IhG17GC4Rb2oTRhU/WZeNyBsBXsLs6iGNGIZKsLBJxAMkXkiyu6TjYiaa5mdUlcuMYYRGuNxzg8QRM2Q5HDgRnd4NgMOVUjWNXPhRbW3QApFr4v7XPqlzdWghBqjS7rCnAkLEb4Nfiz9OtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91ViedIuzo4CJXRCL4mv9BynUobW+c2nZgp+6TsDjl4=;
 b=Cb0gqYnZvHFK+1oWRckOQQ5XifSZzrqt+xwUkDXlJxHHyFD8kKKZJ1F2Q03TUHWeC0rJuWnkAPIuyqEZdahhFUH4x8bG4PScBY864Lh63OpIan2rWo3QBPUjX8CEVZW6AXkTxmqqkOEKGqxjct0q+Io25RYlgs9qS9SMQQLTIB03WM56iLliG8gq9rtyzYzYE8gtsMrzY8Cy0tn9ZQbLwYGJgKIUs5P9Z69C5+oIDki2+BvXOxLitGdN7Y4WfTzSGhRofiSRS7nEbYUmHH+2iYNb7b0GNEgmbk6GpD0DGoKDfYHYmsuBZ28uTRm16dFI34aPGCHEnQ4g+Mp1D+IMMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 19:17:53 +0000
Received: from DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4]) by DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 19:17:53 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from unlocked context
Date: Thu, 15 May 2025 21:11:44 +0200
Message-ID: <20250515191716.327518-4-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515191716.327518-1-arighi@nvidia.com>
References: <20250515191716.327518-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To DS2PR12MB9615.namprd12.prod.outlook.com
 (2603:10b6:8:275::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9615:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f918964-4f74-4297-b9ac-08dd93e53091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4rLudWox3EudvO2xNwFAKXRBScne3ksUfu7qK9VLFwaGZNsHBNC3gU5UF5HK?=
 =?us-ascii?Q?Gcne7RgJi8H1P7MDkKLzZSX/rEDoYCz+ZjRkJyT73wFGgH4uZofbDkxCwDuz?=
 =?us-ascii?Q?wM0eN8M90taN63IT7804ERDA4x2zJWm3nf/HHw0eMpBzwDN3ZR+oSM4cTZ9S?=
 =?us-ascii?Q?FUOB1pqorBWE7Vj9TvPdmS68eGXVnMblWIJ2PU8gA1pM8DWXhW1rr/I6KhPn?=
 =?us-ascii?Q?PRb5ak8dsGIWXqlIRR3HYcWE/yCs9ThZdzRmjMHWyzGuA/b22aBH7d/+Xlcr?=
 =?us-ascii?Q?S453SwY3cE+B2sPFwTkcRzKnrJnddPrcub/wvskSleL9CgWtPOPl9R0a+LRK?=
 =?us-ascii?Q?7+S9NthiMililPTqc/n3OH9syJk68dAvb7xC0l6NaybpjsWACPBPtRu51k7o?=
 =?us-ascii?Q?LRSjIuJWrf9846Z/mJ/wsHd/CweAmKgqDv4r+reDDOOaqK8FZQpGpH82yZve?=
 =?us-ascii?Q?wBpP4JtamifjWt2tRJJpUCJ+W/QYCtiOveKt/5UvosC9xN01NdjkWVlAIm3E?=
 =?us-ascii?Q?SJ9rjtKJKZIaSvGmqdEZEkL63Zfh4DMwN2dAYIum02YRvYPRWTogNCjIeYCK?=
 =?us-ascii?Q?/eB4x+VK4FsDO87ppm8GlylJAaGBVXRMOu6YotqsPx8B0JApb83C4FrfsBZ0?=
 =?us-ascii?Q?PJuu8d1TTOhZKwbX7yl55NEccSE3cdD9yEnl902lTvBRg6jm4vXZEI2+Ae9/?=
 =?us-ascii?Q?W75/mreo6sYmjz08dvyE46MY99zg3S9ZhF7mdZUibEIACyU+TSnqV1xdQ4cD?=
 =?us-ascii?Q?gGpdOVgFi+TNlF7aySw0oHq1AR/LSvbQKKKnws48PCm25eQdeiL+IP1El0RM?=
 =?us-ascii?Q?w0nEGb7xPzyEzLmUWp/+rbsj4YO0i+oiMF6sTH+3RL9b/geL7TCgcjz4ymNp?=
 =?us-ascii?Q?qnALJ6Bwoqteq225G2V8XCkqpvMOpeeBoSUPnaEOQDho2mC8iu1IJM+f/sEQ?=
 =?us-ascii?Q?JzEMlbfuPzaLxeW8+F1HYDNBMTdm0nP7gB/enu7DNpbY4tuBstpodTvt6GSR?=
 =?us-ascii?Q?kEq6zpnshjUVEKcRyr/fAsZ7J9HB9oi23FKszcrFJP8+7inLvQsRqI9nINw4?=
 =?us-ascii?Q?75lDw3iQgx/M3YDORWExiZDov/Ow4e9mKVADPGhWhq8X9wh50sWAMvGS03kO?=
 =?us-ascii?Q?YmVwcVARq5QlBxUZ28HAwahmkdVe9pePQC7IT+rjfLCN/zfb+lp7FRBg4+Bz?=
 =?us-ascii?Q?KCvYC6YtR9BT466WTFnURZLzND/iIfYHOLDK2rtuArd9rbCp3R+s3gcs+wws?=
 =?us-ascii?Q?GB6G06ZorezCk8117aWVD8pEX71hDswHNX7dmZi5RuuhmO1AY4mGYddOmkTY?=
 =?us-ascii?Q?Br5LTGyZ+yvUa8Nk/NZ8wMwny90AXbQXONpsRZByB53B2KFVgBXcg9JxTVPr?=
 =?us-ascii?Q?mL0neur7YkUWqNAaA9HhABo5V3UUuAUxz5/9sE0bDxxQzKluwRdy1yO8Yjwn?=
 =?us-ascii?Q?BKRTK/ipQsY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9615.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?duVUlAGi9saZTw8XJe772TIp6vtnv/XvUOE/BCjDUx8/MU8yjgkCoNYiduP2?=
 =?us-ascii?Q?VHFhkYxQ13Q1jxXgaP78vF+fi0uFQjmFy4NRgBJxZD0IQp2jTPG2mQMKebtW?=
 =?us-ascii?Q?LRLx1QxjjKI/49wHy+6uA719EPouSU2A2641h1TIN6ZUFYFe7oEBNW2rOsHz?=
 =?us-ascii?Q?jIFywFhyo15HQxAlY7VkdZWH6fQtQEweqrHWKkWqcypXOijzY2lpCJw62jh3?=
 =?us-ascii?Q?ioWu2EFYiNdwLMokuPwf8MrYarAFghq3I+31YGsYW8K+lFUuSJZ2nABwvrzA?=
 =?us-ascii?Q?MGr4BS72pFFCsjgCv6s9uWG8TTD0nJWX4nqM9oS1qgTemNdxmHHEt46PDYr5?=
 =?us-ascii?Q?8bGlaaM8JfWzUmAf+leotyZZdsSQQovsB6EqDvfidf+agpWleJmGSJ8PkamA?=
 =?us-ascii?Q?AusrLcOK9jMpv59EN9WPNwlzsVrjZf/nWpB9L6co5e8BzInKc06c1pEudfD3?=
 =?us-ascii?Q?hOXTqxl9fd/5okd0xtv1WwlZeusRjULcG0cqf2ujBLwwoI67biCZnOQA43/n?=
 =?us-ascii?Q?/mDsZr58fKa66CdwFDGCBZSY+N0TbFa/KFKD4CxI6UU0483HyyfhD+s0VdIm?=
 =?us-ascii?Q?cNT+ELWiJJdZRtDojLrghxaQNcofAQbFA0J8qQUw8uWWS/WWRh3/sOZJw2c4?=
 =?us-ascii?Q?bU4A0jfzYgqICEaEmWcrEGaONHg8YR7InoOQuHRr1+c/Pcc16c/qwMS3dcg5?=
 =?us-ascii?Q?8vfyPvkqmOjQivK0/uo8qebmaUFpVoqFrPDp3WaOjGniRWCUOOwvh61W0FOw?=
 =?us-ascii?Q?1vSgIzJsdBxMvFhY7erVDZWSYUqbF9IDtuc7KqeEoHOrVvNYIpdebma2NjHg?=
 =?us-ascii?Q?OG7o+0tc02XgkJG9PZM3RcWTwti/7DmydJ71AXKAp5mvJyGbZv6oLuTrBI3+?=
 =?us-ascii?Q?WcmVUN2aRCXAEq0mAHIEPT0mWpvCcmmVQMd0w7fOBF/is5M9VtV6dl8YL8G3?=
 =?us-ascii?Q?6iO2pkn/W721/71Wbu5Qhyn0JZBAhykjs3s0Y44lfPnyuE/9iRXxf0djZCep?=
 =?us-ascii?Q?lcHnK7fmsr1mLe7scWMUpB36z1jgQfLqZk2U+2ScFhlMbsuBW8X6/Xs6cpsU?=
 =?us-ascii?Q?aiYeRjroI8gpzdLHTqBiGmEiJBx0dKXqFlk2+ORQO+RjF9fK0GrzxKWO19dj?=
 =?us-ascii?Q?jKm5uMLK7yQkE1DARo7OEKxnpM+rQJ3aXJCbdUulbRlJFhGgmvRDuPY6a6TW?=
 =?us-ascii?Q?7MVfbKeGesS3/lu6IRhkB1FAcKVYewoiTcUFQ6T+vEILKsw/O9oMB9CWnQxt?=
 =?us-ascii?Q?uTDKQt8NJmPc5o+GBRfHeqBIklRhZ4Y7IHK55kgau1ToMkjgaLDSe/35e3LN?=
 =?us-ascii?Q?9W1/PP7/1hsUKZ81dP7jWbaFIAFxBVLNtT/4ro6/MIsRnzxuBdgKfLPsO+dU?=
 =?us-ascii?Q?zgUoJepQ4dOJBDfa+kMt3fmyYJqmxHtnkxPEsiHty05hnih8rAAsxP52I4VD?=
 =?us-ascii?Q?RIxizT9mGflAOK5eRUARzjqpSfhB2UChlyahy4fMZUyNDHGv9Y4uQsPsmhP+?=
 =?us-ascii?Q?OafSvi113ijuOeHsqVfLjzCRii/hrZM106RmtJ9dd+8jqjxehCZ7Zi0lk2Xo?=
 =?us-ascii?Q?4beyNLGZVr8i4Z/PMOLj1nRIjORZqkVU5jhf8meZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f918964-4f74-4297-b9ac-08dd93e53091
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:17:52.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6f5+yI1mWfcUK9xJ9DUUQn7KKgWGS0vhI++5x7Ad97OV/X1oBHDHdVh6Li09qrHTjMGhdKXF+P9C/iA7RnAl8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

Allow scx_bpf_select_cpu_and() to be used from an unlocked context, in
addition to ops.enqueue() or ops.select_cpu().

This enables schedulers, including user-space ones, to implement a
consistent idle CPU selection policy and helps reduce code duplication.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 716863f1f8cee..37279a09900ca 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -922,9 +922,10 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
  * @cpus_allowed: cpumask of allowed CPUs
  * @flags: %SCX_PICK_IDLE* flags
  *
- * Can only be called from ops.select_cpu() or ops.enqueue() if the
- * built-in CPU selection is enabled: ops.update_idle() is missing or
- * %SCX_OPS_KEEP_BUILTIN_IDLE is set.
+ * Can be called from ops.select_cpu(), ops.enqueue(), or from an unlocked
+ * context such as a BPF test_run() call, as long as built-in CPU selection
+ * is enabled: ops.update_idle() is missing or %SCX_OPS_KEEP_BUILTIN_IDLE
+ * is set.
  *
  * @p, @prev_cpu and @wake_flags match ops.select_cpu().
  *
@@ -936,6 +937,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
 				       const struct cpumask *cpus_allowed, u64 flags)
 {
 	struct rq *rq;
+	struct rq_flags rf;
 	s32 cpu;
 
 	if (!kf_cpu_valid(prev_cpu, NULL))
@@ -944,15 +946,26 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
 	if (!check_builtin_idle_enabled())
 		return -EBUSY;
 
-	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
-		return -EPERM;
+	/*
+	 * If called from an unlocked context, acquire the task's rq lock,
+	 * so that we can safely access p->cpus_ptr and p->nr_cpus_allowed.
+	 *
+	 * Otherwise, allow to use this kfunc only from ops.select_cpu()
+	 * and ops.select_enqueue().
+	 */
+	if (scx_kf_allowed_if_unlocked()) {
+		rq = task_rq_lock(p, &rf);
+	} else {
+		if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
+			return -EPERM;
+		rq = scx_locked_rq();
+	}
 
 	/*
 	 * Validate locking correctness to access p->cpus_ptr and
 	 * p->nr_cpus_allowed: if we're holding an rq lock, we're safe;
 	 * otherwise, assert that p->pi_lock is held.
 	 */
-	rq = scx_locked_rq();
 	if (!rq)
 		lockdep_assert_held(&p->pi_lock);
 
@@ -966,13 +979,17 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
 	if (p->nr_cpus_allowed == 1) {
 		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
 		    scx_idle_test_and_clear_cpu(prev_cpu))
-			return prev_cpu;
-		return -EBUSY;
+			cpu = prev_cpu;
+		else
+			cpu = -EBUSY;
+	} else {
+		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
 	}
-	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
 #else
 	cpu = -EBUSY;
 #endif
+	if (scx_kf_allowed_if_unlocked())
+		task_rq_unlock(rq, p, &rf);
 
 	return cpu;
 }
@@ -1276,6 +1293,7 @@ BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu_node, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu_node, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu, KF_RCU)
+BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
 BTF_KFUNCS_END(scx_kfunc_ids_idle)
 
 static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
@@ -1285,7 +1303,6 @@ static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
 
 BTF_KFUNCS_START(scx_kfunc_ids_select_cpu)
 BTF_ID_FLAGS(func, scx_bpf_select_cpu_dfl, KF_RCU)
-BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
 BTF_KFUNCS_END(scx_kfunc_ids_select_cpu)
 
 static const struct btf_kfunc_id_set scx_kfunc_set_select_cpu = {
-- 
2.49.0

