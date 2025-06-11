Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F0277C94
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682106; cv=none; b=q8pAY6EHa/TpRFJZ1fm3c7sfjl98naN9Lct8WJxjRjami7DRberQ+LTk1B4CckcfOY4ZvGJXs5m4WNnmqKsUcFt7Bwu2be0z0Qf4FJ1qRbplXAb9bE/dIwmzRCOUiNd8wYRQqn50ArW5S8TWESkZWOB36tlmBOWLtEHPeocTbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682106; c=relaxed/simple;
	bh=XZYNkX0i7jSO000S8PXHyo4me3Uz0WtZJb8h9nqk90s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sXI9dujqj+n5HyvnKxAVy8w3quYl2vNFOWLKRRYPjh9q/6fNEeHOdC5ROfLBXrubu661DNp3KV6VlrLZa+u+SKDmrL2/wbM4De9ZFBNtgxlEQFZQMoU3GcFMbfkLGE7hLyEbXlGGqqgyhMYqyw7MGYlWrQx/ddZ9WlgmZKP+krA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FToMa8iL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FToMa8iL"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26e4fe0c08so132035a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682104; x=1750286904; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HL/zmEfedJaVYRCaVWCVwHvRFcjp3FGRcd4gYxRqVws=;
        b=FToMa8iLKutWpqaBa1bj+LpHkNI9ZDKcJK0lXN/8i5c+XW9YMp0yDuo70qLhI0I04U
         dEN+9Au6S7+NgvIFnGBr67RnnEgTY9bx2jQAxptTum1+yWnL1W05Sy8X3iQ4n4exS40X
         VJKc8NkjIErhpR/7rjyYdDrhFu2djqGU4P2XFtdXZeukFkrIN0zMpgU9hE+c3nTChMNC
         KP2rJhHvSxU7PXGt1Ict3kh2M1MzIazny9SqyqP8cmuAzMR9xTJZYGOmQuRCcuq4Asnz
         /0IfvdUxAUN2roKpCiLCTmb0Z1s1sJa+l2Rq4rK3tLa1HZ/5vSWHb+lZ3uW3IBk7Pjm+
         AsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682104; x=1750286904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HL/zmEfedJaVYRCaVWCVwHvRFcjp3FGRcd4gYxRqVws=;
        b=kf4SpNKgDzesMCwW38Dm1eAKGLC5W0YzkhbUco0rhlQgxWQguyzoTcf5XciAgn8aJK
         n+2tZhVsM0cV63JZB29kkstjMsJ90Wshe8PAjyd2CR6uinFfy5kw7Dm8S9LcEWvpoAHv
         wdZzax9nmFE/pvxCWtN6BqswTQpjRiQ74nb3Eq7st2o+bEUMa7lTc2juySYJLBTNzq8a
         ZRRr6sSn1MrZ3t1RdrQaAurquzxUO4VlLDTqvl5XpM1uA3tvJ3AQ/PFRwN659lz3x5qw
         pAMLex6SSDSgYp5dc2nZzYvKrafI2QshjEI6DIZoZvYDl1mEM0yNyM3zwt5IfJRbYtF1
         RuiA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ft6HhUvOih3hj1Nd0h6RVLRW4ZzvtiNHup+tcvC/jh7gcIyMKLp4UqSNlA/THlkxwH+YWWWtmEnRp5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWiZ9tNYigPIGMou4vMKmmJCDwVSVrUETmY5rHSlojYDIsS7e
	7T48OdeYnTo93gwfSQwfEbHz/5cCrdepU5mpyX0tBUfAhlSM/jTaC1wrNHoJdzY9MJRguqL3nl1
	CRCyxKQ==
X-Google-Smtp-Source: AGHT+IGhHNFSgThb/kvZUf4kLsDMQ1oq0Au4sXs0Omc7Pt0JkF2VfQnLMbJPUM3t5xwiyldmiRdw4k1+Wjw=
X-Received: from pjv12.prod.google.com ([2002:a17:90b:564c:b0:313:2b27:3f90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3952:b0:30e:9349:2da2
 with SMTP id 98e67ed59e1d1-313af0fd336mr6601829a91.4.1749682104030; Wed, 11
 Jun 2025 15:48:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:54 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-53-seanjc@google.com>
Subject: [PATCH v3 51/62] KVM: x86: WARN if IRQ bypass routing is updated
 without in-kernel local APIC
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

Yell if kvm_pi_update_irte() is reached without an in-kernel local APIC,
as kvm_arch_irqfd_allowed() should prevent attaching an irqfd and thus any
and all postable IRQs to an APIC-less VM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 9c03a67fedbe..02efa7162252 100644
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
2.50.0.rc1.591.g9c95f17f64-goog

