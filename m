Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D282ED853
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682117; cv=none; b=Ah2DoJjVYyOw1gi0MX10qtABUZDtHV6uAH7Xg5dcVPGrlLnfwxf58CXrFMUm2fOL17oipol2hWsr2DYCXbmhPlpFFhNWx+t6+BVid4lEsrQYFZJcUrbC60bQ+foYQI2OyTovx6n8GT/kan5UGuYViKX2VP7N8k9h4G4tey8dk5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682117; c=relaxed/simple;
	bh=j5HZ30o1gx8s74E/i+Mz5x9+bIQZioDRwMF5in66Quo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r+vJjlyUoJ1TQe491s2MI9X0Uft9JsV1pn7MDMqtL0RbHG0SPk0869HCRzJ7XQK6FjRGBNLT4VebzHJY9/tK6NvVof9YmGUQbFtlaelRjkmLtVL02c4Dytr1VudYn4W3ZPgYYCM9ZPdLdrVqcX7qW9+myfiTIWn6WUPFv9Y9sO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L3+QYqC6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L3+QYqC6"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311b6d25278so342078a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682115; x=1750286915; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EDp2MAm1ts1xFlPsVR9eKX3SKPzdTZ7kBVeXKS2SKzA=;
        b=L3+QYqC67K0g7/waXCtq/UFevSH3rEwmt79NCwenDag9JPJZCsMkwpFXoE2nUD4d74
         ApmH/bwljWBJ290zqwEa8c3ST99FoFpJO8gzWopoifw1wtv+G5MfzZ/07ABpYV2Oopll
         jupogS85VkZl2usqsIB0WNTpKtmGJCVbLWslM6rKPFMen1rw0huwxQLFCXVpim5Jo2+w
         Q1sbGUydqoW1hY2y/K0TuUfOm7Tt+7TLpz+43J+EHyH0MjJ8qUMkKyMLT6VwsJZVLElA
         NqNNegDaq6/luE7XDb4OpL0datGHSim3nxBljn1O8RtK3H7ngyoSyTnJz79FpXPzk23m
         HEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682115; x=1750286915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDp2MAm1ts1xFlPsVR9eKX3SKPzdTZ7kBVeXKS2SKzA=;
        b=n6RDP9cUheOS6EaFtM0tYxHUEo8naliy2gc/zlaMeXvHc6A8ukYipANg9ib5+gkjSJ
         et5USUW00ta1POwpgt0k0PD0+AFFqa+mzDYnwqO5zUYtfl3Z79SZANokaS4CzaLc7mLz
         BgR8gBIAtZqwNbIcKOqSxArep1V4leAvZSqQmHaZv2E9NXgx1uClYV3a+6MzHJr/MPMs
         ZAwYu40ITghi1qMPst8ny0UU2Didd3AfwgdfYft4k/Zm4g838ftZrQ5XRZ3BUEb5uTYm
         BrYbfA5xbNuwUNB9d1Up6ItQX2Wt8bHlxAvyOqSrcgD50j1AfbsWnW4V751o/st7yVDX
         hFFw==
X-Forwarded-Encrypted: i=1; AJvYcCWjGK5YqqW1COxoyzkjAR/FGIIQpKtUTyMx9O7Mwgm+A44sl4Zpgc990hmx/DnIpFD+ODvFTDQeQRzgdiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/2FIPHd+C83lbD0oOGHPJAjez8mrPUExwmpA4Ghyt82cX7xQ
	BXZeffsypp9IuhDmTUtDk6gq1XwYgg5PEf0j+r0Ox8PLvhX1CtZVpF7jbBhmQMyT5ZZ7VBHteRO
	L6XeR/Q==
X-Google-Smtp-Source: AGHT+IEbfo0mMPt12ljEjE30pCWmP1qbKv/AIuMxYG67rAiSNKYcSiWLenrS7AYH9QEP9z44f7kSaVHJGlo=
X-Received: from pjbsz14.prod.google.com ([2002:a17:90b:2d4e:b0:311:d264:6f5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55c6:b0:312:f650:c795
 with SMTP id 98e67ed59e1d1-313c08b05afmr1045053a91.21.1749682114717; Wed, 11
 Jun 2025 15:48:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:46:00 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-59-seanjc@google.com>
Subject: [PATCH v3 57/62] KVM: SVM: Fold avic_set_pi_irte_mode() into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Fold avic_set_pi_irte_mode() into avic_refresh_apicv_exec_ctrl() in
anticipation of moving the __avic_vcpu_{load,put}() calls into the
critical section, and because having a one-off helper with a name that's
easily confused with avic_pi_update_irte() is unnecessary.

No functional change intended.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 52 ++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index bb74705d6cfd..9ddec6f3ad41 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -728,34 +728,6 @@ void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 	avic_handle_ldr_update(vcpu);
 }
 
-static void avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
-{
-	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
-	unsigned long flags;
-	struct vcpu_svm *svm = to_svm(vcpu);
-	struct kvm_kernel_irqfd *irqfd;
-
-	/*
-	 * Here, we go through the per-vcpu ir_list to update all existing
-	 * interrupt remapping table entry targeting this vcpu.
-	 */
-	spin_lock_irqsave(&svm->ir_list_lock, flags);
-
-	if (list_empty(&svm->ir_list))
-		goto out;
-
-	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
-		void *data = irqfd->irq_bypass_data;
-
-		if (activate)
-			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
-		else
-			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
-	}
-out:
-	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-}
-
 static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 {
 	struct kvm_vcpu *vcpu = irqfd->irq_bypass_vcpu;
@@ -990,6 +962,10 @@ void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu)
 void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 {
 	bool activated = kvm_vcpu_apicv_active(vcpu);
+	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
+	struct vcpu_svm *svm = to_svm(vcpu);
+	struct kvm_kernel_irqfd *irqfd;
+	unsigned long flags;
 
 	if (!enable_apicv)
 		return;
@@ -1001,7 +977,25 @@ void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 	else
 		avic_vcpu_put(vcpu);
 
-	avic_set_pi_irte_mode(vcpu, activated);
+	/*
+	 * Here, we go through the per-vcpu ir_list to update all existing
+	 * interrupt remapping table entry targeting this vcpu.
+	 */
+	spin_lock_irqsave(&svm->ir_list_lock, flags);
+
+	if (list_empty(&svm->ir_list))
+		goto out;
+
+	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+		void *data = irqfd->irq_bypass_data;
+
+		if (activated)
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
+		else
+			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
+	}
+out:
+	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 }
 
 void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

