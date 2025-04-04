Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE16230BCC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795656; cv=none; b=TGXUBm6tNsIVbeFYuAMrKNldhuvqoSc4xlS9v7/leKart87/sFur1yxAe9ESYIb9pohrgMt+pvYf8vUiS77O3aTM2ZeaO05LGLVlS2N4TgHaZ51bfgDOGPbtbJuBkN9JHwaMmi/PW5NYImuvuH2C4LJOAQcivToULgsvuy/X4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795656; c=relaxed/simple;
	bh=7iUSFx5D3yR25IHThTgAc/IOAW4zYfJ9SgblmRez7ms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jh72X8sP2YDNc6tls+sofbIVHGJQShNgUr22uPQ1VFwlJJ4vE28i+NL7XtgvmOG+wiMkIau3w8cPPn6Y9xRqKVsfI395uTfuuhljGsuOErdzyuO1bpj6r+QNm1XiwLHlgD1ZZDYXwpUSlg49BzOg/aaclvZXRl7eQhg+B4Htiu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3j+Tjnhz; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3j+Tjnhz"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6af1e264so3538559a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795654; x=1744400454; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4e9ffwdEp7Gqw+G1mVFy+m5vTrdwBux5yCWrxBIAEu0=;
        b=3j+Tjnhz8z7z2FPkWIJ8C7hlfq8ctahfr5jeWFcYVCJoJIODcyQL3hir0LYRfPKa6F
         3r45gAHbDP3tGpZlqgOl70ylZrxke5A8E2ycuOs1WtHCwkUfaer6urwWNa81EJ/4w//A
         6jueSE00wS8RSFvhdSXy/mt0zKH1SSkRxOMmAaSSay/4xdON8qV8Ug7ghZwyGrgDuMNV
         69HYIu8utRw0G5dR3Cjvexa2sTC8gpAqy9dHcyM4S68nWp4Q/pOqeItpYxZJP0wcTNqJ
         bazR+1EUr9Q3gn88fE0AE3q4JzugSbNVUusayJ8unhlJQ6OssWLen6ANSdPro8/OZk8a
         eIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795654; x=1744400454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4e9ffwdEp7Gqw+G1mVFy+m5vTrdwBux5yCWrxBIAEu0=;
        b=i/CpUJQjFbCfNaZI0d/ir9xaCzTgGgu/MCniBsVxeaRJcnwc+hhZhqsrSZNraY8DDa
         Cdf+/njiBKiPDjhIdv6d8EYSaN44yWXNYo3bx8wv3aEvjLxvcCO4U8W2U46/h7HfU4hF
         DjPASkOjSwUhBqkre8ufyDvfB/UTgMcXpqkDW3Xp/yhh0W+8Us+FIakQJwf1yxwmHguI
         NvgZPxtUXdaw//4hZxM0WeF6LurtFtgFaWQmQSzxfCfZVp10/NM9einsAchL0BELv+Zj
         PVd1ooc0DR+Rx3UZwZbmKNP6CZz9kM/OWiKnzRbYd7JnSLTfmhb9lr7MDugRPIyrRcF6
         AwEA==
X-Forwarded-Encrypted: i=1; AJvYcCXtZbQMbNklKcfPUXWRt1JHbKp6ZrnOrZEYS4pQGwXP1Mo1iJvlGj4WyZ+t7bORqqdJvROoZUEP1NVTHpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhGD/1HZ+1BdRkO3D1s+aH5/nAp2KYE/SWtK2giCE6N+2j8Bc/
	smToHSgajP1G4FWHwnBe93kKVk3kZg80JAU3OTGCADKC9BbKmTgGLnCfzj4K44sjQwQueOlSBX0
	7DA==
X-Google-Smtp-Source: AGHT+IHq0WDQdQXdmkR68srWyYUi8Jk0ER178ssR+69T3RU1Hrt5+d4NUY61J9tgaeNmx2ouyINmHwrWyBg=
X-Received: from pjbqn3.prod.google.com ([2002:a17:90b:3d43:b0:2fc:c98:ea47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2d0:b0:2ee:d193:f3d5
 with SMTP id 98e67ed59e1d1-306a6120999mr5163910a91.7.1743795654132; Fri, 04
 Apr 2025 12:40:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:54 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-40-seanjc@google.com>
Subject: [PATCH 39/67] KVM: x86: Track irq_bypass_vcpu in common x86 code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Track the vCPU that is being targeted for IRQ bypass, a.k.a. for a posted
IRQ, in common x86 code.  This will allow for additional consolidation of
the SVM and VMX code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 4 ----
 arch/x86/kvm/x86.c      | 7 ++++++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 355673f95b70..bd1fcf2ea1e5 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -776,22 +776,18 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
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
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 36d4a9ed144d..0d9bd8535f61 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13604,8 +13604,13 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 
 	r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
 					 new, vcpu, irq.vector);
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
-- 
2.49.0.504.g3bcea36a83-goog

