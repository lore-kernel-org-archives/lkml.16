Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7CA1D54E3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408834; cv=none; b=NHi4v6BH/LEtUiU797tPlTTyIFyYX9oNyOdT5dWlNhopfyy63otCelhN4biFmhGWq+u24xSPsCKT9TG9r0d7TjODmw7/0KvySnA91Yev4aOH7WIu7NBHP+YPvYnHdFz6USXob34Nn0cpALr7/RpqOmwMZ3/ozymYn/JVBWV8C68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408834; c=relaxed/simple;
	bh=4jA9xVNiBN2nOEasxVs132BHUjLCHttUsOHkEnFFZQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=IFnzJN+WxlU3n6FfznelqtLAnefMMnah3wb1ppOy28UQXB0LWZqM5jGzI5X3v+fVBsd1Iv+VOlgILSI1tqtKfTNvSHoKLBj6fQHLSJMA2OsMShohys55LNorlfYK8fInW43ljwoTFG/fNioWt53K15iP9181ozlQpRATwtSisUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=czE8C/bW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="czE8C/bW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zh1/TrAESP0WnH+wS47UsqcVh/5ztuo1zl6IdlNR8C8=;
	b=czE8C/bWYiWZ85S47fNOcierNx5EldbL6Df/i3LxJAR2LPvpI7oJr4+MHc6R19SdY4m+9l
	tASOX5T9OW6iBLw9WVK5GbP2yKKaodzCYP13tVEjkYSPH8ztZYrE5ZzIHnuDJ//WMZgW8Z
	xT03YyY1tP1JAT/wyZq0zSZJETecHX8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-Dl07PehiO7uuJ-PB7EvKqQ-1; Mon,
 31 Mar 2025 04:13:48 -0400
X-MC-Unique: Dl07PehiO7uuJ-PB7EvKqQ-1
X-Mimecast-MFC-AGG-ID: Dl07PehiO7uuJ-PB7EvKqQ_1743408827
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 602D31801A1A;
	Mon, 31 Mar 2025 08:13:47 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1BC941955BF1;
	Mon, 31 Mar 2025 08:13:43 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 3/7] mm/gup: Fix the outdated code comments above get_user_pages_unlocked()
Date: Mon, 31 Mar 2025 16:13:23 +0800
Message-ID: <20250331081327.256412-4-bhe@redhat.com>
In-Reply-To: <20250331081327.256412-1-bhe@redhat.com>
References: <20250331081327.256412-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Since commit f0818f472d8d ("mm: gup: add get_user_pages_locked
and get_user_pages_unlocked"), get_user_pages() doesn't need to have
mmap_lock held anymore. It calls __get_user_pages_locked() which
can acquire and drop the mmap_lock internaly.

Hence remove the incorrect code comments now.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/gup.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f9bce14ed3cd..a15317cf6641 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2702,19 +2702,9 @@ long get_user_pages(unsigned long start, unsigned long nr_pages,
 EXPORT_SYMBOL(get_user_pages);
 
 /*
- * get_user_pages_unlocked() is suitable to replace the form:
- *
- *      mmap_read_lock(mm);
- *      get_user_pages(mm, ..., pages, NULL);
- *      mmap_read_unlock(mm);
- *
- *  with:
- *
- *      get_user_pages_unlocked(mm, ..., pages);
- *
- * It is functionally equivalent to get_user_pages_fast so
- * get_user_pages_fast should be used instead if specific gup_flags
- * (e.g. FOLL_FORCE) are not required.
+ * get_user_pages_unlocked() is functionally equivalent to
+ * get_user_pages_fast so get_user_pages_fast should be used instead
+ * if specific gup_flags (e.g. FOLL_FORCE) are not required.
  */
 long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 			     struct page **pages, unsigned int gup_flags)
-- 
2.41.0

