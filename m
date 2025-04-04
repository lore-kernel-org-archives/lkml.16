Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C784243958
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795682; cv=none; b=ht0ioL0/amGl0B5vLZVUSpPeZ8cFiBE7e3PUjXQYTQn9hbl0ofh/RbUxMYWZgtFfrBbn3hq3Qo3LNlseYXdbM3oWaWeStkQB0UOQPFEzfABi8L5nxoxfIJyKTnY9tRQrnJRIJQYenzTxAxGDhcFaZPY28b0CJUcILi3Li9JaMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795682; c=relaxed/simple;
	bh=J9UHey9VIc8H5csAImsrOgY9HzHt7VovS5PXam2uYYc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Na/x1GVcArgV0RzD/XRwnVS/TzeSrLvnDOG55P/9hLzEthwm61d8VuaHbk5WyNyMKGja3VmALe0QvW6vvaRUmYzVipR7JumdAopB+ituiahUH5ePAzHsYEz11SjrPu9PsMcmaEpQLLek/CpfrZ3j5NOdDXYCbXpSWxZCfYCWUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BXoF0jPd; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BXoF0jPd"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736b5f9279cso2256439b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795680; x=1744400480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IDnMFjaPTKzyH9hORg6vpYe0KsdQWNftCfPGoTAAZqo=;
        b=BXoF0jPdCKtBR6Zo6Zp3U5xfdlFDmX+FCrw6bIIRH8TXm4t4EGMfgwxanXRRSz1cjY
         U70zMZIHKvbNUM8jM+icL51CJIw5Ev/zfg7VjhWNXKBYZ2IBzKz+euL8L6q6L+92+B3m
         kk+d+xSd17t4KSfOzoHu38d4u/VApxwHN5UqOM2/Pg+MyxbObyWmUvLpUgVCHww0fCFl
         D4HuIA/0H7AZaxiWfZ0mzQCbHxyC+QKVp+UvumgRBTdY7KoPWRVwb7dY9OmJycCSMzeM
         sdjSjCmRoTp9V68oYzi+DEkRi4i4QTdw0YItMfwTXWgagUvRJu71kgzLRz6LZzDzzC0/
         sC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795680; x=1744400480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDnMFjaPTKzyH9hORg6vpYe0KsdQWNftCfPGoTAAZqo=;
        b=N/GtqX3kaA6MbWF9j0RJi7WSpEpVNFgJoQkbsIpUaEVd4qp7dHY9+XXJ+KSWgHBdpf
         I8rtkAHclNCmeNXhu12/9bvwjGxtr8xUrztRvCL7rFPxG0LA0o+/EUtUvANKPEOsx2lG
         nrrBH2nKgz26/5jTRvBCPQ+whF/+LmEN8+u5PLCDWrC86lMxd3OuRjfOrTDInqlXbnOs
         KvGtUDFkLnZq7PEiYA/1VSqH4pE5Oew5tEtTMKnELzneSCGeip0KDwdJCf5lzp9O/Em6
         4yaw+ogvBJlWpw+xMzRUcBC0jtBNMhckocupRP7EyP1s6PV7cBVjiK8WenC+0pyz9/Mx
         RYcA==
X-Forwarded-Encrypted: i=1; AJvYcCXYR29f2Zn0Nu9vVfIYxAsN27dovHOtZR0dAzlh2KApxiLpIgn+p/ON3ppuqkFgR+IUrd1q5cBYdYdqgtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJANrKx+o7H+pdjDeFw3qL8YZFGFzypBoUB+/R11cyjUdTEqB0
	ho4Z77e7xkReq3kCkh5LacKsVnv/NjJ0RIOi5yc/SoSiNpPwTekxL2sHd2UGb9YRciLivFtnjF1
	xVA==
X-Google-Smtp-Source: AGHT+IFagPC1G+waMHkD10dBI62GEqlh5wfS6CoEd/HxTrdq6pLQQhec1FekF/zXyYVkQR5iehzlh0kK5pU=
X-Received: from pfbhw1.prod.google.com ([2002:a05:6a00:8901:b0:736:7da2:53ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1148:b0:736:a682:deb8
 with SMTP id d2e1a72fcca58-739e493138dmr7548244b3a.8.1743795680602; Fri, 04
 Apr 2025 12:41:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:09 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-55-seanjc@google.com>
Subject: [PATCH 54/67] KVM: x86: WARN if IRQ bypass isn't supported in kvm_pi_update_irte()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if kvm_pi_update_irte() is reached without IRQ bypass support, as the
code is only reachable if the VM already has an IRQ bypass producer (see
kvm_irq_routing_update()), or from kvm_arch_irq_bypass_{add,del}_producer(),
which, stating the obvious, are called if and only if KVM enables its IRQ
bypass hooks.

Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 513307952089..d05bffef88b7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13577,7 +13577,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass())
+	if (!irqchip_in_kernel(kvm) || WARN_ON_ONCE(!kvm_arch_has_irq_bypass()))
 		return 0;
 
 	if (new && new->type == KVM_IRQ_ROUTING_MSI) {
-- 
2.49.0.504.g3bcea36a83-goog

