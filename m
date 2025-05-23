Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527A217668
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962095; cv=none; b=Jb7Si0N5LqmRY1DalVTEdSYJNnemc7DFFD/GLI9RNVPyIRPTNdZSF3QomdYS1drbF8Xb3uR8fEottus8njKCM2hq6Bz9sTWU4BhcsdO78AbtJSZSAeNyHZwK5LUqzyHWSwbkjSFSOWna6IHr9NAS0cWQXxHYoIet9CUA7S178eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962095; c=relaxed/simple;
	bh=65fTcpLjkBtBO6xCL7Lqhp4uS5GSGwxSjcQbFJFJsvA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k+9cDIYKhtnSaO1CDkqjVZNt2cEm5Lc8V20QcqVYXXoEPuAo1VIQoKDFYn+j68u4zumsR5fvIWxpMMiugQbtfKZAoF/CdRKMHroijs6xYSnyzEV9UJEBG84EMpMRuwE71HD0jrrzdPVi2tX2PQtn0LB5S0U6qtkWgE8jML9PD+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mEgUxggE; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mEgUxggE"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so1192297a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962093; x=1748566893; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jRZ2pwWogb5EDz58ANC8fmbpd84fTXnIK4G2GwCRUWE=;
        b=mEgUxggE4ANPOZJ/Yw7o/codY7ZTjLK/+INcsSrpm4Q3VH3O2wAbzsNCQD7t5Z6La4
         yg9N6trVJRGGAskZksa4X7QmO7H3OnGi4DeMcfIIkqtSqS1aBkyOMxYMdfRE7/fhzqx2
         K0z3m31BYTjxAD8NvxpC2asSzI53jHAwYp9k1GzKl3TStiBs2jZALIXHp9Y44XHUAODL
         QtAi7f2izUoIHXUIelyP8AavYfN+4NNBKc00r/IINmrbnNURmx6NKjpQFBIXfoBiYg1S
         oBRenKJBnQ206Z4wOxJnOB59pKPCoOiuU1Esq2zsd92B83sVyrZ/Dg9NWoqhu9CJ+p1N
         70SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962093; x=1748566893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRZ2pwWogb5EDz58ANC8fmbpd84fTXnIK4G2GwCRUWE=;
        b=ezxz1JQv1AB9itz/S0+ey9E0RXjfO6L7p8NU2j+87MJWXdNKidQ5eYc0n0psYwso0U
         aA2rjbuFPTNb5XhQVSK7fJCQpB5WiuP4cZ3sl8VUJjZP6eJfIiJyTpkpy4b2mNxoyvpL
         Cx1cDFw+Fr081BSMWWsHv1HT4H1g/0dzMQG7nDihcA1iTlRdO2olmH2tWOw/SdqvZ7mv
         LHa8UH7H1SrSXuzprzoKkNzYY1iREbDPRXwJfEZGMFEjkJQENcIliOr/D7cX2quVaQ5X
         zDXDhdpA3A7UyZ1JpODxPQQsEBIY8bUFhf1D8bJY0Mo1JltSmu3hFu0viuL9aHKVxCHg
         sVTg==
X-Forwarded-Encrypted: i=1; AJvYcCWzDD/30ix+Z5zt36IB2Epqisw4VElzY7FZdbFJltuWXLEFEPXbAxf6VX/p6ej/iGwHFya25Gcxua5/EFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMxslzBQxseQj6NyCJUVqkNyICR2l1hscGL21+ts/8yhKL4dT
	CiRDb2KWLWTNetLHuT/4OUb5HzczBuk0mIHtygSeOS/Pum+MHz8+OtJ/IM1Un8NQ4F3j4VkHq7d
	SejGl4Q==
X-Google-Smtp-Source: AGHT+IFyeeumFKhc4Yu6rkIsxyO1z805cVfyQ8R0sxgmiUuh4VdwSV11ZDutI0EPEQI70l4STndzesKeIW4=
X-Received: from pjbsi3.prod.google.com ([2002:a17:90b:5283:b0:2ef:7af4:5e8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b48:b0:2ee:d433:7c50
 with SMTP id 98e67ed59e1d1-30e7d5ac7ecmr33847409a91.23.1747962092871; Thu, 22
 May 2025 18:01:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:54 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-50-seanjc@google.com>
Subject: [PATCH v2 49/59] KVM: x86: WARN if IRQ bypass routing is updated
 without in-kernel local APIC
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Yell if kvm_pi_update_irte() is reached without an in-kernel local APIC,
as kvm_arch_irqfd_allowed() should prevent attaching an irqfd and thus any
and all postable IRQs to an APIC-less VM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index af766130b650..b6263ab4b18d 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -517,8 +517,8 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) || WARN_ON_ONCE(!kvm_arch_has_irq_bypass()))
-		return 0;
+	if (WARN_ON_ONCE(!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass()))
+		return -EINVAL;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
 		kvm_set_msi_irq(kvm, entry, &irq);
-- 
2.49.0.1151.ga128411c76-goog

