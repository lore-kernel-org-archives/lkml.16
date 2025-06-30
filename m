Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93421D581
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268405; cv=none; b=hYO5BhtbUwFMVttb3d+zp6J0TeAb34qi6FNp18qk7/WRY5W7Ee4P22b/EfdkYXpKKODZblon/OqouucadtUHpk8oomSDRoo97eTGUw/5KJzLlJe5iJB6x/G5oeSN5nJbSLSsR68wrn792100GPt+4LPu1KrR9rCMxt2wa0zWCxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268405; c=relaxed/simple;
	bh=O4w6fa0j1NT8Z5/eHPCKeH/P1kt8Jwrp4C3VJaFngos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuFShn42X//mL418nvP0tkm7zy5XIRqys8LA42eVTm+g35COyWa8jHMyV2Tj1eNUzRZBFQwEq7nrLZe5eCAHf0QkkoCKlt/LSUogQsHEhu3Z04mqHz+wLmfPaaDE20DvlALZLSrJzUsOyHD3VNGf7Nv/jh5Ww9eR9HdQWFQdFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YfrrV2jK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YfrrV2jK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2349f096605so17381515ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751268403; x=1751873203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTkBlAlBXrTrE11XYZHesr9ptEyGqngcq3YAn3h6NUs=;
        b=YfrrV2jKJnmPUCBB/HDP1QsWE3FBK6X26uKu2+Sog+R7C+6qoRYoyHm2xQalBVscus
         Ruv4OFrGgKRlUCM3yc+/wAJj6Ie0rkClfTejH6tO0LDX62X9UhJcyWk6u84iPYq2H2fj
         jPi/mWI65EpoBDFIu478cxNWWHkLNYEAsSDIpXm2b31txUgn2K0Ft0ubOXzY16oN7VSI
         GGGxl6gyMWEpomzvIAojRn4195YJEoWpDtkaBBstGVmUwzB6nPLYnD5aKZLNfMYjoGex
         BirGeLGPPGiVXPhY1fb1tuuYXpDk4kekeAYongKMVb/YYj+eBtSkMbzP7oawjG3+SeYJ
         U6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751268403; x=1751873203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTkBlAlBXrTrE11XYZHesr9ptEyGqngcq3YAn3h6NUs=;
        b=FVt+cbiMKOBzeXxOdrFk45mM+f/Clf1zIfTdMCVQbWbeyFrhKiUYRWgc53/H7NtEjR
         vZ1/g7yZHgjIfy7MQzYX8L70p6LYEhH5/H5JVvMBvJwvpSjHQ/Au4jCYRu+V512fLFdp
         fL5VNacseOcJj0223Wz2isT5tu12/tIVZpNhlKepxHd5NRnbiGuNi4T9q4hNVG/BIX0a
         qro3UmzzJ9TcQXplDpiB1TLuZ6NKmMXCD4k+DIXvVYJoHZL7WnZwh09EPqd9GPp1MOX2
         fIpFoQqj6qP5/RlKf24fLIoZVMSTDNRapAU95Pq7MUlESQ5BECv6wEMF9urE7Egei+b7
         l1nA==
X-Forwarded-Encrypted: i=1; AJvYcCWPFaBUwP0Rv/gUPT18OCvSmD4QMkIOfLFCF9WLCZ7SsYuhwr8WPRFDYPZhqE2yLX5l1BfJ3SQcYfM2zMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Tbn8PseJ+3jMQqqndkEcV2d7aij4evfkduAGSNkv87SYrCIZ
	H+mh3EiZx9GwXPtBex+IWH+nOHKsNEjt8hXhg23DRBdpmfceUXudqTjtvXrXOOMiX7Q=
X-Gm-Gg: ASbGncukkm7E9GT1L7aqD2IrGtJQCwjTZwc5j/nS1L685ZgM7bG7ZQnQsoSIDzSVgZM
	CxlsPsEUPTWWJvY8kmoBlQxh0b+wfVOwVI0hwsFANO+qpeE7gd3gE5wtJ19L2mS0ZgJlM2jcvsO
	dDbCoYWxAMkUQHLlDCkuW+0X3n+T4J4PlIt3J2bImWHjwmRDQ8g/M+kLJZINyEXkUrZa7vYynFf
	udBmhMRtocr5EliBxf6ajozpoAdJJ4mN2i/dMl7khY1jCheDJwJJ4iJE8Q9/Dc6G6JlLg0p6EMF
	vc5S4RQUa5guv/P4KDGWSnopzYuWHUPxYckqpEb0k+4B70hVk7hXVwPS7AxMJCWuR+A7awkNmOF
	ZCfOvTK2UBXD4BQ==
X-Google-Smtp-Source: AGHT+IFBCqGaXb2wsjiFpr47TvqlYdO9gHIGqoEwdx+sQqMU1WhGJBEpSCh+DRjSvJWY8WhE0RQaSQ==
X-Received: by 2002:a17:902:ce8b:b0:224:23be:c569 with SMTP id d9443c01a7336-23ac45c1d32mr207282295ad.22.1751268403012;
        Mon, 30 Jun 2025 00:26:43 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm77237555ad.62.2025.06.30.00.26.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 00:26:42 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	jgg@ziepe.ca,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [PATCH 4/4] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Mon, 30 Jun 2025 15:25:18 +0800
Message-ID: <20250630072518.31846-5-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250630072518.31846-1-lizhe.67@bytedance.com>
References: <20250630072518.31846-1-lizhe.67@bytedance.com>
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
VFIO UNMAP DMA in 0.045 s (357.6 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO UNMAP DMA in 0.288 s (55.6 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO UNMAP DMA in 0.045 s (352.9 GB/s)

For large folio, we achieve an over 66% performance improvement in
the VFIO UNMAP DMA item. For small folios, the performance test
results appear to show no significant changes.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index a02bc340c112..7cacfb2cefe3 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -802,17 +802,29 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
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
+		long i;
 
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

