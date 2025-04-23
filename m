Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645D280CC8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419695; cv=none; b=ReYwPa+qjLpAo8L51frB4NyXQ4MC5k0yl+1kQq+ZUkqblGT/ucni+/bAWFjwkgdegHAjfRmu/SxJfdFdBXrA9/AgE2evvYzO6QUBZ4ctS339otzkdeegx4nvThz7QdMepOEnhXT/MzVlvTO7ud5TaDebttiHif91Yem4TGf9igQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419695; c=relaxed/simple;
	bh=QlzGJleZZXCyJsw8egoZH9V++iBv9JGgZWkz57pDAPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aog0/TBtwGAhDYKjjtogY+gbfuDRrPv7/3q/2A7LiJzHyFe7GN8iyLWqwEvHaFr1nGLV+2nCMIHfrpals9GDmiIWI2i1TROWLf2jYHMRlLNnb0xqEOJ42BmKny64gdndZWcqS1ZsF+aQYuJAK6URLE0wbSuWW/zKadlH+/hJm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htamqujK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htamqujK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0678CC4CEE8;
	Wed, 23 Apr 2025 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745419693;
	bh=QlzGJleZZXCyJsw8egoZH9V++iBv9JGgZWkz57pDAPk=;
	h=From:To:Cc:Subject:Date:From;
	b=htamqujKQkMqXR7OuUbrOqQ6m2WENfIw7g7B+Afuaurg5LeF8Dd7GA6mjrY/Hr7H5
	 WO93eNX5n5pluH3+UWBCmhLo2XrvuvorX+uW1BXJ6J5zKbnMnEOksGJU893Ps02uwR
	 +rbBS0nbvkpGlmAQv38tD+C84KfCn2z48lf+hFczmy7jbgdlHybIaVA3QMmzvDwsew
	 9akqbmnxH/MUZGv11npYnS+CUXqBdwqLP4oFy+W2f6+hRnZuoiWIwHrCSIlHUBiQ2Z
	 azc2iNoIEYf6wOWxF8Te11AXqJIJqNT9HtwBu4vBY30bZaIDFCK77MmToB9vM+e+l3
	 vP4cV6uhLQlmw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] execmem: enforce allocation size aligment to PAGE_SIZE
Date: Wed, 23 Apr 2025 17:48:07 +0300
Message-ID: <20250423144808.1619863-1-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Before introduction of ROX cache execmem allocation size was always
implicitly aligned to PAGE_SIZE inside vmalloc.

However, when allocation happens from the ROX cache, this is not
enforced.

Make sure that the allocation size is always consistently aligned to
PAGE_SIZE.

Fixes: 2e45474ab14f ("execmem: add support for cache of large ROX pages")
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/execmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/execmem.c b/mm/execmem.c
index e6c4f5076ca8..2b683e7d864d 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -377,6 +377,8 @@ void *execmem_alloc(enum execmem_type type, size_t size)
 	pgprot_t pgprot = range->pgprot;
 	void *p;
 
+	size = PAGE_ALIGN(size);
+
 	if (use_cache)
 		p = execmem_cache_alloc(range, size);
 	else
-- 
2.47.2

