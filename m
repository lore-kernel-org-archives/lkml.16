Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A129A2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749074988; cv=none; b=Gn1xeH/Hj2WdKXZZfvA64YZGp3WjqwslGr3Hfils2RT0oK5K9xWqd/pEOxhkJxJ3cOL3S2caDFO7Oh6rrX8zvPpMGhRU74pEswk3/lnCoywVlfAw/nUyF3uqjUZzF+Q4dEPr5yB4R0OsYa5XrUggeiFmYgLznqrV8hKRQ5l8Wbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749074988; c=relaxed/simple;
	bh=/h+MbqhtifQ0wFwTNi/hRYtZRQX2zAyPjv6SYgin89Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuA6+4tZJzOQara6bladwB/ll+JKVXBpzelSgNEhjxWSA954jLAzUI+UwNDEe3msryqmFw4b7bitLWF6SMUcNKNR+8XAsSn3bUfJ20/CtafxXEukxa9I5ugIAqpDKZkTyLFMWTZXLO/f6YdSsH5gGLVLH8+/CTDqJTh4becgRlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gf+qd0bG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gf+qd0bG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749074985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o79wJP37NudpKzgPNtfpt/vYPQcJiVZbzxmLNZKyYko=;
	b=gf+qd0bGtl9VP2f4kcJUZ2JWAlI733TzL/PlhlmEFolyXBqtURCVN5Gjv32mUoAsq2wtWn
	xJbtV6aRq7a/J6j5zso6ZmocvgiqQeSjEli9bI8E91hU3ShxQuD8z/479fDgkCmVzdMuR2
	oW5MyzndCvaV4UVA2ucnSwDQc7L06vM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-M9c2Qn_lMa2B7GA5G1IpQg-1; Wed,
 04 Jun 2025 18:09:42 -0400
X-MC-Unique: M9c2Qn_lMa2B7GA5G1IpQg-1
X-Mimecast-MFC-AGG-ID: M9c2Qn_lMa2B7GA5G1IpQg_1749074980
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4861B1800772;
	Wed,  4 Jun 2025 22:09:40 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.89.125])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D7D6C1955DDA;
	Wed,  4 Jun 2025 22:09:38 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 2/3] debugobjects: Show the state of debug_objects_enabled
Date: Wed,  4 Jun 2025 18:09:25 -0400
Message-ID: <20250604220926.870760-3-longman@redhat.com>
In-Reply-To: <20250604220926.870760-1-longman@redhat.com>
References: <20250604220926.870760-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

In the rare case that debug_objects got disabled because we are running
out of free debug objects, it is not easy to figure this out. Fix that
by showing the state of "debug_objects_enabled" in the stats debugfs
file as well as always printing a message in the console log.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 lib/debugobjects.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 52bc77b41f48..0e9f44db9043 100644
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
+		debug_object_disable("selftest");
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

