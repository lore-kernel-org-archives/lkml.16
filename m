Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1BC2E6D10
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682080; cv=none; b=C8LcaABFzA0OyAPZZr5pJoSccDsK806teHbk+2c2io+ZH40Ox7H3/FWBj7p9djH+iRfNdplV/IWDp4EAe8F0Xqfznj1M531FKxNHoQqFzGHrT/ugcfXXd4UoZlU9CQ0xTuf5o7/yzvs24+c3L37FLSGD3z9KmsNqM1UscQdwnsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682080; c=relaxed/simple;
	bh=i42G1yIKz6UNXah+vwwlH6gSGjE2qsFjyhLN1QFtXLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oVVUTez2kbxE6NkGqnC8t+31e8dBaesKhRicjzVU9KYhTZ9QBw5uEjEfjY6GdYWC5Wh1cFfYxlsFlraPhYzG8NCLu5cwPYhuJPjofXFLJ6oz5ejmg6B6kyBw0DJfCJLzT5xhq7qsrkV3hPl8wvFYKPyXrl2XEk3GuwTaYgr5XGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGgbHJZy; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGgbHJZy"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31215090074so514695a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682078; x=1750286878; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aRbYdbPjfnXABceLxP6T4VwYA6vT74WXjV6qwqEpIRA=;
        b=uGgbHJZyghyXGOPw28liofswcngU32FDmw8OkRWgKC/hbYg+9CGlVHsuKE+qjve9PH
         mmV46PRvZO3a2E6ZiZRxA2vAh8K0T4yKQyGFUSiZrluk6gwfnre/yUsqbghDyyfXQLI7
         sFxS50CGEDdS9+hqlu7ZRuEBDyAlW8cMdORWie5CY+MKDiIGaugByXgqvu9nTmUuxQH3
         kPjCH40vPZeM5r3o7p6BXxGlNFHgoshXZf94ay0Tp1khFosMxAKXG15E+tpH2GiJM80C
         enZUos77KcF1ZFK/BeaUfSiHrFQETAhmjh6MUJgZ/Fd2b5fDPJNlijshpj4ntDShYiy7
         zlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682078; x=1750286878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRbYdbPjfnXABceLxP6T4VwYA6vT74WXjV6qwqEpIRA=;
        b=G8XFYm+ek7cFrDGHWAvvkILAqS2TR0oB92groHR1zQB74GxKw54muKaddQ3z0M+3Xs
         ztYtWRgt9jWAH1VKVSnjXW5DmsnuRqpL9iRXXsq+0vOjYs1qRS+U34cMrmBsKdtXPzlz
         eKQkuflHfvL7tW9HalgjHU5pGx2qasUfNjjB6AGdGgBeTghdAy039cKfULj7MnsggShq
         brWXoDkthGvswCQwo/soqwD315ODRmQfmEGyBRNkBuT5qViydo76EBagsjScqphNJEJA
         q6ODMps7iRoxVCRfgYd9MtTCRbiU0Cg0RyA9L8uw4I9p6jo3m3UJ5bDFG7VRzRMd+gY7
         0Ktw==
X-Forwarded-Encrypted: i=1; AJvYcCUopJbqJFxJyEDXU2z5MhN9x9ZgVs8Uk5aTK5AM5WGEjk90/06q/wk2KYb0OX38G73M9ACkOW5+6IUoOhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeP0QbpLku9gz0DQunb1fpeslj4rUK8obHxrYSqzKmR0qLDRi7
	gpOAinqozJsJcnZMU4OPUvObWlWg2PR4Wo6vvYebKIDn1ZwAqEe5tr4rGs+G9hYg8ctVN/SA9ef
	ydx+h7g==
X-Google-Smtp-Source: AGHT+IHb+Zv/4CcMgQT32iC66PSsxBVu4fJyVtFcuECRvVY6yAdTVQgUPpLO4I1bFnUpFw9nkCh9cXpZUsg=
X-Received: from pjbkl3.prod.google.com ([2002:a17:90b:4983:b0:311:c197:70a4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ec8:b0:311:a314:c2ca
 with SMTP id 98e67ed59e1d1-313c0667dbemr976034a91.6.1749682077795; Wed, 11
 Jun 2025 15:47:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:39 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-38-seanjc@google.com>
Subject: [PATCH v3 36/62] KVM: x86: Don't update IRTE entries when old and new
 routes were !MSI
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

Skip the entirety of IRTE updates on a GSI routing change if neither the
old nor the new routing is for an MSI, i.e. if the neither routing setup
allows for posting to a vCPU.  If the IRTE isn't already host controlled,
KVM has bigger problems.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 43e85ebc0d5b..4119c1e880e7 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -618,6 +618,10 @@ void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
 				   struct kvm_kernel_irq_routing_entry *old,
 				   struct kvm_kernel_irq_routing_entry *new)
 {
+	if (new->type != KVM_IRQ_ROUTING_MSI &&
+	    old->type != KVM_IRQ_ROUTING_MSI)
+		return;
+
 	if (old->type == KVM_IRQ_ROUTING_MSI &&
 	    new->type == KVM_IRQ_ROUTING_MSI &&
 	    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
-- 
2.50.0.rc1.591.g9c95f17f64-goog

