Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6031FFC5F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253861; cv=none; b=Og9XFO3XhjaV/G2cMbbfAFfZezTXhCWURQqSrE7WT4kgXuQz7PH6jKLJNTOSPebs3tnI4qNCdYalAWP+q2tHPJ3yWzYOu51M6EHmNWZC/nIC5IEArDFsUqbYn99FpjGD5i2LnuxLBxke10fa2BRN9dMW9zbU7T119dM6zBIwzmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253861; c=relaxed/simple;
	bh=xq4o/ft9r7KYDxzjy0/m+Nt8GKHdQq81V7viZYt14tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SryL50YA5ptBmiYfgBQiJxcC4iIyX8cbEFZWPhT0/cN28+qhIM+27ie05nhHJeFig/coDz3XMIEFfID77PmLENC9Lr/s4z/zqAlmD6kWQDINA++WVK0Yp95rtVY3Df1TA3ASteezhSblDeDua4HaLsBD81BHyOKK0Jfc7Js8Q3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoB0j+gs; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoB0j+gs"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so332798a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253859; x=1747858659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oipYBsjZNqzU1ii2PkDwAfBFaJ3OHlOiEhSpOfdLTyc=;
        b=XoB0j+gsKK8z33vtgYyZY72WjX8tKFPwIppP/sS95u8Nj1u3sPdmn79exM4tAjMohX
         V7WcL3/f80RaxhsoUt5WpkSZ/fYX/9IZdrRSsW+nI2fHyHh2cuogcRNGRf30B+RPOII3
         m/I9NhB2CDov2M/ipUmsH5I1YYgzbsfraPrGC55xXIi5U14zu50rK+Q8dggEHzh/K3L+
         Ox+Rkoq4ViHeFil/9frdL6OLt6YwRPq7VTNlEa+Ic2jh+Va+La0kdVt3W+45HSpSsqz0
         /jzeMD+KUEVFFVTaHiyVw08U8qfQtRHN9qzFSx+tKheScrWhCZ3H43VvmIMgBEF0ksEh
         VISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253859; x=1747858659;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oipYBsjZNqzU1ii2PkDwAfBFaJ3OHlOiEhSpOfdLTyc=;
        b=Mu9+VXtSg0SCOs/GS+RvXDOIF7bsCTmgqLetzIpOBeFPJIlL9RGQjxq3+TrY0ZVSZr
         mW/8d79KM1iHXbbTcbMVFJRwDJmUrYQrFa7Im7PMJeGG+xSYAc3Xnads6wUNuiFW/LMm
         hkqeRbLuLZQtKBSeRXPFSDa5WSxzAQUzOzmt7GrbFOGq6hSZDrS7bom09qI8uJIIvHNV
         QSWNAsOqpA+zW69aYuFeiBeKNwm0JEhzVNbi/76cpu5pfLG6GXzbMvDo9EE0iKzfwJIU
         GyUw6PQkL/HtRmbkYJD2XkvYwJoNZ9nNmqQ5NgW2yXfJqpzQOAPjYrF0/J6nE9qPp4zt
         DhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG96wegkEw/gtfrPD4Fa5q9KG2s3k8TkOGh+OgqUvvF7eNEPhwItjaIBWst8NUN34+raj9CF50Q+vHeAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5UzL04aMuf43vjiK3KmDctvYbZbZgu4s4RZDEJA3lhlLVV936
	n12gaGmv8Kuj+/34QxfswF+P4v9xQviYZOvmIPGp8++JO+C4u0hz
X-Gm-Gg: ASbGncvqwbnRLCxthlJ9ERYwjco3KaQZZlp62j5ZAXZaKSyNw8qXpRJhedhgX5Cdylb
	EFW7sRnDJfsdMspEarw21pm5VudbGPFNuplOcegr4d/+MFR3sHQ4BHk0ySPFU3m6x9tdOC0ZNsN
	66gSqs3/aSRsExrju4RqFt7yVBQARbykW2q1BqAaPYRjum0mpe8OPyvGujpwIfM2Xt4ENJHGkwK
	qyv3ZV37dA1G5xniT2oqkThj9522V8Rnz5RvZh9qn8uynnhOTIK5hRyCgsN589Q7Nqna1D+dQPJ
	iI2nFNOEytFyw10SDUA8KA2XzS+agpjHTXnd+tm1CvkuRM3/SHvWNt/GIwfLVKwen/FhTnKm
X-Google-Smtp-Source: AGHT+IGdseuKANCdLIxW+HPBeLTWlFIujJ7gzibK91Avw3Y1Gd8nzoOQSrE9v8oKj03uvAwD19fUaw==
X-Received: by 2002:a17:90b:53ce:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-30e2e62a19cmr7645447a91.24.1747253859118;
        Wed, 14 May 2025 13:17:39 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.17.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:17:38 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 00/28] mm, swap: introduce swap table
Date: Thu, 15 May 2025 04:17:00 +0800
Message-ID: <20250514201729.48420-1-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

This is the series that implements the Swap Table idea propose in the
LSF/MM/BPF topic "Integrate swap cache, swap maps with swap allocator"
about one month ago [1].

With this series, swap subsystem will have a ~20-30% performance gain
from basic sequential swap to heavy workloads, for both 4K and mTHP
folios. The idle memory usage is already much lower, the average memory
consumption is still the same or will also be even lower (with further
works). And this enables many more future optimizations, with better
defined swap operations.

This series is stable and mergeable on both mm-unstable and mm-stable.
It's a long series so it might be challenging to review though. It has
been working well with many stress tests.

You can also find the latest branch here:
https://github.com/ryncsn/linux/tree/kasong/devel/swap-table

With swap table, a table entry will be the fundamental and the only needed
data structure for: swap cache, swap map, swap cgroup map. Reducing the
memory usage and making the performance better, also provide more
flexibility and better abstraction.

/*
 * Swap table entry type and bit layouts:
 *
 * NULL:     | ------------    0   -------------|
 * Shadow:   | SWAP_COUNT |---- SHADOW_VAL ---|1|
 * Folio:    | SWAP_COUNT |------ PFN -------|10|
 * Pointer:  |----------- Pointer ----------|100|
 */

This series contains many clean up and refractors due to many historical
issues with the SWAP subsystem, e.g. the fuzzy workflow and definition of
how swap entries are handled, and a lot of corner issues as mentioned
in the LSF/MM/BPF talk.

There could be temporary increase of complicity or memory consumption
in the middle of this series, but in the end it's a much simplified
and sanitized in the end. And these patches have dependency on each
other due to the current complex swap design. So this takes a long
series.

This series cleaned up most of the issues and improved the situation
with following order:
- Simplification and optimizations (Patch 1 - 3)
- Tidy up swap info and cache lookup (Patch 4 - 6)
- Introduce basic swap table infrastructure (Patch 7 - 8)
- Removed swap cache bypassing with SWP_SYNCHRONOUS_IO, enabling mTHP
  for more workloads (Patch 9 - 14).
- Simplify swap in synchronization with swap cache, eliminating long
  tailing issues and improve performance, swap can be synced with folio
  lock now (Patch 15 - 16).
- Make most swap operations into folio based. We now can use folio based
  helpers that ensures the swap entries are stable with folio lock,
  which also make more optimization and sanity checks doable.
  (Patch 17 - 18)
- Removed SWAP_HAS_CACHE. (Patch 19 - 22)
- Completely rework the swap counting using swap table, and remove
  COUNT_CONTINUED (Patch 23 - 27).
- Dynamic reclaim and allocation for swap table (Patch 28)

And the performance is looking great too:

vm-scalability usemem shows a great improvement:
Test using: usemem --init-time -O -y -x -n 31 1G (1G memcg, pmem as swap)
                Before:         After:
System time:    217.39s         161.59s      (-25.67%)
Throughput:     3933.58 MB/s    4975.55 MB/s (+26.48%)
(Similar results with random usemem -R)

Build kernel with defconfig on tmpfs with ZRAM:
Below results shows a test matrix using different memory cgroup limit
and job numbers.

  make -j<NR>|  Total Sys Time (seconds) |   Total Time (seconds)
  (NR / Mem )|  (Before / After / Delta) | (Before / After / Delta)
  With 4k pages only:
   6 / 192M  |    5327 /  3915 / -26.5%  |    1427 /  1141 / -20.0%
  12 / 256M  |    5373 /  4009 / -25.3%  |     743 /   606 / -18.4%
  24 / 384M  |    6149 /  4523 / -26.4%  |     438 /   353 / -19.4%
  48 / 768M  |    7285 /  4521 / -37.9%  |     251 /   190 / -24.3%
  With 64k mTHP:
  24 / 512M  |    4399 /  3328 / -24.3%  |     345 /   289 / -16.2%
  48 /   1G  |    5072 /  3406 / -32.8%  |     187 /   150 / -19.7%

Memory usage is also reduced. Although this series haven't remove the
swap cgroup array yet, the peak usage of one swap entry is already
reduced from 12 bytes to 10 bytes. And the swap table is dynamically
allocated which means the idle memory usage will be reduced by a lot.

Some other high lights and notes:

1. This series introduce a set of helpers "folio_alloc_swap",
   "folio_dup_swap", "folio_put_swap", "folio_free_swap*" to make
   most swap operations folio based, this should brought a clean border
   between swap and rest of mm. Also split the hibernation swap entry
   allocation out of ordinary swap operations.

3. This series enabled mTHP swap-in, and read ahead skipping for more
   workloads, as it removed the swap cache bypassing path:

   We currently only do mTHP swap in and read ahead bypass for
   SWP_SYNCHRONOUS_IO device only when swap count of all related entries
   are equal to one. This makes no sense, clearly read ahead and mTHP
   behaviour should have nothing to do with swap count, it's only a defect
   due to current design that they are coupled with swap cache bypassing.
   This series removed that limitation while showing a major performance
   improvement.

   This not only showed a performance gain, also should reduce mTHP
   fragmentation.

4. By removing the old swap cache design, now all swap cache are
   protected by fine grained cluster lock, this also removed the cluster
   shuffle algorithm should improve the performance for SWAP on HDD too
   (Fixing [4]). And also got rid of the many swap address_space instance
   design.

5. I dropped some future doable optimizations for now, e.g. the folio
   based helper will be an essential part for dropping the swap
   cgroup control map, which will improve the performance and reduce
   memory usage even more. It could be done later. And more folio
   batched operations could be done based on this. So this series is
   not in the best shape but already looking good enough.

Future work items:

1. More tests, and maybe some of the patches need to be split into
   smaller ones or need a few preparation series.

2. Integrate with Nhat Pham's Virtual swap space [2], while this series
   improves the performance and added a sanitized workload for SWAP,
   nothing changed feature wise. The swap table idea is suppose to be
   able to handle things like a virtual device in a cleaner way with
   both lower overhead and better flexibility, more work is needed to
   figure out a way to implement it.

3. Some helpers from this series could be very helpful for future works.
   E.g. the folio based swap helpers, now locking a folio will stabilize
   its swap entries, which could also be used to stabilize the under layer
   swap device's entries if a virtual device design is implemented,
   hence simplify the locking design. Also more entry types could be
   added for things like zero map or shmem.

4. The unified swap in path now already enabled mTHP swap in for swap
   count > 1 entries. This also making unify the read ahead of shmem / anon
   (as demostrated a year ago [3], that one conflicted with the
   standalone mTHP swapin path but now it's unified) doable now.

   We can also implement a read ahead based mTHP swapin based on this too.
   This needs more discussion.

Link: https://lore.kernel.org/CAMgjq7BvQ0ZXvyLGp2YP96+i+6COCBBJCYmjXHGBnfisCAb8VA@mail.gmail.com [1]
Link: https://lore.kernel.org/lkml/20250407234223.1059191-1-nphamcs@gmail.com/ [2]
Link: https://lore.kernel.org/all/20240129175423.1987-1-ryncsn@gmail.com/ [3]
Link: https://lore.kernel.org/linux-mm/202504241621.f27743ec-lkp@intel.com/ [4]

Kairui Song (27):
  mm, swap: don't scan every fragment cluster
  mm, swap: consolidate the helper for mincore
  mm, swap: split readahead update out of swap cache lookup
  mm, swap: sanitize swap cache lookup convention
  mm, swap: rearrange swap cluster definition and helpers
  mm, swap: tidy up swap device and cluster info helpers
  mm, swap: use swap table for the swap cache and switch API
  mm/swap: rename __read_swap_cache_async to __swapin_cache_alloc
  mm, swap: add a swap helper for bypassing only read ahead
  mm, swap: clean up and consolidate helper for mTHP swapin check
  mm, swap: never bypass the swap cache for SWP_SYNCHRONOUS_IO
  mm/shmem, swap: avoid redundant Xarray lookup during swapin
  mm/shmem: never bypass the swap cache for SWP_SYNCHRONOUS_IO
  mm, swap: split locked entry freeing into a standalone helper
  mm, swap: use swap cache as the swap in synchronize layer
  mm, swap: sanitize swap entry management workflow
  mm, swap: rename and introduce folio_free_swap_cache
  mm, swap: clean up and improve swap entries batch freeing
  mm, swap: check swap table directly for checking cache
  mm, swap: add folio to swap cache directly on allocation
  mm, swap: drop the SWAP_HAS_CACHE flag
  mm, swap: remove no longer needed _swap_info_get
  mm, swap: implement helpers for reserving data in swap table
  mm/workingset: leave highest 8 bits empty for anon shadow
  mm, swap: minor clean up for swapon
  mm, swap: use swap table to track swap count
  mm, swap: implement dynamic allocation of swap table

Nhat Pham (1):
  mm/shmem, swap: remove SWAP_MAP_SHMEM

 arch/s390/mm/pgtable.c |    2 +-
 include/linux/swap.h   |  119 +--
 kernel/power/swap.c    |    8 +-
 mm/filemap.c           |   20 +-
 mm/huge_memory.c       |   20 +-
 mm/madvise.c           |    2 +-
 mm/memory-failure.c    |    2 +-
 mm/memory.c            |  384 ++++-----
 mm/migrate.c           |   28 +-
 mm/mincore.c           |   49 +-
 mm/page_io.c           |   12 +-
 mm/rmap.c              |    7 +-
 mm/shmem.c             |  204 ++---
 mm/swap.h              |  316 ++++++--
 mm/swap_state.c        |  646 ++++++++-------
 mm/swap_table.h        |  231 ++++++
 mm/swapfile.c          | 1708 +++++++++++++++++-----------------------
 mm/userfaultfd.c       |    9 +-
 mm/vmscan.c            |   22 +-
 mm/workingset.c        |   39 +-
 mm/zswap.c             |   13 +-
 21 files changed, 1981 insertions(+), 1860 deletions(-)
 create mode 100644 mm/swap_table.h

-- 
2.49.0

