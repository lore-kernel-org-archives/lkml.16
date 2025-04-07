Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB023C9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995022; cv=none; b=DJo5o58A1LHieUt57/leoFK23IkwnuAm6L2Xsxn2NYoYat8ODaKLdt1PQuCKScXque0sQjRRPG7s3/e/LWlK2xyzKaJkngpwnAzh8B6Xik45Obk992KfVQfc/PBsa1KN1Rc0yeEjvY/0LYY/U3r0s0MyrxXfvW1Yy0bhtZ/oUP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995022; c=relaxed/simple;
	bh=anoOtA7y6qgnrIh5JPM+glc+gVVqyk36QYkbNJhTtw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Ax+DmsbRpEDx5QzUOkg8jxuzZ4M1O7aEfasOxccFOKjMHFha+YDnhCY1zTwwd6GGKJto38J+QonJdA3aRFRnsWXaCfx9UskPMjzFBCf69/8/2M6fhE2Qi+Q1MT5T1vlSRlb9W5zTVULFU/z5ed3ZIHMqJndFSyuA8iXERVitETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byuPrl9e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byuPrl9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743995019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfJMyqNy/t97b+P9yQjERuT06PZQ+0TGu1JM+vWKq/A=;
	b=byuPrl9ej57u6zLBLJG+pQMTXCNTQB/cstSWhkhAWT9j0QBTAmeYqH4+YwdvRqGfYlsodP
	7tT+Q2BykVG4k3D6XYJ/yis1uJlRHRUHAt2D6EDzNXPDNZkA86k/EpyQrVKhOZGECbOaLh
	07+zjJ+sGOCetPXYuCmAOoOETxs3x6c=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-7xi461BqNpmUQhAB1YDcFg-1; Sun,
 06 Apr 2025 23:03:36 -0400
X-MC-Unique: 7xi461BqNpmUQhAB1YDcFg-1
X-Mimecast-MFC-AGG-ID: 7xi461BqNpmUQhAB1YDcFg_1743995015
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6BB1180AF56;
	Mon,  7 Apr 2025 03:03:34 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.15])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3ECF51801752;
	Mon,  7 Apr 2025 03:03:28 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	osalvador@suse.de,
	david@redhat.com,
	mingo@kernel.org,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v3 1/3] mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
Date: Mon,  7 Apr 2025 11:03:04 +0800
Message-ID: <20250407030306.411977-2-bhe@redhat.com>
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

Not like fault_in_readable() or fault_in_writeable(), in
fault_in_safe_writeable() local variable 'start' is increased page
by page to loop till the whole address range is handled. However,
it mistakenly calcalates the size of handled range with 'uaddr - start'.

Here fix the code bug in fault_in_safe_writeable(), and also adjusting
the codes in fault_in_readable() and fault_in_writeable() to use local
variable 'start' to loop so that codes in these three functions are
consistent.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/gup.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 92351e2fa876..67a7de9e4f80 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2114,7 +2114,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
  */
 size_t fault_in_writeable(char __user *uaddr, size_t size)
 {
-	char __user *start = uaddr, *end;
+	unsigned long start = (unsigned long)uaddr, end;
 
 	if (unlikely(size == 0))
 		return 0;
@@ -2122,20 +2122,20 @@ size_t fault_in_writeable(char __user *uaddr, size_t size)
 		return size;
 	if (!PAGE_ALIGNED(uaddr)) {
 		unsafe_put_user(0, uaddr, out);
-		uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
+		start = PAGE_ALIGN((unsigned long)uaddr);
 	}
-	end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
+	end = PAGE_ALIGN(start + size);
 	if (unlikely(end < start))
-		end = NULL;
-	while (uaddr != end) {
-		unsafe_put_user(0, uaddr, out);
-		uaddr += PAGE_SIZE;
+		end = 0;
+	while (start != end) {
+		unsafe_put_user(0, (char __user *)start, out);
+		start += PAGE_SIZE;
 	}
 
 out:
 	user_write_access_end();
-	if (size > uaddr - start)
-		return size - (uaddr - start);
+	if (size > start - (unsigned long)uaddr)
+		return size - (start - (unsigned long)uaddr);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_writeable);
@@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
 	} while (start != end);
 	mmap_read_unlock(mm);
 
-	if (size > (unsigned long)uaddr - start)
-		return size - ((unsigned long)uaddr - start);
+	if (size > start - (unsigned long)uaddr)
+		return size - (start - (unsigned long)uaddr);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_safe_writeable);
@@ -2223,7 +2223,7 @@ EXPORT_SYMBOL(fault_in_safe_writeable);
  */
 size_t fault_in_readable(const char __user *uaddr, size_t size)
 {
-	const char __user *start = uaddr, *end;
+	unsigned long start = (unsigned long)uaddr, end;
 	volatile char c;
 
 	if (unlikely(size == 0))
@@ -2232,21 +2232,21 @@ size_t fault_in_readable(const char __user *uaddr, size_t size)
 		return size;
 	if (!PAGE_ALIGNED(uaddr)) {
 		unsafe_get_user(c, uaddr, out);
-		uaddr = (const char __user *)PAGE_ALIGN((unsigned long)uaddr);
+		start = PAGE_ALIGN((unsigned long)uaddr);
 	}
-	end = (const char __user *)PAGE_ALIGN((unsigned long)start + size);
+	end = PAGE_ALIGN(start + size);
 	if (unlikely(end < start))
-		end = NULL;
-	while (uaddr != end) {
-		unsafe_get_user(c, uaddr, out);
-		uaddr += PAGE_SIZE;
+		end = 0;
+	while (start != end) {
+		unsafe_get_user(c, (const char __user *)start, out);
+		start += PAGE_SIZE;
 	}
 
 out:
 	user_read_access_end();
 	(void)c;
-	if (size > uaddr - start)
-		return size - (uaddr - start);
+	if (size > start - (unsigned long)uaddr)
+		return size - (start - (unsigned long)uaddr);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_readable);
-- 
2.41.0

