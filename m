Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83418A6DB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314435; cv=none; b=l+2T7FyGkxt8/eqzqNyHETYdMoFEkGUA2FX/qmH26u2amJDZIZSNw/ZCJzG8rrx8uzjdESdX4mAlAXyM5NmIG7N5b71EqRNTOvp/pQazqt6fxZKxmu6yUvW5jeUGcOYvSnzfJeMCiaArm0XC/ouJOH20l3MPS1zj78fDCRwfEYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314435; c=relaxed/simple;
	bh=jPO8HZ1Zps/Lfyb11yjVIb6bxl5LlFnczMY6NjioKvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haQIAT2u9pBt0iVkfa585Or1nagZshcx6w85wmY0KHNHS1OhEs5FKXmXfcceBpT5/liDuOoOUErJG1d1WJO/WtWQpVvsfr4hbpQ7oDBsdtHuN0jbwnc35eTG0Cdn1Oesbdg/njpTsz8QIMsxDg78yBea/v/A4sYrxHcmH8GXKEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SQVCvlpY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SQVCvlpY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so39622025ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314432; x=1738919232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM/BjG4bEVLcBszqat2kHDfQpVGFwc0ijbl9RU545So=;
        b=SQVCvlpY+DScP2gmPxS18ZKxNIcZKHNZataXPb384v2MxxlJspNaIGlu82sWmYdwGi
         I8YhUo3idxR30EdOTdvjZSLGQtIxB6bO7JmhLRAt1I2v+eEKi37r7ftCkEwKf9FFOeoD
         MiRxX4gto6GEwm2YKTGupu/RO4gW+dwLWUzP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314432; x=1738919232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM/BjG4bEVLcBszqat2kHDfQpVGFwc0ijbl9RU545So=;
        b=UGRs/Yf53BEuDPDd2oPWTaTNej8APG1PMqA8nD1ne9iTj3a2/YbV3cnZJjfv2ptz8/
         U0mTye0O4orwaAj5U9ZsuUWqvxml5uINZqsps2ko9stoYZRSjil0SETzgaVSzQ76i/FW
         m8UJwUCHiCRhErE2uwwnOWJIfI0+9IxmuPJSUPfXq50SpJjkTdVeMGsEOIFZ2JQ3QLep
         KkQ1j5I9997fIw1v0RWdI+HO2y/wemyVP6nV6kfMc261qJkAcaz2TxkzmO4CVdUs6vK+
         zgz+LpAiERnDqG2H4HPtEMOsIfBS3251FS4bCuS+iXTBWk9lTKxdVodjm1duupXVFSC+
         xmKw==
X-Forwarded-Encrypted: i=1; AJvYcCUx5ul9JVyZNtczor8TXctRpPjZ+WUf1owpid12705HDQ/3SDQOcvFMXW4P/p92e5IOlNSzF6QXiaI/aJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu17NIw5IMT5mIfRhPX9fuMewc4577ClKZwEl0IEDt4hp1kRZc
	kRq3rkmSrD9yO75WUAdyLCJMgs+ZgldaAZ9jyBp2S40+1Hq+LGkMpn/br50ylg==
X-Gm-Gg: ASbGncveZSRBskQb4DkTt566cmZjsTPP+rnzsJBgnQsqZFZJdym5uEWqinaWpTKZ9wM
	xcLfPREUx6UJHUIVAtpzKwOT05pR0iavaE+otaOoV5JnwU3EzeAw3/m5eY5su6HliQA47hRf0Fq
	NcJ1efGs84wlqKLMju3fLdxqfKrOlKjOH+DxexPXykzkxosMKhaB/RmBQeOxFpoa/BqERHGdYp+
	PMVmVzKdaKzjidv/BiI/uOeTE4xS0RDpc2pDc+/HyEP2itE1QhA4PjUGb0PvJMWUK7CJctmW/BQ
	VI+mCvbTOnGM4SBkaA==
X-Google-Smtp-Source: AGHT+IHUYlW/s/BROjpWDLIYuBNea13AbLtp5vL/iIvdkHnTpWdyOu8kZuE13OYSyQwa0btUHKfWmA==
X-Received: by 2002:a05:6a21:9102:b0:1e1:faa:d8cf with SMTP id adf61e73a8af0-1ed7a6e1efcmr19676241637.40.1738314432483;
        Fri, 31 Jan 2025 01:07:12 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-acebddbb0besm2609414a12.16.2025.01.31.01.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:12 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Date: Fri, 31 Jan 2025 18:06:01 +0900
Message-ID: <20250131090658.3386285-3-senozhatsky@chromium.org>
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

Similarly to per-entry spin-lock per-CPU compression streams
also have a number of shortcoming.

First, per-CPU stream access has to be done from a non-preemptible
(atomic) section, which imposes the same atomicity requirements on
compression backends as entry spin-lock do and makes it impossible
to use algorithms that can schedule/wait/sleep during compression
and decompression.

Second, per-CPU streams noticeably increase memory usage (actually
more like wastage) of secondary compression streams.  The problem
is that secondary compression streams are allocated per-CPU, just
like the primary streams are.  Yet we never use more that one
secondary stream at a time, because recompression is a single
threaded action.  Which means that remaining num_online_cpu() - 1
streams are allocated for nothing, and this is per-priority list
(we can have several secondary compression algorithms).  Depending
on the algorithm this may lead to a significant memory wastage, in
addition each stream also carries a workmem buffer (2 physical
pages).

Instead of per-CPU streams, maintain a list of idle compression
streams and allocate new streams on-demand (something that we
used to do many years ago).  So that zram read() and write() become
non-atomic and ease requirements on the compression algorithm
implementation.  This also means that we now should have only one
secondary stream per-priority list.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 164 +++++++++++++++++++---------------
 drivers/block/zram/zcomp.h    |  17 ++--
 drivers/block/zram/zram_drv.c |  29 +++---
 include/linux/cpuhotplug.h    |   1 -
 4 files changed, 109 insertions(+), 102 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index bb514403e305..982c769d5831 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -6,7 +6,7 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
-#include <linux/cpu.h>
+#include <linux/cpumask.h>
 #include <linux/crypto.h>
 #include <linux/vmalloc.h>
 
@@ -43,31 +43,40 @@ static const struct zcomp_ops *backends[] = {
 	NULL
 };
 
-static void zcomp_strm_free(struct zcomp *comp, struct zcomp_strm *zstrm)
+static void zcomp_strm_free(struct zcomp *comp, struct zcomp_strm *strm)
 {
-	comp->ops->destroy_ctx(&zstrm->ctx);
-	vfree(zstrm->buffer);
-	zstrm->buffer = NULL;
+	comp->ops->destroy_ctx(&strm->ctx);
+	vfree(strm->buffer);
+	kfree(strm);
 }
 
-static int zcomp_strm_init(struct zcomp *comp, struct zcomp_strm *zstrm)
+static struct zcomp_strm *zcomp_strm_alloc(struct zcomp *comp)
 {
+	struct zcomp_strm *strm;
 	int ret;
 
-	ret = comp->ops->create_ctx(comp->params, &zstrm->ctx);
-	if (ret)
-		return ret;
+	strm = kzalloc(sizeof(*strm), GFP_KERNEL);
+	if (!strm)
+		return NULL;
+
+	INIT_LIST_HEAD(&strm->entry);
+
+	ret = comp->ops->create_ctx(comp->params, &strm->ctx);
+	if (ret) {
+		kfree(strm);
+		return NULL;
+	}
 
 	/*
-	 * allocate 2 pages. 1 for compressed data, plus 1 extra for the
-	 * case when compressed size is larger than the original one
+	 * allocate 2 pages. 1 for compressed data, plus 1 extra in case if
+	 * compressed data is larger than the original one.
 	 */
-	zstrm->buffer = vzalloc(2 * PAGE_SIZE);
-	if (!zstrm->buffer) {
-		zcomp_strm_free(comp, zstrm);
-		return -ENOMEM;
+	strm->buffer = vzalloc(2 * PAGE_SIZE);
+	if (!strm->buffer) {
+		zcomp_strm_free(comp, strm);
+		return NULL;
 	}
-	return 0;
+	return strm;
 }
 
 static const struct zcomp_ops *lookup_backend_ops(const char *comp)
@@ -109,13 +118,59 @@ ssize_t zcomp_available_show(const char *comp, char *buf)
 
 struct zcomp_strm *zcomp_stream_get(struct zcomp *comp)
 {
-	local_lock(&comp->stream->lock);
-	return this_cpu_ptr(comp->stream);
+	struct zcomp_strm *strm;
+
+	might_sleep();
+
+	while (1) {
+		spin_lock(&comp->strm_lock);
+		if (!list_empty(&comp->idle_strm)) {
+			strm = list_first_entry(&comp->idle_strm,
+						struct zcomp_strm,
+						entry);
+			list_del(&strm->entry);
+			spin_unlock(&comp->strm_lock);
+			return strm;
+		}
+
+		/* cannot allocate new stream, wait for an idle one */
+		if (comp->avail_strm >= num_online_cpus()) {
+			spin_unlock(&comp->strm_lock);
+			wait_event(comp->strm_wait,
+				   !list_empty(&comp->idle_strm));
+			continue;
+		}
+
+		/* allocate new stream */
+		comp->avail_strm++;
+		spin_unlock(&comp->strm_lock);
+
+		strm = zcomp_strm_alloc(comp);
+		if (strm)
+			break;
+
+		spin_lock(&comp->strm_lock);
+		comp->avail_strm--;
+		spin_unlock(&comp->strm_lock);
+		wait_event(comp->strm_wait, !list_empty(&comp->idle_strm));
+	}
+
+	return strm;
 }
 
-void zcomp_stream_put(struct zcomp *comp)
+void zcomp_stream_put(struct zcomp *comp, struct zcomp_strm *strm)
 {
-	local_unlock(&comp->stream->lock);
+	spin_lock(&comp->strm_lock);
+	if (comp->avail_strm <= num_online_cpus()) {
+		list_add(&strm->entry, &comp->idle_strm);
+		spin_unlock(&comp->strm_lock);
+		wake_up(&comp->strm_wait);
+		return;
+	}
+
+	comp->avail_strm--;
+	spin_unlock(&comp->strm_lock);
+	zcomp_strm_free(comp, strm);
 }
 
 int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
@@ -148,61 +203,19 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
 	return comp->ops->decompress(comp->params, &zstrm->ctx, &req);
 }
 
-int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node)
-{
-	struct zcomp *comp = hlist_entry(node, struct zcomp, node);
-	struct zcomp_strm *zstrm;
-	int ret;
-
-	zstrm = per_cpu_ptr(comp->stream, cpu);
-	local_lock_init(&zstrm->lock);
-
-	ret = zcomp_strm_init(comp, zstrm);
-	if (ret)
-		pr_err("Can't allocate a compression stream\n");
-	return ret;
-}
-
-int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
-{
-	struct zcomp *comp = hlist_entry(node, struct zcomp, node);
-	struct zcomp_strm *zstrm;
-
-	zstrm = per_cpu_ptr(comp->stream, cpu);
-	zcomp_strm_free(comp, zstrm);
-	return 0;
-}
-
-static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
-{
-	int ret;
-
-	comp->stream = alloc_percpu(struct zcomp_strm);
-	if (!comp->stream)
-		return -ENOMEM;
-
-	comp->params = params;
-	ret = comp->ops->setup_params(comp->params);
-	if (ret)
-		goto cleanup;
-
-	ret = cpuhp_state_add_instance(CPUHP_ZCOMP_PREPARE, &comp->node);
-	if (ret < 0)
-		goto cleanup;
-
-	return 0;
-
-cleanup:
-	comp->ops->release_params(comp->params);
-	free_percpu(comp->stream);
-	return ret;
-}
-
 void zcomp_destroy(struct zcomp *comp)
 {
-	cpuhp_state_remove_instance(CPUHP_ZCOMP_PREPARE, &comp->node);
+	struct zcomp_strm *strm;
+
+	while (!list_empty(&comp->idle_strm)) {
+		strm = list_first_entry(&comp->idle_strm,
+					struct zcomp_strm,
+					entry);
+		list_del(&strm->entry);
+		zcomp_strm_free(comp, strm);
+	}
+
 	comp->ops->release_params(comp->params);
-	free_percpu(comp->stream);
 	kfree(comp);
 }
 
@@ -229,7 +242,12 @@ struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params)
 		return ERR_PTR(-EINVAL);
 	}
 
-	error = zcomp_init(comp, params);
+	INIT_LIST_HEAD(&comp->idle_strm);
+	init_waitqueue_head(&comp->strm_wait);
+	spin_lock_init(&comp->strm_lock);
+
+	comp->params = params;
+	error = comp->ops->setup_params(comp->params);
 	if (error) {
 		kfree(comp);
 		return ERR_PTR(error);
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index ad5762813842..62330829db3f 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -3,10 +3,10 @@
 #ifndef _ZCOMP_H_
 #define _ZCOMP_H_
 
-#include <linux/local_lock.h>
-
 #define ZCOMP_PARAM_NO_LEVEL	INT_MIN
 
+#include <linux/wait.h>
+
 /*
  * Immutable driver (backend) parameters. The driver may attach private
  * data to it (e.g. driver representation of the dictionary, etc.).
@@ -31,7 +31,7 @@ struct zcomp_ctx {
 };
 
 struct zcomp_strm {
-	local_lock_t lock;
+	struct list_head entry;
 	/* compression buffer */
 	void *buffer;
 	struct zcomp_ctx ctx;
@@ -60,16 +60,15 @@ struct zcomp_ops {
 	const char *name;
 };
 
-/* dynamic per-device compression frontend */
 struct zcomp {
-	struct zcomp_strm __percpu *stream;
+	struct list_head idle_strm;
+	spinlock_t strm_lock;
+	u32 avail_strm;
+	wait_queue_head_t strm_wait;
 	const struct zcomp_ops *ops;
 	struct zcomp_params *params;
-	struct hlist_node node;
 };
 
-int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node);
-int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node);
 ssize_t zcomp_available_show(const char *comp, char *buf);
 bool zcomp_available_algorithm(const char *comp);
 
@@ -77,7 +76,7 @@ struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params);
 void zcomp_destroy(struct zcomp *comp);
 
 struct zcomp_strm *zcomp_stream_get(struct zcomp *comp);
-void zcomp_stream_put(struct zcomp *comp);
+void zcomp_stream_put(struct zcomp *comp, struct zcomp_strm *strm);
 
 int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
 		   const void *src, unsigned int *dst_len);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 1c2df2341704..8d5974ea8ff8 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -31,7 +31,6 @@
 #include <linux/idr.h>
 #include <linux/sysfs.h>
 #include <linux/debugfs.h>
-#include <linux/cpuhotplug.h>
 #include <linux/part_stat.h>
 #include <linux/kernel_read_file.h>
 
@@ -1601,7 +1600,7 @@ static int read_compressed_page(struct zram *zram, struct page *page, u32 index)
 	ret = zcomp_decompress(zram->comps[prio], zstrm, src, size, dst);
 	kunmap_local(dst);
 	zs_unmap_object(zram->mem_pool, handle);
-	zcomp_stream_put(zram->comps[prio]);
+	zcomp_stream_put(zram->comps[prio], zstrm);
 
 	return ret;
 }
@@ -1762,14 +1761,14 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	kunmap_local(mem);
 
 	if (unlikely(ret)) {
-		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
+		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
 		pr_err("Compression failed! err=%d\n", ret);
 		zs_free(zram->mem_pool, handle);
 		return ret;
 	}
 
 	if (comp_len >= huge_class_size) {
-		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
+		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
 		return write_incompressible_page(zram, page, index);
 	}
 
@@ -1793,7 +1792,7 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 				   __GFP_HIGHMEM |
 				   __GFP_MOVABLE);
 	if (IS_ERR_VALUE(handle)) {
-		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
+		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
 		atomic64_inc(&zram->stats.writestall);
 		handle = zs_malloc(zram->mem_pool, comp_len,
 				   GFP_NOIO | __GFP_HIGHMEM |
@@ -1805,7 +1804,7 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	}
 
 	if (!zram_can_store_page(zram)) {
-		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
+		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
 		zs_free(zram->mem_pool, handle);
 		return -ENOMEM;
 	}
@@ -1813,7 +1812,7 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	dst = zs_map_object(zram->mem_pool, handle, ZS_MM_WO);
 
 	memcpy(dst, zstrm->buffer, comp_len);
-	zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
+	zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
 	zs_unmap_object(zram->mem_pool, handle);
 
 	zram_slot_write_lock(zram, index);
@@ -1972,7 +1971,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		kunmap_local(src);
 
 		if (ret) {
-			zcomp_stream_put(zram->comps[prio]);
+			zcomp_stream_put(zram->comps[prio], zstrm);
 			return ret;
 		}
 
@@ -1982,7 +1981,7 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		/* Continue until we make progress */
 		if (class_index_new >= class_index_old ||
 		    (threshold && comp_len_new >= threshold)) {
-			zcomp_stream_put(zram->comps[prio]);
+			zcomp_stream_put(zram->comps[prio], zstrm);
 			continue;
 		}
 
@@ -2040,13 +2039,13 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 			       __GFP_HIGHMEM |
 			       __GFP_MOVABLE);
 	if (IS_ERR_VALUE(handle_new)) {
-		zcomp_stream_put(zram->comps[prio]);
+		zcomp_stream_put(zram->comps[prio], zstrm);
 		return PTR_ERR((void *)handle_new);
 	}
 
 	dst = zs_map_object(zram->mem_pool, handle_new, ZS_MM_WO);
 	memcpy(dst, zstrm->buffer, comp_len_new);
-	zcomp_stream_put(zram->comps[prio]);
+	zcomp_stream_put(zram->comps[prio], zstrm);
 
 	zs_unmap_object(zram->mem_pool, handle_new);
 
@@ -2794,7 +2793,6 @@ static void destroy_devices(void)
 	zram_debugfs_destroy();
 	idr_destroy(&zram_index_idr);
 	unregister_blkdev(zram_major, "zram");
-	cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 }
 
 static int __init zram_init(void)
@@ -2804,15 +2802,9 @@ static int __init zram_init(void)
 
 	BUILD_BUG_ON(__NR_ZRAM_PAGEFLAGS > sizeof(zram_te.flags) * 8);
 
-	ret = cpuhp_setup_state_multi(CPUHP_ZCOMP_PREPARE, "block/zram:prepare",
-				      zcomp_cpu_up_prepare, zcomp_cpu_dead);
-	if (ret < 0)
-		return ret;
-
 	ret = class_register(&zram_control_class);
 	if (ret) {
 		pr_err("Unable to register zram-control class\n");
-		cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 		return ret;
 	}
 
@@ -2821,7 +2813,6 @@ static int __init zram_init(void)
 	if (zram_major <= 0) {
 		pr_err("Unable to get major number\n");
 		class_unregister(&zram_control_class);
-		cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 		return -EBUSY;
 	}
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 6cc5e484547c..092ace7db8ee 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -119,7 +119,6 @@ enum cpuhp_state {
 	CPUHP_MM_ZS_PREPARE,
 	CPUHP_MM_ZSWP_POOL_PREPARE,
 	CPUHP_KVM_PPC_BOOK3S_PREPARE,
-	CPUHP_ZCOMP_PREPARE,
 	CPUHP_TIMERS_PREPARE,
 	CPUHP_TMIGR_PREPARE,
 	CPUHP_MIPS_SOC_PREPARE,
-- 
2.48.1.362.g079036d154-goog

