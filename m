Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B352222570
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795609; cv=none; b=MnodH+15skgKfAJ5n/V7W1ALCAwfkRl3N4DjIf1L1n5aMdvseKD9H/LPiXoeC6Up5D0xBWxb1Ua3OCyeeYAKc5LaZPRS0mb2SIeuw/G24Lpbv4lDkeDSLMlrvL5KlQmRVV2WQDRGDdBuGfDWmJK0LQ/HiploYZGW/PJ+J97RwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795609; c=relaxed/simple;
	bh=ymgLNvDMBazjcOWHdM4TRBB8fRza/15wPWUAsosttHc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T7Cki+k6PESnX/f0CESOxVLqmsF4db5fo1jB7GqSw8hVLHe6r0mSVolBQP6dvkCfGBjWQu706u2cpHbDfJL6hbr4jZ0YIg9E6B/Un+6iSQdOEPsPV9k7SAHiiEKc3h3aiIXdyvdL+ufYVInqadv/sIjSRLe/8K1ZjG+VStQOcI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DKNY5UbK; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DKNY5UbK"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7398d70abbfso3439794b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795606; x=1744400406; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FiKuf+KLGMevEl1JcUq8+wDFjGbG6tG3veWOyXB7Hl0=;
        b=DKNY5UbKgwbgnpH8+tO8cF4nRJPTau2T4BuMH7aMan1MGphtVL9al3OGl6W0AIthwM
         f/uzf7ZeT2/qX0tMsLGFMEr4JZCwJpHsHH6SqZavgvUZk2QdE3nWARBo0GtN1oIPVmGw
         HKo/Lio+WQXeqvCq4nlYFMxoABEO9yHbgCOG6BDG6f7Qx8Rg2p63DBh3BYLDzvbSK3pj
         ERuF3VPO09qeMENAHX1LxVKLoTD67zNNMO8wYb29fTFKjOtTqqBvBOQSepTHXiaCiV3X
         Yu5e+GFQKKMCgp00bJCf4+gVOUtWdYBc4X46HZgR9TGZbLd+no70lJ2zitDjwEqcbv47
         dWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795606; x=1744400406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiKuf+KLGMevEl1JcUq8+wDFjGbG6tG3veWOyXB7Hl0=;
        b=myeRlO/agy3fMhwBwHbojoSq4G+w+xdkkFYgEvTRVSbym0oTJBkVvgt5g6EYo3CqSp
         Z11eSiGomJy5h1NjufKMjpKFHY4XNaFs6u6pZJjcCiRAaMbH2E25ofBbT9ETPNJMq7Hd
         /0sByPCe5VsNMBEpXSWfSeC//dC3JSFLrILGA1CmlFlxxozErXXM5kwff8HaFX4tnofA
         SVn99yk2kzM0VoXpi3MfBhO4KwfhStG4t+Xv8Td5okPSNp2cR9f8uc8HlfDyYvQmxGiL
         fhcU4Qo4qKggWXvUFmbp+UB1jX3AtKSC67O7CcAUWv8wvDMp5kkW7m2nehB/Kc7e65rf
         8P9A==
X-Forwarded-Encrypted: i=1; AJvYcCVC+m/sVwkHy6bGICkjTNsqmHWptSfi1SOl0zlk2BgF5Hv3UVbmgWQTkZzGPRKA7XcMLyE23m+99ee8o14=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn7T9Q+Fog5s2vUyPdkeHBbcY+1KNUjYVti/8C+6ked3W+95Q5
	bMk9B08B8+/5pAZ1XwyECHlSHctG+NclBd5OgJdit7uUqUJpezVeyzE0zkEZUo3JSqlPzXLkorx
	cgw==
X-Google-Smtp-Source: AGHT+IFtyda/QQ9X0Y9KdE3cg1eDpGK8RDILaxqr6131sPdJg3+eJBnN0Hdt1DkeEPmuLwr7hr23wisO9LY=
X-Received: from pfoi21.prod.google.com ([2002:aa7:87d5:0:b0:732:6c92:3f75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1941:b0:736:4e02:c543
 with SMTP id d2e1a72fcca58-73b6aa3d952mr644845b3a.9.1743795605825; Fri, 04
 Apr 2025 12:40:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:26 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-12-seanjc@google.com>
Subject: [PATCH 11/67] KVM: SVM: Delete IRTE link from previous vCPU
 irrespective of new routing
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Delete the IRTE link from the previous vCPU irrespective of the new
routing state.  This is a glorified nop (only the ordering changes), as
both the "posting" and "remapped" mode paths pre-delete the link.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 02b6f0007436..e9ded2488a0b 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -870,6 +870,12 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	if (!kvm_arch_has_assigned_device(kvm) || !kvm_arch_has_irq_bypass())
 		return 0;
 
+	/*
+	 * If the IRQ was affined to a different vCPU, remove the IRTE metadata
+	 * from the *previous* vCPU's list.
+	 */
+	svm_ir_list_del(irqfd);
+
 	pr_debug("SVM: %s: host_irq=%#x, guest_irq=%#x, set=%#x\n",
 		 __func__, host_irq, guest_irq, set);
 
@@ -892,8 +898,6 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 
 		WARN_ON_ONCE(new && memcmp(e, new, sizeof(*new)));
 
-		svm_ir_list_del(irqfd);
-
 		/**
 		 * Here, we setup with legacy mode in the following cases:
 		 * 1. When cannot target interrupt to a specific vcpu.
-- 
2.49.0.504.g3bcea36a83-goog

