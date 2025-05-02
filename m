Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE0A801
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 00:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746145087; cv=none; b=YbzWdnklcXpTCPJgADqK/Rs4Cz1ukHBlMD+ObcQ1JJz/DdJyJ0XFwYWjr7OBn9aCK1vboEocoEAiQy/DdOLFeZtzNEft39Ep/SHksnW+35bbUHBtn3H7SAsUW3yUN3vko7ktUt34e09kBx2HOHa+UqnBlqiSc4JUB+H7FnK0Wwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746145087; c=relaxed/simple;
	bh=aIoHjI9HKI+b6DfSq2WbNBqXIXZUgfmVBMRzreKb8N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7m7BmAXfkvl+uubK0fsFr7b2BVRxql68DEjwCjP8bUsYf2v/PRxlw89hczklUVqAaIILZnrD7tv3lB5C71MH1ZxI0w6cBRQBOQv7rSWzi8cq69PQ5ulaGvuUiQzC78gv+NN2KaiSyUCg+ox/qOisI13OZZSaVJifOhQUKgj/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D8tt3RXU; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D8tt3RXU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746145081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FAQQHMseiTFfB73eqU9yeUG42Iz5JnWxEBkUeFyyRhs=;
	b=D8tt3RXUQ8nh+AvmKFaVtfB8LLsU/KucHvhWR/6JdnA9RGI+k7bI+ghFCtFuO4SU5kueaI
	YmVJBOLxIf5nbTqCAgYjbXvwCBu2/AT5v+Z8cKmAAG+CYi0S+/P9ujlNNicbhznV9FwTJm
	I5+Z1oYoYcdDmDOcc/Kz0R0zwTDFbRQ=
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: [PATCH v2 0/3] memcg: decouple memcg and objcg stocks
Date: Thu,  1 May 2025 17:17:39 -0700
Message-ID: <20250502001742.3087558-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The per-cpu memcg charge cache and objcg charge cache are coupled in a
single struct memcg_stock_pcp and a single local lock is used to protect
both of the caches. This makes memcg charging and objcg charging nmi
safe challenging. Decoupling memcg and objcg stocks would allow us to
make them nmi safe and even work without disabling irqs independently.
This series completely decouples memcg and objcg stocks.

Changes since v1:
- Drop first patch as requested by Alexei.
- Remove preempt_disable() usage as suggested by Vlastimil.

Shakeel Butt (3):
  memcg: separate local_trylock for memcg and obj
  memcg: completely decouple memcg and obj stocks
  memcg: no irq disable for memcg stock lock

 mm/memcontrol.c | 159 +++++++++++++++++++++++++++++-------------------
 1 file changed, 97 insertions(+), 62 deletions(-)

-- 
2.47.1

