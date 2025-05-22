Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D5A2882B5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953850; cv=none; b=tlh2U43EGg2MkCNItMVEHHzUub2XvgrUtT2FnuImIoQ+RKWk7cMFfU9P8qG5dEagsLFm7hNNnBiDFR5o/4hTwoiR2J90ZhoQJ+Ga+kD9EyuE1cnQtlMvRwRRxICGGcUMcjXmK1YiZyaoCJT02gR7JegAvaawxvYCyO+zF+Cf2Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953850; c=relaxed/simple;
	bh=5sOL7pB6oTTIdBnyFV8S131A9ORjb++y1AVBheBVwyg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DFf1jPGjrEdXvWtB5L9XDeA4HdAZZUGziPtusYPLxRddu6Bw9z3jE8l9oRXa+qV7JyS2o24kA6XGavQ1HbUF5FMb4W7d9FR2GAUfnqja5v+yWxrV55S4xZLBo4eqLUoz7DNVp7EU+MWHWe+gaG0jUDQZgar30z5fHP7HQqmpuvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tda7KhZY; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tda7KhZY"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e9e81d4b0so8114788a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747953847; x=1748558647; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj7O/zXnxLWyEfr+1bNZHll+hm9si4+OEjirrZf3yQU=;
        b=Tda7KhZYlUsYX30vd3TXZguh8tR3VrUAJ4PxMfeCF6n2kgBUoS1A5l8RWjj9vzJK1x
         ErKF7Y6pnbjAV3nhR8H6cuFZy3saQStBdKwkZjOwZxmz5xaRLyitzx8nUdLsMbAJWPvc
         T2KiJtnHD1QOykTjYYlnjIpCgFrPjTqOrtx+ktIG0qmu5gD2kLll0Bjj4QrQxbKoefAF
         4whOtjUzOWJwCuq1Tw6sYZtEUP9dNFqsNwp9D5zrc7bMAIrlmBkpmb44oo/9M/aiqfzD
         7S78j6xleSXuptMDCrmIMHJBmA/FkHtMtZ9AvpWgabzZ6VV3clybekFYwN3OcrjE9q0W
         KBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953847; x=1748558647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj7O/zXnxLWyEfr+1bNZHll+hm9si4+OEjirrZf3yQU=;
        b=PidmU8xpfXTDwgB6W+L5HTWb7httUNnQ9cgCsdZNsfsvzR3U8UdgtTbI8iRQn6tIW7
         yzZdo30z5X7FCtrhlBBTxtIwU9Bn6p6YE5UXMa8/yurUDbjVYPrmudQLYLxLQE/OmG+/
         UMN1MDpcU7knZwoMJNOxZvdDwxpsffpNvapNbcoHUkU+/FkRMFDIAMOeD3nRBdfGHlBY
         RFQ3XXFhX7zADLy44qdHZDj48m4DG/89hA0fNoHFu0r6m9CjX0z4K7a7ZqpQ4wlBKEkA
         Q3tQ6mxXFTQvkvT9PwTt96sVsx4vs82irctWB9T+peGmdpK9VaLkS07vaFiTxE3lIcmm
         Ga/w==
X-Forwarded-Encrypted: i=1; AJvYcCW67mQyPFGqjuSUN1/lu8VZY0CDJ1GNy3gdyKL4IpZv9JETtgkZ6xd250nRGQBQxEXw2BZg5TmhhjmnAyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjc+YVq1hHpFnKs35lA7zjf9jxwil/FollsgYdHlp1EDydhWdb
	jgyU/UZuoJ2zqLXKujNcfZbqaJnAuq7ji+lvkTfmadPejyTNUs/D/KXAZ9/lO9JtICf/sShHsyX
	eK2UYeQ==
X-Google-Smtp-Source: AGHT+IGoPWmWq4q8zz+VWqAZHqqihZEUfMRSRH6eimytp/ket8uG716lDvP3zEiB0z4s39QEh7QHPmctfls=
X-Received: from pjbpl10.prod.google.com ([2002:a17:90b:268a:b0:301:2a0f:b03d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c90:b0:2ff:6af3:b5fa
 with SMTP id 98e67ed59e1d1-30e8322592emr33588602a91.22.1747953847261; Thu, 22
 May 2025 15:44:07 -0700 (PDT)
Date: Thu, 22 May 2025 15:44:05 -0700
In-Reply-To: <aC-XmCl9SVX39Hgl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522005555.55705-1-mlevitsk@redhat.com> <20250522005555.55705-4-mlevitsk@redhat.com>
 <aC-XmCl9SVX39Hgl@google.com>
Message-ID: <aC-otXnBwHsdZ7B4@google.com>
Subject: Re: [PATCH v5 3/5] KVM: nVMX: check vmcs12->guest_ia32_debugctl value
 given by L2
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Chao Gao <chao.gao@intel.com>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"

+Jim

On Thu, May 22, 2025, Sean Christopherson wrote:
> On Wed, May 21, 2025, Maxim Levitsky wrote:
> > Check the vmcs12 guest_ia32_debugctl value before loading it, to avoid L2
> > being able to load arbitrary values to hardware IA32_DEBUGCTL.
> > 
> > Reviewed-by: Chao Gao <chao.gao@intel.com>
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  arch/x86/kvm/vmx/nested.c | 3 ++-
> >  arch/x86/kvm/vmx/vmx.c    | 2 +-
> >  arch/x86/kvm/vmx/vmx.h    | 1 +
> >  3 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index e073e3008b16..00f2b762710c 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -3146,7 +3146,8 @@ static int nested_vmx_check_guest_state(struct kvm_vcpu *vcpu,
> >  		return -EINVAL;
> >  
> >  	if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS) &&
> > -	    CC(!kvm_dr7_valid(vmcs12->guest_dr7)))
> > +	    (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > +	     CC(vmcs12->guest_ia32_debugctl & ~vmx_get_supported_debugctl(vcpu, false))))
> 
> This is a breaking change.  For better or worse (read: worse), KVM's ABI is to
> drop BTF and LBR if they're unsupported (the former is always unsupported).
> Failure to honor that ABI means L1 can't excplitly load what it think is its
> current value into L2.
> 
> I'll slot in a path to provide another helper for checking the validity of
> DEBUGCTL.  I think I've managed to cobble together something that isn't too
> horrific (options are a bit limited due to the existing ugliness).

And then Jim ruined my day.  :-)

As evidenced by this hilarious KUT testcase, it's entirely possible there are
existing KVM guests that are utilizing/abusing DEBUGCTL features.

	/*
	 * Optional RTM test for hardware that supports RTM, to
	 * demonstrate that the current volume 3 of the SDM
	 * (325384-067US), table 27-1 is incorrect. Bit 16 of the exit
	 * qualification for debug exceptions is not reserved. It is
	 * set to 1 if a debug exception (#DB) or a breakpoint
	 * exception (#BP) occurs inside an RTM region while advanced
	 * debugging of RTM transactional regions is enabled.
	 */
	if (this_cpu_has(X86_FEATURE_RTM)) {
		vmcs_write(ENT_CONTROLS,
			   vmcs_read(ENT_CONTROLS) | ENT_LOAD_DBGCTLS);
		/*
		 * Set DR7.RTM[bit 11] and IA32_DEBUGCTL.RTM[bit 15]
		 * in the guest to enable advanced debugging of RTM
		 * transactional regions.
		 */
		vmcs_write(GUEST_DR7, BIT(11));
		vmcs_write(GUEST_DEBUGCTL, BIT(15));
		single_step_guest("Hardware delivered single-step in "
				  "transactional region", starting_dr6, 0);
		check_db_exit(false, false, false, &xbegin, BIT(16),
			      starting_dr6);
	} else {
		vmcs_write(GUEST_RIP, (u64)&skip_rtm);
		enter_guest();
	}

For RTM specifically, disallowing DEBUGCTL.RTM but allowing DR7.RTM seems a bit
silly.  Unless there's a security concern, that can probably be fixed by adding
support for RTM.  Note, there's also a virtualization hole here, as KVM doesn't
vet DR7 beyond checking that bits 63:32 are zero, i.e. a guest could set DR7.RTM
even if KVM doesn't advertise support.  Of course, closing that hole would require
completely dropping support for disabling DR interception, since VMX doesn't
give per-DR controls.

For the other bits, I don't see a good solution.  The only viable options I see
are to silently drop all unsupported bits (maybe with a quirk?), or enforce all
bits and cross our fingers that no L1 VMM is running guests with those bits set
in GUEST_DEBUGCTL.
