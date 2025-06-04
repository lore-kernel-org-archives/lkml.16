Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C27263C9B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 05:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749013752; cv=none; b=LDRBcr+PACkfT1SY1BdwLZCNn6APX7Q8owKhF+eixxh242HFbnCDf7VYs28lPQqtuL6nGI6HY1vg3Ijz18+rAxNazSIXSyRN2yEXJjT79BOp2RuFw/G2Ak0PHcDZjt9oM2pxuOZ4HYVs2/uY2dEreMfheRUT/EtsS3TZaK8M2Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749013752; c=relaxed/simple;
	bh=HrX0Qja7cb4tAXkvQ2mG5WKvRaCqmmGoaock8a28YSg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FfBHPr0Rsn59BiEgU4qJLBmkoh9PDtrGIlL9Hhx5tyChe5XGBS7hP0riQxBjcgbKLwzegq51Yp2Hf2DQ7QXYbstz/pB5vsv3RHghfqkpvasT9TNN7JDIVw3adaaWxLO5P3gjEdfRzDqY8uPAyxcejXr1amxFAu1Mhrl+cGqg1e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tyijCt5z; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tyijCt5z"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31315427249so156631a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 22:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749013749; x=1749618549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhgMslLmRs4t+ePEWLcUkFGdBSYtjx3MY6fMyfCWERc=;
        b=tyijCt5zBxcu++Z/Mx/ACGgjHGIRvsP2ViTKhCJGsq77CGONTdgUO6vFsnutWi/Qi8
         Gvnl5kuto/PpudPsjlOAw2ThZrL4k4RIO626f1YhkkwGQR7A2Qtl6H5Wd3dunwPFcbaW
         uugleC1i7Ez9EER835XKkBuVrp1W6HIRDfUsoabVJOWf6NS1VWbc1isTubcXJvxgBhry
         6shFOW+54Wm5NgEemVEC6oovMQ0znby1oKoMkiAE8BVmf/Rw9FQPtbeBN51GZMNpA+wS
         dyxHbrcH7tA/Dk+iLKjH46DGUtyeqjk/y0Nl8b8XsgJEN996H6namID/kyUCXh83+0FV
         tnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013749; x=1749618549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhgMslLmRs4t+ePEWLcUkFGdBSYtjx3MY6fMyfCWERc=;
        b=bF7PU5J+CSryYgwwJPQl1RPMgqYrhos/VI4HyIatWXXO9oQBrQxp4w6M1JJUt43QYL
         dJxrKsZmwAgObIl2YO3SAmeyM2n/s8KyvsdUH6I0TJAICnGYx5mSSMI/aF0+OdIMCd/h
         tRuODj3+PzyoWvfSab9dwvT36VSv39aPJk5Z+yMs9sVZ0+qQlKlNInNmz7B69tQ83lOB
         tcVUkdbdYNIdGT4V602mm+BNL0EJvWxup5ii0Q294KDeGO1bs422ahEXtsnezG99DUXD
         4k5X70bwZtEDAu9F7wR+g1UP2mvJhrPny58KhAw1DtfFeZ/0vm4NrX9GztHLXjMc25Vq
         UoCA==
X-Forwarded-Encrypted: i=1; AJvYcCVC8velIr78prppMyBhRUtxT6ejveMza+RMi8R1nJWzuki3OU3d/jYHnZ8AIFJRl0tdGXJCWkwd2MhyhSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJ7L/dFpD5SaWMgW9kmaF2ZNUu6J+/S0hiZwdRf2s38nSSEgQ
	P57KBANIWLs/jM8JXlKSbVxHplPE8TVDGOz5GzR4JK27YPKIzBoWepo1oTYQhXr8gwFUi3T0EIG
	SYUvXTdTH+F3Jhg==
X-Google-Smtp-Source: AGHT+IEYYVafnZZHkiG6O7O7lpguUgqLHBjMZ6tioGx87coJ7IpiOn+YvorcADDV9YLWFVwLHCGsICKRIiQ8ag==
X-Received: from pjbsw7.prod.google.com ([2002:a17:90b:2c87:b0:2ea:29de:af10])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d47:b0:30e:9349:2da2 with SMTP id 98e67ed59e1d1-31310fc4f67mr1580065a91.4.1749013748995;
 Tue, 03 Jun 2025 22:09:08 -0700 (PDT)
Date: Wed,  4 Jun 2025 05:08:58 +0000
In-Reply-To: <20250604050902.3944054-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604050902.3944054-4-jiaqiyan@google.com>
Subject: [PATCH v2 3/6] KVM: arm64: Allow userspace to inject external
 instruction aborts
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Raghavendra Rao Ananta <rananta@google.com>

When KVM returns to userspace for KVM_EXIT_ARM_SEA, the userspace is
encouraged to inject the abort into the guest via KVM_SET_VCPU_EVENTS.

KVM_SET_VCPU_EVENTS currently only allows injecting external data aborts.
However, the synchronous external abort that caused KVM_EXIT_ARM_SEA
is possible to be an instruction abort. Userspace is already able to
tell if an abort is due to data or instruction via kvm_run.arm_sea.esr,
by checking its Exception Class value.

Extend the KVM_SET_VCPU_EVENTS ioctl to allow injecting instruction
abort into the guest.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h |  3 ++-
 arch/arm64/kvm/arm.c              |  1 +
 arch/arm64/kvm/guest.c            | 13 ++++++++++---
 include/uapi/linux/kvm.h          |  1 +
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index ed5f3892674c7..643e8c4825451 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -184,8 +184,9 @@ struct kvm_vcpu_events {
 		__u8 serror_pending;
 		__u8 serror_has_esr;
 		__u8 ext_dabt_pending;
+		__u8 ext_iabt_pending;
 		/* Align it to 8 bytes */
-		__u8 pad[5];
+		__u8 pad[4];
 		__u64 serror_esr;
 	} exception;
 	__u32 reserved[12];
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 99e0c6c16e437..78e8a82c38cfc 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -319,6 +319,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
 	case KVM_CAP_ARM_NISV_TO_USER:
 	case KVM_CAP_ARM_INJECT_EXT_DABT:
+	case KVM_CAP_ARM_INJECT_EXT_IABT:
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_VCPU_ATTRIBUTES:
 	case KVM_CAP_PTP_KVM:
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 2196979a24a32..4917361ecf5cb 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -825,9 +825,9 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 		events->exception.serror_esr = vcpu_get_vsesr(vcpu);
 
 	/*
-	 * We never return a pending ext_dabt here because we deliver it to
-	 * the virtual CPU directly when setting the event and it's no longer
-	 * 'pending' at this point.
+	 * We never return a pending ext_dabt or ext_iabt here because we
+	 * deliver it to the virtual CPU directly when setting the event
+	 * and it's no longer 'pending' at this point.
 	 */
 
 	return 0;
@@ -839,6 +839,7 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	bool serror_pending = events->exception.serror_pending;
 	bool has_esr = events->exception.serror_has_esr;
 	bool ext_dabt_pending = events->exception.ext_dabt_pending;
+	bool ext_iabt_pending = events->exception.ext_iabt_pending;
 
 	if (serror_pending && has_esr) {
 		if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
@@ -852,8 +853,14 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 		kvm_inject_vabt(vcpu);
 	}
 
+	/* DABT and IABT cannot happen at the same time. */
+	if (ext_dabt_pending && ext_iabt_pending)
+		return -EINVAL;
+
 	if (ext_dabt_pending)
 		kvm_inject_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
+	else if (ext_iabt_pending)
+		kvm_inject_pabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 
 	return 0;
 }
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 4fed3fdfb13d6..2fc3775ac1183 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -943,6 +943,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_ARM_SEA_TO_USER 242
+#define KVM_CAP_ARM_INJECT_EXT_IABT 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.49.0.1266.g31b7d2e469-goog

