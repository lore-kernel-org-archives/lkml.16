Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8A1FF1D3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782514; cv=none; b=MjGXZLqnz5sUKvguURKwS2ZJftNVDinZcB900uzv4XX2pw3u0jmyzUe2ySElvN1WIKQxy6KwjmGvbQQZoNg3YzJVNkeQ10C2zeg83XtpMViCoV1NPIHs6lShhcKjS2FyGKEuPxZ21mPCFFcR80UnxkQcejdsmngt2lOikVJO7O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782514; c=relaxed/simple;
	bh=/cSuZ2ry+Hjly/otfqO/xvLUJU3iF2v3OiKaziTIISI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ON8twSAFCFXt/VNErPz2zjcdex10iFcw7GIBLlXrWJjDyAKy0pvakGoLXGOYMl8FE5pRmyt527TavFeg4YX8kXAQjnAje+byj24NKaMngW9Ax6Xe+12ZAqTC8W5VUC5NtIAQg+k5TA08PgHU53sY8VdLlScb6SB0xFGcGDbh9F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DXHzSB3s; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DXHzSB3s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=O+396y0rDBKXn/tGzn/xwAn8Ku375WZ2ZAT9PS+Ub5w=; b=DXHzSB3si2aN61sd7dOw7Dkduk
	TfChbYRNdb3ACgbes0kuBN7Ps4Sy5/UipeFG8/Xla7pFYuFAZjAv8ghlbw60pID0KBmbGy7KhdoZX
	xFeg4W6Khe91Ifz1tB9jPFsxfe3bqKisa6rPuuYszWXM+JzP0nj3JG8rUww67uY/Mv9WHKvRsSeQX
	Ok99/gqCaltwnaMSZvz4drLWaLh2mGbx5jBswPyNZtO7LBeN9BcJh4IWoGNNd4OiLAnX2VY16JZlL
	QP6zoE/Go4gQZXoAjZGtme0XAK6mXGvw/o5DoYFynT49usw3UBp1GA3ggRsbCxmI+nr/eYZ4vp6BK
	LUawAvyw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSa-0000000GFHy-3ANo;
	Fri, 04 Apr 2025 16:01:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSK-3V46;
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
Subject: [RFC PATCH v2 4/7] mm: Optimise SPARSEMEM implementation of for_each_valid_pfn()
Date: Fri,  4 Apr 2025 16:59:56 +0100
Message-ID: <20250404155959.3442111-4-dwmw2@infradead.org>
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

There's no point in checking the section and subsection bitmap for *every*
PFN in the same section; they're either all valid or they aren't.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/linux/mmzone.h | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 67cdf675a4b9..0da1b0ba5d9f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2154,21 +2154,20 @@ static inline int pfn_valid(unsigned long pfn)
 	return ret;
 }
 
-static inline bool first_valid_pfn(unsigned long *p_pfn)
+/* Returns -1 (an invalid PFN) if no valid PFN remaining */
+static inline unsigned long first_valid_pfn(unsigned long pfn, unsigned long end_pfn)
 {
-	unsigned long pfn = *p_pfn;
 	unsigned long nr = pfn_to_section_nr(pfn);
 
 	rcu_read_lock_sched();
 
-	while (nr <= __highest_present_section_nr) {
+	while (nr <= __highest_present_section_nr && pfn < end_pfn) {
 		struct mem_section *ms = __pfn_to_section(pfn);
 
 		if (valid_section(ms) &&
 		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
-			*p_pfn = pfn;
 			rcu_read_unlock_sched();
-			return true;
+			return pfn;
 		}
 
 		/* Nothing left in this section? Skip to next section */
@@ -2177,14 +2176,34 @@ static inline bool first_valid_pfn(unsigned long *p_pfn)
 	}
 
 	rcu_read_unlock_sched();
+	return (unsigned long)-1;
+}
 
-	return false;
+static inline unsigned long next_valid_pfn(unsigned long pfn, unsigned long end_pfn)
+{
+	pfn++;
+
+	if (pfn >= end_pfn)
+		return (unsigned long)-1;
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
 }
 
-#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	       \
-	for ((_pfn) = (_start_pfn);			       \
-	     first_valid_pfn(&(_pfn)) && (_pfn) < (_end_pfn);  \
-	     (_pfn)++)
+
+#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
+	for ((_pfn) = first_valid_pfn((_start_pfn), (_end_pfn));	\
+	     (_pfn) != (unsigned long)-1;				\
+	     (_pfn) = next_valid_pfn((_pfn), (_end_pfn)))
 
 #endif
 
-- 
2.49.0

