Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6233C2F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542737; cv=none; b=MoJH5azAphwpD0YxPACd8Y4axbfYJzT4S36SXJbcRnSRmw/3URR3MjG5pthuPI02gznZp72TPWKdRVt/M3OfqK12K6qQzHN30EPpFXQMV6vo74lBGwGHthGYQyyVcBDQMBvrDgfAPTPlBfI8dnoaj8UIfJ9XJXBan0TsKebfxnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542737; c=relaxed/simple;
	bh=AEWPUemTh9IeNsfP2Ao7WHIhs7PtJUjOwoQn5BL73z8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1Ka9ZZ+VuYpe+d7mhaPiy8GeMhCIygOiLZs1dGis1wQ9zCDjEtK2Sc6g/zWMbVPY6WKlZ/IjLU2tpndkCHIEapYeksNTWStrQCa1siEqqDwuievQQ6eF0WVFrxwWSqov6AN1kQ5016MYQDqDt5hSVOGlxQoeJIjj8P4oTQqWAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4b+Yta8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4b+Yta8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224171d6826so85900425ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746542734; x=1747147534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lJgYZIz4fBAZgGi+cbkSlJEx6wDoPnaEG1+0PCFG2m4=;
        b=Z4b+Yta8mAacNzBWj1eBLAcD18ASleptA1f5b6IOh2N5vt32mBQ8RK4YIFuA17atuj
         jL1cMHmwHG0BV49yP00Dc5NdrJXuIUUZPoTjqId1ZEAbGK3qTQrrVsrZni87HLIRCTGl
         jn4dhrmitM9aNb7bR65qey52NznJh7w7RGv4z/tNdW4JjG3prkYbgYbiPxCFxVkxgEkQ
         1G6aYvgs5HZjA0bxbW5zyETrEDhAAtOtDtu35PbDexMacO6XwfNBPNK5NEXjNzAOkZj/
         05/NuKmx9v4liK1sy4Z6/BuN4JwIzGEme+WSiE7pUuF0qVJX+uqRbHSO3Ao9sUt5IR8O
         QiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542734; x=1747147534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJgYZIz4fBAZgGi+cbkSlJEx6wDoPnaEG1+0PCFG2m4=;
        b=Q4yChKpXRee1jpul9fsu26vB3uIX32COhtMBVh07GiG0MkVFBiAfobdIK3AahA0yS2
         GMYTb9uR6RDV9QJpRb4jqpFOdcrWADcQzz/vn8AfYpwBJkUn3RUrCJ1JGbUlaZGqDAT5
         O/oTKTu0I+W3AsMRlPRkyo65PvYJtjds9R9eqXEFJMhcxseKMsm0AcTcQtbmjnnmvvKv
         ac74+8h7yN09Xgzg6qtb8bm+KghTrVhQOaZQWwmqY9mVwR/NqSXPihEfjuHoGYFbuuD1
         mtEK5mxlohmTvWzVs/gTVj99t9qjZKmBAKzIRhe5DDRQAG9aZyi38XJTaAj4mlu4KTwb
         TP7g==
X-Forwarded-Encrypted: i=1; AJvYcCWRp98WAz0bcDuBdmNNTsXgGeLvnKom1/vuVGyflkbNgLQD9mSSZd1OlB+jvLwVZDgLGG1/sVjZxT+SzEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YydOC9Go2pQP7AiTfOjpXNJUv8XIo6Stn7qo9p+K9Wsvad+DIxL
	omNQAxLGBAK+wQIAS557HyE2EQvQCxT2XnNMiKY8po97OVFSHmVG3D9Ihg==
X-Gm-Gg: ASbGncvlyYLxJpod4syyQqY5ufZTSqmbaeSfBaOwiqMVuvTMf2SL8osEEGAbNzbSyUr
	jqMCfG0YbIJzVJR/O/RaP8UiQkw0o6DCe2GdhDnmxjlsQQD36qpaFkAor/VBHVC0OdUCQV0h9UE
	IHRqdOYvqZ4VDXfHUh8Wrvw4/xHqR7nhKMyFxLe5hWIM7m/GVe5NpTPxxkBvYppPBggJl+Vng2j
	4g7Qcxy255dP1K9Jk8Zvsui7icMG2F5TTF6YD2Nhn8rDo6lO0myG16Z1pbzUHQNTC5rUZcY9dmU
	/QOSci+9T+dP6w9ziWwGhPvjOf3SYcAVxqXbmdPCAcCNLHe7TsUQyKq4HtYBVdEh
X-Google-Smtp-Source: AGHT+IH7DhWXw+Nw06LRBmzyc+Uoo0IKiFMI6q9a1xqv6nU8hVVLYfeQbemWe2K5N77Po+7ln46QWg==
X-Received: by 2002:a17:903:18c:b0:220:e023:8fa6 with SMTP id d9443c01a7336-22e33135b52mr42552335ad.50.1746542734226;
        Tue, 06 May 2025 07:45:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152326f7sm74607275ad.227.2025.05.06.07.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:45:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Lameter <cl@linux.com>
Cc: David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] mm: Fix up memory allocation tracing
Date: Tue,  6 May 2025 07:45:31 -0700
Message-ID: <20250506144531.3434190-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intcp_init_early() calls syscon_regmap_lookup_by_compatible() which in
turn calls of_syscon_register(). This function allocates memory.

intcp_init_early() is called well before kmalloc caches are initialized.
As consequence, kmalloc_caches[] entries are NULL, and NULL is passed as
kmem_cache argument to __kmalloc_cache_noprof(). While slab_alloc_node()
handles this just fine, the trace code unconditionally dereferences it.
This results in crashes such as

Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
[0000000c] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc5-00026-g5fcc9bf84ee5 #1 PREEMPT
Hardware name: ARM Integrator/CP (Device Tree)
PC is at __kmalloc_cache_noprof+0xec/0x39c
LR is at __kmalloc_cache_noprof+0x34/0x39c
...
Call trace:
 __kmalloc_cache_noprof from of_syscon_register+0x7c/0x310
 of_syscon_register from device_node_get_regmap+0xa4/0xb0
 device_node_get_regmap from intcp_init_early+0xc/0x40
 intcp_init_early from start_kernel+0x60/0x688
 start_kernel from 0x0

The problem is not seen with all versions of gcc. Some versions such as
gcc 9.x apparently do not dereference the pointer, presumably if tracing
is disabled. The problem has been reproduced with gcc 10.x, 11.x, and 13.x.

Fix the problem by only dereferencing the kmem_cache pointer if it is
not NULL, and pass a dummy parameter otherwise. Only add the check to
__kmalloc_cache_noprof() since it is the only function known to be
affected.

The problem affects all supported branches of Linux. The crashing function
depends on the kernel version, and some versions are only affected if
CONFIG_TRACING is enabled.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I only changed a single call of trace_kmalloc() because it is the only one
known to be affected. I'll be happy to change the remaining callers if that
is preferred.

I have seen this problem for a long time. I always thought it is a compiler
problem because it is not seen with gcc 9.x. However, it turns out that the
problem is real.

 mm/slub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index be8b09e09d30..627aa8d2b9fd 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4353,7 +4353,7 @@ void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t gfpflags, size_t size)
 	void *ret = slab_alloc_node(s, NULL, gfpflags, NUMA_NO_NODE,
 					    _RET_IP_, size);
 
-	trace_kmalloc(_RET_IP_, ret, size, s->size, gfpflags, NUMA_NO_NODE);
+	trace_kmalloc(_RET_IP_, ret, size, s ? s->size : -1, gfpflags, NUMA_NO_NODE);
 
 	ret = kasan_kmalloc(s, ret, size, gfpflags);
 	return ret;
-- 
2.45.2

