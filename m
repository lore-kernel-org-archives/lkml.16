Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB6256C61
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677781; cv=none; b=OUJ/Xs4YSUpNuSQDCv4c8psYkACV6j3DLSlzr0bDb/JbrmjXYUWqdALG6R3a1uMG5ZCqKPBGUK1t38C2+3kMQ7oOK5zduTh/8CNx9im2H2gH1yLWdbOJQd6Llwa9fhjkjgZWfEEOzyDU23e3rM286dDAO0xJDLogI5flh9t8XuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677781; c=relaxed/simple;
	bh=eJwcngQ+DpTfv+ouROAPw+UWqw33arcrIBz+YZkiD5k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YYsf+9jCVpLZhX9sMKs+0RoWWQ7FmFsqbKw0VL4fRU3Daas+SjFGwDqJF05/nAZMKvKek8MmVKkgPlJK9yvLIYMnphlTtC30PnFa5lxPVab0JFlkRHqVNmclNWH7uNJey2ievlVD7YW9hkUAFNJD5pNpARizRNcIoXohmiN5UaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1FAD1fhl; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1FAD1fhl"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fb347b3e6so185026a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677779; x=1750282579; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kpb+iWlljlUnDOEgX9GQ6UR4rnxmypu3poRL7IS771A=;
        b=1FAD1fhlhOTrEDChMbP71We9Kr0HKcqs2pZ41nt/o14BDAGFJqA+BKXZeWW1qJHZ3j
         /+yLCM3fs+caSHcqwlOPJa0UN9GwjcB4WlLIpq5niqA1qUvABdnKdtWHEXeoaMk1IL4T
         zzlljPtk1+f7C7ifj38+YZHVNB6K9MKueDTx+mThK0wbfGPLcEwX3k113jnHeiBg+d9X
         sl6lPNwcNFKF9581QbWw6/pa91ZmXRUEm8uYwGpxIPIQGPl88PqPhVSyBrVl3ySriZXQ
         8uTaFwr3M3FD0WcHjK7gT9s45p905l2z04Lf4/6ZHQhLigPznWt+TG31fwqFH4TvFQ5w
         Db+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677779; x=1750282579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpb+iWlljlUnDOEgX9GQ6UR4rnxmypu3poRL7IS771A=;
        b=Yxg0lSZDBz6eJS+qYecNyzTDIc5n5o0WG1MhIs2V+1yao9ycn8hoiCYukgCmBNK5AY
         S6yTI19TuYV8VbO1/3yTjMa4BKWut0z9Bncj1qafcUTzDqpQJTvEjoW+kcj6s5SUJuE5
         oqLUv/OSr5B6ExI6YNjjOuwattpwiQOzf9PU8X8U8Ue5HOC7v8ww7oru/TIHN3c/zpep
         94/YWSu/vOdl/XJwEtrfO2ivqvQl+L2zElGCLIx0nafmoYFZCd80RO9D8M5xkCksQYgI
         4vbvaBweL7gR07PLLPHQzsrhI9fKtvnghM0BlgZHEzsNYt7my9ARnZ0xhUWHGSLgmNzx
         hNyg==
X-Forwarded-Encrypted: i=1; AJvYcCVUi2nBYkCdGhw5d58gYv6GfYjc9/H08PysPcxUPEo62JpMVpwRyQo3KrPxApPtWZFPwbRT6nj6MkOw9RE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiE23Ql0xkbItHbTxnGkCKpdBnq6/ldS5tiuDs3KjCv9qWRlpQ
	4yRK0DZdzpEFJHMYH67Ijg/jVoO5MVFxxjcpbnPdryN5xPc97PkGu5bOa6IRgXknkALsgSgKwa8
	J3ggxcA==
X-Google-Smtp-Source: AGHT+IFUJOSi+ExSQf/7uPqW/JnEPdK6RMy8kqpSeeweq1JUqHHcz/MuEs5VAl/nK94ZZSQTxiasBAv1p/4=
X-Received: from pjqq12.prod.google.com ([2002:a17:90b:584c:b0:312:ea08:fa64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d4f:b0:311:c1ec:7d05
 with SMTP id 98e67ed59e1d1-313af24e4a0mr6860950a91.35.1749677778771; Wed, 11
 Jun 2025 14:36:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 14:35:49 -0700
In-Reply-To: <20250611213557.294358-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611213557.294358-11-seanjc@google.com>
Subject: [PATCH v2 10/18] KVM: x86: Hardcode the PIT IRQ source ID to '2'
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hardcode the PIT's source IRQ ID to '2' instead of "finding" that bit 2
is always the first available bit in irq_sources_bitmap.  Bits 0 and 1 are
set/reserved by kvm_arch_init_vm(), i.e. long before kvm_create_pit() can
be invoked, and KVM allows at most one in-kernel PIT instance, i.e. it's
impossible for the PIT to find a different free bit (there are no other
users of kvm_request_irq_source_id().

Delete the now-defunct irq_sources_bitmap and all its associated code.

Acked-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/i8254.c            | 55 +++++----------------------------
 arch/x86/kvm/i8254.h            |  1 -
 arch/x86/kvm/x86.c              |  6 ----
 include/linux/kvm_host.h        |  1 +
 5 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f25ec3ec5ce4..c8654e461933 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1396,7 +1396,6 @@ struct kvm_arch {
 	bool pause_in_guest;
 	bool cstate_in_guest;
 
-	unsigned long irq_sources_bitmap;
 	s64 kvmclock_offset;
 
 	/*
diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 2bb223bf0dac..fa8187608cfc 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -248,8 +248,8 @@ static void pit_do_work(struct kthread_work *work)
 	if (atomic_read(&ps->reinject) && !atomic_xchg(&ps->irq_ack, 0))
 		return;
 
-	kvm_set_irq(kvm, pit->irq_source_id, 0, 1, false);
-	kvm_set_irq(kvm, pit->irq_source_id, 0, 0, false);
+	kvm_set_irq(kvm, KVM_PIT_IRQ_SOURCE_ID, 0, 1, false);
+	kvm_set_irq(kvm, KVM_PIT_IRQ_SOURCE_ID, 0, 0, false);
 
 	/*
 	 * Provides NMI watchdog support via Virtual Wire mode.
@@ -641,47 +641,11 @@ static void kvm_pit_reset(struct kvm_pit *pit)
 	kvm_pit_reset_reinject(pit);
 }
 
-static int kvm_request_irq_source_id(struct kvm *kvm)
+static void kvm_pit_clear_all(struct kvm *kvm)
 {
-	unsigned long *bitmap = &kvm->arch.irq_sources_bitmap;
-	int irq_source_id;
-
 	mutex_lock(&kvm->irq_lock);
-	irq_source_id = find_first_zero_bit(bitmap, BITS_PER_LONG);
-
-	if (irq_source_id >= BITS_PER_LONG) {
-		pr_warn("exhausted allocatable IRQ sources!\n");
-		irq_source_id = -EFAULT;
-		goto unlock;
-	}
-
-	ASSERT(irq_source_id != KVM_USERSPACE_IRQ_SOURCE_ID);
-	ASSERT(irq_source_id != KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID);
-	set_bit(irq_source_id, bitmap);
-unlock:
-	mutex_unlock(&kvm->irq_lock);
-
-	return irq_source_id;
-}
-
-static void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id)
-{
-	ASSERT(irq_source_id != KVM_USERSPACE_IRQ_SOURCE_ID);
-	ASSERT(irq_source_id != KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID);
-
-	mutex_lock(&kvm->irq_lock);
-	if (irq_source_id < 0 ||
-	    irq_source_id >= BITS_PER_LONG) {
-		pr_err("IRQ source ID out of range!\n");
-		goto unlock;
-	}
-	clear_bit(irq_source_id, &kvm->arch.irq_sources_bitmap);
-	if (!irqchip_full(kvm))
-		goto unlock;
-
-	kvm_ioapic_clear_all(kvm->arch.vioapic, irq_source_id);
-	kvm_pic_clear_all(kvm->arch.vpic, irq_source_id);
-unlock:
+	kvm_ioapic_clear_all(kvm->arch.vioapic, KVM_PIT_IRQ_SOURCE_ID);
+	kvm_pic_clear_all(kvm->arch.vpic, KVM_PIT_IRQ_SOURCE_ID);
 	mutex_unlock(&kvm->irq_lock);
 }
 
@@ -788,10 +752,6 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 flags)
 	if (!pit)
 		return NULL;
 
-	pit->irq_source_id = kvm_request_irq_source_id(kvm);
-	if (pit->irq_source_id < 0)
-		goto fail_request;
-
 	mutex_init(&pit->pit_state.lock);
 
 	pid = get_pid(task_tgid(current));
@@ -843,8 +803,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 flags)
 	kvm_pit_set_reinject(pit, false);
 	kthread_destroy_worker(pit->worker);
 fail_kthread:
-	kvm_free_irq_source_id(kvm, pit->irq_source_id);
-fail_request:
+	kvm_pit_clear_all(kvm);
 	kfree(pit);
 	return NULL;
 }
@@ -861,7 +820,7 @@ void kvm_free_pit(struct kvm *kvm)
 		kvm_pit_set_reinject(pit, false);
 		hrtimer_cancel(&pit->pit_state.timer);
 		kthread_destroy_worker(pit->worker);
-		kvm_free_irq_source_id(kvm, pit->irq_source_id);
+		kvm_pit_clear_all(kvm);
 		kfree(pit);
 	}
 }
diff --git a/arch/x86/kvm/i8254.h b/arch/x86/kvm/i8254.h
index 338095829ec8..b9c1feb379a7 100644
--- a/arch/x86/kvm/i8254.h
+++ b/arch/x86/kvm/i8254.h
@@ -44,7 +44,6 @@ struct kvm_pit {
 	struct kvm_io_device speaker_dev;
 	struct kvm *kvm;
 	struct kvm_kpit_state pit_state;
-	int irq_source_id;
 	struct kvm_irq_mask_notifier mask_notifier;
 	struct kthread_worker *worker;
 	struct kthread_work expired;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f02a9a332f69..115405f496ef 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12669,12 +12669,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	INIT_HLIST_HEAD(&kvm->arch.mask_notifier_list);
 	atomic_set(&kvm->arch.noncoherent_dma_count, 0);
 
-	/* Reserve bit 0 of irq_sources_bitmap for userspace irq source */
-	set_bit(KVM_USERSPACE_IRQ_SOURCE_ID, &kvm->arch.irq_sources_bitmap);
-	/* Reserve bit 1 of irq_sources_bitmap for irqfd-resampler */
-	set_bit(KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID,
-		&kvm->arch.irq_sources_bitmap);
-
 	raw_spin_lock_init(&kvm->arch.tsc_write_lock);
 	mutex_init(&kvm->arch.apic_map_lock);
 	seqcount_raw_spinlock_init(&kvm->arch.pvclock_sc, &kvm->arch.tsc_write_lock);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cba8fc4529e8..4ff5ea29e343 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -190,6 +190,7 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req);
 
 #define KVM_USERSPACE_IRQ_SOURCE_ID		0
 #define KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID	1
+#define KVM_PIT_IRQ_SOURCE_ID			2
 
 extern struct mutex kvm_lock;
 extern struct list_head vm_list;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

