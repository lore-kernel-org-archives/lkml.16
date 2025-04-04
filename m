Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B946B81720
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743730781; cv=none; b=iAQN3QgZSjjXA+VL3GtosA3JRTTXR+HBTjgxIMy3Z0OXL5hnWhowvfycyYGKFg+B1PqgcxOj43tJz2vSpI0j2Tu6C9oX8eX0WkEB5zsxV1d5n6VnqgM9qhGvF0t1dPPmjN0EzcRsezAhj/RFJUvyQJSnT0ovONHqqeXtBpqMdMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743730781; c=relaxed/simple;
	bh=dcmHxkwnLg3d2Z86cYpTujufTUr95JJ7pE3Jf4au6eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kct/Jt7X9tZHw8wBBxpHLKAoFjvaWWktnRea/EmFOfPr0zV2hFmw0vIT5oSA6999L0MicZgRXJANQJVLa/ukB3vxrwgOQCc92t7e7kDo2yY7tSOfVULx3SgikF+fyk31N/lWbpFn7OmJmHuWVpKZgIqNa8JBTOeFiLxmo520PmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IAblp7+f; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IAblp7+f"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743730777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwESqd7AZkcvjy2svN3vjPj4mb4ksMSsdpBE9pRlLtk=;
	b=IAblp7+fpjYEGUbuAy7stmx7sCATwj3MRNpK/SMhFEatyJbqyWryEzuHgIZ2GtmJPc1RUU
	fBBkXAT4axjSGU6L3payjnYBz+SQJ9SZtwFI5fgpfm4gq1gn3gcsZpDifoUpAsMKgMJPqQ
	LpBDY0nLoiac5uIBq6HqyzrixSBCTBI=
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: [PATCH v2 2/9] memcg: decouple drain_obj_stock from local stock
Date: Thu,  3 Apr 2025 18:39:06 -0700
Message-ID: <20250404013913.1663035-3-shakeel.butt@linux.dev>
In-Reply-To: <20250404013913.1663035-1-shakeel.butt@linux.dev>
References: <20250404013913.1663035-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Currently drain_obj_stock() can potentially call __refill_stock which
accesses local cpu stock and thus requires memcg stock's local_lock.
However if we look at the code paths leading to drain_obj_stock(), there
is never a good reason to refill the memcg stock at all from it.

At the moment, drain_obj_stock can be called from reclaim, hotplug cpu
teardown, mod_objcg_state() and refill_obj_stock(). For reclaim and
hotplug there is no need to refill. For the other two paths, most
probably the newly switched objcg would be used in near future and thus
no need to refill stock with the older objcg.

In addition, __refill_stock() from drain_obj_stock() happens on rare
cases, so performance is not really an issue. Let's just uncharge
directly instead of refill which will also decouple drain_obj_stock from
local cpu stock and local_lock requirements.

Acked-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 mm/memcontrol.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ae1e953cead7..52be78515d70 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2876,7 +2876,12 @@ static struct obj_cgroup *drain_obj_stock(struct memcg_stock_pcp *stock)
 
 			mod_memcg_state(memcg, MEMCG_KMEM, -nr_pages);
 			memcg1_account_kmem(memcg, -nr_pages);
-			__refill_stock(memcg, nr_pages);
+			if (!mem_cgroup_is_root(memcg)) {
+				page_counter_uncharge(&memcg->memory, nr_pages);
+				if (do_memsw_account())
+					page_counter_uncharge(&memcg->memsw,
+							      nr_pages);
+			}
 
 			css_put(&memcg->css);
 		}
-- 
2.47.1

