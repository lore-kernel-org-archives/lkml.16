Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7140E219E0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739161606; cv=none; b=m065yu6VE0Z2rxHXJHHhZrSx/uKc+vuToKrSRA+LPH86HneRg/qx47bYCk35a+8OBmJBOkSRnYHNMiMuDN+ZZM4b2wLQU3/hI9PlAOwnCUc69y8ijmMQIwY5q59WaexguuxIb4Tlt/9AfcIBS3LzKslQ/T4Etq9+U1anY+FVBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739161606; c=relaxed/simple;
	bh=KVyeUOrvsipxG9PVcfBnE7kY/EYj2upMe1CB8b/e5bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJVeVk6/oq+kVAClIo9QQFIZ8BG0HNxvgwrk9myjYrRktq5gKj05bI4aT65Qm90NpJpOqIo4UxvWlzoD4wqnwr4PRuTTmgT1r+rE8RBwi/jseb98Mae3EDxPcoIG+9LcFa9yXTWbD/i3J8JW3Cke5u8b140/Vy1XM46fgtRtk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xek7MSNI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xek7MSNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739161603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JvSy9hDDTXSV1Cwq1xN+dE+ELaxex2RKxsUlq30EWoI=;
	b=Xek7MSNIm9sfSFufErFO5bKzq18SNgnH52pleDGRu1RaqaMdOnNOv1TV1qFeT8G0unL2qT
	9/10A5Xrxgw7WHmhVX2/k9/XTnTAWUysxQnXCgtlyuV5gkG6GUMsNfYVI0Yj5ppXDdKZcm
	VAZrZO2nnKs4L27gF43z3SeoOP+xS5k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-N8LeotGGMjGOYF9KkLWRiw-1; Sun,
 09 Feb 2025 23:26:39 -0500
X-MC-Unique: N8LeotGGMjGOYF9KkLWRiw-1
X-Mimecast-MFC-AGG-ID: N8LeotGGMjGOYF9KkLWRiw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B022B1800872;
	Mon, 10 Feb 2025 04:26:37 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.88.34])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 14FBB19560A3;
	Mon, 10 Feb 2025 04:26:35 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 0/3] locking/lockdep: Disable KASAN instrumentation of lockdep.c
Date: Sun,  9 Feb 2025 23:26:09 -0500
Message-ID: <20250210042612.978247-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

 v3: 
  - Add another patch to insert lock events into lockdep.c.
  - Rerun all the tests with the simpler defconfig kernel build and do
    further analysis of the of the performance difference between the
    the RT and non-RT debug kernels.

It is found that disabling KASAN instrumentation when compiling
lockdep.c can significantly improve the performance of RT debug kernel
while the performance benefit of non-RT debug kernel is relatively
modest.

This series also include patches to add locking events to the rtmutex
slow paths and the lockdep code for better analysis of the different
performance behavior between RT and non-RT debug kernels.

Waiman Long (3):
  locking/lock_events: Add locking events for rtmutex slow paths
  locking/lock_events: Add locking events for lockdep
  locking/lockdep: Disable KASAN instrumentation of lockdep.c

 kernel/locking/Makefile           |  3 ++-
 kernel/locking/lock_events_list.h | 28 ++++++++++++++++++++++++++++
 kernel/locking/lockdep.c          |  8 +++++++-
 kernel/locking/rtmutex.c          | 29 ++++++++++++++++++++++++-----
 4 files changed, 61 insertions(+), 7 deletions(-)

-- 
2.48.1

