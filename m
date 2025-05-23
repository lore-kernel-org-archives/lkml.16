Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEB620C489
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962044; cv=none; b=cqmC8wAwKUnlTa0eWYmA57/Zk04Zq0vjIQ3Xey4VfS3Ti11AyrEGUebe0+U6heVzatNu0f7nAY0dD0wz85TBWigOyWjzVxZJA93JIQsxVT10eDKJyAW9MJcYwQdyec5QvGbqt7dAu6v1l82TCz90/Pyh0N6OvyilHVUWrh5bq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962044; c=relaxed/simple;
	bh=J1mv6D20whYTlmsfDBfjzwzrzJ6/jskwNzsjA8aeq6U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ARI0/5T0griv8XELcbilaqmkA8PcqnfI0OufzkSykQaszI2sv+RaFIeaxxVw7jusOw0KW0gQOzV4gpSJaOhsP1n+TyQXOF/Tubk3ZcBWjDsTqNPH5TBSRFZXkxnghvdvJe2RnpyDfZH6ZjKUPufIRfQiU6ZvYtZor+w+An5rk50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ku3bRi/A; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ku3bRi/A"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ebfc28a1eso8132026a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962042; x=1748566842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fKnvJ2LV8riPZoPU3O/CI+BFOmSeLWZITljIzp2E0GU=;
        b=ku3bRi/AaUAkD69ojG0a4y4Lzb/7HqhBHhvyixgQ7+vQ9f9qezSJO90hecb1JuuWjA
         YTOqutPagSMnC6/O7qvBgw+cFc+xB/Bfp1E4Fr3YinFmT5UqcfRvkhKl0yizrQBit9sN
         WOEUC58pqlkq/blieg1IsBbOE5SZ7oIo1vImPOdcQfLJvzQN2cgbVVIhEFTXciY9iP2h
         tolnGoB1fpE7wAaRneCEe6TNcEOZln7APHmh1AWuw+29Ko0PD+papCTO/IV6A0VBKeve
         hw9PZWkjMQHB0+I7a4pCWynJJGjaKjnPISWBr0lWr4FbMghtNIyA8Ct5tF/7ebK2asCF
         77Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962042; x=1748566842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKnvJ2LV8riPZoPU3O/CI+BFOmSeLWZITljIzp2E0GU=;
        b=vE7YtnWOj2dayG2+67g4APSyVClVu1l93EeX7f+x+ATpc1hKuAuwrQLqCJDBgwis5f
         boUnYtkvQHA6MgaiBwJLVQNPQj2rhslwf7vnuN+O6pmvEESM0CrZP/HT6+hjihJSIGyP
         JXfA0mUgpOWv1SS0AvdlHdJu2G2JlFi8mkuqIgauJSQ0H/MaJaaiwrUM2e/xN0Li5i1J
         c0dvwO/PVOX9OeoWRZ/c7BEeCtuywWT6ja/5i/olnKUaaJGWaFIWvm1/UA3Aa53g/8rx
         2JJUKGETYXBMOMF7sHQ7+xTZ+A+gV6uPbKPZ1evhojr9Y3dYjZCgr/TbF4uM9YAl8Ei+
         GQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUtur0Yri9cvcINMl87YhR2d6OR/kL4EaU1JaAYr/FvkKLD7v263dW+fEqg8c/Mx2mKgOf+LyJf5DoM/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh5nPHh1wgwkvBOUIv2/+Ma40MQrKAU7AdDDwauvuT3Rez6zvg
	wy0fyVgT7Cjd63r/m1fcmepMsBrp6SwS6+j+4uomiuaNZUWXT/9o9UuW7GzQxiWqf5uUlHY7gr5
	Ed41icg==
X-Google-Smtp-Source: AGHT+IGR/Df5BJxs3ol6VXQkpzy/R+7lIXiH+7qF+fijHNHGe4vwvP4VxYidt3ojzy4f91Evs8kBdHkzJi4=
X-Received: from pji7.prod.google.com ([2002:a17:90b:3fc7:b0:2fa:a30a:3382])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5746:b0:2ee:f687:6acb
 with SMTP id 98e67ed59e1d1-30e830fc346mr35983530a91.13.1747962042547; Thu, 22
 May 2025 18:00:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:24 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-20-seanjc@google.com>
Subject: [PATCH v2 19/59] iommu/amd: KVM: SVM: Use pi_desc_addr to derive ga_root_ptr
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
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
2.49.0.1151.ga128411c76-goog

