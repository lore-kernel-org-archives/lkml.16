Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2B21D63C8
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190539; cv=none; b=ptXd6M32io+WMY6807itoeD7ex+5BbozycnpHkpzhUluYuxAp24t09qhwHPVpmE/cXcb9beVEVY2B22tfVxzr07KqGhDyAJV49KzMVkRxigXnSeyQI6NGAwB0n8a/rCKdUMvDjienJHgqPHSNxU6xTlxzYQtue4HftRkPMnVfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190539; c=relaxed/simple;
	bh=j0lsVsJngZnz/fqsW/H37qHyp8SFCq+86lJYkQJL7S0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JML5BebEjSoqMrGL6o29FIa+XCI5IVC4vSe9sqR1I37QVTfZSPuF8jxVYgFJblujK7JdrLb/OejB2HjbmZUcAMImeX7GK1Pr5CPkiE0PguAjJ0Iy552GtG0M9hx5+3s8PAFQ2WLdUpGEXICm3RS92/ikmbqEnHZKN6mHxlltQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gAOXJJfs; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gAOXJJfs"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2163dc0f5dbso3371105ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190537; x=1738795337; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLjryzNikNQGfntXYG2RfRyRJLfLbaJbKpgQF6jYtoM=;
        b=gAOXJJfsI3au38+Zm9RcfY461Hv8kpkyrGWrzep2cBuGuWHUiKZIT2BIMPH+D4IyI0
         lEqw6KtUxGKjRJtVjKnvXYmBVcorzS3nSMdlk3ld6vHVZu/x3iz1xEYZq9fC7iX3gwbj
         OtHoZZ0rQIKazuNy8NNkFiN8h51Xzg014xfy2IU8tjVxRhscS6s6OSLAZ7Ye59K+bKvI
         zXe1ggqTIZd7KxLSYmzOwCpZaAi41inpuHPHBzyYA24suEWX9axcMrMHRdDVKSsrILAu
         dzdRGmfMB1JJY/molM7JG+d3MnSHNNHFF+oWlZuNClaC4JG+3TNditzrd4+wXeYZEFlu
         +Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190537; x=1738795337;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLjryzNikNQGfntXYG2RfRyRJLfLbaJbKpgQF6jYtoM=;
        b=eRj6ASfkt7J27OL5WMnj23uFL0Cn8sPr8UnBQOVrFQ2IPu48Rweb0HXsBzD0rOCF+K
         2Vsx+1SnD4l4+etBiwt9gjyYnrHKJuXCwHTEVDUZEEspuYCSwbOtJ/4/NPRksMyxA/O8
         MnCPH6FWjYG+CiXewOt9AC1nLQXGfI9NhNdL2y5KxPhV3hkL4kdAzgnGgL23QmKZc3uf
         FDOuKWdC1mxaxuSWiStlQTaj7w4kjbwU0hAlwzMSq+qbA9slxyaxD5Z0rWl2yxUYm84n
         uX2SXS4PSip7bdMnfVHB3lbN6bzuyftIE1N7EP5nSaJD4JIFaBhWEvEPVEIjqIntUfkC
         +c3w==
X-Forwarded-Encrypted: i=1; AJvYcCUWix94QY/TYIpM4hmOj/HY4S3DQ1sOj0odZUYH5xL2Ok8nzi3egigkj4xQH3PbhkGAuvL+BkAWDxCIW3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfvss1NVjvb0m8FAw4l/Opw2JFWm7Zyl3GIAZb3VzuA1VdWNl
	Jk8xLiPMUpJsCO/p6KLadidjGgNYm2+YBzAsSX3z9Kg7boDcrynXHWLt8pNwpa4VB6UyZw==
X-Google-Smtp-Source: AGHT+IHm/jmRE1gnNlV9YnYP40r0iFXE53KS+a649UNNfzLx1bRHCWTGpleNwFbGU3nIgHjzPhbdT4M3
X-Received: from plblw16.prod.google.com ([2002:a17:903:2ad0:b0:215:4daf:8d9b])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f682:b0:216:4dfe:3ebd
 with SMTP id d9443c01a7336-21dd7e38e43mr75374125ad.50.1738190536956; Wed, 29
 Jan 2025 14:42:16 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-1-fvdl@google.com>
Subject: [PATCH v2 00/28] hugetlb/CMA improvements for large systems
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

On large systems, we observed some issues with hugetlb and CMA:

1) When specifying a large number of hugetlb boot pages (hugepages=
   on the commandline), the kernel may run out of memory before it
   even gets to HVO. For example, if you have a 3072G system, and
   want to use 3024 1G hugetlb pages for VMs, that should leave
   you plenty of space for the hypervisor, provided you have the
   hugetlb vmemmap optimization (HVO) enabled. However, since
   the vmemmap pages are always allocated first, and then later
   in boot freed, you will actually run yourself out of memory
   before you can do HVO. This means not getting all the hugetlb
   pages you want, and worse, failure to boot if there is an
   allocation failure in the system from which it can't recover.

2) There is a system setup where you might want to use hugetlb_cma
   with a large value (say, again, 3024 out of 3072G like above),
   and then lower that if system usage allows it, to make room
   for non-hugetlb processes. For this, a variation of the problem
   above applies: the kernel runs out of unmovable space to allocate
   from before you finish boot, since your CMA area takes up all
   the space.

3) CMA wants to use one big contiguous area for allocations. Which
   fails if you have the aforementioned 3T system with a gap in the
   middle of physical memory (like the < 40bits BIOS DMA area seen on
   some AMD systems). You then won't be able to set up a CMA area for
   one of the NUMA nodes, leading to loss of half of your hugetlb
   CMA area.

4) Under the scenario mentioned in 2), when trying to grow the
   number of hugetlb pages after dropping it for a while, new
   CMA allocations may fail occasionally. This is not unexpected,
   some transient references on pages may prevent cma_alloc
   from succeeding under memory pressure. However, the hugetlb
   code then falls back to a normal contiguous alloc, which may
   end up succeeding. This is not always desired behavior. If
   you have a large CMA area, then the kernel has a restricted
   amount of memory it can do unmovable allocations from (a well
   known issue). A normal contiguous alloc may eat further in to
   this space.


To resolve these issues, do the following:

* Add hooks to the section init code to do custom initialization
  of memmap pages. Hugetlb bootmem (memblock) allocated pages can
  then be pre-HVOed. This avoids allocating a large number of
  vmemmap pages early in boot, only to have them be freed again
  later, and also avoids running out of memory as described under 1).
  Using these hooks for hugetlb is optional. It requires moving
  hugetlb bootmem allocation to an earlier spot by the architecture.
  This has been enabled on x86.
* hugetlb_cma doesn't care about the CMA area it uses being one
  large contiguous range. Multiple smaller ranges are fine. The
  only requirements are that the areas should be on one NUMA node,
  and individual gigantic pages should be allocatable from them. So,
  implement multi-range support for CMA, avoiding issue 3).
* Introduce a hugetlb_cma_only option on the commandline. This only
  allows allocations from CMA for gigantic pages, if hugetlb_cma=
  is also specified.
* With hugetlb_cma_only active, it also makes sense to be able to
  pre-allocate gigantic hugetlb pages at boot time from the CMA
  area(s). Add a rudimentary early CMA allocation interface, that
  just grabs a piece of memblock-allocated space from the CMA
  area, which gets marked as allocated in the CMA bitmap
  when the CMA area is initialized. With this, hugepages= can
  be supported with hugetlb_cma=, making scenario 2) work.

Additionally, fix some minor bugs, with one worth mentioning:
since hugetlb gigantic bootmem pages are allocated by memblock,
they may span multiple zones, as memblock doesn't (and mostly
can't) know about zones. This can cause problems. A hugetlb page
spanning multiple zones is bad, and it's worse with HVO, when
the de-HVO step effectively sneakily re-assigns pages to a
different zone than originally configured, since the tail pages
all inherit the zone from the first 60 tail pages. This condition
is not common, but can be easily reproduced using ZONE_MOVABLE.
To fix this, add checks to see if gigantic bootmem pages intersect
with multiple zones, and do not use them if they do, giving them
back to the page allocator instead.

The first patch is kind of along for the ride, except that
maintaining an available_count for a CMA area is convenient
for the multiple range support.

v2:
* Add missing CMA debugfs code.
* Minor cleanups in hugetlb_cma changes.
* Move hugetlb_cma code to its own file to further clean
  things up.

Frank van der Linden (28):
  mm/cma: export total and free number of pages for CMA areas
  mm, cma: support multiple contiguous ranges, if requested
  mm/cma: introduce cma_intersects function
  mm, hugetlb: use cma_declare_contiguous_multi
  mm/hugetlb: fix round-robin bootmem allocation
  mm/hugetlb: remove redundant __ClearPageReserved
  mm/hugetlb: use online nodes for bootmem allocation
  mm/hugetlb: convert cmdline parameters from setup to early
  x86/mm: make register_page_bootmem_memmap handle PTE mappings
  mm/bootmem_info: export register_page_bootmem_memmap
  mm/sparse: allow for alternate vmemmap section init at boot
  mm/hugetlb: set migratetype for bootmem folios
  mm: define __init_reserved_page_zone function
  mm/hugetlb: check bootmem pages for zone intersections
  mm/sparse: add vmemmap_*_hvo functions
  mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc
  mm/hugetlb: move huge_boot_pages list init to hugetlb_bootmem_alloc
  mm/hugetlb: add pre-HVO framework
  mm/hugetlb_vmemmap: fix hugetlb_vmemmap_restore_folios definition
  mm/hugetlb: do pre-HVO for bootmem allocated pages
  x86/setup: call hugetlb_bootmem_alloc early
  x86/mm: set ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT
  mm/cma: simplify zone intersection check
  mm/cma: introduce a cma validate function
  mm/cma: introduce interface for early reservations
  mm/hugetlb: add hugetlb_cma_only cmdline option
  mm/hugetlb: enable bootmem allocation from CMA areas
  mm/hugetlb: move hugetlb CMA code in to its own file

 Documentation/ABI/testing/sysfs-kernel-mm-cma |  13 +
 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/powerpc/include/asm/book3s/64/hugetlb.h  |   6 +
 arch/powerpc/mm/hugetlbpage.c                 |   1 +
 arch/powerpc/mm/init_64.c                     |   1 +
 arch/s390/mm/init.c                           |  13 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/kernel/setup.c                       |   4 +-
 arch/x86/mm/init_64.c                         |  16 +-
 include/linux/bootmem_info.h                  |   7 +
 include/linux/cma.h                           |   9 +
 include/linux/hugetlb.h                       |  35 +
 include/linux/mm.h                            |  13 +-
 include/linux/mmzone.h                        |  35 +
 mm/Kconfig                                    |   8 +
 mm/Makefile                                   |   3 +
 mm/bootmem_info.c                             |   4 +-
 mm/cma.c                                      | 749 +++++++++++++++---
 mm/cma.h                                      |  46 +-
 mm/cma_debug.c                                |  61 +-
 mm/cma_sysfs.c                                |  20 +
 mm/hugetlb.c                                  | 566 +++++++------
 mm/hugetlb_cma.c                              | 258 ++++++
 mm/hugetlb_cma.h                              |  55 ++
 mm/hugetlb_vmemmap.c                          | 199 ++++-
 mm/hugetlb_vmemmap.h                          |  23 +-
 mm/internal.h                                 |  19 +
 mm/mm_init.c                                  |  78 +-
 mm/sparse-vmemmap.c                           | 168 +++-
 mm/sparse.c                                   |  87 +-
 30 files changed, 2016 insertions(+), 489 deletions(-)
 create mode 100644 mm/hugetlb_cma.c
 create mode 100644 mm/hugetlb_cma.h

-- 
2.48.1.262.g85cc9f2d1e-goog

