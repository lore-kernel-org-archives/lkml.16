Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B5C223336
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523944; cv=none; b=N+29Ikokn9uHS2f08/beDxd77zyHveMG9C8a6rEI+okMlmkQ8VehWVBFX+zeQuX0e76dW9WYlnIW/4UE8L0rEEM+ikFMW6WyADlZ4i1oVmtjcaXMK+m0sECBo2T0BJRXTK9pD9gGhIl+xXU6PHXLJKfVaDQnJKwkPB9T3i+kF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523944; c=relaxed/simple;
	bh=pn8er/Ns1V0RvexqIaqaUyOMfeX7VOy6D1cEZq4AgVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdbdMiNOGAv8QYhY9ENHOR6sMSDQdXpKzX2sIGdl9JHLEBdYNAiAdA6F3cg5gu9cm4w+1Msqkxn9Y3D1agzeeEQPfVwbE4yh2f2GqXRecixbuhVd7Que+ukFDzh32x1Jn1FgYgxLDXi+RWDCzLfPWFVql9x7gelRtwYN/S0QM8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RCWXG1rt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCWXG1rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=STKQiGVrBKxKXPgyW50q0lNwcXD/6o7OaldUCF+7vOE=;
	b=RCWXG1rtgHMePJw7uS/ExMTF3nZWX6k1rdfCyEsPzfNI0gtrbb/bUAokDBexcKBrzVxoZQ
	I21aQ5tk7/0JCQrdvtmrpP8PhwCKGcit5CQ02jXRFh1/Ezd0rrihv1UZqFJgrbitXIvrW8
	T/j1TvJvU/mBmRZ/iGY87933L8KGR78=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-2V_gTDd9OZK-zObAwPVxDg-1; Tue, 01 Apr 2025 12:12:19 -0400
X-MC-Unique: 2V_gTDd9OZK-zObAwPVxDg-1
X-Mimecast-MFC-AGG-ID: 2V_gTDd9OZK-zObAwPVxDg_1743523939
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39131851046so2760175f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523938; x=1744128738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STKQiGVrBKxKXPgyW50q0lNwcXD/6o7OaldUCF+7vOE=;
        b=DSdYr2fLujEuxmzIS7+x3V/4GJ1JKDTaJqYX7wzkhVPdu1dCYGHEiJiuaBb53e52AK
         szktkj1x4GO6mPEegldDINytpQgxvNxUgSMF5F9VEGO9+SEQyNI9xwK3xy2xJ5LABA6d
         79aAD1/nIZNyzVDEgaCozbGzWeFND2l+LtMAwibvyDKlXZ2EYleWG1Lm/sQ6RcqmNQWm
         FNXpylS2S8NjUOa08AF4S6Ha+soJfWXb3urk5IcKsZpWQ5LDYn/SoCc7+taoQTF+uIoq
         tBCaluw7uGUoCDFhmexVvDTZc0QaAwWrAZL4vMHijS4TRm3ID2jhBzQyaZ5bdIlm8AT+
         Utrw==
X-Gm-Message-State: AOJu0YwuLiUF689R2cat2Vvz4K92kurlJyT/f7UZOjiYT07oi/sjitSs
	CuTvDhCe3C7DN+bdaww6BjdvUgo+lS8WUf8E+2H8catA//3w0FZDCz1f00+QYuWpTy9QzJ21VC5
	qCYX4zfM2Mqsyy8Q/o6A8Er/nG/QikYI2K4dgP1cvGBEVPj5DTmif5bqlcPwScPsWFnzr2K61hw
	ee2RUVC8MHjuh2BcsFZ3C7GZAsym5kvV61OWzsIwyC5bnNmA==
X-Gm-Gg: ASbGnctmHEIp88vlB3OfYKO0e7jcee4VExAXG8qWiHxpzF6TqX8O5P0keLu1SvYb8Nn
	3nl9cEoLgWwaaNkyfKhmboRdEoeHxi0E/iiVv9dMGvQveQFiPonpYv/pepSM5PFVI+RNFA88gtm
	BBQt4Xwaf9cO+uUhc52G7G26bwjkcskTtPav9ixSZY0SzcALbJvQ3ttudIk4wplo1QS7+AANJzU
	xIbr2n9HovLt0FKdg5IrEYeB/PPO5sGZTkb1e97tnO9b3UEs2aPWkskD27BTG6bSLsmME7eFcip
	f0nCGinuedFFDfO4X+Q7pQ==
X-Received: by 2002:a05:6000:40e1:b0:391:2ab1:d4c2 with SMTP id ffacd0b85a97d-39c12115daamr10848582f8f.37.1743523937566;
        Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFixcIUQZovBxbTUqE5qYkRuf8yLn9S/Hc/iFsk0oOlWsNioebYuSesp4eyH3gSeVV6bFB72A==
X-Received: by 2002:a05:6000:40e1:b0:391:2ab1:d4c2 with SMTP id ffacd0b85a97d-39c12115daamr10848526f8f.37.1743523937028;
        Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm160266655e9.18.2025.04.01.09.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:12:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: roy.hopkins@suse.com,
	seanjc@google.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	jroedel@suse.de,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com
Subject: [PATCH 25/29] KVM: x86: handle interrupt priorities for planes
Date: Tue,  1 Apr 2025 18:11:02 +0200
Message-ID: <20250401161106.790710-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161106.790710-1-pbonzini@redhat.com>
References: <20250401161106.790710-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force a userspace exit if an interrupt is delivered to a higher-priority
plane, where priority is represented by vcpu->run->req_exit_planes.
The set of planes with pending IRR are manipulated atomically and stored
in the plane-0 vCPU, since it is handy to reach from the target vCPU.

TODO: haven't put much thought into IPI virtualization.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/include/asm/kvm_host.h |  7 +++++
 arch/x86/kvm/lapic.c            | 36 +++++++++++++++++++++++--
 arch/x86/kvm/x86.c              | 48 +++++++++++++++++++++++++++++++++
 include/linux/kvm_host.h        |  2 ++
 4 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 9ac39f128a53..0344e8bed319 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -125,6 +125,7 @@
 #define KVM_REQ_HV_TLB_FLUSH \
 	KVM_ARCH_REQ_FLAGS(32, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_UPDATE_PROTECTED_GUEST_STATE	KVM_ARCH_REQ(34)
+#define KVM_REQ_PLANE_INTERRUPT		KVM_ARCH_REQ(35)
 
 #define CR0_RESERVED_BITS                                               \
 	(~(unsigned long)(X86_CR0_PE | X86_CR0_MP | X86_CR0_EM | X86_CR0_TS \
@@ -864,6 +865,12 @@ struct kvm_vcpu_arch {
 	u64 xcr0;
 	u64 guest_supported_xcr0;
 
+	/*
+	 * Only valid in plane0.  The bitmask of planes that received
+	 * an interrupt, to be checked against req_exit_planes.
+	 */
+	atomic_t irr_pending_planes;
+
 	struct kvm_pio_request pio;
 	void *pio_data;
 	void *sev_pio_data;
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 16a0e2387f2c..21dbc539cbe7 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1311,6 +1311,39 @@ bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm, struct kvm_lapic_irq *irq,
 	return ret;
 }
 
+static void kvm_lapic_deliver_interrupt(struct kvm_vcpu *vcpu, struct kvm_lapic *apic,
+					int delivery_mode, int trig_mode, int vector)
+{
+	struct kvm_vcpu *plane0_vcpu = vcpu->plane0;
+	struct kvm_plane *running_plane;
+	u16 req_exit_planes;
+
+	kvm_x86_call(deliver_interrupt)(apic, delivery_mode, trig_mode, vector);
+
+	/*
+	 * test_and_set_bit implies a memory barrier, so IRR is written before
+	 * reading irr_pending_planes below...
+	 */
+	if (!test_and_set_bit(vcpu->plane, &plane0_vcpu->arch.irr_pending_planes)) {
+		/*
+		 * ... and also running_plane and req_exit_planes are read after writing
+		 * irr_pending_planes.  Both barriers pair with kvm_arch_vcpu_ioctl_run().
+		 */
+		smp_mb__after_atomic();
+
+		running_plane = READ_ONCE(plane0_vcpu->running_plane);
+		if (!running_plane)
+			return;
+
+		req_exit_planes = READ_ONCE(plane0_vcpu->req_exit_planes);
+		if (!(req_exit_planes & BIT(vcpu->plane)))
+			return;
+
+		kvm_make_request(KVM_REQ_PLANE_INTERRUPT,
+				 kvm_get_plane_vcpu(running_plane, vcpu->vcpu_id));
+	}
+}
+
 /*
  * Add a pending IRQ into lapic.
  * Return 1 if successfully added and 0 if discarded.
@@ -1352,8 +1385,7 @@ static int __apic_accept_irq(struct kvm_lapic *apic, int delivery_mode,
 						       apic->regs + APIC_TMR);
 		}
 
-		kvm_x86_call(deliver_interrupt)(apic, delivery_mode,
-						trig_mode, vector);
+		kvm_lapic_deliver_interrupt(vcpu, apic, delivery_mode, trig_mode, vector);
 		break;
 
 	case APIC_DM_REMRD:
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index be4d7b97367b..4546d1049f43 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10960,6 +10960,19 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 				goto out;
 			}
 		}
+		if (kvm_check_request(KVM_REQ_PLANE_INTERRUPT, vcpu)) {
+			u16 irr_pending_planes = atomic_read(&vcpu->plane0->arch.irr_pending_planes);
+			u16 target = irr_pending_planes & vcpu->plane0->req_exit_planes;
+			if (target) {
+				vcpu->run->exit_reason = KVM_EXIT_PLANE_EVENT;
+				vcpu->run->plane_event.cause = KVM_PLANE_EVENT_INTERRUPT;
+				vcpu->run->plane_event.flags = 0;
+				vcpu->run->plane_event.pending_event_planes = irr_pending_planes;
+				vcpu->run->plane_event.target = target;
+				r = 0;
+				goto out;
+			}
+		}
 	}
 
 	if (kvm_check_request(KVM_REQ_EVENT, vcpu) || req_int_win ||
@@ -11689,8 +11702,11 @@ static int kvm_vcpu_ioctl_run_plane(struct kvm_vcpu *vcpu)
 
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu *plane0_vcpu = vcpu;
 	int plane_id = READ_ONCE(vcpu->run->plane);
 	struct kvm_plane *plane = vcpu->kvm->planes[plane_id];
+	u16 req_exit_planes = READ_ONCE(vcpu->run->req_exit_planes) & ~BIT(plane_id);
+	u16 irr_pending_planes;
 	int r;
 
 	if (plane_id) {
@@ -11698,8 +11714,40 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		mutex_lock_nested(&vcpu->mutex, 1);
 	}
 
+	if (plane0_vcpu->has_planes) {
+		plane0_vcpu->req_exit_planes = req_exit_planes;
+		plane0_vcpu->running_plane = plane;
+
+		/*
+		 * Check for cross-plane interrupts that happened while outside KVM_RUN;
+		 * write running_plane and req_exit_planes before reading irr_pending_planes.
+		 * If an interrupt hasn't set irr_pending_planes yet, it will trigger
+		 * KVM_REQ_PLANE_INTERRUPT itself in kvm_lapic_deliver_interrupt().
+		 */
+		smp_mb__before_atomic();
+
+		irr_pending_planes = atomic_fetch_and(~BIT(plane_id), &plane0_vcpu->arch.irr_pending_planes);
+		if (req_exit_planes & irr_pending_planes)
+			kvm_make_request(KVM_REQ_PLANE_INTERRUPT, vcpu);
+	}
+
 	r = kvm_vcpu_ioctl_run_plane(vcpu);
 
+	if (plane0_vcpu->has_planes) {
+		smp_store_release(&plane0_vcpu->running_plane, NULL);
+
+		/*
+		 * Clear irr_pending_planes before reading IRR; pairs with
+		 * kvm_lapic_deliver_interrupt().  If this side doesn't see IRR set,
+		 * the other side will certainly see the cleared bit irr_pending_planes
+		 * and set it, and vice versa.
+		 */
+		clear_bit(plane_id, &plane0_vcpu->arch.irr_pending_planes);
+		smp_mb__after_atomic();
+		if (kvm_lapic_find_highest_irr(vcpu))
+			atomic_or(BIT(plane_id), &plane0_vcpu->arch.irr_pending_planes);
+	}
+
 	if (plane_id)
 		mutex_unlock(&vcpu->mutex);
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0b764951f461..442aed2b9cc6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -346,6 +346,8 @@ struct kvm_vcpu {
 	/* Only valid on plane 0 */
 	bool has_planes;
 	bool wants_to_run;
+	u16 req_exit_planes;
+	struct kvm_plane *running_plane;
 
 	/* Shared for all planes */
 	struct kvm_run *run;
-- 
2.49.0

