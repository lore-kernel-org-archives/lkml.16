Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2748D9450
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744509903; cv=none; b=kJYUsmlfuyiQTqKkHymtC8Ph3VBzxEOYY4zE0qkI6ik8kYmezWsvRDxi88+mpjH+G6cNFMkAwThDb4hOy53NmmJnf3TjSSKEfQ/GwAZQMLZMMhJIG4GvwaAtB2U/32eqR7RzTjqTY5klGdBbFMytyiHadCQY7aceIfMC4n+v/p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744509903; c=relaxed/simple;
	bh=ockxFpc1Mvp9ndvbGIZbWEqYgjkB6KWqKd8QAc42660=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eln130WxUyOCgiy+TX+wCTP21CaHVl1GRhcWrs2uTrgt05JthXQ3tReJFy2OT3vCgjWogCXzrqar8P7q4TCRsHZSGxF3CLZ6BZIIWGSzFLm2Wfsp2OgajjwyNDoovF6PZd6kdnDKrgKIYRxIq8BYKMiMdSBsc9aY6UqpvjG59/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRqwXtbe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRqwXtbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744509900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LG6tXDmnP8G8MkHZOoO/Lg5rvAo2Y4/akxgGjSvAvag=;
	b=PRqwXtbeRmNZL1fwDo5jRl+BgydOuBkj81W3Ts9Dfx2MWiCncl92oiusvAbb6a4vzbCpBg
	o37jKAjIG/5hyPsMZN9VjPTV8OxvH/1C12GKTzbtASDHQUMcFX56obvvlRpeYXQo4juHUu
	Ypqw4aww6rXemqJpwyQAZGDu/9Ke8pE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-9eRCweagMs6Bu0zXjU0TjA-1; Sat,
 12 Apr 2025 22:04:55 -0400
X-MC-Unique: 9eRCweagMs6Bu0zXjU0TjA-1
X-Mimecast-MFC-AGG-ID: 9eRCweagMs6Bu0zXjU0TjA_1744509894
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F344218004A9;
	Sun, 13 Apr 2025 02:04:53 +0000 (UTC)
Received: from localhost (unknown [10.72.112.43])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E69C180B486;
	Sun, 13 Apr 2025 02:04:51 +0000 (UTC)
Date: Sun, 13 Apr 2025 10:04:47 +0800
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org, david@redhat.com, osalvador@suse.de,
	yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] mm/gup: clean up codes in fault_in_xxx() functions
Message-ID: <Z/sbv3EmLXWgEE7+@MiWiFi-R3L-srv>
References: <20250410035717.473207-1-bhe@redhat.com>
 <20250410035717.473207-5-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410035717.473207-5-bhe@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
v4->v5:
Address minor concerns from David:
- Remove one blank line in fault_in_writable() added in v4;
- Put the loop cursor initialization 'cur = start;' into the for loop
  initialization part.
  
 mm/gup.c | 62 ++++++++++++++++++++++----------------------------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 77a5bc622567..f32168339390 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2113,28 +2113,22 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
  */
 size_t fault_in_writeable(char __user *uaddr, size_t size)
 {
-	char __user *start = uaddr, *end;
+	const unsigned long start = (unsigned long)uaddr;
+	const unsigned long end = start + size;
+	unsigned long cur;
 
 	if (unlikely(size == 0))
 		return 0;
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
 
+	/* Stop once we overflow to 0. */
+	for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
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
@@ -2188,26 +2182,24 @@ EXPORT_SYMBOL(fault_in_subpage_writeable);
  */
 size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
 {
-	unsigned long start = (unsigned long)uaddr, end;
+	const unsigned long start = (unsigned long)uaddr;
+	const unsigned long end = start + size;
+	unsigned long cur;
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
+	for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
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
@@ -2222,30 +2214,24 @@ EXPORT_SYMBOL(fault_in_safe_writeable);
  */
 size_t fault_in_readable(const char __user *uaddr, size_t size)
 {
-	const char __user *start = uaddr, *end;
+	const unsigned long start = (unsigned long)uaddr;
+	const unsigned long end = start + size;
+	unsigned long cur;
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
 
+	/* Stop once we overflow to 0. */
+	for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
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

