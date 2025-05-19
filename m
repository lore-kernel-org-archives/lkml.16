Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543402206BB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697299; cv=none; b=KUK6YMmNrPNLJhUy6vB3joAX31OtKLC+98112nndqNvg/OQyjazYE5HQQOpfbLUcTmjzXUqEj7zR83u8ydOMDgqN/zVGDajFrSlnVDygCZRYlH+G22UIYinLHVm05NLP2M567Uo0owm1IaEBPW5/WtoK6rJS3wPoGbkyFpxjfRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697299; c=relaxed/simple;
	bh=7XLMy6k3euXlqZoZIk6NOl+uE5XTQOe7T5Piz8sEjIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I2CDBI86qJgAGAbXZnhXNyJRhq4Lb3jgPiK8uWitOl6HixUVZywTx1VNeNGTpiYh8LGDkc1yBRvjSmfWkTgE7m1QizClb2radpzyVIM5QvZhfERgJXgJlsqMsIjAHqWLPLgNv8fvsKLdYITNVaIwtooexxDZEwIJdS+gRTeDjFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CgI3bHOw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CgI3bHOw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ed376a927so1554477a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747697296; x=1748302096; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFZL/kH4WRlINTL3eamUJbEcDFBeTVdE3ERRtxKHz5s=;
        b=CgI3bHOwwC5ZzIt4N+CUiQ49COZPzu0fzTbaGfoVi4ePAw7JHmMjPGZHFsu+ndv6LA
         cCv0RSBq3zkkW5p8yp9YvtU3ddIXrBhFFTNZNPAu3uvecZdswLFTzDIqj7NKxoibwClp
         9rwUuFF1aZbhCaVZ5yfuWps4kviQHMcXdRI9MwCYgDRAt0en7MMDr2vpKzaEQPo9R58P
         zKVgzzl/Rolwj1IlQfHOFlGcTd3er8Y2Oo50IRXKJFHJaCi4XTih+U7VNI/mdXas1zgj
         ++qTeriAf38RQf2XAPRX1M8n7uS/wiAyctqF5V5Q1FAD4EfjkOkydMfllE9YI7WCGk/0
         ZPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697296; x=1748302096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFZL/kH4WRlINTL3eamUJbEcDFBeTVdE3ERRtxKHz5s=;
        b=hT3BtZyC4D1cETdKxP2XOjAhymg1kRyL1PqX2uoKp7U9z/DLuXXK/4k0SrdiFdMQWc
         FbPXbny3RaWZEEAsSsXLxM0anYwL1ojMgu/iThYDR8wf906Z75D6RcFh8GEQQeam0YWV
         3S/q3OrxfWh7OlavSOwAPUGzdQZL0Qx7GF3To4VS4Q3QSCD0Y2Q+wqIDtOqwWcpGMsLq
         HjANwwTuCgy32r64nIxnJnf8/pAHuQhq42f/0ZUtFmpNW2pjcBk8xo/YQyQ/LkA3xae8
         O2fuX6OUT83dIs1M96HfymPZ23hLn9i8tz0Z843/GV/c597HFIYliFTQEvLBshdGKyWt
         z5JA==
X-Forwarded-Encrypted: i=1; AJvYcCWJIqhiM04ZMR/sWrTneBkBgUWMN/wyF5Eh9eNvbTVMHOUbnnjY+yHU+r1OVGbLvqcH2fm+JThM7E2EIb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIwXFLHhsxreRkKTJUKsg3iV10DLz9m5YVGiSiWe3GDItzfJ0i
	C2SqwLZWkz6Tpi4n/7SJ+80MGMZnxdZXAYum5VSAF2nUQc3JgtxL07WEKt7arp7AGILmgN2JzBS
	/tgFVmA==
X-Google-Smtp-Source: AGHT+IHQHbcXZtaoWAtgRshiy3d8CBLPCDH18KzA2veAqY8K4gctlw03Pifc9NLOszqBQATvWqPErDxNwGg=
X-Received: from pjk3.prod.google.com ([2002:a17:90b:5583:b0:30a:4874:5389])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e85:b0:2ee:c30f:33c9
 with SMTP id 98e67ed59e1d1-30e7e770523mr18211368a91.14.1747697296528; Mon, 19
 May 2025 16:28:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 16:27:54 -0700
In-Reply-To: <20250519232808.2745331-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519232808.2745331-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519232808.2745331-2-seanjc@google.com>
Subject: [PATCH 01/15] KVM: x86: Trigger I/O APIC route rescan in kvm_arch_irq_routing_update()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Trigger the I/O APIC route rescan that's performed for a split IRQ chip
after userspace updates IRQ routes in kvm_arch_irq_routing_update(), i.e.
before dropping kvm->irq_lock.  Calling kvm_make_all_cpus_request() under
a mutex is perfectly safe, and the smp_wmb()+smp_mb__after_atomic() pair
in __kvm_make_request()+kvm_check_request() ensures the new routing is
visible to vCPUs prior to the request being visible to vCPUs.

In all likelihood, commit b053b2aef25d ("KVM: x86: Add EOI exit bitmap
inference") somewhat arbitrarily made the request outside of irq_lock to
avoid holding irq_lock any longer than is strictly necessary.  And then
commit abdb080f7ac8 ("kvm/irqchip: kvm_arch_irq_routing_update renaming
split") took the easy route of adding another arch hook instead of risking
a functional change.

Note, the call to synchronize_srcu_expedited() does NOT provide ordering
guarantees with respect to vCPUs scanning the new routing; as above, the
request infrastructure provides the necessary ordering.  I.e. there's no
need to wait for kvm_scan_ioapic_routes() to complete if it's actively
running, because regardless of whether it grabs the old or new table, the
vCPU will have another KVM_REQ_SCAN_IOAPIC pending, i.e. will rescan again
and see the new mappings.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq_comm.c  | 10 +++-------
 include/linux/kvm_host.h |  4 ----
 virt/kvm/irqchip.c       |  2 --
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index d6d792b5d1bd..e2ae62ff9cc2 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -395,13 +395,6 @@ int kvm_setup_default_irq_routing(struct kvm *kvm)
 				   ARRAY_SIZE(default_routing), 0);
 }
 
-void kvm_arch_post_irq_routing_update(struct kvm *kvm)
-{
-	if (!irqchip_split(kvm))
-		return;
-	kvm_make_scan_ioapic_request(kvm);
-}
-
 void kvm_scan_ioapic_irq(struct kvm_vcpu *vcpu, u32 dest_id, u16 dest_mode,
 			 u8 vector, unsigned long *ioapic_handled_vectors)
 {
@@ -466,4 +459,7 @@ void kvm_arch_irq_routing_update(struct kvm *kvm)
 #ifdef CONFIG_KVM_HYPERV
 	kvm_hv_irq_routing_update(kvm);
 #endif
+
+	if (irqchip_split(kvm))
+		kvm_make_scan_ioapic_request(kvm);
 }
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c685fb417e92..963e250664d6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1020,14 +1020,10 @@ void vcpu_put(struct kvm_vcpu *vcpu);
 
 #ifdef __KVM_HAVE_IOAPIC
 void kvm_arch_post_irq_ack_notifier_list_update(struct kvm *kvm);
-void kvm_arch_post_irq_routing_update(struct kvm *kvm);
 #else
 static inline void kvm_arch_post_irq_ack_notifier_list_update(struct kvm *kvm)
 {
 }
-static inline void kvm_arch_post_irq_routing_update(struct kvm *kvm)
-{
-}
 #endif
 
 #ifdef CONFIG_HAVE_KVM_IRQCHIP
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 162d8ed889f2..6ccabfd32287 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -222,8 +222,6 @@ int kvm_set_irq_routing(struct kvm *kvm,
 	kvm_arch_irq_routing_update(kvm);
 	mutex_unlock(&kvm->irq_lock);
 
-	kvm_arch_post_irq_routing_update(kvm);
-
 	synchronize_srcu_expedited(&kvm->irq_srcu);
 
 	new = old;
-- 
2.49.0.1101.gccaa498523-goog

