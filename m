Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5675E22371B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904234; cv=none; b=Pc3KqYgNYbRihS4kB0YGCJ9izhogumuCCMQa+991jfBT4ySwleK4yA5V8YWeraZjK5iUk+m3FWs/r9+yVHeA0KNSdO6FaAIEmtxuuqXaqLpltJZ3XaV5y8XayE5xfs0lMgVImxJQyu4Nj8C6hJoLk9rr6OwY2MPZyaBnI2vUqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904234; c=relaxed/simple;
	bh=lZgSJyiZUL4P1NBNALtsh/Xo7TesAQuW8c0hPfgVzEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d+/4ZRi0qead6UKwCyyQuDJQG3rpXRnH8rRYRlRKOF9k49d6Mgy0xjoDUwL9kvNP1/5ky3/GnEv5Xn9DUk7VxxMC6P1v9D0O2h6zZZBc6tp2vWtIIplp3puovvXGiyBAdHZK98LyRnLLdgch+rNSpu0t1mIDqpMv4WBHs3gIw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB84E1515;
	Mon, 28 Apr 2025 22:23:44 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0692B3F5A1;
	Mon, 28 Apr 2025 22:23:41 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	namit@vmware.com,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 0/7] Optimize mprotect for large folios
Date: Tue, 29 Apr 2025 10:53:29 +0530
Message-Id: <20250429052336.18912-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset optimizes the mprotect() system call for large folios
by PTE-batching.

We use the following test cases to measure performance, mprotect()'ing
the mapped memory to read-only then read-write 40 times:

Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
pte-mapping those THPs
Test case 2: Mapping 1G of memory with 64K mTHPs
Test case 3: Mapping 1G of memory with 4K pages

Average execution time on arm64, Apple M3:
Before the patchset:
T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds

After the patchset:
T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.2 seconds

Observing T1/T2 and T3 before the patchset, we also remove the regression
introduced by ptep_get() on a contpte block. And, for large folios we get
an almost 74% performance improvement.

v1->v2:
 - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the header more resilient)
 - Abridge the anon-exclusive condition (Lance Yang)

Dev Jain (7):
  mm: Refactor code in mprotect
  mm: Optimize mprotect() by batch-skipping PTEs
  mm: Add batched versions of ptep_modify_prot_start/commit
  arm64: Add batched version of ptep_modify_prot_start
  arm64: Add batched version of ptep_modify_prot_commit
  mm: Batch around can_change_pte_writable()
  mm: Optimize mprotect() through PTE-batching

 arch/arm64/include/asm/pgtable.h |  10 ++
 arch/arm64/mm/mmu.c              |  21 +++-
 include/linux/mm.h               |   4 +-
 include/linux/pgtable.h          |  42 ++++++++
 mm/gup.c                         |   2 +-
 mm/huge_memory.c                 |   4 +-
 mm/memory.c                      |   6 +-
 mm/mprotect.c                    | 165 ++++++++++++++++++++-----------
 mm/pgtable-generic.c             |  16 ++-
 9 files changed, 198 insertions(+), 72 deletions(-)

-- 
2.30.2

