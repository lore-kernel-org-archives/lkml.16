Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D6A2397A4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138546; cv=none; b=Pmk+j8IYW48sDq+fAB3wshskfjdjOmBnV9r3lnuMsZBKMmRdes78LNEpBy4Tgqj+X24ybO35wqVf615iqEbkJ3dF5lGqp1fJ7bo2+99T4XzhMlWOkyqiE1llLPwCXjt4TMkay/bXIeEQd9phUuLVApzC8gMV9fBcWTs9oSYqbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138546; c=relaxed/simple;
	bh=c+x/4OeUdujUO4MvPDse6tVvVTiNnej2qgc1dKhUuGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SmnNp4P+Z+RppbsShmLciOkeNtPFXO1dytM1BCfua31lJvsRnJM7geUOHo2RgQ8MKvCQo7Uhng0Zyd/qkwHMWjp0D0ch/3JlgdcuCUCkJEMLlAnZ+HlKw2rE6Suop3O0TvmT7PopmsoDiRuDPIFkq+mIW4nULSxVm0Bz976JlAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQnw0vOh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQnw0vOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750138543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nolFETCZcySZMZco4u9I3TGnEUn/dYnLb302UJwHO9E=;
	b=DQnw0vOhjX8rW8uaLOnsjFiOleIKsaBqsv+U2XpcvLXKajFiXhNnlcZbTgekbpQlZPQT6n
	hU06WT/bEnhLRA5Ir8s0uNLo7hDiJpDFX2MVEY6jCFhhgtm+0uevFVZUFk2Djsp4vBWbgb
	LDUt0rPFdoAEZf3Cv32bU4tWN1TFOL8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-lwBzCLjoO8eDMDk8RngUBw-1; Tue,
 17 Jun 2025 01:35:41 -0400
X-MC-Unique: lwBzCLjoO8eDMDk8RngUBw-1
X-Mimecast-MFC-AGG-ID: lwBzCLjoO8eDMDk8RngUBw_1750138540
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EDA421800368;
	Tue, 17 Jun 2025 05:35:39 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.2.16.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8BF6518003FC;
	Tue, 17 Jun 2025 05:35:38 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 0/2] debugobjects: Allow object pool refill mostly in non-atomic context
Date: Tue, 17 Jun 2025 01:35:25 -0400
Message-ID: <20250617053527.1223411-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

 v3:
  - Use deferred printk for printing the debug object disable message.
  - Drop the last timer specific memory allocation disablement patch &
    limit memory allocation mostly to non-atomic context instead.

A circular locking dependency was reported by lockdep involving printk()
called from within the memory allocator, console driver with timeout
capability and timer code calling debug_object_activate() doing object
pool refill by allocating memory.

The original approach of disabling memory allocation for timer debug
objects didn't work. Now this series try to limit memory allocation
mostly to non-atomic contexts instead. This will ensure that new object
allocation won't happen in contexts where a spinlock (or a raw spinlock)
has been held or in a non-task context except for the init call, though
a sleeping lock may still be held. This should reduce the chance of
deadlock due to this kind of circular lock dependency.

Waiman Long (2):
  debugobjects: Show the state of debug_objects_enabled
  debugobjects: Allow object pool refill mostly in non-atomic context

 lib/Kconfig.debug  |  1 +
 lib/debugobjects.c | 34 +++++++++++++++++++++++-----------
 2 files changed, 24 insertions(+), 11 deletions(-)

-- 
2.49.0

