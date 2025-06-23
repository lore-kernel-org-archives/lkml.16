Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6498163
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638656; cv=none; b=BObGFuh8nbUVyc57te1NqtsXfhjAwy9bGXSVNOut4XlSCIARREIt4QDO3ff7tTPdkoHy94Bu3ZSrqHl7cUbHK0FFTeIqRt1mmIjEbAen1SHZn14+wT85/TbTZlL2CcPN5SqNc1sJIBZZL3ZQo5CQa6onXQ6OTqFe366SuJia7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638656; c=relaxed/simple;
	bh=VJ5uVGW3ooWdvgXb8H2VawI1elr7LbExj+xCw4nXvds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psJRq5T0Tsyl+hY1Wg7RUVTctUjKEWuJ+vKnlrAYDQ9eWMxqQjmx4b40ID/CC5CX3G2SQLHs+uI4vI2FKabSrqZfiIwRcI1E+UKNmF4Ge/bV1Xo4Jvu8dLsZrcL0uaj31auzGaj86swI4oYKPPTLS9TFSqz3v/2i3FpVmhSX6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=n+BXlPrF; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="n+BXlPrF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=GJaZfg7ZMejN72SAwKwElZbqYTJF+EisEMMeQVeAzc8=; b=n+BXlPrFOiYAGS6p
	pSgEAdvHzxg70cadiD7swB30nAMrOBYgF2SGGKNb/2MohzghnfVZNh+gvIleHsGIWKTsJLKOaGB92
	NPp0e81pfAt2GFtLJqZw7n/nhqcBjaU0ZIBHbd0lRxztef18UL5Q/LpAd6u2T5UtAA0+uTFMXrVZA
	vIFm/O6UJ/LQ3EV6wj4wIiZeu1qzfCDCejSYxbuSTvO8lwc0sD8TxmaZk40LMqkwNUDPTR1K8jbHX
	yWTIaW/UdmEMxU/M61XNhm/w1sZXENIHfDmPOTlw7lPiFGB0nozooASBNM/Oiu8PZSIXEu8H6knKs
	syeLh40YRxSbO0JlQQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uTV5F-00B9h0-20;
	Mon, 23 Jun 2025 00:30:49 +0000
From: linux@treblig.org
To: tj@kernel.org,
	jiangshanlai@gmail.com
Cc: ebiggers@google.com,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] workqueue: Remove unused work_on_cpu_safe
Date: Mon, 23 Jun 2025 01:30:49 +0100
Message-ID: <20250623003049.349200-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of the work_on_cpu_safe() macro was removed recently by
commit 9cda46babdfe ("crypto: n2 - remove Niagara2 SPU driver")

Remove it, and the work_on_cpu_safe_key() function it calls.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/linux/workqueue.h | 13 -------------
 kernel/workqueue.c        | 25 -------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 6e30f275da77..3bf65b8e14cc 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -840,19 +840,6 @@ long work_on_cpu_key(int cpu, long (*fn)(void *),
 	work_on_cpu_key(_cpu, _fn, _arg, &__key);	\
 })
 
-long work_on_cpu_safe_key(int cpu, long (*fn)(void *),
-			  void *arg, struct lock_class_key *key);
-
-/*
- * A new key is defined for each caller to make sure the work
- * associated with the function doesn't share its locking class.
- */
-#define work_on_cpu_safe(_cpu, _fn, _arg)		\
-({							\
-	static struct lock_class_key __key;		\
-							\
-	work_on_cpu_safe_key(_cpu, _fn, _arg, &__key);	\
-})
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_FREEZER
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 97f37b5bae66..ade5c1152822 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6770,31 +6770,6 @@ long work_on_cpu_key(int cpu, long (*fn)(void *),
 	return wfc.ret;
 }
 EXPORT_SYMBOL_GPL(work_on_cpu_key);
-
-/**
- * work_on_cpu_safe_key - run a function in thread context on a particular cpu
- * @cpu: the cpu to run on
- * @fn:  the function to run
- * @arg: the function argument
- * @key: The lock class key for lock debugging purposes
- *
- * Disables CPU hotplug and calls work_on_cpu(). The caller must not hold
- * any locks which would prevent @fn from completing.
- *
- * Return: The value @fn returns.
- */
-long work_on_cpu_safe_key(int cpu, long (*fn)(void *),
-			  void *arg, struct lock_class_key *key)
-{
-	long ret = -ENODEV;
-
-	cpus_read_lock();
-	if (cpu_online(cpu))
-		ret = work_on_cpu_key(cpu, fn, arg, key);
-	cpus_read_unlock();
-	return ret;
-}
-EXPORT_SYMBOL_GPL(work_on_cpu_safe_key);
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_FREEZER
-- 
2.49.0

