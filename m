Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306C2E975B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794062; cv=none; b=QUiVNWa18lVYWOhfnBcQSc63wUUBMQYJK6aOrOjaVB+n6M0kG0ALnEwXQ4eTsAylTItZDBdVsxFE/wGHNENnKefmArXdNp44+ET5FNcb7RiAimk1Rfh5WWtZpYR21ggu3BnFXonkwfMthcCrLjyynDHm0g9+H/GmWJlFy6zjN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794062; c=relaxed/simple;
	bh=icvH8uPyPSF7ZE5bbcFFzEf2UOQHavXp0OG5yV/ZSlo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SFnZ/2ZJB0rXfOtLrbbEgmd2p4ZNm/39KrjTn9ndD5gavfPb7/PyoZt6O8IRpg8fYN+nL7dNogKnON2hHyiDouDvci0MJZI+wGB4xyJywKqIKNoVlZOrf5h0VCPSAZJdlN8vHnEE+dWGk7uad1ZQmth3BSiNQhEdHGRqrMpiB/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TWTZxLCs; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TWTZxLCs"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso799748a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794060; x=1751398860; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iY0Zi0HY18tOkeHCc+HXpmSScBiit195K0qDvBCbCao=;
        b=TWTZxLCspjLRlioDLG0R8h3YqzCLJY8ljXz4+Qt0OPOSRaUOngey81zRGB3SAuiBFt
         fEJMahqPap8fX396N4gCSKl6Oe+RkmyN199RXrOZJCn4xfcG8YhSGfRKKNVVqZTVx0yX
         ukeyfvMlZTCMJBtW72gn5y0pWyYgAXrAY/L7UJH0mjNiulU5Q4GrL7rSjNUbXBTLotKj
         9NNHgtJgaZc295zI2Hxqh52C7HRcdyjVT8sdAvHhJXsr6CA1/28E5HMIPirm/sh61ge6
         oq7uPRahWOg4wTGT4aD7lDVmmSTrRy6BwWbTJlciBuxwUr9quzbY+sFi8fASBtXLJfqj
         Rt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794060; x=1751398860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iY0Zi0HY18tOkeHCc+HXpmSScBiit195K0qDvBCbCao=;
        b=LWwRbJ3uQE1en6m9VNGb8Af80IERcnwEx2ReW+69ZVwCHdWC8r+8imlLQPlrhYkDlx
         FJK4lOZTdVCoqkAJToGo4cCpARL0G5iztPXVGwEPSy5JZKo1vp7DwtzxnEU8McsXsOxA
         mQiMKApONC0z/zSs9MpoXPAc3SUQ9Q4UtLM5a6lojpLzfLYsUv0AZDrQigFgIkAVXdw/
         OKnV/1LNPIS3ud0txFMvXhI3q+DuKZ5+1Z3HTTV1+1OmoCh2/AYb88ybEqSb4RV1u9Sy
         b388UDYoMOnlDoHtqomMYvuLJyzg2V1OCCeqZ8ZJ7hc+Y2PLqQkqyynhXTP1ROeL9kRc
         E5TA==
X-Forwarded-Encrypted: i=1; AJvYcCV3ovkr0mDpuJkQVQujPlUiJuBW7ZPoeDNy3xFX5wrMf5ems7xLLRePfA5fx3woMAUreEk5RaaAedx62Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKaEZ8f3HxWLDKEqg2BN5uyOIT3IwsuxHS9DMQvkpFvmFYVe1f
	Gc+d85CWNCnIJpZ5a7/bxwiDj9I48OhdvVaB7oemD5O7/m9HW51RllQUtYaq/y+1KZlyZlKSUvu
	Z6HxKtA==
X-Google-Smtp-Source: AGHT+IF4MLhn1oAFS9q8ZwixKJZ6SXdYDCWlaLgz8n+cUS01Jkrs//aXxvoL7Qsb+teLAlUXpA9LXNHFuS8=
X-Received: from pjbov12.prod.google.com ([2002:a17:90b:258c:b0:312:e914:4548])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d8c:b0:2ff:58c7:a71f
 with SMTP id 98e67ed59e1d1-315f26b85c7mr109165a91.32.1750794060247; Tue, 24
 Jun 2025 12:41:00 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:22 -0700
In-Reply-To: <20250611213557.294358-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079365968.522970.130090674504357227.b4-ty@google.com>
Subject: Re: [PATCH v2 00/18] KVM: x86: Add I/O APIC kconfig, delete irq_comm.c
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 11 Jun 2025 14:35:39 -0700, Sean Christopherson wrote:
> Add CONFIG_KVM_IOAPIC to allow disabling support for KVM's I/O APIC (and PIC
> and PIT) emulation, and delete irq_comm.c by moving its contents to other
> files.
> 
> Vitaly and Kai, I didn't apply your review/ack to the Hyper-V patch, as I ended
> up keeping the helper as kvm_hv_synic_set_irq() to fix the tracepoint
> inconsistency and the bad changelog.
> 
> [...]

Applied to kvm-x86 irqs, thanks!

[01/18] KVM: x86: Trigger I/O APIC route rescan in kvm_arch_irq_routing_update()
        https://github.com/kvm-x86/linux/commit/e295d2e7fbe6
[02/18] KVM: x86: Drop superfluous kvm_set_pic_irq() => kvm_pic_set_irq() wrapper
        https://github.com/kvm-x86/linux/commit/8a33b1f246ce
[03/18] KVM: x86: Drop superfluous kvm_set_ioapic_irq() => kvm_ioapic_set_irq() wrapper
        https://github.com/kvm-x86/linux/commit/05dc9eab3f00
[04/18] KVM: x86: Drop superfluous kvm_hv_set_sint() => kvm_hv_synic_set_irq() wrapper
        https://github.com/kvm-x86/linux/commit/20218e69e85b
[05/18] KVM: x86: Move PIT ioctl helpers to i8254.c
        https://github.com/kvm-x86/linux/commit/00b5ebf8db7c
[06/18] KVM: x86: Move KVM_{GET,SET}_IRQCHIP ioctl helpers to irq.c
        https://github.com/kvm-x86/linux/commit/b771b1616ff8
[07/18] KVM: x86: Rename irqchip_kernel() to irqchip_full()
        https://github.com/kvm-x86/linux/commit/c5a701955e2d
[08/18] KVM: x86: Move kvm_setup_default_irq_routing() into irq.c
        https://github.com/kvm-x86/linux/commit/df35135680fa
[09/18] KVM: x86: Move kvm_{request,free}_irq_source_id() to i8254.c (PIT)
        https://github.com/kvm-x86/linux/commit/77a74b8ff41a
[10/18] KVM: x86: Hardcode the PIT IRQ source ID to '2'
        https://github.com/kvm-x86/linux/commit/61423c413a74
[11/18] KVM: x86: Don't clear PIT's IRQ line status when destroying PIT
        https://github.com/kvm-x86/linux/commit/2c31aa747d78
[12/18] KVM: x86: Explicitly check for in-kernel PIC when getting ExtINT
        https://github.com/kvm-x86/linux/commit/cd9140ad8312
[13/18] KVM: Move x86-only tracepoints to x86's trace.h
        https://github.com/kvm-x86/linux/commit/2c938850d9d1
[14/18] KVM: x86: Add CONFIG_KVM_IOAPIC to allow disabling in-kernel I/O APIC
        https://github.com/kvm-x86/linux/commit/628a27731e3f
[15/18] KVM: Squash two CONFIG_HAVE_KVM_IRQCHIP #ifdefs into one
        https://github.com/kvm-x86/linux/commit/141db6cd79e2
[16/18] KVM: selftests: Fall back to split IRQ chip if full in-kernel chip is unsupported
        https://github.com/kvm-x86/linux/commit/8fd2a6d43a10
[17/18] KVM: x86: Move IRQ mask notifier infrastructure to I/O APIC emulation
        https://github.com/kvm-x86/linux/commit/37b1761fe895
[18/18] KVM: x86: Fold irq_comm.c into irq.c
        https://github.com/kvm-x86/linux/commit/e76c274513f2

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
