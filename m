Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD8289E2A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248149; cv=none; b=j8JeHj8awapQPy+RMD0BYBB0Mk8UYZDMluf+Rk6bKT9KkW5n9RRLfIHS12KTpisZl5Fuk9pa/ba7t8thO+/ikMOh2qaDOk5bOzqUswrTfImBqfakCS3RV7ucIIwBXqTstyLLaqEDgxKVMEWGR9J/Prhq0AHTnFz1ZLDV5k3Vc1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248149; c=relaxed/simple;
	bh=q5ui5UAA6sDZXoXLBnSfIAbWomRc12PZFrAUaIo0Yng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pSba8uYa8625pZ1ES2u8LOgETFBeErpjdZfGt+9C3wPToRSySuEEkGm2LI9Uwv+04d37uxmjEFS74Ytj6aqIQkx+6bzbQlv2eQMYsmQSHqjulb1gGGQu3TXtx1WPbxNkQOcWl1VTGIk5Qjp6EpXcy1R94DyYwy9qLvG35Hk5BmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P8wGW7MJ; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P8wGW7MJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747248134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YEf1BORBOsBfo/7P9FA9WA9o/wcYctYmHhlHLcMB2F8=;
	b=P8wGW7MJnEsuLTwzuaIdy5oghtUCutOUk7BEW93Dp+0lHf1rTbBInjISZQqBj6qTjL32AF
	uRgwwPtFy+qSahTFpwam6wMOGvzpZRcebdeTC5YyqJ5mv2uNhe6xUKmbw9OUKRs9wDzd/y
	nl1MyifIpr2ZSWRbhhgNdUVofCVyA8M=
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
	bpf@vger.kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: [PATCH v2 0/7] memcg: make memcg stats irq safe
Date: Wed, 14 May 2025 11:41:51 -0700
Message-ID: <20250514184158.3471331-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series converts memcg stats to be irq safe i.e. memcg stats can be
updated in any context (task, softirq or hardirq) without disabling the
irqs. This is still not nmi-safe on all architectures but after this
series converting memcg charging and stats nmi-safe will be easier.

Changes since v1:
-----------------
1. Rebased on mm-new.
2. Cleanups in first patch as suggested by Vlastimil.

Changes since RFC[1]:
--------------------
1. Rebased on next-20250513 (mm tree has some conflicts with cgroup
   tree).
2. Does not depend of nmi-safe memcg series [2].
3. Made memcg_rstat_updated re-entrant using this_cpu_* ops as suggested
   by Vlastimil.
4. Fixes some spelling mistakes as suggested by Vlastimil.
5. Rearranged the 6th and 7th patch as suggested by Vlastimil.

Link: http://lore.kernel.org/20250513031316.2147548-1-shakeel.butt@linux.dev [1]
Link: http://lore.kernel.org/20250509232859.657525-1-shakeel.butt@linux.dev [2]

Shakeel Butt (7):
  memcg: memcg_rstat_updated re-entrant safe against irqs
  memcg: move preempt disable to callers of memcg_rstat_updated
  memcg: make mod_memcg_state re-entrant safe against irqs
  memcg: make count_memcg_events re-entrant safe against irqs
  memcg: make __mod_memcg_lruvec_state re-entrant safe against irqs
  memcg: no stock lock for cpu hot-unplug
  memcg: objcg stock trylock without irq disabling

 include/linux/memcontrol.h |  41 +--------
 mm/memcontrol-v1.c         |   6 +-
 mm/memcontrol.c            | 170 +++++++++++++++----------------------
 mm/swap.c                  |   8 +-
 mm/vmscan.c                |  14 +--
 5 files changed, 86 insertions(+), 153 deletions(-)

-- 
2.47.1

