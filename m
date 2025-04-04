Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3022425E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795613; cv=none; b=tqDFK0NG9E/nMLoF2ATDAHoIK8Gv9TiFasimMv5L7qMl6Iyh6NeH+eQgsQXLVj3F0lIRTU7AM0pPnqMRkxsy582JIRQkU8FGRuKornAbDe5GZwIx4O2czd64uX5qM+ktf9esU99Vodl6Hysd/4fgGpCQiTpusUFV+qmgXBA5mDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795613; c=relaxed/simple;
	bh=Ny0M/z6O5m5Da4fXxsggB+MSjOkMNLlZ/4JPgRgDcHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mMtUl6v0Frjzo6wYbuLX64UAIrK973ikp0T68+JaMMLtQyEV2dY0hYaClP8lkU1WZ9gFX0f2GwO4auZbN2IVv1+ftvhj1yBVti+yTKv8WxwqNZZoAMez8UANrcgY0DgkGCx6N0aG79bu2MS55daLIn+yyUkORJs6aZfZcy8n2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qWKJJMy9; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qWKJJMy9"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736d30d2570so2142188b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795611; x=1744400411; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=V9WmlXKIl3pG/vGS1FFPkbRmx6wE+LY/6fyIbxpmuWU=;
        b=qWKJJMy9VKEWK18gw3mQOnKr2/Ourf+dkZ5/sYkUBxtxGS/dA3Nz0zqQa22hzGD2SF
         azdp0HhQRNa2xIexptajFj6xMNIA4/xhYpCltgjPAaCH7CYlrg9Bgeyd36JDXUzoLJu4
         bBKi6ibpHzNxkJqjsoVE96Nqbmg6r1iF9Oy4liQDiYazCebU2eL+GOOxY8TfRNN7L5oX
         qDjFnlClnhiPxtwfiq087Rh5uVS7DydC5Ut/e3S9lntiWNTRpdagOI1coS9J1mfEp/mY
         n4NCckNQEaZpsRL8mZWSDUcRr2ZCl+lJXzNBqDSD20W7BUTRRL1wgqGPc2ZzSiz9evzT
         LdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795611; x=1744400411;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9WmlXKIl3pG/vGS1FFPkbRmx6wE+LY/6fyIbxpmuWU=;
        b=MghN2a4M05rYeJv05yJgyTMGhARK9YLC8Zm6gB/oOQ+2jlErGyEEgvfOjCu+HOwo5v
         YMpwSVCSFPh9ewMU4tf2sO5ylQuUvhz6v1qUZrrjCtzDcMafbt8P5jZx302LRH3AvTXA
         5AQo5TvoALBqVOvoseJbwOsFObzzrd5MCsbfgGqA9RfXUjt2BibdQ58MPRCKcYKFVWBg
         CZoMHqoCHRsHiuxhwcrCZQkPg56guBwjjwdX23oHDDSr/VI+bg/3DRO/UPiHofNi7UhC
         ScZnokAFC2gCAqqLhFe79ajIchwnEflBCL0CscyLNYqUNAO/PQ6YQReBgUNfRr5SAaKg
         RQOg==
X-Forwarded-Encrypted: i=1; AJvYcCW9h8TevHEs+rEaLZzGqRbv7E720vW8Z3uRbV1/9GY+AACdRqO7vcAhVEWcxXR0fv/HZMjHs3VtT93KauA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rCubVeDokOfXFo5mP5b2d7UiCQIriOX+GgXli0YLm2+vXC3E
	+leqgyBDyrCcU8AgfOIORKsV0D/3b9ZusqP/kVxPB6hpGw3E38p1HgQjbSm7sJufrfS9O6vgtIT
	pbQ==
X-Google-Smtp-Source: AGHT+IE27zbdMk+l2PrFIwUw1sH9cB4J4cN7CaOyjTIEfbMCPGg6FI6XQmyQTP9lTfdwAAei1fZlh+dM+/8=
X-Received: from pfbjc3.prod.google.com ([2002:a05:6a00:6c83:b0:736:4313:e6bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:888c:0:b0:739:4a93:a5df
 with SMTP id d2e1a72fcca58-73b6aa6c7c8mr897212b3a.12.1743795611081; Fri, 04
 Apr 2025 12:40:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:29 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-15-seanjc@google.com>
Subject: [PATCH 14/67] KVM: SVM: Add helper to deduplicate code for getting
 AVIC backing page
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a helper to get the physical address of the AVIC backing page, both
to deduplicate code and to prepare for getting the address directly from
apic->regs, at which point it won't be all that obvious that the address
in question is what SVM calls the AVIC backing page.

No functional change intended.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index f04010f66595..a1f4a08d35f5 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -243,14 +243,18 @@ int avic_vm_init(struct kvm *kvm)
 	return err;
 }
 
+static phys_addr_t avic_get_backing_page_address(struct vcpu_svm *svm)
+{
+	return __sme_set(page_to_phys(svm->avic_backing_page));
+}
+
 void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
-	phys_addr_t bpa = __sme_set(page_to_phys(svm->avic_backing_page));
 	phys_addr_t lpa = __sme_set(page_to_phys(kvm_svm->avic_logical_id_table_page));
 	phys_addr_t ppa = __sme_set(page_to_phys(kvm_svm->avic_physical_id_table_page));
 
-	vmcb->control.avic_backing_page = bpa;
+	vmcb->control.avic_backing_page = avic_get_backing_page_address(svm);
 	vmcb->control.avic_logical_id = lpa;
 	vmcb->control.avic_physical_id = ppa;
 	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
@@ -314,7 +318,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	BUILD_BUG_ON(__PHYSICAL_MASK_SHIFT >
 		     fls64(AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK));
 
-	new_entry = __sme_set(page_to_phys(svm->avic_backing_page)) |
+	new_entry = avic_get_backing_page_address(svm) |
 		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
 	WRITE_ONCE(*entry, new_entry);
 
@@ -854,7 +858,7 @@ get_pi_vcpu_info(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
 	pr_debug("SVM: %s: use GA mode for irq %u\n", __func__,
 		 irq.vector);
 	*svm = to_svm(vcpu);
-	vcpu_info->pi_desc_addr = __sme_set(page_to_phys((*svm)->avic_backing_page));
+	vcpu_info->pi_desc_addr = avic_get_backing_page_address(*svm);
 	vcpu_info->vector = irq.vector;
 
 	return 0;
@@ -915,7 +919,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			enable_remapped_mode = false;
 
 			/* Try to enable guest_mode in IRTE */
-			pi.base = __sme_set(page_to_phys(svm->avic_backing_page));
+			pi.base = avic_get_backing_page_address(svm);
 			pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 						     svm->vcpu.vcpu_id);
 			pi.is_guest_mode = true;
-- 
2.49.0.504.g3bcea36a83-goog

