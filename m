Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA4279358
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396331; cv=none; b=bole00U90YcpR4PUJnc4C7jXTpXf3EYQPZcbvoGFOdz0e1VkLFLCTwgqyknTuL7cc9TdGBQEUjEi0wK/YmEuG8Zxna9vQFUFTs/dz/UQi+y0voR1wjTckkHaoXgKuvJZHjF+015rJKGRmQzA08upH/FNVXMCJ++Y2T/40rTgiDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396331; c=relaxed/simple;
	bh=4xt093V4K6X9m5HSUSUKEV60HAXCvM4r8RMK8XVZ6NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTWyZVgqxwJCJUqMhEXC63NRt/RuFht0JavmU7b3tAS3Mn7B/+E/OfggVXG0BvmEecl1WkZ/TYJQVVkqPBDqXKkizDY9Lq/8pQ5Oy1jdyaQcxrIhBNZbyNLFWtNYoYMeoOdZ5sK5clAqQpmN4GgdyuWbNqay0EM3PCHofNEuftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KGBHe0CZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KGBHe0CZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5rBTRXVZOLvGm6tGVdaRqt3altL1kwi2KMEQoupVT9M=; b=KGBHe0CZaJNHjqUBvFJmhnk4e+
	UPDycIuE82wa2XxkK87oLluII3D4UaUzDWr0aOdY4m4yTxi3S2ftbKW4yvTGKJRXQzkk/25oVwohE
	cTVuPyVEq7s3Ye8YtV+otsybX6FzJx9x1GJO7w6lIWpZZeg5pQRN5w4tjAjk7Zqa2Vgqu0Q9NVL5T
	zdFVyJqvVItORW1K8NoW7QRZdg0cPaMapuy9M8Asd1O75iUL9aJl+n0dGnBaKBExsZIY6QMxYm1dr
	8SV+6xIkv4HXj6ZFHgb4D1nGpSv+vzwrbr03bVHHniVI2uB++M/9EcdJNQQEGULkue6uwxepbUBty
	4SlyGv+w==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOig-1ajG;
	Wed, 23 Apr 2025 08:18:37 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YO2-27ZK;
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
Subject: [PATCH v3 6/7] mm: Use for_each_valid_pfn() in memory_hotplug
Date: Wed, 23 Apr 2025 08:52:48 +0100
Message-ID: <20250423081828.608422-7-dwmw2@infradead.org>
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

