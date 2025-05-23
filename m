Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861342E3379
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962105; cv=none; b=JTzMcvSuW6Wy1JkuJgBluCqzoL4nCv5dyGkS+pi00FZg1xX9ZrdgqP8zHhZb3Js5RHXa2XHOcC7/BhQVNYgvMbyAWSYJ733UHT/iCCCmDiZSnR2D0ClVT5WDYOkDqmzd7jTBrtvZ1nYdyLfsj/kLXoGprsbuHC11mskzQnbObC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962105; c=relaxed/simple;
	bh=KsfYh+dTBbuGfYNIW3ziFqaFVeYMMEL6fm+SPmkC5dI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MsZb02c9OcZ9tR0QJB1nD1ns6gXu2cpUjXiipPHCmvcTHRS1K9tWFyhinM1A0DEmYRf4EN9IDf320BLNRj94DQUx+6YuTHpwcEsvugGmy5hefMiByBgtOmD4NrKq4UqrhQlxjC1TT002/IcSz01NK58n0Oaj8kYqd/1mgpS3kzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XltjOMjb; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XltjOMjb"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b269789425bso8822135a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962103; x=1748566903; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=R3ZFTLMU7HrPafLz7H8LY3RnxdvA+oHT6/HRYUM5hWg=;
        b=XltjOMjb80WtYODBfejwxyX6buXksMHJ2vSyKU4N4HzI4wy1jRkX6IYdkK/YeBmhTY
         0JKRPeicGVM5RRUB/AjA1pw2H454fl8Jf0l8d/3GGFRintXUsQfVpI8IIkhXNEv0nMm3
         tP583wf55gAp92pAUQ15u4RsMxoRJXwuVn4pCnfj/DOu7KmVOR9u0bRcQd4WZAmRgapy
         MF772Wr+Fo7A7EBLoVnTcyMqrH4reh7wjkT6BOCaM7Yz2zm+wiqnPhuLpF2cOZEHyj57
         Bukvvzs7PT13PPeCSskbxR468rfkCpO/j0bwQctOVldNzs1qelVdoWL7E2Ptf/RHIybu
         qEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962103; x=1748566903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3ZFTLMU7HrPafLz7H8LY3RnxdvA+oHT6/HRYUM5hWg=;
        b=uEmJzgrtMP0g8t3FLl9GIzw0isR5EmJ1QhiH75OLcnfzPKRyXEaUnuwBFPiG5/sc69
         glt1r/qvtf96EW5dLqpGmYdFJlGU38Wq9f6kCik75rb+bPGNDoNbSDfTGJFhk5/GmZyV
         aLH4v0Q+ZzaLk5jsNVKKEnN+ZrCsdCBKPU2j0EWFuX8KCNmZUFjO5GQOVWt4D+ca12JI
         cV4RbfgoocHJRQG18isz67uzwPfIa6HRiQbdv0FX3F1Jru2ZRjgTcKnF2bnNqvEZyeyC
         slSCV7euVM2MQYzeNUt3nafbD2KKyTsvjWUVAmlBWwQaJx2d2PaEo144Ayg0zXhWKNee
         Rk3w==
X-Forwarded-Encrypted: i=1; AJvYcCWJH06btAcJACCJpXpG94c9koQ5gdzjBVL4OxAIsmmVPbfPvs0s9xtglcO6iov2TWiwK/q5xRW2kng+oys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Wn/Jj9b1T5u3sTrLuKS3Ea6xsQfGrKCsrDhWzKuY0F2Zg2Ma
	JGsfkt/8W4pXklpq6cTc8zuY/b5yC+pIXN0Ebbdc3fi8hH6cVkOV4X73w7e7oczmYxW+wVfP1FO
	DrjFCwA==
X-Google-Smtp-Source: AGHT+IEtGHV3UU5r6+on0Bi3QnTx914rosO/P/5CGIo8zL7GgKodqhGaDH9iis1m/ryoELkyNhSi6H+FbVI=
X-Received: from pjbsi6.prod.google.com ([2002:a17:90b:5286:b0:2fc:1158:9fe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f4c:b0:2ee:5958:828
 with SMTP id 98e67ed59e1d1-30e7d522155mr46027060a91.9.1747962102833; Thu, 22
 May 2025 18:01:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 18:00:00 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-56-seanjc@google.com>
Subject: [PATCH v2 55/59] KVM: SVM: Fold avic_set_pi_irte_mode() into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
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
2.49.0.1151.ga128411c76-goog

