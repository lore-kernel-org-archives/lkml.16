Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CDD25F98A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403796; cv=none; b=ZtRA0UuUq7PJ6P0D7fbPkMAeGCHYPTMrC3RMwVsMrpZ/wFobQgiNHCjUiIUsCv2xhPlFWDutNr2z4KBz0sskKlZsMpcNzRReVsPdJn/WFEG9jCNrsrceirRTcNP/JlQOvMDstUy//wiEsPRxmcx16kXkt4qMAxmx7Qhvp+K3hZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403796; c=relaxed/simple;
	bh=c64bBth7DuKMd0tuHaIsSQMe8SeCSsJT7nl/xVwrnvI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p7GpTurU8kwCHGqo2TbHwaql0fHYKV2SDteP+gRsR01p9AfdrCaBKaGmrkPRqOQuIkVnNaG39rxAxfIc51X7ENDyoxQInzi9T2C7CJ+zjHKEyZ6zLpdP9+zAMMjn9RLP6Mqi2eGYEhOs2ttX7SGmvcKQRQGohKeN48O2C5jKArc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L6vnifrP; arc=none smtp.client-ip=209.85.219.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L6vnifrP"
Received: by mail-qv1-f74.google.com with SMTP id 6a1803df08f44-6fb5664c771so92482946d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751403794; x=1752008594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJpGTxBsO+umc3+xW15nM1ahYzkZ2HQIDH2+Llq7OFI=;
        b=L6vnifrPsCT5gXIwTGCSTptqTsbUffgfB+88rt4e7Pj+HllO6lToLKD5cZ3pQTDFxg
         ED1Dq+J4QxgdVbwnArEo+vu33k2VPgLv30DOPKuWoWSPOgXNh21IGdtCuxPGvoOsTczu
         T0zvCST6TGwsxNMX+qLj+073oOLK5PLCzZUcJAHZgNHYOxcJNWszSdmOzYHbIWEY2Pal
         SNVjsLmI/y93kVe7YQNThhYpwFRbasgccQyTaQ3e2wwkezVsfPddwDtzPVMLAaZwBPcs
         ZISPthLgJxiZoR7lwBp7NSNj7JDdoXMSkAZ8yHyEFabptcnhCMlD53SDjwP0lnbqHczZ
         foFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403794; x=1752008594;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJpGTxBsO+umc3+xW15nM1ahYzkZ2HQIDH2+Llq7OFI=;
        b=hHOoBIBAUeCVf/izSYl9FDFS1jf/+CtqjbLtX5ohsFv73rYu70GRvF8VljcfyrmmAc
         pgV1JqfeaBcDfmbCctogV1ObOPvTFer43Kduz4ZhH1GPOaUxp19YGWl1JH0ZNnD/xZGL
         60s48rs7oYjEd/BIMl0U+bVeoMCqP3UOtPx4mYHrDAO95tDp5hJAAt6BqSW4VZvRrQXP
         YWo3V1kmhLnIs+DTZ0/Mc9pMFJJfeatlp4PtlVM2vgmoEfJJp9DKQJTNyBVa3xBP4cPF
         vgMcDO85CoVEDxhnoZ+XQ87rua/VtwNm9XCbwfsc90GtZVQGyom8TW+mCi66kcD377u7
         lS9g==
X-Forwarded-Encrypted: i=1; AJvYcCWOcbUFVwOgTGyrdIhk6q1nHEYbrbwyxBEQMkMHinzYVQ6bqD7Bckyv5EAvOlVs/pTn7KiCjgFE6k68G6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnwBY2BK4QRyPfCpUtLPz28XzL+8IdL/OMNT4o1vfSycUZsDmj
	TEzV6vVkivHZE1cxL3T+cbJMHjVpEVaWjnowGzQcc6uxw8l/ZuEvJn8p7dBBhSWYbADH7+2PdvG
	O+Ip1TKjAtQ==
X-Google-Smtp-Source: AGHT+IFYHGiKoWMTQPWJu1cYUAJEYD5fC6ARPNjql56/hKkxG01THc7fiPp2JcMaNHU5ASZmCvE1XXT2tzPP
X-Received: from qva4.prod.google.com ([2002:a05:6214:8004:b0:6fb:239:9d1])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:ad4:5cc5:0:b0:6fa:fd8b:54de
 with SMTP id 6a1803df08f44-702b1bef12amr795306d6.30.1751403793784; Tue, 01
 Jul 2025 14:03:13 -0700 (PDT)
Date: Tue,  1 Jul 2025 21:02:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250701210230.2985885-1-zecheng@google.com>
Subject: [PATCH v3 0/3] sched/fair: Optimize cfs_rq and sched_entity
 allocation for better data locality
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Namhyung Kim <namhyung@kernel.org>, 
	Josh Don <joshdon@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

This patch series improves CFS cache performance by allocating cfs_rq
and sched_entity together in the per-cpu allocator. It allows for
replacing the pointer arrays in task_group with a per-cpu offset.

v3:
- Rebased on top of 6.16-rc4.
- Minor wording and comment updates.

v2:
https://lore.kernel.org/lkml/20250609193834.2556866-1-zecheng@google.com/
- Allocate cfs_rq and sched_entity together for non-root task group
  instead of embedding sched_entity into cfs_rq to avoid increasing the
  size of struct rq based on the feedback from Peter Zijlstra.

v1:
https://lore.kernel.org/lkml/20250604195846.193159-1-zecheng@google.com/

Accessing cfs_rq and sched_entity instances incurs many cache misses.
This series of patches aims to reduce these cache misses. A struct
cfs_rq instance is per CPU and per task_group. Each task_group instance
(and the root runqueue) holds cfs_rq instances per CPU. Additionally,
there are corresponding struct sched_entity instances for each cfs_rq
instance (except the root). Currently, both cfs_rq and sched_entity
instances are allocated in NUMA-local memory using kzalloc_node, and
tg->cfs_rq and tg->se are arrays of pointers.

Original memory layout:

	tg->cfs_rq =3D kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
	tg->se =3D kcalloc(nr_cpu_ids, sizeof(se), GFP_KERNEL);

	+----+       +-----------------+
	| tg | ----> | cfs_rq pointers |
	+----+       +-----------------+
	                |     |     |
	                v     v     v
	            cfs_rq cfs_rq cfs_rq

	+----+       +--------------------+
	| tg | ----> | sched_entity ptrs  |
	+----+       +--------------------+
	                |     |     |
	                v     v     v
	                se    se    se

Layout after Optimization:

	+--------+      | CPU 0  |	| CPU 1  |	| CPU 2  |
	|   tg   |      | percpu |	| percpu |	| percpu |
	|        |         ...             ...             ...
	| percpu |  ->  | cfs_rq |	| cfs_rq |	| cfs_rq |
	| offset |      |   se   |	|   se   |	|   se   |
	+--------+      +--------+	+--------+	+--------+

The optimization includes two parts:

1) Co-allocate cfs_rq and sched_entity for non-root task groups.

- This benefits loading the sched_entity for the parent runqueue.
  Currently it incurs pointer chasing, i.e., cfs_rq->tg->se[cpu]. After
  co-locating, the sched_entity fields can be loaded with simple offset
  computations from cfs_rq.

2) Allocate the combined cfs_rq/se struct using percpu allocator.

- Accesses to cfs_rq instances in hot paths are mostly iterating through
  multiple task_groups for the same CPU. Therefore, the new percpu
  layout can reuse the base pointer, and they are more likely to reside
  in the CPU cache than the per-task_group pointer arrays.

- This optimization also reduces the memory needed for the array of
  pointers.

To measure the impact of the patch series, we construct a tree structure
hierarchy of cgroups, with =E2=80=9Cwidth=E2=80=9D and =E2=80=9Cdepth=E2=80=
=9D parameters controlling
the number of children per node and the depth of the tree. Each leaf
cgroup runs a schbench workload and gets an 80% quota of the total CPU
quota divided by number of leaf cgroups (in other words, the target CPU
load is set to 80%) to exercise the throttling functions. Bandwidth
control period is set to 10ms. We run the benchmark on Intel and AMD
machines; each machine has hundreds of threads.

Tests were conducted on 6.15.

| Kernel LLC Misses | depth 3 width 10    | depth 5 width 4     |
+-------------------+---------------------+---------------------+
| AMD-orig          | [2218.98, 2241.89]M | [2599.80, 2645.16]M |
| AMD-opt           | [1957.62, 1981.55]M | [2380.47, 2431.86]M |
| Change            | -11.69%             | -8.248%             |
| Intel-orig        | [1580.53, 1604.90]M | [2125.37, 2208.68]M |
| Intel-opt         | [1066.94, 1100.19]M | [1543.77, 1570.83]M |
| Change            | -31.96%             | -28.13%             |

There's also a 25% improvement on kernel IPC on the AMD system. On
Intel, the improvement is 3% despite a greater LLC miss reduction.

Other workloads without CPU share limits, while also running in a cgroup
hierarchy with O(1000) instances, show no obvious regression:

sysbench, hackbench - lower is better; ebizzy - higher is better.

workload  | base                  | opt                   | metric
----------+-----------------------+-----------------------+------------
sysbench  | 63.55, [63.04, 64.05] | 64.36, [62.97, 65.75] | avg latency
hackbench | 36.95, [35.45, 38.45] | 37.12, [35.81, 38.44] | time
ebizzy    | 610.7, [569.8, 651.6] | 613.5, [592.1, 635.0] | record/s

Zecheng Li (3):
  sched/fair: Co-locate cfs_rq and sched_entity
  sched/fair: Remove task_group->se pointer array
  sched/fair: Allocate both cfs_rq and sched_entity with per-cpu

 kernel/sched/core.c  | 40 +++++++-------------
 kernel/sched/debug.c |  2 +-
 kernel/sched/fair.c  | 87 ++++++++++++++++----------------------------
 kernel/sched/sched.h | 48 ++++++++++++++++++++----
 4 files changed, 87 insertions(+), 90 deletions(-)


base-commit: 66701750d5565c574af42bef0b789ce0203e3071
--=20
2.50.0

