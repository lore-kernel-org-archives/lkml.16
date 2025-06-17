Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370628BAB3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138552; cv=none; b=FWrNielctOA9EwnSdl2m3NjD10N120pZq8oPCqSgzQC6j6Zwt/6OT5YIl7h9RKeyK4iNoHS3uzIJ4YIPnCAu2rYmxXzw3JJzezTru2hsvMz9/hehbFEQu8IL5iEqRG2VlLA8qdHkRyjUX9O3EJu72qNCzNClDHCgnYqmRrJZz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138552; c=relaxed/simple;
	bh=RYDwSMcYtcDJLDd3k1aUOAaKqBPZL+MZsFu0OZLNewY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pk9Hlbe/ty/2JnHHOu8XdElRcjlmcO7Hs8Mj1Oa6gtYdKecvS4+GVJzo07d4IyMrApmNj7uyVel7nlRvIdT5TKwoUcL0T4p602U5RS4KiwdIYjZkmtJJgOtshtRjFn+5OEU1tvpOolJNO18okW+ToCKp8b2nUSqqWNwI7XeXJsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhWHKlLN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhWHKlLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750138549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84oDIKmwe1VkzCWqC9sBa6dyAxy+BAAaq1OM89NHNBU=;
	b=RhWHKlLNidsxQ9a7qI9yf6mEP7sz3nPHnWVpsMW4tZ92rDkyWXjMtjuKjOIz20ihEwkEMi
	Lt1tpQEAaYI5B9tmQbRy/FoZiyXImQvStHaL1rKkA5p7krEyH9UpNuOJOZ6fk5m50YHofV
	JHy1SS0O6e6Ki4gdol0nqjKuRAsGpMg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-q1XBEeXuNK68FKZecqip-A-1; Tue,
 17 Jun 2025 01:35:44 -0400
X-MC-Unique: q1XBEeXuNK68FKZecqip-A-1
X-Mimecast-MFC-AGG-ID: q1XBEeXuNK68FKZecqip-A_1750138543
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E28A18011CD;
	Tue, 17 Jun 2025 05:35:43 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.2.16.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EA3DA18003FC;
	Tue, 17 Jun 2025 05:35:41 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 2/2] debugobjects: Allow object pool refill mostly in non-atomic context
Date: Tue, 17 Jun 2025 01:35:27 -0400
Message-ID: <20250617053527.1223411-3-longman@redhat.com>
In-Reply-To: <20250617053527.1223411-1-longman@redhat.com>
References: <20250617053527.1223411-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

With PREEMPT_RT kernel, object pool refill can only happen in preemptible
context. For other !PREEMPT_RT kernels, pool refill can happen in any
context. This can sometimes lead to problem like the following circular
locking dependency shown below.

  -> #3 (&zone->lock){-.-.}-{2:2}:
  -> #2 (&base->lock){-.-.}-{2:2}:
  -> #1 (&console_sch_key){-.-.}-{2:2}:
  -> #0 (console_owner){..-.}-{0:0}:

The "console_owner" is from calling printk() from the following call
chain:

  rmqueue_bulk() => expand() => __warn_printk() => _printk()

This is due to the invocation of the VM_WARN_ONCE() macro in
__add_to_free_list().

The "base->lock" is from lock_timer_base() and "zone->lock" is due to
calling add_timer_on() leading to debug_object_activate() doing actual
memory allocation in pool refill acquiring the zone lock.

The "console_sch_key" comes from a s390 console driver in
driver/s390/cio.  The console_sch_key -> timer dependency happens
because the console driver is setting a timeout value while holding
its lock. Apparently it is pretty common for a console driver to use
timer for timeout or other timing purposes. So this may happen to other
console drivers as well.

There are three debug objects functions that will invoke
debug_objects_fill_pool() for pool refill - __debug_object_init(),
debug_object_activate() & debug_object_assert_init().  Thomas suggested
that we may enforce the pool refill only in the init function and
remove the debug_objects_fill_pool() call from the other two to avoid
the kind of circular locking problem shown above. It is because the init
function can be called in a cluster with many debug objects initialized
consecutively which can lead to exhaustion of the global object pool
if we disable the init function from doing pool refill. See [1] for
such an example. The call patterns of the other two are typically more
spread out.  Of the three, the activate function is called at least an
order of magnitude more than the other two.

Removing the pool refill call from the other two may make pool
exhaustion happen more easily leading to the disabling of the debug
object tracking. As a middle ground, we will allow pool refill from the
activate and assert_init functions if they are called from a non-atomic
context which is roughly half of the times depending on the workloads.

As in_atomic() may not know preemption has been disabled, when
a spinlock has been acquired for example, if CONFIG_PREEMPT_COUNT
hasn't been set. So make DEBUG_OBJECTS select PREEMPT_COUNT to make
sure that the preemption state is properly captured. The overhead of
adding PREEMPT_COUNT should be insignificant compared with the overhead
imposed by enabling the debug object tracking code itself.

[1] https://lore.kernel.org/lkml/202506121115.b69b8c2-lkp@intel.com/

Signed-off-by: Waiman Long <longman@redhat.com>
---
 lib/Kconfig.debug  |  1 +
 lib/debugobjects.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ebe33181b6e6..854a2f12a64b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -723,6 +723,7 @@ source "mm/Kconfig.debug"
 config DEBUG_OBJECTS
 	bool "Debug object operations"
 	depends on DEBUG_KERNEL
+	select PREEMPT_COUNT
 	help
 	  If you say Y here, additional code will be inserted into the
 	  kernel to track the life time of various objects and validate
diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 5598105ecf0d..d85f87f359d2 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -700,11 +700,18 @@ static struct debug_obj *lookup_object_or_alloc(void *addr, struct debug_bucket
 	return NULL;
 }
 
-static void debug_objects_fill_pool(void)
+static void debug_objects_fill_pool(bool init)
 {
 	if (!static_branch_likely(&obj_cache_enabled))
 		return;
 
+	/*
+	 * Attempt to fill the pool only if called from debug_objects_init()
+	 * or not in atomic context.
+	 */
+	if (!init && in_atomic())
+		return;
+
 	if (likely(!pool_should_refill(&pool_global)))
 		return;
 
@@ -740,7 +747,7 @@ __debug_object_init(void *addr, const struct debug_obj_descr *descr, int onstack
 	struct debug_bucket *db;
 	unsigned long flags;
 
-	debug_objects_fill_pool();
+	debug_objects_fill_pool(true);
 
 	db = get_bucket((unsigned long) addr);
 
@@ -817,7 +824,7 @@ int debug_object_activate(void *addr, const struct debug_obj_descr *descr)
 	if (!debug_objects_enabled)
 		return 0;
 
-	debug_objects_fill_pool();
+	debug_objects_fill_pool(false);
 
 	db = get_bucket((unsigned long) addr);
 
@@ -1006,7 +1013,7 @@ void debug_object_assert_init(void *addr, const struct debug_obj_descr *descr)
 	if (!debug_objects_enabled)
 		return;
 
-	debug_objects_fill_pool();
+	debug_objects_fill_pool(false);
 
 	db = get_bucket((unsigned long) addr);
 
-- 
2.49.0

