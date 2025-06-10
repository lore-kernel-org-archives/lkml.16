Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC99A2DFA5D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596298; cv=none; b=FVm0fFKEjlbRL72TrotBmUzm3ghPvM0+PB7KGJo7V/+WLqHEloFfSLtx86pTOs90o4zhyoFB8ADIYqOS+UfZ8pQvGoYM9bv3QeC3dE8t406F8a1D+Ww5QhCsifmGbz0DNC1zcyZAwRqPr2+VD/9cuvh9SetSxTI+YleQow0Zxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596298; c=relaxed/simple;
	bh=mf4dGNQEE8Vf3ZN6CsMJb1C98fQ9dcsST+qQnEYPAdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DOEiFKEQrxUJYeNqic1WJ0hmSA/xMLuuoKyAMFaayszC8KHbyMoPig8HwIzRL+DRsK1kaRR0EwfoiI8WgGZ3WKjVQkwmgcAg6j7jjsKFAtnrjy0eemt3mYG4UB2aeQQFzjIyMYQr0oH9Qo2XSs5Gv2dyvI1UYfsR7V6h5p6tYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TYFxWtZh; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TYFxWtZh"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742b6705a52so8883221b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749596296; x=1750201096; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=INqA6pUbqyUB4M6DLfIPSDW1OsxCHPz49HW15Ivf0MI=;
        b=TYFxWtZhS3UkwVoUHispTjmFhiytbSw1yoLwYsSG8jq9oCyDdDTVbYt1ku00dzAJaH
         FDzOgJUB7PeX3tfUwisjQPCI44moy/z8o34SVYW5k2hK2O5ZMvZxht9k/TYXCCFmEUYO
         a2iUVY9Gt+g7R4YIKfn59y7KEwgkbuZDKBZGjdn3h3WnmwzDCYopWvegT54crGMQka9F
         /sf75/eVg1mhl1/B6J/6YJc7ugn9zjSbVheUXKVVunIHwCxWNVV+QvcCM4rIODyZL1gw
         2vb+6ALvzIX0bsAoFtevs6fKwSJ8vxSwQqdrsYAxBb/Dpg/97pLekMxq2cqSioBU66+x
         ci4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596296; x=1750201096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INqA6pUbqyUB4M6DLfIPSDW1OsxCHPz49HW15Ivf0MI=;
        b=vn47ZB6CzDhrDUQA3RUuaSHAi/+DSfaz8hxpDv3IjrDywtuk+PZzp1JCCvrahZrP5u
         u10/yMVUO6/7bfZe2ZB4qrW/b7Ut0ruVuPPlumb0M+20jrLm6Jr1Zz/NbyY3uzVkM6a+
         7l5UBLnUsaUHcOsxyyyjd6QpfUoNnMlbB0KUlAheHW4/5Yo8/5/xxiY4X6pOkCT5ZLSg
         j0qeU/RkSAp4f0wc1Qn5x9Uc2/tFwpgayjdAlUJwj+Lotzc+nl5Sfinkg1JODrSb8dI3
         gNx1PBIOJ3O1HtStTxV/xqClB0XmYxpaiQU0i7ioxW2hN0b0y65Z+Dpa5jli5zTy1zEG
         JKvg==
X-Forwarded-Encrypted: i=1; AJvYcCW9THaBm4uUn15Q+4qBesGseKl5taFprX+H35ki4W/baT4D6V+BMl6cbhGSgZDGYB924bd1BwR+uaE4QAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1m6W/cfApaUUu2SHZ3jn2futVMF2hTfyKOrlzy4QiXSCAZTM
	8b4ttGJN20hsvy1S0th44A/vRY49qaROS/mL2DqBMbRzwKlpKL5bRKCsp24Rn66laegnoK36SNl
	UtooTKg==
X-Google-Smtp-Source: AGHT+IHMOEDiNlakcTKi0BqXOdIFD8cp9FnOaD9FdZ/5gIz3n4JAB+77v2pAu2xRBZ27EtExAHgRcKJEqgA=
X-Received: from pfnj12.prod.google.com ([2002:aa7:83cc:0:b0:746:32ee:a305])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9993:b0:21d:3635:548b
 with SMTP id adf61e73a8af0-21f890eac3cmr787123637.32.1749596296356; Tue, 10
 Jun 2025 15:58:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 15:57:26 -0700
In-Reply-To: <20250610225737.156318-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610225737.156318-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610225737.156318-22-seanjc@google.com>
Subject: [PATCH v2 21/32] KVM: SVM: Rename init_vmcb_after_set_cpuid() to make
 it intercepts specific
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Rename init_vmcb_after_set_cpuid() to svm_recalc_intercepts_after_set_cpuid()
to more precisely describe its role.  Strictly speaking, the name isn't
perfect as toggling virtual VM{LOAD,SAVE} is arguably not recalculating an
intercept, but practically speaking it's close enough.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 710bc5f965dc..1e3250ed2954 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1103,7 +1103,7 @@ static void svm_recalc_instruction_intercepts(struct kvm_vcpu *vcpu,
 	}
 }
 
-static inline void init_vmcb_after_set_cpuid(struct kvm_vcpu *vcpu)
+static void svm_recalc_intercepts_after_set_cpuid(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 
@@ -1269,7 +1269,8 @@ static void init_vmcb(struct kvm_vcpu *vcpu)
 		sev_init_vmcb(svm);
 
 	svm_hv_init_vmcb(vmcb);
-	init_vmcb_after_set_cpuid(vcpu);
+
+	svm_recalc_intercepts_after_set_cpuid(vcpu);
 
 	vmcb_mark_all_dirty(vmcb);
 
@@ -4518,7 +4519,7 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	if (sev_guest(vcpu->kvm))
 		sev_vcpu_after_set_cpuid(svm);
 
-	init_vmcb_after_set_cpuid(vcpu);
+	svm_recalc_intercepts_after_set_cpuid(vcpu);
 }
 
 static bool svm_has_wbinvd_exit(void)
-- 
2.50.0.rc0.642.g800a2b2222-goog

