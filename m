Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C2F217F23
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718670; cv=none; b=GDOLlWnvVUwBit4GbiM8J4XWkRzLOsUAvwcIxTYxrjwz2roYk6cX0cN/pTwFUVbWuPBrO493ivejhrgrAUBPKYuu0b6m2Fcxdsam3gTPMz5D1whonKZ2Az45SfIcHaSLvYhkCn06bLMmXmKhmtO+FhWq0CfKmiVgPL4nVuylUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718670; c=relaxed/simple;
	bh=D76DdDu/KIcNppdMJuY+6T/bglSa/kXluVHjGUlVGZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fja+m8DJIgCGOWFGY7Cgthez0ZoUT0Q+aRGFzbe7oqif+R3ZsXYB8HpzroRpu7TVMBR7ISnEQGmkutDsj9Wm8Icivl27G8dcLYCMhnn7g6yC7C5sv7+XSynOwIKh2uKSVEK6DVFls2CboqPh3HGI52+vnjBMdft0PnMYOdlG/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gGbo0p3V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gGbo0p3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738718667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P07bISyLWOjrUwvOzYRUy1eCpbEvkKaKKbfklK3/JZ8=;
	b=gGbo0p3V/dU9xo74X0+cn/JRmiw1sfLLcMqGbfyoYN6hnOqdscx5UOPP9Qv/P2YiVRd5zQ
	/1rO6U+Oo+uFmO/40Vtlu/dEIjh3m10en1qjG27reSqyGARAAtyRjBdC0TaSUEshI0LXKP
	+GxNl7nixuGRZqlzeQibB+acpgmMuqs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-RdsdDe6UPYGKDQdqSq1KPg-1; Tue,
 04 Feb 2025 20:24:23 -0500
X-MC-Unique: RdsdDe6UPYGKDQdqSq1KPg-1
X-Mimecast-MFC-AGG-ID: RdsdDe6UPYGKDQdqSq1KPg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B482195609E;
	Wed,  5 Feb 2025 01:24:21 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.81.83])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 23CDC19560A7;
	Wed,  5 Feb 2025 01:24:19 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 0/2] locking/lockdep: Disable KASAN instrumentation of lockdep.c
Date: Tue,  4 Feb 2025 20:24:09 -0500
Message-ID: <20250205012411.1010817-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

It is found that disabling KASAN instrumentation when compiling
lockdep.c can significantly improve the performance of RT debug kernel
while the performance benefit of non-RT debug kernel is relatively
modest.

This series also include a patch to add locking events to the rtmutex
slow paths for better analysis of the different performance behavior
between RT and non-RT debug kernels.

Waiman Long (2):
  locking/lock_events: Add locking events for rtmutex slow paths
  locking/lockdep: Disable KASAN instrumentation of lockdep.c

 kernel/locking/Makefile           |  3 ++-
 kernel/locking/lock_events_list.h | 21 +++++++++++++++++++++
 kernel/locking/rtmutex.c          | 29 ++++++++++++++++++++++++-----
 3 files changed, 47 insertions(+), 6 deletions(-)

-- 
2.48.1

