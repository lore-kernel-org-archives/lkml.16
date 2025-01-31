Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88318CBFE
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314490; cv=none; b=kFTQutDeCeINelqe0hDmRCzlANuk7IRy4ZuCw/LEh28z5ZXrjbV7P4VZHFuhGxWLCwmikfivGWoxj0Rs/u9YyF0ovZqOjAvAHT9oN3b0YbJLENBXHr/0u8Jsj/Z15Q3PAC/4a3L69RV2dq0nAnXEf//v7YzBTz7iOMlfUrFes5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314490; c=relaxed/simple;
	bh=8ivNqsIp3GMO90oTFY6Dtx8Mq8clYFyCBE8M2NSHYLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUsZxayBmxH/yZ7Rv55dEKrtMVLmu23kw6aftEBhYWT/43pPuIS2ZU0QZJq45Kz1+MxHMZiiPPMcZXc3m9iZ/t6gjXTDKe8Gz/hQ0rtxkTLBXd2HHOhcWjd1Jwzu0og1rW8awyRZPprQPMFQ+cLxTmx3f1iYD8A3qY2AI1rGBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YJ2U4pX+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YJ2U4pX+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso29292395ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314488; x=1738919288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSDpkbxqSvfVMXf6MtRLSP9PYlXCwlCf1VxOLTEJdKQ=;
        b=YJ2U4pX+Rk+VUj1IYUUeN+ODu9JfNzPCdL7hSHoOncETw/CtjqvWFo5naFgajwROtr
         nGXeCRPluhxayNUTG/gLQBN7A2aYx81hI6rnP2s+O1/yqXgvzpcH4vKitb2X94tIKmzI
         ycgaaqj6EDxy8VZjZU+Dot/eJQCa1Mfwl4TcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314488; x=1738919288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSDpkbxqSvfVMXf6MtRLSP9PYlXCwlCf1VxOLTEJdKQ=;
        b=HXr4oLvLdXHQydjzem2EeSkavy1VNtfWqm2ekSygAAReRPy4WNUWz5P+bDh1GANP9/
         VlQ/5da3hAB+bEY/t9LBfRBPsMjX48VxfKNrzJ/5Pee6g38xKAiGSTVYsFqEWJTOtidi
         qtjDDleLXBbeCX2y1WV+sTysNoIlImEP4t88oVutKVrNiQvfOV8rLJejfDvoo18hyPxw
         JHgvg5s2RZg9bA0y5RpGknZKF/xRzldTQ7KnURzW/seHLI6azDIM8gaIe+9wXLgXc5E0
         s/XVLAKIlLYZ6+BJ1h1ISVj6jMJnTb4I6jmeKkIsnKtFHFmh86qodkscyovbqW7DJcbD
         PaRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1spdPmBxha5jVqZz+frgGkOneER5+FMFcqLiLnDpA/RtNPChrSo0D2jwTUBhEsz7pEvz2mVJL/Et0Uuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxevW0nw1FXHdbm/fHciRyPS3nqy5TKLoSYuqKsnH1TQwMCTrzR
	wCDIcLVl0vJmpZCi4VDbUHCIMDYngsDlE9reoRtI7lE4CvNgyzW//G/P2W84XA==
X-Gm-Gg: ASbGncu9i9iUmT1opPimRn3aleSgFYSvbkS15dVBJuC+2Mhn/To6A4Xy/aL01KU1bTQ
	kZXcUit2SbNMmBEp7icMbetR747CPRQA2Y2KzlWq3P0r7HThcONlwhv3umYjEIXRWjth/AnQWmm
	+F7vAcC1EZNSHt00pG1a7ujiOv3xdVgJtOx8abqcQWU8h/nxakrUZWRvtKHbNRSrDHeMti4OZEW
	41/8iTawwPUWeApprzTj2WZqX7uV862fuQzMgPcxFGRyJ9ofsRcjfZX1P8k6NpOhaM6Z+CfbQ9r
	C5lVspSXlk9V1c5VHQ==
X-Google-Smtp-Source: AGHT+IFbB/ylqlS/xqv7OLfNnPKv/KBkJRu1pTXCHuKZ+Ljs5D2OLYSsCuLflKkc6dvQm0HS88PAuQ==
X-Received: by 2002:a17:903:2f8e:b0:215:b75f:a1cb with SMTP id d9443c01a7336-21dd9fa74bcmr137340835ad.9.1738314487509;
        Fri, 31 Jan 2025 01:08:07 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de32f44a9sm26237855ad.143.2025.01.31.01.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:08:07 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Subject: [PATCHv4 15/17] zsmalloc: introduce new object mapping API
Date: Fri, 31 Jan 2025 18:06:14 +0900
Message-ID: <20250131090658.3386285-16-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131090658.3386285-1-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current object mapping API is a little cumbersome.  First, it's
inconsistent, sometimes it returns with page-faults disabled and
sometimes with page-faults enabled.  Second, and most importantly,
it enforces atomicity restrictions on its users.  zs_map_object()
has to return a liner object address which is not always possible
because some objects span multiple physical (non-contiguous)
pages.  For such objects zsmalloc uses a per-CPU buffer to which
object's data is copied before a pointer to that per-CPU buffer
is returned back to the caller.  This leads to another, final,
issue - extra memcpy().  Since the caller gets a pointer to
per-CPU buffer it can memcpy() data only to that buffer, and
during zs_unmap_object() zsmalloc will memcpy() from that per-CPU
buffer to physical pages that object in question spans across.

New API splits functions by access mode:
- zs_obj_read_begin(handle, local_copy)
  Returns a pointer to handle memory.  For objects that span two
  physical pages a local_copy buffer is used to store object's
  data before the address is returned to the caller.  Otherwise
  the object's page is kmap_local mapped directly.

- zs_obj_read_end(handle, buf)
  Unmaps the page if it was kmap_local mapped by zs_obj_read_begin().

- zs_obj_write(handle, buf, len)
  Copies len-bytes from compression buffer to handle memory
  (takes care of objects that span two pages).  This does not
  need any additional (e.g. per-CPU) buffers and writes the data
  directly to zsmalloc pool pages.

The old API will stay around until the remaining users switch
to the new one.  After that we'll also remove zsmalloc per-CPU
buffer and CPU hotplug handling.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
---
 include/linux/zsmalloc.h |   8 +++
 mm/zsmalloc.c            | 129 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
index a48cd0ffe57d..7d70983cf398 100644
--- a/include/linux/zsmalloc.h
+++ b/include/linux/zsmalloc.h
@@ -58,4 +58,12 @@ unsigned long zs_compact(struct zs_pool *pool);
 unsigned int zs_lookup_class_index(struct zs_pool *pool, unsigned int size);
 
 void zs_pool_stats(struct zs_pool *pool, struct zs_pool_stats *stats);
+
+void *zs_obj_read_begin(struct zs_pool *pool, unsigned long handle,
+			void *local_copy);
+void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
+		     void *handle_mem);
+void zs_obj_write(struct zs_pool *pool, unsigned long handle,
+		  void *handle_mem, size_t mem_len);
+
 #endif
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f5b5fe732e50..f9d840f77b18 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1365,6 +1365,135 @@ void zs_unmap_object(struct zs_pool *pool, unsigned long handle)
 }
 EXPORT_SYMBOL_GPL(zs_unmap_object);
 
+void *zs_obj_read_begin(struct zs_pool *pool, unsigned long handle,
+			void *local_copy)
+{
+	struct zspage *zspage;
+	struct zpdesc *zpdesc;
+	unsigned long obj, off;
+	unsigned int obj_idx;
+	struct size_class *class;
+	void *addr;
+
+	WARN_ON(in_interrupt());
+
+	/* Guarantee we can get zspage from handle safely */
+	pool_read_lock(pool);
+	obj = handle_to_obj(handle);
+	obj_to_location(obj, &zpdesc, &obj_idx);
+	zspage = get_zspage(zpdesc);
+
+	/* Make sure migration doesn't move any pages in this zspage */
+	zspage_read_lock(zspage);
+	pool_read_unlock(pool);
+
+	class = zspage_class(pool, zspage);
+	off = offset_in_page(class->size * obj_idx);
+
+	if (off + class->size <= PAGE_SIZE) {
+		/* this object is contained entirely within a page */
+		addr = kmap_local_zpdesc(zpdesc);
+		addr += off;
+	} else {
+		size_t sizes[2];
+
+		/* this object spans two pages */
+		sizes[0] = PAGE_SIZE - off;
+		sizes[1] = class->size - sizes[0];
+		addr = local_copy;
+
+		memcpy_from_page(addr, zpdesc_page(zpdesc),
+				 off, sizes[0]);
+		zpdesc = get_next_zpdesc(zpdesc);
+		memcpy_from_page(addr + sizes[0],
+				 zpdesc_page(zpdesc),
+				 0, sizes[1]);
+	}
+
+	if (!ZsHugePage(zspage))
+		addr += ZS_HANDLE_SIZE;
+
+	return addr;
+}
+EXPORT_SYMBOL_GPL(zs_obj_read_begin);
+
+void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
+		     void *handle_mem)
+{
+	struct zspage *zspage;
+	struct zpdesc *zpdesc;
+	unsigned long obj, off;
+	unsigned int obj_idx;
+	struct size_class *class;
+
+	obj = handle_to_obj(handle);
+	obj_to_location(obj, &zpdesc, &obj_idx);
+	zspage = get_zspage(zpdesc);
+	class = zspage_class(pool, zspage);
+	off = offset_in_page(class->size * obj_idx);
+
+	if (off + class->size <= PAGE_SIZE) {
+		if (!ZsHugePage(zspage))
+			off += ZS_HANDLE_SIZE;
+		handle_mem -= off;
+		kunmap_local(handle_mem);
+	}
+
+	zspage_read_unlock(zspage);
+}
+EXPORT_SYMBOL_GPL(zs_obj_read_end);
+
+void zs_obj_write(struct zs_pool *pool, unsigned long handle,
+		  void *handle_mem, size_t mem_len)
+{
+	struct zspage *zspage;
+	struct zpdesc *zpdesc;
+	unsigned long obj, off;
+	unsigned int obj_idx;
+	struct size_class *class;
+
+	WARN_ON(in_interrupt());
+
+	/* Guarantee we can get zspage from handle safely */
+	pool_read_lock(pool);
+	obj = handle_to_obj(handle);
+	obj_to_location(obj, &zpdesc, &obj_idx);
+	zspage = get_zspage(zpdesc);
+
+	/* Make sure migration doesn't move any pages in this zspage */
+	zspage_read_lock(zspage);
+	pool_read_unlock(pool);
+
+	class = zspage_class(pool, zspage);
+	off = offset_in_page(class->size * obj_idx);
+
+	if (off + class->size <= PAGE_SIZE) {
+		/* this object is contained entirely within a page */
+		void *dst = kmap_local_zpdesc(zpdesc);
+
+		if (!ZsHugePage(zspage))
+			off += ZS_HANDLE_SIZE;
+		memcpy(dst + off, handle_mem, mem_len);
+		kunmap_local(dst);
+	} else {
+		/* this object spans two pages */
+		size_t sizes[2];
+
+		off += ZS_HANDLE_SIZE;
+		sizes[0] = PAGE_SIZE - off;
+		sizes[1] = mem_len - sizes[0];
+
+		memcpy_to_page(zpdesc_page(zpdesc), off,
+			       handle_mem, sizes[0]);
+		zpdesc = get_next_zpdesc(zpdesc);
+		memcpy_to_page(zpdesc_page(zpdesc), 0,
+			       handle_mem + sizes[0], sizes[1]);
+	}
+
+	zspage_read_unlock(zspage);
+}
+EXPORT_SYMBOL_GPL(zs_obj_write);
+
 /**
  * zs_huge_class_size() - Returns the size (in bytes) of the first huge
  *                        zsmalloc &size_class.
-- 
2.48.1.362.g079036d154-goog

