Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581002E62BE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596301; cv=none; b=rrX6EG1dpbCWoUeGO5QqJZSvAE8G/y/VdsQlxXiR1YqFbWtg0t22HgzYjdzwV4Yf9lRtmzP1eRBzZ0PwdfmdFH2pMA5VN6QMWFh+718wQtrV1/x7yahpGf3yZvsabjlzr6keKt+7YCA9YLk87ips1+JSfOgbFpSqC6L/ZL44KLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596301; c=relaxed/simple;
	bh=f/EAWvczmGlis0EJoXnBgZhe5pWyfnEdUlP3dM2tmoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jCFQ78psTG2Xez8FfCl8Uol5Ub2VXaePX6GWyTuZ45lEJCdEK3yMzjNDb1pOYSE4Ki8ZULTXJH8ewKcE4v3cJvOrpovJCDZDwkbeVaTK5bXiaJiAQQI7Neu4Gv4b72Fm7kAhANBCrV4yP45eEsZST9/KtU8u+qodHoZ/HhF3yOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZbxzrb0; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZbxzrb0"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3138e671316so206066a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749596300; x=1750201100; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3aERknNfpUpnNzDb0X+4tA2Uq/yHJSwlZpcjPIafQX0=;
        b=yZbxzrb0adQtaSiov8OAj4ZH0bk7vrG2GiPM5mvtug6hiviaIj0t+51NVnU1VcoP2c
         zF72wdWL5Lv32ogv50+7gKbnEj2czJyHT2ZMYa7be+MJAoEQ5CuAmxTHrzcSEtNgjpZe
         BHY2aJuFQmKSfsd690Ph69LWHUc/Mpntc42iJc7VohL9HiA/Gs2DtgE+UsgpJRLuM95C
         m9WvD39M64ocFbnvZg9jlzvEe7oFx/qSYWuwmS3wuC8pUsszFJWEV4GBWtviACiwpwUX
         8Q7r9FoCx7QURzEs3LU/qCs4xfqckRZzQWyUppOV8WaZepUmu0z0oo2w0n38BwlEwND/
         /7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596300; x=1750201100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aERknNfpUpnNzDb0X+4tA2Uq/yHJSwlZpcjPIafQX0=;
        b=mPk8WVoAQzPNXaf7JmQwxGwwkS8lm+y5Fhmxc5zEx7IR/SXwigMj+tfYRJKWAu49n+
         Vt0JjO5dtU7AHQYuB6KYWSKm7iRWNYMM4czqX/CdQ2F8AAjDF4AhSt/Xmi9k/C75t+Zo
         232dg2Aq10LF0XxiuBZCio3IPxCQk3XKWWKOVRbfuZm0vOLaii+6V1OsSS1fk2IUYLXx
         e5dfW8EDV7+IFSuUoc97ptQjXXWH2wAxRR1icFF1gJZz3X7efLsAbeFiLMnYpxqDshfH
         4BoCxiHkrTDaud0ahLsnIbtHSqLN7CHynL014Q8TxrtEIkm6mi95kSTBwieW2WLA7RHS
         pGqg==
X-Forwarded-Encrypted: i=1; AJvYcCUzkBYc6pOweMtNrHwNparAKECvKnf0Af7W7zJEN1M/cQ9Cc427sRSDa0T+TRHxhSEM7YwXvi1XtQFQw60=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCV/MslgKBCm1hU/KCGyerG7UbeLtK9l+XTZgwUD+sRzfDpVQQ
	uXttNoXvyoAciSIaU5v/yRC4UwCzeaaa8id8ph0cQSsJOuP/rNnO9roofnkVa5XKyWpcGgmPIot
	f0flI3A==
X-Google-Smtp-Source: AGHT+IGlzYkxdQ3jNmoKIUKmRdKv/2EfCT350E/6eTwy54a2Ok9AGh8+muDwBdz1XTmZyCV98h6a07IqxRU=
X-Received: from pjbsz14.prod.google.com ([2002:a17:90b:2d4e:b0:311:d264:6f5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dcc:b0:30e:6a9d:d78b
 with SMTP id 98e67ed59e1d1-313af941543mr1391860a91.12.1749596299766; Tue, 10
 Jun 2025 15:58:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 15:57:28 -0700
In-Reply-To: <20250610225737.156318-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610225737.156318-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610225737.156318-24-seanjc@google.com>
Subject: [PATCH v2 23/32] KVM: SVM: Merge "after set CPUID" intercept recalc helpers
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Merge svm_recalc_intercepts_after_set_cpuid() and
svm_recalc_instruction_intercepts() such that the "after set CPUID" helper
simply invokes the type-specific helpers (MSRs vs. instructions), i.e.
make svm_recalc_intercepts_after_set_cpuid() a single entry point for all
intercept updates that need to be performed after a CPUID change.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index be2e6914e9d9..59088f68c557 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1075,9 +1075,10 @@ void svm_write_tsc_multiplier(struct kvm_vcpu *vcpu)
 }
 
 /* Evaluate instruction intercepts that depend on guest CPUID features. */
-static void svm_recalc_instruction_intercepts(struct kvm_vcpu *vcpu,
-					      struct vcpu_svm *svm)
+static void svm_recalc_instruction_intercepts(struct kvm_vcpu *vcpu)
 {
+	struct vcpu_svm *svm = to_svm(vcpu);
+
 	/*
 	 * Intercept INVPCID if shadow paging is enabled to sync/free shadow
 	 * roots, or if INVPCID is disabled in the guest to inject #UD.
@@ -1096,11 +1097,6 @@ static void svm_recalc_instruction_intercepts(struct kvm_vcpu *vcpu,
 		else
 			svm_set_intercept(svm, INTERCEPT_RDTSCP);
 	}
-}
-
-static void svm_recalc_intercepts_after_set_cpuid(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_svm *svm = to_svm(vcpu);
 
 	if (guest_cpuid_is_intel_compatible(vcpu)) {
 		svm_set_intercept(svm, INTERCEPT_VMLOAD);
@@ -1117,7 +1113,11 @@ static void svm_recalc_intercepts_after_set_cpuid(struct kvm_vcpu *vcpu)
 			svm->vmcb->control.virt_ext |= VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK;
 		}
 	}
+}
 
+static void svm_recalc_intercepts_after_set_cpuid(struct kvm_vcpu *vcpu)
+{
+	svm_recalc_instruction_intercepts(vcpu);
 	svm_recalc_msr_intercepts(vcpu);
 }
 
@@ -1243,8 +1243,6 @@ static void init_vmcb(struct kvm_vcpu *vcpu)
 		svm_clr_intercept(svm, INTERCEPT_PAUSE);
 	}
 
-	svm_recalc_instruction_intercepts(vcpu, svm);
-
 	if (kvm_vcpu_apicv_active(vcpu))
 		avic_init_vmcb(svm, vmcb);
 
@@ -4509,8 +4507,6 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	if (guest_cpuid_is_intel_compatible(vcpu))
 		guest_cpu_cap_clear(vcpu, X86_FEATURE_V_VMSAVE_VMLOAD);
 
-	svm_recalc_instruction_intercepts(vcpu, svm);
-
 	if (sev_guest(vcpu->kvm))
 		sev_vcpu_after_set_cpuid(svm);
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

