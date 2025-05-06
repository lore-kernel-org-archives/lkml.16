Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2466283C8C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746556946; cv=none; b=pj63FZzNvI12QI5dZqZAObZBt3SYEYRCQ+f5kTWwIfS/pbsTzVYT6owMKkjcdYINzhvfLx4qfsKq010E6nfuIRQNrWUmBoy+ck5C0l8r0L6Ao1JJ3g3SNQs3chD0EO3oeX+jC/+401IZbk5OwFR+d9+S7FPuxJyb2Gz3uS+ouME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746556946; c=relaxed/simple;
	bh=5FiTKQdKBzltSUtNMRcw3xoAumStcpgJhDBt9gaf3oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC1wpw4HvDV/e9uZrR7fT4l0ZZPoYEWiptO/VgkfLZCgHNx8Ynd4Vdvn7q0hT2gS3KQRelRqmq0d3+0qJv3lGrEoU/oaseD8KV80j4ym7ofZZH87aKwbOL5bCOks/odq8MX6wst17/EdZCmPCM3G9NVNfDLsPe50+I4WYzmlG38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fz2riko/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz2riko/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227a8cdd241so75043605ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746556944; x=1747161744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+m15uQBeVQPdewXvmB4QLyqFgU0mGzfzgZouKlqrZ1s=;
        b=Fz2riko/yS9rqz4ewb+n5CvRaJ9u7HVc8KJ3EkFgrS85et+yVrGPwu0FvWPW3aCBHt
         pfWkmHGIhWt8b5V4MfIOG7rWIN/835qWD9mFOBiLUwnbbRWu3rXhdGTHThrR3RgUaPgG
         C2dOXE8/7iner8X4Xv8dMNCGwWcimu6Ya+Y+AeaUBq9lyCTzLIPE5gt3/B668jBfYNEE
         0e2Obj9Wa611mYxX2VOyJMJpR0WMMc23DqP6bjVWKUhZCU5+c+uSKSorFbRaY0ePUNeN
         mAYQB1tGFekeOXjObP1IHrdygp0WLYMzVEg87ZDsofctOsW7UbQwyUiuceCvxeB3U/k8
         WdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746556944; x=1747161744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m15uQBeVQPdewXvmB4QLyqFgU0mGzfzgZouKlqrZ1s=;
        b=PHYN6o9vD8f6N+3K35Szm+RaXK09D/hg3SkYXVYGxXyCE6U/gxPDsblo/GRrHVbDVR
         IUy7ss4HzgoKVv8swBlBDpo94k5BwFnK8FnaenTAQ3glknKRU1lFJHAubIhSv8W4g3r/
         MEGVH4t8eEEaC+QTZPKUhHeb4M+rLntm3swW70e8QIHRKnXBreRgNnrbUxO5h6LLvENI
         QoEMNs+61gYR9GUMEVzqg5gongKjFhgOaKBvNPIwD0aS7v5d6ZHCSE7PG6fsPlFYn7KK
         M98iLCey9qP96+rr82uA0QTzecmhvsOtz8bcFP7WO+QLRrX5IybCe2zql8kT0OKNHajc
         GWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsRp7euw25B1LeowgBC6slo+Jh6FYAIo4dLFLzfQ1OZoabKSR78vzL0vT30+sBkaTqSZ1u/hixv7urDNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1lM1TTvqaOKGPvcEuMrfMvFvCDbMs19CvA41W1XlWKPfeX+B
	RQiCIK+BEbZ9VtC5XsjGgoEqReut87eH4aYV2wnwlBAS8eLJd2nG
X-Gm-Gg: ASbGncvj7Y443d78KwvxnJ/rsrgXFc20IhagMCSHrD6Lc6uvdAxQzh7msuu51hBPAgu
	QhLOhSnEiEaulhp4klZCR+/EKLhmR0ET4SY1xfAuzoe53ShoRrG5KM79ZNhfjUMSKxzhEr/4c+s
	F8IeCBvIIsXctIXELmVC/Gd7v/DRaeI6ZtsN/ql/6nyNk3UzDAS80htshGJFAyXEqrnCP4lL/8n
	MGuhQnQ8OBWOXGyTa0Q8seX6OmgiWpxx6ra5wUa3sdQqPUkwPOtRjP/A9Fu1CoWeIHxhEoeYvcR
	ZkfXEBa2cSTUKELvny98N8Va+vPs35eBeXL9wN2GQvCXPll9VwwT+N87oQ==
X-Google-Smtp-Source: AGHT+IFQ0vcwVFy4rK7z5BBMvzaubjAF3VgjiO2fWAYIJGyaUwJ63OUwKjKlnMXaXQZtgTez5wHCaw==
X-Received: by 2002:a17:902:d543:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-22e5edfd12emr3323075ad.50.1746556943998;
        Tue, 06 May 2025 11:42:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:3afe:d39d:8565:ed44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228a1asm77527685ad.173.2025.05.06.11.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 11:42:23 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org,
	osalvador@suse.de
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	nifan.cxl@gmail.com,
	Fan Ni <fan.ni@samsung.com>
Subject: [RFC 1/1] mm: Convert is_migrate_isolate_page() to is_migrate_isolate_folio()
Date: Tue,  6 May 2025 11:38:29 -0700
Message-ID: <20250506184155.587070-2-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506184155.587070-1-nifan.cxl@gmail.com>
References: <20250506184155.587070-1-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

Convert is_migrate_isolate_page() to is_migrate_isolate_folio() to take
folio directly.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
 include/linux/page-isolation.h |  6 +++---
 mm/hugetlb.c                   |  2 +-
 mm/page_isolation.c            | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 898bb788243b..74d6a8cf4960 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -3,16 +3,16 @@
 #define __LINUX_PAGEISOLATION_H
 
 #ifdef CONFIG_MEMORY_ISOLATION
-static inline bool is_migrate_isolate_page(struct page *page)
+static inline bool is_migrate_isolate_folio(struct folio *folio)
 {
-	return get_pageblock_migratetype(page) == MIGRATE_ISOLATE;
+	return folio_migratetype(folio) == MIGRATE_ISOLATE;
 }
 static inline bool is_migrate_isolate(int migratetype)
 {
 	return migratetype == MIGRATE_ISOLATE;
 }
 #else
-static inline bool is_migrate_isolate_page(struct page *page)
+static inline bool is_migrate_isolate_folio(struct folio *folio)
 {
 	return false;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0057d1f1dc9a..1e712dc4783a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1306,7 +1306,7 @@ static struct folio *dequeue_hugetlb_folio_node_exact(struct hstate *h,
 		if (folio_test_hwpoison(folio))
 			continue;
 
-		if (is_migrate_isolate_page(&folio->page))
+		if (is_migrate_isolate_folio(folio))
 			continue;
 
 		list_move(&folio->lru, &h->hugepage_activelist);
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b2fc5266e3d2..540d2add4834 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -169,7 +169,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	 * If it is already set, then someone else must have raced and
 	 * set it before us.
 	 */
-	if (is_migrate_isolate_page(page)) {
+	if (is_migrate_isolate_folio(page_folio(page))) {
 		spin_unlock_irqrestore(&zone->lock, flags);
 		return -EBUSY;
 	}
@@ -219,7 +219,7 @@ static void unset_migratetype_isolate(struct page *page, int migratetype)
 
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	if (!is_migrate_isolate_page(page))
+	if (!is_migrate_isolate_folio(page_folio(page)))
 		goto out;
 
 	/*
@@ -235,7 +235,7 @@ static void unset_migratetype_isolate(struct page *page, int migratetype)
 		if (order >= pageblock_order && order < MAX_PAGE_ORDER) {
 			buddy = find_buddy_page_pfn(page, page_to_pfn(page),
 						    order, NULL);
-			if (buddy && !is_migrate_isolate_page(buddy)) {
+			if (buddy && !is_migrate_isolate_folio(page_folio(buddy))) {
 				isolated_page = !!__isolate_free_page(page, order);
 				/*
 				 * Isolating a free page in an isolated pageblock
@@ -546,7 +546,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	     pfn < isolate_end;
 	     pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (!page || !is_migrate_isolate_page(page))
+		if (!page || !is_migrate_isolate_folio(page_folio(page)))
 			continue;
 		unset_migratetype_isolate(page, migratetype);
 	}
@@ -631,7 +631,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	 */
 	for (pfn = start_pfn; pfn < end_pfn; pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && !is_migrate_isolate_page(page))
+		if (page && !is_migrate_isolate_folio(page_folio(page)))
 			break;
 	}
 	page = __first_valid_page(start_pfn, end_pfn - start_pfn);
-- 
2.47.2

