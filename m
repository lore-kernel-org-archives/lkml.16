Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F93279355
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396331; cv=none; b=VNdMQAZzHpGHxGCc+N9IikvVLKIS/RecZUutdLmUV2lb6/82hf3W9kuHn0JBorkCHdC234cIl8VSZgbz1qBw/vxYu23doYsIN1NqmAt6wTcTx7R9lxjYahgQ4iJ1cam1ffxo3aAq8H7YAbBD+ye0Tl6SRD9QNRAfQdEQUL2lSMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396331; c=relaxed/simple;
	bh=dmaW+Ya7giUzZii7t5MxnMhB1N77MyEn2vjV5jlY14w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Div55plFs6BEprQl4DX3LEWBE2lhMvSYNHlKb5ngFVx+lT9kBp71IXeRV6nR/QutPIlAyaZlm8hphW9kkJagmpZ0Ywua5p0w4P11ZKzZ4ZB9hTZbMgYr3WvkssLZq+OunlkEXGmu/OcedxiHMMNbqpn3QEvnYVG0HoZQ+iNI2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e16xgsqx; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e16xgsqx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/QxP+QorPaa2Tzcn88O9030NShTMbuO4EdTafyQOEYk=; b=e16xgsqxWp/TFTt4kTtzrCKnsJ
	lhB5OpLgmwmq6A6S+tw2fer+PblQ1YUkcu0i5egxL0+8r3b5PmrA/a5EXzxWJgUOHKYqur9a7XRRl
	bHXtVlkMg+p6YW+K3Udfo3Cihy8v8s6jmwqIY870hNx2vGf57l3Dxh1hFRv/47QP6zA4aafI3jG7p
	SVmvF4AVUYDwsKAlBCNEyNko0oapQo7CGPMWew9i1X4mKmIwZcZx40bWktuo+oCSLNTMwtBpjKioj
	h5SD6M33U8PryDacRer2acWhLp42i+MpHPYn9l2cmOsTCKIFKERDqRTIqDyy8BcnR5S5r89RbNS0w
	RS/a/g+A==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOih-1XXI;
	Wed, 23 Apr 2025 08:18:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNt-1NB4;
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
Subject: [PATCH v3 3/7] mm: Implement for_each_valid_pfn() for CONFIG_SPARSEMEM
Date: Wed, 23 Apr 2025 08:52:45 +0100
Message-ID: <20250423081828.608422-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423081828.608422-1-dwmw2@infradead.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Implement for_each_valid_pfn() based on two helper functions.

The first_valid_pfn() function largely mirrors pfn_valid(), calling into
a pfn_section_first_valid() helper which is trivial for the !VMEMMAP case,
and in the VMEMMAP case will skip to the next subsection as needed.

Since next_valid_pfn() knows that its argument *is* a valid PFN, it
doesn't need to do any checking at all while iterating over the low bits
within a (sub)section mask; the whole (sub)section is either present or
not.

Note that the VMEMMAP version of pfn_section_first_valid() may return a
value *higher* than end_pfn when skipping to the next subsection, and
first_valid_pfn() happily returns that higher value. This is fine.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Previous-revision-reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/asm-generic/memory_model.h | 26 ++++++++--
 include/linux/mmzone.h             | 78 ++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index 74d0077cc5fa..044536da3390 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -31,12 +31,28 @@ static inline int pfn_valid(unsigned long pfn)
 }
 #define pfn_valid pfn_valid
 
+static inline bool first_valid_pfn(unsigned long *pfn)
+{
+	/* avoid <linux/mm.h> include hell */
+	extern unsigned long max_mapnr;
+	unsigned long pfn_offset = ARCH_PFN_OFFSET;
+
+	if (*pfn < pfn_offset) {
+		*pfn = pfn_offset;
+		return true;
+	}
+
+	if ((*pfn - pfn_offset) < max_mapnr)
+		return true;
+
+	return false;
+}
+
 #ifndef for_each_valid_pfn
-#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			 \
-	for ((pfn) = max_t(unsigned long, (start_pfn), ARCH_PFN_OFFSET); \
-	     (pfn) < min_t(unsigned long, (end_pfn),			 \
-			   ARCH_PFN_OFFSET + max_mapnr);		 \
-	     (pfn)++)
+#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
+	for (pfn = max_t(unsigned long, start_pfn, ARCH_PFN_OFFSET);	\
+	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
+			 pfn++)
 #endif /* for_each_valid_pfn */
 #endif /* valid_pfn */
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 230a29c2ed1a..dab1d31477d7 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2075,11 +2075,37 @@ static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
 
 	return usage ? test_bit(idx, usage->subsection_map) : 0;
 }
+
+static inline bool pfn_section_first_valid(struct mem_section *ms, unsigned long *pfn)
+{
+	struct mem_section_usage *usage = READ_ONCE(ms->usage);
+	int idx = subsection_map_index(*pfn);
+	unsigned long bit;
+
+	if (!usage)
+		return false;
+
+	if (test_bit(idx, usage->subsection_map))
+		return true;
+
+	/* Find the next subsection that exists */
+	bit = find_next_bit(usage->subsection_map, SUBSECTIONS_PER_SECTION, idx);
+	if (bit == SUBSECTIONS_PER_SECTION)
+		return false;
+
+	*pfn = (*pfn & PAGE_SECTION_MASK) + (bit * PAGES_PER_SUBSECTION);
+	return true;
+}
 #else
 static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
 {
 	return 1;
 }
+
+static inline bool pfn_section_first_valid(struct mem_section *ms, unsigned long *pfn)
+{
+	return true;
+}
 #endif
 
 void sparse_init_early_section(int nid, struct page *map, unsigned long pnum,
@@ -2128,6 +2154,58 @@ static inline int pfn_valid(unsigned long pfn)
 
 	return ret;
 }
+
+/* Returns end_pfn or higher if no valid PFN remaining in range */
+static inline unsigned long first_valid_pfn(unsigned long pfn, unsigned long end_pfn)
+{
+	unsigned long nr = pfn_to_section_nr(pfn);
+
+	rcu_read_lock_sched();
+
+	while (nr <= __highest_present_section_nr && pfn < end_pfn) {
+		struct mem_section *ms = __pfn_to_section(pfn);
+
+		if (valid_section(ms) &&
+		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
+			rcu_read_unlock_sched();
+			return pfn;
+		}
+
+		/* Nothing left in this section? Skip to next section */
+		nr++;
+		pfn = section_nr_to_pfn(nr);
+	}
+
+	rcu_read_unlock_sched();
+	return end_pfn;
+}
+
+static inline unsigned long next_valid_pfn(unsigned long pfn, unsigned long end_pfn)
+{
+	pfn++;
+
+	if (pfn >= end_pfn)
+		return end_pfn;
+
+	/*
+	 * Either every PFN within the section (or subsection for VMEMMAP) is
+	 * valid, or none of them are. So there's no point repeating the check
+	 * for every PFN; only call first_valid_pfn() the first time, and when
+	 * crossing a (sub)section boundary (i.e. !(pfn & ~PFN_VALID_MASK)).
+	 */
+	if (pfn & (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
+		   PAGE_SUBSECTION_MASK : PAGE_SECTION_MASK))
+		return pfn;
+
+	return first_valid_pfn(pfn, end_pfn);
+}
+
+
+#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
+	for ((_pfn) = first_valid_pfn((_start_pfn), (_end_pfn));	\
+	     (_pfn) < (_end_pfn);					\
+	     (_pfn) = next_valid_pfn((_pfn), (_end_pfn)))
+
 #endif
 
 static inline int pfn_in_present_section(unsigned long pfn)
-- 
2.49.0

