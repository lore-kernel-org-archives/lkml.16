Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D12040B6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963087; cv=none; b=Qa5tnKlZn7OMydK9pmlLq3rhu6tF85c8qd/l73TOR4MjDzEK7r/DrvXk80bTDAfVWoCYkSMwa4a+rYKL1Qb64dhwu6IPbencrZq0PVJjBH+5ZOdfShYeXhZA+5lEWwekocXZws/DM7A/+2Tx6jLM3CHMhpyo6LrKCH2lEsWofKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963087; c=relaxed/simple;
	bh=y8TDpZKk7aB10UFoOK8n344XpdWL97IbthgkYf0JuKQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YRw4ZWwubJI+/+f0liMi0ANJ3V4R66YFPzmT4v7HD+3pLrrWiEepHmgU6/dEnfIvXJjXBa8xxU+cQbVf8VoZHvWu9Oriejd6+pXcEerDpm348KqsisUHfT/maRo+kyBMuXSyMl9hyJeZ/S9AO6I2ya2f+6KWJd01qBeycHRRY94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oOBXs11A; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oOBXs11A"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26f30486f0so8049900a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747963085; x=1748567885; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YuMGLHcCivRBl+VtofjiQzXDjtOgKsnDLWsQSOS9M50=;
        b=oOBXs11AR6PgE8N+YnIZjImyxdSDfadsR2zzt92q8PC2nrHUDAbhxTy3n1TFHL+u4f
         uR5fGh/PVm/FXJOkDbJ0HQ5wP3y0QBuI0jBRtMC3QYqURIN2kp5SZuxJ7CYf347DJh5E
         5mWkj8VwWjq1edASbVR6Q9TmPEbdRMISJmCnb/VWOVz47yn1+9qxYPKKOEgFFP3lEs2X
         0V+oM0kq0yHjFC4MrL0jU2Ut6qa/a/Q6t4mHNNRYCKZPBOW0khpKIhrYfrQsy69EXCk/
         9msQyATS8Z38jGQhu2i2TmEDJNZIPXnovCJ+4U5duWET4CyKOXmbRDU/xhQlVmqyPBiS
         qCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747963085; x=1748567885;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuMGLHcCivRBl+VtofjiQzXDjtOgKsnDLWsQSOS9M50=;
        b=YDMvwaymHVofdHo7FNzKOKPzQhl7R9Z/Lq17Y1DGHBf9v1aYokaqO9HiSPL8dblymi
         Q0Qz2bVarOGPEXf8Y5jF5w9pm1SqkEuJj268mFksDdGmls0HhgzBfu22JGRici1LT1oJ
         M3NxFjvX82STieZ2QPjESaYmvVSUjDf8N+LrorP4K9dWmYLJHxu7fRjNnPSkvrhjSC/1
         i+Dng7cY2n60lI6pn9aiqFLi+O63tcwUQd7Godz5Y50XNcbYthlTzGqwoIr8IRtIxkkC
         KwhMZ/sOK5gYoCMJVnycm5mssUVrg27zcmTPtYx1w89zZSSBLkgJo/50eP5Oogm9dIYh
         AkHw==
X-Forwarded-Encrypted: i=1; AJvYcCXqzglODVGfmdIJPQY6p6DWkGBN2ZG8e6GzmGIFpJAXlWFvZE0HFanIiowkjnqyhbUTRec99SSxCFiEz6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJIY+sJWaK2k3TihF1wdiUgYgNtqSFLLSxtx+l6HKa7A1+jwK
	HAqVd4/GgB/mCj8Bs4n4Tu7SiwVcTP6M/SBL0xIt4oyhcfXn6rrF4cREOsf1c0BHJYb/1fBRce4
	Hp5litg==
X-Google-Smtp-Source: AGHT+IEMoSdvAqq5gy38p0MEs35p+JrBTqeXvKk4+bxVzHgPqe9zQDnWpFzFQm7IXYyhXA7CIorXuUED+Po=
X-Received: from pjbeu5.prod.google.com ([2002:a17:90a:f945:b0:2ef:d136:17fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:350e:b0:310:8d7a:cece
 with SMTP id 98e67ed59e1d1-3108d7acedbmr13311760a91.35.1747963085039; Thu, 22
 May 2025 18:18:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 18:17:54 -0700
In-Reply-To: <20250523011756.3243624-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523011756.3243624-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523011756.3243624-4-seanjc@google.com>
Subject: [PATCH 3/5] KVM: VMX: Apply MMIO Stale Data mitigation if KVM maps
 MMIO into the guest
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Enforce the MMIO State Data mitigation if KVM has ever mapped host MMIO
into the VM, not if the VM has an assigned device.  VFIO is but one of
many ways to map host MMIO into a KVM guest, and even within VFIO,
formally attaching a device to a VM via KVM_DEV_VFIO_FILE_ADD is entirely
optional.

Track whether or not the guest can access host MMIO on a per-MMU basis,
i.e. based on whether or not the vCPU has a mapping to host MMIO.  For
simplicity, track MMIO mappings in "special" rools (those without a
kvm_mmu_page) at the VM level, as only Intel CPUs are vulnerable, and so
only legacy 32-bit shadow paging is affected, i.e. lack of precise
tracking is a complete non-issue.

Make the per-MMU and per-VM flags sticky.  Detecting when *all* MMIO
mappings have been removed would be absurdly complex.  And in practice,
removing MMIO from a guest will be done by deleting the associated memslot,
which by default will force KVM to re-allocate all roots.  Special roots
will forever be mitigated, but as above, the affected scenarios are not
expected to be performance sensitive.

Use a VMX_RUN flag to communicate the need for a buffers flush to
vmx_vcpu_enter_exit() so that kvm_vcpu_can_access_host_mmio() and all its
dependencies don't need to be marked __always_inline, e.g. so that KASAN
doesn't trigger a noinstr violation.

Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>
Fixes: 8cb861e9e3c9 ("x86/speculation/mmio: Add mitigation for Processor MMIO Stale Data")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/mmu/mmu_internal.h |  3 +++
 arch/x86/kvm/mmu/spte.c         | 21 +++++++++++++++++++++
 arch/x86/kvm/mmu/spte.h         | 10 ++++++++++
 arch/x86/kvm/vmx/run_flags.h    | 10 ++++++----
 arch/x86/kvm/vmx/vmx.c          |  8 +++++++-
 6 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 01edcefbd937..043be00ec5b8 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1458,6 +1458,7 @@ struct kvm_arch {
 	bool x2apic_format;
 	bool x2apic_broadcast_quirk_disabled;
 
+	bool has_mapped_host_mmio;
 	bool guest_can_read_msr_platform_info;
 	bool exception_payload_enabled;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index db8f33e4de62..65f3c89d7c5d 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -103,6 +103,9 @@ struct kvm_mmu_page {
 		int root_count;
 		refcount_t tdp_mmu_root_count;
 	};
+
+	bool has_mapped_host_mmio;
+
 	union {
 		/* These two members aren't used for TDP MMU */
 		struct {
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 3f16c91aa042..5fb43a834d48 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -138,6 +138,22 @@ static bool kvm_is_mmio_pfn(kvm_pfn_t pfn, int *is_host_mmio)
 	return *is_host_mmio;
 }
 
+static void kvm_track_host_mmio_mapping(struct kvm_vcpu *vcpu)
+{
+	struct kvm_mmu_page *root = root_to_sp(vcpu->arch.mmu->root.hpa);
+
+	if (root)
+		WRITE_ONCE(root->has_mapped_host_mmio, true);
+	else
+		WRITE_ONCE(vcpu->kvm->arch.has_mapped_host_mmio, true);
+
+	/*
+	 * Force vCPUs to exit and flush CPU buffers if the vCPU is using the
+	 * affected root(s).
+	 */
+	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
+}
+
 /*
  * Returns true if the SPTE needs to be updated atomically due to having bits
  * that may be changed without holding mmu_lock, and for which KVM must not
@@ -276,6 +292,11 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
 	}
 
+	if (static_branch_unlikely(&mmio_stale_data_clear) &&
+	    !kvm_vcpu_can_access_host_mmio(vcpu) &&
+	    kvm_is_mmio_pfn(pfn, &is_host_mmio))
+		kvm_track_host_mmio_mapping(vcpu);
+
 	*new_spte = spte;
 	return wrprot;
 }
diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 1e94f081bdaf..3133f066927e 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -280,6 +280,16 @@ static inline bool is_mirror_sptep(tdp_ptep_t sptep)
 	return is_mirror_sp(sptep_to_sp(rcu_dereference(sptep)));
 }
 
+static inline bool kvm_vcpu_can_access_host_mmio(struct kvm_vcpu *vcpu)
+{
+	struct kvm_mmu_page *root = root_to_sp(vcpu->arch.mmu->root.hpa);
+
+	if (root)
+		return READ_ONCE(root->has_mapped_host_mmio);
+
+	return READ_ONCE(vcpu->kvm->arch.has_mapped_host_mmio);
+}
+
 static inline bool is_mmio_spte(struct kvm *kvm, u64 spte)
 {
 	return (spte & shadow_mmio_mask) == kvm->arch.shadow_mmio_value &&
diff --git a/arch/x86/kvm/vmx/run_flags.h b/arch/x86/kvm/vmx/run_flags.h
index 6a9bfdfbb6e5..2f20fb170def 100644
--- a/arch/x86/kvm/vmx/run_flags.h
+++ b/arch/x86/kvm/vmx/run_flags.h
@@ -2,10 +2,12 @@
 #ifndef __KVM_X86_VMX_RUN_FLAGS_H
 #define __KVM_X86_VMX_RUN_FLAGS_H
 
-#define VMX_RUN_VMRESUME_SHIFT		0
-#define VMX_RUN_SAVE_SPEC_CTRL_SHIFT	1
+#define VMX_RUN_VMRESUME_SHIFT				0
+#define VMX_RUN_SAVE_SPEC_CTRL_SHIFT			1
+#define VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO_SHIFT	2
 
-#define VMX_RUN_VMRESUME		BIT(VMX_RUN_VMRESUME_SHIFT)
-#define VMX_RUN_SAVE_SPEC_CTRL		BIT(VMX_RUN_SAVE_SPEC_CTRL_SHIFT)
+#define VMX_RUN_VMRESUME			BIT(VMX_RUN_VMRESUME_SHIFT)
+#define VMX_RUN_SAVE_SPEC_CTRL			BIT(VMX_RUN_SAVE_SPEC_CTRL_SHIFT)
+#define VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO	BIT(VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO_SHIFT)
 
 #endif /* __KVM_X86_VMX_RUN_FLAGS_H */
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f79604bc0127..27e870d83122 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -74,6 +74,8 @@
 #include "vmx_onhyperv.h"
 #include "posted_intr.h"
 
+#include "mmu/spte.h"
+
 MODULE_AUTHOR("Qumranet");
 MODULE_DESCRIPTION("KVM support for VMX (Intel VT-x) extensions");
 MODULE_LICENSE("GPL");
@@ -959,6 +961,10 @@ unsigned int __vmx_vcpu_run_flags(struct vcpu_vmx *vmx)
 	if (!msr_write_intercepted(vmx, MSR_IA32_SPEC_CTRL))
 		flags |= VMX_RUN_SAVE_SPEC_CTRL;
 
+	if (static_branch_unlikely(&mmio_stale_data_clear) &&
+	    kvm_vcpu_can_access_host_mmio(&vmx->vcpu))
+		flags |= VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO;
+
 	return flags;
 }
 
@@ -7282,7 +7288,7 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	if (static_branch_unlikely(&vmx_l1d_should_flush))
 		vmx_l1d_flush(vcpu);
 	else if (static_branch_unlikely(&mmio_stale_data_clear) &&
-		 kvm_arch_has_assigned_device(vcpu->kvm))
+		 (flags & VMX_RUN_CLEAR_CPU_BUFFERS_FOR_MMIO))
 		mds_clear_cpu_buffers();
 
 	vmx_disable_fb_clear(vmx);
-- 
2.49.0.1151.ga128411c76-goog

