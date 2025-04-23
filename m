Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6735F26FA5D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396324; cv=none; b=dEH3A93cJGs0ICANrBY77E9OBoYR2UzRQPfL77w6qPxiNQcVodpXmNoqO/Cua/sZYlsceHBPVCUPQQSL3x7/0S7RJ+7K9JpHMbm71/gJNDQd2XM0wI2TuO0cc8BF6Nl9/kcBZt0zVEUfPK68jTBiufjunpvNgJdJgwf87Th8ZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396324; c=relaxed/simple;
	bh=toeSDI6RZRrxqez6wabYiEd25migVfEcBnITfLHIlj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2m7DIhBYwR08pJUqkBsEeljGFQjPef0U+teB5ilA3u3f+rvv+wE4S/7q8HCRZ8IJT6m2ju3IvpD/HyZkg17fvxmqKNG4bkI5zLylgIHyYQKCgcIPMj/gXnVuJdPmJqwRiFbSpd45fBicMw4/0phdbxrskPGPtvaqY1M1OSbwO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WEUdl/rV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WEUdl/rV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=NJbaNH4W3yPbLyC+ZTcgmLXA2i0jKLuqPtxQoIRJ/KA=; b=WEUdl/rVsKvvnnQFVRM5PtO990
	ivSqRMqjmtKIjCWM5FwEH96/6j1Hh1WDWxgrhpqO88J2lqObGFBA+tDf3aQow6apiBiWlFMHp0DWu
	Dn6TgfjNuA3mltFv9DbPw/HUszTjJAcY2ab2IiYxXpM9edV/ELdlKyFGJwOvuXjVr6+2f/cdzWrJv
	6Nvv6WTVHgoJeOPPO9eiSDnWXLjTKPhaUJ4Rud9T5q3BjgR1qABGGc/wh0p60zDs/eN1+Oz1vFktq
	6EGwmw0W563E/MMI9W75F+JVUmWbakPH9s9eVFIRdmdc+DhXUFfoFk2ysaklJ+ZLt03Vd2zVW/hND
	mmKiLwUQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VJQ-000000081P4-0FRV;
	Wed, 23 Apr 2025 08:18:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNn-0kqz;
	Wed, 23 Apr 2025 09:18:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v3 1/7] mm: Introduce for_each_valid_pfn() and use it from reserve_bootmem_region()
Date: Wed, 23 Apr 2025 08:52:43 +0100
Message-ID: <20250423081828.608422-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423081828.608422-1-dwmw2@infradead.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Especially since commit 9092d4f7a1f8 ("memblock: update initialization
of reserved pages"), the reserve_bootmem_region() function can spend a
significant amount of time iterating over every 4KiB PFN in a range,
calling pfn_valid() on each one, and ultimately doing absolutely nothing.

On a platform used for virtualization, with large NOMAP regions that
eventually get used for guest RAM, this leads to a significant increase
in steal time experienced during kexec for a live update.

Introduce for_each_valid_pfn() and use it from reserve_bootmem_region().
This implementation is precisely the same naïve loop that the function
used to have, but subsequent commits will provide optimised versions
for FLATMEM and SPARSEMEM, and this version will remain for those
architectures which provide their own pfn_valid() implementation,
until/unless they also provide a matching for_each_valid_pfn().

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/mmzone.h | 10 ++++++++++
 mm/mm_init.c           | 23 ++++++++++-------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6ccec1bf2896..230a29c2ed1a 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2177,6 +2177,16 @@ void sparse_init(void);
 #define subsection_map_init(_pfn, _nr_pages) do {} while (0)
 #endif /* CONFIG_SPARSEMEM */
 
+/*
+ * Fallback case for when the architecture provides its own pfn_valid() but
+ * not a corresponding for_each_valid_pfn().
+ */
+#ifndef for_each_valid_pfn
+#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
+	for ((_pfn) = (_start_pfn); (_pfn) < (_end_pfn); (_pfn)++)	\
+		if (pfn_valid(_pfn))
+#endif
+
 #endif /* !__GENERATING_BOUNDS.H */
 #endif /* !__ASSEMBLY__ */
 #endif /* _LINUX_MMZONE_H */
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9659689b8ace..41884f2155c4 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -777,22 +777,19 @@ static inline void init_deferred_page(unsigned long pfn, int nid)
 void __meminit reserve_bootmem_region(phys_addr_t start,
 				      phys_addr_t end, int nid)
 {
-	unsigned long start_pfn = PFN_DOWN(start);
-	unsigned long end_pfn = PFN_UP(end);
+	unsigned long pfn;
 
-	for (; start_pfn < end_pfn; start_pfn++) {
-		if (pfn_valid(start_pfn)) {
-			struct page *page = pfn_to_page(start_pfn);
+	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
+		struct page *page = pfn_to_page(pfn);
 
-			init_deferred_page(start_pfn, nid);
+		init_deferred_page(pfn, nid);
 
-			/*
-			 * no need for atomic set_bit because the struct
-			 * page is not visible yet so nobody should
-			 * access it yet.
-			 */
-			__SetPageReserved(page);
-		}
+		/*
+		 * no need for atomic set_bit because the struct
+		 * page is not visible yet so nobody should
+		 * access it yet.
+		 */
+		__SetPageReserved(page);
 	}
 }
 
-- 
2.49.0

