Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1133C30
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967888; cv=none; b=QGjmyA40gjSwJioLvZSaprMhQGj7SCIemNP/bhKfN368+U2WucFsaXXVn8Ge/f3R9EqjGn8C5p2UsHjedg3AZqD0tL2r4UNIk7RvKfpYtASkbsICAC1Xjh6YVxl9spBHEalmUIs3z/tM+Wv+1cjLejoygCKpecsiWX1Z8aPx5GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967888; c=relaxed/simple;
	bh=XCrHKWVgmMCrW59oqlSlA87KKj8B2MCh7j042Y5C4p0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QKsXsgAN9i0I0k/5BGufbEeAdZWzRDzr7EAx9UzNcRYgmbZ5K5uq8r9vRHNTtvJAELiEqslpf8AgC3DvUGMPuXqrmB0fEB57ys/p3lrqo7pVEWeCmXENHWeOnVgtaKAHpzzPRPrJidTx8AThpQhH2TdtYeV77o6pownuOQm+yws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O9B/j4kT; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O9B/j4kT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745967884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9LEq+0YVLr8RjiVsen+N5ydlKWCucWJnExhqzdnNX/Q=;
	b=O9B/j4kTnqmgfyx3TZeQm7bYlhygFXNwyMUrv6cwJV5dUMJ5qF112UrOQ4PTON+oao8nUI
	ztnkjHuhxfBqFactakGabC036XJUkWtcsTnG41Z8VKBb/vvAQfsaqdcTNiWxqyHLsQxuMv
	RvO6JIeCst/jQe2byex8Atn66Kc5trU=
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: [PATCH 0/4] memcg: decouple memcg and objcg stocks
Date: Tue, 29 Apr 2025 16:04:24 -0700
Message-ID: <20250429230428.1935619-1-shakeel.butt@linux.dev>
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

Shakeel Butt (4):
  memcg: simplify consume_stock
  memcg: separate local_trylock for memcg and obj
  memcg: completely decouple memcg and obj stocks
  memcg: no irq disable for memcg stock lock

 mm/memcontrol.c | 174 ++++++++++++++++++++++++++++--------------------
 1 file changed, 102 insertions(+), 72 deletions(-)

-- 
2.47.1

