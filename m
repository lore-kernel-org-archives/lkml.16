Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B4A27935D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396333; cv=none; b=HWMoDdzrBGuxXFS7cc3WbFvoSMdoWJ4Mm+bNEtxPBQwRj+gEtReEjdQP/YQlK/S4WxC4PylQmwwed/SZMgHbqdPGyvhzoHuFwvTddkq3i8nXhJz6CpWAJxGHDK5q0w22AP+dOYEFqBwnknxMvN6RhtXRjnNwoJdeeaj+0AWsrek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396333; c=relaxed/simple;
	bh=OYq1eYFCazepNiSfRkSzy0Xny7Mf8EDgUkUeTs5V7Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFOSTMKMF7H1/zFuNQ34ZUzrmBAsRHv/nJbVrUvIPj1vMH5cX8a2gH22zS9Cv3HYySPLTkIG9sMfDPl9eYdAQVut1DmI5gx6+krvlQ6c+MFfVwuWbSK+5kRBhNi9XZWrjLdwBPzGNBVX+njCF1yJHWlDmwXm2ucD7yoix24a1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ICIc2yM6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ICIc2yM6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cbMdDFG9P+bdaitfSB/95+V1DKWHcnUFJFkFTDn7hYM=; b=ICIc2yM6OI9RDh+NOJty3eOWUJ
	FgYo2iqowgJFiYjbmeBB6IulpyokzNwdkLIKrlmp25lnGlNqJTuA2fNNuiQHre8pHPLQrjmmLGnE4
	M4hU22kFsneFnr8WhMTs/7G8PFgjZwwDjFR96WytCVzYxAsZiByHue6BlJjK4kQLeXJUuyQDQ1kR3
	ejQdsH8GeC2avhfbiNgmQQx20r1oAhzCfbwUEJ0vbOnE1b3IKAelb/IjTxSfKUvhUe4c6RMW23P4Z
	D0sqNEwszCaPmeUJExBUw080o/JA3LMGMxB7T9ZYsalDsgBkoUUWGoUdL38Pknptkkcf5QSjFZyrt
	mkR51KVw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOif-1akK;
	Wed, 23 Apr 2025 08:18:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YO5-2FrH;
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
Subject: [PATCH v3 7/7] mm/mm_init: Use for_each_valid_pfn() in init_unavailable_range()
Date: Wed, 23 Apr 2025 08:52:49 +0100
Message-ID: <20250423081828.608422-8-dwmw2@infradead.org>
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

Currently, memmap_init initializes pfn_hole with 0 instead of
ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
page from the page at address zero to the first available page, but it
won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
won't pass.

If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
kernel is used as a library and loaded at a very high address), the
pointless iteration for pages below ARCH_PFN_OFFSET will take a very
long time, and the kernel will look stuck at boot time.

Use for_each_valid_pfn() to skip the pointless iterations.

Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 mm/mm_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 41884f2155c4..0d1a4546825c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
 	unsigned long pfn;
 	u64 pgcnt = 0;
 
-	for (pfn = spfn; pfn < epfn; pfn++) {
-		if (!pfn_valid(pageblock_start_pfn(pfn))) {
-			pfn = pageblock_end_pfn(pfn) - 1;
-			continue;
-		}
+	for_each_valid_pfn(pfn, spfn, epfn) {
 		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
 		__SetPageReserved(pfn_to_page(pfn));
 		pgcnt++;
-- 
2.49.0

