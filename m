Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147F1917E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625135; cv=none; b=qxtURwcOTE0MCsExumh1Dr9wGX6IDTPMamsgW6ITLIod6/Qd9U9hUbnt8y38R4h1Ap20BzSmoq44nBApGAk8U8BA0OS3KfKyjeohgKCy6Zz0IGQoGSh1YV9vYQahHF7oJRt2Zrr5XBEumX3UvsiUPXTOvhVh6cVCFR7u7UlSxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625135; c=relaxed/simple;
	bh=pvzNF8A+AU0+tZ3YWDTE0Myk5ztkcNzWkwDUUigP80o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jB35caivYpX3RP6/7u5Ar5uUVAs+kUZxCTtwUjOdJJpDoGCaTpUskAh47Kc6XamcIC3vJcVatWdwqW6SwT6WsOLTL1XP6DsqjnnPdVnzThygeP0ml8ry9nCmlrI+bcYSFO0XyJZPtiWvljdMiEJZAxISwVQgiQZkpSZllSvuBwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Nfrz3ROG; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nfrz3ROG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QLbPJRlyqVSx0cIJ3mGyFLKANvzzRuV5I+YYDBn/Qb0=; b=Nfrz3ROGXN0O80DToFCDxfu6XG
	yoyUyBkZqiwBQIjSx0CUpkS7l7FsHD3njuvDumbfUaGa2zSt7S3oisW9uQx3hTFhvpXaN/ObTk1Ow
	gQYkewg0TLVGgufwQ78yCM45XNjHzaEJAtcCOXjNSF0I0vubrHOQdr9/G43iAC1nHsMByQhY9dP3w
	XKK0ICk6AId5UHnCNKEAMKtzPshdkmLVAE4G9El40B82ioTzorcncoc3p8Uq/idZY3MdIIQxeeCtd
	HbfA5xi6ZzxM42IQRE/iQIBKVE7I+/KmNBg30BWFZRouqfIlIM7+NAQU01c3e+5geZbpIasnFrSaN
	nfD3oIvw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Xr-0000000759n-0W23;
	Wed, 02 Apr 2025 20:18:43 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Xp-0000000DcH8-2kho;
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
Subject: [RFC PATCH 2/3] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
Date: Wed,  2 Apr 2025 21:18:40 +0100
Message-ID: <20250402201841.3245371-2-dwmw2@infradead.org>
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

In the FLATMEM case, the default pfn_valid() just checks that the PFN is
within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).

The for_each_valid_pfn() function can therefore be a simple for() loop
using those as min/max respectively.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a3b5029aebbd..4fe7dd3bc09c 100644
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
+	for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);	       \
+	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
+			 pfn++)
+#endif /* for_each_valid_pfn */
+#endif /* valid_pfn */
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
-- 
2.49.0

