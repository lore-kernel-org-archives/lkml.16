Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3031E5B82
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179757; cv=none; b=lbVuh9hIaTZuSvBgjV+zrhl8scJnVNyGbPdyQTNSuvMNxDTEBP/WJLF3VM1Qx5z7KhcV4xMF9Bg/tQAGtc11VtEREZ8+zYozl7iFP0Fs+Yr4e/fkjbHTYcAL/Yvum5U9Qfbj0/xf2lftbZRTe04LCpK8fgQKst1sCudzpNQxIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179757; c=relaxed/simple;
	bh=aUrkhYNlXTJCWXCgbtnmm4zqDqOMSYCdnXZD4yzRPj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujo8VcU2xfotxEPHEsa9Xhh+1igGOOujFzTGgjbi9Re8Sog5Ha0ucauMw3IEJBYVXPUTVMBPwCPkuziiba55ZCT5lmW+5cVe64jUwtmP+R/iZVm4ANRBiExEZGhSDjAcmTuCf/AKwlYsEaDCAm8MHsT+S5stJHVS0wTHhYhIC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=csZSkkRy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csZSkkRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749179754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJAGNO2ZGACYOax/SSfhQsIr4XXMxufpmtTjm3rXVzE=;
	b=csZSkkRyn109LvnXwZ5j858c4m+uO2ObsMrjPkNcwkW6TpA5yxTLH4+JQyC1nlP84pEHD0
	Iot4unDJP06fC8ELy8D3fAs5aE3Cs3lu3E3GmdDjxG9ZWbluX5VCe5zt72gDXEz/RfRamy
	CavfbAuyOyRZ9qV7n9zkdHUD73mJWrQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-m5Ax-cfrNvGUgB8n-0tV9w-1; Thu,
 05 Jun 2025 23:15:51 -0400
X-MC-Unique: m5Ax-cfrNvGUgB8n-0tV9w-1
X-Mimecast-MFC-AGG-ID: m5Ax-cfrNvGUgB8n-0tV9w_1749179750
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F7E91800345;
	Fri,  6 Jun 2025 03:15:50 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.88])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD0D8195E74A;
	Fri,  6 Jun 2025 03:15:48 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 2/3] debugobjects: Show the state of debug_objects_enabled
Date: Thu,  5 Jun 2025 23:15:38 -0400
Message-ID: <20250606031539.1004644-3-longman@redhat.com>
In-Reply-To: <20250606031539.1004644-1-longman@redhat.com>
References: <20250606031539.1004644-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

In the rare case that debug_objects got disabled because we are running
out of free debug objects, it is not easy to figure this out. Fix that
by showing the state of "debug_objects_enabled" in the stats debugfs
file as well as always printing a message in the console log.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 lib/debugobjects.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 52bc77b41f48..df72bc49cc5d 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -125,6 +125,12 @@ static int __init disable_object_debug(char *str)
 }
 early_param("no_debug_objects", disable_object_debug);
 
+static void debug_objects_disable(const char *msg)
+{
+	debug_objects_enabled = false;
+	pr_warn("debug_objects disabled: %s\n", msg);
+}
+
 static const char *obj_states[ODEBUG_STATE_MAX] = {
 	[ODEBUG_STATE_NONE]		= "none",
 	[ODEBUG_STATE_INIT]		= "initialized",
@@ -690,7 +696,7 @@ static struct debug_obj *lookup_object_or_alloc(void *addr, struct debug_bucket
 	}
 
 	/* Out of memory. Do the cleanup outside of the locked region */
-	debug_objects_enabled = false;
+	debug_objects_disable("out of memory");
 	return NULL;
 }
 
@@ -1161,6 +1167,8 @@ static int debug_stats_show(struct seq_file *m, void *v)
 	seq_printf(m, "on_free_list  : %u\n", pool_count(&pool_to_free));
 	seq_printf(m, "objs_allocated: %d\n", debug_objects_allocated);
 	seq_printf(m, "objs_freed    : %d\n", debug_objects_freed);
+	seq_printf(m, "debug_objects : %s\n", debug_objects_enabled ? "enabled"
+								    : "disabled");
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(debug_stats);
@@ -1314,7 +1322,7 @@ check_results(void *addr, enum debug_obj_state state, int fixups, int warnings)
 out:
 	raw_spin_unlock_irqrestore(&db->lock, flags);
 	if (res)
-		debug_objects_enabled = false;
+		debug_objects_disable("selftest");
 	return res;
 }
 
@@ -1486,11 +1494,8 @@ void __init debug_objects_mem_init(void)
 	cache = kmem_cache_create("debug_objects_cache", sizeof (struct debug_obj), 0,
 				  SLAB_DEBUG_OBJECTS | SLAB_NOLEAKTRACE, NULL);
 
-	if (!cache || !debug_objects_replace_static_objects(cache)) {
-		debug_objects_enabled = false;
-		pr_warn("Out of memory.\n");
-		return;
-	}
+	if (!cache || !debug_objects_replace_static_objects(cache))
+		debug_objects_disable("out of memory");
 
 	/*
 	 * Adjust the thresholds for allocating and freeing objects
-- 
2.49.0

