Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B8E2D1F7C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772380; cv=none; b=Hr4QNtwcwfYLdZuZGHlqF+Pi7wn9NE1G8o2CRFeG7jLOdciAHqy+DacRtB7kFptk2N0SX+lWYg5TYu9nf3z1cUdyEc8VkBcu7No1aVYot3RL7qCaOH+NdF7JbzcVRCGKmqN++uskaY7GJ5UPi2JL2mqqJocQoXRnsaP7kT8+VDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772380; c=relaxed/simple;
	bh=j/lxvBE0W8RtTSwNWKrFB81pW4iq0UIccw1Ghb9PK6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8GKRL9u3Vcg0Qc5b+3CkyuhYaaFx/GUuWW2p7w6mHHtHOkpcMm22LoQ6UhHlJftcq0rh2v+Hjcbz78NFr549oDf6eT+ruC7uKzii++bMHgvIKeoQ07aH4qqm+EbaIJbE7BPPYihQ1v8qOmcOvL8hX0HEoGIYhsALy7G9o8ImHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SLNOunRH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SLNOunRH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45360a81885so1931405e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772374; x=1751377174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMoobju51S3yheRJ4nJb50lwjewYooD5+oD7p0lsIPI=;
        b=SLNOunRHP6SCuVgfQ8GbZUpNZiUJWrBqvSIladPPuo2blIty134Qs2A6ARfTcZuv0Q
         tbDTfBeXYyNeGU2O+8CWtQ+zseQDkpnXBIk8XUkhoUlnfkuA8i1Ze7cE+VDZi2m+ioTO
         FDYRM6AZh4XO+ZaW175gWY/V6R+EcpOx2C4o39KKcEbslSmJFot5GO0GbzYvl8Wfckhk
         YNgBW9PTbrFCLiM1m5rc3uxaCiGbIVn8kxq17IF7ASL39M+Bzu8m4p5ChpEZGtE90bUP
         9YDmYRKWdyYg4Ax7Xzfy2AiYx66KlhKXLUs9/mcoq95Krlx6lCmaDDIMYOqsDoF7peve
         +RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772374; x=1751377174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMoobju51S3yheRJ4nJb50lwjewYooD5+oD7p0lsIPI=;
        b=Jp543XmBKm4NjYYrfuGC6JTVbcZ0ZLHUpim9ihQXBh3j8/yL6OSCzPuH4XiZv8ZDhk
         JEluXf11bU1r2JLZywuM3Ajp3/0sbRt/W88ESqRvy8f0Gy+HPps+otc0fXNfAQla3C2V
         pc2yBAORkaiCM9Tou3J+VVh/JDPYji9GI+njPMx+QYipibKItsUf/Qpg0bYzB/fq3L2q
         gbzbIHf1pwjmhLhLZ1b/lqRqo2CO3haUkhGYc89D1aVwSWE2RpKxr2zsjdmjcjXVrfs5
         l0DmISfgS33CnRB9+y8ce2zM0BeHJOfYeJPK9WP1FufhoQiPmULFIg06YbFbTbASaG40
         1q9w==
X-Forwarded-Encrypted: i=1; AJvYcCWo5huDn6B/I3m83+4XzynyL0UEz1MhgWoa4iK3TonRU/EBlz7fALK+eLLlmcmP/cOGmd8AqapRjVn8a1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAE24rlgIwr+pJxFsuDAmKNF6TCWw0B0iQmQlTyM42tiIN+CQX
	VWVanhK3Da4VC8N9xGNDBEaFgQePUzywJV5jWmUZsPx7910TH11OJ1YlPYmPSJbVvag=
X-Gm-Gg: ASbGncs98/uDrXeEcmRs3kOQPexppWyUvG4vQLn+bTq2IsXwnGToWR1E2HxzhxdXonS
	gFc6S1lgZqhqCsX415eFFpnjOYCsVPSNsSGzjG0cSZkEW3K/t0MD2apyqiql8FyRXiPasQMVciN
	KWMDFXv/vhJF1D31zeL+48JpFiVCCElPEMTuFIdOl/Z34hX1v7x0PAPZgPpTELf/1WBlZ6MkYtj
	v473az4VYwTb7axFlbumjAyXE+DbL4932tivZmPnT1HHILftbzpzQWBUFvL/oTAX/errDPhpYrI
	4fQRlxVxK/8vyGr+yym6OyDi/HHO0nIQt7xFCUi+UMgXDRg8jKzwDSAriSbFWWdVsNLuJRPl/EH
	e1898ywCafKM5s0x5K7+Gk6usk/DE0kbATUXbrYBGRNwuqD3JSGoe
X-Google-Smtp-Source: AGHT+IEJyYo9lnu2Mk5wM3vEKd7mlfp5WCsbwymCeOMIaa9JZYjSHQ3akdWqQqS/IC1aMCHvKzNu3w==
X-Received: by 2002:a05:600c:4747:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-453659ca904mr62554965e9.9.1750772374485;
        Tue, 24 Jun 2025 06:39:34 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8e19sm175941015e9.21.2025.06.24.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:34 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 5/8] docs: dma-api: remove duplicate description of the DMA pool API
Date: Tue, 24 Jun 2025 15:39:20 +0200
Message-ID: <20250624133923.1140421-6-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624133923.1140421-1-ptesarik@suse.com>
References: <20250624133923.1140421-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA pool API is documented in Memory Management APIs. Do not duplicate
it in DMA API documentation.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 62 +-----------------------------
 Documentation/core-api/mm-api.rst  |  2 +
 2 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 3e89e3b0ecfd..f7fddaf7510c 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -83,66 +83,8 @@ much like a struct kmem_cache, except that they use the DMA-coherent allocator,
 not __get_free_pages().  Also, they understand common hardware constraints
 for alignment, like queue heads needing to be aligned on N-byte boundaries.
 
-
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
+See :ref:`Documentation/core-api/mm-api.rst <dma_pools>` for a detailed
+description of the DMA pools API.
 
 
 Part Ic - DMA addressing limitations
diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index a61766328ac0..de0bab6e3fdd 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -91,6 +91,8 @@ Memory pools
 .. kernel-doc:: mm/mempool.c
    :export:
 
+.. _dma_pools:
+
 DMA pools
 =========
 
-- 
2.49.0

