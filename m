Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28CC22C35B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747701; cv=none; b=oTJcbMU+p0dL188fPCWxysV/+39KTUnLxmF2nII83DxPGvW5hR/ZHj+B5A0ER1ym4MyVovwgdMhWYmSt1wUgTk52dXni0OmR2eR3qCpgSgbd/r+3IWbX9fh2gJl/42o0nMiMtcOqYanNH6pLgVW0O7aGuL8A3FKomsvbV/2ETSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747701; c=relaxed/simple;
	bh=VX26HNiWwpD9kN42atTc9oahPw/TvYNOdYXjy3VIo38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=IeZo/G/kEqDF2CjQ4a9pQATIHQ0VvtZT8LlCZMPoUlwYRqix8v4tYnMFJ4bNpTqpwJvL5n5qDwmYOGQzSlZpcpmerzta+ua/R5irK6ia3+zBHmGfYhmC4GpKhjLpYFHaWDnmR9jlZ4kAuhh2VxsUjyUBQARB1MisVVigBoRPqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KwJAzmz/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KwJAzmz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vVxPS21csuuvYhubTDPbniUZC89uu0FzC8UHkUR7f4=;
	b=KwJAzmz/QERzAaTDvjLl3lJRgG1JxnYa7R85NMTUAgx2eiUrMKlWJW9TadZJNRXfqtUzXi
	ns6pSLoxQPcIE2wGLNH8N9Uhtt5hexiMUm5bVhMBt2Pi1bQhx5A5TmLMIdw8mZtDDSgPED
	CKq8chg3e4S2hzpXtIddd4P760caxpQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-YcE78HehONax1pGIvqF0gQ-1; Wed,
 05 Feb 2025 04:28:17 -0500
X-MC-Unique: YcE78HehONax1pGIvqF0gQ-1
X-Mimecast-MFC-AGG-ID: YcE78HehONax1pGIvqF0gQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F6261800877;
	Wed,  5 Feb 2025 09:28:16 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B8CA3000197;
	Wed,  5 Feb 2025 09:28:12 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 10/12] mm/swap: rename swap_swapcount() to swap_entry_swapped()
Date: Wed,  5 Feb 2025 17:27:19 +0800
Message-ID: <20250205092721.9395-11-bhe@redhat.com>
In-Reply-To: <20250205092721.9395-1-bhe@redhat.com>
References: <20250205092721.9395-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The new function name can reflect the real behaviour of the function
more clearly and more accurately. And the renaming avoids the confusion
between swap_swapcount() and swp_swapcount().

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/swap.h | 6 +++---
 mm/swap_state.c      | 2 +-
 mm/swapfile.c        | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 20bfedc8c4f2..395d41cf9676 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -500,7 +500,7 @@ int find_first_swap(dev_t *device);
 extern unsigned int count_swap_pages(int, int);
 extern sector_t swapdev_block(int, pgoff_t);
 extern int __swap_count(swp_entry_t entry);
-extern int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry);
+extern bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
 extern int swp_swapcount(swp_entry_t entry);
 struct swap_info_struct *swp_swap_info(swp_entry_t entry);
 struct backing_dev_info;
@@ -583,9 +583,9 @@ static inline int __swap_count(swp_entry_t entry)
 	return 0;
 }
 
-static inline int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry)
+static inline bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
 {
-	return 0;
+	return false;
 }
 
 static inline int swp_swapcount(swp_entry_t entry)
diff --git a/mm/swap_state.c b/mm/swap_state.c
index b393cefb3be0..3dba6eb164db 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -457,7 +457,7 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		 * as SWAP_HAS_CACHE.  That's done in later part of code or
 		 * else swap_off will be aborted if we return NULL.
 		 */
-		if (!swap_swapcount(si, entry) && swap_slot_cache_enabled)
+		if (!swap_entry_swapped(si, entry) && swap_slot_cache_enabled)
 			goto put_and_return;
 
 		/*
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2a25ff5f31c8..93fd12c12bba 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1615,7 +1615,7 @@ int __swap_count(swp_entry_t entry)
  * This does not give an exact answer when swap count is continued,
  * but does include the high COUNT_CONTINUED flag to allow for that.
  */
-int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry)
+bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
 {
 	pgoff_t offset = swp_offset(entry);
 	struct swap_cluster_info *ci;
@@ -1624,7 +1624,7 @@ int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry)
 	ci = lock_cluster(si, offset);
 	count = swap_count(si->swap_map[offset]);
 	unlock_cluster(ci);
-	return count;
+	return !!count;
 }
 
 /*
@@ -1710,7 +1710,7 @@ static bool folio_swapped(struct folio *folio)
 		return false;
 
 	if (!IS_ENABLED(CONFIG_THP_SWAP) || likely(!folio_test_large(folio)))
-		return swap_swapcount(si, entry) != 0;
+		return swap_entry_swapped(si, entry);
 
 	return swap_page_trans_huge_swapped(si, entry, folio_order(folio));
 }
-- 
2.41.0

