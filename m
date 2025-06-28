Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC1319597F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751110507; cv=none; b=cGQ4z5Yt/xcrQSNNx2cXwVCNSXoCTjaGhKFEE4deoqIFSOXRi0BxdvIZcr6V5n7QDCi1KYF5GFVDNaBg06q5iEniDXf9qFt4/DA2ayyE3LQfsVHgnFNR7bjQgBdMTD/WV9LGbRVyZdlxSOtveGN7Dj1l17ejgLogu53BuhYBg94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751110507; c=relaxed/simple;
	bh=gbEjsja0XeAEuUE5t3N5d+TJcHcHoarn4TkhbyGv7Ac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WTDyPubSqPQK1xNjUxUfitNWuQ77agu2NrCDOowKb49rS2fW3aoURhNb8j/eaX1XDL5Q3qKuOJU6yMbdiLtdbABLW+Yc4O7mJV1yFvpAyRo6xMtgd61AAUVUr1X1AYiMZWlHfobmQRLK6uetjJ0aIpV6qZ3GADfWNN4wMOm9mqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B49D01BD0;
	Sat, 28 Jun 2025 04:34:46 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC5763F762;
	Sat, 28 Jun 2025 04:34:55 -0700 (PDT)
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
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v4 0/4] Optimize mprotect() for large folios
Date: Sat, 28 Jun 2025 17:04:31 +0530
Message-Id: <20250628113435.46678-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset optimizes the mprotect() system call for large folios
by PTE-batching. No issues were observed with mm-selftests, build
tested on x86_64.

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
T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds

Observing T1/T2 and T3 before the patchset, we also remove the regression
introduced by ptep_get() on a contpte block. And, for large folios we get
an almost 74% performance improvement, albeit the trade-off being a slight
degradation in the small folio case.

Here is the test program:

 #define _GNU_SOURCE
 #include <sys/mman.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdio.h>
 #include <unistd.h>

 #define SIZE (1024*1024*1024)

unsigned long pmdsize = (1UL << 21);
unsigned long pagesize = (1UL << 12);

static void pte_map_thps(char *mem, size_t size)
{
	size_t offs;
	int ret = 0;


	/* PTE-map each THP by temporarily splitting the VMAs. */
	for (offs = 0; offs < size; offs += pmdsize) {
		ret |= madvise(mem + offs, pagesize, MADV_DONTFORK);
		ret |= madvise(mem + offs, pagesize, MADV_DOFORK);
	}

	if (ret) {
		fprintf(stderr, "ERROR: mprotect() failed\n");
		exit(1);
	}
}

int main(int argc, char *argv[])
{
	char *p;
        int ret = 0;
	p = mmap((1UL << 30), SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (p != (1UL << 30)) {
		perror("mmap");
		return 1;
	}



	memset(p, 0, SIZE);
	if (madvise(p, SIZE, MADV_NOHUGEPAGE))
		perror("madvise");
	explicit_bzero(p, SIZE);
	pte_map_thps(p, SIZE);

	for (int loops = 0; loops < 40; loops++) {
		if (mprotect(p, SIZE, PROT_READ))
			perror("mprotect"), exit(1);
		if (mprotect(p, SIZE, PROT_READ|PROT_WRITE))
			perror("mprotect"), exit(1);
		explicit_bzero(p, SIZE);
	}
}

---
The patchset is rebased onto Saturday's mm-new.

v3->v4:
 - Refactor skipping logic into a new function, edit patch 1 subject
   to highlight it is only for MM_CP_PROT_NUMA case (David H)
 - Refactor the optimization logic, add more documentation to the generic
   batched functions, do not add clear_flush_ptes, squash patch 4
   and 5 (Ryan)

v2->v3:
 - Add comments for the new APIs (Ryan, Lorenzo)
 - Instead of refactoring, use a "skip_batch" label
 - Move arm64 patches at the end (Ryan)
 - In can_change_pte_writable(), check AnonExclusive page-by-page (David H)
 - Resolve implicit declaration; tested build on x86 (Lance Yang)

v1->v2:
 - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the header more resilient)
 - Abridge the anon-exclusive condition (Lance Yang)

Dev Jain (4):
  mm: Optimize mprotect() for MM_CP_PROT_NUMA by batch-skipping PTEs
  mm: Add batched versions of ptep_modify_prot_start/commit
  mm: Optimize mprotect() by PTE-batching
  arm64: Add batched versions of ptep_modify_prot_start/commit

 arch/arm64/include/asm/pgtable.h |  10 ++
 arch/arm64/mm/mmu.c              |  28 +++-
 include/linux/pgtable.h          |  83 +++++++++-
 mm/mprotect.c                    | 269 +++++++++++++++++++++++--------
 4 files changed, 315 insertions(+), 75 deletions(-)

-- 
2.30.2

