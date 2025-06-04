Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6EF29A2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749074982; cv=none; b=a7WeeXZ+E9ofGEcRIIw7sPxF2i1M5u2O8BHNZhXClwCLve8LUh58OL65mePhGTM2Fn+xwwD1wR66Td6mvV5WdxEqF8GzGJkfGJHKYP9SkyyH4DTk+zWNOWeIAiR+ePd5Artk+dT+AMgj1MDPnVnFEBEICIfeXbJP6jbQpfYhHms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749074982; c=relaxed/simple;
	bh=TjGCTN2WElX2W0wWftYpeQAE777rXI2b0T6a8Mxb63Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bkf3FMtvZ4M5NWV519NMfPCgkIGKbpUvMfQEuPlvFdl4EwKqFXEvzfy2fZ3JvdSofzREGSROplxQs1EFIX6cUXrEbSUrphRTHYOkUVqNrJk2HAOp+6CQ0xA9DCVy0CV8Sp928i0/glFIEC7vJNW3iQS6p9yypk5rxAYa0x8A7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ep1PFRGY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ep1PFRGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749074979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T2yexuRi18rJgKIKVwh54stcOMquX5XP7HKHgjkZl5A=;
	b=Ep1PFRGYOncb8JEf1uhswJ4m05xdKOcGa28Jz69mQIBrv/53pqto0fmsaDZAUiT0teRsvP
	vjgqGV2UBSsEcENRNGOpkk0+bK0+s0m1Lst03V5jQV+QvwEf5BaSOOwZ16fW4SHchLVcyT
	KxHGKr3Cl4mQbL9iVTExUhaK3oMLasU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-plrHPBgsNiqKFLYn_qQTJw-1; Wed,
 04 Jun 2025 18:09:38 -0400
X-MC-Unique: plrHPBgsNiqKFLYn_qQTJw-1
X-Mimecast-MFC-AGG-ID: plrHPBgsNiqKFLYn_qQTJw_1749074977
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C11CB19560AF;
	Wed,  4 Jun 2025 22:09:36 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.89.125])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1AA0B1955D8E;
	Wed,  4 Jun 2025 22:09:34 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 0/3] timers: Disable memory pre-allocation of timer debug objects
Date: Wed,  4 Jun 2025 18:09:23 -0400
Message-ID: <20250604220926.870760-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

A circular locking dependency was reported by lockdep involving printk()
called from within the memory allocator, console driver with timeout
capability and timer code calling debug_object_activate() doing object
pool refill by allocating memory.

One simple way to break this circular locking dependency is to disable
memory allocation when timer debug objects are being handled which is
what this series is about. The majority of the changes is in the
debugobjects code with a one-line change in the timer code.

I have also considered updating the console driver to not hold the lock
when setting up timeout, but many console drivers are using timeout in
some ways. So this problem may not specific to just a single one.

Waiman Long (3):
  debugobjects: Add ODEBUG_FLAG_NO_ALLOC to disable memory allocation
  debugobjects: Show the state of debug_objects_enabled
  timers: Disable memory pre-allocation of timer debug objects

 include/linux/debugobjects.h |  6 ++++++
 kernel/time/timer.c          |  1 +
 lib/debugobjects.c           | 29 +++++++++++++++++------------
 3 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.49.0

