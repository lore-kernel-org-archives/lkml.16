Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FC2E92AC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682092; cv=none; b=ks2xCF8YgfeYS+oMRTXlEd06Ye+ObSFwqj3OhfpSqSB00i8b0u3680O84Zc+Pjij1tLXMWeqTTamGGfQjvo7omiCVkSXzTpiv0DGwcKoJr60uHeZ+oPECrUkaG/DojBs+pZfy9IMTh12ahzh0MnXjsGO/+whKbUd5V8lHL4HQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682092; c=relaxed/simple;
	bh=NRIbkwHZgJe1eOAVp07nJM0qpUotjJb3D6s38m9ceNE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nxyojzm4AS4aSazVHd1T+HxJQ7H+i/RTxsrF6WB2iW5oACNW1ZROrAamXUv0vAhksN5a/x88Yklw3G5f1XHKnwJPecZuS5YPlmomefmK35UAxSN/C+lxO/3BPQzjH5LxpVTcvBfekFosCdhygyKul3IESkfe8N4pqr/5eandhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AtQaoEbN; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AtQaoEbN"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235f6b829cfso2129715ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682090; x=1750286890; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=d8u9n7/qtcddPkohDHss1zptLYbY60ll3w/DwpskJQs=;
        b=AtQaoEbNzJ03kFP7xNUhSqWgthoowawDDjIi0mD4s1Q2TSUbDuIMBx/zZ8cN8Z28Tv
         o0sKyBPHmhAMF6NGliYYTNBN/F6WsEcigzvaUtNVThVeJl3v1aqgw30O+drhdNBWVxt5
         a2n4tBkKHHT9MGWINhaqkd//eexAEZfOnfQ16VnrRvjaPZtclOT+Gn6XCyrUxnLx/fRT
         IzMkpeT/f74Ogn5WyNfIipYeka1j6dHbJSVdFsMdyF8IEQXpDdg9fdivVymZb6we+es0
         S7SSj5HRkb22rEcUEdCBHdIFy9MWx864u/pUaIh9n8Mkc/R+7zra7u7LK/yl/ACS2yMK
         KqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682090; x=1750286890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8u9n7/qtcddPkohDHss1zptLYbY60ll3w/DwpskJQs=;
        b=XW0w8BzvEaj8VPw4krnRhKPjl+/t7EJdGP6mZj9apz1ZBR5hzrX25ZcmjW8pgL8TQI
         hB7TUbn1TMNnBotjuoe7qkiYOgQ8+nMIHlvAU414IF8S93mvjdb9bJ7y7TJZNae8nEqN
         IF9/fmG2apO14B0kGDiO0WvRmEVA9YYzn7kiCgFDVwng2WOl3S7XprWV6fyeyQuxo6qM
         j1JlpHYsg1dapjCLrYzrAcCwt+gEFYm1jng6dRxKlEsdkm8FUI9nZ+g6tCJ/9O9eLgLH
         wo8DfeFW9SGThT3FAyrBKyKI9rJ5a2E796mwvFHCYk/kykVruoCgqweo8s2jjjo9LTwY
         de+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeIUacXJ0nnClPb/mZXK2rNAXuDmnyXvYrPXU2GKzlFmb3N+mZmOiDD+H1Rkbg4fSS/UMhM+67Yx4qizs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxITbjLqhc95y7ICFhtIJWCCr63MTjOiItTA8UH7IDZvAio+a+f
	Ggi9ll9vvTahwXjq+WI3OLEZtLZ7W6z1sbaAoun0vCku3QxRQm+9KBVh9Ko885XP2RCCQMPQ0jH
	Rfj23Ww==
X-Google-Smtp-Source: AGHT+IHWJyMnlyFo6yhSGVaRZ8z5iHrg3t+Cz3M8yTQ7oInJuByhEts6I2Tl4zgp4CW7ntx2+eMqbSXS/nA=
X-Received: from plad20.prod.google.com ([2002:a17:902:e154:b0:234:c8e7:6fe2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c23:b0:234:d7b2:2ab4
 with SMTP id d9443c01a7336-2364c8d18d9mr15462635ad.17.1749682090185; Wed, 11
 Jun 2025 15:48:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:46 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-45-seanjc@google.com>
Subject: [PATCH v3 43/62] iommu/amd: KVM: SVM: Add IRTE metadata to affined
 vCPU's list if AVIC is inhibited
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

If an IRQ can be posted to a vCPU, but AVIC is currently inhibited on the
vCPU, go through the dance of "affining" the IRTE to the vCPU, but leave
the actual IRTE in remapped mode.  KVM already handles the case where AVIC
is inhibited => uninhibited with posted IRQs (see avic_set_pi_irte_mode()),
but doesn't handle the scenario where a postable IRQ comes along while AVIC
is inhibited.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 16 ++++++----------
 drivers/iommu/amd/iommu.c |  5 ++++-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 16557328aa58..2e3a8fda0355 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -780,21 +780,17 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	 */
 	svm_ir_list_del(irqfd);
 
-	/**
-	 * Here, we setup with legacy mode in the following cases:
-	 * 1. When cannot target interrupt to a specific vcpu.
-	 * 2. Unsetting posted interrupt.
-	 * 3. APIC virtualization is disabled for the vcpu.
-	 * 4. IRQ has incompatible delivery mode (SMI, INIT, etc)
-	 */
-	if (vcpu && kvm_vcpu_apicv_active(vcpu)) {
+	if (vcpu) {
 		/*
-		 * Try to enable guest_mode in IRTE.
+		 * Try to enable guest_mode in IRTE, unless AVIC is inhibited,
+		 * in which case configure the IRTE for legacy mode, but track
+		 * the IRTE metadata so that it can be converted to guest mode
+		 * if AVIC is enabled/uninhibited in the future.
 		 */
 		struct amd_iommu_pi_data pi_data = {
 			.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 					     vcpu->vcpu_id),
-			.is_guest_mode = true,
+			.is_guest_mode = kvm_vcpu_apicv_active(vcpu),
 			.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
 			.vector = vector,
 		};
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 718bd9604f71..becef69a306d 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3939,7 +3939,10 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 		ir_data->ga_root_ptr = (pi_data->vapic_addr >> 12);
 		ir_data->ga_vector = pi_data->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
-		ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
+		if (pi_data->is_guest_mode)
+			ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
+		else
+			ret = amd_iommu_deactivate_guest_mode(ir_data);
 	} else {
 		ret = amd_iommu_deactivate_guest_mode(ir_data);
 	}
-- 
2.50.0.rc1.591.g9c95f17f64-goog

