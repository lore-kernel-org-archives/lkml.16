Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5512BFC7B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596280; cv=none; b=hpSAZeMEKHe38x/iPJ9dRWZ3LnlT989SO2soJ+ITQOH9FMu9PMUj3+a0WSqkj60xquxoqVVpkrsc6r1D93pBHlRl1dghiIUNnyp+KeBcqCjyjUw0YPnR4icW/dTSYc1JdzBZTSKMXTcM8s0JZ5yDr4WGAttb0YEGuSU/6h+z3rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596280; c=relaxed/simple;
	bh=aqHJfbZLPtODrVTjO4zRfMd+2DV4KUbMHJWoB0C6XsM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BQDXJo6aEtNkOmAIsKXNapJEmAlukZcn6iMuvvv35eKVqHA+drxu4nOXwTsQf/O7JZXdKIIR3fUYrR2WjrJg2W7iFlIcTbJ2aqiuwD4L0auM85Xq2beR+aARuSbET+9cv7/6u3GC3gLyKkvOFgRs5E6iCpkgy43XDjr14BuADJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RkssztJ3; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RkssztJ3"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311d670ad35so5526864a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749596278; x=1750201078; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gkmdnzpn3mvnv+uvd/aCNzLTXCyaGIyTZUWMF+Vodeo=;
        b=RkssztJ3L6SF5fgfSLnok9wVMuZ83UTEQLmlsfroqds34YeE83zKdJaeTK+zycZjda
         ngF/iwpyzcW5RmgR5lfTyzvq/0KK9+xf2GP+zSiYO7yD0bm/loRQgnkdiJfmUGNRKavp
         hT6SR76dtxDZ9qllnvgBvr12qQePIg5X59CFC6mP/VBFBzgvcg0oLPcMI96VqXYlLt1o
         Sev1Uj3ASzgh01BQLYMW35iGgpcXWpUEChTdgQrr631EUfZyPgdXEZjX9J1c7sGV/syv
         d8Epx9J5gHRNHUMPnLU/40btKHYl+WqKjnhPnfJb1/XoBMAV0YmN4IdqvqH+/sZYGyVo
         J89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596278; x=1750201078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkmdnzpn3mvnv+uvd/aCNzLTXCyaGIyTZUWMF+Vodeo=;
        b=shTggc+8yT7xSRFM+ksjBknzGjqmLMpHOKCoyQYXCXuGq0oeucyJ+xsjchwV4y6IzY
         afOb5j7vVTArJwLSEihTRFjSgy3rYTxIGALwM7AJ8SfF10OI4p2tSRTTu2haqAOHvSBS
         1APhz3woaDcIH658Uouf598U905faQrMk2PjeCdpmFk3fX/xGhlsw14/qNg896qCgIFC
         c8jvjwVZj6aOx2xxGvsIvFS3w3oM1DcR0a/1muIZe7RwmAt1tldB6GtTOzFG0nPy2bYd
         NKcEjLruEyPYyAXGAJZfbllHBvdDTLz+MOHBJPGLLrcTsNMYLekWkYktBX8byrYFOKV7
         CTkA==
X-Forwarded-Encrypted: i=1; AJvYcCXVxi3Tgezx2Yj+rSd0OyKxr7ldusxXEvLTpMweCjX1wRF+PbNgTHV323OqE4HP+08IrtBTObFhhSmFLbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhrlOnCQbOB+mR2pIXQEIsC7C1Arlenn6YeL6LkxFjIApwM25
	3m4xYyIWU1JznsPkdNMsw+Brt+ll350wRRXbY7ljErwgxvEOsHss44ew1Bx6UgNYDkKluyebk5V
	N47aKxQ==
X-Google-Smtp-Source: AGHT+IGr/29RZ42F3g4tbpBjge4TwOrxS+PL10a000HGGRKjcDL8ZlIFpZ/pWHRzYDxcCV+0R/5GQAbbUYg=
X-Received: from pjbsu16.prod.google.com ([2002:a17:90b:5350:b0:312:1af5:98c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5627:b0:312:959:dc42
 with SMTP id 98e67ed59e1d1-313af10ab0dmr1900041a91.11.1749596278165; Tue, 10
 Jun 2025 15:57:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 15:57:15 -0700
In-Reply-To: <20250610225737.156318-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610225737.156318-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610225737.156318-11-seanjc@google.com>
Subject: [PATCH v2 10/32] KVM: nSVM: Use dedicated array of MSRPM offsets to
 merge L0 and L1 bitmaps
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Use a dedicated array of MSRPM offsets to merge L0 and L1 bitmaps, i.e. to
merge KVM's vmcb01 bitmap with L1's vmcb12 bitmap.  This will eventually
allow for the removal of direct_access_msrs, as the only path where
tracking the offsets is truly justified is the merge for nested SVM, where
merging in chunks is an easy way to batch uaccess reads/writes.

Opportunistically omit the x2APIC MSRs from the merge-specific array
instead of filtering them out at runtime.

Note, disabling interception of DEBUGCTL, XSS, EFER, PAT, GHCB, and
TSC_AUX is mutually exclusive with nested virtualization, as KVM passes
through those MSRs only for SEV-ES guests, and KVM doesn't support nested
virtualization for SEV+ guests.  Defer removing those MSRs to a future
cleanup in order to make this refactoring as benign as possible.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 83 +++++++++++++++++++++++++++++++++------
 arch/x86/kvm/svm/svm.c    |  4 ++
 arch/x86/kvm/svm/svm.h    |  2 +
 3 files changed, 78 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 89a77f0f1cc8..666469e11602 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -184,6 +184,75 @@ void recalc_intercepts(struct vcpu_svm *svm)
 	}
 }
 
+/*
+ * This array (and its actual size) holds the set of offsets (indexing by chunk
+ * size) to process when merging vmcb12's MSRPM with vmcb01's MSRPM.  Note, the
+ * set of MSRs for which interception is disabled in vmcb01 is per-vCPU, e.g.
+ * based on CPUID features.  This array only tracks MSRs that *might* be passed
+ * through to the guest.
+ *
+ * Hardcode the capacity of the array based on the maximum number of _offsets_.
+ * MSRs are batched together, so there are fewer offsets than MSRs.
+ */
+static int nested_svm_msrpm_merge_offsets[9] __ro_after_init;
+static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
+
+int __init nested_svm_init_msrpm_merge_offsets(void)
+{
+	static const u32 merge_msrs[] __initconst = {
+		MSR_STAR,
+		MSR_IA32_SYSENTER_CS,
+		MSR_IA32_SYSENTER_EIP,
+		MSR_IA32_SYSENTER_ESP,
+	#ifdef CONFIG_X86_64
+		MSR_GS_BASE,
+		MSR_FS_BASE,
+		MSR_KERNEL_GS_BASE,
+		MSR_LSTAR,
+		MSR_CSTAR,
+		MSR_SYSCALL_MASK,
+	#endif
+		MSR_IA32_SPEC_CTRL,
+		MSR_IA32_PRED_CMD,
+		MSR_IA32_FLUSH_CMD,
+		MSR_IA32_LASTBRANCHFROMIP,
+		MSR_IA32_LASTBRANCHTOIP,
+		MSR_IA32_LASTINTFROMIP,
+		MSR_IA32_LASTINTTOIP,
+
+		MSR_IA32_DEBUGCTLMSR,
+		MSR_IA32_XSS,
+		MSR_EFER,
+		MSR_IA32_CR_PAT,
+		MSR_AMD64_SEV_ES_GHCB,
+		MSR_TSC_AUX,
+	};
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(merge_msrs); i++) {
+		u32 offset = svm_msrpm_offset(merge_msrs[i]);
+
+		if (WARN_ON(offset == MSR_INVALID))
+			return -EIO;
+
+		for (j = 0; j < nested_svm_nr_msrpm_merge_offsets; j++) {
+			if (nested_svm_msrpm_merge_offsets[j] == offset)
+				break;
+		}
+
+		if (j < nested_svm_nr_msrpm_merge_offsets)
+			continue;
+
+		if (WARN_ON(j >= ARRAY_SIZE(nested_svm_msrpm_merge_offsets)))
+			return -EIO;
+
+		nested_svm_msrpm_merge_offsets[j] = offset;
+		nested_svm_nr_msrpm_merge_offsets++;
+	}
+
+	return 0;
+}
+
 /*
  * Merge L0's (KVM) and L1's (Nested VMCB) MSR permission bitmaps. The function
  * is optimized in that it only merges the parts where KVM MSR permission bitmap
@@ -216,19 +285,11 @@ static bool nested_svm_merge_msrpm(struct kvm_vcpu *vcpu)
 	if (!(vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_MSR_PROT)))
 		return true;
 
-	for (i = 0; i < MSRPM_OFFSETS; i++) {
-		u32 value, p;
+	for (i = 0; i < nested_svm_nr_msrpm_merge_offsets; i++) {
+		const int p = nested_svm_msrpm_merge_offsets[i];
+		u32 value;
 		u64 offset;
 
-		if (msrpm_offsets[i] == 0xffffffff)
-			break;
-
-		p      = msrpm_offsets[i];
-
-		/* x2apic msrs are intercepted always for the nested guest */
-		if (is_x2apic_msrpm_offset(p))
-			continue;
-
 		offset = svm->nested.ctl.msrpm_base_pa + (p * 4);
 
 		if (kvm_vcpu_read_guest(vcpu, offset, &value, 4))
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a683602cae22..1ee936b8a6d0 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5543,6 +5543,10 @@ static __init int svm_hardware_setup(void)
 	if (nested) {
 		pr_info("Nested Virtualization enabled\n");
 		kvm_enable_efer_bits(EFER_SVME | EFER_LMSLE);
+
+		r = nested_svm_init_msrpm_merge_offsets();
+		if (r)
+			return r;
 	}
 
 	/*
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 086a8c8aae86..9f750b2399e9 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -682,6 +682,8 @@ static inline bool nested_exit_on_nmi(struct vcpu_svm *svm)
 	return vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_NMI);
 }
 
+int __init nested_svm_init_msrpm_merge_offsets(void);
+
 int enter_svm_guest_mode(struct kvm_vcpu *vcpu,
 			 u64 vmcb_gpa, struct vmcb *vmcb12, bool from_vmrun);
 void svm_leave_nested(struct kvm_vcpu *vcpu);
-- 
2.50.0.rc0.642.g800a2b2222-goog

