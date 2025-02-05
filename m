Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD32288EC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718674; cv=none; b=cvZjF/LwTZ3Qt7oDgpTtDdt5krKcf28LEgrINOmUurstbmXbj6Fqs+UXbZSCpjXe+VqtX2BGiFMbPfFa3fIgI3vfB9mc02Vkxi022KcxKCRekf8f9hbChaYZ54UQh0A/hINnZ6J2rYr/ys3ZBBeQhj7bzSESsdI3Uok/MbfnJTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718674; c=relaxed/simple;
	bh=TVEENQAbPwLp6C/o1+q59FDJJdF/TlCGEjdhKfaJLYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bq5VI1Lq5N7suw2tuEICJpVCXplxBOrxSilGT8p8j2haHu7c5MjlIF5tpj8IiFn7A25jeCyz9N+uGn5EsIS6qAg9R85sVL0EBifvfKCHUow9ms8CivL8KDMkmrUd5xW5cXG3Ep0acImCTVbOMYdvq8Nm5umSnzXYHNGqXlJmvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eradGjax; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eradGjax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738718670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFm1KAh5+e0ZWlMGLR27yG0A4EUFGm+Oe3V+3icJKEw=;
	b=eradGjaxlnUAw7n8IhZrYGgrj9KMKdrxrGGKfMqFQa1aojLKd3qyV9cqR9xNXFKCaAZ26K
	SuoYZsyh+8brZvsWPG2gRLPWzOllJ1KRtFtU9AdRPk+kopkPNGMyPP9zFmBOeKLCIO7wrB
	MaoCtzjdjZDP6QWPCMAmpBtGjtseVSY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-a_F49qJaPrS2WDZd9Di-jQ-1; Tue,
 04 Feb 2025 20:24:26 -0500
X-MC-Unique: a_F49qJaPrS2WDZd9Di-jQ-1
X-Mimecast-MFC-AGG-ID: a_F49qJaPrS2WDZd9Di-jQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6DEB51956052;
	Wed,  5 Feb 2025 01:24:25 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.81.83])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE9AB19560A7;
	Wed,  5 Feb 2025 01:24:23 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 2/2] locking/lockdep: Disable KASAN instrumentation of lockdep.c
Date: Tue,  4 Feb 2025 20:24:11 -0500
Message-ID: <20250205012411.1010817-3-longman@redhat.com>
In-Reply-To: <20250205012411.1010817-1-longman@redhat.com>
References: <20250205012411.1010817-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Both KASAN and LOCKDEP are commonly enabled in building a debug kernel.
Each of them can significantly slow down the speed of a debug kernel.
Enabling KASAN instrumentation of the LOCKDEP code will further slow
thing down.

Since LOCKDEP is a high overhead debugging tool, it will never get
enabled in a production kernel. The LOCKDEP code is also pretty mature
and is unlikely to get major changes. There is also a possibility of
recursion similar to KCSAN. As the small advantage of enabling KASAN
instrumentation to catch potential memory access error is probably not
worth the drawback of further slowing down a debug kernel, disable KASAN
instrumentation to enable a debug kernel to gain some performance back.

With debug kernels with both LOCKDEP and KASAN enabled running on a
2-socket 128-thread x86-64 system and a 80-core arm64 system, the times
(real and sys with the time command) to do a parallel kernel build are
shown below.

  Kernel type			Real Time	Sys Time
  -----------			---------	--------
  x86-64:
  Non-debug kernel		 9m38.528s	 304m17.007s
  Debug kernel before patch	16m38.765s	1086m34.930s
  Debug kernel after patch	16m4.758s	1025m26.335s
  Before/after % change		  -3.4%		   -5.6%

  Non-debug RT kernel		11m32.804s	 121m52.835s
  Debug RT kernel before patch	59m29.618s	1772m30.699s
  Debug RT kernel after patch	37m47.089s	 937m56.856s
  Before/after % change		  -36.5%	  -47.1%

  arm64:
  Debug RT kernel before patch	46m9.385s	676m13.605s
  Debug RT kernel after patcha	33m41.428s	436m3.430s
  Before/after % change		  -27.0%	  -35.5%

It looks like the KASAN instrumentation overhead is less on arm64. While
the performance benefit for non-RT debug kernel is modest, the
performance gain for RT debug kernel is significant.

Looking at the RT kernel locking event data for the x86-64 system, we have

  Event type	    Non-debug   Debug before patch   Debug after patch
  ----------	    ---------   ------------------   -----------------
  rtlock_slowlock   66,593,828    2,868,760,165        2,832,990,386
  rtlock_slow_acq1  43,705,130    2,833,575,907        2,800,928,283
  rtlock_slow_acq2  22,888,698       35,177,418           32,055,592
  rtlock_slow_sleep 22,568,560       29,206,559           27,833,274

  rtmutex_slowlock     468,207          560,080              549,080
  rtmutex_slow_acq1     11,840           67,208               39,353
  rtmutex_slow_block   456,367          492,872              509,727
  rtmutex_slow_sleep   258,071          208,019              220,480

The profile of the debug kernel before and after patch are similar.
Compared with the non-debug kernel, the number of rtlock_slowlock() has
increased significantly by more than 40x. That means the corresponding
wait_lock has to be acquired that many more times with the associated
lockdep overhead. The average lock nesting depth will also be higher.
The non-RT debug kernel doesn't have this extra overhead.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index 0db4093d17b8..a114949eeed5 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -5,7 +5,8 @@ KCOV_INSTRUMENT		:= n
 
 obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
 
-# Avoid recursion lockdep -> sanitizer -> ... -> lockdep.
+# Avoid recursion lockdep -> sanitizer -> ... -> lockdep & improve performance.
+KASAN_SANITIZE_lockdep.o := n
 KCSAN_SANITIZE_lockdep.o := n
 
 ifdef CONFIG_FUNCTION_TRACER
-- 
2.48.1

