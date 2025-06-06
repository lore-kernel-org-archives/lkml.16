Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FC27702
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179754; cv=none; b=X9vH+l/hnifpp+xCvNGP1SYTFtcFJ/J8apOJcAyG71tFImz6v+QtXVDYC/hBs6gtGsIgimKXxXb1sOXBB+nS1dgCw05tC4XFOav7qTnWeSpIivYwWN2P0oRUnhKssO8fVbGWAHyi24Bi+08ANVl1AJOC1FVk1r7cwSekBCQkrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179754; c=relaxed/simple;
	bh=eVdzaj18QYFCxY5EsGbmVe25V4XBq21a0HFEteoI+P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cQiJoaHWKDdiUmpp3ntbmRqX4pfmND9tiHoTAMJggdd2V7YMjbcvfBR1+sOsGXeMUdCnJvFcRSNUKjwUVT4jwB4BgJxbaNSUSuJsSKG72+1+ptjVx9Fv7eyLeA5HKB4CguVPzxGGEvrqbizbrkJOfuWnuUvaIXzN3okv+om9DDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPxC2TyW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPxC2TyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749179751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Scys7hMkkteTMzv5Umuts7bOYaNcjMyUtRoN41Gt8dA=;
	b=EPxC2TyWT36gyeCOUSCQG6031ZH0aHaJZWbxil7RQC+jlv7XMKKFMz99mkZTRftH4BoCx7
	JltCcvJEtQbEY5iWoNWHibycEUZ10snXZyvlTA3f2w/sMv3gnpp6VZay7pZu3IRzK74SDO
	6pEpsGDjWR/rMACyhLfkfaOifbkftXw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-OfhmMxulN0uCO0EW8E43rg-1; Thu,
 05 Jun 2025 23:15:47 -0400
X-MC-Unique: OfhmMxulN0uCO0EW8E43rg-1
X-Mimecast-MFC-AGG-ID: OfhmMxulN0uCO0EW8E43rg_1749179746
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97BD5180035E;
	Fri,  6 Jun 2025 03:15:46 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.88])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96EB4195E74A;
	Fri,  6 Jun 2025 03:15:44 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 0/3] timers: Disable memory pre-allocation of timer debug objects
Date: Thu,  5 Jun 2025 23:15:36 -0400
Message-ID: <20250606031539.1004644-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

 [v2] Fix a typo in patch 2 that is causing compilation problem as
      reported by kernel test robot.

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

