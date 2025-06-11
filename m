Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD5243968
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677764; cv=none; b=kMoV27ANd/H5hxQAmWoot5dwm4lMsksTXRv2kdjudruwLM93PVHffE2Xp2ZLa1ji6KZRQA83/KB7VzOQoxkUclGvOIObSaxHFIFuwG4hV/VWvaLE552Gflcpp39OFc9/CKkZllon8K2juIgP0/J5EFMZmROy1IdkTI545tPo9eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677764; c=relaxed/simple;
	bh=ynqbREqv316s5gsW9OCsqzoURbxrqddvN+Jr9T4Pj0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X11Z2drksNGIL/OS2mTctQMSOB9lbbtBPVOHW/tT4xGKf/dH+X3OgzuVtSBEmpLOXbGP/H/Cfl1reMAYBFbrY4dnheZOHThNtBU8pqf14sMLSA5UC4cp9MOLbImK+H5aig6IjUbJkmYDq7ZBGT7c8A6Yhl1pB2/i9Z++ebZXgzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MgB/ELKY; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MgB/ELKY"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74620e98ec8so193902b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677762; x=1750282562; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PZG/T2PYXDNJDPQNT3ApJnWxeYPAUPNPO+dWK9gIL4Q=;
        b=MgB/ELKY0kZw4ahobdyd938Vb98l+PVtX9FcjEQDdKtitabDcQRObLFnjyi0+LlpRl
         urDwmTWdc35AmxC+SzzzZEafL6YL4PkyOQJikPdhuJKFxWhhn8NiMNVREaVNF9JBRRMc
         hTR0WsFMPu5xFZMmd3yao4G7bp/5G7LgAhblzkj5I63u0uKQ2GfZhwRHsl+IhUHcBG/v
         MXbjUpqDWbGeg2rq+Fn72VuG3kpdyR735vw/gak52idr3+Ja44+p1rNo9doAdlIKNRoP
         hyeQFFm7RmsblpWLrj/tSQU93CPC/DkcOGPOLFCZUs60dK8igWOPuVsmv0K4g0AmFGgk
         cLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677762; x=1750282562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZG/T2PYXDNJDPQNT3ApJnWxeYPAUPNPO+dWK9gIL4Q=;
        b=LRkwKmUaIDdZnA004pRVz6FI4+BnMMujlUNpE7f51FpJHOedqDElmS0p+akelZpviq
         qlrT06c/EB+R2CPD3lOqdstovh/yOTl05iu3RX4WtSCoE7Qugn7pwYs39hv92jvyClw+
         dZjPBPgAP/6owmwGbGD+GqSEyR/E2Y50XwUlUr4WqmUHjeh1KYpbKPcHzc0MzzbniaLh
         QOwQvik09e7Zb5G0A6R+KpeQWRmtKta0mMHuDrm2yDz5jOSp+mpVyjMPz0MfIU/IjKhM
         i7LoEGLElMAtg/jRwCgRf/Zp5e3SigNtBNeVBlm6F5ci98p7GvfEw9iaP4xMVFZ5gyzg
         sWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/keFeglSkt5UoXAW1mHe1jeGjTad7aZ3Rr+45j0X8Ya+A/DQvD2wunPkBRJ5dSHXE8N+sNGAE0uXOR1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKKmm6SQlPDmjao3IuvQgarTLUXqAXscK9YgvTfJGz9PysdZP
	7sETtliX0E0KCbHagWMUJRXkCEyqoF6DcOryPmjV/Tt9x7JbcwYy7sWXG6jZGXxJRD6PLypstpK
	wZYZhzA==
X-Google-Smtp-Source: AGHT+IGPKQIpTDjSAFv6mOIjPhaD8mB5M58fuRVAGtuBRqCaVZPcbvGXavVh+jOMgZS7XB5O8QfCC5Vv/cQ=
X-Received: from pfbna4.prod.google.com ([2002:a05:6a00:3e04:b0:746:2ae9:24a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:83cb:0:b0:742:b9d2:dc8f
 with SMTP id d2e1a72fcca58-7487cdffc94mr839105b3a.1.1749677761823; Wed, 11
 Jun 2025 14:36:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 14:35:40 -0700
In-Reply-To: <20250611213557.294358-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611213557.294358-2-seanjc@google.com>
Subject: [PATCH v2 01/18] KVM: x86: Trigger I/O APIC route rescan in kvm_arch_irq_routing_update()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>
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

Acked-by: Kai Huang <kai.huang@intel.com>
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
index 3bde4fb5c6aa..9461517b4e62 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1024,14 +1024,10 @@ void vcpu_put(struct kvm_vcpu *vcpu);
 
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
2.50.0.rc1.591.g9c95f17f64-goog

