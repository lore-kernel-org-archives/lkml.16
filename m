Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EEC20C48C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096777; cv=none; b=d63Q6fUtr6X7ZilguKrAw0LLwDTkMDmsy5/9XMStdcQGyBESMP3IxKMQU9cNNOxKx2kplzXLeQSoxSM1dTU0FALXI58BtjVR6kjynwqL9nl31K842UAxQEfxO1ri7kDyZlStEbV6tw5+VgjzfE7LNO7CvFWoYBmy+ilQ7jv/4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096777; c=relaxed/simple;
	bh=Pe7tloujdgS0CttjwiaXYWx/ZrteHbjLgowJ3QQnBGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnPzF+irt+dM7DkGAhF9w0mD2xD/O6+XulkCG/qdaKj6XHX0sv4fVHOlKwOgv+iByDg6C8qwMGkfTmNZX7i9nclL0QYU7fijYJXMqmM4LvUniB80cpa8aXPjb3fVBQsI8+bIiQqs9N668Yj1P1wExC+IJgydAds0+/iubk22e/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rIGN1qrg; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rIGN1qrg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750096770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QkHn+5WbjgINM28wESQjoIInIPpsvTAg7cABQYfdzXU=;
	b=rIGN1qrgp38aRyBfFlxUwVLAxaiT5kp+4Ki4iRNWrjJw9JZwu2DV4PGRmyStlk7J4LCZ5h
	LkVfdpJhLncm6KGmec0a6KrC+TpWeccu7JqpC2UnHWlrbQEFPtobYbFE4YIbWxaWWW5PYL
	xtoOFJYnoeC+VW4oPiw9HKA6sti2T6M=
From: Kent Overstreet <kent.overstreet@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [PATCH] workqueue: Basic memory allocation profiling support
Date: Mon, 16 Jun 2025 13:59:20 -0400
Message-ID: <20250616175920.34858-1-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hook alloc_workqueue and alloc_workqueue_attrs() so that they're
accounted to the callsite. Since we're doing allocations on behalf of
another subsystem, this helps when using memory allocation profiling to
check for leaks.

Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/workqueue.h | 12 ++++++++----
 kernel/workqueue.c        | 14 +++++++-------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 6e30f275da77..e907c9bb840c 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -6,6 +6,7 @@
 #ifndef _LINUX_WORKQUEUE_H
 #define _LINUX_WORKQUEUE_H
 
+#include <linux/alloc_tag.h>
 #include <linux/timer.h>
 #include <linux/linkage.h>
 #include <linux/bitops.h>
@@ -505,7 +506,8 @@ void workqueue_softirq_dead(unsigned int cpu);
  * Pointer to the allocated workqueue on success, %NULL on failure.
  */
 __printf(1, 4) struct workqueue_struct *
-alloc_workqueue(const char *fmt, unsigned int flags, int max_active, ...);
+alloc_workqueue_noprof(const char *fmt, unsigned int flags, int max_active, ...);
+#define alloc_workqueue(...)	alloc_hooks(alloc_workqueue_noprof(__VA_ARGS__))
 
 #ifdef CONFIG_LOCKDEP
 /**
@@ -544,8 +546,8 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  * Pointer to the allocated workqueue on success, %NULL on failure.
  */
 #define alloc_ordered_workqueue_lockdep_map(fmt, flags, lockdep_map, args...)	\
-	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags),	\
-				    1, lockdep_map, ##args)
+	alloc_hooks(alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags),\
+						1, lockdep_map, ##args))
 #endif
 
 /**
@@ -577,7 +579,9 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
 
 extern void destroy_workqueue(struct workqueue_struct *wq);
 
-struct workqueue_attrs *alloc_workqueue_attrs(void);
+struct workqueue_attrs *alloc_workqueue_attrs_noprof(void);
+#define alloc_workqueue_attrs(...)	alloc_hooks(alloc_workqueue_attrs_noprof(__VA_ARGS__))
+
 void free_workqueue_attrs(struct workqueue_attrs *attrs);
 int apply_workqueue_attrs(struct workqueue_struct *wq,
 			  const struct workqueue_attrs *attrs);
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 97f37b5bae66..bd195d4db685 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4629,7 +4629,7 @@ void free_workqueue_attrs(struct workqueue_attrs *attrs)
  *
  * Return: The allocated new workqueue_attr on success. %NULL on failure.
  */
-struct workqueue_attrs *alloc_workqueue_attrs(void)
+struct workqueue_attrs *alloc_workqueue_attrs_noprof(void)
 {
 	struct workqueue_attrs *attrs;
 
@@ -5682,12 +5682,12 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	else
 		wq_size = sizeof(*wq);
 
-	wq = kzalloc(wq_size, GFP_KERNEL);
+	wq = kzalloc_noprof(wq_size, GFP_KERNEL);
 	if (!wq)
 		return NULL;
 
 	if (flags & WQ_UNBOUND) {
-		wq->unbound_attrs = alloc_workqueue_attrs();
+		wq->unbound_attrs = alloc_workqueue_attrs_noprof();
 		if (!wq->unbound_attrs)
 			goto err_free_wq;
 	}
@@ -5777,9 +5777,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 }
 
 __printf(1, 4)
-struct workqueue_struct *alloc_workqueue(const char *fmt,
-					 unsigned int flags,
-					 int max_active, ...)
+struct workqueue_struct *alloc_workqueue_noprof(const char *fmt,
+						unsigned int flags,
+						int max_active, ...)
 {
 	struct workqueue_struct *wq;
 	va_list args;
@@ -5794,7 +5794,7 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
 
 	return wq;
 }
-EXPORT_SYMBOL_GPL(alloc_workqueue);
+EXPORT_SYMBOL_GPL(alloc_workqueue_noprof);
 
 #ifdef CONFIG_LOCKDEP
 __printf(1, 5)
-- 
2.49.0

