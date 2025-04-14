Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1634F1E571A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744671184; cv=none; b=VvPFqH3bhKSUmy2H2jjtyCDMPjJpvYMRQuNClv2ELFwyvVO50zCVTZ1P/S2dsq0twpUGiV/qUCiX2B7dPS4zTO9C0CZtBM48w4N67pyBH2/pt0LOa0bBkjbr1yumFH6AqsIfXVOIUC8bl6/fFQ102hGmGB4fbwKdnpWowK/KKHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744671184; c=relaxed/simple;
	bh=ZxcRVXhRdEjtMHXZUPaBq9B7u5rzOMBpKemS0lYYXzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XjlAy5+gdY0nMq+we6iOwyumonFu8hYAUk3Lr9JKDjEEp4zYwgaMUbEPd3ZXyS8iqF1pL42pNW1gMQs7P5VrR3yv/iS5TB/RyMIq7eQWf/V9Ep021KtEfRxKDhIE8El3PLF7pFWhlUb9j2iBKSKW8dvwN/L4ZS1GcqNKutdr568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MFNDM1jm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MFNDM1jm"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-224347aef79so64360015ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744671182; x=1745275982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJrdRumDqZ5uqDqo6HIvT1i7XS9qBKy2EYr2kcfYfkI=;
        b=MFNDM1jmSY3r4PUUGU2TnJR/9If8XyJXVL9LXpNBuZmztlBmuJFoNvdypFo0+vEjZh
         3XaEmZZkgX4UZ3EsqpwrP1J/5LprsR4SrmUiCfQexqvskfpx2Q/8bHjiXbdV8ygOGxLw
         PIfXlMoasV2iSQcCAL2OpFlYd4cimnL0htq9miAN9VV8SATWByE/xCBanEYgo3FpYPX+
         ZH7zFDdIuZG7MX7jlhlUaZwDJuCc1dR2aBygPbW/pHs6/Pn2P1dJ9YZUDzWkNkwNJXSy
         v+94ux0KPk5UWjl9Do2JDQDtuzZ2KvYdWvQ0kyaE1afJAYGodMrRp8Ss55BqSBj2OSqO
         +E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744671182; x=1745275982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJrdRumDqZ5uqDqo6HIvT1i7XS9qBKy2EYr2kcfYfkI=;
        b=s4SmgXnoFQvOdp3c61Wytyfrxe9nssjUNIpxF4WgxEgdDsxBYH6V+m2eEaQ61+S/tF
         Sa0Z2MypX7xtMCeH22xLzMb1ZmMBuPbCMOpa8GbVskE5cnkP2yeQN2d8/rM7id/Q0+of
         JJkY8b5ueg28B5rss2Iz5R7LYNPD4oytBpM9R4CJ9XSrHPi+zzRzrNKB3mW13mmAjKwv
         XDqPIuWo1NJgfOCzHYFVkN5cu9KOSR8+jATMBJ805LjTRxfB7j/iFxnZN2Kh+/N4CzHO
         fh0Wjsrr+RiLJPI1OhnrpsYkRQ02eDJcXgXgKob20+VGICpABoxzqRihfBxkTctPAuZV
         ipGw==
X-Gm-Message-State: AOJu0YzoBPjSMxQ/H7lTabot4AT84u8Ro7Uf9myRZksdB+PpcjpiHNXC
	ZL/GRWRKRTpyttwZbzEfuI/hs1edh6j/cRoe3SnRbmWoXvcAyGDXB/sbjWb93CBRuYoZ6Kq0q9s
	dtjaiq2/bz48HVg==
X-Google-Smtp-Source: AGHT+IHdhGyVRFQrYACqs6CpKKEAPawP/7gzm2A4TvPbteK5I88D550DNb1nfh3BQI2ey0zXeU9GGoMDGDE66H8=
X-Received: from pllw4.prod.google.com ([2002:a17:902:7b84:b0:220:d668:ff81])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b2f:b0:215:a179:14ca with SMTP id d9443c01a7336-22bea49529cmr197698465ad.2.1744671182407;
 Mon, 14 Apr 2025 15:53:02 -0700 (PDT)
Date: Mon, 14 Apr 2025 22:52:24 +0000
In-Reply-To: <20250414225227.3642618-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414225227.3642618-2-tjmercier@google.com>
Subject: [PATCH 1/4] dma-buf: Rename and expose debugfs symbols
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
	corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Expose the debugfs list and mutex so they are usable for the creation of
a BPF iterator for dmabufs. Rename the symbols so it's clear they
contain dmabufs and not some other type.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/dma-buf.c | 22 +++++++++++-----------
 include/linux/dma-buf.h   |  6 ++++++
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..affb47eb8629 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -36,14 +36,14 @@
 static inline int is_dma_buf_file(struct file *);
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
-static DEFINE_MUTEX(debugfs_list_mutex);
-static LIST_HEAD(debugfs_list);
+DEFINE_MUTEX(dmabuf_debugfs_list_mutex);
+LIST_HEAD(dmabuf_debugfs_list);
 
 static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
 {
-	mutex_lock(&debugfs_list_mutex);
-	list_add(&dmabuf->list_node, &debugfs_list);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_debugfs_list_mutex);
+	list_add(&dmabuf->list_node, &dmabuf_debugfs_list);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 }
 
 static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
@@ -51,9 +51,9 @@ static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
 	if (!dmabuf)
 		return;
 
-	mutex_lock(&debugfs_list_mutex);
+	mutex_lock(&dmabuf_debugfs_list_mutex);
 	list_del(&dmabuf->list_node);
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 }
 #else
 static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
@@ -1630,7 +1630,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	size_t size = 0;
 	int ret;
 
-	ret = mutex_lock_interruptible(&debugfs_list_mutex);
+	ret = mutex_lock_interruptible(&dmabuf_debugfs_list_mutex);
 
 	if (ret)
 		return ret;
@@ -1639,7 +1639,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
 
-	list_for_each_entry(buf_obj, &debugfs_list, list_node) {
+	list_for_each_entry(buf_obj, &dmabuf_debugfs_list, list_node) {
 
 		ret = dma_resv_lock_interruptible(buf_obj->resv, NULL);
 		if (ret)
@@ -1676,11 +1676,11 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 
 	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
 
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 	return 0;
 
 error_unlock:
-	mutex_unlock(&debugfs_list_mutex);
+	mutex_unlock(&dmabuf_debugfs_list_mutex);
 	return ret;
 }
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..7754608453dc 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/scatterlist.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/dma-mapping.h>
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
@@ -556,6 +557,11 @@ struct dma_buf_export_info {
 	struct dma_buf_export_info name = { .exp_name = KBUILD_MODNAME, \
 					 .owner = THIS_MODULE }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+extern struct list_head dmabuf_debugfs_list;
+extern struct mutex dmabuf_debugfs_list_mutex;
+#endif
+
 /**
  * get_dma_buf - convenience wrapper for get_file.
  * @dmabuf:	[in]	pointer to dma_buf
-- 
2.49.0.604.gff1f9ca942-goog

