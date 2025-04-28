Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F662AEED
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841880; cv=none; b=RSIWgiKS2wEaN8mqsjdQdGMCYKpAV8BuXmutYm/kM3DOkEx5IB1KfDYfGee11g8fcq3az+g/v07u/CxhbaytUGxDaP/Fu8yg3hUYAk1b7ExtITzUWrSPIr74dsGZ0P4QlsBjrz9X6yVk4JdGlp+NI1YoFf6Sk4toHNLhzRgg3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841880; c=relaxed/simple;
	bh=vBmy2/OFBQmtoZCZANDKIT5yIL4J+Nkr/N4mHP+NFms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RJwJ7UDhnKvassNH5Oms28CJyM3H1u8UZAtBgpXLMub8k/ZgzQoiYk8egCOXIFgW0eRDXenTTuNiNJfzVB9suRZNFXGy3PjZCth2gbHQoTup2gqbMDIYInym+8K8n1yLhhnRHe7HozZ+HAe2vhHC+iWpZQut90qfVHGBXZonKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 107931516;
	Mon, 28 Apr 2025 05:04:31 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E54B93F66E;
	Mon, 28 Apr 2025 05:04:27 -0700 (PDT)
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
Subject: [PATCH 0/7] Optimize mprotect for large folios
Date: Mon, 28 Apr 2025 17:34:07 +0530
Message-Id: <20250428120414.12101-1-dev.jain@arm.com>
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
an almost 276% performance improvement.

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
 mm/mprotect.c                    | 163 +++++++++++++++++++++----------
 mm/pgtable-generic.c             |  16 ++-
 9 files changed, 198 insertions(+), 70 deletions(-)

-- 
2.30.2

