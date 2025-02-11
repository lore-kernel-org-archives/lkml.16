Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41C626BD96
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245458; cv=none; b=pg0G8wFbs7mDXFFD7BghrHjbLh+2y7SbeSwrOu5z+UtLsAn9WmpbspdA+poLj7tz528+UfQ82USm8Kxt2V16drF/oTD4Dw3BYiQGov4MCEsv1EmpZ1qrKo9b9wiFt0TZB2ai/2CXfwTfOpjo1wXp1Z5qdz5WgNaCVRuwh8i5uog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245458; c=relaxed/simple;
	bh=1hEq6GTehGLb1na0KRz6MCJ/D6j4pH6WSa0vR9qsEJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Q48aOCctkB6GAsHLrcK55X5kNJoF4aM8AzWS/AjxN08xm6YXkioFfvnuVM+g1ngtqEW7rfRhXkXDZo0aHNaMqH+nRLlldLSxLIBRz+JDCWP5r6ZL9Kny0fIRzs3+bhpKO2PTJoy1bsV6yrf1DaU34LF/DUYO+RB650uH08f8gQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bYsEaFQT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bYsEaFQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739245453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3dROWS8oMuYebpedhLskdRuoXq/gW78fzCHLa8+au7g=;
	b=bYsEaFQTEhCdSmzghMWwN2VX32WF5dU4oMOPbGaST/h5o6+bpBMRM2CGIVdzXeWaF/131t
	NrKYnh4SUQGlkpcvMHDqTvGhOEP0WydA245GBRbKxH8DUUrDdHxFgF5qFvWSBHb5O5sOmO
	nsADxOjuVQHAM543xiKIF8GP+Q49kjg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-sjevhOMUPX-3PnPoAKHS6Q-1; Mon,
 10 Feb 2025 22:44:07 -0500
X-MC-Unique: sjevhOMUPX-3PnPoAKHS6Q-1
X-Mimecast-MFC-AGG-ID: sjevhOMUPX-3PnPoAKHS6Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82B4B1956095;
	Tue, 11 Feb 2025 03:44:05 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.8])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 46435195608D;
	Tue, 11 Feb 2025 03:43:58 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 2/2] mm/mmu_gather: clean up the stale code comment
Date: Tue, 11 Feb 2025 11:43:48 +0800
Message-ID: <20250211034348.39531-2-bhe@redhat.com>
In-Reply-To: <20250211034348.39531-1-bhe@redhat.com>
References: <20250211034348.39531-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

In commit d7f861b9c43a ("mm/mmu_gather: add __tlb_remove_folio_pages()"),
helper function __tlb_remove_folio_pages_size() was added. And based on
the helper, wrapper functions __tlb_remove_folio_pages() and
__tlb_remove_page_size() are created and used by upper level functions.

So let's update the code comment to reflect the current code about
tlb_remove_page()/tlb_remove_page_size(), etc.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/asm-generic/tlb.h | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 9ae4ca02f29f..5f99b3cf73fc 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -67,22 +67,21 @@
  *
  *    See also MMU_GATHER_TABLE_FREE and MMU_GATHER_RCU_TABLE_FREE.
  *
- *  - tlb_remove_page() / __tlb_remove_page()
- *  - tlb_remove_page_size() / __tlb_remove_page_size()
- *  - __tlb_remove_folio_pages()
+ *  - tlb_remove_page() / tlb_remove_page_size()
+ *  - __tlb_remove_folio_pages() / __tlb_remove_page_size()
+ *  - __tlb_remove_folio_pages_size()
  *
- *    __tlb_remove_page_size() is the basic primitive that queues a page for
- *    freeing. __tlb_remove_page() assumes PAGE_SIZE. Both will return a
- *    boolean indicating if the queue is (now) full and a call to
- *    tlb_flush_mmu() is required.
+ *    __tlb_remove_folio_pages_size() is the basic primitive that queues pages
+ *    for freeing. It will return a boolean indicating if the queue is (now)
+ *    full and a call to tlb_flush_mmu() is required.
  *
  *    tlb_remove_page() and tlb_remove_page_size() imply the call to
  *    tlb_flush_mmu() when required and has no return value.
  *
- *    __tlb_remove_folio_pages() is similar to __tlb_remove_page(), however,
- *    instead of removing a single page, remove the given number of consecutive
- *    pages that are all part of the same (large) folio: just like calling
- *    __tlb_remove_page() on each page individually.
+ *    __tlb_remove_folio_pages() is similar to __tlb_remove_page_size(),
+ *    however, instead of removing a single page, assume PAGE_SIZE and remove
+ *    the given number of consecutive pages that are all part of the
+ *    same (large) folio.
  *
  *  - tlb_change_page_size()
  *
-- 
2.41.0

