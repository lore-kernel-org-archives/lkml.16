Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D43528399
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138547; cv=none; b=GT0uUtb/Ibnmrov7NRKaUu+42eyuF2MZitDraF44oKe0dFnq8tPz0b9cA+VvhqusobjfnyY+1MAdVPufjyucjjaiR+POW3F/Q49cTek1Y31yOP7gP4nBCr/DsY1jo+5/70vBguOzkuL/l2CE9zk/XvMYEMUbJ4KjVY6gbhJn7Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138547; c=relaxed/simple;
	bh=wnMjmx+2kJxiNhZyxT4vfE4k4etGnLqzRXRX1FCIg/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLB48F4nOPpDOAwJN6UjHFoyUIpePBWC+Q86WUVITK2tatVqI4pWG52SrmQXntyFcXZMopw+Ref3r/OGmVWe46jWqVcVv+6AFKGjADwkXLpS/v3NX5CkHphnApRRbk8Cg3Z9+6Z7oD0TBhoFaig0+8iSDfTkD34rCCyymFsJz80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AY0iiSJV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AY0iiSJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750138544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zbiDQWICsxUV2tNfFvkn2ymAhVCxQtTndoJ1YWdYk4=;
	b=AY0iiSJVmSNC+7444JJvzN1h7DMZeUBar2couYhFJ0CJYD1zIlcm16eZyg1r/HWlsNdXXK
	9crfb0sOhSUJPjwKD0bWdxnYKruj0jyEDyZjZM/EDon5CwAoY/S4C8JWYlMjXp0DdtNKpp
	2DR+oLHGBvWol+cauZERJJdAfAeQS84=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-580-cVh26eimNTSmFFP2jHkTtg-1; Tue,
 17 Jun 2025 01:35:42 -0400
X-MC-Unique: cVh26eimNTSmFFP2jHkTtg-1
X-Mimecast-MFC-AGG-ID: cVh26eimNTSmFFP2jHkTtg_1750138541
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93ABA1800284;
	Tue, 17 Jun 2025 05:35:41 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.2.16.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D77518003FC;
	Tue, 17 Jun 2025 05:35:40 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 1/2] debugobjects: Show the state of debug_objects_enabled
Date: Tue, 17 Jun 2025 01:35:26 -0400
Message-ID: <20250617053527.1223411-2-longman@redhat.com>
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

With a PREEMPT_RT kernel, there is a fair chance that debug_objects
could get disabled because we are running out of free debug objects as
debug object allocation is disabled in non-preemptible context. With
!PREEMPT_RT kernels, the chance of this should be minimal. When we
consider imposing restrictions on where debug object allocation can be
done, the chance of running out of them increases.

Currently, it is not easy to figure if debug objects tracking is
disabled.  Fix that by showing the state of "debug_objects_enabled"
in the stats debugfs file as well as always printing a message in the
console log.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 lib/debugobjects.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 7f50c4480a4e..5598105ecf0d 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -125,6 +125,12 @@ static int __init disable_object_debug(char *str)
 }
 early_param("no_debug_objects", disable_object_debug);
 
+static void debug_objects_disable(const char *msg)
+{
+	debug_objects_enabled = false;
+	printk_deferred(KERN_WARNING "debug_objects disabled: %s\n", msg);
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

