Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B1028B7C3
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962072; cv=none; b=raM6c9STilcADA7DlvR5VvMROnxlVOd3mCtkSesFD2ppKiIhJlr830TFBYIpRr6Iws+fkDAPaJStR5h1i/zoVIYeOZD3YHYLy4o+UaOl7p4VHhBOIsIHsmFOWnHmJadpsaDGaQllWJXNwRSlXcQPY/Htv9SUZZ1kNhZgS0noIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962072; c=relaxed/simple;
	bh=rr28ytoqBfvrEIg2zljySxOCv3GKwF/AvjFSbsb8WHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U64w95kZKSZMGUD15bITOcfXOGvhzwKHNU+Uh6hsnf49COdl+679STJ/r87elKagnbqgW5xTR9eMegTkLx+o1PjUkZ1ouEHsfXSJhJBy+JCDG3wFs/tvICtgqBSTuv5zu8a0ZcW4toCCGsnkSzpEZOe9mJfc7O+ogNfyiS0GQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RqA2lqhX; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RqA2lqhX"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ec5cc994eso4818073a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962070; x=1748566870; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=w0kCfWU98XQwV041YO1Y2EVRT9qYS2hPdBh6QvqO+sc=;
        b=RqA2lqhXcZqWKtxuE/R1r0wtrDw0ToAXQxK6zRQkJaLdL1rOThSjI01dYaFpAmZBpe
         y1Y81t3bDKa0AcdO5bEvydyCJnorgnFUwYIkoUWLOURvh9DC4Uav3eiVUcjho2yhg6SQ
         a+xvmtIi+zXTAqq1yCZr65bWtqi8L9h6Fz9h1DZxZZwuVHInWkn5as5TJA4d1J8x99aG
         5I+kg7lHbx7ybm51VpYG0UYrKPmVgjQ6u9S1/aDoJR7bg6Ij2RGDTehXoYPMpspc6imr
         2C/nfoSfuUOHVmSDD/eCB4ZKBbrBCs9Fngb4OCvdggtB8/tk3M6ZdKbBwox0orbxlIO+
         FijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962070; x=1748566870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0kCfWU98XQwV041YO1Y2EVRT9qYS2hPdBh6QvqO+sc=;
        b=fyswFzpM078+8gogG0LvvEjM6ymdpp+zwz3sluF6ItSoCq98efWuuZb6q2uxy/XDI/
         6OypkqZIo+l36gUvsAIY0oVq+3Dt7uzdkypANQITH3htbrhq50gyQtSwAPOBsZlLEE/g
         MwYDrxpEMDJeudaAbQK1VWHefZof53EVanE/c3gYnCcV+aCYyks8B4EtUNgYjDN8taGS
         ODx2ng0mOheMtxofqO6iz+0ARPPhMN/ZdFu4XWrBLwMn2sfqrp8W6nukMwysvZxShqW3
         zH1TvDUt1cHiOHP+nT/4Q1E5kfIek06HoyComhfnd9bPPq3Th1AMpAOrnngpvhIfJMzo
         P+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0hYPtIgo33nxHk2a4AiRp+dNzdeQG4U7H0YR9vrg6niNT67RGBqSRwmy9qW/3oUb3cRiB0BmwDHehvgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxy6ttEQJvt2wY1bjRkDst3gVrkUfALG28pXAB39hgJnPZ0A2
	TteoqmxtyAndsfEHd+eXuE3apWpOBMmglLvTXxIJ+R8U4b5fO6wJw9bDcMZWow84PLqhrZ7b6jL
	5aC6H3w==
X-Google-Smtp-Source: AGHT+IGjkNbeOSur3vbEkZXFamu+YYNEKfRbtS/EU3c2ZsJsvBusKBLrOpiwTklBFI3+nSzpA/Uw0Nr96q4=
X-Received: from pjx8.prod.google.com ([2002:a17:90b:5688:b0:30a:31eb:ec8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c5:b0:2fc:a3b7:108e
 with SMTP id 98e67ed59e1d1-30e7d4fea80mr41800434a91.4.1747962070676; Thu, 22
 May 2025 18:01:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:41 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-37-seanjc@google.com>
Subject: [PATCH v2 36/59] KVM: SVM: Take and hold ir_list_lock across IRTE
 updates in IOMMU
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that svm_ir_list_add() isn't overloaded with all manner of weird
things, fold it into avic_pi_update_irte(), and more importantly take
ir_list_lock across the irq_set_vcpu_affinity() calls to ensure the info
that's shoved into the IRTE is fresh.  While preemption (and IRQs) is
disabled on the task performing the IRTE update, thanks to irqfds.lock,
that task doesn't hold the vCPU's mutex, i.e. preemption being disabled
is irrelevant.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 55 +++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index f1e9f0dd43e8..4747fb09aca4 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -769,32 +769,6 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
 }
 
-static void svm_ir_list_add(struct vcpu_svm *svm,
-			    struct kvm_kernel_irqfd *irqfd,
-			    struct amd_iommu_pi_data *pi)
-{
-	unsigned long flags;
-	u64 entry;
-
-	irqfd->irq_bypass_data = pi->ir_data;
-
-	spin_lock_irqsave(&svm->ir_list_lock, flags);
-
-	/*
-	 * Update the target pCPU for IOMMU doorbells if the vCPU is running.
-	 * If the vCPU is NOT running, i.e. is blocking or scheduled out, KVM
-	 * will update the pCPU info when the vCPU awkened and/or scheduled in.
-	 * See also avic_vcpu_load().
-	 */
-	entry = svm->avic_physical_id_entry;
-	if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
-		amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
-				    true, pi->ir_data);
-
-	list_add(&irqfd->vcpu_list, &svm->ir_list);
-	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-}
-
 int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			unsigned int host_irq, uint32_t guest_irq,
 			struct kvm_vcpu *vcpu, u32 vector)
@@ -823,8 +797,18 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
 			.vector = vector,
 		};
+		struct vcpu_svm *svm = to_svm(vcpu);
+		u64 entry;
 		int ret;
 
+		/*
+		 * Prevent the vCPU from being scheduled out or migrated until
+		 * the IRTE is updated and its metadata has been added to the
+		 * list of IRQs being posted to the vCPU, to ensure the IRTE
+		 * isn't programmed with stale pCPU/IsRunning information.
+		 */
+		guard(spinlock_irqsave)(&svm->ir_list_lock);
+
 		ret = irq_set_vcpu_affinity(host_irq, &pi_data);
 		if (ret)
 			return ret;
@@ -839,14 +823,19 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			return -EIO;
 		}
 
-		/**
-		 * Here, we successfully setting up vcpu affinity in
-		 * IOMMU guest mode. Now, we need to store the posted
-		 * interrupt information in a per-vcpu ir_list so that
-		 * we can reference to them directly when we update vcpu
-		 * scheduling information in IOMMU irte.
+		/*
+		 * Update the target pCPU for IOMMU doorbells if the vCPU is
+		 * running.  If the vCPU is NOT running, i.e. is blocking or
+		 * scheduled out, KVM will update the pCPU info when the vCPU
+		 * is awakened and/or scheduled in.  See also avic_vcpu_load().
 		 */
-		svm_ir_list_add(to_svm(vcpu), irqfd, &pi_data);
+		entry = svm->avic_physical_id_entry;
+		if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
+			amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
+					    true, pi_data.ir_data);
+
+		irqfd->irq_bypass_data = pi_data.ir_data;
+		list_add(&irqfd->vcpu_list, &svm->ir_list);
 		return 0;
 	}
 	return irq_set_vcpu_affinity(host_irq, NULL);
-- 
2.49.0.1151.ga128411c76-goog

