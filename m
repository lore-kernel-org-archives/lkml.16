Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484732D3229
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962091; cv=none; b=aCrZmoUWrCUMMw48C8OhYFx2JYRVavWxRC0IaJlF5NqYoB/CaGaDeHF3he+qWsUpc4XVy5NDkBmwL1vsuKGJ3N3R/gQAbFIdvvgugnKYJGAOl7kY9qOYOC4WA3DZwxc4oZnhSjLEtGOrX29DHYEvMfVMAx4rCVbAKby7SG+4nHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962091; c=relaxed/simple;
	bh=AMRZmDoiaK20f+IpNDlcqYN2AhFBOCz2nspxKJfmrw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NOT54EYurCh/9weZ1usxwuKYWQoVgwY/y1EZ69qwjNvUtp2sTW/I3aCcnXaeqpBs23UTFuxoqxwWnrqpeMavsu62kUvFoHmwkLejYdF+AZXb43mhT8V2GveE5SmsyofDemHr8LdVtY4kyTAbt6HPEEczn/4Cg2EE8v5++tLAeHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=no6xGc//; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="no6xGc//"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3108d5156e8so3442715a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962089; x=1748566889; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=j1lrYko58mfUpTnz/5S46tcMBGz9QzsmcN9d4X8ezso=;
        b=no6xGc//ijKN2W90VkNAp79cSjVZy4QvopPI/VkayNo3fe9y3/AGJ4nIQuUa+jh0un
         ao2D/2YprlPiPSTmivjYGAMbAvMuPvjs5pW+NLodFvT2hUu3bAjAPj2szVVTUnHj+fj7
         q+kZsYajk7f48WtRvm5wfyk9DYt3MEIJLe7am8PTCliGaWGKQzW1WEnHtzvKHunz1glJ
         u4Fc2TFP1OTMgSSsAp2wKfyfL/tJHZwZr3r2i66CE5GyRl8TGalNG2n04qV7RqY/781e
         EEbOeTgNmcS8YZIZxFnhtFM8YGrKieiIY8JENyuAoqtGvH49xSpExB2+2fu8RSSfTZve
         sUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962089; x=1748566889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1lrYko58mfUpTnz/5S46tcMBGz9QzsmcN9d4X8ezso=;
        b=nYSS6lUH7i+HwSRpaL+TCGGH0rY/6z+Llz2OHOOjd+xYJakqeMBYvdAQK2t106hsj+
         0gH8qOs4jFlThZBuDtSoxR6Vx9frfFKCqaTlvQTd7PBV5fT3A3rmg4tNGeWs2syal8Ll
         RueIEkWI4dniE9CNV17ITZugrsMNLp+/cKCZcNol6lyMu5woUp8DrRAqtQaI4Cwj3Q1l
         oXDVtaZ32rpOSKrLOYkuwtz4VIFvku4t6sHdtLOF5FXo5ZvMebzRMsWki5EjaqC8mdE6
         PwZ5+FLGUYnZn0EBh9SW90m4ZNRKlqlBSmzrmpYue1l1ngXO7iPqcq1j98pvP6mqGiN9
         ffOA==
X-Forwarded-Encrypted: i=1; AJvYcCXFVN86vylccKU+8QFLJuqbIcoDDXxMz8Zhhbf+6dJ29nmYocwS7ItmLOmAftSnYv+X1o/bbHZCoCe1Ldc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrSv8ia3HlazfMp8NFCHF1W8287Y9WR1E/h/+KLpstlVeU0Pgb
	DJRJ120nRsgITA2DAJwthPcb7YLG+aUbPvl6D6ikRw242OkAsTdFnw5r2TeAfse4gAsvlQjhtwV
	HjSYIIA==
X-Google-Smtp-Source: AGHT+IEiUGctmed5Jm4/azl2/SL+jFNyFyoqxOj4Sx+0n2i6EPF2TpT8R/3hGNPh8Oh64n+PfETUY1WDfs0=
X-Received: from pjbsu5.prod.google.com ([2002:a17:90b:5345:b0:30a:4874:5389])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8d:b0:2ff:5c4e:5acd
 with SMTP id 98e67ed59e1d1-310e9740a23mr1736244a91.35.1747962089593; Thu, 22
 May 2025 18:01:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:52 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-48-seanjc@google.com>
Subject: [PATCH v2 47/59] KVM: x86: Drop superfluous "has assigned device"
 check in kvm_pi_update_irte()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't bother checking if the VM has an assigned device when updating
IRTE entries.  kvm_arch_irq_bypass_add_producer() explicitly increments
the assigned device count, kvm_arch_irq_bypass_del_producer() explicitly
decrements the count before invoking kvm_pi_update_irte(), and
kvm_irq_routing_update() only updates IRTE entries if there's an active
IRQ bypass producer.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 19fa3452d201..904aac4d5e08 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -517,9 +517,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) ||
-	    !kvm_arch_has_irq_bypass() ||
-	    !kvm_arch_has_assigned_device(kvm))
+	if (!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass())
 		return 0;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
-- 
2.49.0.1151.ga128411c76-goog

