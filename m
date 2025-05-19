Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A99218EB7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680931; cv=none; b=LJgDIT1Euewu5pV/yie6navggDv6ix4eyAJytZehvckvGu3cpMowA5+I9J8YYAfQb2Y1hnrhRcDkCOqC1rq1gRNaU33KXgOIrCGoRP/AnqUaeToU5NcaXwW2eUEw08eCS3t9W2XiZJC8bsMY/eS046pSs0yOr+R8rePtzTFxLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680931; c=relaxed/simple;
	bh=Wnq3AEkwwCRKZdw0URszudHGV3cHf51uRQG8VfDhld0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oRCxN3jAgSHHnKDPYcX9xyMZhChMPINc9RsX2hVgjAYh2w/YQDnP3g1aGs0l5PdNBRy++gBoug/KYRL7beKrIHw54ZpuFCwgrYQfdjUfpUj0WeEJvsOMt3QqE8y4Vu8qZFpycHDQUiB1howm8HhoRavsqMcDIalMhTzHPFqtMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3I63tJIs; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3I63tJIs"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e7c25aedaso2920335a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680929; x=1748285729; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WPHkK6AJb2aIuP4Pg4NSQD55GV+jm/GYycppUOoBB24=;
        b=3I63tJIsoiXVzQdmP1nz9WGkgLdodnDB7+MbMDeYKgYWU2SEFroetyVwFDUZLixri6
         ErESV/iwvuEskLnEI4JgBzdT69L+BqHQ9Y4ksYov6s763BXVQyddUagh4VXJovV6mohk
         bo8HWhBAijfAyEk4qK9+oR+wYKepjFxkydt7G6j2Np2h58bb//kTI2j8XP1WFW6FTHwo
         deS4z8cZG/bvH+b+tuglQKyLsPpi7QV1MiP/SRqEgqg/xF/mrlHaEswRQMJ8PNyOJ5LA
         9NyDHyPatsUPzqGq+nCeOpTAJ3Go4cPlj083oPVclOJuwBe5HabtzBrPQwhiZbglFhRf
         EQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680929; x=1748285729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPHkK6AJb2aIuP4Pg4NSQD55GV+jm/GYycppUOoBB24=;
        b=HKdH1VECGg6sXEFVJ4xfQoXoMU6sYoXWg/yLb/isOCBMgepKo3uPUJUMDdhRHFjBgd
         NKBZkbTpIt8DVucbeosiWHPcL9PrV3LWxoMC8T3TYyla+UNy3naUiX/hqzwtO1idUC/D
         45qUAeIyl/J8m1ksxskb1i1k9LlsAFboOjadhb/5hZ0dx42BmNCS3PyDSPt2hbgzM/yi
         B2r8IzLqTk8xaVEOYpjxMnZvvfQe2tmEDQ1fM2SzDL2KRXVZa0kLRTOaQ49EXEePVkye
         q5soezdff7R8hPQmWj+x7yUeXJv37/Xku00JAxBmk2AFkbWf0r8Na1RZltBOAQhHMW3L
         0sIg==
X-Forwarded-Encrypted: i=1; AJvYcCWJL0RNLWexfzynVzLuh3pwkST223o9N3PsJDQsTXKVS1C5mlfT81XixWuzGZEcL12WKwawpFDnpFPxiKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRqUEqnrNGSlIO4h/YfVKeispd8bQAO/o2WmSGUb0Usa5gfQM
	6JlruokCTEX0HfjX33FVe8rjge7fiAxTWUooDZU6SB3FT3X3oeVKhJgAykWZTKZD7sHB5lUBSsq
	+1blG0Q==
X-Google-Smtp-Source: AGHT+IHK1Zr4h0D2c9hfvihT1HBAYjdqDVsYafOfJ/1g69C6YEZd33VFtqEq4B23tLL0mdweYF147yQWVb0=
X-Received: from pjbpv10.prod.google.com ([2002:a17:90b:3c8a:b0:30e:5bd5:880d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d445:b0:30e:a1ec:68dd
 with SMTP id 98e67ed59e1d1-30ea1ec68e8mr16388245a91.8.1747680929524; Mon, 19
 May 2025 11:55:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 11:55:08 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-7-seanjc@google.com>
Subject: [PATCH v2 06/12] sched/wait: Add a waitqueue helper for fully
 exclusive priority waiters
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

Add a waitqueue helper to add a priority waiter that requires exclusive
wakeups, i.e. that requires that it be the _only_ priority waiter.  The
API will be used by KVM to ensure that at most one of KVM's irqfds is
bound to a single eventfd (across the entire kernel).

Open code the helper instead of using __add_wait_queue() so that the
common path doesn't need to "handle" impossible failures.

Note, the priority_exclusive() name is obviously confusing as the plain
priority() API also sets WQ_FLAG_EXCLUSIVE.  This will be remedied once
KVM switches to add_wait_queue_priority_exclusive(), as the only other
user of add_wait_queue_priority(), Xen's privcmd, doesn't actually operate
in exclusive mode (more than likely, the detail was overlooked when privcmd
copy-pasted (sorry, "was inspired by") KVM's implementation).

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
index 51e38f5f4701..03252badb8e8 100644
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
+EXPORT_SYMBOL(add_wait_queue_priority_exclusive);
+
 void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
 	unsigned long flags;
-- 
2.49.0.1101.gccaa498523-goog

