Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F9286430
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871036; cv=none; b=m3El5RExg/q3Je1kBAuBAtNMCIvHlLhDKgdB6h2kk8RLZoerc/HMlzkchHdS3cUNRBGkZX5M0VQ6TERTdXV5CfsyAT7ihrcM6FPW/NInKhbU3N423g9bEmQ3oWuXZMtI2e1qshvvmmbCGljWmKagm0eKjXrIHTL2jVhVNyiMHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871036; c=relaxed/simple;
	bh=ls52+XrvwO/234TukpAvew2O69meLJpK2+6xI0hEEfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=io/9C7opFxhRzp+bDwWoZ2TPSbc9Bbez4FPgTHSL4CWg27KlZFPtMdGXT2dmLbB++afLp/mQMVUqj6biAAcFl4a656vrE3jLfmF5qpe6+RgKYRqnTw7WljCz9epwZvwvbQKNaz3ckZzQkr6+0fBA4AmsX9bSCe0M7ycClmzFtsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=b+5Q91nP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="b+5Q91nP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167afeso24619335ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751871034; x=1752475834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJCrtQpscf7JigPaIY2b7xTm+tWVRMcaJVrpHVo23Lg=;
        b=b+5Q91nPBQWTJvIg/RM8snOHNnHpph0Inl1kCuZRedVF3VT2VC+Ufkk73pHkvshwNn
         KmEHWH3XafI6BHoD222KeD/9bbw55wZEVOKZCYI+zcGoACktQK9+o8snVlrOCBI0Vj80
         NcgPTt0clkEB5+mwNhxojCrwxKCKDx9p+k/L2tyVmqXc3Ry2m6FHwe+8FzLvqmsrc/IX
         AroBlwFX2zTwm9j2C4VY2BEhk9OfRqb+7HAJaIcVnKV2lyJgPBI2DJwlrdNnwqDBlbvb
         sHZhBa2hGDpD6O1YTpKNRGL/kPaJgpTJz0+Q8bDb+4OE2GpesTeN+LFtBWauNoDgZ4Ly
         v4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871034; x=1752475834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJCrtQpscf7JigPaIY2b7xTm+tWVRMcaJVrpHVo23Lg=;
        b=TMKf21jEf6B4PLmgU+80jncJ8LzMjDflUZcJgl2N6yRpJrK7j4ivwtU3Pa8ba6LoeQ
         RQS4aKIWz58TgEAMWrot9YunkLDMt3T2bKt9TSMKCUgbQ4aznUDglv/bEUO0rD885HUf
         lqNHxThwyf86OD0qoMs6hmeCJh6EI1iS1xcBdp/wyTKeWK0KjpIUF8h5WAr7FpQdn810
         jmIijtwwLFlzdggqoBbZMHnA8oEwCWTe1ZAvefSkgIJ/eJDt91nkTGKjonMnvs0IuuGr
         Sn1hBULIwd8RHctiAjPAS1H3NbN0FfhYESklY29s5z4fiDxNg6zOP5+YvoV+oU/l3ijN
         do2g==
X-Forwarded-Encrypted: i=1; AJvYcCVjjZzGUoMIu+2V9emOVC0Qcy7xj+zOUIWK44G5a5t5SDKffRGe1QdMvQwiJq8f/bskg0+pF9E8yckvLx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvyP+5g7UspPQztEVkD7ut/2jCzjv25zPcK/H3vjFtnOMEjh7/
	cC1Y6Br6sFks20Dna9ZbedWE/y9YDSruLEIVxuv1i7Y1VS7UOEeYuUnfrc6UBd6sQwQ=
X-Gm-Gg: ASbGncuITrYroM38mo9Z7GdOPA2YT/9nhuiGJPkPWxeflw4YZHIOYaAlE9RlRrRW2ge
	e1uIz0cPEofEvkNNA03fGkaMFbFop1kgSLOZCBwhsjaDBIe/DQf3QHJbpKTp/5Cf16JbWPlU7Hz
	OUl/zG78ndB0UE/gfVD3MWLrH3OGNEsMbdE6CYEAYw4sGX6EhLX9DxYvfVMQpgvTuZWsi7zHK0q
	ddPukKoXQh79Vb+GDnyveyKNjeM+OqPL6oPfkpm2zTyALgGAlCD5iRogL/uV1eAyqDmRFLk5IeR
	6FaNLAtQypfnzQIDDOEQ8SKrfD7yzMCTVniXsdN+xBNsVmE1jsTxp7X7zBDuev1P9WGh/Ahlp64
	aO8rD/14m1THXQjTKcU2hZQw=
X-Google-Smtp-Source: AGHT+IGh2/KBCNysHt7plUCFAgV1uGLkxyUZAwvcA0Vu+vwTRDqonN+b71HZNp4xw4YPISfBYqMzdA==
X-Received: by 2002:a17:902:e5d0:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-23c875e4d89mr159552995ad.53.1751871034310;
        Sun, 06 Jul 2025 23:50:34 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a1aasm77377635ad.15.2025.07.06.23.50.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 23:50:34 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	jgg@ziepe.ca,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v3 5/5] vfio/type1: optimize vfio_unpin_pages_remote()
Date: Mon,  7 Jul 2025 14:49:50 +0800
Message-ID: <20250707064950.72048-6-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707064950.72048-1-lizhe.67@bytedance.com>
References: <20250707064950.72048-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

When vfio_unpin_pages_remote() is called with a range of addresses that
includes large folios, the function currently performs individual
put_pfn() operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of pages.

It would be very rare for reserved PFNs and non reserved will to be mixed
within the same range. So this patch utilizes the has_rsvd variable
introduced in the previous patch to determine whether batch put_pfn()
operations can be performed. Moreover, compared to put_pfn(),
unpin_user_page_range_dirty_lock() is capable of handling large folio
scenarios more efficiently.

The performance test results for completing the 16G VFIO IOMMU DMA
unmapping are as follows.

Base(v6.16-rc4):
./vfio-pci-mem-dma-map 0000:03:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO UNMAP DMA in 0.135 s (118.6 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO UNMAP DMA in 0.312 s (51.3 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO UNMAP DMA in 0.136 s (117.3 GB/s)

With this patchset:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO UNMAP DMA in 0.045 s (357.0 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO UNMAP DMA in 0.288 s (55.6 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO UNMAP DMA in 0.045 s (353.9 GB/s)

For large folio, we achieve an over 66% performance improvement in
the VFIO UNMAP DMA item. For small folios, the performance test
results appear to show a slight improvement.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 13c5667d431c..208576bd5ac3 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -792,17 +792,29 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 	return pinned;
 }
 
+static inline void put_valid_unreserved_pfns(unsigned long start_pfn,
+		unsigned long npage, int prot)
+{
+	unpin_user_page_range_dirty_lock(pfn_to_page(start_pfn), npage,
+					 prot & IOMMU_WRITE);
+}
+
 static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    unsigned long pfn, unsigned long npage,
 				    bool do_accounting)
 {
 	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
-	long i;
 
-	for (i = 0; i < npage; i++)
-		if (put_pfn(pfn++, dma->prot))
-			unlocked++;
+	if (dma->has_rsvd) {
+		unsigned long i;
 
+		for (i = 0; i < npage; i++)
+			if (put_pfn(pfn++, dma->prot))
+				unlocked++;
+	} else {
+		put_valid_unreserved_pfns(pfn, npage, dma->prot);
+		unlocked = npage;
+	}
 	if (do_accounting)
 		vfio_lock_acct(dma, locked - unlocked, true);
 
-- 
2.20.1

