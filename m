Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763C2010E6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782413; cv=none; b=fq5IGC7RWMNVgq1Bvv0xYJhBdyXX9HE6xTIzF65WV4/4/eUIuzZB/p/XqfxDrH9Dyn9ztCHm0zuF/O2ZbUPcE9F3LPnOtG1Jg2Gn6PgNUaNT0wbnGpxH78ImqqNDGT/qhORgHJEDiixYiGSDLsFlmVKpToSJpsJZgcWFmUfdaR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782413; c=relaxed/simple;
	bh=cXmDa/smw3SFfJ5+0v25YOs7nGxAYzIsbMas66vAH5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nn5wwBKXgixYJOCDv8v6MbiBd7ZwkMfU0BV/rMGnQU/cLfoFqbJyZ/cikO0suSzXs+dmNYJ6AQfWwd2mXQGCwp8IvBU6Od4aasab2Vyo+5Q46NKPIi1X7l77psI18/Yd4gYbjpoZ/6Sqdh+q/il8MH5XN+x1atLwwppBS7aRMJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d7l3I/9/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d7l3I/9/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SAQbWjWGGmEWV/yrGcgLnMo50LiJ5Xc9HvWor5bjKpE=; b=d7l3I/9/QLogRFJbAFJpwKuy6H
	B0t3Z7Upm6Db3cxysxtEATptTKPyFIjrvR1IiTqa6fj8zd+dQ8qw/mYXmi9eramZYOT01xjsBr9gv
	g3S8NHQZZWom5Th4kzq6dixygw3CD0iPWHeYGA+zJcTe5SD91Taidj9jqPX5gJFJP4ueN+seQocDD
	jPgCHdxWYs/rmNqy4h+MUxbebrc9j5fMAou3iLqAwi6nhlq91/43pUrP3Nh2E91NbF/NfMzh1yd1o
	cmGSfeUGIxkQ2VCvR8WSn2FWLQC/FlgQVqNRFhNpjyGM/f89o/R33M7cx3j005R7UGgMZUqNNonCz
	5OSe/p9g==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSc-00000007QOz-0XcV;
	Fri, 04 Apr 2025 16:00:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSQ-40aW;
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
Subject: [RFC PATCH v2 6/7] mm, x86: Use for_each_valid_pfn() from __ioremap_check_ram()
Date: Fri,  4 Apr 2025 16:59:58 +0100
Message-ID: <20250404155959.3442111-6-dwmw2@infradead.org>
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

Instead of calling pfn_valid() separately for every single PFN in the
range, use for_each_valid_pfn() and only look at the ones which are.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/mm/ioremap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 331e101bf801..12c8180ca1ba 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -71,7 +71,7 @@ int ioremap_change_attr(unsigned long vaddr, unsigned long size,
 static unsigned int __ioremap_check_ram(struct resource *res)
 {
 	unsigned long start_pfn, stop_pfn;
-	unsigned long i;
+	unsigned long pfn;
 
 	if ((res->flags & IORESOURCE_SYSTEM_RAM) != IORESOURCE_SYSTEM_RAM)
 		return 0;
@@ -79,9 +79,8 @@ static unsigned int __ioremap_check_ram(struct resource *res)
 	start_pfn = (res->start + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	stop_pfn = (res->end + 1) >> PAGE_SHIFT;
 	if (stop_pfn > start_pfn) {
-		for (i = 0; i < (stop_pfn - start_pfn); ++i)
-			if (pfn_valid(start_pfn + i) &&
-			    !PageReserved(pfn_to_page(start_pfn + i)))
+		for_each_valid_pfn(pfn, start_pfn, stop_pfn)
+			if (!PageReserved(pfn_to_page(pfn)))
 				return IORES_MAP_SYSTEM_RAM;
 	}
 
-- 
2.49.0

