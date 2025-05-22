Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59152C3762
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747957959; cv=none; b=qMUbnamEH4AZKfSga7DawR4to8AYyS6y2ja32zIgp4ObOmpRE/63bzdQ1SjIMlGYSbP4r2geI8vnZwg88YNo5Qto/GA1QN667ZI4G9pid3ZvRG49cpeWrv0X5pMWvPqjjEUWGwOMq7SLMELinlBsIeDvDrkKLK5jaEvLxal9pwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747957959; c=relaxed/simple;
	bh=PS24WqnAD3SfQsFV7bXgSmj4OZ+55j2A7PCYOPxM2aA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rSxJvrNnKNznk9JA8YcR8O8E0SZ1CrARAN1wyKPMln0UN5E0YTl6bdiQXeijN1V00+A5INPbZvG34GXmOhQZQIaAYOCGi0GvlZX6dtzkvptA6EKNxRb7IboQfQiLg20beqBbthcrWm+VnpcIola+idJh1hugysf0Ar0Zrw3f5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TSfRYypy; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TSfRYypy"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so1147828a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957956; x=1748562756; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=;
        b=TSfRYypy7uw6SrGjp96sZasDo9w+4pEVRSewrcLxuT/DArmOT21XtQVGTethyLqN0H
         nHeXaVqC5FIk9+c810RfPtBd5g0ts9sqo3GtblT8f1MOdVpsKJhLwvKxzpDZ6/OIZDV8
         gxFzIiNNDGUCsHLAzvNFVyQG4hiWr7ALY3LTls816ENJrYVf86JC+otFjkgm3aWXgzP4
         v1LeHZ93s+QhdtQQmMQN6Dqq9XVz5UMWL2UJpI0+gC2ymD43imlzZz6U1qO9CLjxn7cM
         oUldgYJ5BIV2K64IqQ4OopXt4u+0llJcsioTUdyN0Wb1g1pDT2rZORwoDoMYt5kIyb2y
         dqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957956; x=1748562756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=;
        b=A+mttCEqyNT8UU0UFGaSDt+QAMDzas0+R1i5YtvwiyxMbFpePX7SQ3dcibbctfT2VF
         97qgKMi2NCXjzn8SeiBt0LKSGjJfBYv3UnRAJKKmNIq++HLd5dg94/eWZA1WD+aF0l7x
         lgmhuFNvUS5TJgs6kSg6poiRelbKt85paGGRzBn8zjr4AmhC4Xnt/sq65oejKOUTDUXw
         Ab8yvpXn9w8rQuY1G/26KI7dhTIqjjiGYEN9GzTlgLJSfx28J8bVjuBvMPWwr3sllAIY
         yjjf6AutfXEnNPE2ewdrR7VjmFUzKvT9+mHBD4rdVO91qRKMjJQ9qRJEJ60zqqfVcW2c
         814A==
X-Gm-Message-State: AOJu0YwVTxNNI3kIj40X/GVYRL4Rp4cYDRSd9p2ns2Y5LYtyDyfNif7p
	Wiqn4OliPYXrdx0rxqwJR98jaOlKpsVRMU0xshsdeULlC+/eltfW+Xjb8INQ+HQCzAR0MFKxijH
	HtdXvJg==
X-Google-Smtp-Source: AGHT+IHgxAzddO6m+7e1Ux4Efuqi1mCB//KSOWWOaHVhE0t5XleZFmJZnVv1KlYKH2ltYJauaNiIFWTKLOM=
X-Received: from pjbqo12.prod.google.com ([2002:a17:90b:3dcc:b0:2ea:3a1b:f493])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a50:b0:2fa:157e:c790
 with SMTP id 98e67ed59e1d1-30e7d4fe8c3mr35719761a91.5.1747957956077; Thu, 22
 May 2025 16:52:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:11 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-2-seanjc@google.com>
Subject: [PATCH v3 01/13] KVM: Use a local struct to do the initial vfs_poll()
 on an irqfd
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

Use a function-local struct for the poll_table passed to vfs_poll(), as
nothing in the vfs_poll() callchain grabs a long-term reference to the
structure, i.e. its lifetime doesn't need to be tied to the irqfd.  Using
a local structure will also allow propagating failures out of the polling
callback without further polluting kvm_kernel_irqfd.

Opportunstically rename irqfd_ptable_queue_proc() to kvm_irqfd_register()
to capture what it actually does.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_irqfd.h |  1 -
 virt/kvm/eventfd.c        | 26 +++++++++++++++++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index 8ad43692e3bb..44fd2a20b09e 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -55,7 +55,6 @@ struct kvm_kernel_irqfd {
 	/* Used for setup/shutdown */
 	struct eventfd_ctx *eventfd;
 	struct list_head list;
-	poll_table pt;
 	struct work_struct shutdown;
 	struct irq_bypass_consumer consumer;
 	struct irq_bypass_producer *producer;
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..39e42b19d9f7 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -245,12 +245,17 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 	return ret;
 }
 
-static void
-irqfd_ptable_queue_proc(struct file *file, wait_queue_head_t *wqh,
-			poll_table *pt)
+struct kvm_irqfd_pt {
+	struct kvm_kernel_irqfd *irqfd;
+	poll_table pt;
+};
+
+static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
+			       poll_table *pt)
 {
-	struct kvm_kernel_irqfd *irqfd =
-		container_of(pt, struct kvm_kernel_irqfd, pt);
+	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
+	struct kvm_kernel_irqfd *irqfd = p->irqfd;
+
 	add_wait_queue_priority(wqh, &irqfd->wait);
 }
 
@@ -305,6 +310,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 {
 	struct kvm_kernel_irqfd *irqfd, *tmp;
 	struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
+	struct kvm_irqfd_pt irqfd_pt;
 	int ret;
 	__poll_t events;
 	int idx;
@@ -394,7 +400,6 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	 * a callback whenever someone signals the underlying eventfd
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-	init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
 
 	spin_lock_irq(&kvm->irqfds.lock);
 
@@ -416,11 +421,14 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	spin_unlock_irq(&kvm->irqfds.lock);
 
 	/*
-	 * Check if there was an event already pending on the eventfd
-	 * before we registered, and trigger it as if we didn't miss it.
+	 * Register the irqfd with the eventfd by polling on the eventfd.  If
+	 * there was en event pending on the eventfd prior to registering,
+	 * manually trigger IRQ injection.
 	 */
-	events = vfs_poll(fd_file(f), &irqfd->pt);
+	irqfd_pt.irqfd = irqfd;
+	init_poll_funcptr(&irqfd_pt.pt, kvm_irqfd_register);
 
+	events = vfs_poll(fd_file(f), &irqfd_pt.pt);
 	if (events & EPOLLIN)
 		schedule_work(&irqfd->inject);
 
-- 
2.49.0.1151.ga128411c76-goog

