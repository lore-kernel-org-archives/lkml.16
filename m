Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FC323C8A8
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507694; cv=none; b=AAdPbaBtOI5Z7liPDJ8A0VlWM6DjOo2ORYTbGfLCd301sdVp2/cBnXhlnJf2I8E1j+94BHUrAukZI7eKbzTuFtmmy9awIMqt2ocV7B7Y9rGC/NSgt86tGKRfhf5sIcgfy6Y0BVXcrWCpMpVmNcf3JPAqiTb1zDQ4zIkjzWyvIAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507694; c=relaxed/simple;
	bh=tzOGaduVxkJCjoBvnKim0M+stVllkyzS5NkeCZriEVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dR1lUdguJde0IL9dz2sBOF59RcUHoJWB7a7POfHxxv0a4vgitFdi82F16NE2VbJ1ysx9Obm6HcdZa9Gkiu2VOLTGaw/uSGTPWE8JtXpPj1rUksOuhNG+BHgpKgk2bec6ba9GF4TGeIFL0rtxFekcN1Em3Mdt/8F0WJN/8y/Uyvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E63CF1E5E;
	Mon,  5 May 2025 22:01:22 -0700 (PDT)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.43.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F33F3F5A1;
	Mon,  5 May 2025 22:01:26 -0700 (PDT)
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
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 2/3] mm: Add generic helper to hint a large folio
Date: Tue,  6 May 2025 10:30:55 +0530
Message-Id: <20250506050056.59250-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250506050056.59250-1-dev.jain@arm.com>
References: <20250506050056.59250-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To use PTE batching, we want to determine whether the folio mapped by
the PTE is large, thus requiring the use of vm_normal_folio(). We want
to avoid the cost of vm_normal_folio() if the code path doesn't already
require the folio. For arm64, pte_batch_hint() does the job. To generalize
this hint, add a helper which will determine whether two consecutive PTEs
point to consecutive PFNs, in which case there is a high probability that
the underlying folio is large.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/pgtable.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..28e21fcc7837 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -369,6 +369,22 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 }
 #endif
 
+/* Caller must ensure that ptep + 1 exists */
+static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
+{
+	pte_t *next_ptep, next_pte;
+
+	if (pte_batch_hint(ptep, pte) != 1)
+		return true;
+
+	next_ptep = ptep + 1;
+	next_pte = ptep_get(next_ptep);
+	if (!pte_present(next_pte))
+		return false;
+
+	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);
+}
+
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
-- 
2.30.2

