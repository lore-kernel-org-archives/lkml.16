Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51371A0BFD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415513; cv=none; b=ZXbdnVsMS+Kx6cnzkYlgy5S8Uc5pBTNJTAaaytUlMS2xRZcsWUcqOceM0D5JHMFSvuRVPvgk4GMNt4oDXL6UWSqTe67e+CFCrBlVz03KI68LJYSp7jNYWxtoquyC4c0R1xJFZtQ4TaNnFcm2oCnVEnOl98cyOD9bdhafWQIWcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415513; c=relaxed/simple;
	bh=EdpzRbGYPaQq7CSxSZt7PPoOnmEOzdvFx9cKEIgBmkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EV7jZrRLJUnB3f3AT/5ldElWbYNGSHG7pwdRqHHyJn4tb5VzVsFAk8uRFXy1GV+3K5IrNHjGaAEcoZ+FBB2uAQj2VjFoIwovPIT4xAEdcfZvJuJjs01fH0GDfSOOAEnvvja09iQOmTnrbBwJ5rSP7FwaCarCiOAn5n+ZJmmpf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ELHyTWTw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ELHyTWTw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Q9DrO1JHwLaIt6bW4FlCMne9odphYqzBVZA9TwC5d4I=; b=ELHyTWTwfHf+2TH6xRVBmTjUpF
	mtsx52hyXN1IeETj3AyY/nShlOo1qhFnu/mGq5rz8FXCP1FTrDpVnMW0CihtnzP6YGYn3MCI7iTZj
	nyhgKEiqfyDYNFPdJ7fDe+YfhXTspEDcIybAXPRMvZEN9EudYqyXh154H81CKUWxBe1Cy0Evh9xcN
	43r/+6rW763eJORToBRl6knbLz5hz1SRBKuIfoNtycSHpzd0dWAl/I5G/mfirqHK/qXtv7H20IK1D
	MLwOGVkGUt/0olVUWbm3C0+Ej7GbXA7TtCtQ17QK9Svjw4Pr+lfWazarAyNc5YwRAr35vizU8X7d6
	ZFFzWSFw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aIx-000000097Jh-2A4h;
	Wed, 23 Apr 2025 13:38:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7aIx-00000003JOw-1HUC;
	Wed, 23 Apr 2025 14:38:23 +0100
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v4 6/7] mm: Use for_each_valid_pfn() in memory_hotplug
Date: Wed, 23 Apr 2025 14:33:42 +0100
Message-ID: <20250423133821.789413-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423133821.789413-1-dwmw2@infradead.org>
References: <20250423133821.789413-1-dwmw2@infradead.org>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/memory_hotplug.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 8305483de38b..8f74c55137bf 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1756,12 +1756,10 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 {
 	unsigned long pfn;
 
-	for (pfn = start; pfn < end; pfn++) {
+	for_each_valid_pfn (pfn, start, end) {
 		struct page *page;
 		struct folio *folio;
 
-		if (!pfn_valid(pfn))
-			continue;
 		page = pfn_to_page(pfn);
 		if (PageLRU(page))
 			goto found;
@@ -1805,11 +1803,9 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
-	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+	for_each_valid_pfn (pfn, start_pfn, end_pfn) {
 		struct page *page;
 
-		if (!pfn_valid(pfn))
-			continue;
 		page = pfn_to_page(pfn);
 		folio = page_folio(page);
 
-- 
2.49.0

