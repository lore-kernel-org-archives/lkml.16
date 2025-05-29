Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE141F473C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504199; cv=none; b=jwvbcQ/OaQ7xMn0x3Sk+3nLhxmvR3XfButDg82uZK+3NtzRCAV7w8HUtev6HcU37L1Q5IJhl7RIuhBrWBqKmerpAnjZykGaFa7sdw+FVfc/PkoobxI4LIGyvV/wHWY+peW5c5dUzp3j57hER/5Bf6vc5+rYOydz6BWQF1A+C2Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504199; c=relaxed/simple;
	bh=lmPe8qnxi6dZJHocmx4UbkJoOWbm6xLQzU7MY/WRoTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CK0EvZNSjXUhPLlew4QWx9OM+lOM9xbRcuIdvTHvSakN5B50Lsv13J+v0ZHqs6qtRo6+jVQ6sI3o5b1ncriY3RHepcbaqRSsnjIEfVJjHFmMiK9ZIrtpcyxG4YxsoWmBOO1RCFPQ4EUCarl0srrvZbqko+YiffxVhtyDI6BkRkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PEPRLCsd; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PEPRLCsd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748504193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g3yfCSpUgeUYllT9+YsC7uMJM4TMBS3FfIJphgXoakc=;
	b=PEPRLCsddhmFuVuT8ftwf87WCQquSnZPKnLG2SqMiHBDAKFd3UVgEAnWnct0MgQKFh3g9r
	5t+JH2wthLvO4EuTfM4Cym0TnzRQqSHcLwQ0Pxz8u3SP2dx7Tc6fil0SuqVHkGKMkeVxJh
	S44Bpn7qRoEwOyAJKD5mjdjFhIPm6uY=
From: Hao Ge <hao.ge@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>,
	Hao Ge <gehao@kylinos.cn>
Subject: [PATCH] mm/alloc_tag: add the ARCH_NEEDS_WEAK_PER_CPU macro when statically defining the percpu variable alloc_tag_counters.
Date: Thu, 29 May 2025 15:35:37 +0800
Message-Id: <20250529073537.563107-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hao Ge <gehao@kylinos.cn>

Recently discovered this entry while checking kallsyms on ARM64:
ffff800083e509c0 D _shared_alloc_tag

If ARCH_NEEDS_WEAK_PER_CPU is not defined,there's no need to statically
define the percpu variable alloc_tag_counters.

Therefore,add therelevant macro guards at the appropriate location.

Fixes: 22d407b164ff ("lib: add allocation tagging support for memory allocation profiling")
Signed-off-by: Hao Ge <gehao@kylinos.cn>
---
 lib/alloc_tag.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index c7f602fa7b23..d1dab80b70ad 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -24,8 +24,10 @@ static bool mem_profiling_support;
 
 static struct codetag_type *alloc_tag_cttype;
 
+#ifdef ARCH_NEEDS_WEAK_PER_CPU
 DEFINE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
 EXPORT_SYMBOL(_shared_alloc_tag);
+#endif /* ARCH_NEEDS_WEAK_PER_CPU */
 
 DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
 			mem_alloc_profiling_key);
-- 
2.25.1

