Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F32019E99A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867879; cv=none; b=hBkkgp8W4eh2UIPVyK4xwvY6NBa9n0cG1MMbzRbDoTo11DpxtPzqjdwArjIxlhyzq5BmVzSczg2ur21iADqIKjYmTxL1G0oQzObCDk9MS9/ajdJADKZJzDLBGn4ZCh4Wzzs5lqXZmIRQP1lRvek9MR1NHsKOlwD8xL+D2lNtIuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867879; c=relaxed/simple;
	bh=4crtqCsWmgGMrdtLPRA2LD8YutH85mPTKM5GIBx+pWQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZrptswvEzRqTnF0c50jnsH5k59gjgzq3urMtbLqdWhMBLOR84z1wQtTa/dsalRJ5Dy4EADKJBtIGvvv7jdSxPnA7eT6pS+z1jdlungQxvoZHMhVkUiss70qjBt4lmydueU0ZgOtErnQh1dMkciphCGPaZLc6AA61F1zFg3NUfnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0yMDsovF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0yMDsovF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216750b679eso20314925ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867876; x=1739472676; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YsFWHjpb+gy5QTGQ9ZffexdvLm5onIuNP7Djnm3T2vw=;
        b=0yMDsovFWuSgBw+VHyFZfaw0x6YL+6NjL90oWBasJtBtyheLTz73+AIZAnFkT0jM6n
         cg/DOkhQ93PmcgkBA4iwlQdcKJ9G6gFI440IzyDg77yMVsf1U7z4Q/pwU4bpDS3YE14z
         MeJSQ/+1srDqM2L4uVowIP0YNlaZ1wcdCNP/v7LIS2P2htG+2+oM1RKlDgPg5n6Ahi2x
         k+XDn5uChuJlR99jI2RDaJOu5XWzSTR/CIFOmcvGEYarWee08+s8L3cyJU1sW7/Js5KZ
         odo0QVtHrrZODJaVSuSmPI6UESUmBECRrAiLgANG0TMxWz7K0F0SWjxn7dFGTJCT9CYo
         XvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867876; x=1739472676;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsFWHjpb+gy5QTGQ9ZffexdvLm5onIuNP7Djnm3T2vw=;
        b=Hkm/90m6XyX+yeT4iPLLuqWR45g56POT9H+M3Cav4QwDKRlVpt9WCX4ddyvPjUU0Gf
         KLNi408Xb6RWbMXXO4IHi2xogD/G/hQpmDEsCTtnEa24n2oHEy5dlvs3YwpIIrnr5GAX
         BcD2cAOiGVzvkkqPFBpbL/cjLh+ttLZ6NK/d5HT7PeOHdYMGjBOQV3Xqqmhc0OC89jRx
         FdFYD2xyQFogCsbc+tu4j32PpmVoUzOhSRaPGisXFyzNyWerjdo2rSJF3wG4qeVrlIXA
         3/grgeTfrpmIiJndJfyCAsfvYgzaVhwjsxJe2LM7eyhJOc3r6XMjIinvlhYnFQ5qtmgh
         HPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQVkbYGfoDDglOgKSV14iK1ZoEKo71eBZGM3b3bn9bnfdi4abevsBlZeY0oSubVx0OHk1e4uCZPM+7mSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+NfluEvopd0fOZDEJ/uThSgJDIDf2Tb+OSOnAYjaEDtsqP9i
	Buljj9RbsF30vAhwVjUlB3qpZXGnK0ZOkSUckH81XBSm9T0aR14+S60pEbMb5lRCw+gd3g==
X-Google-Smtp-Source: AGHT+IF9o18CzkB8CghgWrNZCXYDA9EORVOYYFJNqV/X4zqnkYEqt/ah/t4JwIihzL3Y+z7JL+taKHEe
X-Received: from pgbfe16.prod.google.com ([2002:a05:6a02:2890:b0:7fd:57ef:61e])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8dcc:b0:1ed:75f4:d289
 with SMTP id adf61e73a8af0-1ee03a8f4ccmr842426637.19.1738867876400; Thu, 06
 Feb 2025 10:51:16 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-1-fvdl@google.com>
Subject: [PATCH v3 00/28] hugetlb/CMA improvements for large systems
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

v3:
* Fix SPDX comment include file format.
* Add new hugetlb_cma.* files to MAINTAINERS
* Document new ranges/ subdir in CMA debugfs.
* Fix powerpc compilation for config without HAVE_BOOTMEM_INFO_NODE
* Fix various other nits found by kernel test robot.
* Use a PFN value of -1 to indicate a non-mirrored mapping
  in sparse-vmemmap.c, not 0.
* Fix incorrect if() statement that got mangled in cma.c

v2:
* Add missing CMA debugfs code.
* Minor cleanups in hugetlb_cma changes.
* Move hugetlb_cma code to its own file to further clean
  things up.

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
 Documentation/admin-guide/mm/cma_debugfs.rst  |  10 +-
 MAINTAINERS                                   |   2 +
 arch/powerpc/include/asm/book3s/64/hugetlb.h  |   6 +
 arch/powerpc/mm/hugetlbpage.c                 |   1 +
 arch/powerpc/mm/init_64.c                     |   4 +
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
 mm/cma.c                                      | 739 +++++++++++++++---
 mm/cma.h                                      |  46 +-
 mm/cma_debug.c                                |  61 +-
 mm/cma_sysfs.c                                |  20 +
 mm/hugetlb.c                                  | 565 ++++++-------
 mm/hugetlb_cma.c                              | 258 ++++++
 mm/hugetlb_cma.h                              |  55 ++
 mm/hugetlb_vmemmap.c                          | 199 ++++-
 mm/hugetlb_vmemmap.h                          |  23 +-
 mm/internal.h                                 |  19 +
 mm/mm_init.c                                  |  78 +-
 mm/sparse-vmemmap.c                           | 168 +++-
 mm/sparse.c                                   |  87 ++-
 32 files changed, 2018 insertions(+), 491 deletions(-)
 create mode 100644 mm/hugetlb_cma.c
 create mode 100644 mm/hugetlb_cma.h

-- 
2.48.1.502.g6dc24dfdaf-goog

