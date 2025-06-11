Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A572728DF02
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682039; cv=none; b=OgLldxj46Dc6fhpvrRmsD0l5XO9wjp+XXXBhcu+6l5JrQ+pywfoEFCEjWXC7RqX5i8yI+CR3O5UOQS6tJI4zvvHUq5y1azW4iPTM60U4zp0AuRQxk7yRwKp1ol6lJyugKSqFdra98Y7xjkGnjD+h6cbZLM2VBc9s4nWP855lY2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682039; c=relaxed/simple;
	bh=ZvxMee+M74yyMDCh1Cp27bOE6Axl+myAAsmFFa1V3xo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e4Qm0r2P6OyqYp1tdMkJTIXFNwQHUKFzdR1Y9sPrSSWZvurQPkqbXUufYmLxo/cP8lKe1QAzHPrr69hhTmoYS6kjyozs+f1Sb6VWqwVqBJwj2DRlIbAzubrHyzO5dQGoyYYQw6JUYlL1m6wepPNXen97+f9SKezHUqaPxSEoWL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aSIfgC8f; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aSIfgC8f"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-745e89b0c32so580536b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682035; x=1750286835; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Uk2iCAGJzrguXHDElw3kCcpBtr7DWJxGiIVAHEgt7PU=;
        b=aSIfgC8flkrK6ZpJm+TWY9/0MyoEBRE+/YGTht1K5u3EAwkznB5QBFYgr8BvVJ2jvK
         lDFi2m90EKfBfZz+BaLVpdsM0V6uDsl9nYHOxrEodc7aQjZsRyY3jZgDjmFhZvZ9R3/F
         75RxK86kd9l33wzZkWGoKduUpPPS3xjs0W4frE3AzKm+lx0SoKMBkS/GkzC1FMQrypSz
         FjzjtdyxUFWRJnud3uyQ9pwBxvI0scXZAZGN+G168AHA/m3UKZArbY+HEmTmUGrL7cli
         ZN3CX/dKvNj7nV/CwbvfmXp8/vJasIQH55NhaU6hukVaF0MNiclYVQbvZkWaJRqWICYw
         N+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682035; x=1750286835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uk2iCAGJzrguXHDElw3kCcpBtr7DWJxGiIVAHEgt7PU=;
        b=PlFj1peUHgYOEN6/Fuom2kFblBO/9a5MdA67KnebsMrYfRnV5ubU9TK/2gu1rdMpig
         +bzSWFtVyeDsj/HQiat0fu+W8KdmpNHrLPmCLius4sLGKc3HJWlVJnzqH+mkdIEbu8dd
         Xzd6x6a9fJNM6A5T9jgGzLVYRilPhZVz+kISXM/hVr5AEOENk8hlszR/noxn58OkFOxb
         z0mPGRBlWSo2bc9ZeHxMcSiDwdjjdgVenD+aRLP6MddJgle2J59zOZbAxc33wIiXC6c/
         ZFHwcwxKX6ca+AlNTKLQGk3lUAAaM9sXT8RzVwDSMl4pZ4qhILkEIfYhVIg5m5Z8kbqe
         Aysw==
X-Forwarded-Encrypted: i=1; AJvYcCUhj0wo1N6ePkFx6vrsKnBVFZ9cUfPOIM4i/KgslXogZQ3fRk3vOtnrEE9ImyGQiyuydc1nIBFTXcpxjxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG30U9gqdeJmApmnqDXdva4Vfj8JRy2BYHHk5uqYRuGpc8Gjq8
	HLBp6Xk+by6/dNQ/6IjoIkiHSBeh7TRFJUkFJZk64kG4Nvzc+W65xvRs+V+KMkRKEnW3M5pt4nj
	SP8oT/w==
X-Google-Smtp-Source: AGHT+IGox2X2Zreqz4euwsJYQpeNVHu/PrMeM6P+22mIkRw9tS6EPJEXitiClHg3UaYo284wvAOiHfeC7Dw=
X-Received: from pfbfa12.prod.google.com ([2002:a05:6a00:2d0c:b0:742:a99a:ec52])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b95:b0:73e:598:7e5b
 with SMTP id d2e1a72fcca58-7487c207d5emr1537775b3a.1.1749682035598; Wed, 11
 Jun 2025 15:47:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:14 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-13-seanjc@google.com>
Subject: [PATCH v3 11/62] KVM: SVM: Drop vcpu_svm's pointless
 avic_backing_page field
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

Drop vcpu_svm's avic_backing_page pointer and instead grab the physical
address of KVM's vAPIC page directly from the source.  Getting a physical
address from a kernel virtual address is not an expensive operation, and
getting the physical address from a struct page is *more* expensive for
CONFIG_SPARSEMEM=y kernels.  Regardless, none of the paths that consume
the address are hot paths, i.e. shaving cycles is not a priority.

Eliminating the "cache" means KVM doesn't have to worry about the cache
being invalid, which will simplify a future fix when dealing with vCPU IDs
that are too big.

WARN if KVM attempts to allocate a vCPU's AVIC backing page without an
in-kernel local APIC.  avic_init_vcpu() bails early if the APIC is not
in-kernel, and KVM disallows enabling an in-kernel APIC after vCPUs have
been created, i.e. it should be impossible to reach
avic_init_backing_page() without the vAPIC being allocated.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 6 ++----
 arch/x86/kvm/svm/svm.h  | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index c36f7db9252e..ab228872a19b 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -236,7 +236,7 @@ int avic_vm_init(struct kvm *kvm)
 
 static phys_addr_t avic_get_backing_page_address(struct vcpu_svm *svm)
 {
-	return __sme_set(page_to_phys(svm->avic_backing_page));
+	return __sme_set(__pa(svm->vcpu.arch.apic->regs));
 }
 
 void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
@@ -281,7 +281,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	    (id > X2AVIC_MAX_PHYSICAL_ID))
 		return -EINVAL;
 
-	if (!vcpu->arch.apic->regs)
+	if (WARN_ON_ONCE(!vcpu->arch.apic->regs))
 		return -EINVAL;
 
 	if (kvm_apicv_activated(vcpu->kvm)) {
@@ -298,8 +298,6 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
-	svm->avic_backing_page = virt_to_page(vcpu->arch.apic->regs);
-
 	/* Setting AVIC backing page address in the phy APIC ID table */
 	entry = avic_get_physical_id_entry(vcpu, id);
 	if (!entry)
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index cc27877d69ae..1585288200f4 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -306,7 +306,6 @@ struct vcpu_svm {
 
 	u32 ldr_reg;
 	u32 dfr_reg;
-	struct page *avic_backing_page;
 	u64 *avic_physical_id_cache;
 
 	/*
-- 
2.50.0.rc1.591.g9c95f17f64-goog

