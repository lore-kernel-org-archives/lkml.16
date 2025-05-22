Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB582D4B71
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747957970; cv=none; b=bS42Me9hbeiZeRuEt0HmvD7X9xej5SUYp5WSazFEW8i0UPwgN0MNMfjyDeBOiv+FvvO8hNlOMVVSF9cFzgQmM993lfqWlh2v8KZKPUcxYj8qCZCrGIiSesc3GNdDOAFEisrlKWUjcmr8/Kj5pvsPi4BVK23A9b8ckqAcCbTfzUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747957970; c=relaxed/simple;
	bh=10csqsTxzGOkEfQIv9Q5P5aleQ0W+QD5VjZMgcVNvw8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZTEc3x591y2CehsDVO1OMmb24btz68b/TMySSTw08SSBOv+BgeLm3xlXi2PjE4n26KIhy4kxYwbeguihFjvqYJRP8/KPoDz7ww5Co/qoDkcL9enQBLF5CaZYQON5pqRpL7R/gcl8AhRMjf8D1al6+FyBHmh1N4EAgXlel4U3eoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xv0ywX4+; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xv0ywX4+"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso5492605a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957968; x=1748562768; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vuHVtgMNklQ3DNdNkMUrgN1tyOO7CrPEj2V6DIP2LQI=;
        b=Xv0ywX4+2yBdolyOwONRwxrwgk1Td4Dcp8bOX7h3iXl5OkIolDfTvr8hG3Lv8UF6d0
         jCi92gYVND4WN3MKrosaVqjpVQUHXszSSuDIqeX1jAWNbIwqvok1tCZsaqZKx/0XLzXG
         gwIkW3BihX4TNM7Kl1kB/y9sB6PIIz1V/QecVghPXynAS5SXcETPd4y+kQDkM9qDHqrw
         4NjxFAtQ4YsQIgLXVqB19hulSB6slqSM6I76e4h3hSMEEBE//G/un7+dCoUjYZMXIcfC
         fAzdrtBbk+1tHj3b3X01bu0uHyGA4fblWROStIYUMXWZvaJa7+g7aRWGD7ddbEsIkLxJ
         3CHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957968; x=1748562768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuHVtgMNklQ3DNdNkMUrgN1tyOO7CrPEj2V6DIP2LQI=;
        b=DwVonOg46GOR2RHccVhe0m3WrL9ocDU5odn7VG7NfUZ/Dp0khI+OG/6VVLCyPkmQk/
         3+P5/8pHN7FCH0WCsBSRiaWtb4ih0rF/jZoe8W1SevA26oPieJJH69VXoJIe9j7t7M3S
         Wylc9Ua5Flufa3DznXr/OImqzFX5uIX0gQ4tjVRb/+AGkNOP/LOto/dflGDG8A3D8Ht7
         UUNxjnfTOLLkwhAi2TU8bZrkiOyog0xyHU+lbcl1lNEV6UKbdE5WyNamzh+NLos5mW8j
         njh+KoO9HnoaZkxVVXQSBNuJumP2KUhup8jSRCbNq6fQd0NLH79BBiMN7F2B1xLH+KYU
         Pn/Q==
X-Gm-Message-State: AOJu0YwC2dIf+/90aDtjrQAnSBYVpM9uKnfXTQfVIqGE/mSL1aNwsyX6
	KdgVrUR/8d4Q4iHFI4IsksJFSYGFTiNO6eLBOJ1i9C3+6365pApZo6uM4MpBFlkXkMbnGV7hpXD
	qJTczjQ==
X-Google-Smtp-Source: AGHT+IHikqs98z49j0Kkg2uX1c0LCZJ4TnpoZgPhfD1i2QFTska6FVqOIcx30KNoejfw/K9L53iBDs4oCi4=
X-Received: from pga7.prod.google.com ([2002:a05:6a02:4f87:b0:b26:e751:bb70])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:faf:b0:223:62f5:fd44
 with SMTP id d9443c01a7336-231d459a467mr365010445ad.40.1747957967798; Thu, 22
 May 2025 16:52:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:18 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-9-seanjc@google.com>
Subject: [PATCH v3 08/13] sched/wait: Add a waitqueue helper for fully
 exclusive priority waiters
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a waitqueue helper to add a priority waiter that requires exclusive
wakeups, i.e. that requires that it be the _only_ priority waiter.  The
API will be used by KVM to ensure that at most one of KVM's irqfds is
bound to a single eventfd (across the entire kernel).

Open code the helper instead of using __add_wait_queue() so that the
common path doesn't need to "handle" impossible failures.

Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/wait.h |  2 ++
 kernel/sched/wait.c  | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 965a19809c7e..09855d819418 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -164,6 +164,8 @@ static inline bool wq_has_sleeper(struct wait_queue_head *wq_head)
 extern void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
+extern int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+					     struct wait_queue_entry *wq_entry);
 extern void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 
 static inline void __add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 4ab3ab195277..15632c89c4f2 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -47,6 +47,24 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
 }
 EXPORT_SYMBOL_GPL(add_wait_queue_priority);
 
+int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+				      struct wait_queue_entry *wq_entry)
+{
+	struct list_head *head = &wq_head->head;
+
+	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
+
+	guard(spinlock_irqsave)(&wq_head->lock);
+
+	if (!list_empty(head) &&
+	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
+		return -EBUSY;
+
+	list_add(&wq_entry->entry, head);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(add_wait_queue_priority_exclusive);
+
 void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
 	unsigned long flags;
-- 
2.49.0.1151.ga128411c76-goog

