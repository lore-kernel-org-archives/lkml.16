Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CAE2D29C6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962088; cv=none; b=HK7bC83LLJZwco/LkBY73zw1J7BTUZqPwkKRm7Qd+lpmauiltfocXZqXZjJ8hYzHVRV8Mei53UdaPdTgs4ECDY9WmAvr/ihGHiQFGN2nWCSiXE0oQxCEA0YND9G7XxNZzRonkpGX+mi1HV9eI8kvyIszeVKnR0s7OPclejddGCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962088; c=relaxed/simple;
	bh=55qjTgWoCAqQ0qlezLcudUP6UhJvdAn22WKHfJ6neN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xvur8C7c+zF7H4JzexPUFruc2tCVCUGYE6dM4yqB5Zx1D4Zvh4sgD4iffJFZKs8CoVF5OMhHiGT4r4kpfcMvrl1x0WLNrvIM9nEFCkVb7gpUXfLxI4K8UHgGI/H2WO09WZTV3r1PJw9WSY9zObltifLrvd+Dl+sOSk0ocv9tz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HdY8PFjM; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HdY8PFjM"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b269789425bso8821815a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962086; x=1748566886; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gUhbzbIFz6N1ly0iEWpzNSdv8WcFPzr+G6Brn0aKnfs=;
        b=HdY8PFjMZt6H2RfcNGXUgIZXb8lxivtddwihRNXrp2IAlftGaRznb2/T1bPZIHvihW
         OX511FjByY13jc3gtUc4EMW1yqsFyIfr5WEiIn9mbAHPeg4y6Zyi516Sr0OJ9o6JFM7H
         9Q6HoPc/Aj/lSepccBjzYwthSzS6OphwUcJcYq9ORb27O+JnKxsWv9ke6m9ypq7y+MYv
         H1vwp4503XKM/o6S9KFOrZTLxxxgODphDdVgg1U6PX0iHRVUBLY2vcrfwZ5ndbKzNVi0
         Ebsf0dyUzlCx/TwvNmFuzeeyNEIkuUg9p23TP3RjFawrvUdgp2gB/uyqfKfKSdOeRZSv
         dnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962086; x=1748566886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUhbzbIFz6N1ly0iEWpzNSdv8WcFPzr+G6Brn0aKnfs=;
        b=nHmn6jBNKKVk7hCaUipfPj4AEKBIKLRa1IO32Ed+enShasLb0ZYkD8mtyVn9I/WdPP
         e7yOC4DacBVVzvLUos/IHW/TOLhEGUsxy+MOgoiYmyTRNURQ7L/vwIVW5FvwsYVpkByH
         MBygEdVKRlWGMWc43QxB+r0479bnTNPNzUSlR7ezLYo4K2ttqD2ohj/griNpOOxD3TOQ
         SgV0THzde2RDM5vx+xG24CG/HoD8FQNUrcRxPeJanzy8bzl2j9Q4BpVHO9hm3KxcAiTM
         zwvgW58vfW8PtCyXnASxO1+YVObqB+mygxygG9QgjHPysud9DxxwLBWEw23GjipAr7P1
         vYmg==
X-Forwarded-Encrypted: i=1; AJvYcCUaHeTcRIMb45zqtG0TH/WqBrTkK41QwX9Xn1snTzif1PhC0gwQnd6fJ27TBoAq8hXv9FhvvoOyIunUDUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFCAxfCBbUjDLmU0aznaKrN6/qA82mGrStBVVqrofCdgX0Tde
	am+Aa8FyDFwwTRS3ASwUDykBEh94iPG5T7/OCFmHFF8sNtC1ztMdgWxDcaEbzerm6pm0qKID5qq
	VR5gDcQ==
X-Google-Smtp-Source: AGHT+IFmNcRCVGsHwu2ASi0oy2rdhg/Fb0rUQuE9H39VclrV/Td0/+Bcwnto5U4Ohf9/HGIiubwzMKlglKw=
X-Received: from pjbnb5.prod.google.com ([2002:a17:90b:35c5:b0:30a:8ffa:9154])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17d0:b0:2ff:53ad:a0ec
 with SMTP id 98e67ed59e1d1-30e7d57f38bmr34769259a91.21.1747962084260; Thu, 22
 May 2025 18:01:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:49 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-45-seanjc@google.com>
Subject: [PATCH v2 44/59] KVM: SVM: WARN if (de)activating guest mode in IOMMU fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if (de)activating "guest mode" for an IRTE entry fails as modifying
an IRTE should only fail if KVM is buggy, e.g. has stale metadata.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ab7fb8950cc0..6048cd90e731 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -724,10 +724,9 @@ void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 	avic_handle_ldr_update(vcpu);
 }
 
-static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
+static void avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 {
 	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
-	int ret = 0;
 	unsigned long flags;
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
@@ -742,16 +741,15 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 		goto out;
 
 	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+		void *data = irqfd->irq_bypass_data;
+
 		if (activate)
-			ret = amd_iommu_activate_guest_mode(irqfd->irq_bypass_data, apic_id);
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
 		else
-			ret = amd_iommu_deactivate_guest_mode(irqfd->irq_bypass_data);
-		if (ret)
-			break;
+			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
 	}
 out:
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-	return ret;
 }
 
 static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
-- 
2.49.0.1151.ga128411c76-goog

