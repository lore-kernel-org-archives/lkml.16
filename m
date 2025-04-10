Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8771F1932
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257461; cv=none; b=lqlw4cOGZotG2bFEAEcCMiuiCvSoBZTDew7mAZdpN9nwSrkOESBqajWcMoE+v/oTX7btC6cu9NyhFrAu6+x3D6BlbiKEC0VjUQJB3KxdFouME+S1sK7vk6yPu11SDApdPz8iv2LTv2dBB/L7zsQvPA+VbLvzuMdD1VzTmD8jWAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257461; c=relaxed/simple;
	bh=UM25YJxXAf3pkmBE/Q7zuAnTLPSileGOKfLykBX9hLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=fGq8I6x4O8lquC9VG1ogddb5ZXbcLnJN13WLyrAywEN0NJUwkKaTXIe4hU15gEkWxkYlAlSJ6icGRSikbTmWDVHOpj6UqrEYa5PaLcWSmhsl0QZ8N/4AHfzfzilq1Q5eFjr5yqYH35YH261rFiYS/UAEcGZ80Ar6R3JRs6fc71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MoQEmZkY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MoQEmZkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744257458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pd14nYhYMgdjkQtwmpN+tA62d+FdLUKaQa7vusgjMQ=;
	b=MoQEmZkYxZA/cRffTKtCFgCN8yNtmYzH5Z8f2nfFoYJAnmmm3e+kBYNCKzlajpxRZgJRQv
	FhSpu8EtD+7QPI6Oys8ZJQX8rc9WmTp/uY50ALLb3fLVcUfEa4nLEb8B9UPm5FllHZ8F5e
	Ee1dLslfbc9D38xfx6SjNDEAfsnus0A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-BPQvouKcNg2_QR0P7W8Big-1; Wed,
 09 Apr 2025 23:57:36 -0400
X-MC-Unique: BPQvouKcNg2_QR0P7W8Big-1
X-Mimecast-MFC-AGG-ID: BPQvouKcNg2_QR0P7W8Big_1744257455
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E72B1956050;
	Thu, 10 Apr 2025 03:57:35 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A99A419560AD;
	Thu, 10 Apr 2025 03:57:31 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	osalvador@suse.de,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v4 2/4] mm/gup: remove unneeded checking in follow_page_pte()
Date: Thu, 10 Apr 2025 11:57:15 +0800
Message-ID: <20250410035717.473207-3-bhe@redhat.com>
In-Reply-To: <20250410035717.473207-1-bhe@redhat.com>
References: <20250410035717.473207-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

In __get_user_pages(), it will traverse page table and take a reference
to the page the given user address corresponds to if GUP_GET or GUP_PIN
is set. However, it's not supported both GUP_GET and GUP_PIN are set.
Even though this check need be done, it should be done earlier, but not
doing it till entering into follow_page_pte() and failed.

Furthermore, this checking has been done in is_valid_gup_args() and all
external users of __get_user_pages() will call is_valid_gup_args() to
catch the illegal setting. We don't need to worry about internal users
of __get_user_pages() because the gup_flags are set by MM code correctly.

Here remove the checking in follow_page_pte(), and add VM_WARN_ON_ONCE()
to catch the possible exceptional setting just in case.

And also change the VM_BUG_ON to VM_WARN_ON_ONCE() for checking
(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN))) because the checking
has been done in is_valid_gup_args() for external users of
__get_user_pages().

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..eb668da933e1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -844,11 +844,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
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
@@ -1432,7 +1427,11 @@ static long __get_user_pages(struct mm_struct *mm,
 
 	start = untagged_addr_remote(mm, start);
 
-	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
+	VM_WARN_ON_ONCE(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
+
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	VM_WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
+			(FOLL_PIN | FOLL_GET));
 
 	do {
 		struct page *page;
-- 
2.41.0

