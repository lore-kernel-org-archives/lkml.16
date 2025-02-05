Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B776E1DB34C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768257; cv=none; b=NB6ckWHav8a9YilkWf4Z4O3rZQxU1oQJ7oXRXeZiviemKHCKe59kZQINi+Cjo5LB2m3wjST7lsIJczFYeMGxJdbWw/C+UN09xh6J3Ftg0LqfuzLDqZCtwzFVU7iOqB4H+gceU58K1xPDFWSgvc0HPqpd5KSXUL1Iy9wfxoP8ifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768257; c=relaxed/simple;
	bh=3+ri9qq2fCmQAM0EaC9iYqAON/JEG066r4jXDBoLZLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REJnrDrbbDl/E1JULtU0l9gclo4na4BV+Fl8l/g9oMdVKCoNX9bku7dxbqO+WSDzwKorkKT5kgDGoaQch2Dw/pKyx33JotMGGngcCJoKz9F2TjmIWrYKNq7/ZUwq4lA9EnTcnZTQDXLByLt+2PMGP/6ZHbagN8VfvK9OhkJ78dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC4DA1063;
	Wed,  5 Feb 2025 07:11:18 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D00F53F5A1;
	Wed,  5 Feb 2025 07:10:52 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/16] mm/vmalloc: Warn on improper use of vunmap_range()
Date: Wed,  5 Feb 2025 15:09:50 +0000
Message-ID: <20250205151003.88959-11-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
pud level. But it is possible to subsquently call vunmap_range() on a
sub-range of the mapped memory, which partially overlaps a pmd or pud.
In this case, vmalloc unmaps the entire pmd or pud so that the
no-overlapping portion is also unmapped. Clearly that would have a bad
outcome, but it's not something that any callers do today as far as I
can tell. So I guess it's jsut expected that callers will not do this.

However, it would be useful to know if this happened in future; let's
add a warning to cover the eventuality.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/vmalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a6e7acebe9ad..fcdf67d5177a 100644
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

