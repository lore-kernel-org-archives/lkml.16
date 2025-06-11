Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347E25D540
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682029; cv=none; b=IbZxW0CZ2xX1dcyvGjgbh2fCiRM6TuwUYZZV6UWWbIdtsN/J+cMFhh0+tvJbdJFX6pZHOMdtHFXVk14TQrmWjR09umEexe65edd4b+M6hw1ANWJFaX3ckFwb274JKZ+IDIww1Ie++l2POMJnnPU2Jdb87BR1DcwUxiuG1OHeBaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682029; c=relaxed/simple;
	bh=uH3944HBJHuIB43VsoJQToz6i7ziH1mBJVH/nneF8+Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WYBWvJRAEYbFfL/uV+BI7k/Zng54vRKpJZnkLXKIYM4aSTzAP+ZpKiyrG5GQ8B69DidVkk7sq3Cjdgdmwp5rszSZCV/L3SOtQXlPhGDyay1GRcjZptNYTpGeRF2prWBL/NLR0asvwBkzOrdILgdJkfnquGERUh8WJQL3hVjvMeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YzkSNUzL; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YzkSNUzL"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74847a38e5eso208230b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682026; x=1750286826; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ul73Yg1mYpP2TE2GLk0RQV/vMJ7XUY0pYKrpo3kbkOY=;
        b=YzkSNUzL8zFM/xv4uygtEThGvN00sDep7XEyI4EfiAyekJ2XmULw4qaDxPP+AVI047
         Mwt3dDoHoJcar99WZgrb+bEvDCko4O/nNjRTHeuv9Iqg6G32Pj0KpDdsp/FHsE+X4OT5
         lvO4SI868LNbBKhQQG/uKFnCdl4idPl1ed83ajQH52+PC0jtOqt6oSTq24JcVTMVtFGJ
         Zjo5+3PGyGRqWabhuLY06kmZyZcpv8Wv/zN1+sGPKMzNUN7DSVN6ZcKFjhLU09rczEzI
         uu1M1vA68EGueO+4SQAJXwWScGUDYqm6eELbb0NmiEYhN8hbnI/BTBWNHEDhOED254Y/
         Q8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682026; x=1750286826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul73Yg1mYpP2TE2GLk0RQV/vMJ7XUY0pYKrpo3kbkOY=;
        b=TLyOqZ5gafAZPuQMa6SWIfM03YlrHog4Yalx2PGCnRMzLoRyl16Uow5qdzBPOznYpE
         P26nLn3ximBuYukKPlA9H4SXEKzmki5+YvcBx5g9qeacyM4jcWQ6g+caCjecv0F06+rj
         3XIhPIUvGvpvMLjIA16+Dm5aqBel6JDHLb2BRPRigDOSJ7MYWmOjFJpvDhH2l1BqXpW+
         ktlfygvA/B+xQa+a38/eGbKx+IPldgSBsD54XTY8NQPwMAS0FRRqy5eeO4PhqeD0naIp
         jR6e19iSxfvdiofE8cQSGrwglzlobDH2FZm2WlPBU+HMZzoQgNpt/rGDQkyLTcVZFnh/
         u6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVq69/KHypxno3E+Xl4wNLQ3v2JU6ehDfx/2SG1mjzpbNV0vq5RCLjkchWkpjIdl8PiC+rcS1/gKQqvAro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjU3YOlMUel2MOZhXTi/97Qnhi270vupbpxDjBM75k1WeYglo
	EcM929N9/vvNtZ4fUpJ9Kn+RkEpPRwpMcjpm07aOZTg0lv/+ULvmcqeMv62TC39sisQGPLvNOaY
	FpSa6CA==
X-Google-Smtp-Source: AGHT+IFnXBC/dw4RfxpNimXIzZIuT6MvY9BKC/MvZnHdhiI65erLZynkQdLm3L4jFFBDrmchy9AfkMLulyY=
X-Received: from pfbay26.prod.google.com ([2002:a05:6a00:301a:b0:746:223d:ebdc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b4e:b0:742:a0c8:b5cd
 with SMTP id d2e1a72fcca58-7487e2bf8cdmr1044283b3a.19.1749682026328; Wed, 11
 Jun 2025 15:47:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:09 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-8-seanjc@google.com>
Subject: [PATCH v3 06/62] iommu/amd: KVM: SVM: Delete now-unused
 cached/previous GA tag fields
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

Delete the amd_ir_data.prev_ga_tag field now that all usage is
superfluous.

Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c             |  2 --
 drivers/iommu/amd/amd_iommu_types.h |  1 -
 drivers/iommu/amd/iommu.c           | 10 ----------
 include/linux/amd-iommu.h           |  2 +-
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ed7374f0bd5a..4e8380d2f017 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -938,9 +938,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		/**
 		 * Here, pi is used to:
 		 * - Tell IOMMU to use legacy mode for this interrupt.
-		 * - Retrieve ga_tag of prior interrupt remapping data.
 		 */
-		pi.prev_ga_tag = 0;
 		pi.is_guest_mode = false;
 		ret = irq_set_vcpu_affinity(host_irq, &pi);
 	}
diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 5089b58e528a..57a96f3e7b84 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -1060,7 +1060,6 @@ struct irq_2_irte {
 };
 
 struct amd_ir_data {
-	u32 cached_ga_tag;
 	struct amd_iommu *iommu;
 	struct irq_2_irte irq_2_irte;
 	struct msi_msg msi_entry;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index f34209b08b4c..f23635b062f0 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3887,23 +3887,13 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	ir_data->cfg = irqd_cfg(data);
 	pi_data->ir_data = ir_data;
 
-	pi_data->prev_ga_tag = ir_data->cached_ga_tag;
 	if (pi_data->is_guest_mode) {
 		ir_data->ga_root_ptr = (pi_data->base >> 12);
 		ir_data->ga_vector = vcpu_pi_info->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
 		ret = amd_iommu_activate_guest_mode(ir_data);
-		if (!ret)
-			ir_data->cached_ga_tag = pi_data->ga_tag;
 	} else {
 		ret = amd_iommu_deactivate_guest_mode(ir_data);
-
-		/*
-		 * This communicates the ga_tag back to the caller
-		 * so that it can do all the necessary clean up.
-		 */
-		if (!ret)
-			ir_data->cached_ga_tag = 0;
 	}
 
 	return ret;
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index 062fbd4c9b77..1f9b13d803c5 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -19,8 +19,8 @@ struct amd_iommu;
  */
 struct amd_iommu_pi_data {
 	u32 ga_tag;
-	u32 prev_ga_tag;
 	u64 base;
+
 	bool is_guest_mode;
 	struct vcpu_data *vcpu_data;
 	void *ir_data;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

