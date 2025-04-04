Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716E20102A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782413; cv=none; b=vGuII8gB8TrkzvLGutV0Xml1Vc5/nJb+iNZVpr81YJ08au2COS+xm36lBvyhpLVyzU9pMDlbYQSO3T/SprSEdYH1+OGJsgo12hhIDY/oWZE1fpfbkEzEAWcA9/yP3w2nawFq2OfHb545LmJWhdWtWfsvBHIcI+4fFgSMlrbWKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782413; c=relaxed/simple;
	bh=i6fHHtGYStakIe7Bg90EBteiVZckGCsMnn2RXRw1nM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jxCYaG21R/w8vNQ2oEDAtbsjdZasxL128jIvTgX/TOzNR0UOXIpYXbtPy09s1Owx1gst8185dN5wAOYS9HXd8CjGfMiB5aIYej5ZWoUjhnTCZwv9cbOl3Ot5UgxVSKnR4nu1AhhxPEY5g2DnqRO5ePudP/SCnzzP978qXNPyC1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GUYU/YR4; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GUYU/YR4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=P5VYLYdEkeWgyeWX/EZa0WnpJ73Q8FAesiLU/ww7Cxs=; b=GUYU/YR47lcF88YQE7EH7TpKB2
	zN7AKKvvGE+bbZSCVfqr/oyxCsvOKug18HG2HLPn2hzCCyr28tFqyGD9WE8XnLgGAI3tZkFoNGjRO
	OgjbHNJH1PDByFVu8pm8ZivdCL5MEV/GNaFUfd+wAfiibiI9zWlpJtBcaljmCVRXvO2F5RxGRDFcv
	n+kIPUAtdP9Y82yL00kM9ObdiypoF5byTbPDzb62xDr08XwYD5r8jUm8sLxrmkORJzVZ3UuKodDTs
	Em+8VmA6k36CwWivAtW5UVU9ugF9e40TqXDlsMyj8sHumr6FwIMVgjq+YOd/BBlhaaZ+R0N+DDoUj
	9yqvaGVQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSc-00000007QOy-0YLc;
	Fri, 04 Apr 2025 16:00:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSB-2cgL;
	Fri, 04 Apr 2025 16:59:59 +0100
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
	linux-mm@kvack.org
Subject: [RFC PATCH v2 1/7] mm: Introduce for_each_valid_pfn() and use it from reserve_bootmem_region()
Date: Fri,  4 Apr 2025 16:59:53 +0100
Message-ID: <20250404155959.3442111-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

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
index 25e80b2ca7f4..32ecb5cadbaf 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2176,6 +2176,16 @@ void sparse_init(void);
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
index a38a1909b407..7c699bad42ad 100644
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

