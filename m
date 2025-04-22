Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549CA27463
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309937; cv=none; b=M3LhoiLufINoNPd+rY1mO2sI7Vjwhfih+CwhQHVtnHymeDkwO51OsoTqHsNP+bq/JVl0ybaJdqAnBDvtCvujSOpQiQqKbNaKxc56ZGjdJlXIy3j2xl9WBkJZymceT+GmVAjGejpAbk/cnmG737PgIZuxX0f/Oul0icxA/gdgP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309937; c=relaxed/simple;
	bh=/SFsxDltu5ntJmXt+KaGKCcd7wB4xL2c7ePLhjMCpEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIiYIaaeIXFY0jwbVQosozdlZ4TBlvqAoIoQWQf2o5aP8tk6zI3HsYA38xid7iqYWD0pm7l3WC/N5+FlREYdQIbzcDlQJuaNcocXXhEiU3FfLyGp48ighy2w3h/ygNeB8HKBiMp/0QrQl/NTRae7uPS4bzfBZKryaLhbrUSCAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF62D176A;
	Tue, 22 Apr 2025 01:18:51 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 184D83F66E;
	Tue, 22 Apr 2025 01:18:53 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/11] mm/vmalloc: Warn on improper use of vunmap_range()
Date: Tue, 22 Apr 2025 09:18:15 +0100
Message-ID: <20250422081822.1836315-8-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
pud level. But it is possible to subsequently call vunmap_range() on a
sub-range of the mapped memory, which partially overlaps a pmd or pud.
In this case, vmalloc unmaps the entire pmd or pud so that the
no-overlapping portion is also unmapped. Clearly that would have a bad
outcome, but it's not something that any callers do today as far as I
can tell. So I guess it's just expected that callers will not do this.

However, it would be useful to know if this happened in future; let's
add a warning to cover the eventuality.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/vmalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..d60d3a29d149 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 		if (cleared || pmd_bad(*pmd))
 			*mask |= PGTBL_PMD_MODIFIED;
 
-		if (cleared)
+		if (cleared) {
+			WARN_ON(next - addr < PMD_SIZE);
 			continue;
+		}
 		if (pmd_none_or_clear_bad(pmd))
 			continue;
 		vunmap_pte_range(pmd, addr, next, mask);
@@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 		if (cleared || pud_bad(*pud))
 			*mask |= PGTBL_PUD_MODIFIED;
 
-		if (cleared)
+		if (cleared) {
+			WARN_ON(next - addr < PUD_SIZE);
 			continue;
+		}
 		if (pud_none_or_clear_bad(pud))
 			continue;
 		vunmap_pmd_range(pud, addr, next, mask);
-- 
2.43.0

