Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFA283CBE
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962066; cv=none; b=mb8K8PZiVMd1Qgn0TbonE9s6UfJxXL73ZHYHPSV4daAtUcUyjjt+G5+VlKWPaZ4OREnbHT2gSpxccZ1qKX7p9Qpt3KsdfTqP2GbA6jVQodO02JRgePtqCw2wguub6ptv4IjuObgoMsf1iN3TUsGZOoUPhic0ZKNAEELiu9d+q7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962066; c=relaxed/simple;
	bh=lF7pC8sohabNgcaIb1E8HB/O7nTwbIatU6uqVNQw5dg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DRHHGZZdv61rEQbDulNFCgmz0EtLbakvD3xbRBuaWe4SrHhA50NeWRX33acIRLNc2diq5A45h5qD7FhLc01JpouVtc675zksPzp8LB7EHfdBbw3HrViNv5/amKwBMzeRe8i7/qngeeThUPJ4iz319vhM+ByQhJ23RuT73BTBwRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F6oWaVrY; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F6oWaVrY"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so8986424a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962064; x=1748566864; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VEEMumgPPOxuu5AKa6Opm2ERFPwrtqEfeM08GKoEFwc=;
        b=F6oWaVrYaVXLtdfVpgmSmF+lqbZFv3xWF3l9OcfkamoAEi3o6ABXB2eVhwo4RgOAvz
         /zxu+wBzoLoCdsNI5p9UOriY0tUA4PyQA0Hj1IzhyWZJNmQlBZEFeiOa47cpLIyKQYlJ
         t+KTWQspbYa/us7Q83VMfToKUgiz8ALSHgtuincC3Uwo6BxRmC81vJ/sqVnQLvSMrnnS
         YqWeHHiRiZMMMXAj2eiGMLgjvA7fqUBCZxUBxrCnlac2AyRXk9TwAq2i/pW2B+AIE7cI
         cwIaQjNa7gFod/JpBBe839ssb8uvwkOKMUePGzYvst2ZLxyoOUm9r9Y10esNVLkN5mbn
         aSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962064; x=1748566864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEEMumgPPOxuu5AKa6Opm2ERFPwrtqEfeM08GKoEFwc=;
        b=fY8t3NoHeK6guulUqi1AdSkSjQTq3jkP19A9atT1wHmzzLWpRCUqPWBkJxzgff3Gi3
         IgBvdLTYC2SsmgJV17RRtax8JggOxMwOKcwsXAxVXxqb30Y9QSB5zn4A963HVXn9VT/i
         LisZaclaEHOA1h7WhvxB+t5uH9Dc2Q5BfAL4Zc4ZRWGTZfU945yVWbuj30DhNY8l47n7
         24FSd4OCpUteMRyAOu1TzUwY83SZ6HqqaT68ltUWEjP9FpNSF3a77ktnn1SPSkxzNTcv
         NwL49ZJwvmfXI03SpnRPqPqn/KSL1xvt767rB4OTu1K/eJKLwtEio34ImNCUyisQWbfE
         JXUw==
X-Forwarded-Encrypted: i=1; AJvYcCWdZ0lurRZ8Wqv1NR9UqYDJ7Fy3wQ9F2nBhY/z6iFsLBlumwthHO0tn+n4gU3a6xnJcgCDMwdBpPU479vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdR2Z/AAG+L1HAgS+MVfGEE8m1iyDXVqVJ5/PxzlXstAIXKn2B
	3cAzat6e0IAinIMzF+Ri4S8N7GL8MqUQFYY98qe4rAgT5mQaW+IMir8HImY6DCpk0maQVm36Y+h
	ZjSXftQ==
X-Google-Smtp-Source: AGHT+IETqKO87aMFsUZqxCg0LdZa+zJR5n+2fRyhOgSEe0vCrHKlfeYquaUmcKRaIo3hs3+dxPHGjYw4zFc=
X-Received: from pgbfq25.prod.google.com ([2002:a05:6a02:2999:b0:b26:e54d:d7dd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a129:b0:1f5:8e54:9f10
 with SMTP id adf61e73a8af0-2170cde51b5mr47706400637.34.1747962064242; Thu, 22
 May 2025 18:01:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:37 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-33-seanjc@google.com>
Subject: [PATCH v2 32/59] KVM: x86: Track irq_bypass_vcpu in common x86 code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Track the vCPU that is being targeted for IRQ bypass, a.k.a. for a posted
IRQ, in common x86 code.  This will allow for additional consolidation of
the SVM and VMX code.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c      | 7 ++++++-
 arch/x86/kvm/svm/avic.c | 4 ----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 582fc17ae02b..3a0f28e98429 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -544,8 +544,13 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 
 	r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
 					 vcpu, irq.vector);
-	if (r)
+	if (r) {
+		WARN_ON_ONCE(irqfd->irq_bypass_vcpu && !vcpu);
+		irqfd->irq_bypass_vcpu = NULL;
 		return r;
+	}
+
+	irqfd->irq_bypass_vcpu = vcpu;
 
 	trace_kvm_pi_irte_update(host_irq, vcpu, irqfd->gsi, irq.vector, !!vcpu);
 	return 0;
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 6085a629c5e6..97b747e82012 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -767,22 +767,18 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 	spin_lock_irqsave(&to_svm(vcpu)->ir_list_lock, flags);
 	list_del(&irqfd->vcpu_list);
 	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
-
-	irqfd->irq_bypass_vcpu = NULL;
 }
 
 static int svm_ir_list_add(struct vcpu_svm *svm,
 			   struct kvm_kernel_irqfd *irqfd,
 			   struct amd_iommu_pi_data *pi)
 {
-	struct kvm_vcpu *vcpu = &svm->vcpu;
 	unsigned long flags;
 	u64 entry;
 
 	if (WARN_ON_ONCE(!pi->ir_data))
 		return -EINVAL;
 
-	irqfd->irq_bypass_vcpu = vcpu;
 	irqfd->irq_bypass_data = pi->ir_data;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
-- 
2.49.0.1151.ga128411c76-goog

