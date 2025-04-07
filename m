Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3C5212F8A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995031; cv=none; b=Hg5f/xaxtEVSLFbSBMTAUAH/Ysq6PLTmeWF4s7xxE4D918CVw+JeZDM1C5+iaWOBENYNu9TJn9/d+mnFTU6kfHghjMo/iubndXYVbM+7m6o+F8FziGO1A/LnmbRYCqV14IvuLdbI8vSs5b/VVbPcW/sWSiNvC675df6X87ctC2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995031; c=relaxed/simple;
	bh=2iHESdN5CAJpKUIN9UWdXRao4XpqXuVxxqv0vjsjzdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ky0UjjbDNN5W5geuIkCn1Sgs361lhI4D85eyFUI0fSHC0chavLNlFJdb8XQavkm6/p+d937Q/Cw+PituIRBlx+jiwXRS+EMY8L79jMnPkJv4Yt2Ogin39RszUMjqljoqR5Gkdyv7w2cdTytKKR2QmuCYasAM9u6aVRveTcfZBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CcMz63xH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CcMz63xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743995028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bJ2k0hP9st8IhgiofWedxfuUo0Bg6ypk1SRHkg21egg=;
	b=CcMz63xHmh5qaX3/t7MpGbeG8RqjXCRNXvofBrjokFaxw7jjgSlUd/5ULciNd4Hu0aA4SU
	V9ZLby2gkIo17dx0DWiITxFOIohuJJr1piED6jY2tGRPtVum6f5h/3ta4X7AdTC7QhpUk1
	+tQJTVsTJoCd/RkLjOBCKX+FtXDtwGo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-oMN4FsPAPlG8CptC09g51A-1; Sun,
 06 Apr 2025 23:03:43 -0400
X-MC-Unique: oMN4FsPAPlG8CptC09g51A-1
X-Mimecast-MFC-AGG-ID: oMN4FsPAPlG8CptC09g51A_1743995022
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C9B701800257;
	Mon,  7 Apr 2025 03:03:41 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.15])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D41EF1801752;
	Mon,  7 Apr 2025 03:03:35 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	osalvador@suse.de,
	david@redhat.com,
	mingo@kernel.org,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v3 2/3] mm/gup: remove unneeded checking in follow_page_pte()
Date: Mon,  7 Apr 2025 11:03:05 +0800
Message-ID: <20250407030306.411977-3-bhe@redhat.com>
In-Reply-To: <20250407030306.411977-1-bhe@redhat.com>
References: <20250407030306.411977-1-bhe@redhat.com>
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
has been done in is_valid_gup_args() for external users of __get_user_pages().

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/gup.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 67a7de9e4f80..5b3ac5a867a3 100644
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

