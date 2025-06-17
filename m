Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29B23B608
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750133946; cv=none; b=FnJoD+c21f8T1GWP5pPUG3C6v6t3ExFhIhtEnDk9QbiY0x9FOCSC7PJ6Y4kyzQ4CjB4SRswkookCUhXnjvLcG3Fbhab6gTQ9+rFQW+5gN3qOg/C0lIiJfJd8NhftqS1xLnjOMTgtKfru8bGJgijxRZRGRM4D+Djud78KP4MqXLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750133946; c=relaxed/simple;
	bh=9yTwG677xHIKywB9F1vTvU6hKUvXiGxwJv/De0T4VnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkunPd7PjEBwF2gX9URX/5oAh/+WEMI13KbUZDW6IHk4LafN/Vkcsi+Pdj+gSkdQzuhYR0iMR21UUpQyIW66PQ8h09rii4FGd3tF+lSpdPFM1Dt3AhFbq7vYR4C8LEPdodsUqObRqAoMMP4nEQdSZnjw8ef6KqVvFb8k91pFvGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Q2gUkw3r; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Q2gUkw3r"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2352400344aso47838635ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750133943; x=1750738743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfXoidyywq4prG1qxFfXKWvZLzM8FnofZM+bLZ5UOeQ=;
        b=Q2gUkw3rgxpnciNf37XKxzt6F7FBJMwtV0OiaIGWz1ZKyilFK+yIyk2KKpBvAdLwMd
         Vk8xZD4yk4V4IPfRuaWja/av24697fyi7mM0qmlKTnvWTOHA6aRO2l6aIZu5z7YobYHk
         zlt2gT0MFkcvTirnfLi20fJwVUo/CFNyjK8eKGwI5jwILVLgx+L+M15jgAvJ/EzQ3Njj
         sqqZp6/NduKtRkyJXh6s0J6uurPDAD8xibaRyF533DwvIEdsDOFongdOnm3Pmq8MFavY
         navNtjSbP1NhGFlpO8cXWyivLhBRuB6ICohEI0oa235K64IhyBqVwflVqqxFGWtbnUTw
         7q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750133943; x=1750738743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfXoidyywq4prG1qxFfXKWvZLzM8FnofZM+bLZ5UOeQ=;
        b=fw2oOgUHlGrcmOlgduL3DcGRpMEWAmaGaDZUJTW8Jx5bh0Sly/vgnhL1egIRkaqdb2
         F/drQTa17oaQ3iU6ulAw+vF2/m9gDwhkrbf+K8IqFI+jdgHaFBPsLVbQIigQMzLdWAIP
         Kq6sSJ3HPJ+V8VRx57y2paMppEr0sktFl38z9709Zjr7EW4nbsYJz542JWccJ6Tstq+q
         7RyJB3fDOSdUN9PvgHItWe7QKRwJn6kxl+oP8THaxEXHwkvNJr8I4POZ+919BssrVzab
         4tFKEQeP/giOZPYexBWKQfJE1hCJO2uoji3cbstNDZcjVWV5et5+fJ1AstE5hYKCfivc
         iM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVty7K4vD3IODcU2OtyUwckbSz3q4gfzdCyHrtHn859jxYAEKwOg3BcR/uzhlZoweiCQBZrYhVPPLv780I=@vger.kernel.org
X-Gm-Message-State: AOJu0YybkT2VLcElLeDfJ4qxJc/mWnwXBnIf+ZwqgdNs5Itjf5dAuy81
	wbTFYcDh3ciE9p5qXbpo5XoVxThwXeBKud7dgFtizZMuuPOmTTHf/N7EgDqTZHJ/3Ps=
X-Gm-Gg: ASbGncvA+wEcyc9rT5A6aLhfgZwnc9ZfLGN4CptWWBURUhRJZCzcsMHIzegYVCs7z6y
	b6cwGytZ89VSYRkO/lNgHnYXuLHJJdTHpJZUGIR6PPmYGQkYoxe2vboNKaqVo7zuZp53kbxXd+o
	tPZ/ULpmSnGQAtsQwmuanoOftzOuojuw9orqqkd20FdlT8qnsC/Sb82aeyoXVgDiX+RHixLWh65
	Gpu4vj1meNfJH0aoAAAX0Y46/U1IuLpcqx3jn29nl9UBEe/3EbfbU1XOleXT8y+OIxFSjdF71Wg
	bILa6BWEJKqeUzNxG44rjvI6WKBD47IGn1PbmUiuYjrcGjcAe2BkV6KbD9JW9XJ6SREdRtKfDkI
	NtvTJzDqXUC2cqQ==
X-Google-Smtp-Source: AGHT+IHqTbrzP939yrSnByQC0rtnaJOgibU9Byk10ulJjvMNZlvHwikXDBV86s1p8bsCh5VpmAqFCw==
X-Received: by 2002:a17:902:d481:b0:231:d0a8:5179 with SMTP id d9443c01a7336-2366b003c6cmr173603795ad.23.1750133943270;
        Mon, 16 Jun 2025 21:19:03 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c029sm69798345ad.26.2025.06.16.21.18.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 21:19:02 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v4 3/3] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Tue, 17 Jun 2025 12:18:21 +0800
Message-ID: <20250617041821.85555-4-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250617041821.85555-1-lizhe.67@bytedance.com>
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
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

This patch optimize this process by batching the put_pfn() operations.

The performance test results, based on v6.15, for completing the 16G VFIO
IOMMU DMA unmapping, obtained through unit test[1] with slight
modifications[2], are as follows.

Base(v6.15):
./vfio-pci-mem-dma-map 0000:03:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.047 s (338.6 GB/s)
VFIO UNMAP DMA in 0.138 s (116.2 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.280 s (57.2 GB/s)
VFIO UNMAP DMA in 0.312 s (51.3 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.052 s (308.3 GB/s)
VFIO UNMAP DMA in 0.139 s (115.1 GB/s)

Map[3] + This patchset:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.028 s (563.9 GB/s)
VFIO UNMAP DMA in 0.049 s (325.1 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.294 s (54.4 GB/s)
VFIO UNMAP DMA in 0.296 s (54.1 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.033 s (485.1 GB/s)
VFIO UNMAP DMA in 0.049 s (324.4 GB/s)

For large folio, we achieve an approximate 64% performance improvement
in the VFIO UNMAP DMA item. For small folios, the performance test
results appear to show no significant changes.

[1]: https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c
[2]: https://lore.kernel.org/all/20250610031013.98556-1-lizhe.67@bytedance.com/
[3]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 35 +++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index e952bf8bdfab..159ba80082a8 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -806,11 +806,38 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    bool do_accounting)
 {
 	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
-	long i;
 
-	for (i = 0; i < npage; i++)
-		if (put_pfn(pfn++, dma->prot))
-			unlocked++;
+	while (npage) {
+		long nr_pages = 1;
+
+		if (!is_invalid_reserved_pfn(pfn)) {
+			struct page *page = pfn_to_page(pfn);
+			struct folio *folio = page_folio(page);
+			long folio_pages_num = folio_nr_pages(folio);
+
+			/*
+			 * For a folio, it represents a physically
+			 * contiguous set of bytes, and all of its pages
+			 * share the same invalid/reserved state.
+			 *
+			 * Here, our PFNs are contiguous. Therefore, if we
+			 * detect that the current PFN belongs to a large
+			 * folio, we can batch the operations for the next
+			 * nr_pages PFNs.
+			 */
+			if (folio_pages_num > 1)
+				nr_pages = min_t(long, npage,
+					folio_pages_num -
+					folio_page_idx(folio, page));
+
+			unpin_user_folio_dirty_locked(folio, nr_pages,
+					dma->prot & IOMMU_WRITE);
+			unlocked += nr_pages;
+		}
+
+		pfn += nr_pages;
+		npage -= nr_pages;
+	}
 
 	if (do_accounting)
 		vfio_lock_acct(dma, locked - unlocked, true);
-- 
2.20.1

