Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD247E0E4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782514; cv=none; b=LXVj4EsywHgAXmjAx7fIjCoMtccwZoV08iHdnYzE63nxVOiDIJRBz0Bj+7yWQfzXUnqck5G6eSJl2Aa2q2pZ/84FSOZLdZuuPLZ0tfZkulYilr+AlK6ZX9JMJncdaNuN67m3IkbEv0+4SR4Xaev09EznTKD6W28qXAIs1E8QwLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782514; c=relaxed/simple;
	bh=Pwet/N6ectL13CRRMfRmHW9e+d4SRCQ7DW4ejqRpIAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFxXCG7rZ6t9LunvMxx4AYPHOs//6cOYC+15GVc3k6sN5+6FB6aAXsAeqwiM0o+TdxdYw7UCwGB1ssFFzafn4bAtcq/bGq8ctLVprPy/QcOZZhqLvUcfj/k2QkTU6Hoc4xfJ/bw8TG90lh+8Snditcot3zsNjdKXzRfMrqZhN2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RWsr+E1e; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RWsr+E1e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MbqCUn6gz37WzeN1KZjuSX3PD2UQTnr+fmi1Atuk78g=; b=RWsr+E1eF3WBGQC6oJ449g9gwA
	SsSn8lnsUC2YHgCc1DkPkPKUDY6p05kQ+DQHTMZxOHadeL32SbwkTwJzKhfQt/wfDVlQW8LT7jUZt
	VX02qdQbHulXzvoBi+9rj6QYyJI/ylZjTYb8TVl1afWmLJP+zM5u8vNCNCebmdlJ2y8SBe/ZXyXt/
	JJSQzpsnNFWFUa2iVi2mxTLgNYe1QyHZhX8Ij0hjPdB6nmog4HCDepVSKqkH+UqV5YSpcns6K4gS4
	9UCNGOU2P1ees86sHyldV/kbLqCzOHfVVIER2EGdjXCQetTdlO1ArY++q7RNBABd1DojRtj+sALb7
	Zq45ERmg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSa-0000000GFHx-39D6;
	Fri, 04 Apr 2025 16:01:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSH-3DUK;
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
Subject: [RFC PATCH v2 3/7] mm: Implement for_each_valid_pfn() for CONFIG_SPARSEMEM
Date: Fri,  4 Apr 2025 16:59:55 +0100
Message-ID: <20250404155959.3442111-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404155959.3442111-1-dwmw2@infradead.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Introduce a pfn_first_valid() helper which takes a pointer to the PFN and
updates it to point to the first valid PFN starting from that point, and
returns true if a valid PFN was found.

This largely mirrors pfn_valid(), calling into a pfn_section_first_valid()
helper which is trivial for the !CONFIG_SPARSEMEM_VMEMMAP case, and in
the VMEMMAP case will skip to the next subsection as needed.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/mmzone.h | 59 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 32ecb5cadbaf..67cdf675a4b9 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2074,11 +2074,37 @@ static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
 
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
@@ -2127,6 +2153,39 @@ static inline int pfn_valid(unsigned long pfn)
 
 	return ret;
 }
+
+static inline bool first_valid_pfn(unsigned long *p_pfn)
+{
+	unsigned long pfn = *p_pfn;
+	unsigned long nr = pfn_to_section_nr(pfn);
+
+	rcu_read_lock_sched();
+
+	while (nr <= __highest_present_section_nr) {
+		struct mem_section *ms = __pfn_to_section(pfn);
+
+		if (valid_section(ms) &&
+		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
+			*p_pfn = pfn;
+			rcu_read_unlock_sched();
+			return true;
+		}
+
+		/* Nothing left in this section? Skip to next section */
+		nr++;
+		pfn = section_nr_to_pfn(nr);
+	}
+
+	rcu_read_unlock_sched();
+
+	return false;
+}
+
+#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	       \
+	for ((_pfn) = (_start_pfn);			       \
+	     first_valid_pfn(&(_pfn)) && (_pfn) < (_end_pfn);  \
+	     (_pfn)++)
+
 #endif
 
 static inline int pfn_in_present_section(unsigned long pfn)
-- 
2.49.0

