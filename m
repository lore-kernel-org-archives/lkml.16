Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6518A6A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209491; cv=none; b=aweUHRWWnzVOhOu8B2zB0loKTdFoiGmXsVvTPfMq1Gs14Mjg8NZB4Up0VYj+iiZoYYPmR+lC0EIYapBrrU6kzYjex47toK4WAEfyGuLCn4pAvnsuleeMWCPFCj+kDlSWzM5a7RTdDUHDhdJ0pwSQiyBRVoUc6H5PU8io4LnwSI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209491; c=relaxed/simple;
	bh=ErELJ+IvzBg8JUs2VCu5poGPg2Qa3wNKqZ6l2/qOkGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4m8rdaUNpyp84eTsDMMo2jv2uqzBX+OnxuYkEvLcJXcuKYJAEsSmHSDQDkHzg2HOtekzI0Sv03QoZamIB/p8bemGgYh2AkVeDYVgHUdd5VcvLCCLZBemMaxX+9Blwtqbj6yeX+ZXxA1TTc1RF3db4suaHEZlXx5PeqashDSilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7ESogK7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7ESogK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744209487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1Hoi62apL/kuZgKTkkcKVIdRZ0albzH6pcMNtz2urrg=;
	b=f7ESogK7dQ96JCD4VGpFE4zMY1jEBs6jFlMv4A1PECgpWB9McnoIEwZYVG1H1B3dGz0qfD
	vooSjW0WxB3oq9NYjD5VTjt5+zSf5dtYufAEKWEJtC1Uog9KHYN9xGOAPEycmLvqr6Wrq/
	1g3/DH1TJMz206YEdYicWz9sA7jLpDg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-uc4W8_dJM0qKm9Je6oQ9GQ-1; Wed,
 09 Apr 2025 10:38:06 -0400
X-MC-Unique: uc4W8_dJM0qKm9Je6oQ9GQ-1
X-Mimecast-MFC-AGG-ID: uc4W8_dJM0qKm9Je6oQ9GQ_1744209485
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 19F0A180AF71;
	Wed,  9 Apr 2025 14:38:05 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.89.181])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8A3CE180B486;
	Wed,  9 Apr 2025 14:38:03 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] locking/lockdep: Prevent abuse of lockdep subclass
Date: Wed,  9 Apr 2025 10:37:51 -0400
Message-ID: <20250409143751.2010391-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

As I have seen code trying to use a subclass value >=
MAX_LOCKDEP_SUBCLASSES (8), add a DEBUG_LOCKS_WARN_ON() statement to
notify the users that such a large value is not allowed.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/lockdep.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 58d78a33ac65..3fb79d8fecdf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5101,6 +5101,9 @@ static int __lock_acquire(struct lockdep_map *lock, unsigned int subclass,
 		lockevent_inc(lockdep_nocheck);
 	}
 
+	if (DEBUG_LOCKS_WARN_ON(subclass >= MAX_LOCKDEP_SUBCLASSES))
+		return 0;
+
 	if (subclass < NR_LOCKDEP_CACHING_CLASSES)
 		class = lock->class_cache[subclass];
 	/*
-- 
2.48.1

