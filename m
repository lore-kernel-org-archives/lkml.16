Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C587182D2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597794; cv=none; b=bLpjOueDEuYFWIiOV3ADTDYPDFNFPc5ldHxVIm8ZZyLd6VdBPnTznaLzDk7RWl32AicP9SyQnouXT13HO6jrKzcmmnxHAeRrILrZvi25pRzpCWOEnSXtAwX3gC/VW66uBYdkHTSaebIolr820Bg1y+wga9Tlz7+LB4IwJKGXCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597794; c=relaxed/simple;
	bh=NcYvpxKMwUslW+64Y+PeTXJkCOiKsSGqom4YpqThU0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JFlz2KWhS/20rGoTJEVLRSi8b/ttnHhj653NYXY82uii6Dku+Ol9c5/tVpCG6WZQ8moGcduJfwmJw/iOC8d+wR8JRnKatqLrWwjnYaIcepwO97h/pCHIv4dokTbRJZL2A489YnmmwPpYmooM99HgiRCk5hkN7QLQngUP+mh2CbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3825F2F;
	Tue,  6 May 2025 23:03:02 -0700 (PDT)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.43.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9893D3F5A1;
	Tue,  6 May 2025 23:03:04 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Optimize mremap() for large folios
Date: Wed,  7 May 2025 11:32:54 +0530
Message-Id: <20250507060256.78278-1-dev.jain@arm.com>
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

Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
munmapping it 10,000 times, the average execution time reduces from 1.9 to
1.2 seconds, giving a 37% performance optimization, on Apple M3 (arm64).

Test program for reference:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>

#define SIZE (1UL << 20) // 512 KB

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

v1->v2:
 - Expand patch descriptions, move pte declarations to a new line,
   reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
   fix loop iteration (Lorenzo)
 - Merge patch 2 and 3 (Anshuman, Lorenzo)
 - Fix maybe_contiguous_pte_pfns (Willy)

Dev Jain (2):
  mm: Call pointers to ptes as ptep
  mm: Optimize mremap() by PTE batching

 include/linux/pgtable.h | 29 ++++++++++++++++++++++
 mm/mremap.c             | 54 +++++++++++++++++++++++++++++------------
 2 files changed, 68 insertions(+), 15 deletions(-)

-- 
2.30.2

