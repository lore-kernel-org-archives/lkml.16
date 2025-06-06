Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2AB1E5B7B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179757; cv=none; b=Z/hvj1G0Sk+6QsX/16RhXhN+gWoOGzkUHSFb95aWV7SGbIJHUsID/d4nITAmfNbQye2vp/Us4rwxiwr+kWwc2kYpF//1ac3SFYocPkk1T4QI+oE/1XXWIMRllocmy2+E0o+xVSMXRBG2X93VGvpikVCntpfwy+C7igvRSuaVuSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179757; c=relaxed/simple;
	bh=Lmu043ttmoNqgiYahD+6aywyp8FaBNBKAT+/DxnS4+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBrJMpkohhT+B1RZnqrTu5fKKkZpySrYC6THywjhhTtobkqiK8GNbBaOjgsYLaf1rspSxuaAL0ythiEVWqcs5mBKGMGm2tL5avYOcv8RJ8r0SkR9wLHi9cf7NOx22fkqUytL3gOTDIP2zc6SSHjW7FD92YcoFO0xYU1s8VcSEvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eVoibdGG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eVoibdGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749179754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=InNfZwJnSoubR+c9L0hThUN+6+PZmB6lqdOn6p8BxJI=;
	b=eVoibdGGZysfxSUXz5oeIBV+laYuOZtI39eMBdDeu35tAweUb+exVRKjHD/MbuzerfBgcp
	i/QXIs1JiwQX2UO2SOvIs/zei7o4gMmhYcFuCrNh5y4CUAnNC4svBZg/UY1+y1F0l4b1Z9
	Ra9M+ih8BiDqoY+5Z8+cJOSFuT4hgqU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-670-m8Jdkil0NHaXN8Hm38u2rQ-1; Thu,
 05 Jun 2025 23:15:53 -0400
X-MC-Unique: m8Jdkil0NHaXN8Hm38u2rQ-1
X-Mimecast-MFC-AGG-ID: m8Jdkil0NHaXN8Hm38u2rQ_1749179752
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22ACD1956087;
	Fri,  6 Jun 2025 03:15:52 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.88])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7CECE195E74A;
	Fri,  6 Jun 2025 03:15:50 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 3/3] timers: Disable memory pre-allocation of timer debug objects
Date: Thu,  5 Jun 2025 23:15:39 -0400
Message-ID: <20250606031539.1004644-4-longman@redhat.com>
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

