Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214CB1925AB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625135; cv=none; b=QFVgamEekXXVkOgiNLjg8XSLNYScRrKLwZ1oJhN6eyshkxr3wzG5qRyBeHLsaPuBFDRBN3cs4EvTMatvKzAz/C4pV/RvhoHNRxPIE7C2ZvvRg25aTbatS9X3vgzDLhQyYMlRDd9tuq0JGQ6Q5u2HO14OyPSxDsjQs0w2uDbX0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625135; c=relaxed/simple;
	bh=XHyDFP0jYnL7x023MINILK7M6WdT8s1+oUeFwb4rg/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLVJGr2ObcGa0ynS52QOfov45OYDayX27gQl1eL1tVm2rtmNmKCmZNc41B+kxTlm7am58z2Ma+GyQWsUdGotF8w6zmisz1FNpbg+RX0dspRPCDk1DVQ7kMP9i9FH2fzBH8zFle5+G9j1jNNfMLqdDOqopd7/x6lueSr76RlUEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=axLO7djj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="axLO7djj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ARg7i8/7R/o0DITALlPq6tBgDHCD4rhJgI/lZjiTKt0=; b=axLO7djjobtsjWQ1aIARrbP65F
	sOZyGGv5vn7VsWGTopSz4jE35s4eP5zwPrrImxq/C644MBHgOGC05qmUvm76DgKwDekfCVsjxlfcX
	860G3h6nkqsvQRlUQlRevVJvKDMZCAtT4kMLrJirp3zuXSiJrQvgHT/dq5SKvFhhdO/vcZtfzdHko
	FdvcCldiguFQGQbGGTHDO1X2cWrG1vNlhXLCPw/Ce2YrNAMkN44SHkJsv0VfmFyOaOCOrgSZbniVl
	XzXZAEIUy8WRW9zhgDRymfDslmSgybEJWSkV67MyJDaKb1Kp8mq572qB/MgU6TydUFI6w5x6xew4L
	7Hyj9v5w==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Xr-0000000759o-0W4X;
	Wed, 02 Apr 2025 20:18:43 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Xp-0000000DcHF-31hz;
	Wed, 02 Apr 2025 21:18:41 +0100
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
Subject: [RFC PATCH 3/3] mm: Implement for_each_valid_pfn() for CONFIG_SPARSEMEM
Date: Wed,  2 Apr 2025 21:18:41 +0100
Message-ID: <20250402201841.3245371-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402201841.3245371-1-dwmw2@infradead.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
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

Introduce a pfn_first_valid() helper which takes a pointer to the PFN and
updates it to point to the first valid PFN starting from that point, and
returns true if a valid PFN was found.

This largely mirrors pfn_valid(), calling into a pfn_section_first_valid()
helper which is trivial for the !CONFIG_SPARSEMEM_VMEMMAP case, and in
the VMEMMAP case will skip to the next subsection as needed.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/linux/mmzone.h | 65 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 32ecb5cadbaf..a389d1857b85 100644
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
@@ -2127,6 +2153,45 @@ static inline int pfn_valid(unsigned long pfn)
 
 	return ret;
 }
+
+static inline bool first_valid_pfn(unsigned long *p_pfn)
+{
+	unsigned long pfn = *p_pfn;
+	unsigned long nr = pfn_to_section_nr(pfn);
+	struct mem_section *ms;
+	bool ret = false;
+
+	ms = __pfn_to_section(pfn);
+
+	rcu_read_lock_sched();
+
+	while (!ret && nr <= __highest_present_section_nr) {
+		if (valid_section(ms) &&
+		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
+			ret = true;
+			break;
+		}
+
+		nr++;
+		if (nr > __highest_present_section_nr)
+			break;
+
+		pfn = section_nr_to_pfn(nr);
+		ms = __pfn_to_section(pfn);
+	}
+
+	rcu_read_unlock_sched();
+
+	*p_pfn = pfn;
+
+	return ret;
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

