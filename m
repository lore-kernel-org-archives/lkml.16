Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5BB11712
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527457; cv=none; b=iXeYTa2NEb9pSmBHQpkJkLB4aIp3DIvMce8ejdf6PCp0FP6ZwXDM9qYd700tq1H59TTmmO3KOMp5kw7ulLnFhsxrkua0cVLZl2dyGjAzMbFqAl1u+nHCR8fJkw2cs/oB8xB2VwPR935aZ44X+QsZMlWuLs3iIdiqnj8v4CWZWFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527457; c=relaxed/simple;
	bh=R65GqOlsUv18Y2Tiox27BR9edZfsbbU9VKo6Z2lHMTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qsdWH20UlkSIagV0f9IqSYcY7XmFmLt4Tx28fxiCTwJMPDQKghFCp7vtU+TFj/LbyFmJrM1eEi36y0J3fBNDuFzMCzgt7iOmjRCXgna8gzJ7wQhmDEcA85E3KSqvEX5ssQcDtsP7v+Bv+S/0+H7rlX8ZWv/EdfyxdcKbsMnOeNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9466F14BF;
	Mon,  9 Jun 2025 20:50:35 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F15773F59E;
	Mon,  9 Jun 2025 20:50:47 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	mingo@kernel.org,
	libang.li@antgroup.com,
	maobibo@loongson.cn,
	zhengqi.arch@bytedance.com,
	baohua@kernel.org,
	anshuman.khandual@arm.com,
	willy@infradead.org,
	ioworker0@gmail.com,
	yang@os.amperecomputing.com,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	hughd@google.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v4 0/2] Optimize mremap() for large folios
Date: Tue, 10 Jun 2025 09:20:41 +0530
Message-Id: <20250610035043.75448-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently move_ptes() iterates through ptes one by one. If the underlying
folio mapped by the ptes is large, we can process those ptes in a batch
using folio_pte_batch(), thus clearing and setting the PTEs in one go.
For arm64 specifically, this results in a 16x reduction in the number of
ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
through all 16 entries to collect a/d bits), and we also elide extra TLBIs
through get_and_clear_full_ptes, replacing ptep_get_and_clear.

Mapping 1M of memory with 64K folios, memsetting it, remapping it to
src + 1M, and munmapping it 10,000 times, the average execution time
reduces from 1.9 to 1.2 seconds, giving a 37% performance optimization,
on Apple M3 (arm64). No regression is observed for small folios.

The patchset is based on mm-unstable (6ebffe676fcf).

Test program for reference:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>

#define SIZE (1UL << 20) // 1M

int main(void) {
    void *new_addr, *addr;

    for (int i = 0; i < 10000; ++i) {
        addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
                    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (addr == MAP_FAILED) {
                perror("mmap");
                return 1;
        }
        memset(addr, 0xAA, SIZE);

        new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
        if (new_addr != (addr + SIZE)) {
                perror("mremap");
                return 1;
        }
        munmap(new_addr, SIZE);
    }

}

v3->v4:
 - Remove comment above mremap_folio_pte_batch, improve patch description
   differentiating between folio splitting and pagetable splitting
v2->v3:
 - Refactor mremap_folio_pte_batch, drop maybe_contiguous_pte_pfns, fix
   indentation (Lorenzo), fix cover letter description (512K -> 1M)

v1->v2:
 - Expand patch descriptions, move pte declarations to a new line,
   reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
   fix loop iteration (Lorenzo)
 - Merge patch 2 and 3 (Anshuman, Lorenzo)
 - Fix maybe_contiguous_pte_pfns (Willy)

Dev Jain (2):
  mm: Call pointers to ptes as ptep
  mm: Optimize mremap() by PTE batching

 mm/mremap.c | 58 ++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 16 deletions(-)

-- 
2.30.2

