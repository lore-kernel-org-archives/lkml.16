Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E2289E2E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962069; cv=none; b=Lfxg5yvcBqfIMZQibMidGXcDe8E03PEpX8gjYFtCua1aXn4a5gRZK08+6SBiNv8yWTS0N86NVJJcPTOmNF8e7Me+FAsvy+YziJbZrg14p6C4jSJyVMO6PkX3Uex/PoyEV9wEu6Q6spTsDJHBDDfG/KZE4vKs2zyKkovtMZfxbIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962069; c=relaxed/simple;
	bh=7dnveniOu+/d08DxHilZb5jCCAKl0BL94CVVwVEl7eU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RpH47N73I+HHidB8P0L+AsLKagqyhMewZL/M7PbFlu5GB/rHA0dJgIjHCx+/0cWkvstIPfcjdcEkTxSiWoz1+xU8gwewQM+TXOQF9DXnodNaAfB23Oeyw+JPI6wQWjWEn/2oLDPJhe1hwyRbgmquF5X1UsPH5/3/gWWkKzJgGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KnL0TPZA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KnL0TPZA"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-310c5c2c38cso1551068a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962067; x=1748566867; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=V6x9LNMhumiNfsLAp1ILmLoBe8XRi6VNornrEAAWP04=;
        b=KnL0TPZA+CahvQD/gJb50jqsiUFpCFIcid1ZqV8Q0xzi+b2IJsIZh+rDJYd2u7uxa8
         +6dTiTXb7IHbUUykyq8AXkR2jKl1uOuFFsFWUfbC9NyEDmjR5tJ88vwwARn3Mnedz6cP
         QXn1Igd188+N5yWsjf0S1c0iQLbTIB8miYMUIOrCPP53yxCS75oo6Jld8PX59cRwRICX
         aMmCrng/6onslccskuUX+dp2o81HycUoN1E6MPObYFL05QYsyH/nY6BuyKr+nuvGt08S
         mi5mj9rrdL3u8NXpUI9d9S0b0GUhvVR1BLei+4EV7fpTyIuplULdnEPv7K1tBzRIcvSN
         mrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962067; x=1748566867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6x9LNMhumiNfsLAp1ILmLoBe8XRi6VNornrEAAWP04=;
        b=lNHF4zI4UCSfYEiTaMTSrGrmWNvk88by6Y7S7hn3UjnwO875LUtTH2kq0nfcmFFrJ9
         kuQYgf+eZhEFhrZ+QsXDM4dZbTg57lCc2GhD+Q8lmPhineHdNKGFf49aoEEO4CMHh1hG
         P13ZI/yOMl/P/Sk2OZ88v5hcPAk0PXtAC6FiciseOrknQh0RJlDDj929jPmz7rIccu7W
         oQYbhRwTZt7xCGAvRxJOXhKOfDLCZMzXIVTx5gFu5evzIaWOe0caCXPbtenVMAQ6eteP
         13qA8TJ5MxsQaETc5Giphr0b2lwKeiI7W7XM3Jmpw3uxhVDyFk3auaZj92JH9rjtZuim
         CMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIn+OMa9QGntjgSTDZ3s2Jidd5iTcux6/kgkAE/KP6BweE9JSO5QmfjZK8jVTm35a4/o4dlBhkQJtolVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Qcrc2WrhYmoqf5veS59QBqeQZKFZwnBEXLwA4i1qhr8xTYWn
	6cIY2DFIXxX6PxI4EPZZ1OrtCSCTB0mGlKbM7flgNqxczVcD3/KVVQsx5YLDzvrybGzLTJoy77t
	tTlO4OQ==
X-Google-Smtp-Source: AGHT+IHFMNVKJa5e8umXYgZ4QtpyHnpqS+oxhyJku1m1yyj6LMAR+nnLi5IpcTUffXcAu8Fv+d+vw5Lcpqc=
X-Received: from pjbrr6.prod.google.com ([2002:a17:90b:2b46:b0:30a:89a8:cef0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c883:b0:2ee:e518:c1cb
 with SMTP id 98e67ed59e1d1-30e830c797dmr41531451a91.7.1747962067465; Thu, 22
 May 2025 18:01:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:39 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-35-seanjc@google.com>
Subject: [PATCH v2 34/59] KVM: x86: Don't update IRTE entries when old and new
 routes were !MSI
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
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
index 67fc8901d15f..19fa3452d201 100644
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
2.49.0.1151.ga128411c76-goog

