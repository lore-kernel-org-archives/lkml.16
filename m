Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4721D13CA9C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800827; cv=none; b=HlwIYmM1Q+aoAJZ152R/x3/PGfnbzcG7tx+g9Q5cd5F1OV5dSYQWQS+DUYXVpfvSuEGIhIZmVyow/6GR0hkjdS4KUGakn6D+7XRFcICwIbconj882u/T4kOxn3CFr7Bux3qKqRdC58zbgNXuZmXFljwCA6pWfMqOTo73pH0TCoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800827; c=relaxed/simple;
	bh=x1Fs41Gu8AxANZ1whX4i93fHVA7QaMRAAeK1eptG5Os=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dT0BIilRNomobaBxO6m4r5U4/Jq32ydPaRfWlXdY/Orvsxw7orwoQJFmN4Dw5IEwwtt+3lCA7NKGK+nLSCSJi7YSuoQSnTCVEaYr7ULiI6wMrIytBHa7Y7VBk+938d2MDeiLmMX0TdVc3geiUwNuFSIVxIEPodbzw1WCQ/eVT8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6Y4jAK5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6Y4jAK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8366EC4CEDD;
	Fri,  4 Apr 2025 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743800826;
	bh=x1Fs41Gu8AxANZ1whX4i93fHVA7QaMRAAeK1eptG5Os=;
	h=From:To:Cc:Subject:Date:From;
	b=q6Y4jAK5V2aGwI5SkOs8upxg5PSJDBl3+c/o/D40N9O/sqIxrtulzrmoAIWxu9Dlk
	 Lh54j7rSj86vT7s9Fu1PYLr0kYfIfx1jIy6Al9XiNOwxShNZnT2tSpSLJ2a8aadlJl
	 I0f0NzMvU+ccCNlldb4aEzAj+p1YPUHiyWTMI0QorFC8luzjT0Qb58R9xp3/2vmbNz
	 xdp/GTefuiP7FIvP07lHVo/U6dhTZI3Y2o1UfzujVKPJykxKDDIcDQJgpspTnWfAVJ
	 bNdynJsDpX+bvHu0T3bAh+fCUa3OiDqJlLhR6RpLWJhdgh+b12pi2C2leUQya+L+WT
	 GngfTM0185yDA==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R.Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 0/4] mm/madvise: batch tlb flushes for MADV_DONTNEED and MADV_FREE
Date: Fri,  4 Apr 2025 14:06:56 -0700
Message-Id: <20250404210700.2156-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When process_madvise() is called to do MADV_DONTNEED[_LOCKED] or
MADV_FREE with multiple address ranges, tlb flushes happen for each of
the given address ranges.  Because such tlb flushes are for same
process, doing those in a batch is more efficient while still being
safe.  Modify process_madvise() entry level code path to do such batched
tlb flushes, while the internal unmap logics do only gathering of the
tlb entries to flush.

In more detail, modify the entry functions to initialize an mmu_gather
ojbect and pass it to the internal logics.  And make the internal logics
do only gathering of the tlb entries to flush into the received
mmu_gather object.  After all internal function calls are done, the
entry functions flush the gathered tlb entries at once.

Because process_madvise() and madvise() share the internal unmap logic,
make same change to madvise() entry code together, to make code
consistent and cleaner.  It is only for keeping the code clean, and
shouldn't degrade madvise().  It could rather provide a potential tlb
flushes reduction benefit for a case that there are multiple vmas for
the given address range.  It is only a side effect from an effort to
keep code clean, so we don't measure it separately.

Similar optimizations might be applicable to other madvise behaviros
such as MADV_COLD and MADV_PAGEOUT.  Those are simply out of the scope
of this patch series, though.

Patches Seuquence
=================

First patch defines new data structure for managing information that
required for batched tlb flushes (mmu_gather and behavior), and update
code paths for MADV_DONTNEED[_LOCKED] and MADV_FREE handling internal
logics to receive it.

Second patch batches tlb flushes for MADV_FREE handling for both
madvise() and process_madvise().

Remaining two patches are for MADV_DONTNEED[_LOCKED] tlb flushes
batching.  Third patch splits zap_page_range_single() for batching of
MADV_DONTNEED[_LOCKED] handling.  The final and fourth patch batches tlb
flushes for the hint using the sub-logic that the third patch split out,
and the helpers for batched tlb flushes that intorduced for MADV_FREE
case, by the second patch.

Test Results
============

I measured the latency to apply MADV_DONTNEED advice to 256 MiB memory
using multiple process_madvise() calls.  I apply the advice in 4 KiB
sized regions granularity, but with varying batch size per
process_madvise() call (vlen) from 1 to 1024.  The source code for the
measurement is available at GitHub[1].  To reduce measurement errors, I
did the measurement five times.

The measurement results are as below.  'sz_batch' column shows the batch
size of process_madvise() calls.  'Before' and 'After' columns show the
average of latencies in nanoseconds that measured five times on kernels
that built without and with the tlb flushes batching of this series
(patches 3 and 4), respectively.  For the baseline, mm-new tree of
2025-04-04[2] has been used.  'B-stdev' and 'A-stdev' columns show
ratios of latency measurements standard deviation to average in percent
for 'Before' and 'After', respectively.  'Latency_reduction' shows the
reduction of the latency that the 'After' has achieved compared to
'Before', in percent.  Higher 'Latency_reduction' values mean more
efficiency improvements.

    sz_batch   Before        B-stdev   After         A-stdev   Latency_reduction
    1          110948138.2   5.55      109476402.8   4.28      1.33
    2          75678535.6    1.67      70470722.2    3.55      6.88
    4          59530647.6    4.77      51735606.6    3.44      13.09
    8          50013051.6    4.39      44377029.8    5.20      11.27
    16         48657878.2    9.32      37291600.4    3.39      23.36
    32         43614180.2    6.06      34127428      3.75      21.75
    64         42466694.2    5.70      26737935.2    2.54      37.04
    128        42977970      6.99      25050444.2    4.06      41.71
    256        41549546      1.88      24644375.8    3.77      40.69
    512        42162698.6    6.17      24068224.8    2.87      42.92
    1024       40978574      5.44      23872024.2    3.65      41.75

As expected, tlb flushes batching provides latency reduction that
proportional to the batch size.  The efficiency gain ranges from about
6.88 percent with batch size 2, to about 40 percent with batch size 128.

Please note that this is a very simple microbenchmark, so real
efficiency gain on real workload could be very different.

Chagelong
=========

Changes from v1
(https://lore.kernel.org/20250310172318.653630-1-sj@kernel.org)
- Split code cleanup part out
- Keep the order between tlb flushes and hugetlb_zap_end()
- Put mm/memory change just before its real usage
- Add VM_WARN_ON_ONCE() for invlaid tlb argument to unmap_vma_single()
- Cleanups following nice reviewers suggestions

Changes from RFC
(https://lore.kernel.org/20250305181611.54484-1-sj@kernel.org)
- Clarify motivation of the change on the cover letter
- Add average and stdev of evaluation results
- Show latency reduction on evaluation results
- Fix !CONFIG_MEMORY_FAILURE build error
- Rename is_memory_populate() to is_madvise_populate()
- Squash patches 5-8
- Add kerneldoc for unmap_vm_area_struct()
- Squash patches 10 and 11
- Squash patches 12-14
- Squash patches 15 and 16

References
==========

[1] https://github.com/sjp38/eval_proc_madvise
[2] commit edd67244fe67 ("mm/show_mem: optimize si_meminfo_node by reducing redundant code") # mm-new

SeongJae Park (4):
  mm/madvise: define and use madvise_behavior struct for
    madvise_do_behavior()
  mm/madvise: batch tlb flushes for MADV_FREE
  mm/memory: split non-tlb flushing part from zap_page_range_single()
  mm/madvise: batch tlb flushes for MADV_DONTNEED[_LOCKED]

 mm/internal.h |   3 ++
 mm/madvise.c  | 110 ++++++++++++++++++++++++++++++++++++--------------
 mm/memory.c   |  47 ++++++++++++++++-----
 3 files changed, 121 insertions(+), 39 deletions(-)


base-commit: 85b87628fae973dedae95f2ea2782b7df4c11322
-- 
2.39.5
