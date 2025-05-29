Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C398B2609DD
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562040; cv=none; b=FwNhi0fc/S8QuFLFe31xiitjOxqRB9FPBaSNIDfaGx7dCcZ5X9494NBnFuRdXF/EAPyuIIZPIY3bz+PsjZvUvqyjKV82b1cI4MpA9dd+lHWPYs5tp/iKw3FXUPcT+ndAIyWRQug/NRNov+dW3iZ5ROLdth/W+eS7qXI6ZMSvI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562040; c=relaxed/simple;
	bh=GnxNGrGbjnfL5nA3UyIl/gBsvF/K8aMVtAMHDs16GgU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mlTnPPSxyw3Y4nRQkSa7pv+7gbeRWuVZ7lR9b2dwpC6+ZRpoyHUTjkJpG+KhlzNomRWMACGcQX5KjPqkr5RcqfluibBuelQB4ixct1uD+sYyqU8EVknsjwFtrgHoC9E0BI533bjcHpzyVtzLkf7JEsSj+EsSTPzhp8Xaogyq3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ueCChZQ5; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ueCChZQ5"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso1368841a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562038; x=1749166838; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/IhIB5gor13aAWenha6wShIUxZiCYleN55IHZ/J9+eU=;
        b=ueCChZQ5Z3aJx1AO2l9tNGdzGiUPOXO0eFuTCDWakpwPkWePdLMYevEoXa9IhfMo8k
         HzdpJsJNd25Vr07MkufzRgJHRcjfscc8CIY8BebAKBts1E/Eon/ImiNrqDy21/PmovcE
         eRQFw6cgtqSTGiYp7b1DMokc+SmoogCdIpFxf+9SlJV5/88v8Nt9mLjJLOzut+LVNjYZ
         +WcbtQQ9LY1KxlNPW0ErL0eBJ0XpwIL/4n796CC+ip/CkNLpbU2BE/hXureq6Z4fc1W9
         3GhlOuu3O7uOm/AS4EL1eybrLDqdZmRDdUVjYE4Myfi1omT2jLf+XdL4U/aiaPZqV+0a
         lx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562038; x=1749166838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IhIB5gor13aAWenha6wShIUxZiCYleN55IHZ/J9+eU=;
        b=achzaw8GsnyPcJv6xodpwSQcsgQkcErHpkAApZXFTZ7kxm6K3IWSRF5+eYmHd95wvb
         TVMkle6RwxDCjLt/2etGDgqTIvYA6GjSk9A+XGAAfyh7VVFNisRN8OMvK5fIKtON2L2A
         EC5lYOwyggY52ri2KM+62SMfXe1EU5bG7O8L4AHIIyhBeXexnetnmKAX3ZPWOoZFJlXi
         zEeUOAWP5qS6+r3ZZVqnN6s0g5rPbA6y6YfUxohNn53CvoqZG+Tw6wq2G/Kr+KtI/GhH
         98PaLeUbro92THxplYxwNn+QKANkilPc0X2V8ART2LOtkW5LQagVdLmudlmWBhIVNFHT
         XShA==
X-Forwarded-Encrypted: i=1; AJvYcCWFDBVcHIJiIjH3Y0EYhmOMzAjRDOstFxQbOslWsWQN4pO7LnaTR1x+5NPBtnTqjIXhNYvZweq7Ym1pNYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFpZjTtDJuPg7a497XgyVXvDOKVk36FciWaVCEYkdC1oxZYIsJ
	o15lS3lFXx0/b5OMNOgkeXzfvMSOVaIq7D/TEVaNUvK2R13RcnCmuu7TM3Q3G+2JI5i0+/n5HMd
	qU7rRBQ==
X-Google-Smtp-Source: AGHT+IFYE6QZgxnJog3zqb9GuS0hWNogIixhuCyNKqy3IlWubD5Z1+DlZeWI/osjf7l+9JqPdaBV7JgdcbU=
X-Received: from pjbsz6.prod.google.com ([2002:a17:90b:2d46:b0:310:f76d:7b8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3809:b0:312:18e:d930
 with SMTP id 98e67ed59e1d1-3124173be5fmr1682635a91.19.1748562038082; Thu, 29
 May 2025 16:40:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:39:58 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-14-seanjc@google.com>
Subject: [PATCH 13/28] KVM: SVM: Pass through GHCB MSR if and only if VM is an
 SEV-ES guest
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Disable interception of the GHCB MSR if and only if the VM is an SEV-ES
guest.  While the exact behavior is completely undocumented in the APM,
common sense and testing on SEV-ES capable CPUs says that accesses to the
GHCB from non-SEV-ES guests will #GP.  I.e. from the guest's perspective,
no functional change intended.

Fixes: 376c6d285017 ("KVM: SVM: Provide support for SEV-ES vCPU creation/loading")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 3 ++-
 arch/x86/kvm/svm/svm.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index bb0ec029b3d4..694d38a2327c 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4512,7 +4512,8 @@ static void sev_es_init_vmcb(struct vcpu_svm *svm)
 	/* Can't intercept XSETBV, HV can't modify XCR0 directly */
 	svm_clr_intercept(svm, INTERCEPT_XSETBV);
 
-	/* Clear intercepts on selected MSRs */
+	/* Clear intercepts on MSRs that are context switched by hardware. */
+	svm_disable_intercept_for_msr(vcpu, MSR_AMD64_SEV_ES_GHCB, MSR_TYPE_RW);
 	svm_disable_intercept_for_msr(vcpu, MSR_EFER, MSR_TYPE_RW);
 	svm_disable_intercept_for_msr(vcpu, MSR_IA32_CR_PAT, MSR_TYPE_RW);
 }
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 56460413eca6..fa1a1b9b2d59 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -110,7 +110,7 @@ static const struct svm_direct_access_msrs {
 	{ .index = MSR_IA32_XSS,			.always = false },
 	{ .index = MSR_EFER,				.always = false },
 	{ .index = MSR_IA32_CR_PAT,			.always = false },
-	{ .index = MSR_AMD64_SEV_ES_GHCB,		.always = true  },
+	{ .index = MSR_AMD64_SEV_ES_GHCB,		.always = false },
 	{ .index = MSR_TSC_AUX,				.always = false },
 	{ .index = X2APIC_MSR(APIC_ID),			.always = false },
 	{ .index = X2APIC_MSR(APIC_LVR),		.always = false },
-- 
2.49.0.1204.g71687c7c1d-goog

