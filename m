Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B631EF39E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127784; cv=none; b=kCSt2xVONQSaV8CtDti2jYfRrBG3a0Igks+61MMz8Mf5A4gYUlkvyxryS8rGWXz/1nqV9h6ZhfuiZyCFaNk4R8W1ZIsHMUYuUsHAxS/dO4aYywso3C+rWRkkenlnZHivQ+h+jSMv7/Ts4QkAC8Xw33TZhqI1U5Sehrs/sMYa7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127784; c=relaxed/simple;
	bh=vmbVw2wsurXb9j40f+2hXw8upSBNZIO88QPl82+zeq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cX5kR/Rh1n5745+1km0F6hAbv58gZEnqi5zdjSqwLfT/yG/cgaOs+3IH8OWb0pi1dRXog9KUK+973+ZrIj0q4I0D0RNO4t9sCLqUkUHwRht9ARqRrI6aL+McPX/iZMs+npsDUtkRmTBybVOCeJXHkMSh8tzexHbC5EC2Mk7dp/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bTm9LWdG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bTm9LWdG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23035b3edf1so8696095ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749127782; x=1749732582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a69UoxQiniJ12TTGhKY8q3U2LANJbh8OmrhxQdK1ePg=;
        b=bTm9LWdG/Qn9zI6oiaRxZZJkL6O8sDrArBdcRk0j98xrCc/kPlmmF0OHEScVWjpUnv
         BMkjlWWBmsx2A2xxiFga2zguTBymy2PNH13YzUepvipZ7M0KXD683A/9ks3MNMMp0Vnx
         JfkNdcRFACt45DjLXZAL2dojzLfb8aGc4TQGJHdecfU9ZGomD9muNjHN1JbThapFZjL1
         yyIQ5/TPfHm6cLDBWG+hXmvo1NHcZebrJng4pD6oMSwGUErbPKyxsgJWaPRcodeKmTBp
         v3kF61W3HHa7zXA+07LpkV4J/uYo8UDLd8Dm8gV+NFQbiX15cYG0vd/uPYophMLMqoDp
         KdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127782; x=1749732582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a69UoxQiniJ12TTGhKY8q3U2LANJbh8OmrhxQdK1ePg=;
        b=hsos1Q0Y7tTRHqxdvJoB+ZWw9LeDIiRZg5S+Pu/3MaUSJO64nmYs0LyDxyrR7M6b+j
         FsCSGjRK3xyfe7vHjMQ1hUIYFKvyHEv93X0ZG//2D0gBaej0VZBgIhARpiH5C1wrBLze
         PXVu+8XEH3KfXcMHAbpgjhKBU5dmMWydtsVoZvfnhlN++dXKEcC8259zRrXNWWCHhNaE
         Z96MA5UHHQwPQx/4hA21Y6dXUOWBduPu7SxVjsI3bt/3YWP98UlgG0Fpd5064xA6mdlA
         Cee+0/ebZpREcaMAdErTvUc25A6XZQpBz/jhUYzDdwfm/+RTimb7hf8NnwPddBu1s5r5
         1dEw==
X-Forwarded-Encrypted: i=1; AJvYcCUCED3hVcMgnMTH+16gHOeeSQU1HbQZ9X0ttQeRSRwaLPx/afjmMpA2F58rDUE4lyCDhdhFWwQRG+rvW4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMkRqY4K2/H8fN97qpP7c+K2X4XCC7dLgVDxd4dDh6pP6SjAcv
	7OIZ+42nI2+DkLxQ7Ws6ou0fRhjkGn+DyK2q6ugUc238lnlT0gBOzG6WfeEb/8MlVoH2v38UH5I
	M2EUo
X-Gm-Gg: ASbGncvDeVrMw43m61LqIoGfjArtV/VCWQnm214aKCYV1qmRJkgrBnZq5NAtOqrbUIO
	m4p5RsIM/Eo9YV2N6zRxGn0DWfpKQFEVmkpSDjTK8GUC7lJ6wzSh+UzqPSpAhfZkSnVJXafWb6I
	OyyUzjuP0HoIuGK/keKOpThAZkVF/RFjiJAaWOXhlob5/vHh1a9YLwzNcQBJTPP0X65uiMbXT4T
	hc1HkcRbzpGHvx8qK/YhXwH7lAGrzsNqVHiSdqE+Oy6lGWQ0Ma7kSQsCRy9N+OEXaWuk2okWAn/
	chKI/VdkCcRYbuSs9drY1bQkfDESuaCGrLCFDsKGjrc7RHoXZIzErm9uucgVkbn05NM9lORd6TE
	o6oU=
X-Google-Smtp-Source: AGHT+IG1C2j2YafQGfRMV/ciHY4JTVlIZs2dvU3z8kWhKzdkG0PBX2Mp8lN+qS+9FVIWYjcMQwU5iw==
X-Received: by 2002:a17:902:ec85:b0:235:eb8d:801b with SMTP id d9443c01a7336-235eb8d8434mr71936225ad.32.1749127781995;
        Thu, 05 Jun 2025 05:49:41 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21f57sm119043045ad.249.2025.06.05.05.49.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Jun 2025 05:49:41 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [RFC] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Thu,  5 Jun 2025 20:49:23 +0800
Message-ID: <20250605124923.21896-1-lizhe.67@bytedance.com>
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

The performance test results, based on v6.15, for completing the 8G VFIO
IOMMU DMA unmapping, obtained through trace-cmd, are as follows. In this
case, the 8G virtual address space has been separately mapped to small
folio and physical memory using hugetlbfs with pagesize=2M. For large
folio, we achieve an approximate 66% performance improvement. However,
for small folios, there is an approximate 11% performance degradation.

Before this patch:

    hugetlbfs with pagesize=2M:
    funcgraph_entry:      # 94413.092 us |  vfio_unmap_unpin();

    small folio:
    funcgraph_entry:      # 118273.331 us |  vfio_unmap_unpin();

After this patch:

    hugetlbfs with pagesize=2M:
    funcgraph_entry:      # 31260.124 us |  vfio_unmap_unpin();

    small folio:
    funcgraph_entry:      # 131945.796 us |  vfio_unmap_unpin();

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 58 ++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 28ee4b8d39ae..9d3ee0f1b298 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -469,17 +469,24 @@ static bool is_invalid_reserved_pfn(unsigned long pfn)
 	return true;
 }
 
-static int put_pfn(unsigned long pfn, int prot)
+/*
+ * The caller must ensure that these npages PFNs belong to the same folio.
+ */
+static int put_pfns(unsigned long pfn, int prot, int npages)
 {
 	if (!is_invalid_reserved_pfn(pfn)) {
-		struct page *page = pfn_to_page(pfn);
-
-		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
-		return 1;
+		unpin_user_page_range_dirty_lock(pfn_to_page(pfn),
+				npages, prot & IOMMU_WRITE);
+		return npages;
 	}
 	return 0;
 }
 
+static int put_pfn(unsigned long pfn, int prot)
+{
+	return put_pfns(pfn, prot, 1);
+}
+
 #define VFIO_BATCH_MAX_CAPACITY (PAGE_SIZE / sizeof(struct page *))
 
 static void __vfio_batch_init(struct vfio_batch *batch, bool single)
@@ -801,19 +808,48 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 	return pinned;
 }
 
+static long get_step(unsigned long pfn, unsigned long npage)
+{
+	struct folio *folio;
+	struct page *page;
+
+	if (is_invalid_reserved_pfn(pfn))
+		return 1;
+
+	page = pfn_to_page(pfn);
+	folio = page_folio(page);
+
+	if (!folio_test_large(folio))
+		return 1;
+
+	/*
+	 * The precondition for doing this here is that pfn is contiguous
+	 */
+	return min_t(long, npage,
+			folio_nr_pages(folio) - folio_page_idx(folio, page));
+}
+
 static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    unsigned long pfn, unsigned long npage,
 				    bool do_accounting)
 {
 	long unlocked = 0, locked = 0;
-	long i;
 
-	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
-		if (put_pfn(pfn++, dma->prot)) {
-			unlocked++;
-			if (vfio_find_vpfn(dma, iova))
-				locked++;
+	while (npage) {
+		long step = get_step(pfn, npage);
+
+		/*
+		 * Although the third parameter of put_pfns() is of type int,
+		 * the value of step here will not exceed the range that int
+		 * can represent. Therefore, it is safe to pass step.
+		 */
+		if (put_pfns(pfn, dma->prot, step)) {
+			unlocked += step;
+			locked += vpfn_pages(dma, iova, step);
 		}
+		pfn += step;
+		iova += PAGE_SIZE * step;
+		npage -= step;
 	}
 
 	if (do_accounting)
-- 
2.20.1

