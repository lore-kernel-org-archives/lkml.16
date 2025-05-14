Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27EA2741B0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221355; cv=none; b=sEJnJkMqbcTJXkdkkv8Hjy2MYuh+ABDT9Y5AcW8bt1ZLWSuk6b2sQf19uRL3qLmoOT7FVcVw0qVyzTVUus7vmU3MqkvWbF4L8gX6Smp7YQQqllzXYYXcXLtBybQohBFpC4h8W1iryCi/U8aB61dJF8mtyHXF+nZs9dqey7w7quE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221355; c=relaxed/simple;
	bh=SBuojYrrqpBFDrlTNShywACmIJ60kDXWt/jACPJjCY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJcPUS7KcEATnjYWfOd+ZD577bVItgxUtHr7LpPOF9I8kleBKauFQvjbkOm1LQwOvV1o/IRT4aH+NZghG3K9dbDOW7QRrc8+ToKR8M2dzk2q73FwGSWeiDwElq6iL/+LPbAW7O+AOQzW66PALnYH/VTVX8lHCsnJjkwv9ScZDBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbnMCl9I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbnMCl9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747221352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USAeB9Dgua5+aC4n7BcswguTapqG/rE90mePm5URn3E=;
	b=AbnMCl9IdXQcNpaVA7Wi4jTQ+EggZWe16omZWk7B0wnLF8zMbvZ5Gb/wxsJH7xwpWPvWnr
	n/zXEo6bk389y40LiXVfXoI0LLuQviJKLIqCGS7mt9P3MuPyi+q14oaUoTp+4lneL04aJf
	Ct98tA2cWc07ML23wxLqnFEO7HTGfYs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-hwoQ_hCEO9C-uWrUFkPixA-1; Wed, 14 May 2025 07:15:51 -0400
X-MC-Unique: hwoQ_hCEO9C-uWrUFkPixA-1
X-Mimecast-MFC-AGG-ID: hwoQ_hCEO9C-uWrUFkPixA_1747221350
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0b2e56da1so2703214f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747221350; x=1747826150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USAeB9Dgua5+aC4n7BcswguTapqG/rE90mePm5URn3E=;
        b=V5rhfVhabRvuBI9S3IkGbrU2lDUIdGkyz9vyfkMeMun2qZC64iT8CegcK0iXt8dbE4
         5/Fsma2P1tgGrPIaXqN4rrsplagw1LU1fKBUjJPXuGCCzeJOsQtw/axp6KHi2iSBbQV4
         jXGs3okS3jsudf0c/jZT/wb2lEZuT1C+jpAGsp8Xj6OHOOMVoFmN5xd4ejShkXnmPcNu
         p7OlWWfXXVMEfgc9Mwe1nRROw81RhXOMthiwaQIOy3UqYykNMQn9UY9dB9nBz+Yrx3KD
         8VtqJKiBRaUHltHmLHttawB6ZZFIUOn0I7sIGyzuXKcVyEHIGjkTYc1qg1kNKbQczvRP
         p8/A==
X-Gm-Message-State: AOJu0Yxk5ENyiFAuRaoPeXcqqkVnNZ3y9GfV07qsg2xpZk9PDjGWecDJ
	LVsPXLCk2GJIaOxab1BWxlawOU9OfzX0ebEe4MO7WZ8h/MLODe88+MH/7vEN/Vhz2n2W/MFrdJB
	d2Jkz7bg1O7YMU/q5a9TdHv9zR2EKIpm+v1wHf2SnSiuOLhZ204+NqeUrizwEu1s+FNX64V3wWv
	+3EbiAwGLJa16rzuIvMiQ/8l4XY57DzP6+KDlB1SpNLMAP
X-Gm-Gg: ASbGncshGSqC4uCcR+WJK8HCztQw/KczyanjaSJptERuZovNkdwGtSVKmLv47AdMABT
	1BhJFWwHSATxyyyI4qTFH97DdJrHG4mUMQHO3A6A3Y8NZG746b7Z5+IeewGGGWymIR21n+lFwPH
	L5jOOCb7V2bEkp01AMNELwb8yfG2sB4pwv879YyAU+P5BjDPwoIlndfxcdtCMNKRJFXSD5uCVT9
	uEdU2Kpnhfj4CEnXR40V1b0Ij72RHMjln+cGzTicicOQzsaMS++mMpjVJPMYMIWE8AZSz1fldx6
	X5G5dBod23tXVFwrZJQWry6ewEss0b/7bO3JKpFbf7wFm6yZ3Md4Gatp2L1X7ryCG4MNUI5h
X-Received: by 2002:a05:6000:2a6:b0:3a0:b521:9525 with SMTP id ffacd0b85a97d-3a34969ad59mr2825509f8f.1.1747221350385;
        Wed, 14 May 2025 04:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7IAF/NSDrxcSU/xvaJlGrQphfZd4k82Xl6a3TRsBzfALbvBwKjpxgERH4dcJ+8qF6KaRktA==
X-Received: by 2002:a05:6000:2a6:b0:3a0:b521:9525 with SMTP id ffacd0b85a97d-3a34969ad59mr2825466f8f.1.1747221349944;
        Wed, 14 May 2025 04:15:49 -0700 (PDT)
Received: from localhost (p200300d82f156200d4851bcdd708f5df.dip0.t-ipconnect.de. [2003:d8:2f15:6200:d485:1bcd:d708:f5df])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58f3369sm19586020f8f.57.2025.05.14.04.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:15:49 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH v1 2/2] mm/memory_hotplug: remove -EBUSY handling from scan_movable_pages()
Date: Wed, 14 May 2025 13:15:44 +0200
Message-ID: <20250514111544.1012399-3-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514111544.1012399-1-david@redhat.com>
References: <20250514111544.1012399-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we can reliably identify PageOffline() pages that allow for
memory offlining in has_unmovable_pages(), start_isolate_page_range()
will fail on PageOffline() pages that would prevent memory offlining, and
we no longer have to detect them in scan_movable_pages() anymore.

Note that the previous mechanism relied on MEM_GOING_OFFLINE, whereby we
were not able to distinguish the types of PageOffline() before
MEM_GOING_OFFLINE.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 0cc5537f234bb..beace5b695aee 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1743,13 +1743,11 @@ bool mhp_range_allowed(u64 start, u64 size, bool need_mapping)
 /*
  * Scan pfn range [start,end) to find movable/migratable pages (LRU pages,
  * non-lru movable pages and hugepages). Will skip over most unmovable
- * pages (esp., pages that can be skipped when offlining), but bail out on
- * definitely unmovable pages.
+ * pages (esp., pages that can be skipped when offlining).
  *
  * Returns:
  *	0 in case a movable page is found and movable_pfn was updated.
  *	-ENOENT in case no movable page was found.
- *	-EBUSY in case a definitely unmovable page was found.
  */
 static int scan_movable_pages(unsigned long start, unsigned long end,
 			      unsigned long *movable_pfn)
@@ -1766,13 +1764,6 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 		if (__PageMovable(page))
 			goto found;
 
-		/*
-		 * PageOffline() pages that are neither "movable" nor
-		 * "skippable" prevent memory offlining.
-		 */
-		if (PageOffline(page) && !PageOfflineSkippable(page))
-			return -EBUSY;
-
 		if (!PageHuge(page))
 			continue;
 		folio = page_folio(page);
@@ -2051,11 +2042,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			}
 		} while (!ret);
 
-		if (ret != -ENOENT) {
-			reason = "unmovable page";
-			goto failed_removal_isolated;
-		}
-
 		/*
 		 * Dissolve free hugetlb folios in the memory block before doing
 		 * offlining actually in order to make hugetlbfs's object
-- 
2.49.0

