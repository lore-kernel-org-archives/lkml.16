Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80841442E8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531488; cv=none; b=UT12T8CETxcivV1V8+PFj1VxFGsrerqi72+U9VOprgQ26zrpkZ9Yn/kpigE4aJCAD7WcKSZLBB2Wlw1NbKGR7oPLtejmjrZDMw4OsHZgy7XEK3TzaasHtDu6A7cTaR9sYDyAT9OkhSr09HNC9ygxFW2HBwiTTfIlTBmkeWCmOwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531488; c=relaxed/simple;
	bh=01hdTf8O0DdEHladn6IEz6BWtaQbTZBfrj2t0P0Wg/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J41zbqHsEsBV42Z4OfWX52KmsPs+Ek9SxV9KZbHtnqNWED42h3nh2BEDCerdfZELFU0o8oTsqLwXwIAartGh29yK7G5SnM3peP7gzq2KIf7g4BqyFzPfrlZD/AGmJ+Z4fSIe+LW8Q6elwAcb+6ei16SzZ/3IFsuae9eHqTn6ER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=k4/pTVwY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="k4/pTVwY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2349f096605so59801595ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 21:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749531486; x=1750136286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HE/lloDxCFBh4QBDkfEJkgJnUlMqb+VAfBzAqcIIAtI=;
        b=k4/pTVwY9YuynNHEGeIWzeLtmlkZWIOxyMqTjm0WcNWXYM6WeARVm5ZjCanERzG/QE
         Q2ZskmfE2d7dm4kUsOfm1W8JGum0oKQ51mGKQRNUqHcEdurlXYCi9v66/Mrbl08RMvPB
         NxMiqM9QTfffbBpSINEoEJ4Qixtw91jel6SgoOMjcd6CINMfRuQAwBHCnSpFhJyWHMTd
         YsvkmW6gLwSK3J/mdGz+6FQAqdfLTj+m14T2vLKJzxEkgNAMZ8cM4paImMbLfpKlvSKe
         fDC9LY/nniqCBHj8nE6RR+Nw81Wa5GABGQtk4MoiBFYE26rDG7HESXzuToqN+bd9JS+C
         QuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531486; x=1750136286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HE/lloDxCFBh4QBDkfEJkgJnUlMqb+VAfBzAqcIIAtI=;
        b=dHK5tNCMNFvdT62OpyRAfwVHZZdF4WMHdNaqj1JKS3F9JNUmqSIzBAHQW2Hc8VtcXE
         0+FfN48RzJMoqKui4rW4Jhmo1XvL8FvQKOJbA8D9HysnV3KzDlEQPeJKp313RqJ99edj
         Uchdu2TfjftLnYC3fxBBxTnF9tPbBzNMEO1KD1vmS2EGpL0rXG2+y3eYSqIN5ohlRTAB
         xUmuGcwOwqOBHmd98s0CXS248Wc5pgfTZpomXDPQFihYcFbu4a6TJ/8OnthkPqxl40cc
         G1KFUtxgeojx/uVEiebf7/edKEffd1JXhaZDi3OK9KL9AAnkOlIpdKG7Ic83/UTSiwJM
         2JSw==
X-Forwarded-Encrypted: i=1; AJvYcCUQADUmdseKOrcsvtj+e/3xulcFvxnG1mxWAo+jMyv5isc4yAUvBRoTiqXgTPos4B1+XYfY6owpRruYg6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1FslLY5tVz+3MFMb8dN5IeLg/HEzk+3KM9X2lQHu+Ox+DQm8
	P4IPEzJz36HW1wozWzGq6QGNQO+LlLOFf2+qe8KoEsFBiNVren+pwWozucdamqPt0ttxPIO48U8
	YlAVM
X-Gm-Gg: ASbGncvp7rVQ+GfFBrXNLqZdWvI/D1AJO23iktb7Gql7M18ajwtiU2ojhfWopN8FEIu
	E/Dns5NQxy1QdkJrmyMTOE4Jlq0733V0qi5Cz4o+bq3N9nOR/8DzqRF8EdDk+YfXMRmRKxIoFXu
	33E384CuL44qsuX8qVpJwg7Qo+oggDCLw3OuKVr1TwVdjJrviTHGKlGZm0OqF0gkQZicye9tIZM
	K+oVu2t6Nzicar7NHLJ7bUL9rh/XP0PoQKI5TYbuzWMWd2ze83RmJfH3hQi7DWJZlMF+PSCnomd
	YcNlEMcv+B7CGtujPmZ/oBavBSmFW5jWsnFGLoneHj21k4ynUr7MmnWU+Zj6s4LRvxryan0p1vB
	0NfwioVJEx/Za
X-Google-Smtp-Source: AGHT+IFivQkyqAO2dh5O2UoBGDcVLCQlm9QDKUwL52j1PsV1wYGm/l7MlPEMGV7J6kWpBVrpS1Nt/g==
X-Received: by 2002:a17:903:1247:b0:22e:3c2:d477 with SMTP id d9443c01a7336-23601d25c36mr248229945ad.25.1749531486236;
        Mon, 09 Jun 2025 21:58:06 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059besm62721975ad.174.2025.06.09.21.58.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Jun 2025 21:58:05 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [RFC v2] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Tue, 10 Jun 2025 12:57:53 +0800
Message-ID: <20250610045753.6405-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

This patch is based on patch 'vfio/type1: optimize vfio_pin_pages_remote()
for large folios'[1].

When vfio_unpin_pages_remote() is called with a range of addresses that
includes large folios, the function currently performs individual
put_pfn() operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of pages.

This patch optimize this process by batching the put_pfn() operations.

The performance test results, based on v6.15, for completing the 16G VFIO
IOMMU DMA unmapping, obtained through unit test[2] with slight
modifications[3], are as follows.

Base(v6.15):
./vfio-pci-mem-dma-map 0000:03:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.048 s (331.3 GB/s)
VFIO UNMAP DMA in 0.138 s (116.1 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.281 s (57.0 GB/s)
VFIO UNMAP DMA in 0.313 s (51.1 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.053 s (301.2 GB/s)
VFIO UNMAP DMA in 0.139 s (115.2 GB/s)

Map[1] + This patches:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.028 s (578.4 GB/s)
VFIO UNMAP DMA in 0.049 s (324.8 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.293 s (54.6 GB/s)
VFIO UNMAP DMA in 0.308 s (51.9 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.032 s (494.5 GB/s)
VFIO UNMAP DMA in 0.050 s (322.8 GB/s)

For large folio, we achieve an approximate 64% performance improvement
in the VFIO UNMAP DMA item. For small folios, the performance test
results appear to show no significant changes.

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
[2]: https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c
[3]: https://lore.kernel.org/all/20250610031013.98556-1-lizhe.67@bytedance.com/

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
Changelogs:

v1->v2:
- Refactor the implementation of the optimized code

v1 patch: https://lore.kernel.org/all/20250605124923.21896-1-lizhe.67@bytedance.com/

 drivers/vfio/vfio_iommu_type1.c | 53 +++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 28ee4b8d39ae..2f6c0074d7b3 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -469,17 +469,28 @@ static bool is_invalid_reserved_pfn(unsigned long pfn)
 	return true;
 }
 
-static int put_pfn(unsigned long pfn, int prot)
+static inline void _put_pfns(struct page *page, int npages, int prot)
 {
-	if (!is_invalid_reserved_pfn(pfn)) {
-		struct page *page = pfn_to_page(pfn);
+	unpin_user_page_range_dirty_lock(page, npages, prot & IOMMU_WRITE);
+}
 
-		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
-		return 1;
+/*
+ * The caller must ensure that these npages PFNs belong to the same folio.
+ */
+static inline int put_pfns(unsigned long pfn, int npages, int prot)
+{
+	if (!is_invalid_reserved_pfn(pfn)) {
+		_put_pfns(pfn_to_page(pfn), npages, prot);
+		return npages;
 	}
 	return 0;
 }
 
+static inline int put_pfn(unsigned long pfn, int prot)
+{
+	return put_pfns(pfn, 1, prot);
+}
+
 #define VFIO_BATCH_MAX_CAPACITY (PAGE_SIZE / sizeof(struct page *))
 
 static void __vfio_batch_init(struct vfio_batch *batch, bool single)
@@ -805,15 +816,33 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    unsigned long pfn, unsigned long npage,
 				    bool do_accounting)
 {
-	long unlocked = 0, locked = 0;
-	long i;
+	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
 
-	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
-		if (put_pfn(pfn++, dma->prot)) {
-			unlocked++;
-			if (vfio_find_vpfn(dma, iova))
-				locked++;
+	while (npage) {
+		struct folio *folio;
+		struct page *page;
+		long step = 1;
+
+		if (is_invalid_reserved_pfn(pfn))
+			goto next;
+
+		page = pfn_to_page(pfn);
+		folio = page_folio(page);
+
+		if (!folio_test_large(folio)) {
+			_put_pfns(page, 1, dma->prot);
+		} else {
+			step = min_t(long, npage,
+				folio_nr_pages(folio) -
+				folio_page_idx(folio, page));
+			_put_pfns(page, step, dma->prot);
 		}
+
+		unlocked += step;
+next:
+		pfn += step;
+		iova += PAGE_SIZE * step;
+		npage -= step;
 	}
 
 	if (do_accounting)
-- 
2.20.1

