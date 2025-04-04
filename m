Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D4323718D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795661; cv=none; b=XFtFT2KryAaHYz6IHzD/PFIepvEC670sKFVGjNExB3nJdZ+yE53fKayjs67lX5gjB5TA1qKUxP/C+iOZPKZW8R8X4pE8IY1tDrPrBxgBXDg9UHPwAbaNVNKRWC2CC9x7EgTHphA9cygtEVFo47MXlCp7APYMsA6C5zvgS5DYf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795661; c=relaxed/simple;
	bh=mZVHycZOmEtySRxY0gXT8uvd2my3ZEIARWSKiopHcCE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tew/exT1Jl7MPsz0/hoQm2kzlKtAbyQX0p9RbGAbLm1DbovvnD1dmKWJu2q2hunB1JnoeNzpt0J7J+LAE06U8qu8yHzuUB0iX4+3wkNKfB3Vg5oyq/55HeC/JYs2GGzGo1E/eNBfQE69MKy257oFOIqCBUFqjmu6125g0HfewAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=knRpO/Td; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="knRpO/Td"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736b2a25d9fso1983544b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795659; x=1744400459; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7rkr9hfugytVpCiSi0z4IyfwHexjORIFyMklekHAhN8=;
        b=knRpO/Tdb+S0BupljJx0CRhxTvzxuxIE9YmGWy9Zt54MsDRrPNvTAAZTu+v46GN2bG
         4/9TxEkg9FQiDfioPMCS9n5IEXec/YR0culbARlp123+1EV9V0lSJ/TpRulHmgHD2lX/
         7cBwX3NuQPlahrVUqH7QodGnMjp4ovK9jChp8VwlasegAmQ67AjdLlwOi5UvPkAZMf02
         DjIdpSqltu0VsC3MUJcHkSnSehpTR6G5C4MYOGxu9GHOyFCXl2/WiUH7oUUm4XLxGhth
         Pe+1sIWDEjsNrdkfZ6ZFq06yKRVbk3vP6tnO2q69DdaUFi7pDA7DCRZWIEQCrRASNgNp
         TOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795659; x=1744400459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rkr9hfugytVpCiSi0z4IyfwHexjORIFyMklekHAhN8=;
        b=LGD3AANq0LyfsUV6gGgnHavYFYP4xxdunv2MgcYmS0o+Cafb6A44jBE969RPUAc+6/
         VQ61kvEd/UKhZJ/bCzqZ9LpfDjiejWBJb+HF1EVASTJBwvG+tcK2INceD3/EsKjSsf2j
         yXrJ9Js17Ha0oxyuFveGpG2VLE31uTpw0yM1Ub1+8RmTdjzBMK8dzStu1OtPxcvMMfPz
         F5p9FOm24AyCDJta/V5ZxXcAj6AZycXCR8p9EkdNMvdIlite1DBclzzhYHq3xD2zTduz
         A6OGHVEP8qZ4piEeDcR2kDOa2sH5F0g1n7KOrBMEGY0KeH8ke35umALMMLY5/AaakyKJ
         SQJA==
X-Forwarded-Encrypted: i=1; AJvYcCWeBoSDG2zIoH72La8J24bT44wkoZM4BZ27WBRBWkcsPeaglTbPZzwzhG8DwBoJ69l7c+DWE5LH/sGrUa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTqfD61UjmJ7cxy2TY7f/1D201CWY999gwILl12A1eQE1FLcHM
	TW/fLRBCxJw3/M0rOkMCDQ5GnFi14GQo16oxFIPPUE4nIqImN9S45NObCOK57N45eyV5ptaLpSy
	96w==
X-Google-Smtp-Source: AGHT+IEMUGCkESn/3vt+yaprJmAWrzZtMoy46YE4JHJL2Qn/BHhy2Ab6QzLZUQwjmyC7XuNZfNUe6UyzE3o=
X-Received: from pgbcq10.prod.google.com ([2002:a05:6a02:408a:b0:ad5:4c03:2b16])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4392:b0:1f5:6c94:2cc1
 with SMTP id adf61e73a8af0-20108011008mr6057448637.21.1743795659307; Fri, 04
 Apr 2025 12:40:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:57 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-43-seanjc@google.com>
Subject: [PATCH 42/67] KVM: SVM: Revert IRTE to legacy mode if IOMMU doesn't
 provide IR metadata
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Revert the IRTE back to remapping mode if the AMD IOMMU driver mucks up
and doesn't provide the necessary metadata.  Returning an error up the
stack without actually handling the error is useless and confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index bd1fcf2ea1e5..22fa49fc9717 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -778,16 +778,13 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
 }
 
-static int svm_ir_list_add(struct vcpu_svm *svm,
-			   struct kvm_kernel_irqfd *irqfd,
-			   struct amd_iommu_pi_data *pi)
+static void svm_ir_list_add(struct vcpu_svm *svm,
+			    struct kvm_kernel_irqfd *irqfd,
+			    struct amd_iommu_pi_data *pi)
 {
 	unsigned long flags;
 	u64 entry;
 
-	if (WARN_ON_ONCE(!pi->ir_data))
-		return -EINVAL;
-
 	irqfd->irq_bypass_data = pi->ir_data;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
@@ -805,7 +802,6 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
 
 	list_add(&irqfd->vcpu_list, &svm->ir_list);
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-	return 0;
 }
 
 int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
@@ -843,6 +839,16 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		if (ret)
 			return ret;
 
+		/*
+		 * Revert to legacy mode if the IOMMU didn't provide metadata
+		 * for the IRTE, which KVM needs to keep the IRTE up-to-date,
+		 * e.g. if the vCPU is migrated or AVIC is disabled.
+		 */
+		if (WARN_ON_ONCE(!pi_data.ir_data)) {
+			irq_set_vcpu_affinity(host_irq, NULL);
+			return -EIO;
+		}
+
 		/**
 		 * Here, we successfully setting up vcpu affinity in
 		 * IOMMU guest mode. Now, we need to store the posted
@@ -850,7 +856,8 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * we can reference to them directly when we update vcpu
 		 * scheduling information in IOMMU irte.
 		 */
-		return svm_ir_list_add(to_svm(vcpu), irqfd, &pi_data);
+		svm_ir_list_add(to_svm(vcpu), irqfd, &pi_data);
+		return 0;
 	}
 	return irq_set_vcpu_affinity(host_irq, NULL);
 }
-- 
2.49.0.504.g3bcea36a83-goog

