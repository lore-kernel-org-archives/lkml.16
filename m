Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293D279785
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962054; cv=none; b=NRoSl7EMUISFMtPrWUnttGBqFmLw6wArauRua3/vZQuksvbpqayzsh+xiKvDNvTFxOgtu8DT6G20k35qJTpJkGT47gY7LuSTFpMCs3jvjmGmtZ03oKGy/ruDVVJ1blHjqXwTvVPcduLBQFAOU50VsKtoRHY1DgHKmYhkuHxdU3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962054; c=relaxed/simple;
	bh=jRCSdoFCqMKn8jTYzEDiHtmp4OccuyujV8O7UeMdZj8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TuvvL/qCK3R1pmrrCpPQkup2AG7qNgI/aErwMzmrpORDXNevwvcL1Mc30PtVp8ogecSmxZpsNjDf4fuzSUTo+sd2n0qNJvnLOM7Mhic7qFenPM4AoCGK0Pf9ZmaivzYUtL2kDLa9RU8BWy91POz0p6E5QrPv5OoJEA9rbfTijS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PoTeoETN; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PoTeoETN"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3108d5123c4so2086981a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962052; x=1748566852; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hG0IAIiIYv3kAH9AK2gcTVyZB3y4/6He2P464UJI1dU=;
        b=PoTeoETNIZn/jFu2Z/A0950v5cB0UiJsdtO+MNm0fWKhd90kh1aNyN44l0SpEJ+2Zc
         37HZCnDJCch1jiLW96Zykho0/BWFY5Pu6TD3309kpLarteT/UyeoeeBSrcF845+HACu2
         mMJ1EN9o6ImH7li3fsgUpqd1NYZUmo9eRE3abMG2ltU+EIzwu+yE2XfsU6VUFDOr9+Kg
         IkeT71cHZGZrvuVqgeHYdgXnHE3/SBF7aV2zv4PqGCiylpmRdsQpEoKH4ftVapOgGsvM
         wkTqt5E1tBYuJp6wQELonTGvPeJHrk5/RciYq+wV2fXXPoL7OjwY8G6E4dKdS9T7n8Nz
         4OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962053; x=1748566853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG0IAIiIYv3kAH9AK2gcTVyZB3y4/6He2P464UJI1dU=;
        b=NjZ16MfmB7ubJd5vIzHzJkXLGPNl448nHGEj7bcTAJR8MCMBApYERwWAbKtIJrSwn1
         09hF6bIjH6bl8X8slVO3CRvwHv08mzgGN6NfORHs5HlAr3JisaQ/DYCLyHT3E8BKjAbN
         dN7hvjXNdzCRWHwOp2LUG+bH3PEHLJQEf6YxK6iTXUAn++FusLS9LSqv1V087u5vdw2A
         kFhHuky16zBYheBn6IWVoKUlVmhZ+F7sXAgijk0MIQREiqL/P5+kZTpv1ge2Qhmmgyu8
         TUpdLE2ZmkfjbkEGojcDlfUU5GDBN45X4tXhZj1fUyx07IB1vveoyeRvXqHtTI/lxtCz
         A8QA==
X-Forwarded-Encrypted: i=1; AJvYcCUAkhaSJe1ehfRx86Goj7GTunYvJp621PPntf1XUDoYdwjN/0gc3JDyjnG10L+m3/7ji7acmuQtfGfPqus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EQyc2aRD9fO7YHeIu2xOdtkoOmaQaWqqQP23V+DrJBCcdL0l
	sHj93U7l/nLPhEWohjXeof/+YDvNupec/JlXy/Tr+UYu+/d/f03k/uRnDON5QP6mUhmaaf2Bw61
	A8xZwNw==
X-Google-Smtp-Source: AGHT+IGmy5pPbJfwDE9rf/Cqih7MqBWbBVfwVzubGvYONxB6zdFJ/6ZU0L0cNDAY5jG/p/nKPtIes2/D6Og=
X-Received: from pjb6.prod.google.com ([2002:a17:90b:2f06:b0:2f8:49ad:406c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57e8:b0:30a:255c:9d10
 with SMTP id 98e67ed59e1d1-30e830e87f6mr38952255a91.8.1747962052715; Thu, 22
 May 2025 18:00:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:30 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-26-seanjc@google.com>
Subject: [PATCH v2 25/59] KVM: x86: Nullify irqfd->producer after updating IRTEs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Nullify irqfd->producer (when it's going away) _after_ updating IRTEs so
that the producer can be queried during the update.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 3f75b8130c3b..6374a7cf8664 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -549,7 +549,6 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	 * KVM must relinquish control of the IRTE.
 	 */
 	spin_lock_irq(&kvm->irqfds.lock);
-	irqfd->producer = NULL;
 
 	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
 		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
@@ -558,10 +557,10 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 			pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
 				irqfd->consumer.token, ret);
 	}
+	irqfd->producer = NULL;
 
 	spin_unlock_irq(&kvm->irqfds.lock);
 
-
 	kvm_arch_end_assignment(irqfd->kvm);
 }
 
-- 
2.49.0.1151.ga128411c76-goog

