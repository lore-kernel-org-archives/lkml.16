Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85A2620C6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562042; cv=none; b=SFV0WapnCSksyzzA24AXLk0w2r/IzAdFmdDCqaM6g7Efg+PxdFE4Wy8KW+aWYo+SqvTLEoteseJzeddrD6dQ9wB7zmc/S0GQmnUwmkurK7WQjL19phIocyVtwk4523q7AFr6BlRWKjPzxx9ruw8qnTEAn7C5s7k7smMIWYFFz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562042; c=relaxed/simple;
	bh=LtoXGWoOg0euriPSpqBJEc/HKAJCOXoqsaNVe3ZZUzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q80NOZ+UXMcTBmahXILnjc7WdQ3UZ8wTDKjBnyx/Uj0sX9R21/qOuaulu0qq9v3UbemWiTwqOorLQgFeUV1nchGxW0/xPdo3YE+txuxVyiThNRsX5XW+H8n4i8Vq8SXO79piEIe2gKfyx2s/DpTzDWE4+KmraGZprx1iO+EdOpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Irs/4Ssp; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Irs/4Ssp"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so1194408a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562040; x=1749166840; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vI2VktldV9nwipf7c9FUAsc3yJgqz1fVa0a4NeQnFPc=;
        b=Irs/4Ssp2PXwEm1VZ/8hdeaMDMVpyBRd26LrQnFcw7YNMUaCNISZoBSmAGxuQK63hW
         xiNXFix580+LHJNiQVw/vDNgutqm319EDEtME8xNmpgyQ6K4brOVPoJU+S7pcD+j5oF6
         b4KBqsXZvdhcC08fiGey518vsknspOZwYHdizOQLYh+FeR5WiGz7xUOoD5tUuMzDH9rT
         aSv8qddRi6xJzm4tJUraB9lurvdPdRP2K49DFwJw2XbY3swdzP+dguGkLLaG1qiN8iNR
         K/hvijpFprvdPKGhjwEYX8Wj9DIGoeyPpXdnO8pyH1B1ZdbH/eP+uXF4s/TO8W01scXZ
         jSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562040; x=1749166840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vI2VktldV9nwipf7c9FUAsc3yJgqz1fVa0a4NeQnFPc=;
        b=iIPwKV+EICBrmtmCFFfa+YTSzBnCFJByyIPDubzEZi/X5nf9snbILjuc+PkGKNYRTK
         NQhIrwndQqL8zUgE8RMH8VnhskRP7y54Ax5+kDNJ4It4C3avEgoVyu9iHOKBW+B+XR4S
         NJs4DsXeAwoBfS/0GA50eZTo1eE1HzYlmxUvDVDwbenKtP9ENd7AmqNPGfkZnykmSJNb
         F5BZy36Gzz/xWLe2tjBWNNEaRWQNxlD1cMwXForcwD9KqxhriUY1+D8gM1Tnf3qzBkig
         TIeVhvAdHuJ3QMIKfKsps3nBW6ebF4dgrjqc6t5VGaI7lVAffi+24kuwlSOKVaeL5Yi6
         bZ9w==
X-Forwarded-Encrypted: i=1; AJvYcCV2VFU/DJmB/3lHHxEC+Rms/kzBUevceIBE/A5Kc45tkikFCyvconPkhwZ4izCOAWeNuvkg+OQD0Q+XBfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRj6j/S3DjwH/rhMMpipa8ZqfrkAxWsFoX2RllSdFv9oLi/jN/
	mWCBvW00DyPg1OVzHYVmjG5H6Psq292Y4rEJBCRPuw+Mm1YrlES2F0kSFQ1dKWxsLz3claT/rR7
	jL1UJcw==
X-Google-Smtp-Source: AGHT+IGYwQG/wCJYbsKMwKB1JDdZvJY7G6hzP9daC/TdbPIwUg0z2A1D3/ywkC+Gt35LCiCmAerUgczkUHU=
X-Received: from pjbcz13.prod.google.com ([2002:a17:90a:d44d:b0:30a:31eb:ec8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:41:b0:312:26d9:d5bc
 with SMTP id 98e67ed59e1d1-31241639c78mr2181320a91.15.1748562039701; Thu, 29
 May 2025 16:40:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:39:59 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-15-seanjc@google.com>
Subject: [PATCH 14/28] KVM: SVM: Drop "always" flag from list of possible
 passthrough MSRs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop the "always" flag from the array of possible passthrough MSRs, and
instead manually initialize the permissions for the handful of MSRs that
KVM passes through by default.  In addition to cutting down on boilerplate
copy+paste code and eliminating a misleading flag (the MSRs aren't always
passed through, e.g. thanks to MSR filters), this will allow for removing
the direct_access_msrs array entirely.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 124 ++++++++++++++++++++---------------------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index fa1a1b9b2d59..e0fedd23e150 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -83,51 +83,48 @@ static DEFINE_PER_CPU(u64, current_tsc_ratio);
 
 #define X2APIC_MSR(x)	(APIC_BASE_MSR + (x >> 4))
 
-static const struct svm_direct_access_msrs {
-	u32 index;   /* Index of the MSR */
-	bool always; /* True if intercept is initially cleared */
-} direct_access_msrs[] = {
-	{ .index = MSR_STAR,				.always = true  },
-	{ .index = MSR_IA32_SYSENTER_CS,		.always = true  },
-	{ .index = MSR_IA32_SYSENTER_EIP,		.always = false },
-	{ .index = MSR_IA32_SYSENTER_ESP,		.always = false },
+static const u32 direct_access_msrs[] = {
+	MSR_STAR,
+	MSR_IA32_SYSENTER_CS,
+	MSR_IA32_SYSENTER_EIP,
+	MSR_IA32_SYSENTER_ESP,
 #ifdef CONFIG_X86_64
-	{ .index = MSR_GS_BASE,				.always = true  },
-	{ .index = MSR_FS_BASE,				.always = true  },
-	{ .index = MSR_KERNEL_GS_BASE,			.always = true  },
-	{ .index = MSR_LSTAR,				.always = true  },
-	{ .index = MSR_CSTAR,				.always = true  },
-	{ .index = MSR_SYSCALL_MASK,			.always = true  },
+	MSR_GS_BASE,
+	MSR_FS_BASE,
+	MSR_KERNEL_GS_BASE,
+	MSR_LSTAR,
+	MSR_CSTAR,
+	MSR_SYSCALL_MASK,
 #endif
-	{ .index = MSR_IA32_SPEC_CTRL,			.always = false },
-	{ .index = MSR_IA32_PRED_CMD,			.always = false },
-	{ .index = MSR_IA32_FLUSH_CMD,			.always = false },
-	{ .index = MSR_IA32_DEBUGCTLMSR,		.always = false },
-	{ .index = MSR_IA32_LASTBRANCHFROMIP,		.always = false },
-	{ .index = MSR_IA32_LASTBRANCHTOIP,		.always = false },
-	{ .index = MSR_IA32_LASTINTFROMIP,		.always = false },
-	{ .index = MSR_IA32_LASTINTTOIP,		.always = false },
-	{ .index = MSR_IA32_XSS,			.always = false },
-	{ .index = MSR_EFER,				.always = false },
-	{ .index = MSR_IA32_CR_PAT,			.always = false },
-	{ .index = MSR_AMD64_SEV_ES_GHCB,		.always = false },
-	{ .index = MSR_TSC_AUX,				.always = false },
-	{ .index = X2APIC_MSR(APIC_ID),			.always = false },
-	{ .index = X2APIC_MSR(APIC_LVR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_TASKPRI),		.always = false },
-	{ .index = X2APIC_MSR(APIC_ARBPRI),		.always = false },
-	{ .index = X2APIC_MSR(APIC_PROCPRI),		.always = false },
-	{ .index = X2APIC_MSR(APIC_EOI),		.always = false },
-	{ .index = X2APIC_MSR(APIC_RRR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_LDR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_DFR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_SPIV),		.always = false },
-	{ .index = X2APIC_MSR(APIC_ISR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_TMR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_IRR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_ESR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_ICR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_ICR2),		.always = false },
+	MSR_IA32_SPEC_CTRL,
+	MSR_IA32_PRED_CMD,
+	MSR_IA32_FLUSH_CMD,
+	MSR_IA32_DEBUGCTLMSR,
+	MSR_IA32_LASTBRANCHFROMIP,
+	MSR_IA32_LASTBRANCHTOIP,
+	MSR_IA32_LASTINTFROMIP,
+	MSR_IA32_LASTINTTOIP,
+	MSR_IA32_XSS,
+	MSR_EFER,
+	MSR_IA32_CR_PAT,
+	MSR_AMD64_SEV_ES_GHCB,
+	MSR_TSC_AUX,
+	X2APIC_MSR(APIC_ID),
+	X2APIC_MSR(APIC_LVR),
+	X2APIC_MSR(APIC_TASKPRI),
+	X2APIC_MSR(APIC_ARBPRI),
+	X2APIC_MSR(APIC_PROCPRI),
+	X2APIC_MSR(APIC_EOI),
+	X2APIC_MSR(APIC_RRR),
+	X2APIC_MSR(APIC_LDR),
+	X2APIC_MSR(APIC_DFR),
+	X2APIC_MSR(APIC_SPIV),
+	X2APIC_MSR(APIC_ISR),
+	X2APIC_MSR(APIC_TMR),
+	X2APIC_MSR(APIC_IRR),
+	X2APIC_MSR(APIC_ESR),
+	X2APIC_MSR(APIC_ICR),
+	X2APIC_MSR(APIC_ICR2),
 
 	/*
 	 * Note:
@@ -136,14 +133,14 @@ static const struct svm_direct_access_msrs {
 	 * the AVIC hardware would generate GP fault. Therefore, always
 	 * intercept the MSR 0x832, and do not setup direct_access_msr.
 	 */
-	{ .index = X2APIC_MSR(APIC_LVTTHMR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_LVTPC),		.always = false },
-	{ .index = X2APIC_MSR(APIC_LVT0),		.always = false },
-	{ .index = X2APIC_MSR(APIC_LVT1),		.always = false },
-	{ .index = X2APIC_MSR(APIC_LVTERR),		.always = false },
-	{ .index = X2APIC_MSR(APIC_TMICT),		.always = false },
-	{ .index = X2APIC_MSR(APIC_TMCCT),		.always = false },
-	{ .index = X2APIC_MSR(APIC_TDCR),		.always = false },
+	X2APIC_MSR(APIC_LVTTHMR),
+	X2APIC_MSR(APIC_LVTPC),
+	X2APIC_MSR(APIC_LVT0),
+	X2APIC_MSR(APIC_LVT1),
+	X2APIC_MSR(APIC_LVTERR),
+	X2APIC_MSR(APIC_TMICT),
+	X2APIC_MSR(APIC_TMCCT),
+	X2APIC_MSR(APIC_TDCR),
 };
 
 static_assert(ARRAY_SIZE(direct_access_msrs) ==
@@ -771,7 +768,7 @@ static int direct_access_msr_slot(u32 msr)
 	u32 i;
 
 	for (i = 0; i < ARRAY_SIZE(direct_access_msrs); i++) {
-		if (direct_access_msrs[i].index == msr)
+		if (direct_access_msrs[i] == msr)
 			return i;
 	}
 
@@ -939,14 +936,17 @@ u32 *svm_vcpu_alloc_msrpm(void)
 
 static void svm_vcpu_init_msrpm(struct kvm_vcpu *vcpu)
 {
-	int i;
+	svm_disable_intercept_for_msr(vcpu, MSR_STAR, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_IA32_SYSENTER_CS, MSR_TYPE_RW);
 
-	for (i = 0; i < ARRAY_SIZE(direct_access_msrs); i++) {
-		if (!direct_access_msrs[i].always)
-			continue;
-		svm_disable_intercept_for_msr(vcpu, direct_access_msrs[i].index,
-					      MSR_TYPE_RW);
-	}
+#ifdef CONFIG_X86_64
+	svm_disable_intercept_for_msr(vcpu, MSR_GS_BASE, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_FS_BASE, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_LSTAR, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_CSTAR, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_SYSCALL_MASK, MSR_TYPE_RW);
+#endif
 }
 
 void svm_set_x2apic_msr_interception(struct vcpu_svm *svm, bool intercept)
@@ -960,7 +960,7 @@ void svm_set_x2apic_msr_interception(struct vcpu_svm *svm, bool intercept)
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(direct_access_msrs); i++) {
-		int index = direct_access_msrs[i].index;
+		int index = direct_access_msrs[i];
 
 		if ((index < APIC_BASE_MSR) ||
 		    (index > APIC_BASE_MSR + 0xff))
@@ -988,7 +988,7 @@ static void svm_msr_filter_changed(struct kvm_vcpu *vcpu)
 	 * back in sync after this.
 	 */
 	for (i = 0; i < ARRAY_SIZE(direct_access_msrs); i++) {
-		u32 msr = direct_access_msrs[i].index;
+		u32 msr = direct_access_msrs[i];
 		u32 read = test_bit(i, svm->shadow_msr_intercept.read);
 		u32 write = test_bit(i, svm->shadow_msr_intercept.write);
 
@@ -1028,7 +1028,7 @@ static __init int init_msrpm_offsets(void)
 	for (i = 0; i < ARRAY_SIZE(direct_access_msrs); i++) {
 		u32 offset;
 
-		offset = svm_msrpm_offset(direct_access_msrs[i].index);
+		offset = svm_msrpm_offset(direct_access_msrs[i]);
 		if (WARN_ON(offset == MSR_INVALID))
 			return -EIO;
 
-- 
2.49.0.1204.g71687c7c1d-goog

