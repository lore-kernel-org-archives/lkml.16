Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56798F66
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749775725; cv=none; b=gD8fnq5b/Mq4ne8M/ThSNLr0s7mEllg55MA3kc+2UZLZF42D+h3ufNyE7iZsy7wTAGH9Y7ypwB55XYV1ofbTf5x028dBDQ+hB+aTu2XV2pIjbGOBDmsQ/O5F94GUj9vUJq9HbVRdO3FVJOVrK/lpXjRgb6EtVKKnRHJMgwxga/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749775725; c=relaxed/simple;
	bh=LB8mSVywGvWaSBPY/GjjFungJt8/fYCcQjgsVzy4/p8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rYOe9JoUl22EtbjPKSNy97OMVn8QwHE67PKZEOaa2C9VPsLtJIYNUz+ZaQ9WK59w9/fGBsir/P61xqZuf6WrUSqJ3Aiqa1Z/rG4yuLJp4a/pxhdYdlIozfDgqlRv0/VoroonbRa/YDVM2L4HUCbqdA6LZABSUuRP4w+IoDpIYzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B8cr8o/F; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B8cr8o/F"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235f6b829cfso12942005ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749775723; x=1750380523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PJsPHC6knGCf+CEUrmtkCTljPrq27G15x2HFHSsAN4=;
        b=B8cr8o/F+kJwjytYaEiHRjsuH+SuEcvv7T7lFMpmAARDQrjeMl8BYcgLJu1D4VRC3p
         3yBXYILON+Y+bVT89KBwO9O2ZAA2LjCt0uqbbj/seP+UDIOUyOdK5QsNnCBqOXev/tfm
         yxawCVpfUJfNDNIv+SrPUJiPuHaqQiwPriY6R+b/y1bs2I7kA5euvv6x8NhhJq/e58Ox
         pkVjgMr4p6X1mmeBy2G+o19i5Z++AQlh4bah/cpukHDYFobkSx4InSSpbcUGOm6Rq5L5
         4cYl4rMhOt90nVLDPxmScWWICp7mQWpKC3DqORfxJOwNNn8Ney77nRaKKxuNuz4PyQ5L
         rnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749775723; x=1750380523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PJsPHC6knGCf+CEUrmtkCTljPrq27G15x2HFHSsAN4=;
        b=rTNa21C0VWSVQ5qKSDGbBGRpiJsykXeQCXuqrg5V6jOgOOzeH3VXWeGEAso0kOY7AO
         FHM1CteAtYEBc/etZSWIn+vs6NLJSBuk/kwvqD8F9P2cspfyo5Og7oEAI8T6beXmbmwx
         LjgO0pPm+zykOo1kZSQEOOwD/iAx1aJq1F52DrCRqcqhQ0PDqgSTptG3pgLwMIdq6/n5
         tcJ1ZFiwEw/AqqyQ7Iv7Po6eMHs8FB8a5O5D6IPuy0+ipu9SsAYUPbWIP3gsck19Ba7P
         20r6SfyZb1lD0WP6UtAsCArMozhfun2jRKBvGbY1eaOeUEuMpUWcEom8MtLcXqxto+Aw
         qwsA==
X-Forwarded-Encrypted: i=1; AJvYcCXsV/nGK09M43L10uaJXnOC/WTopsSeJ+ixWQkaYFBG45jWf8PPymKiqKCxGNza9SmnUPQvwA/e4L3djkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLe/Xn7iyi5dR5cCZuvfWFV3ZeU5d9ZI9WKLygndtbnwmooxV/
	hP3z4Do0XooAy9zDNvrhk+SJNV0hL8w02qO4vjyzKnGuNS8Llxorz8EiVbM2ufgohIn2j4pbDts
	GM3V2kA==
X-Google-Smtp-Source: AGHT+IHnKlUMQsIFSTkamH/iyOOJa7EJ04RrETO6pUkWI2akoUEmrJ34o5FjHMKGcbiu7zur8PxdT4jBka8=
X-Received: from pga4.prod.google.com ([2002:a05:6a02:4f84:b0:b2f:b737:6afb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d490:b0:234:ed31:fc9b
 with SMTP id d9443c01a7336-2365dc2344emr14032545ad.36.1749775723185; Thu, 12
 Jun 2025 17:48:43 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:48:41 -0700
In-Reply-To: <44cb77805d1d05f7a28a50fc16e4d2d73aca88f3.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com> <20250611213557.294358-5-seanjc@google.com>
 <44cb77805d1d05f7a28a50fc16e4d2d73aca88f3.camel@intel.com>
Message-ID: <aEt1aXPhivCJZbyE@google.com>
Subject: Re: [PATCH v2 04/18] KVM: x86: Drop superfluous kvm_hv_set_sint() =>
 kvm_hv_synic_set_irq() wrapper
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 12, 2025, Kai Huang wrote:
> On Wed, 2025-06-11 at 14:35 -0700, Sean Christopherson wrote:
> > Drop the superfluous kvm_hv_set_sint() and instead wire up ->set() directly
> > to its final destination, kvm_hv_synic_set_irq().  Keep hv_synic_set_irq()
> > instead of kvm_hv_set_sint() to provide some amount of consistency in the
> > ->set() helpers, e.g. to match kvm_pic_set_irq() and kvm_ioapic_set_irq().
> > 
> > kvm_set_msi() is arguably the oddball, e.g. kvm_set_msi_irq() should be
> > something like kvm_msi_to_lapic_irq() so that kvm_set_msi() can instead be
> > kvm_set_msi_irq(), but that's a future problem to solve.
> 
> Agreed on kvm_msi_to_lapic_irq(), but isn't kvm_msi_set_irq() a matter match
> to kvm_{pic/ioapic/hv_synic}_set_irq()?  :-)

Yes, the problem is that kvm_set_msi() is used by common code, i.e. could actually
be kvm_arch_set_msi_irq().  I'm not entirely sure churning _that_ much code is
worth the marginal improvement in readability.

$ git grep -w kvm_set_msi
arch/arm64/kvm/vgic/vgic-irqfd.c:               e->set = kvm_set_msi;
arch/arm64/kvm/vgic/vgic-irqfd.c: * kvm_set_msi: inject the MSI corresponding to the
arch/arm64/kvm/vgic/vgic-irqfd.c:int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
arch/loongarch/kvm/irqfd.c: * kvm_set_msi: inject the MSI corresponding to the
arch/loongarch/kvm/irqfd.c:int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
arch/loongarch/kvm/irqfd.c:             e->set = kvm_set_msi;
arch/powerpc/kvm/mpic.c:int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
arch/powerpc/kvm/mpic.c:                e->set = kvm_set_msi;
arch/riscv/kvm/vm.c:int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
arch/riscv/kvm/vm.c:            e->set = kvm_set_msi;
arch/riscv/kvm/vm.c:            return kvm_set_msi(e, kvm, irq_source_id, level, line_status);
arch/s390/kvm/interrupt.c:int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
arch/x86/kvm/irq_comm.c:int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
arch/x86/kvm/irq_comm.c:                e->set = kvm_set_msi;
include/linux/kvm_host.h:int kvm_set_msi(struct kvm_kernel_irq_routing_entry *irq_entry, struct kvm *kvm,
virt/kvm/irqchip.c:     return kvm_set_msi(&route, kvm, KVM_USERSPACE_IRQ_SOURCE_ID, 1, false);
