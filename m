Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA7D2DFF10
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176614; cv=none; b=RqFT/IUL0tjwc3z096hQWEGfTjBwcP+Uqru7gfTEaW/o7F8X9OCWyyy3Po3S1UC8utfi6eyPhkSJ4tcvu+rcFZoJCbsVhXSshUFmZNKxopfv56nwvrurc8C5TSwrDX/OnwmRK/ddr+5qvJHsxfT76pHSoHSCldDTOURop98R7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176614; c=relaxed/simple;
	bh=tZ+fZ2k1EPsBMGXOim/2G6gz3Iic+QUqPhsBrJ7hjss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BLDdoeU/0yG0u/x3iHFfqDsrZ5OakADgbjzS3TaCw0c64I39UuIWVmoeR3oJ0gDJ7XTRWsJ5SBvR/A0X+CZgtNKr7PXx2I8ppcIdEYs4dsSuZzpWmpmF1xXQ0pwrZLL0ym774lVDcBOl3ELoKgLZNGmR/oYVf+I0TsoNPjLs58I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UeqyD1W0; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UeqyD1W0"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so8311106a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750176611; x=1750781411; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mpe9oKaiEbfB05dXqSqSLq6O1r6s9FrJ+B97+HDCer0=;
        b=UeqyD1W024M9LrzCoDE8xO1fxo29s1Z9VNVdv4IPPbqW9NAe9wBU9KAbFSREvE2d/g
         8XnxcIX6nuBqQZNdRO2zZqy3VZTAnhRgNthjVmXj3Qblw4CSkPoITlcUO0zdF2f5285i
         TFdN8Rf7fmW0rvZGM1nX0R7BQ6ZawsH8BRGFqMu1yTQ0t+JJsijLkxNXwKTA0boXYgDD
         fyPxv0w1km5GoybaqDUv5RNS6oZiM8Tzwv1i4rThC/1sTfpJ0TSBfObuGDnwIwzksp+y
         Xi3qrD7uBXjYfVcvvmIjvshL/8YGCeS3yU2E3v7cjCq3rgUmCDH5jAFqY0SyG5Sg1Rpx
         bJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176611; x=1750781411;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpe9oKaiEbfB05dXqSqSLq6O1r6s9FrJ+B97+HDCer0=;
        b=IvUfB7Q/TRjvKrnrG7XA9/wlWWNTCP/LFqPqsdjmmDGlp+BONFGKjLvO6oyO8rb4Kv
         H5LW22CZWO/7irqjUL5MZ/XawbP395g2R6bdD1KPT4voQrr7ziMi0rjwSKf5bSfp+WmF
         lmXrsPNhtJOqPZXYxlVB8xH5OvkSBG6cXEZDTPeKLQgj1NjmptZuVLrOSu66h9B70Fgm
         cCmrir62kTJp+mgRQhYVcYMCBZaturjJoJvLyS6/rdBJxkQ97LIwmJ1iP5ubXL3ay6bB
         qhdkmtskuuRlgpjXzE/F6Hhi/pXXMb8ZrVGzBdftEe+e1VzOs4XuInJ9kNcoQaW6QM7M
         fXMA==
X-Forwarded-Encrypted: i=1; AJvYcCWUnvYsxSXtxSfVLYeVgl6OKI0b7eOEh5nThD+c21FAMCNhXim7fFA0aLoXNnYZ/i71uQ1grW68cJsg9CE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2B20LgCIHqDFD8dEf0hkp7RSUL6V0Isz/9fkGfNF+ptSlRbux
	VSTDOh+rcM4WBdStm1b7ClHyDEyfuoLHjWhHRGTcaFCvR2jT1d4MB0T7Ibbo+uqUFHR5cx76QUu
	y0f/fMQ==
X-Google-Smtp-Source: AGHT+IFq1bSy5ue6p5VOY2+WKnKKimaXelT5uMjgsHODbKGY/Q+ifAgtUVMh8UXZFapv6bjOQtBJ96fEnfQ=
X-Received: from pjl7.prod.google.com ([2002:a17:90b:2f87:b0:311:b3fb:9f74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cd:b0:312:1ae9:152b
 with SMTP id 98e67ed59e1d1-313f1d12fe0mr17819830a91.23.1750176611703; Tue, 17
 Jun 2025 09:10:11 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:10:10 -0700
In-Reply-To: <bmx43lru6mwdyun3ktcmoeezqw6baih7vgtykolsrmu5q2x7vu@xp5jrbbqwzej>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-14-seanjc@google.com>
 <bmx43lru6mwdyun3ktcmoeezqw6baih7vgtykolsrmu5q2x7vu@xp5jrbbqwzej>
Message-ID: <aFGTYoxlLhZsiMUC@google.com>
Subject: Re: [PATCH v3 12/62] KVM: SVM: Inhibit AVIC if ID is too big instead
 of rejecting vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 17, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:15PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index ab228872a19b..f0a74b102c57 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -277,9 +277,19 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
> >  	int id = vcpu->vcpu_id;
> >  	struct vcpu_svm *svm = to_svm(vcpu);
> >  
> > +	/*
> > +	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
> > +	 * hardware.  Immediately clear apicv_active, i.e. don't wait until the
> > +	 * KVM_REQ_APICV_UPDATE request is processed on the first KVM_RUN, as
> > +	 * avic_vcpu_load() expects to be called if and only if the vCPU has
> > +	 * fully initialized AVIC.
> > +	 */
> >  	if ((!x2avic_enabled && id > AVIC_MAX_PHYSICAL_ID) ||
> > -	    (id > X2AVIC_MAX_PHYSICAL_ID))
> > -		return -EINVAL;
> > +	    (id > X2AVIC_MAX_PHYSICAL_ID)) {
> > +		kvm_set_apicv_inhibit(vcpu->kvm, APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG);
> > +		vcpu->arch.apic->apicv_active = false;
> 
> This bothers me a bit. kvm_create_lapic() does this:
>           if (enable_apicv) {
>                   apic->apicv_active = true;
>                   kvm_make_request(KVM_REQ_APICV_UPDATE, vcpu);
> 	  }
> 
> But, setting apic->apicv_active to false here means KVM_REQ_APICV_UPDATE 
> is going to be a no-op.

That's fine, KVM_REQ_APICV_UPDATE is a nop in other scenarios, too.  I agree it's
not ideal, but this is a rather extreme edge case and a one-time slow path, so I
don't think it's worth doing anything special just to avoid KVM_REQ_APICV_UPDATE.

> This does not look to be a big deal given that kvm_create_lapic() itself 
> is called just a bit before svm_vcpu_create() (which calls the above 
> function through avic_init_vcpu()) in kvm_arch_vcpu_create(), so there 
> isn't that much done before apicv_active is toggled.
> 
> But, this made me wonder if introducing a kvm_x86_op to check and 
> enable/disable apic->apicv_active in kvm_create_lapic() might be cleaner 
> overall

Hmm, yes and no.  I completely agree that clearing apicv_active in avic.c is all
kinds of gross, but clearing apic->apicv_active in lapic.c to handle this particular
scenario is just as problematic, because then avic_init_backing_page() would need
to check kvm_vcpu_apicv_active() to determine whether or not to allocate the backing
page.  In a way, that's even worse, because setting apic->apicv_active by default
is purely an optimization, i.e. leaving it %false _should_ work as well, it would
just be suboptimal.  But if AVIC were to key off apic->apicv_active, that could
lead to KVM incorrectly skipping allocation of the AVIC backing page.

> Maybe even have it be the initialization point for APICv: 
> apicv_init(), so we can invoke avic_init_vcpu() right away?

I mostly like this idea (actually, I take that back; see below), but VMX throws
a big wrench in things.  Unlike SVM, VMX doesn't have a singular "enable APICv"
flag.  Rather, KVM considers "APICv" to be the combination of APIC-register
virtualization, virtual interrupt delivery, and posted interrupts.

Which is totally fine.  The big wrench is that the are other features that interact
with "APICv" and require allocations.  E.g.  the APIC access page isn't actually
tied to enable_apicv, it's tied to yet another VMX feature, "virtualize APIC
accesses" (not to be confused with APIC-register virtualization; don't blame me,
I didn't create the control knobs/names).

As a result, KVM may need to allocate the APIC access page (not to be confused
with the APIC *backing* page; again, don't blame me :-D) when enable_apicv=false,
and even more confusingly, NOT allocate the APIC access page when enable_apicv=true.

	if (cpu_need_virtualize_apic_accesses(vcpu)) {  <=== not an enable_apic check, *sigh*
		err = kvm_alloc_apic_access_page(vcpu->kvm);
		if (err)
			goto free_vmcs;
	}

And for both SVM and VMX, IPI virtualization adds another wrinkle, in that the
per-vCPU setup needs to fill an entry in a per-VM table.  And filling that entry
needs to happen at the very end of vCPU creation, e.g. so that the vCPU can't be
targeted until KVM is ready to run the vCPU.

Ouch.  And I'm pretty sure there's a use-after-free in the AVIC code.  If
svm_vcpu_alloc_msrpm() fails, the avic_physical_id_table[] will still have a pointer
to freed vAPIC page.

Thus, invoking avic_init_vcpu() "right away" is unfortunately flat out unsafe
(took me a while to realize that).

So while I 100% agree with your dislike of this patch, I think it's the least
awful band-aid, at least in the short term.

Longer term, I'd definitely be in favor of cleaning up the related flows, but I
think that's best done on top of this series, because I suspect it'll be somewhat
invasive.
