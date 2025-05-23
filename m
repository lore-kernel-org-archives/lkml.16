Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843928AB1E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962071; cv=none; b=OA2KPhewqUXWiHAxnqWeIcPnL6Ja+J5VBoLaSRhHOKRfTkf7svrb64CypoWm2wOJroSv90DFdFNnQFkeB5AySs3kfji+bHM3xLsVsNHHlKphXPPLK4TftKKqToqPrdDfqqvO9BsswxP3bwL2W4KqANh4e4YE8GGvrOrRusg2lzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962071; c=relaxed/simple;
	bh=U0lXuztKsbQ6vOwPvXvlCRdfHq5pEEfqlrsbN4zSEW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oX19wd43UGoZpdiXtQPBOxclnQn0EvXhzsM4bdxTyzrIrOj9YDp4ILy5rWRX361SQsHJDcVcVqxPV7jVGiNmlsiuEYzQMMwhat4nIJtDw4121YS482Dt11KDTDoa5pGgSdXg23kpWTWhNkqSwRjkvqcKbymWBcQGfC0Rt1YbzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVanIT1O; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVanIT1O"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-310e7c24158so475009a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962069; x=1748566869; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kq0Cy8cDTnLLgDeX9paVAv72AILfWzwvKgS57Jhig+k=;
        b=MVanIT1OoPcg09dBZnLcXW8De7OJ0LFWlYH8rZ4qfuVvFuybkdcwngH6gPaG/uXfI/
         WQkQ6PgcjGDQFxVSowHjupTbUM0MjccPDq5iZazVUufPUTzFKBAZ1s0M5zxnFYnBMxI4
         kvUQ8CiGMsaMtxcV7A82nRgGMhXvDrJCsshx/qcFcaMvCxYTYGni8V70/eiRaeHGGRcM
         NZUHYSNkY4UD3z5yNlidzEIwbg/EPjuYALj/t0gUay1rpRNxUFNvwp8VmQCpOyXx2SiI
         aU5NZFgu/8b86iT6DAhrWrhpdBV+YTtJC/YE2JP+7O7Itq0NlGsrlQAb7++rFEkuVPcv
         KlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962069; x=1748566869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kq0Cy8cDTnLLgDeX9paVAv72AILfWzwvKgS57Jhig+k=;
        b=Yvk/vI11L4AnIlO1Dt0lK9Mh4vPcdKxKhnR/bmsOnYc2U/R8izgYzizHU9WE8/UKg2
         E9PqXXVvlK5P5L1J1z9x/orC7g+O+eLKCIrL6SL5L813IWC4TfbRarMQFe2023Rei2qY
         cYS0sxMklgFN5wX70NKuC+768twMFhVtFbQjzaq6bJKnaySc2876gbDGoTxsxDwmqyGe
         OlhJInC8XrPxBmATxTNoIB5wGwyRNbb5+n2aFZX5g5DjprQyV1NRvX4U1HDkAAA1YUa+
         TAKSiyyOH+1S/M3Grfq8q1sTQpj4xP821+mhk8UmYxzvPBRSxfZwB0WFliWE1BwCfgaZ
         v8yw==
X-Forwarded-Encrypted: i=1; AJvYcCXWl7lGhd9q+3O4T1Qr6uJWNtdJ5/17MmW76InIH6MtOXvnNYBXjrRMtpRGCvuBMQbhXmcbcvsLpvGZaFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaQuH3izEB9Xhh7vZowkG8yJlYKYuzjgKep0U90U/CYWEnZSnd
	2UOGnal8D5/8FLFVntrmf4Jnru+T6JUWRMTDTldS9PdwGU6uAt+k6yDEfrEk3u2dwAXKaakt6l/
	tumWh2Q==
X-Google-Smtp-Source: AGHT+IFtGk6LcnmjIj0taAHjAXYUJ8hEzTCCNrk1y9BpY/2QgpzZNWMJPoqJgLycpc+0uJxQVWlfD9j1X1g=
X-Received: from pjbpb5.prod.google.com ([2002:a17:90b:3c05:b0:308:670e:aa2c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec8c:b0:30c:540b:9ac
 with SMTP id 98e67ed59e1d1-30e830ebd3fmr44143328a91.10.1747962069037; Thu, 22
 May 2025 18:01:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:40 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-36-seanjc@google.com>
Subject: [PATCH v2 35/59] KVM: SVM: Revert IRTE to legacy mode if IOMMU
 doesn't provide IR metadata
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Revert the IRTE back to remapping mode if the AMD IOMMU driver mucks up
and doesn't provide the necessary metadata.  Returning an error up the
stack without actually handling the error is useless and confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 97b747e82012..f1e9f0dd43e8 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -769,16 +769,13 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
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
@@ -796,7 +793,6 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
 
 	list_add(&irqfd->vcpu_list, &svm->ir_list);
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-	return 0;
 }
 
 int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
@@ -833,6 +829,16 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
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
@@ -840,7 +846,8 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
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
2.49.0.1151.ga128411c76-goog

