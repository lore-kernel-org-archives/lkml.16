Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC12482FF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750133925; cv=none; b=sVgCSefLbSGZLsA4lPC73eIjt3tb2cUD2HANp34/XNSGIoU+7Pv+yOD+NOi61f5/u/1gzJXcPjzDat8RkygsoNEV10MATqvLwpIIxufbr8jCWyRvUclWKrZieoN3/bh13DDDJN992DOG42mQKWPJsC3Uk/ldv29LoJiFeuVETD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750133925; c=relaxed/simple;
	bh=UByxiJPFvwodGWaejg9FPqJnqrV99H6qPa2IES5O7Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOkIEY4N3EDV6/nPjctydOKTNh6AHqol0EMT/1UxeQnxJ+xPAtu0oQgd8+gevbcKu5GBHn9AyuG31ldXH8i/YzP+zoUBeLzpv/zdLqeaWPgd9zguLWolPoxsHMY54HJP0s4Rty9Ou26oayDMtFShaADsHcz/Dve+MJHrz8C0kqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KB4DIKoX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KB4DIKoX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234d366e5f2so68126695ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750133922; x=1750738722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=igAZEPeaIEDiheZvfxf+oF+fwfb6UvykItlBM60MOcA=;
        b=KB4DIKoXXVJFeb+6fp8rkp5KuJq66sMUQOHTtMaAHNhhOJfJ4Mvf7n96eKtrn9aw3w
         LGXJcYT1vzci6AjlvwakFnLNkn5fMOPw6xaRkdz9ugOyqpm8lbMmE3k+kfMDGMjOB4+h
         ksHGiIyVVLVdYHs+L6NO5uoNn8+Q4VWhHnNzLKBdDpZUcKnE7BX8HOH+4dO/Fnixpe6r
         88bSo2qLAHv1e5Q9ZIc1m4ngvPUNqR52NkKMaAIuvISga1xgEmsrwn65B+M7Iq8SqDBW
         hQ0f9x9yI5wZJ8PLIRihSkPy1PP5Qbjg1MwHkzr53EYghwPcL7wTt/LhMSpuJTTqbh95
         nbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750133922; x=1750738722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igAZEPeaIEDiheZvfxf+oF+fwfb6UvykItlBM60MOcA=;
        b=sxHOpYGN2pIpaVsczE6i/A60wdv8d+0tNP3Vh6mzclR8v3OruokYixbLOC6BCxzu2v
         H1KnWKyrjFXhooKFAgDz9lqPu4RmYNyyxr69sQ1o0CNkPA9MpfDuIjPXAJwcj/60eeut
         H4BC38qJ+n4CwkiTZbA8iUHm2jrzvZDoKlMTt6YmDEHi5nq2zhKy460YVbp4zKkSoFmd
         cxCQXP3u2G4XzioJPAfWJYw0tNtfdjUh9s/5WJcRap8b0v1J057osvNoxHG/Fo67evnJ
         ojo1OgUlkFsqLg0tcNyZEoYxqIYNt2JIO7ADa+gCCOgpTVLy2XB77b7miEMfykxlUMfV
         RSqA==
X-Forwarded-Encrypted: i=1; AJvYcCXUkbR6pBVDRJL8OHAJ6kWGlRzRPV7Np6xq+2H4cep7+g7WlCchxhrloJItVg/UynhncXsIku9/miZtN3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQi4KzxxbZal7rH1auZNtUN1eKwQGR10iz4bUrCHg8VW2MvZf
	jeKXWMUj1CDy3V/IkNpCenAoVF9iNEO5Pr2z+Xm5x2h6DfsBiopqjokeZTGhGu5ypuE=
X-Gm-Gg: ASbGnctHkxjPw3RuJEMY0eF7NZaHABr4f5QNUe8jfDMdLy7xd7nmps2IyAfMybMh6gc
	K5PUddqYGr8xoARMzgqf6GXZuLud/i/7Y2XpFAUVjbclVUoSHmB4c2euxjujiln8ZqxnVTr+bV6
	JE35YMePXG4styc4VQZ0EGlHXzFewgRPCcMXKXb3nIgQpbL+nlV9UpedN5tWSH57tQcYZHmWIqA
	ciUfSqTeR7s8dcUHe1QhI0yW+nBFyx0ylC9MvESmRqI7NvbwaOcJFH6fJBMXDrebuoDNG4LHmVM
	nvhtidnZHTRM0v9kM+gRY+0eUfDTb82f/1KoH51ZKIWhRDvNNKh9lMSwekK+AQczBX/jpjRrdmJ
	2iZhvU5IoGaFkAg==
X-Google-Smtp-Source: AGHT+IFsY8746XIZ16bXJPVrgLyl93cy8mP7x1VEWMaLf/+bipVG7ov5clC26qJPWsPEVOqwRUn6mg==
X-Received: by 2002:a17:902:d4c9:b0:235:f4f7:a633 with SMTP id d9443c01a7336-2366b3ac074mr204669445ad.28.1750133922275;
        Mon, 16 Jun 2025 21:18:42 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c029sm69798345ad.26.2025.06.16.21.18.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 21:18:41 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v4 0/3] optimize vfio_unpin_pages_remote() for large folio
Date: Tue, 17 Jun 2025 12:18:18 +0800
Message-ID: <20250617041821.85555-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

This patchset is based on patch 'vfio/type1: optimize
vfio_pin_pages_remote() for large folios'[1].

When vfio_unpin_pages_remote() is called with a range of addresses
that includes large folios, the function currently performs individual
put_pfn() operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of
pages. We can optimize this process by batching the put_pfn()
operations.

The first patch batches the vfio_find_vpfn() calls in function
vfio_unpin_pages_remote(). However, performance testing indicates that
this patch does not seem to have a significant impact. The primary
reason is that the vpfn rb tree is generally empty. Nevertheless, we
believe it can still offer performance benefits in certain scenarios
and also lays the groundwork for the third patch. The second patch
introduces a new interface, unpin_user_folio_dirty_locked(), to
conditionally mark a folio as dirty and unpin it. This interface will
be used by the third patch. The third patch, using the method described
earlier, optimizes the performance of vfio_unpin_pages_remote() for
large folio scenarios.

The performance test results, based on v6.15, for completing the 16G VFIO
IOMMU DMA unmapping, obtained through unit test[2] with slight
modifications[3], are as follows.

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

Map[1] + First patch:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.027 s (596.1 GB/s)
VFIO UNMAP DMA in 0.138 s (115.8 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.292 s (54.8 GB/s)
VFIO UNMAP DMA in 0.310 s (51.6 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.032 s (506.5 GB/s)
VFIO UNMAP DMA in 0.140 s (114.1 GB/s)

Map[1] + This patchset:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.028 s (563.9 GB/s)
VFIO UNMAP DMA in 0.049 s (325.1 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.294 s (54.4 GB/s)
VFIO UNMAP DMA in 0.296 s (54.1 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.033 s (485.1 GB/s)
VFIO UNMAP DMA in 0.049 s (324.4 GB/s)

The first patch appears to have negligible impact on the performance
of VFIO UNMAP DMA.

With the second and the third patch, we achieve an approximate 64%
performance improvement in the VFIO UNMAP DMA item for large folios.
For small folios, the performance test results appear to show no
significant changes.

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
[2]: https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c
[3]: https://lore.kernel.org/all/20250610031013.98556-1-lizhe.67@bytedance.com/

Changelogs:

v3->v4:
- Introduce a new interface unpin_user_folio_dirty_locked(). Its
  purpose is to conditionally mark a folio as dirty and unpin it.
  This interface will be called in the VFIO DMA unmap process.
- Revert the related changes to put_pfn().
- Update the performance test results.

v2->v3:
- Split the original patch into two separate patches.
- Add several comments specific to large folio scenarios.
- Rename two variables.
- The update to iova has been removed within the loop in
  vfio_unpin_pages_remote().
- Update the performance test results.

v1->v2:
- Refactor the implementation of the optimized code

v3: https://lore.kernel.org/all/20250616075251.89067-1-lizhe.67@bytedance.com/
v2: https://lore.kernel.org/all/20250610045753.6405-1-lizhe.67@bytedance.com/
v1: https://lore.kernel.org/all/20250605124923.21896-1-lizhe.67@bytedance.com/

Li Zhe (3):
  vfio/type1: batch vfio_find_vpfn() in function
    vfio_unpin_pages_remote()
  gup: introduce unpin_user_folio_dirty_locked()
  vfio/type1: optimize vfio_unpin_pages_remote() for large folio

 drivers/vfio/vfio_iommu_type1.c | 37 ++++++++++++++++++++++++++-------
 include/linux/mm.h              |  2 ++
 mm/gup.c                        | 27 ++++++++++++++++++------
 3 files changed, 53 insertions(+), 13 deletions(-)

-- 
2.20.1

