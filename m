Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8815381A
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212334; cv=none; b=Pa/b0vaa2dS3dAuJ1KMNsyCpvyxni44zgDOaL5eYncsZdFTKzg5ODBDqYserkDhXSa4wEHYWPWSrgvEweOL+925NKcCWvXQlQvh638BY543Tx96qjz/Aqdy6X8fkZbizvfT2N9I0BuWp8vgubJ+22QsbWAN65KxXYlM5P8fmlVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212334; c=relaxed/simple;
	bh=xCuw2jrFXoMSpQY3luYSq9RLiwWs/XA7cmJVoraP5Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpZhQtFcbR1hfOHVKrdqaineNrDTsGcj5Z42Pog/k2ta+uCltkddozvQdCQLC/bWgicfALDJ5gKSStUpITdPBpQsL6ymAtEf2D+M5mwlpmEO+qXRJUz6Qu4/1c/h42AD01VJNW3bJzKq44ZeCnouFXtVdujgxUS+lpd7njIIrGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xe77Uv/J; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xe77Uv/J"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2167141dfa1so5072675ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212332; x=1738817132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPaya4S3Kfqs3oMtYONdXDrgcp/vC/ArYdL0b17yO2E=;
        b=Xe77Uv/JDxjX+Vv0LtsY3DaLJSIphbZpW7bt017TqFlqutL3fmcEnMvBN/L487uqa8
         2UqSfJ6450JVHeKwvgA++2UTGtTTY5la0yjGexfZPO59Nw2wqlMQSQUdw+DSLigiMN5p
         ryTdQuHgNuyPbelfPuJDQ3rkZiEZtpD08Xq0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212332; x=1738817132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPaya4S3Kfqs3oMtYONdXDrgcp/vC/ArYdL0b17yO2E=;
        b=JGj1Thkk5WmKbBCcAhEdfSUS5ftKmoBBerxmA3XHNf5LooDjYCxhVIRhHYlxc9roWx
         tPTClelejICxT9yQq6hkg8/KHIIUM8silNiszV0VpMpBwCeQZ8M8nZfPme7RyHfWQs80
         1DiqrbQVUYHzc76fXMtmx4LnhTveogTK/Lf/EXExHTci7NQDDtc4YB7gSerUWH1nG1JC
         d1vlT3fUw/RFUI7jnJvu4taz45diK31kZSp6BKXGBog9qbcBeZL01HgvKyBAQe8LXpW5
         J14mwBuOy3FTkRlgYcE5pE8w1pSLtdF4kRkKHi/c8OHYb6ozPe1XTJYMbUiV19CSZhA/
         pshQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWqxTfFd0VcD5FcaHgXQfw7oRmq6vcGRGj2uwLAOXsJXk58DT9U6Tx4DV4L7bQbhg2T2avrr9T30dxOAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc9kADUqzWBPa47LeMBPTAxgFjUBMN0dzx9jAnjr9156XjLO/i
	lW5VZy9JrDKmIP5Aed8rabUxo/GIfy7LVh/DB1hCKpxfSXM2S1bzB1OWvvGuug==
X-Gm-Gg: ASbGncvb+AmnAxIIFtFm+DA6esCa9qs+0G14T1hAsri+rLrs9q9ncthQhBHp0pJhwam
	QlGhzia3p1qft+ndxV7F+/IhaoF0hg1VEdHzcYJk+G8wf1ukdS/7uTXZagK875gict7uWlwThz6
	kgoMvpiA4ONVpczttnfWZpKbwnt3zCfnie7+waXU5RbpCnIRsrWkOBVuMGq0pRmblho+k06hjLg
	R/q9GsQbvzacrs4wWQ/zHkhB5K0LUKiXi/kuXnaN8hKuy2C7B7L2LZ8iN/u28iWA3C9S3U5EAyd
	zd6h6jwMtL7uOe/DUQ==
X-Google-Smtp-Source: AGHT+IFnBawetG6OISjgDXcbQ2wf8X+tTg83rOrIMUBmE/TOfvysIil5FAzSXvjYS33jjv+nXChEoA==
X-Received: by 2002:a17:903:41c3:b0:216:1079:82bb with SMTP id d9443c01a7336-21de195cd1emr27201265ad.19.1738212331708;
        Wed, 29 Jan 2025 20:45:31 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de31ee557sm4533535ad.1.2025.01.29.20.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:31 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Minchan Kim <minchan@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 5/7] zsmalloc: introduce new object mapping API
Date: Thu, 30 Jan 2025 13:42:48 +0900
Message-ID: <20250130044455.2642465-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130044455.2642465-1-senozhatsky@chromium.org>
References: <20250130044455.2642465-1-senozhatsky@chromium.org>
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
 mm/zsmalloc.c            | 130 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

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
index d8cc8e2598cc..67c934ed4be9 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1367,6 +1367,136 @@ void zs_unmap_object(struct zs_pool *pool, unsigned long handle)
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
+
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
2.48.1.262.g85cc9f2d1e-goog

