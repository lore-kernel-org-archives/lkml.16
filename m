Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F151B424E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034543; cv=none; b=N+OWajogLVS/shWSB82rN42uzhAUdF9qqoHciZFZNrvcBbRfbgs/oT6IkHP6lmwekIDOADyxL/8Q8vQ2vNtyGAu+R4YVNL/l4STkL4V/tfxI/LgRgHVLlUN1nf5SM6me1OKiDqzEMqm7fYYB7kmrWqqE5GQ5UjphxSo0tqaN5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034543; c=relaxed/simple;
	bh=GX9LLC34yNkqkN+BXKeewvPrA+9S9eWb5zVbgyI8Acs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfsnhUogFdP8HfAriXtPGN4I5OI/ZDilWRIiyGWkQdAKOO8Dek9N+jOPadtH+gIZunV218HjUyURnNetoqmQEa4KN29c1skJoVBNQUSRkIM4exHF3xcIspSJ/kaN2kyMobxiAR3dUf9dQHGks35Butubn+X4E3mc5T0M0+hO3vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7iqKZWk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7iqKZWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744034540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vENbc4ukB5avy4pU0jrZtrgOnkO/88BBJDuqluu8e/I=;
	b=H7iqKZWkkQYxx6YN8jyu38nFyL0UUrEGHI+i6To7bsR4sEBG3pWCzl6P/eVxhXfuvOzspK
	W5rXjdmIruxcjb8e6hcN8f/1XLDMqpp/3Vplr17MrKJs6KfgR5HYIPcsH/qAjKqBv/xv8h
	dlZueX9XQPVqd5G9PiZXPeEtNfFaU/Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-dnITgcH6OnK00oLE9CQxYA-1; Mon,
 07 Apr 2025 10:02:15 -0400
X-MC-Unique: dnITgcH6OnK00oLE9CQxYA-1
X-Mimecast-MFC-AGG-ID: dnITgcH6OnK00oLE9CQxYA_1744034526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F251A1828AD4;
	Mon,  7 Apr 2025 14:02:05 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.175])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4EDB6192C7C3;
	Mon,  7 Apr 2025 14:02:00 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ryosuke Yasuoka <ryasuoka@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v3 1/2] mm/kmap: Add kmap_local_page_try_from_panic()
Date: Mon,  7 Apr 2025 15:42:25 +0200
Message-ID: <20250407140138.162383-2-jfalempe@redhat.com>
In-Reply-To: <20250407140138.162383-1-jfalempe@redhat.com>
References: <20250407140138.162383-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

kmap_local_page() can be unsafe to call from a panic handler, if
CONFIG_HIGHMEM is set, and the page is in the highmem zone.
So add kmap_local_page_try_from_panic() to handle this case.

Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v3:
 * Add a comment in kmap_local_page_try_from_panic() (Thomas Gleixner)
 
 include/linux/highmem-internal.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
index dd100e849f5e0..9a7683d79a4b1 100644
--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -73,6 +73,14 @@ static inline void *kmap_local_page(struct page *page)
 	return __kmap_local_page_prot(page, kmap_prot);
 }
 
+static inline void *kmap_local_page_try_from_panic(struct page *page)
+{
+	if (!PageHighMem(page))
+		return page_address(page);
+	/* If the page is in HighMem, it's not safe to kmap it.*/
+	return NULL;
+}
+
 static inline void *kmap_local_folio(struct folio *folio, size_t offset)
 {
 	struct page *page = folio_page(folio, offset / PAGE_SIZE);
@@ -180,6 +188,11 @@ static inline void *kmap_local_page(struct page *page)
 	return page_address(page);
 }
 
+static inline void *kmap_local_page_try_from_panic(struct page *page)
+{
+	return page_address(page);
+}
+
 static inline void *kmap_local_folio(struct folio *folio, size_t offset)
 {
 	return page_address(&folio->page) + offset;
-- 
2.49.0

