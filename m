Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD162690EB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562057; cv=none; b=MSWoY7vd6Y3j4Z2kAPYJDSbdhgGRFPw46mM91I0dyxUD6GHXYaf3zdRXgOvrphS/Ccy9lBcWXfO/PM01hW+wCWllpdvESOR+JnV419kGE6Y1/Mz9Kl8f3dOYyTNtEJXBCTiLsbChKJMi0vgkZ3dwXtnSEj6U1RppUpnZmw5A/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562057; c=relaxed/simple;
	bh=SoD0Hcit0b3Q2X0664j5BC/XwufKuxL0p4SDIiBBwuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fMf5gS3IUSbJSv8arS+8Seaer+m9IgZAApZwvZKiH0Lp56vrFSos+1Ug/FI6PuHnN1VVfB0TAl6zPdQI79qsjOJyzo2Gil+Nn2FDbr9wxH7eiO/e3k3S2Z+jkleM/42IfX1KxaJtZ5ME4/TEm5jJXzTuBHeEQPIyHs8KM3ByLrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=txM9L/Qp; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="txM9L/Qp"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311c5d9307eso1639314a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562055; x=1749166855; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ma79OxOfbFz3TgRT1+ArAbLyQaoHvlTGS7OlgEQow6Q=;
        b=txM9L/QpogytWeQoiYOOveFZq7bV54bAIxcfdQCdwv+MYK8Tc2nojInZ0pS0kdRkp+
         F9mO+j9Xb5aBKtfiI1I+8mRboNnzYq5xUgOZsSSfennflJJ3xwnbTQ0rQaOp3Yxu3OqM
         D99bIx1LE9SFl0KvK6aI5urL1uj4O3xhi+vQkRet8cXhvhBh6oGCpfhXLK98pgX5SHeI
         OWvyRQfvvqwZUiaC7I7UmZkWlG7rIK5HUJ6TvcmXqaMLVs++pqron9vR4/pGjuyTPhtw
         pcTMEG1Ajw0YYau0DQXqcx+m2qzEABF2vSSRblPq36I5NPx0UuanmR3vSTO0n74Ihtul
         zp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562055; x=1749166855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma79OxOfbFz3TgRT1+ArAbLyQaoHvlTGS7OlgEQow6Q=;
        b=QOALehMxtTEAgNsymtYVuxh0diPIgvw7TSUOiKDYEBYTwb8hpSwtvK1Ixz/jRkNaJe
         XNE7AxUhqpuPP4Ek0zPrJrg+DeBM0a267E2NXnbIoLKfarBIf5a8WKsRCqPV4+PVg7r7
         QVZ3M3VezCwsV99GEyI7IX+0TPYVC4koxtWPCPBz+O47+9xc7vdBvQCPHHLDBSFbCR4A
         Osw8nTX6n86yJje01ePVxpWUIhm3+mEb2BmBRXsah6B5iAMt13qHhZvbnLtH2Ak1ctPR
         BKrsKHWNimKsexejVUFapCKkz6zo6ZywXvsjm4e+qhzpkoDrULQ6MjhFfHIONEzZQ/MS
         bk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlimwvFOmcp2CIxruXQjliLZyGJZsi3K4xZYPXGJ7xOEuNiMfbP3WeP1JDt3yMHn5+AJLw5g63FeOhiPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLr0vDenus2ZjuH+AdvENi3fwt1MiF82IdKu9pGXaexLlYyqvq
	qWjGX3Adgoe/dyACXw27Tpd+dO2Hzi7WxkY7ISV6Dlf6Q3EBMJq5uw/z+Sflcu4N/HaE3JcZbvU
	0MkofhA==
X-Google-Smtp-Source: AGHT+IHkbdZTK3P5HLHYM5AwmXLymCJ0QLixXG2jn4Ae152nUnpVjDZhnL8AuCnVXKZgkEkLTE0sz/Z5ACw=
X-Received: from pjbsc15.prod.google.com ([2002:a17:90b:510f:b0:301:1bf5:2f07])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2701:b0:311:c939:c84a
 with SMTP id 98e67ed59e1d1-312416340bamr2391836a91.15.1748562054868; Thu, 29
 May 2025 16:40:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:40:07 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-23-seanjc@google.com>
Subject: [PATCH 22/28] KVM: SVM: Drop explicit check on MSRPM offset when
 emulating SEV-ES accesses
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Now that msr_write_intercepted() defaults to true, i.e. accurately reflects
hardware behavior for out-of-range MSRs, and doesn't WARN (or BUG) on an
out-of-range MSR, drop sev_es_prevent_msr_access()'s svm_msrpm_offset()
check that guarded against calling msr_write_intercepted() with a "bad"
index.

Opportunistically clean up the helper's formatting.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 2ebac30a337a..9d01776d82d4 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2771,12 +2771,11 @@ static int svm_get_feature_msr(u32 msr, u64 *data)
 	return 0;
 }
 
-static bool
-sev_es_prevent_msr_access(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
+static bool sev_es_prevent_msr_access(struct kvm_vcpu *vcpu,
+				      struct msr_data *msr_info)
 {
 	return sev_es_guest(vcpu->kvm) &&
 	       vcpu->arch.guest_state_protected &&
-	       svm_msrpm_offset(msr_info->index) != MSR_INVALID &&
 	       !msr_write_intercepted(vcpu, msr_info->index);
 }
 
-- 
2.49.0.1204.g71687c7c1d-goog

