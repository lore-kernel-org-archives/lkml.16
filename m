Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DA22010EB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782413; cv=none; b=Q1Cl50C0Qi/7aaBlH8zMvDSypA2T/DK7NOh29FDKbNSFpRqBzZyFzYOftHl/h090eBOnsg/R7WdwTv6ID8r71iZB0Z837tEhX7I+8a32E8hkBqNB/3g47vQqmz+FDZSvoyMyBbrciYj5QvuciHTWz+fJVg5fjH5CVEXS4crKzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782413; c=relaxed/simple;
	bh=FygBoL0/JzEns8UKI78mxgqR1zBXu+j2bVPTD/LjJTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlAr3MdaeTDha+H/x4iy9RgXN9+f9uqekiGbZra4szowfP/8MXUh5WigqOEQtaf+GRxtfx1wPMsj3XvkGGf3ftKxcOOvq7qi64RXxWwSbH3SELX11KeVtJStjF2Av8+YZ5LL5yOFXj92IeY+PJUI++4+VJMP4HDtf1UTkkxq5Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FXBcvlGe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FXBcvlGe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bzhTX9e5Ndxofs9PWPQjKMiyjzcJ935BwY08z5T956o=; b=FXBcvlGeZ+C24swIZknr5xL0p8
	XJhae2JBOiSnCkqw22sW73oMle0AScGnnrrjrgRcsQsZKQse1RoOVdLIAp+dv1eKSBknP+k57ZXTz
	oWUMRnld+BtYXoPg9UHMvLAZzjw0c1r0zO6b6YuvPysev0lfnzXdLFdhNKt0M0ZRh4D85BOqRtvFd
	tK/plvL5cesPT7WqFT+JxUKBNBmTGj3rplsy2rhhCN5gtGHW7sANGWiNY+prH/0XWDK8ACkkP8KYO
	0V/99vErEol0YusGdeIvCekK7OkuLDr72beS/ATKgCtccaGDE3fu936DgqYjnSi8OA0ZPVlXsvrGH
	9UT0Bu0g==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSc-00000007QP0-0VvU;
	Fri, 04 Apr 2025 16:00:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSE-2u5h;
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
Subject: [RFC PATCH v2 2/7] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
Date: Fri,  4 Apr 2025 16:59:54 +0100
Message-ID: <20250404155959.3442111-2-dwmw2@infradead.org>
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
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

In the FLATMEM case, the default pfn_valid() just checks that the PFN is
within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).

The for_each_valid_pfn() function can therefore be a simple for() loop
using those as min/max respectively.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a3b5029aebbd..044536da3390 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -30,7 +30,31 @@ static inline int pfn_valid(unsigned long pfn)
 	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
 }
 #define pfn_valid pfn_valid
-#endif
+
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
+#ifndef for_each_valid_pfn
+#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
+	for (pfn = max_t(unsigned long, start_pfn, ARCH_PFN_OFFSET);	\
+	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
+			 pfn++)
+#endif /* for_each_valid_pfn */
+#endif /* valid_pfn */
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
-- 
2.49.0

