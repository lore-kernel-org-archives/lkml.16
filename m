Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1A52D6600
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682076; cv=none; b=FVcE+iJ7zwBOLDPMqq3W3FZrb9rcRMLeFQEQMBSlnE1g/JFvwryY3mcNIKXQzQ7DzEC6v7i8fDZ6F3sjNP3kQBA/ZqDACObrVeJ5hFoe/V/qEMZd1YTw8m0mzAzSyrJERJ/0+B6gJbAl8bePn73Q+chRl9FB16TXheTCA9lTVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682076; c=relaxed/simple;
	bh=kywKfKPTKKbP5xL2C71yOUcn3SiU0Y8qTPlvnXK8BT8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UD2WaelGd6aRZoxA4iEi/s+fCC5WvUZITrSZgp8WNXz7ZOu+CbFIV4iuW6wfNJ+dMBj3Vih2OrOEBDmQpGVqEZqulkZGUgEgXNBOfCxJ6rF9QvGvscjE5z6sxAhwYomQ3dtnNInEPet3EeZFZtCpQP9cOTPLXCJ1nd4d8kKgtGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L/bUNBmQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L/bUNBmQ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235f77f86f6so2092885ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682074; x=1750286874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t1v5tfF/UZZJDfH96jk5AIZx6aa1AacPrxrUndI2qrI=;
        b=L/bUNBmQPQferoAqoy2cLDu73Tc/emyawOvHOFWh+nDY2YDuzp5e7bKXncIPHtuoNo
         5Vq7n4fFqvBQV2gb1Rp0PrtyOtk4vUc08rG7wv8RPFcVmBWMUOeYuV+gnfpMMtrCPO4L
         qKjOF27GgH8xGSSS1kOJcG/YiPoG0/jBm8Ly48NVfYR+uvjmlrmlrbg97KmoPxwR1/P4
         r2wZe+Dg5pdZemfFNE0SL249+KqYdSiYHBrAv1hCqUPBcQEKC3HenJaJtJz9l1fW+Ti4
         0pWEG/QH0irX+DC2I2rQtk9sD8o2EWJq6tHCWL1SBKcRZ6tnQpbG4kzrl0h5KucLS3Y9
         KS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682074; x=1750286874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1v5tfF/UZZJDfH96jk5AIZx6aa1AacPrxrUndI2qrI=;
        b=ZdK5sAj/NL9sVMUS7QTkV9c5RTNNdkVgrs9ruuxEidXQqI/TtCOnjqtgYwyTn7DG4r
         49AUYSXiA7C15nByQ+GSR0iS17sgp2MGn7j1RRLLYIh1iXPJg8DymjDw1LWyn5ajHOK+
         IWYzN8cp0QhXGMV7f8dsRhJt8Lnk00t/9a8AQvE//ShPEJWK19pz1YJ82e0ssIIrC2Fw
         +yvI0b7m2GD1QZde0jRk/t6r/idfGoxYgPeNFax02io949J+7NDZUzkT9yDqawX9Tufr
         VSeMHXijBr+okh8lcAfrahPban/CE/IKVBS7oiWSdBazY8ExHI16/OCW3zZ/HhuiJNHe
         kCqw==
X-Forwarded-Encrypted: i=1; AJvYcCWzAqFHbOBiVvguA3T5dNMtd7qKg9jVenwtR1R+LrGuCa8jcd/EQDxi+B15CEk0FV0hoJLHUiPs30G9rkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ZOu+tfBFNEDbo6b2luK2lXvY3buaQ/yLy33oZntfirsQq8rw
	l+v6Eq4kfjVU98OabbENKejyT0E876chD6CWIAdmW14ZdgtW7d93+C9/wjQKbP1QMgYaSDq/Rln
	3ejZaxQ==
X-Google-Smtp-Source: AGHT+IHIOpTSYBslk2iwZ1Yvx7LxGgsjWNiUHu2s2XYfcpOZTsc6ZoL/od1AWVcDdNAHt+Yg97+L8Wtz5XQ=
X-Received: from pjbta5.prod.google.com ([2002:a17:90b:4ec5:b0:311:8076:14f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f4e:b0:234:cb4a:bc1b
 with SMTP id d9443c01a7336-2364d90f8acmr10461455ad.49.1749682074268; Wed, 11
 Jun 2025 15:47:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:37 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-36-seanjc@google.com>
Subject: [PATCH v3 34/62] KVM: x86: Track irq_bypass_vcpu in common x86 code
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
index 48134aebb541..6447ea518d01 100644
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
2.50.0.rc1.591.g9c95f17f64-goog

