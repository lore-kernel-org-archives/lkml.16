Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7972D542A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873786; cv=none; b=a8+09NwLgYyQ6Qr3j5nMLmZoo0DzoR70oyqvrijSPNqwEHIg6UaUs3by5Flsw2gziQSTC8+xffv7CcE8UzfY+4P+2s7JsqQryj+6s4VdeZqZMVP9TCP6hHO1XSbhA1sGD2HE8epRSpDWHXKIcPkQqyYPWDvrjYBzlZrkLommVr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873786; c=relaxed/simple;
	bh=OV9y7iZJnkNU+hCTeUmbIDCyHAsjpmeKt/T76AN1rfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJBN+gEdIQXHtQ2YYifJoc3TCOdr8mzJ3ay2WqyC+2i/pALQi8uUYSZghgRFnaQbtfLfN0jFh1f7emc88r/LpCm0IcKg8M9BZb3s6Gqm+ko4vK7FxE3T3BxpYonff786HN5I15VFv+3iBVV8Sw96zanQl0t6zz+k3HY35MbwWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhCX3D1f; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhCX3D1f"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7490cb9a892so194042b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750873784; x=1751478584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7ELidRxv5KKmB1tooy+w2E0Xw3mvApCUwofU9YBKSg=;
        b=QhCX3D1fBA1feKC7LbSWJcsp1SSlkASJc1AfD9em7XMnz7qf/pKBj/KSEB47el9co6
         r6wfvV6GSrA3v4h59xfsAtgHu5A82DatR07zfQnM0Wd1Epvae6ES4TynbWvbmRULSCRL
         tsF+B5W2MBkjwpG9bCXC9hR80A8w5dMGCw6VPbP7kpfmKJYJBBBq9LictnYztjyluenO
         TvEoJztadBILGPtwjBFzbOuegOtOGe+eJyrRCjaOj0JH7JG49y/IEuzUXIkguLMNiUGw
         orAlG4EBI/AUPzXZqY6b0Unq1s+fRvT7IC6wTn7KxQmQcckJqpYAuV6miEW2WB6Mn708
         C8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873784; x=1751478584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7ELidRxv5KKmB1tooy+w2E0Xw3mvApCUwofU9YBKSg=;
        b=VCLC2sAUO9VuZHLfykojUlp1wVz9ek2BW7SNry6Za5U0nScZvdiCJe8L0pzv3TuYet
         rBSlPiOsPW2i3KuM+IMhzkD49rlkRQdfLsM3sWoJZxoTu8HkwarYcC6dEaz+jGeVJx/I
         0Bt50pN2AWEql6EJUCq7357ejuUzDyqpSkPUKHWxHWnb4QuXHoFZzF/4KglV3Lc2nCgT
         oX4fCAoDJIITA47+NTBOckQsD4MmMR9pHj4bjjfNMJTjV1Fy15bio1hbwDwLagQJSGJV
         xN3Na2AbuqJAqUhCiVVmjUN+WEU3Plg88w7vOdCqLxq0c2TpyAp5oSfkF7HLmw8uHFif
         pp/Q==
X-Gm-Message-State: AOJu0YxUnnMyC8ADNLEwOWmC3xa6WsgOlzEZMwj/sMBZ3eRBuWcmdP9G
	hbD4MHltw34wIRdUhnn4SlDDftrZhEBfGVci0oBXPnOwNlR+q2X4L0n9FwTtTSVG
X-Gm-Gg: ASbGnct7iklkUUDAjTdm+Dy48GTLjnRiLnzm9UYmK9wEZB9WzXSFmA0K8qzgq3VGgTt
	2AmiaRuaZWTM6W0shv5fG3aon76VGSrvO3ZpUQ9JBtheis5goT35+xK6H/fnL4uoGf+FHge2IwL
	4gDpkvtaRUJi0rYnEVaW5EmISH9Y2J276EVTsJElxEPT2/XDqmyii+jGdOTw7IGjMYv0yrUXBMV
	s9lrwqOPgeZhQHvV7a7dnKBca/O0XZddhqRuiwAN4cXy1gB1U7kJlu0pm3l68UT8Les3w6iaTjY
	xN8RFVYOYNi3fthtlead2ulNNG/7V+mN0nNZnJ+IcSQdnCKHORyg3qL8qsQxaVfV1CZBqgV1WfE
	FfdI7L2tySBUl2/no9e6LOZAIvr4QI1g=
X-Google-Smtp-Source: AGHT+IFB2gKiuXE84YJDoX3zi/YmAkg3LM7lCafc1Ca+BpzzyJ0vb7ym6lhK+vu+NVwaXRCaonnGpQ==
X-Received: by 2002:a05:6a00:2e1a:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-74ad45bf9cbmr5346890b3a.21.1750873783759;
        Wed, 25 Jun 2025 10:49:43 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-749b5e23879sm4944869b3a.57.2025.06.25.10.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:49:43 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Jordan Rome <linux@jordanrome.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [RFC PATCH 2/3] mm/memory.c: convert __access_remote_vm() to folios
Date: Wed, 25 Jun 2025 10:48:40 -0700
Message-ID: <20250625174841.1094510-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625174841.1094510-1-vishal.moola@gmail.com>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kmap_local_folio() instead of kmap_local_page().
Replaces 2 calls to compound_head() with one.

This prepares us for the removal of unmap_and_put_page(), and helps
prepare for the eventual gup folio conversions since this function
now supports individual subpages from large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 mm/memory.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 747866060658..5eeca95b9c61 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6696,8 +6696,9 @@ static int __access_remote_vm(struct mm_struct *mm, unsigned long addr,
 
 	/* ignore errors, just check how much was successfully transferred */
 	while (len) {
-		int bytes, offset;
+		int bytes, folio_offset;
 		void *maddr;
+		struct folio *folio;
 		struct vm_area_struct *vma = NULL;
 		struct page *page = get_user_page_vma_remote(mm, addr,
 							     gup_flags, &vma);
@@ -6729,21 +6730,25 @@ static int __access_remote_vm(struct mm_struct *mm, unsigned long addr,
 			if (bytes <= 0)
 				break;
 		} else {
+			folio = page_folio(page);
 			bytes = len;
-			offset = addr & (PAGE_SIZE-1);
-			if (bytes > PAGE_SIZE-offset)
-				bytes = PAGE_SIZE-offset;
+			folio_offset = offset_in_folio(folio, addr);
+
+			if (bytes > PAGE_SIZE - offset_in_page(folio_offset))
+				bytes = PAGE_SIZE - offset_in_page(folio_offset);
 
-			maddr = kmap_local_page(page);
+			maddr = kmap_local_folio(folio, folio_offset);
 			if (write) {
-				copy_to_user_page(vma, page, addr,
-						  maddr + offset, buf, bytes);
-				set_page_dirty_lock(page);
+				copy_to_user_page(vma,
+					folio_page(folio, folio_offset / PAGE_SIZE),
+					addr, maddr, buf, bytes);
+				folio_mark_dirty_lock(folio);
 			} else {
-				copy_from_user_page(vma, page, addr,
-						    buf, maddr + offset, bytes);
+				copy_from_user_page(vma,
+					folio_page(folio, folio_offset / PAGE_SIZE),
+					addr, buf, maddr, bytes);
 			}
-			unmap_and_put_page(page, maddr);
+			folio_release_kmap(folio, maddr);
 		}
 		len -= bytes;
 		buf += bytes;
-- 
2.49.0

