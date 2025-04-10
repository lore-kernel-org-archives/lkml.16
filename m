Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3908F201031
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257476; cv=none; b=O3mmYcYJNPs+B5KsldjGQ8mJrK06LLQzc8GSq77KXIOFdfuM7WWcVGj4E9VDoAxSZM05q46hzjJvLJpcZl3InJ4jbP5H2nyWcZG7NHoDNNLDCcgMPe/DLCbdJ2c3s9IpxhSHTDCEFQa1UO/YjK2+CtDV6ov2zQ+r5WiqDtlJvyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257476; c=relaxed/simple;
	bh=FDODwI3joPHBhYYHwx/rigJpxA2CfVzWCknO0NozRwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=fENWZvkJA6Ramujxj6VPdsJuoI5lS6kqntr1J/weYQg+pDwCKvVZvRmYa2pZ6i/Lti3d5ppfsy3whWgprzhzZbfopxDg6M7c3MML9qnhwuKobOWHUHMK0jJVCA72zIBUjGZUBkpvjrKtMZTmt1s5XMBFXi93lokKgQQ/vfyiKUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eOLfOVyD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eOLfOVyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744257473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pFd+u5mCoqhmCfr93K2zek+trGS6VlClORLBIf/qW0=;
	b=eOLfOVyDIueEQtp6I535dOobrS3KOZvQxnBmNakeRnPh/5nyL0gzBxUfAkycajvAOnnQlH
	THq0NgQsZ403ggDgpEj510JCN42kU4ZL4sL/gfT6BeYUaWuTpZ00hf2rQNmZL8XnXOdYhQ
	Rro1uXgQkDHrfaqvGvSCogqHQEoc50E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-346-6oLAsj_QORK9FKjEnBq8rw-1; Wed,
 09 Apr 2025 23:57:47 -0400
X-MC-Unique: 6oLAsj_QORK9FKjEnBq8rw-1
X-Mimecast-MFC-AGG-ID: 6oLAsj_QORK9FKjEnBq8rw_1744257465
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 65330180AF4E;
	Thu, 10 Apr 2025 03:57:45 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5620119560AD;
	Thu, 10 Apr 2025 03:57:40 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	osalvador@suse.de,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v4 4/4] mm/gup: clean up codes in fault_in_xxx() functions
Date: Thu, 10 Apr 2025 11:57:17 +0800
Message-ID: <20250410035717.473207-5-bhe@redhat.com>
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

The code style in fault_in_readable() and fault_in_writable() is a
little inconsistent with fault_in_safe_writeable(). In fault_in_readable()
and fault_in_writable(), it uses 'uaddr' passed in as loop cursor. While
in fault_in_safe_writeable(), local variable 'start' is used as loop
cursor. This may mislead people when reading code or making change in
these codes.

Here define explicit loop cursor and use for loop to simplify codes in
these three functions. These cleanup can make them be consistent in
code style and improve readability.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/gup.c | 65 +++++++++++++++++++++++---------------------------------
 1 file changed, 26 insertions(+), 39 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 77a5bc622567..a76bd7e90a71 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2113,28 +2113,24 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
  */
 size_t fault_in_writeable(char __user *uaddr, size_t size)
 {
-	char __user *start = uaddr, *end;
+	const unsigned long start = (unsigned long)uaddr;
+	const unsigned long end = start + size;
+	unsigned long cur = start;
 
 	if (unlikely(size == 0))
 		return 0;
+
 	if (!user_write_access_begin(uaddr, size))
 		return size;
-	if (!PAGE_ALIGNED(uaddr)) {
-		unsafe_put_user(0, uaddr, out);
-		uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
-	}
-	end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
-	if (unlikely(end < start))
-		end = NULL;
-	while (uaddr != end) {
-		unsafe_put_user(0, uaddr, out);
-		uaddr += PAGE_SIZE;
-	}
+
+	/* Stop once we overflow to 0. */
+	for (; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
+		unsafe_put_user(0, (char __user *)cur, out);
 
 out:
 	user_write_access_end();
-	if (size > uaddr - start)
-		return size - (uaddr - start);
+	if (size > cur - start)
+		return size - (cur - start);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_writeable);
@@ -2188,26 +2184,24 @@ EXPORT_SYMBOL(fault_in_subpage_writeable);
  */
 size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
 {
-	unsigned long start = (unsigned long)uaddr, end;
+	const unsigned long start = (unsigned long)uaddr;
+	const unsigned long end = start + size;
+	unsigned long cur = start;
 	struct mm_struct *mm = current->mm;
 	bool unlocked = false;
 
 	if (unlikely(size == 0))
 		return 0;
-	end = PAGE_ALIGN(start + size);
-	if (end < start)
-		end = 0;
 
 	mmap_read_lock(mm);
-	do {
-		if (fixup_user_fault(mm, start, FAULT_FLAG_WRITE, &unlocked))
+	/* Stop once we overflow to 0. */
+	for (; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
+		if (fixup_user_fault(mm, cur, FAULT_FLAG_WRITE, &unlocked))
 			break;
-		start = (start + PAGE_SIZE) & PAGE_MASK;
-	} while (start != end);
 	mmap_read_unlock(mm);
 
-	if (size > start - (unsigned long)uaddr)
-		return size - (start - (unsigned long)uaddr);
+	if (size > cur - start)
+		return size - (cur - start);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_safe_writeable);
@@ -2222,30 +2216,23 @@ EXPORT_SYMBOL(fault_in_safe_writeable);
  */
 size_t fault_in_readable(const char __user *uaddr, size_t size)
 {
-	const char __user *start = uaddr, *end;
+	const unsigned long start = (unsigned long)uaddr;
+	const unsigned long end = start + size;
+	unsigned long cur = start;
 	volatile char c;
 
 	if (unlikely(size == 0))
 		return 0;
 	if (!user_read_access_begin(uaddr, size))
 		return size;
-	if (!PAGE_ALIGNED(uaddr)) {
-		unsafe_get_user(c, uaddr, out);
-		uaddr = (const char __user *)PAGE_ALIGN((unsigned long)uaddr);
-	}
-	end = (const char __user *)PAGE_ALIGN((unsigned long)start + size);
-	if (unlikely(end < start))
-		end = NULL;
-	while (uaddr != end) {
-		unsafe_get_user(c, uaddr, out);
-		uaddr += PAGE_SIZE;
-	}
-
+	/* Stop once we overflow to 0. */
+	for (; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
+		unsafe_get_user(c, (const char __user *)cur, out);
 out:
 	user_read_access_end();
 	(void)c;
-	if (size > uaddr - start)
-		return size - (uaddr - start);
+	if (size > cur - start)
+		return size - (cur - start);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_readable);
-- 
2.41.0

