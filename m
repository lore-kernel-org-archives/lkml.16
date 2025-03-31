Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018061D516F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408833; cv=none; b=ZEl6lMjztjmBlDlHtc+PQsa4Rcz3eN+qNPtCNyQSrDdKoBCIHp+sz5QilCaeddxWFVyqvlC6pM/XVh6AKo1BzdWloh2ewFx17aMJGLr6cwAlHHASmSFz72wFZlaeudsYJGOhYm66tF+bun467aDFrKfKJgTxCMFpLJ4f4ZkSi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408833; c=relaxed/simple;
	bh=dV31qLfZYBVplnNpN5HFMO6P6+XvZuhLiFjfyn9Y/ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=p/WXLoS0GbU9mOq6JhZQDMjenKJZ3Bz4n9/VpgytPzUwDfYppbR2dPNRIV5vsJhATywiIH0QxAPC/nSSEP6q/fsVBq+OYDGkiRJbOHFqIZK1QQGxKyMY031O+Zn/lzqSKB5N4MHv7tUBcd3YRF1MgGExrNS1Q+KHMYBAoAnRGhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QXhd1Hx1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QXhd1Hx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0gf9RGsw/MtUT85PnmYum3vQIHTxmH593ortJMGyJU=;
	b=QXhd1Hx1Oc7MMv1zrWHsG8p63ecceCETKcyburEBe9irPCTKeaIfFj/rxwb69PYprHqT2a
	BnPB2FSTOM9rodIbZ6eTgsLBzNZkBrXv3sZvt8+KqhP3ASEkaEVGTgs/Mi3n9j3xqKsua7
	mQlcaGXvCy+20EfLgWHjjHP+HG8ZuRo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-Vy8rpVrTPkeCly9O0-hLPQ-1; Mon,
 31 Mar 2025 04:13:45 -0400
X-MC-Unique: Vy8rpVrTPkeCly9O0-hLPQ-1
X-Mimecast-MFC-AGG-ID: Vy8rpVrTPkeCly9O0-hLPQ_1743408824
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 34A251800258;
	Mon, 31 Mar 2025 08:13:43 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 07CC51955BEF;
	Mon, 31 Mar 2025 08:13:39 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set in __get_user_pages() earlier
Date: Mon, 31 Mar 2025 16:13:22 +0800
Message-ID: <20250331081327.256412-3-bhe@redhat.com>
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

In __get_user_pages(), it will traverse page table and take a reference
to the page the given user address corresponds to if GUP_GET or GUP_PIN
is et. However, it's not supported both GUP_GET and GUP_PIN are set.
This check should be done earlier, but not doing it till entering into
follow_page_pte() and failed.

Here move the checking to the beginning of __get_user_pages().

Signed-off-by: Baoquan He <bhe@redhat.com>
---
v1->v2:
- Fix code bug caused by copy-and-paste error, this is reported by
  lkp test robot.

 mm/gup.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 73777b1de679..f9bce14ed3cd 100644
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
+	if (WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
+			 (FOLL_PIN | FOLL_GET)))
+		return -EINVAL;
+
 	do {
 		struct page *page;
 		unsigned int page_increm;
-- 
2.41.0

