Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6269229B07
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747378217; cv=none; b=eh6lcSoiOp77qhiUhNpleUyTRC1CR+oL5X4HV+H6rpeQMEJJAjX1vbRJ3ftlDo60uiXKSYgkfxoDJPMpPM8c60ovyIcscs6P46MkRudy9ejsb5NDQMcBUkzM3sH9/LNXEgQdkkmGl9bBUWn9Aa03PWujaZwrjb3qAEczaFtT5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747378217; c=relaxed/simple;
	bh=TN0aHevHnfhcWVGThCRs5qFeEEsKBRAAG6+XURYRKRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxyhWq27smQ5fiwBQQTpHg6NA4KkzXESdzq28e5uniCxY9skEj49X/7icQYvUayKuZZQcuLNe+tXSqhiHheUhARzwbFUeGpauFqmn2t4jZtdlsZPWwE2Kzlu8VQ9faK6/aNjXMqqubXejRSyOiKIg5V16PiPrmIrebjlJmcAlb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=siOP1XI+; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="siOP1XI+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747378214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMkhHE3/mY4LwdWFLkKMdTI5kaoAKFQu40eQRc8Gq7c=;
	b=siOP1XI+4UsJf4QcPdJTLENFgNL3vd8HYedjMVroCwakJlLDn86JD4Qc4+nqwIm8+F87sI
	kqlqdNKpEZ4nDYd76Re7gsHiCM1qQT38MtpIP7DJ7FJAY/lWAM3GbK7iGbZo2mD3WJdZyJ
	4jB0niGQ+ZYUpCNX1Oa1k50J3tj2xwE=
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Alexei Starovoitov <ast@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Harry Yoo <harry.yoo@oracle.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	bpf@vger.kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: [PATCH 5/5] memcg: make memcg_rstat_updated nmi safe
Date: Thu, 15 May 2025 23:49:12 -0700
Message-ID: <20250516064912.1515065-6-shakeel.butt@linux.dev>
In-Reply-To: <20250516064912.1515065-1-shakeel.butt@linux.dev>
References: <20250516064912.1515065-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

memcg: convert stats_updates to atomic_t

Currently kernel maintains memory related stats updates per-cgroup to
optimize stats flushing. The stats_updates is defined as atomic64_t
which is not nmi-safe on some archs. Actually we don't really need 64bit
atomic as the max value stats_updates can get should be less than
nr_cpus * MEMCG_CHARGE_BATCH. A normal atomic_t should suffice.

Also the function cgroup_rstat_updated() is still not nmi-safe but there
is parallel effort to make it nmi-safe, so until then let's ignore it in
the nmi context.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 mm/memcontrol.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 85519ce37f18..06d5d5407b00 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -533,7 +533,7 @@ struct memcg_vmstats {
 	unsigned long		events_pending[NR_MEMCG_EVENTS];
 
 	/* Stats updates since the last flush */
-	atomic64_t		stats_updates;
+	atomic_t		stats_updates;
 };
 
 /*
@@ -559,7 +559,7 @@ static u64 flush_last_time;
 
 static bool memcg_vmstats_needs_flush(struct memcg_vmstats *vmstats)
 {
-	return atomic64_read(&vmstats->stats_updates) >
+	return atomic_read(&vmstats->stats_updates) >
 		MEMCG_CHARGE_BATCH * num_online_cpus();
 }
 
@@ -573,7 +573,9 @@ static inline void memcg_rstat_updated(struct mem_cgroup *memcg, int val,
 	if (!val)
 		return;
 
-	cgroup_rstat_updated(memcg->css.cgroup, cpu);
+	/* TODO: add to cgroup update tree once it is nmi-safe. */
+	if (!in_nmi())
+		cgroup_rstat_updated(memcg->css.cgroup, cpu);
 	statc_pcpu = memcg->vmstats_percpu;
 	for (; statc_pcpu; statc_pcpu = statc->parent_pcpu) {
 		statc = this_cpu_ptr(statc_pcpu);
@@ -591,7 +593,7 @@ static inline void memcg_rstat_updated(struct mem_cgroup *memcg, int val,
 			continue;
 
 		stats_updates = this_cpu_xchg(statc_pcpu->stats_updates, 0);
-		atomic64_add(stats_updates, &statc->vmstats->stats_updates);
+		atomic_add(stats_updates, &statc->vmstats->stats_updates);
 	}
 }
 
@@ -599,7 +601,7 @@ static void __mem_cgroup_flush_stats(struct mem_cgroup *memcg, bool force)
 {
 	bool needs_flush = memcg_vmstats_needs_flush(memcg->vmstats);
 
-	trace_memcg_flush_stats(memcg, atomic64_read(&memcg->vmstats->stats_updates),
+	trace_memcg_flush_stats(memcg, atomic_read(&memcg->vmstats->stats_updates),
 		force, needs_flush);
 
 	if (!force && !needs_flush)
@@ -4132,8 +4134,8 @@ static void mem_cgroup_css_rstat_flush(struct cgroup_subsys_state *css, int cpu)
 	}
 	WRITE_ONCE(statc->stats_updates, 0);
 	/* We are in a per-cpu loop here, only do the atomic write once */
-	if (atomic64_read(&memcg->vmstats->stats_updates))
-		atomic64_set(&memcg->vmstats->stats_updates, 0);
+	if (atomic_read(&memcg->vmstats->stats_updates))
+		atomic_set(&memcg->vmstats->stats_updates, 0);
 }
 
 static void mem_cgroup_fork(struct task_struct *task)
-- 
2.47.1

