Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8851B532F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768251; cv=none; b=LmI9Zo6bSc43z/SZQYkrhI0ELadSkDTmey+yfK7jl9miQkBh7DZWUV2BlX6Q9w7KoaSwtYUgT3rdS6xZAdqDzcfXOuCkmCTBq8ysGmP/sUuHmdw2rB96jUynk77ydvHpPkHryAQqOwZNtbDucpI78661rqg0dT5j1V5DJX3zSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768251; c=relaxed/simple;
	bh=Vl8FxaSXqon0BJeHQ6SiEPfjucP2xExTZXy5dxc2Euw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfvSDv93yaMA+fystggRCtufOA8nfQG1Im17vMR63uJPuR4wg7LPV72ouOSF/4BxIJpGWh82Eg/SCTWApwTmcGTiSR0ka8OI3l3kEheTfv1oid9echiY4NJ4ZzuoISpqNL686WsNlBXGQABkVdjkchYKlIhHLosqviSgna++Lec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B6AD1063;
	Wed,  5 Feb 2025 07:11:13 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F23B3F5A1;
	Wed,  5 Feb 2025 07:10:47 -0800 (PST)
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
Subject: [PATCH v1 08/16] arm64/mm: Hoist barriers out of ___set_ptes() loop
Date: Wed,  5 Feb 2025 15:09:48 +0000
Message-ID: <20250205151003.88959-9-ryan.roberts@arm.com>
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

___set_ptes() previously called __set_pte() for each PTE in the range,
which would conditionally issue a DSB and ISB to make the new PTE value
immediately visible to the table walker if the new PTE was valid and for
kernel space.

We can do better than this; let's hoist those barriers out of the loop
so that they are only issued once at the end of the loop. We then reduce
the cost by the number of PTEs in the range.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3b55d9a15f05..1d428e9c0e5a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -317,10 +317,8 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
 	WRITE_ONCE(*ptep, pte);
 }
 
-static inline void __set_pte(pte_t *ptep, pte_t pte)
+static inline void __set_pte_complete(pte_t pte)
 {
-	__set_pte_nosync(ptep, pte);
-
 	/*
 	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
 	 * or update_mmu_cache() have the necessary barriers.
@@ -331,6 +329,12 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 	}
 }
 
+static inline void __set_pte(pte_t *ptep, pte_t pte)
+{
+	__set_pte_nosync(ptep, pte);
+	__set_pte_complete(pte);
+}
+
 static inline pte_t __ptep_get(pte_t *ptep)
 {
 	return READ_ONCE(*ptep);
@@ -647,12 +651,14 @@ static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 
 	for (;;) {
 		__check_safe_pte_update(mm, ptep, pte);
-		__set_pte(ptep, pte);
+		__set_pte_nosync(ptep, pte);
 		if (--nr == 0)
 			break;
 		ptep++;
 		pte = pte_advance_pfn(pte, stride);
 	}
+
+	__set_pte_complete(pte);
 }
 
 static inline void __set_ptes(struct mm_struct *mm,
-- 
2.43.0

