Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35713D66
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342251; cv=none; b=LTbYu7gaUsX8Ijw8F07AlJvIZ3/oKNX7zmSeIBSBe/yEsapYjPOFp+FKSXXPIQpQ4yjDdilNr9YNIajeLC5lyuoQ7FawHGTvVwGYADc0lCIcf47ry5KYz3G+e3Q5Y7mwuvDVo6O1KdW6V7TrPx08eph/NunFWEJH/nkVApVzJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342251; c=relaxed/simple;
	bh=Y2B3nYXxQT5lYBuSQYYMv+4YZzmI5syScbq1opeNXtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rns/D71q/+b3deS+abq4nfwFYw8M3nlrEciog4D4deEct2LQlurbwP0vv0Z3auEfG8JRbLqFuGbJI834VnsV3bmnsoHDZjtalM5FjmbVvTv2Uu4p2whIsIYU3/0tvj9XXB9ySFydjUkOT1/DABst0jYJl6kGl8hvFRuCtbdF1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XfRojqE2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XfRojqE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738342248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P09bdCpD6xxHO+8F3NMZflHFCzEaRC++QP8olA1L6Dg=;
	b=XfRojqE2WimVS6W+ooh2LsIGSdJ8NEA9sq7tnplf7kKNMBjf2vWrgrWKlF+WP/0pVr4HUA
	Mt7V1Q/QNQ25vLfbqWqpWrYX7408eJ/evSWno9kJsNiqWLrszeDpIgWKiv6d0ceW1+AwdW
	64T6ftF0Uvy9Y7g6jpakKZiqEpUFPq8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-rtQN7VerPUWJJcf12oIC-g-1; Fri,
 31 Jan 2025 11:50:44 -0500
X-MC-Unique: rtQN7VerPUWJJcf12oIC-g-1
X-Mimecast-MFC-AGG-ID: rtQN7VerPUWJJcf12oIC-g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D11F118009A8;
	Fri, 31 Jan 2025 16:50:42 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.80.150])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D55719560AA;
	Fri, 31 Jan 2025 16:50:40 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] locking/lockdep: Disable KASAN instrumentation of lockdep.c
Date: Fri, 31 Jan 2025 11:50:20 -0500
Message-ID: <20250131165020.878944-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Both KASAN and LOCKDEP are commonly enabled in building a debug kernel.
Each of them can significantly slow down the speed of a debug kernel.
Enabling KASAN instrumentation of the LOCKDEP code will further slow
thing down.

Since LOCKDEP is a high overhead debugging tool, it will never get
enabled in a production kernel. The LOCKDEP code is also pretty mature
and is unlikely to get major changes. There is also a possibility of
recursion similar to KCSAN. As the small advantage of enabling KASAN
instrumentation to catch potential memory access error is probably
not worth the drawback of further slowing down a debug kernel, disable
KASAN instrumentation to enable a debug kernel to gain a little bit of
speed back.

With a debug kernel with both LOCKDEP and KASAN enabled running on a
2-socket 144-thread system, the time to do a "make -j144" kernel build
was 18m40.641s. After applying this patch, the parallel kernel build
time was reduced to 17m35.136s. This is a reduction of about 66s (5.8%).

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index 0db4093d17b8..8a588b0227b1 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -6,6 +6,7 @@ KCOV_INSTRUMENT		:= n
 obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
 
 # Avoid recursion lockdep -> sanitizer -> ... -> lockdep.
+KASAN_SANITIZE_lockdep.o := n
 KCSAN_SANITIZE_lockdep.o := n
 
 ifdef CONFIG_FUNCTION_TRACER
-- 
2.48.1

