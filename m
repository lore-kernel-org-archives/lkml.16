Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0AF2BE7C7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682054; cv=none; b=b2sWmW4NU1bnXgmP5Hujqjc6Z6LHhpgN1WFKIGAN3GC/2yTpV1KbJuhO57f9rdhuTfjBZ2ro+qqPGXgtWVQsQ91gLTf3taIb/tlM19m79I73rLxwXltKyVc+mdnlXFnKayyEA30J6x63K7mLDHvnwZDD6a7xFF8zpItPTOJx4hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682054; c=relaxed/simple;
	bh=6xeI4a4E2L5iZluJbUpn5b0pKmI1OHAnWyrU152u9j8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rqd0lJp51z9H8hBrjM4aI8A/cnm09R4wsPjzG6T+exieFmAAPM01xF67QRzKn2o7SF2N5hxPUfs5EWCwQo1M+C3WVR27F5Q0Gkz/TPQ++njKyH1MpGCS7GsrIqYazn2m7caCm3GoZmMJlSqqGrTx+suHDmH3RZUTI5QehyhrSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cm36lAJb; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cm36lAJb"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so291780a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682052; x=1750286852; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mJpXUJytIbm3VAV6gPKHVB1w+/ruLJcvPcUst+w6WTg=;
        b=Cm36lAJbmUkRRTMot2MI6rRI0a3IyHtqRiuC1A3l63JuBXr7D1npj45nonQUFwBsVN
         xA3cOcjoE9UXkFTUGDYUy4SHA+H9VSKQ9ka8xh7Kkmjmi+KtjcmpRhC32C5cHC7ag5a8
         rqwkOl9TW40pYdtHi7D89BzZMYknX5Fm0g0t3+fcZ92CuP6dUMQGQoYpRdxrsTfG/2m6
         LtX6StVvsDBTIe76FViLg4WmSdxtvY7aui7NpTvPG3eCj4uBBhOEhlvpjqssOB0xypZL
         qXlx2yejohmXYVNbIqxt8tLtCvNB3s1LJzWMRj/HleziQXeqFdkPfyXMF0W7iYu+v99W
         sOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682052; x=1750286852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJpXUJytIbm3VAV6gPKHVB1w+/ruLJcvPcUst+w6WTg=;
        b=WzX6bfWxShzvJ7wQ5k8g/SE8Q21HSTusqX3dMYJM7H4+193PgdXWsmRGHUoAnxtnU6
         OnURtS7ekHEEsxdYDcn//PRMbhhBUh8+V2WdIolIV+5fNF7yQIfLW+eFfRKdehIAmgxF
         RrFaLRZtqjLjr3Ee1HdrpEuU4Dx6cE62UZwkvXJRqcF+H/QVQQhNig7yqn6NYea1EPC1
         lZfwmXU6s/EfzVoSFNHmGYovSuUG63HTX3BTIUn7fRy/noejbG4LR1U+O0D9gvDkrELk
         yPELbA7oqVxHP3OExefAb1u0gePJJdNGQmTgar8vRz3Q92GY1m97C6RYc2rYTODJoR10
         kPtA==
X-Forwarded-Encrypted: i=1; AJvYcCV43C7HiXqJs2i/MeMmPVUMq2SMLe0J6IQl/oD3ZuNzF6sGVQE6d2IuRgMZJcJb9LSt8CsqWoNqDJ9wWqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRBVJrk1402JANgKEgDOgeDCHx9orMKMj0WKizWziNLEtH5U7
	6/DYbeMy5tslH7D1nls9bhVhG6fOe9JCLj2amUpIgNEeAN5wbUCxMHup0Aaj1YbTCwm71QVJ3LQ
	r2yKFZQ==
X-Google-Smtp-Source: AGHT+IEOHSUY5e4l9pkIll+BMnplm+wj/Pa0wfxvBvvvlZSyn0/I6Q4pgQjupbgMtAUIFW7CStkaT9e8/ZQ=
X-Received: from pjf16.prod.google.com ([2002:a17:90b:3f10:b0:313:221f:6571])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53c8:b0:311:c5d9:2c79
 with SMTP id 98e67ed59e1d1-313bfbf5074mr1496750a91.21.1749682051843; Wed, 11
 Jun 2025 15:47:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:24 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-23-seanjc@google.com>
Subject: [PATCH v3 21/62] iommu/amd: KVM: SVM: Use pi_desc_addr to derive ga_root_ptr
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

Use vcpu_data.pi_desc_addr instead of amd_iommu_pi_data.base to get the
GA root pointer.  KVM is the only source of amd_iommu_pi_data.base, and
KVM's one and only path for writing amd_iommu_pi_data.base computes the
exact same value for vcpu_data.pi_desc_addr and amd_iommu_pi_data.base,
and fills amd_iommu_pi_data.base if and only if vcpu_data.pi_desc_addr is
valid, i.e. amd_iommu_pi_data.base is fully redundant.

Cc: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 7 +++++--
 drivers/iommu/amd/iommu.c | 2 +-
 include/linux/amd-iommu.h | 2 --
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 3cf929ac117f..461300bc5608 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -893,8 +893,11 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 
 			enable_remapped_mode = false;
 
-			/* Try to enable guest_mode in IRTE */
-			pi.base = avic_get_backing_page_address(svm);
+			/*
+			 * Try to enable guest_mode in IRTE.  Note, the address
+			 * of the vCPU's AVIC backing page is passed to the
+			 * IOMMU via vcpu_info->pi_desc_addr.
+			 */
 			pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 						     svm->vcpu.vcpu_id);
 			pi.is_guest_mode = true;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index f23635b062f0..512167f7aef4 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3888,7 +3888,7 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	pi_data->ir_data = ir_data;
 
 	if (pi_data->is_guest_mode) {
-		ir_data->ga_root_ptr = (pi_data->base >> 12);
+		ir_data->ga_root_ptr = (vcpu_pi_info->pi_desc_addr >> 12);
 		ir_data->ga_vector = vcpu_pi_info->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
 		ret = amd_iommu_activate_guest_mode(ir_data);
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index 1f9b13d803c5..deeefc92a5cf 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -19,8 +19,6 @@ struct amd_iommu;
  */
 struct amd_iommu_pi_data {
 	u32 ga_tag;
-	u64 base;
-
 	bool is_guest_mode;
 	struct vcpu_data *vcpu_data;
 	void *ir_data;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

