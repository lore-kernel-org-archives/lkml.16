Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8A2BE7D4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682055; cv=none; b=VQ5Xba7NBscNR9dhmfjomzsQWJN54G1eBmDnJqw3/0NDR5Ps33U2NbzJuqPZpgN6l0m06lW1fMXOJktw7YHiaSBjd4CUHt/OngUfzx6nMk1VaFmYZnf8F9SnUCtDqA5+8vVISJ1nDy6QazsVg+clceJ4pTeNsOk0wOjFM7BHWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682055; c=relaxed/simple;
	bh=Msv0GWvGGG8y6O2DyZ8k7WL4kXdKK4vDTwajtNxdEIo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IDpm8kjHMHpSbB2z98yvw/cGA6lnfO2hbDXEkOerIys65Ej36ZqyJ73neNH+NtUMOpBSedE+KT09tGwSqVkYeQfk63rZUTyUEQPJ3spQdBJnCgkQhNUOH/dJA+X057xisWboE6dFqAl3XOY6Dsp9UnQsTCSCPRWSLdoy0DioFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dJZSaasR; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJZSaasR"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so144966a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682053; x=1750286853; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZIGTXeypHh9nAzQZBQedf1Xm+LoLGaDX4jKjQeTbIE=;
        b=dJZSaasRzIJqZSSHVab+5Ko5pnsL3qPBAqXfSBdcWKxO6+472T8tvhphpR2zzhMPf6
         nV7Qv78xPoGmO053tW6x5P8ef7uWZrQsZqSqkhk0bjTkXsvskJRYBKy6RejBPIFkXOqW
         /OcszNQzKzuZJUjQrjw+qiVbCqiuAkSzQTcqBZuHgjBwzHvjrf8y1tuAV5d+ZuueYM2W
         +rQGc+h6Ga08ksKVNfAbk9TQaPqCC9cs2oz9EtO7zaLzS67vgKp0MK9yKfS4cg/OTHiV
         Vj3GE81QT6bUxlXeJX8tVWxo8org1P0oR+/q2S6r4S8RcLW4x7zGhy+RZ7cdiDOxrdgk
         DoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682053; x=1750286853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZIGTXeypHh9nAzQZBQedf1Xm+LoLGaDX4jKjQeTbIE=;
        b=aWuTkOVG347hKvLw8HKWSi0XnQnohNYXxk2QlJG2uIn/wzus0IBqVIHqX483Jk8OR3
         ts6hrv4qZn5GOZX+WgkQaUlPCbvTWnHH1vqKlsCUIZYcwc3hT617R8q3VNxWWNj2V4+z
         QqQCpXrVc40IXezEJyILn9G32sk+syG4IgAhNChonKl8OLDMcCClhxsPxqGDPlK4JEc6
         z6LJqbfu/ximBMAPsuOe/y7QGxmKCqS/5nUTIFGeIUAaPngU3I81BzQ4d/oLSb5AfXCy
         VK/tSKYGsQ6gY7jhemNNq3HyLvnT7r9kbUw4BrOluE2Njibn5KtYm/k7VosAok7jNKKF
         qJsg==
X-Forwarded-Encrypted: i=1; AJvYcCUI2F9mhxZX34IIJdsQuZQiMU8cbK31Cbcvg92a13QFaDSrmbE6yPEXWrhK6skcETJJge1mzbiOkbbZhtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YygkoDWGJZ1N4d7LveabUci0OTCic7unzZZzFUVSk07O4idXqOc
	A4fsr624QrOZn6qk7Av1jrpSBV0Q0DSbGWej8mA1o4KtjvzUMTX8nkd5KmwRWRjprEeCzbW2qin
	BMD+x2Q==
X-Google-Smtp-Source: AGHT+IEMDc4s/X6k49FZuDgV3o04isaOgZ+4Gyq7hnGZguC+YKTMyGOmyVtkAPikERIj/O7QNBKSeMcDWAk=
X-Received: from pjh14.prod.google.com ([2002:a17:90b:3f8e:b0:313:274d:3007])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540f:b0:311:eb85:96df
 with SMTP id 98e67ed59e1d1-313af1abb7bmr8018754a91.17.1749682053580; Wed, 11
 Jun 2025 15:47:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:25 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-24-seanjc@google.com>
Subject: [PATCH v3 22/62] iommu/amd: KVM: SVM: Pass NULL @vcpu_info to
 indicate "not guest mode"
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

Pass NULL to amd_ir_set_vcpu_affinity() to communicate "don't post to a
vCPU" now that there's no need to communicate information back to KVM
about the previous vCPU (KVM does its own tracking).

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 16 ++++------------
 drivers/iommu/amd/iommu.c | 10 +++++++---
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 461300bc5608..6260bf3697ba 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -927,18 +927,10 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		}
 	}
 
-	ret = 0;
-	if (enable_remapped_mode) {
-		/* Use legacy mode in IRTE */
-		struct amd_iommu_pi_data pi;
-
-		/**
-		 * Here, pi is used to:
-		 * - Tell IOMMU to use legacy mode for this interrupt.
-		 */
-		pi.is_guest_mode = false;
-		ret = irq_set_vcpu_affinity(host_irq, &pi);
-	}
+	if (enable_remapped_mode)
+		ret = irq_set_vcpu_affinity(host_irq, NULL);
+	else
+		ret = 0;
 out:
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 	return ret;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 512167f7aef4..5141507587e1 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3864,7 +3864,6 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 {
 	int ret;
 	struct amd_iommu_pi_data *pi_data = vcpu_info;
-	struct vcpu_data *vcpu_pi_info = pi_data->vcpu_data;
 	struct amd_ir_data *ir_data = data->chip_data;
 	struct irq_2_irte *irte_info = &ir_data->irq_2_irte;
 	struct iommu_dev_data *dev_data;
@@ -3885,9 +3884,14 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 		return -EINVAL;
 
 	ir_data->cfg = irqd_cfg(data);
-	pi_data->ir_data = ir_data;
 
-	if (pi_data->is_guest_mode) {
+	if (pi_data) {
+		struct vcpu_data *vcpu_pi_info = pi_data->vcpu_data;
+
+		pi_data->ir_data = ir_data;
+
+		WARN_ON_ONCE(!pi_data->is_guest_mode);
+
 		ir_data->ga_root_ptr = (vcpu_pi_info->pi_desc_addr >> 12);
 		ir_data->ga_vector = vcpu_pi_info->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

