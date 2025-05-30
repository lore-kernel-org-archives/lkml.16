Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E965211460
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591510; cv=none; b=WkMMG8uL0VJ77UXSbOjYknoKCQB9BfnqEtb+13cBKXLIk1QpvynvjGRrP7ukjzFph43WkGdvasbO2W8vajgwQEN0+T5HObvITIe+ft3QgxSuQq4Frcm3i92b0G3tboPiLyDBxvm1+90sttPTONTQlJfPVXHXneUitlm6thF8v5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591510; c=relaxed/simple;
	bh=heeIOL6qrwWqY0Nmtg7onezs8AdPiDAwyThpEMRCb9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WK++1wjRXdcR6EL9ZYlfbURcQX+CcZAYgQA5N1HPfttd2qa6z4IgpVyc8K2R7V1OGcwipKJ9Zq1nSb4/2VMU+WaBwM8Oci5opFx1vFM1+QmRcvMazB4mFLEEONQAunARx+grbj4ZwCfi/UNqd2Ao2mjJb1Bltl/RzWjn6WXJVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GfsvqX8O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GfsvqX8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748591507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9DYj1nT/97zCT+d8x1OHPDM3aXSO963AXfenW8dTS4c=;
	b=GfsvqX8Ojl+XmRvaYZk2zdeec1gGpy0FQFYuq+fn1DxCw7sx0bmg6W0ObXiV5c/+OmGTem
	hYnfTABtdJqYL21w+dtxKJSsFmW6tcuRaq1n9PQ16/Dbey2k6L82HL0vhgiw4B6MqiCD4n
	lX7j0RAVhj/EzqEqSt1lOlgx/VAxxBo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-I-xfwfSWNeijiu42a9oRiA-1; Fri,
 30 May 2025 03:51:45 -0400
X-MC-Unique: I-xfwfSWNeijiu42a9oRiA-1
X-Mimecast-MFC-AGG-ID: I-xfwfSWNeijiu42a9oRiA_1748591504
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80080180045B;
	Fri, 30 May 2025 07:51:44 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D87E19560B7;
	Fri, 30 May 2025 07:51:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] rtmutex_api: remove definition of mutex_lock_killable_nested
Date: Fri, 30 May 2025 03:51:36 -0400
Message-ID: <20250530075136.11842-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Commit fb49f07ba1d9 ("locking/mutex: implement mutex_lock_killable_nest_lock")
removed the "extern" declaration of mutex_lock_killable_nested from
include/linux/mutex.h, and replaced it with a macro since it could be
treated as a special case of _mutex_lock_killable.  It also removed a
definition of the function in kernel/locking/mutex.c.

However, it left the definition in place in kernel/locking/rtmutex_api.c,
which causes a failure when building with CONFIG_RT_MUTEXES=y.  Drop it as
well now.

Fixes: fb49f07ba1d9 ("locking/mutex: implement mutex_lock_killable_nest_lock")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 kernel/locking/rtmutex_api.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/kernel/locking/rtmutex_api.c b/kernel/locking/rtmutex_api.c
index 191e4720e546..0c26b52dd417 100644
--- a/kernel/locking/rtmutex_api.c
+++ b/kernel/locking/rtmutex_api.c
@@ -544,13 +544,6 @@ int __sched mutex_lock_interruptible_nested(struct mutex *lock,
 }
 EXPORT_SYMBOL_GPL(mutex_lock_interruptible_nested);
 
-int __sched mutex_lock_killable_nested(struct mutex *lock,
-					    unsigned int subclass)
-{
-	return __mutex_lock_common(lock, TASK_KILLABLE, subclass, NULL, _RET_IP_);
-}
-EXPORT_SYMBOL_GPL(mutex_lock_killable_nested);
-
 void __sched mutex_lock_io_nested(struct mutex *lock, unsigned int subclass)
 {
 	int token;
-- 
2.43.5

