Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC8111BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067151; cv=none; b=jMNdh6YEaD61i2E7vQFEyVRi9SFR7XCZ6q5ZHJYHH4DCSVQ7svUbOO2KLYSNlGjVjIon20ZPjZFBv+WExxE2eqcElOF4nEO0HgcX4jZIB0PxshtYAu2MDt2pZfL5Xv5RDBzifdTmQynHJBf35qBOSXdj4Y3MpIAfch/R0/bvT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067151; c=relaxed/simple;
	bh=OdV7wnjZVRHaR6N4t2ya2kUm/FdUGYihu6Izt9TCuzc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=St712rFw0PGqpViUsPfL80TcmBvt3a3BuE0HbRtt0dqyTK4hpCiXwLuoNHg9QE7o895CNqgQBkveH0UJPGU4jYv/8+ZoFTulzTorhCg2l/mDt1gxzSBewPHyTeIePlyxwSRxdaPj7uzO7Q/U1QwPEhstpVy6Z+j0Lgtk+R2p2mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uFrXulzg; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uFrXulzg"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-70e73d3c474so4024967b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 12:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067149; x=1749671949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVUipMfAQTFFEBKRK6PeLLuTW7OSUDebUckMstatPOg=;
        b=uFrXulzgoMlxWN7vKpTYol88hb2vQovZKRivGk6s/7v4qZPwl+e2bvMDaGifmI9wKV
         9/Xel2yB8EQDxt4O3evUf9ipxgewMD92KCWQkt8ARd3KUUNg1uNIQpIXUPxaO3GF3LDL
         ZWF4o+2+919Vco9XaCw2ccQqj40Vcn3ZN8xRjkxMN0JoEOz9aJoKrdA0o27far68+6cR
         R26u6kMkQ6tVIBzfD8d2U+26rbOeNIWQrJ4fvubmIpKivWYJ/vCOgHImK//iENpFEsXI
         qjwQWV5fUEVt+uWxgq2KYHYy8hzEk+hZB1C7ynAhnd5MFE5CdkOcUW27p/yTf0loDWat
         QNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067149; x=1749671949;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVUipMfAQTFFEBKRK6PeLLuTW7OSUDebUckMstatPOg=;
        b=uAKhCRKPt9c7QScABM8xQETxd7ou9qOcvzS9pdeg8numtqT8yjziLpbS3N+EBrjoqE
         8wrtPsX7E5vbn4BPV0QZohXq0aHxZLQOqCFrHcWs7bo3kqwZWJuLPolVvexq9bfz/gay
         hQEOFmwzXMp2wEprAfa1vnahebJP2/4aF3lQw3f26Mc5irVKhZfM5rv8Ss8Wbtq94dCF
         yaSuDAZtF8ddUGe5jjetEggzJfyxXqZO1fAVBp852vXURzFlGklqgAtmnoBDl0dV7TsM
         qiNaFx59foa2l1upkRpZqluKMOXJfODcnhhtLITV/penexDytJlXxQmaeddlsbb0Xnhj
         j3AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX51WtenzmhHixR4t/ayoR1V96qupMekOAmLtt4Km2vVr2iutvVmE72I9gXVN5RUuVu7b0AvWVIOSLPtuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNdSmMhHQhfdxVYxfkqToEGEqTsWR74YN9a69ZJlsvC5EwWRk
	hFGZFvCiw6cb+CL+RXMSxE9D6NtmzWJs26FNO7CvNWTpGI5PIh6yuC8DoMuo6VqSv/iXgfgF+uc
	OC3vpxUyhzQ==
X-Google-Smtp-Source: AGHT+IGfzzT31kg7FhZRLoDoK09j4b9KCvU0orsCk+2ZZXg47QZ/7Kk2ui6u5TE1mMlTlHPBIA4X5c+Djab1
X-Received: from ywbcl30.prod.google.com ([2002:a05:690c:c1e:b0:6fb:b96f:b3da])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:23c5:b0:70e:7706:8263
 with SMTP id 00721157ae682-710d9a6e74emr55846997b3.12.1749067148853; Wed, 04
 Jun 2025 12:59:08 -0700 (PDT)
Date: Wed,  4 Jun 2025 19:58:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250604195846.193159-1-zecheng@google.com>
Subject: [RFC PATCH 0/3] sched/fair: Optimize cfs_rq and sched_entity
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

1) Embed sched_entity to cfs_rq.

- This benefits loading the sched_entity for the parent runqueue.
Currently it incurs pointer chasing, i.e., cfs_rq->tg->se[cpu]. After
embedding, the sched_entity fields can be loaded with simple offset
computations. As a tradeoff, the root task_group instance needs to
allocate memory for its sched_entity, which is not needed before
optimization. In the worst case, this will increase #CPU *
sizeof(sched_entity) RAM usage, which is small.

2) Allocate cfs_rq using percpu allocator.

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

Zecheng Li (3):
  sched/fair: Embed sched_entity into cfs_rq
  sched/fair: Remove task_group->se pointer
  sched/fair: Allocate cfs_rq structs per-cpu

 kernel/sched/core.c  | 40 ++++++++-------------
 kernel/sched/debug.c |  2 +-
 kernel/sched/fair.c  | 83 ++++++++++++++++----------------------------
 kernel/sched/sched.h | 40 ++++++++++++++++-----
 4 files changed, 76 insertions(+), 89 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
--=20
2.50.0

