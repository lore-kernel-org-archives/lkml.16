Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1FF218593
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497921; cv=none; b=uJGl+PHgMBfdvg8JgO3wIu2v18adQ4jb6TYidBkf7MqvBNOrk3N3gHZdIYlv0GVJtP7qE8G9aZnXxIeK4GfaF5BwScXeBYhuzQ0c++oTpQycy8Yz8+MlRYC4RcufM4VA/enyc42pae/hflSLSUWCIKnQqatG5R8Ojk3xqBRKHJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497921; c=relaxed/simple;
	bh=VKcEyzECt4iZovnPPAuxXmLCJFZvXlGSJaQhIh6CKak=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=icf06pmMxajaq/YV6gFCToCeLxrDCoBFDKADs6okfkZg23q9vYJ7ZjG4HNrZOvt/tzyda8ZfIxEoGQzOPpmP0tYGFI//UQLf2bCwqvIJ8qHhWl7OPRW0W69xv5Z1QHU+1ek9EK1Mcy5i0Cvvk0+axHTn1vJaCrxZ65VmMRkowMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RMGjt2+l; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RMGjt2+l"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-70e649662deso60726987b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749497919; x=1750102719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGtRr+3vWRTCO5PlCK7IEBLI5K5jti8nKZqk08FZqZQ=;
        b=RMGjt2+lK5bi7RcdUOTGKf1I0tfayIJ1rOpxqNhgUTCDeE891ozNacP68Lx7SyXF/f
         Tp9TFbDcDU4LCBHJp1dm6nR/r7E9eGyLaPUD4sfHsF+ZqnTK4M8JS05UtBCmcZrPDyBB
         EJd9fnJAE7MxPWiCWizKU+ZFLQab4f/C0aU6tMJC3ldc8mx2gdvqwlNKn4iev728Nzex
         PvyEWDfflOrkWPx9WBEQ22yOI2XAG79caotjEOfWU0NF2cvhok4xl3UBXZfeqyBhmj0+
         Oe8UNIbRqXOYeugX1Jpz7A/BsQEAsXFU58qwPSch/5UFlghH/peve9F8JSFpc6iaiS0+
         jm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749497919; x=1750102719;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGtRr+3vWRTCO5PlCK7IEBLI5K5jti8nKZqk08FZqZQ=;
        b=pXwoUGCJVOSxPObj1a8JKQA0zsFoiHfID1EuffB86IvbM7XjQSq98XQAvkRfJrdGB9
         9evg6Aeg6A3gckefzQ8JIVHafXq9s7tDzoRlbyZKmsmomsUFA2+tMMcrsPGPGFyDGTb4
         3su9k/TVZXcglldlB6cS3tKn5zJGfaDBCOvPlhhS+UsALdYTuHMMuV5WlgKOdpfMn5xL
         cyg0wrTcyUZoTBOIQLGzPEHVnl4URL7fMQ1a5buet5/5Mu+Ry1Xi/kDECH4DXF1NqU2N
         qlMqFogImadtDdIPLBbgXJWD91oLTAIP5bf7L24AKfvYLN0/VmScJ5Kv6e20QmKwebia
         MLkA==
X-Forwarded-Encrypted: i=1; AJvYcCUv2Yt4XsHlZcNQwpAP/JntvLEus0kEE8YoXkfHce1qiZfFF4jfHf8OdGrAsdnoYoE/5vEMll7W7MxTAeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdxXIvc1o3BJn47NQuJr2+e2Nj5ereP89+NHtsFSBESihwkKKt
	OPZdPvOycbRvocuM6S+eSq1Z1izOsAgtIqSsBbWjKXSvXeYOHtWsGJr79YBdHfci7KFr7L5I78G
	TsYvm+J659A==
X-Google-Smtp-Source: AGHT+IEmEylFYLh4//kAXgMNkaJXKL8LQ9wzJ3rMWQ5viWLq4DTh3AxdGwK2553szQ8CZlpcr8Kjoabgfk5e
X-Received: from ywbhj3.prod.google.com ([2002:a05:690c:6183:b0:708:c88e:6c9])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:48c9:b0:708:c18d:e6ac
 with SMTP id 00721157ae682-710f76863e1mr205996447b3.18.1749497918813; Mon, 09
 Jun 2025 12:38:38 -0700 (PDT)
Date: Mon,  9 Jun 2025 19:38:30 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609193834.2556866-1-zecheng@google.com>
Subject: [RFC PATCH v2 0/3] sched/fair: Optimize cfs_rq and sched_entity
 allocation for better data locality
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
multiple task_groups for the same CPU. Therefore, the new percpu layout
can reuse the base pointer, and they are more likely to reside in the
CPU cache than the per-task_group pointer arrays.

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

Tests were conducted on Kernel 6.15.

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

v2 updates:

- Allocate cfs_rq and sched_entity together for non-root task group
instead of embedding sched_entity into cfs_rq to avoid increasing the
size of struct rq.

Zecheng Li (3):
  sched/fair: Co-locate cfs_rq and sched_entity
  sched/fair: Remove task_group->se pointer array
  sched/fair: Allocate the combined cfs_rq/se struct per-cpu

 kernel/sched/core.c  | 40 +++++++-------------
 kernel/sched/debug.c |  2 +-
 kernel/sched/fair.c  | 87 ++++++++++++++++----------------------------
 kernel/sched/sched.h | 48 ++++++++++++++++++++----
 4 files changed, 87 insertions(+), 90 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
--=20
2.50.0.rc0.604.gd4ff7b7c86-goog

