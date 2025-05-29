Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15461266B5C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562049; cv=none; b=nqEVuO1P9vmm+FIw3CONFjzzclW4E6uqlbXHxuJ/5h8nwBct2oiaoYB30jtPbzwgZKdz1L/luns4nfGdeyCCt2+AyPkj+Ok/OnA7cn7JVqwMve752gIfseAcswryIX591H1/BrVb0KyHbOFcLSwG27My/Cwr45Y552m2Vc5kJLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562049; c=relaxed/simple;
	bh=ipd3PqNgKX6EiEMlkRwnAr7yR8L6HWmKo1llt0yzTC4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ciZfl23BQhLSOILPGaP8XDpnLZpNCrJBwYzWOzamPhdvrDVJoMNztoaXNIVxU2asMHrdFv34AG/Zn97VaKhdnLDNNQOLgHu1exsJkPQeG0itKCeegEDsOSvfV7SXCpT3Njrr/cZncr89ui5SxASptKlhCtTldPt5hIdXTYt/o44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eUNY+Ygg; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eUNY+Ygg"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-310a0668968so1332712a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562046; x=1749166846; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RqTWQjZVwQr5Q0PPr6wjVd4jvFiN8x0lNx4T8nW7sQg=;
        b=eUNY+YggGAjQetCZHVO4752louL7vowlv0AI2dbEwvtUfLDsIIEjsjFbSjX5sS9B3n
         cvOcj+S5e4GiM9Nb3YT9Sl7f5VBENgCWf7UXl6JAI/lGHqPPUaqE4SvdoeUlRUdA185H
         0tTd6s6gtflXODynZaCgnzmmtiw9LoZyLowLv3FCM9tzMcRHosAyKKhEMjiwoUaGqo2K
         wYcQsPeBRDiwEqsEI5N+0ouGAxonp5JeT6xYjoeTjzNHSsI7ZMb9uDcUJZA8Idox6ke9
         U73dmjrXkdE6PvsFx4UdtqKfAS0aFLSErOneFuManpp1ahN6SdfFS6ZhNUnH7G2tciae
         X5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562046; x=1749166846;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqTWQjZVwQr5Q0PPr6wjVd4jvFiN8x0lNx4T8nW7sQg=;
        b=rhjhFCg6lddYjW35BqWOqPTjArk6HNpBwsRzJANz1gFjNGDzyz7HNt0Z8atITEPWuN
         2kzyRCDwsEY3g0/iH3yvOYaM3ZnlKCEUdi1O4OrrZglQuGfPQtkM53PENRTz5Ze3uR3Q
         WPEZIjyHFkZbcVQ0M7tlDoR1tImYhmdAz5Ct0JsaoEvLKPQWfAIeapdrxIS5nOZbiFJX
         2oCfWm/hj5uknUh24hN4B9d2Sudw/A64mc2LEOZYyp1AqphmDxf0b0q+Q69mGjvBSIJz
         scePveZTPUU1pe79Zz4I5kTVNVC0A3Fg/NepjfqrUi8+6GBISubKGVWtOsLjpoRWH3y0
         SxXA==
X-Forwarded-Encrypted: i=1; AJvYcCUvfleGPydBipeALdMxf2qv7z/xgPN/Ie3P4XIs9lZTFo9LsZQJ3T9LW7tuSWsd/Icasbus/puhKre0/rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/IxifoTWBndi0ZOOiAWqZhE72e/YsMWJDYAB4kgmQm9M998C6
	U3u1403U1KJETV6Ten+dxT8K8kw2+3FTp7bIfGq6bJyEdX5/C1cyQQ3vX9Due1/2xK+a/meGCVZ
	6AMImBg==
X-Google-Smtp-Source: AGHT+IFs+u+XipOnoBwNAwXST/KXxFeLXiR93xuTQC778aXypTHx/u/r2nP7YeM5Z926+f7RnXMBFJJZ8OM=
X-Received: from pjbli5.prod.google.com ([2002:a17:90b:48c5:b0:311:e2ef:f61a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2786:b0:311:df4b:4b8b
 with SMTP id 98e67ed59e1d1-3124187bab8mr1726927a91.26.1748562046653; Thu, 29
 May 2025 16:40:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:40:03 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-19-seanjc@google.com>
Subject: [PATCH 18/28] KVM: x86: Rename msr_filter_changed() => recalc_msr_intercepts()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Rename msr_filter_changed() to recalc_msr_intercepts() and drop the
trampoline wrapper now that both SVM and VMX use a filter-agnostic recalc
helper to react to the new userspace filter.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h | 2 +-
 arch/x86/include/asm/kvm_host.h    | 2 +-
 arch/x86/kvm/svm/svm.c             | 8 +-------
 arch/x86/kvm/vmx/main.c            | 6 +++---
 arch/x86/kvm/vmx/vmx.c             | 7 +------
 arch/x86/kvm/vmx/x86_ops.h         | 2 +-
 arch/x86/kvm/x86.c                 | 8 +++++++-
 7 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 8d50e3e0a19b..19a6735d6dd8 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -139,7 +139,7 @@ KVM_X86_OP(check_emulate_instruction)
 KVM_X86_OP(apic_init_signal_blocked)
 KVM_X86_OP_OPTIONAL(enable_l2_tlb_flush)
 KVM_X86_OP_OPTIONAL(migrate_timers)
-KVM_X86_OP(msr_filter_changed)
+KVM_X86_OP(recalc_msr_intercepts)
 KVM_X86_OP(complete_emulated_msr)
 KVM_X86_OP(vcpu_deliver_sipi_vector)
 KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 330cdcbed1a6..89a626e5b80f 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1885,7 +1885,7 @@ struct kvm_x86_ops {
 	int (*enable_l2_tlb_flush)(struct kvm_vcpu *vcpu);
 
 	void (*migrate_timers)(struct kvm_vcpu *vcpu);
-	void (*msr_filter_changed)(struct kvm_vcpu *vcpu);
+	void (*recalc_msr_intercepts)(struct kvm_vcpu *vcpu);
 	int (*complete_emulated_msr)(struct kvm_vcpu *vcpu, int err);
 
 	void (*vcpu_deliver_sipi_vector)(struct kvm_vcpu *vcpu, u8 vector);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 685d9fd4a4e1..a9a801bcc6d0 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -900,11 +900,6 @@ static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	 */
 }
 
-static void svm_msr_filter_changed(struct kvm_vcpu *vcpu)
-{
-	svm_recalc_msr_intercepts(vcpu);
-}
-
 void svm_copy_lbrs(struct vmcb *to_vmcb, struct vmcb *from_vmcb)
 {
 	to_vmcb->save.dbgctl		= from_vmcb->save.dbgctl;
@@ -933,7 +928,6 @@ static void svm_disable_lbrv(struct kvm_vcpu *vcpu)
 	struct vcpu_svm *svm = to_svm(vcpu);
 
 	KVM_BUG_ON(sev_es_guest(vcpu->kvm), vcpu->kvm);
-
 	svm->vmcb->control.virt_ext &= ~LBR_CTL_ENABLE_MASK;
 	svm_recalc_lbr_msr_intercepts(vcpu);
 
@@ -5231,7 +5225,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.apic_init_signal_blocked = svm_apic_init_signal_blocked,
 
-	.msr_filter_changed = svm_msr_filter_changed,
+	.recalc_msr_intercepts = svm_recalc_msr_intercepts,
 	.complete_emulated_msr = svm_complete_emulated_msr,
 
 	.vcpu_deliver_sipi_vector = svm_vcpu_deliver_sipi_vector,
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index d1e02e567b57..b3c58731a2f5 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -220,7 +220,7 @@ static int vt_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	return vmx_get_msr(vcpu, msr_info);
 }
 
-static void vt_msr_filter_changed(struct kvm_vcpu *vcpu)
+static void vt_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	/*
 	 * TDX doesn't allow VMM to configure interception of MSR accesses.
@@ -231,7 +231,7 @@ static void vt_msr_filter_changed(struct kvm_vcpu *vcpu)
 	if (is_td_vcpu(vcpu))
 		return;
 
-	vmx_msr_filter_changed(vcpu);
+	vmx_recalc_msr_intercepts(vcpu);
 }
 
 static int vt_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
@@ -1034,7 +1034,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.apic_init_signal_blocked = vt_op(apic_init_signal_blocked),
 	.migrate_timers = vmx_migrate_timers,
 
-	.msr_filter_changed = vt_op(msr_filter_changed),
+	.recalc_msr_intercepts = vt_op(recalc_msr_intercepts),
 	.complete_emulated_msr = vt_op(complete_emulated_msr),
 
 	.vcpu_deliver_sipi_vector = kvm_vcpu_deliver_sipi_vector,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6ffa2b2b85ce..826510a0b5bb 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4074,7 +4074,7 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 	}
 }
 
-static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
+void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	if (!cpu_has_vmx_msr_bitmap())
 		return;
@@ -4124,11 +4124,6 @@ static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	 */
 }
 
-void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
-{
-	vmx_recalc_msr_intercepts(vcpu);
-}
-
 static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 						int vector)
 {
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index b4596f651232..34c6e683e321 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -52,7 +52,7 @@ void vmx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
 			   int trig_mode, int vector);
 void vmx_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu);
 bool vmx_has_emulated_msr(struct kvm *kvm, u32 index);
-void vmx_msr_filter_changed(struct kvm_vcpu *vcpu);
+void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu);
 void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu);
 void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu);
 int vmx_get_feature_msr(u32 msr, u64 *data);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f9f798f286ce..6da6be8ff5fc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10924,8 +10924,14 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 			kvm_vcpu_update_apicv(vcpu);
 		if (kvm_check_request(KVM_REQ_APF_READY, vcpu))
 			kvm_check_async_pf_completion(vcpu);
+
+		/*
+		 * Recalc MSR intercepts as userspace may want to intercept
+		 * accesses to MSRs that KVM would otherwise pass through to
+		 * the guest.
+		 */
 		if (kvm_check_request(KVM_REQ_MSR_FILTER_CHANGED, vcpu))
-			kvm_x86_call(msr_filter_changed)(vcpu);
+			kvm_x86_call(recalc_msr_intercepts)(vcpu);
 
 		if (kvm_check_request(KVM_REQ_UPDATE_CPU_DIRTY_LOGGING, vcpu))
 			kvm_x86_call(update_cpu_dirty_logging)(vcpu);
-- 
2.49.0.1204.g71687c7c1d-goog

