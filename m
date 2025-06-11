Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1364F2EB5CA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682109; cv=none; b=PC5ARAYLyYUwzPeW3Zp7XHb43vfCafrLsGO0KWhePPv0zNiY1F42ByxpwrVJI6vSpXc2qvamkkOqyDfpOiNL9Y8u5msgRzmHDY3Yrppdtc6uV3h3vj61ZKtEuCVZQLENrlSfIyxfIZVAngkzep3FKYYfQAPWs+ryQQ3qXFIHLA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682109; c=relaxed/simple;
	bh=/ey+g23JZ4r8B8+r5GYs9olbwesZBfZIxsH4DlOVxs0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l+zR7iPnzTYTMxV1c7QL9T8MO3kzrMew25YvKOxnjev/tX1Ron+zIPNiOEJbF0KDtWSmrff5kiEf4nM0o4zUkU4Q87a1tP4WBLUlgRKLdEeBLCMtXZTui/dLXRz1DDj1cHJtUUYOq27/ZlwitqPbLxTrMVXrbDJ42rEDEQhqCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xujv2kFx; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xujv2kFx"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2f02cd1daeso150321a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682107; x=1750286907; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jzJ9Bn8YxIfcgCuBy+GrCINZysE0563FpKJOCV/SIJ8=;
        b=xujv2kFxwwK/66yPyzfmdGsLgM+D9+ZHY49hvL4CXV+c0ZAlNlZ+DAxEZF60X17Wxq
         aaICs8odqsY0G57esYv7Yn+H+kZAihZp4FelstSv1p+YjWHZMjRx2WJJigRJGsx9EdjD
         iE+mgBsNTECMhajBFf98aXCEygAtOVkKnfYrgDIPPhm2SotiEWnG52Rqms1m9MNIH9H4
         8omtAbv2KzMQbhZOEgoRKiLHHw/V2MbZJaVU1JbNWSTwbVlsBFrEe1/kGadLfe55WJIB
         QexF2kzTTvaYDPQkHzyj5s/TQpqE2al8/g9v9Cqyh+n78EmP2Rw8B+mWzjyexoyxrrtl
         odMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682107; x=1750286907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzJ9Bn8YxIfcgCuBy+GrCINZysE0563FpKJOCV/SIJ8=;
        b=NUAhBVDrDubeD8oxWjvK7FeA5laxHwHxO6sDx8i2bt9Vv+htZs247/iZ+rQ00goZ2Z
         80rajdXvsihhME0ebX7swHclfu4I1RFKxuxVA1qI7COp1iw1Cioh0d/LjCHOlBALjWyi
         wPDnJduiKIME6kr931MRIkOh32fNILKniMnNHev5nQs3PZnjYbTJtbJ5ord68xzjkCAX
         xN+KQ/aqVEZoiERYCni/MpjYtyaLMlO80MjqgnSBP43CD7Hz9NsynAPjDPnEJ4ljEJHx
         eB50gQs9w1OLGVitj8eoJCXQi+HepIm8DLPI21uDvS70ODGcDct4lEnjIfXxj1CTLk2F
         7iMA==
X-Forwarded-Encrypted: i=1; AJvYcCVSnoozN3cMi+T9QDB3HQGXiyCrX+kS/q160oneGKCBkVVkBYApy4H4KYS5d1MKR+n7FYUcnmbHDqI3XIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoUG7mbjUCmNHSkFgA/pf2/RGpkUHhSpOSxJU2AnV3DtUa1hcZ
	Gy/tTBlrlqyZtOZ7zeTq1csZ3ZSOkxQ0MWVHkCJSpnRAD1kB3PSTpdi8TjddYHcZiw/fP2hC+rK
	bK/7lGg==
X-Google-Smtp-Source: AGHT+IEhj+n1Ly+6wKwDC3zINzGL129P3f8d7JO7+GDAMIMqFYx6vPUDUegFQHCgddVNbCyKFm33V0a671c=
X-Received: from pjbsu16.prod.google.com ([2002:a17:90b:5350:b0:312:1af5:98c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f05:b0:311:f99e:7f57
 with SMTP id 98e67ed59e1d1-313c08d24d6mr948262a91.23.1749682107613; Wed, 11
 Jun 2025 15:48:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:56 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-55-seanjc@google.com>
Subject: [PATCH v3 53/62] KVM: x86: Decouple device assignment from IRQ bypass
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Use a dedicated counter to track the number of IRQs that can utilize IRQ
bypass instead of piggybacking the assigned device count.  As evidenced by
commit 2edd9cb79fb3 ("kvm: detect assigned device via irqbypass manager"),
it's possible for a device to be able to post IRQs to a vCPU without said
device being assigned to a VM.

Leave the calls to kvm_arch_{start,end}_assignment() alone for the moment
to avoid regressing the MMIO stale data mitigation.  KVM is abusing the
assigned device count when applying mmio_stale_data_clear, and it's not at
all clear if vDPA devices rely on this behavior.  This will hopefully be
cleaned up in the future, as the number of assigned devices is a terrible
heuristic for detecting if a VM has access to host MMIO.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  2 +-
 arch/x86/include/asm/kvm_host.h    |  4 +++-
 arch/x86/kvm/irq.c                 |  9 ++++++++-
 arch/x86/kvm/vmx/main.c            |  2 +-
 arch/x86/kvm/vmx/posted_intr.c     | 16 ++++++++++------
 arch/x86/kvm/vmx/posted_intr.h     |  2 +-
 arch/x86/kvm/x86.c                 |  3 +--
 7 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 8d50e3e0a19b..8897f509860c 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -112,7 +112,7 @@ KVM_X86_OP_OPTIONAL(update_cpu_dirty_logging)
 KVM_X86_OP_OPTIONAL(vcpu_blocking)
 KVM_X86_OP_OPTIONAL(vcpu_unblocking)
 KVM_X86_OP_OPTIONAL(pi_update_irte)
-KVM_X86_OP_OPTIONAL(pi_start_assignment)
+KVM_X86_OP_OPTIONAL(pi_start_bypass)
 KVM_X86_OP_OPTIONAL(apicv_pre_state_restore)
 KVM_X86_OP_OPTIONAL(apicv_post_state_restore)
 KVM_X86_OP_OPTIONAL_RET0(dy_apicv_has_pending_interrupt)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c722adfedd96..01edcefbd937 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1382,6 +1382,8 @@ struct kvm_arch {
 	atomic_t noncoherent_dma_count;
 #define __KVM_HAVE_ARCH_ASSIGNED_DEVICE
 	atomic_t assigned_device_count;
+	unsigned long nr_possible_bypass_irqs;
+
 #ifdef CONFIG_KVM_IOAPIC
 	struct kvm_pic *vpic;
 	struct kvm_ioapic *vioapic;
@@ -1855,7 +1857,7 @@ struct kvm_x86_ops {
 	int (*pi_update_irte)(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			      unsigned int host_irq, uint32_t guest_irq,
 			      struct kvm_vcpu *vcpu, u32 vector);
-	void (*pi_start_assignment)(struct kvm *kvm);
+	void (*pi_start_bypass)(struct kvm *kvm);
 	void (*apicv_pre_state_restore)(struct kvm_vcpu *vcpu);
 	void (*apicv_post_state_restore)(struct kvm_vcpu *vcpu);
 	bool (*dy_apicv_has_pending_interrupt)(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 02efa7162252..3e4338c6a712 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -570,10 +570,15 @@ int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
 	spin_lock_irq(&kvm->irqfds.lock);
 	irqfd->producer = prod;
 
+	if (!kvm->arch.nr_possible_bypass_irqs++)
+		kvm_x86_call(pi_start_bypass)(kvm);
+
 	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
 		ret = kvm_pi_update_irte(irqfd, &irqfd->irq_entry);
-		if (ret)
+		if (ret) {
+			kvm->arch.nr_possible_bypass_irqs--;
 			kvm_arch_end_assignment(irqfd->kvm);
+		}
 	}
 	spin_unlock_irq(&kvm->irqfds.lock);
 
@@ -606,6 +611,8 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	}
 	irqfd->producer = NULL;
 
+	kvm->arch.nr_possible_bypass_irqs--;
+
 	spin_unlock_irq(&kvm->irqfds.lock);
 
 
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index d1e02e567b57..a986fc45145e 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -1014,7 +1014,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.nested_ops = &vmx_nested_ops,
 
 	.pi_update_irte = vmx_pi_update_irte,
-	.pi_start_assignment = vmx_pi_start_assignment,
+	.pi_start_bypass = vmx_pi_start_bypass,
 
 #ifdef CONFIG_X86_64
 	.set_hv_timer = vt_op(set_hv_timer),
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 3a23c30f73cb..5671d59a6b6d 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -146,8 +146,13 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 
 static bool vmx_can_use_vtd_pi(struct kvm *kvm)
 {
+	/*
+	 * Note, reading the number of possible bypass IRQs can race with a
+	 * bypass IRQ being attached to the VM.  vmx_pi_start_bypass() ensures
+	 * blockng vCPUs will see an elevated count or get KVM_REQ_UNBLOCK.
+	 */
 	return irqchip_in_kernel(kvm) && kvm_arch_has_irq_bypass() &&
-	       kvm_arch_has_assigned_device(kvm);
+	       READ_ONCE(kvm->arch.nr_possible_bypass_irqs);
 }
 
 /*
@@ -285,12 +290,11 @@ bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu)
 
 
 /*
- * Bail out of the block loop if the VM has an assigned
- * device, but the blocking vCPU didn't reconfigure the
- * PI.NV to the wakeup vector, i.e. the assigned device
- * came along after the initial check in vmx_vcpu_pi_put().
+ * Kick all vCPUs when the first possible bypass IRQ is attached to a VM, as
+ * blocking vCPUs may scheduled out without reconfiguring PID.NV to the wakeup
+ * vector, i.e. if the bypass IRQ came along after vmx_vcpu_pi_put().
  */
-void vmx_pi_start_assignment(struct kvm *kvm)
+void vmx_pi_start_bypass(struct kvm *kvm)
 {
 	if (!kvm_arch_has_irq_bypass())
 		return;
diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
index 94ed66ea6249..a4af39948cf0 100644
--- a/arch/x86/kvm/vmx/posted_intr.h
+++ b/arch/x86/kvm/vmx/posted_intr.h
@@ -17,7 +17,7 @@ bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu);
 int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		       unsigned int host_irq, uint32_t guest_irq,
 		       struct kvm_vcpu *vcpu, u32 vector);
-void vmx_pi_start_assignment(struct kvm *kvm);
+void vmx_pi_start_bypass(struct kvm *kvm);
 
 static inline int pi_find_highest_vector(struct pi_desc *pi_desc)
 {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d3571c484790..59391cb56674 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13440,8 +13440,7 @@ bool kvm_arch_can_dequeue_async_page_present(struct kvm_vcpu *vcpu)
 
 void kvm_arch_start_assignment(struct kvm *kvm)
 {
-	if (atomic_inc_return(&kvm->arch.assigned_device_count) == 1)
-		kvm_x86_call(pi_start_assignment)(kvm);
+	atomic_inc(&kvm->arch.assigned_device_count);
 }
 EXPORT_SYMBOL_GPL(kvm_arch_start_assignment);
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog

