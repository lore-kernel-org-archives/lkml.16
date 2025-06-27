Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B362C08D5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019035; cv=none; b=rF1QREr5C4U6HzzM7qGbq8eldlpU3CDrpmaBwrgYcRaeeRqFEyv6Jzp7t+HGV6NhMSOcfbD/9gK34ogyxccHKbUZ2b0ptXbr1nVQ2eNicYFeQUe402HsVA9AdWoDwXFk6/S5OuBDWQiBGpD8GFy0iycGb1UBV3y6n9fUtbJAbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019035; c=relaxed/simple;
	bh=PIkDrcWZHnXgH0r6rcPc9bMgUEA8fdophSyVS2rNkAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeLf7eh0vPRMOCF1E1GWFoX8RgxbEzNX+ZGmSlZ8I5MCqQ+Vq3NDFd+ZQ1SeGEiHo37nQTZY7MmZYcLwCeWhXPyTNh0BX8ksl3Etk9R/tERnj3rEr6kVe8w81J2cGJFvcRZO/HXf6TSW643YX49URxcJAL1Vn+X27XtNkK01YOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N+djK7bp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N+djK7bp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso282950f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019032; x=1751623832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkvls7hwXwv0ykrBS/xxPUz/PpMkCNXsAILifVa3mmw=;
        b=N+djK7bpqt7LB0R04o3JwAeodwItcrql/qwSyxmzM9p7BvZAPa4L3hLT4QpKAmKGb5
         Hxq2qHgSNIHs858XWYFMUEuniLE3h7aYn4cCZaI4sNhLCCaRG7RSAMhMzwnFPPHai7uG
         jCOGCP6hq9ICjK5odhPlTYSEDmMKTsL6WAc3n8ALbDpztU9CHy0KiHOsdprv0mguwOtu
         WUChUcjLOv8juO3jBDv7oo3K3U/pHc+RQBArcVxumW/149AN7bpqJs08VsaMSdMW/noR
         hf1Zdiu9H2ICOR2YFJ8a/u6RsMKZmNvd2xUQdYjx7/TjEAdHn2ehoD2Sgt61jykFZEKL
         u4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019032; x=1751623832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkvls7hwXwv0ykrBS/xxPUz/PpMkCNXsAILifVa3mmw=;
        b=pl7uwI0LVtQv4Px7YRZe1swRIYGlKwDMxmtlk92mpQ4m77KIStytXZI3gfdk2fKVDo
         yHqI3RsQrRA/eHVxOrHIYBcUKg8evN2mMEZl75ECS45zXP6d5XlKtxGOiLzFHuGs7w7C
         LfP8kRaW9Y0ae4wKmUrgD9V8h7uYL7A8267WK5oVTql6JrfLPFz4WrU+eAWr1SCwSEuI
         jOW4AWkK9mJ1Ck2xQF8xKMujLVYEH/oyLQRxg0qsjcUttJ/Ko6bT0hTK5DnobHsUbIP0
         20a3mILQaRHx5S3dXfUZCcC4d7JQYlFNW6bdnoBbmSLG5UeGIBmuxktZuY3zPZ0Sc6cY
         Y+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWduFHrDn/4i3wlWRkKOR06U73XMKLsWe0CGaHgQq7U/gLNIi6PwUBY8Q53lilHBT/ReOwwNFx5jNJYxFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyhWafzz6AWFea74Q+XNnE8Aly0mOPifjz7byoMqL0/ynn83nE
	03vlYPRiIl4PxsmOo749R8CfDA7ro7PXH3n8tHx0R5s4Da8iZe0AiY2Bcbn8QI3xxRc=
X-Gm-Gg: ASbGncsp6hmEadmU4D9RHfD7JQveihU7oykc2rMY4UP/8KDW2HUxh2e+GCmeBnxg5wz
	SGo/dENa31pwwz+1UYBnO13Rka1d7k9gWe+U+2DtbpC1Tz+y1D+4Qv+qOxwr88+w9eLDZnFuaNd
	PlQF58mZdqAywpr/AMNJMk4Hbhbdf+hWEczhVFonfknVYb6hBdolKbRzA27YuN2i1tQe0znCdgA
	cdNzQXKZQpi97CI1wNypUZcyDP0D2MLmGr0lMvvpeYqYd3lSJV25XLFcsJXdVW4tvptnuD6jG7s
	W4r7PxQQ+yNTZe687fWWEWlZNAXRkGFimOXX/y4tKcH5rvzein+UGKcxcDoHzjDD4EXh8NakxHd
	0eZ8oSbWqqqJ+IhfGdU3Skr19hIij/dMM5I/TEp8Ok6TNFLZj3vVs
X-Google-Smtp-Source: AGHT+IFakGUatYasiyktGr52JfBGbmNZ0F1ECxHAdsFEffpOVWE3hvclPTvYOXXiDSO9IxEw8Dy1HA==
X-Received: by 2002:a05:6000:23c9:b0:3a4:f912:86af with SMTP id ffacd0b85a97d-3a8fdc1f2b7mr604008f8f.2.1751019031793;
        Fri, 27 Jun 2025 03:10:31 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a423abbsm46785495e9.39.2025.06.27.03.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:31 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 5/8] docs: dma-api: remove duplicate description of the DMA pool API
Date: Fri, 27 Jun 2025 12:10:12 +0200
Message-ID: <20250627101015.1600042-6-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627101015.1600042-1-ptesarik@suse.com>
References: <20250627101015.1600042-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the DMA pool API documentation from Memory Management APIs to
dma-api.rst, replacing the outdated duplicate description there.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 62 ++----------------------------
 Documentation/core-api/mm-api.rst  |  8 ----
 2 files changed, 3 insertions(+), 67 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 3e89e3b0ecfd2..bed6e8fdf56e2 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -83,66 +83,10 @@ much like a struct kmem_cache, except that they use the DMA-coherent allocator,
 not __get_free_pages().  Also, they understand common hardware constraints
 for alignment, like queue heads needing to be aligned on N-byte boundaries.
 
+.. kernel-doc:: mm/dmapool.c
+   :export:
 
-::
-
-	struct dma_pool *
-	dma_pool_create(const char *name, struct device *dev,
-			size_t size, size_t align, size_t alloc);
-
-dma_pool_create() initializes a pool of DMA-coherent buffers
-for use with a given device.  It must be called in a context which
-can sleep.
-
-The "name" is for diagnostics (like a struct kmem_cache name); dev and size
-are like what you'd pass to dma_alloc_coherent().  The device's hardware
-alignment requirement for this type of data is "align" (which is expressed
-in bytes, and must be a power of two).  If your device has no boundary
-crossing restrictions, pass 0 for alloc; passing 4096 says memory allocated
-from this pool must not cross 4KByte boundaries.
-
-::
-
-	void *
-	dma_pool_zalloc(struct dma_pool *pool, gfp_t mem_flags,
-		        dma_addr_t *handle)
-
-Wraps dma_pool_alloc() and also zeroes the returned memory if the
-allocation attempt succeeded.
-
-
-::
-
-	void *
-	dma_pool_alloc(struct dma_pool *pool, gfp_t gfp_flags,
-		       dma_addr_t *dma_handle);
-
-This allocates memory from the pool; the returned memory will meet the
-size and alignment requirements specified at creation time.  Pass
-GFP_ATOMIC to prevent blocking, or if it's permitted (not
-in_interrupt, not holding SMP locks), pass GFP_KERNEL to allow
-blocking.  Like dma_alloc_coherent(), this returns two values:  an
-address usable by the CPU, and the DMA address usable by the pool's
-device.
-
-::
-
-	void
-	dma_pool_free(struct dma_pool *pool, void *vaddr,
-		      dma_addr_t addr);
-
-This puts memory back into the pool.  The pool is what was passed to
-dma_pool_alloc(); the CPU (vaddr) and DMA addresses are what
-were returned when that routine allocated the memory being freed.
-
-::
-
-	void
-	dma_pool_destroy(struct dma_pool *pool);
-
-dma_pool_destroy() frees the resources of the pool.  It must be
-called in a context which can sleep.  Make sure you've freed all allocated
-memory back to the pool before you destroy it.
+.. kernel-doc:: include/linux/dmapool.h
 
 
 Part Ic - DMA addressing limitations
diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index a61766328ac06..50cfc78429304 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -91,14 +91,6 @@ Memory pools
 .. kernel-doc:: mm/mempool.c
    :export:
 
-DMA pools
-=========
-
-.. kernel-doc:: mm/dmapool.c
-   :export:
-
-.. kernel-doc:: include/linux/dmapool.h
-
 More Memory Management Functions
 ================================
 
-- 
2.49.0

