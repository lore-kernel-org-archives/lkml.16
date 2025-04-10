Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CD7083C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744253902; cv=none; b=faeTOyRNd23T1RFvAUbHn3oqWjR7sW/4zAUmEzaKf695kSH8JWYgUIYmgiQ5NqHHcj6yIIOFvpHJkhafpiVZnGdRhPsE0hmy8hpOsWDLNVhaNFpeGU+mGsezV93K/fWWMKQE3svPo4VPqg081a1ZpvDWZSCjHEtUl1ZOghX2R9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744253902; c=relaxed/simple;
	bh=LuAq+qzEs7CyM6o872Ta+OyytP28QwvQVoFC/5Pxhxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J0YzX82K8IH6DHzrGVhveOosfZB/QptWEj0AUwjYZFQPucfyzDqORQlgztpvEhX+hQ17J5tfQ5tX2UYyZNcTIsAN6BoYFrCApQ9gyK1Hl3CVAvyA3aaSL/R/RUu1TEIlvC5k4x6AdWsYU4nuM5VcTjzJHgYgAQFgRej+uIcq4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P5Upj/0u; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P5Upj/0u"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744253895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QbwnSKjPedkNReipVXQJ7J5oJfAs+GWPD73Z0sp3QZA=;
	b=P5Upj/0uvQZRUZafgO9lcJ2NRz0DwA+nO8En1S9CmnkdxbBvgNuqCDjYPwvkEC423PjYhi
	6kVxfYYaVNduhMcCiCucKBdrQtW0G5oCJPD+5ljzbb2XQBsR+Fo0ffzeZQO3zENuL1YIuM
	WYSldIjr4U05ywf2DYQ3zumAM2YXM6U=
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Waiman Long <llong@redhat.com>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: [PATCH v2] memcg: optimize memcg_rstat_updated
Date: Wed,  9 Apr 2025 19:57:52 -0700
Message-ID: <20250410025752.92159-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Currently the kernel maintains the stats updates per-memcg which is
needed to implement stats flushing threshold. On the update side, the
update is added to the per-cpu per-memcg update of the given memcg and
all of its ancestors. However when the given memcg has passed the
flushing threshold, all of its ancestors should have passed the
threshold as well. There is no need to traverse up the memcg tree to
maintain the stats updates.

Perf profile collected from our fleet shows that memcg_rstat_updated is
one of the most expensive memcg function i.e. a lot of cumulative CPU
is being spent on it. So, even small micro optimizations matter a lot.
This patch is microbenchmarked with multiple instances of netperf on a
single machine with locally running netserver and we see couple of
percentage of improvement.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
Changes since v1:
- Fix the condition (Longman)
- Ran netperf

 mm/memcontrol.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 421740f1bcdc..3035c1595b32 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -585,18 +585,20 @@ static inline void memcg_rstat_updated(struct mem_cgroup *memcg, int val)
 	cgroup_rstat_updated(memcg->css.cgroup, cpu);
 	statc = this_cpu_ptr(memcg->vmstats_percpu);
 	for (; statc; statc = statc->parent) {
+		/*
+		 * If @memcg is already flushable then all its ancestors are
+		 * flushable as well and also there is no need to increase
+		 * stats_updates.
+		 */
+		if (memcg_vmstats_needs_flush(statc->vmstats))
+			break;
+
 		stats_updates = READ_ONCE(statc->stats_updates) + abs(val);
 		WRITE_ONCE(statc->stats_updates, stats_updates);
 		if (stats_updates < MEMCG_CHARGE_BATCH)
 			continue;
 
-		/*
-		 * If @memcg is already flush-able, increasing stats_updates is
-		 * redundant. Avoid the overhead of the atomic update.
-		 */
-		if (!memcg_vmstats_needs_flush(statc->vmstats))
-			atomic64_add(stats_updates,
-				     &statc->vmstats->stats_updates);
+		atomic64_add(stats_updates, &statc->vmstats->stats_updates);
 		WRITE_ONCE(statc->stats_updates, 0);
 	}
 }
-- 
2.47.1

