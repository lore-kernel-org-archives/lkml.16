Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73249227E94
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749074989; cv=none; b=p8Dl5LZJ5bYjv86+U0ln+bwNumhpT6N8qCciogWE2wfrUwJgCOBCvg1fYpkbCkleX5tvRbJMjXMOyUG+3TsyUQe4uhLrSslg/Dyk3qljIlCERIMJa4tdAL2sB4KFw9kHWl64/ugtPgbeCbjlKK7ICE1o0J7DOTsRMMxuSSrd9Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749074989; c=relaxed/simple;
	bh=Lmu043ttmoNqgiYahD+6aywyp8FaBNBKAT+/DxnS4+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVCVJpQgXLsB+d6YjTym/Wy6KTWmDEp8K8j5JJFBXB4IZxG3lh9J66OJpNQTb90no/LZ+WdIi49zqDiSNwSsNi6+BttirC/0U4QCy3OuwMeJPbrakmVH/ZUp3w2P0iz2JOEbZhC1ozPCEnlV6t29exFX+pNgzhYMU8Z5uv5HjnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SK1RWynk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SK1RWynk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749074986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=InNfZwJnSoubR+c9L0hThUN+6+PZmB6lqdOn6p8BxJI=;
	b=SK1RWynk522Lv7FQJ3EnKvcVql6tYtnlnKb1RwQv2WUtj62ON7ErMdYVPJKJWoD7u1DtEo
	tDvjYtiTqp2xjx6pZHxKAWuptGKGTceW6uUV008SEZ94TzDYr4Fca0p2FN7fjAhbLPXi8Y
	IvGgkj5rwqFFmpM7sGHhmODptOQsw5g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-R3xdR5y9PCSQqYDwzXRpTw-1; Wed,
 04 Jun 2025 18:09:43 -0400
X-MC-Unique: R3xdR5y9PCSQqYDwzXRpTw-1
X-Mimecast-MFC-AGG-ID: R3xdR5y9PCSQqYDwzXRpTw_1749074982
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0888D180035E;
	Wed,  4 Jun 2025 22:09:42 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.89.125])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8BBE41955DDA;
	Wed,  4 Jun 2025 22:09:40 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 3/3] timers: Disable memory pre-allocation of timer debug objects
Date: Wed,  4 Jun 2025 18:09:26 -0400
Message-ID: <20250604220926.870760-4-longman@redhat.com>
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

A circular locking dependency lockdep splat was hit recently with a
debug kernel. The dependency chain (in reverse order) is:

  -> #3 (&zone->lock){-.-.}-{2:2}:
  -> #2 (&base->lock){-.-.}-{2:2}:
  -> #1 (&console_sch_key){-.-.}-{2:2}:
  -> #0 (console_owner){..-.}-{0:0}:

The last one is from calling printk() within the rmqueue_bulk() call in
mm/page_alloc.c. The "base->lock" is from lock_timer_base() and first
one is due to calling add_timer_on() leading to debug_object_activate()
doing actual memory allocation acquiring the zone lock.

The console_sch_key comes from a s390 console driver in driver/s390/cio.
The console_sch_key -> timer dependency happens because the console
driver is setting a timeout value while holding its lock. Apparently it
is pretty common for a console driver to use timer for timeout or other
timing purposes. So this may happen to other console drivers as well.

One way to break this circular locking dependency is to disallow any
memory allocation when a timer debug object is being handled. Do this by
setting the ODEBUG_FLAG_NO_ALLOC flag in the timer_debug_descr structure.

The figures below show the number of times the debug_objects_fill_pool()
function has reached the statement right before and after the no_alloc
check in initial bootup and after running a parallel kernel build on
a 2-socket 96-threads x86-64 system.

			 Before      After     non-timer %
		 	 ------      -----     -----------
  Initial bootup	  150,730     148,198     98.3%
  Parallel kernel build 5,974,464   5,893,116     98.6%

So from object pre-allocation perspective, timer debug objects represent
just a small slice of the total number of debug objects to be processed.

The allocation of debug_object to the global pool happens when its object
count falls below the (256 + 16 * num_possible_cpus) threshold. Even
then, there may still be free objects available in the percpu pool. So
the chance that debug_objects gets disabled because it is running out
of free debug_object should be minimal.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/time/timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 553fa469d7cc..e0be64591e43 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -775,6 +775,7 @@ static bool timer_fixup_assert_init(void *addr, enum debug_obj_state state)
 
 static const struct debug_obj_descr timer_debug_descr = {
 	.name			= "timer_list",
+	.flags			= ODEBUG_FLAG_NO_ALLOC,
 	.debug_hint		= timer_debug_hint,
 	.is_static_object	= timer_is_static_object,
 	.fixup_init		= timer_fixup_init,
-- 
2.49.0

