Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBBB1BE251
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743337062; cv=none; b=QeXLyKp+dC+XD+Kf2mzYYrAYxNLhXbC+0dc1F2+1zimjWj9ODuTp1Uc69tswP/VmhRTDT5Iwu3LJPYvijAAahSbVSkK1tpXCcIlAdwyM67mAi/bwiLHJgUiRLO7Z0hI/cX8RRJBlfUWXBZr9FN47+lNLnD1eDVxX5m5A+16t3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743337062; c=relaxed/simple;
	bh=Ng+GNrybUdI+BpZ9b0iCGTWyUpXKBhvvQS92NmSnUkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=fyftU0UCMP9kY0ecAdGwL+IedXXfu3/IWH9g5SrMM30pF1J3R2cWaB1LmYkdIf6+xT+58/iX7L9iab+taVtcIph1JhMkxdy8o6Zd9LzeQnSNIosOD6oakgkZpcLR0GL2fOeMFygvvGjoM/7OsAABX3BejsEXLitArh6pIiC0REM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b6RLiTQz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b6RLiTQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743337059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0G+7enjJ3hUuHc8nn+ZMKDLjMZiATmJ3BHld8fzSZf8=;
	b=b6RLiTQz+MLGUMzHB1mQfKDhOShYRsK6a0vOEvkdfewN7t63f9KrkPpzqDQmUPBgdCg2rd
	wUxzqAv9hLNAlJrwIrwsO6eBIAQvFueHnlIfR1VuPj7JJu8V3VkYo8o9LWgd0UAT8PgPBj
	4VrTmsJpg6WmxFsMwMSONT3FOK6vbRU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-fhcRkH7YOYeKvg-myRGkUg-1; Sun,
 30 Mar 2025 08:17:36 -0400
X-MC-Unique: fhcRkH7YOYeKvg-myRGkUg-1
X-Mimecast-MFC-AGG-ID: fhcRkH7YOYeKvg-myRGkUg_1743337055
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0173E18004A9;
	Sun, 30 Mar 2025 12:17:35 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.17])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2BD13180094A;
	Sun, 30 Mar 2025 12:17:31 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set in __get_user_pages() earlier
Date: Sun, 30 Mar 2025 20:17:12 +0800
Message-ID: <20250330121718.175815-3-bhe@redhat.com>
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

In __get_user_pages(), it will traverse page table and take a reference
to the page the given user address corresponds to if GUP_GET or GUP_PIN
is et. However, it's not supported both GUP_GET and GUP_PIN are set.
This check should be done earlier, but not doing it till entering into
follow_page_pte() and failed.

Here move the checking to the beginning of __get_user_pages().

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/gup.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 73777b1de679..8788105daee8 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -847,11 +847,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	pte_t *ptep, pte;
 	int ret;
 
-	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
-	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
-			 (FOLL_PIN | FOLL_GET)))
-		return ERR_PTR(-EINVAL);
-
 	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
 	if (!ptep)
 		return no_page_table(vma, flags, address);
@@ -1434,6 +1429,11 @@ static long __get_user_pages(struct mm_struct *mm,
 
 	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
 
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
+			 (FOLL_PIN | FOLL_GET)))
+		return ERR_PTR(-EINVAL);
+
 	do {
 		struct page *page;
 		unsigned int page_increm;
-- 
2.41.0

