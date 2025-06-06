Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F2729A2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179754; cv=none; b=dDCbTwmB5rIxL8X3ijpfrZDChofp1ETe2jZzvP03CKXSsb8B/7MuUSDtel5KVeAmM+WCyuWgIzezaeaUfYoilucbGtTQ5Koa3vY7nXsHWMe1SFrYtAimFukoY3amFYbFR6wbgEAknFtOEju78AiABEL7IBIyhavVjszvN5HWIlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179754; c=relaxed/simple;
	bh=rFUH/WjWtJsebkZkqHw9z4PKcVgUSgJepocYqPbgZNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftKnVcMkVgjzjg3n6peYyaLK0VvmVS+/QA1M0f2Qt46vy4ENmbVtltz/mZzGh1g7R3B6nqnW9MsSiVL6fD+JeItNj3xFlIJ3V6YG3gKYpv8cGiQkFFhsZ3LIx/Pi5NBWb+afxygLD7Fpo0GVlqQScRFW/X6B71UgSNQVdgNTda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sn+yeTwm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sn+yeTwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749179751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2uXb0O4PrtAILd3wFl5a6hCIiKKPh//OjNLuoh+Rbk=;
	b=Sn+yeTwmzWgWqx5PvSdm3HOqx3rkwXvgdOQRSDVH8RpzmeIuOOv5VamP3ZoilAojcv/qV4
	LQbQ+CLq4i+k/CmWupWX+yKeSD0w6vgU8WISfpajiwwE0/Ta7IIfxivuXA6klBTnEXkiFA
	ISQYthUt3cqPrl+vmvWNj3VhyvvZy+8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-cbk4EkuZNwCLPYEJJZ4R_g-1; Thu,
 05 Jun 2025 23:15:49 -0400
X-MC-Unique: cbk4EkuZNwCLPYEJJZ4R_g-1
X-Mimecast-MFC-AGG-ID: cbk4EkuZNwCLPYEJJZ4R_g_1749179748
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FA3C1956088;
	Fri,  6 Jun 2025 03:15:48 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.88])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F3CF7195E74A;
	Fri,  6 Jun 2025 03:15:46 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 1/3] debugobjects: Add ODEBUG_FLAG_NO_ALLOC to disable memory allocation
Date: Thu,  5 Jun 2025 23:15:37 -0400
Message-ID: <20250606031539.1004644-2-longman@redhat.com>
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

Some of the objects associated with debug_obj may be handled
in a sensitive context that allowing debug_obj pre-allocation
in debug_objects_fill_pool() may casue deadlock. Add a new flags
parameter to the debug_obj_descr structure as well as adding the new
ODEBUG_FLAG_NO_ALLOC flag to enable us to disallow memory allocation
for those types of objects.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 include/linux/debugobjects.h |  6 ++++++
 lib/debugobjects.c           | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/linux/debugobjects.h b/include/linux/debugobjects.h
index 8b95545e7924..a058c7dba898 100644
--- a/include/linux/debugobjects.h
+++ b/include/linux/debugobjects.h
@@ -41,6 +41,7 @@ struct debug_obj {
  * struct debug_obj_descr - object type specific debug description structure
  *
  * @name:		name of the object typee
+ * @flags:		debug object flags
  * @debug_hint:		function returning address, which have associated
  *			kernel symbol, to allow identify the object
  * @is_static_object:	return true if the obj is static, otherwise return false
@@ -58,6 +59,7 @@ struct debug_obj {
  */
 struct debug_obj_descr {
 	const char		*name;
+	unsigned long		 flags;
 	void *(*debug_hint)(void *addr);
 	bool (*is_static_object)(void *addr);
 	bool (*fixup_init)(void *addr, enum debug_obj_state state);
@@ -67,6 +69,10 @@ struct debug_obj_descr {
 	bool (*fixup_assert_init)(void *addr, enum debug_obj_state state);
 };
 
+enum debug_obj_flags {
+	ODEBUG_FLAG_NO_ALLOC = 0x1,	/* Disallow debug object pre-allocation */
+};
+
 #ifdef CONFIG_DEBUG_OBJECTS
 extern void debug_object_init      (void *addr, const struct debug_obj_descr *descr);
 extern void
diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 7f50c4480a4e..52bc77b41f48 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -694,7 +694,7 @@ static struct debug_obj *lookup_object_or_alloc(void *addr, struct debug_bucket
 	return NULL;
 }
 
-static void debug_objects_fill_pool(void)
+static void debug_objects_fill_pool(bool no_alloc)
 {
 	if (!static_branch_likely(&obj_cache_enabled))
 		return;
@@ -705,7 +705,7 @@ static void debug_objects_fill_pool(void)
 	/* Try reusing objects from obj_to_free_list */
 	fill_pool_from_freelist();
 
-	if (likely(!pool_should_refill(&pool_global)))
+	if (likely(!pool_should_refill(&pool_global) || no_alloc))
 		return;
 
 	/*
@@ -734,7 +734,7 @@ __debug_object_init(void *addr, const struct debug_obj_descr *descr, int onstack
 	struct debug_bucket *db;
 	unsigned long flags;
 
-	debug_objects_fill_pool();
+	debug_objects_fill_pool(descr->flags & ODEBUG_FLAG_NO_ALLOC);
 
 	db = get_bucket((unsigned long) addr);
 
@@ -811,7 +811,7 @@ int debug_object_activate(void *addr, const struct debug_obj_descr *descr)
 	if (!debug_objects_enabled)
 		return 0;
 
-	debug_objects_fill_pool();
+	debug_objects_fill_pool(descr->flags & ODEBUG_FLAG_NO_ALLOC);
 
 	db = get_bucket((unsigned long) addr);
 
@@ -1000,7 +1000,7 @@ void debug_object_assert_init(void *addr, const struct debug_obj_descr *descr)
 	if (!debug_objects_enabled)
 		return;
 
-	debug_objects_fill_pool();
+	debug_objects_fill_pool(descr->flags & ODEBUG_FLAG_NO_ALLOC);
 
 	db = get_bucket((unsigned long) addr);
 
-- 
2.49.0

