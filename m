Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D8D1CDFCE
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743337063; cv=none; b=knVYhsV0GGYdNboA60vMp6zf8o8zYw7SlGx2bOc7wmpp+GyJqqpgVQnoUA+U+U2DGRsKEX/Xh6SazBXYxZTiIhSWAtfP9Z+8wz6LOorNsUqHfqMJAVTO30xPb5HL0aKbwhcWA4lfK1LEGgfjqou+hmgrHG1YPSZBDXN6UmhH/bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743337063; c=relaxed/simple;
	bh=gKdhX4jI7FvUr3w6tNdE00UAASTxwhzzmxFRJbbPJgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=p8ZQ0Zirud9RzJXubPLqUJFZ/CrYIWU6w7Vbw7FwbIIC5l2N5y7md9Z2fw6QzhVaN//U9pR/egWRlk4o5721fF+7RgTiYwDMAxv3RiToogAmvTFvrj8P8aZ8CPmmWjpgNL3z3lB/DRBYpqChAcIFP7SR9VLE0xduWdVDRu8+QI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NI6i1+be; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NI6i1+be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743337061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LqQOrccmB1vzyfnAtlatGcQGL//TNrd+LmFWKgXy5M=;
	b=NI6i1+betIgdO1fQ15s3NHiYItbx88NC2Bo8et0+ewGzlVvh/IiL96D0CdUyceW6VGk8ql
	jQdkMnJUrAZvoinoQtsl3XDjxmT4eHBzTdi+lUwyr2JVQtLmOy20YrVtr4GafT6Q+tAQLQ
	L/Xxjlv2OB95kTTZJFY5Pv5x81DeIzQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-LJRw6BwZMB2lZhSVeFH_uQ-1; Sun,
 30 Mar 2025 08:17:39 -0400
X-MC-Unique: LJRw6BwZMB2lZhSVeFH_uQ-1
X-Mimecast-MFC-AGG-ID: LJRw6BwZMB2lZhSVeFH_uQ_1743337058
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FFEF19560AF;
	Sun, 30 Mar 2025 12:17:38 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.17])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CEE2B180094A;
	Sun, 30 Mar 2025 12:17:35 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 3/7] mm/gup: Fix the outdated code comments above get_user_pages_unlocked()
Date: Sun, 30 Mar 2025 20:17:13 +0800
Message-ID: <20250330121718.175815-4-bhe@redhat.com>
In-Reply-To: <20250330121718.175815-1-bhe@redhat.com>
References: <20250330121718.175815-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
index 8788105daee8..3345a065c2cb 100644
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

