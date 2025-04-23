Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3527935B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396330; cv=none; b=J0KLNWBudpW4vyOUvNisil7PKJaf4knmLG5gwUazFihK/189iPtovgN+gST7vmvq6LItmX9mytUE23JrO1jmrzu70szs64PtAk3NZBHAm1uZJhSPOw+LQcHloV9T9PK8Xocr7Nl6LJEei6qXyujHmvzGPLa9MMBlDAHU2g6yqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396330; c=relaxed/simple;
	bh=D66HpPzIsh9s7WpdgSaM0v5NH51UIUN1kQRqUAsn+kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvEM2NFGjczscCjIc10U6H7cDU2jH5vOd1FZ/UDk19ewQVVIO44zyNl0KPUYTC4dAxiUXmfj1H3+exq3Z7ee9p/5rwufqT1Kvc18iVijCj6kVLM1BeoZdYerh47DywEq3rAAMdEscJHe4RbhQM8FOtz9tIKDvFZcl6nNSTkC+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BmKxZhxX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BmKxZhxX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EggTF7jgXyqw27ORwtXsCRX4H5aiRA/a+Rh2J8KLoHU=; b=BmKxZhxXycayWqgY04aS3O8VDv
	NYYZCozxkEDA0WDmbxV1yNS3+Q5Su24QLc3YxXW2RtGx+avKO+L6seps3N2pFW+n+dP45Md+d+EfE
	KVkAQRs0lguySdrMhj4IgZtx8enpHxrFfqTJuEtbNoSjg/AFO/LT1EfgpxF2dwZfr0cfZPqwW8UQR
	AxD+az8+k4r8E6CHBDutgxCGcF6GCNYhiMQyZES6DXVH9SGioJWn1a/uyBYKFPpkeWB49WUd2ERpQ
	XJQ7aatcCyYdQptgYKIsMoH6jIxaSyREfjipf3GSKb6iwmkSYw7x3JUuqkLvQpJpokUl7XmJKa99h
	WPD88/VA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOid-1XFD;
	Wed, 23 Apr 2025 08:18:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNw-1g6W;
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
Subject: [PATCH v3 4/7] mm, PM: Use for_each_valid_pfn() in kernel/power/snapshot.c
Date: Wed, 23 Apr 2025 08:52:46 +0100
Message-ID: <20250423081828.608422-5-dwmw2@infradead.org>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 kernel/power/snapshot.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index 4e6e24e8b854..f151c7a45584 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1094,16 +1094,15 @@ static void mark_nosave_pages(struct memory_bitmap *bm)
 			 ((unsigned long long) region->end_pfn << PAGE_SHIFT)
 				- 1);
 
-		for (pfn = region->start_pfn; pfn < region->end_pfn; pfn++)
-			if (pfn_valid(pfn)) {
-				/*
-				 * It is safe to ignore the result of
-				 * mem_bm_set_bit_check() here, since we won't
-				 * touch the PFNs for which the error is
-				 * returned anyway.
-				 */
-				mem_bm_set_bit_check(bm, pfn);
-			}
+		for_each_valid_pfn (pfn, region->start_pfn, region->end_pfn) {
+			/*
+			 * It is safe to ignore the result of
+			 * mem_bm_set_bit_check() here, since we won't
+			 * touch the PFNs for which the error is
+			 * returned anyway.
+			 */
+			mem_bm_set_bit_check(bm, pfn);
+		}
 	}
 }
 
@@ -1255,21 +1254,20 @@ static void mark_free_pages(struct zone *zone)
 	spin_lock_irqsave(&zone->lock, flags);
 
 	max_zone_pfn = zone_end_pfn(zone);
-	for (pfn = zone->zone_start_pfn; pfn < max_zone_pfn; pfn++)
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
+	for_each_valid_pfn(pfn, zone->zone_start_pfn, max_zone_pfn) {
+		page = pfn_to_page(pfn);
 
-			if (!--page_count) {
-				touch_nmi_watchdog();
-				page_count = WD_PAGE_COUNT;
-			}
+		if (!--page_count) {
+			touch_nmi_watchdog();
+			page_count = WD_PAGE_COUNT;
+		}
 
-			if (page_zone(page) != zone)
-				continue;
+		if (page_zone(page) != zone)
+			continue;
 
-			if (!swsusp_page_is_forbidden(page))
-				swsusp_unset_page_free(page);
-		}
+		if (!swsusp_page_is_forbidden(page))
+			swsusp_unset_page_free(page);
+	}
 
 	for_each_migratetype_order(order, t) {
 		list_for_each_entry(page,
-- 
2.49.0

