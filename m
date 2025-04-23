Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2327934C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396330; cv=none; b=aFkAGJfj+EwFoBXkaEgS1PifPcgTD9QSK0JQIqeI3k0lxu3+HN+Zq0RMquB8W01WcEYcQ5eGxKHEedNfQeJ6sM/KBSbr369w4ZF+mslb4P/2/A+6rFkaDRwU+/f2cKtbYKzF2DeYw4UcYCBLaiIuqTlM4gzy8m3q20mixq7sqD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396330; c=relaxed/simple;
	bh=aJSyZUbvYgHKXNphFjQQ6yb4qY9ldldBA5b5a4XSOsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OM3B2ZDZB9jhzlaCcGt7mokdjCDhLJGCgxjgc2WPxMZqUvlyQQVNmqVrskYl3h6L/07rWjsa0Dl96rE4tSVh0MkKHqeKdqEdQhqmTOLxvz1ztd2lyxrVRhbcnBJqvup0LR2X2e/acZ5zjy16yZPgNR1aIwDF3sZeh8ML0ySmI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bzRNUMuC; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bzRNUMuC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=X8ymBgUSA5ZN0KXL1mRdo7aKval8NgY94GI7dvST/r4=; b=bzRNUMuChOzbFAH8S7qC9tNmhC
	CIlHhZ7LuV418WmWzA7dWK7LtPbTHUO5x+uwHyVe0fBqEluh74Bj2oF8f9nV3ZGMyXsLqCzSh7nM+
	5XzAGnmgdqk1NUpe1dztvjf4ruAkXFrvZ92PhGQiS9AXOcfLT91vOWRIscbdVaAKCBpmWjk6u0zYG
	2Pq7RHsR2aXU4piqfHOSQqnqzU/zswY0gynnv7WGJYItq0WD1AeVoBVArXIhO/3Ph8ZKnG7yLlePa
	sr0gFSgo1A7Ty/QUAfGAVZmtCEvnZwo6H8NEaGOwYwXyBYZcd0HzoFEox1hJoGvF7DfhDt92xgdM4
	CKV4ZNIA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOie-1aho;
	Wed, 23 Apr 2025 08:18:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNq-1401;
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
Subject: [PATCH v3 2/7] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
Date: Wed, 23 Apr 2025 08:52:44 +0100
Message-ID: <20250423081828.608422-3-dwmw2@infradead.org>
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

In the FLATMEM case, the default pfn_valid() just checks that the PFN is
within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).

The for_each_valid_pfn() function can therefore be a simple for() loop
using those as min/max respectively.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/asm-generic/memory_model.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a3b5029aebbd..74d0077cc5fa 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -30,7 +30,15 @@ static inline int pfn_valid(unsigned long pfn)
 	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
 }
 #define pfn_valid pfn_valid
-#endif
+
+#ifndef for_each_valid_pfn
+#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			 \
+	for ((pfn) = max_t(unsigned long, (start_pfn), ARCH_PFN_OFFSET); \
+	     (pfn) < min_t(unsigned long, (end_pfn),			 \
+			   ARCH_PFN_OFFSET + max_mapnr);		 \
+	     (pfn)++)
+#endif /* for_each_valid_pfn */
+#endif /* valid_pfn */
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
-- 
2.49.0

