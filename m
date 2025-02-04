Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD08146013
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697585; cv=none; b=k0XzqllfD5f1IVU+sHjVxlok2P0Wv6ZnA3vIMZTYRyTh+gxbuiG7IJABfRqQBvMbkvD/IGsCIVwB2xaVK3D4UfSokjnoOEdx+NBR+eaSnC6d6hQM1fn8iqbMlqrxZWEOxpIY+kNDrspyGSqjpgz1j4gqzY03bVh7/oOEJIha00w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697585; c=relaxed/simple;
	bh=+M/l9dtCOVW7vI9Hd7L9n6t/ZLlwTXolPFtCReLdywI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AMaa+6qwm1isyFoKXkKCk2ySXPtBxZWFYwfbD4GOPUd/Lg5ZjhH/1ezEPBa1snJsgCKQq6ng984rtaLwI2YUgqtzvRERLAEYrQlpWysjj/p96NXPXaA49XHoU5gyvn5P03ZYgt/9bfpN9DVUjCCpkaEsz3VSTAxfboNrnwrSgLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gwb+1U+T; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gwb+1U+T"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f9c78739f5so207845a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738697583; x=1739302383; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHjP7gj6o+oH3NbAr56dzEfdgv1Prurjy+rUsRta40E=;
        b=Gwb+1U+TgD33aGC1wZr6BNTH0W0TKuh38zkaKtn2sZrVsSRHFH0AD4IErvBlWMr52F
         4b4X8dgBFm9Ln2o91m4Ljp2nYAGVPAD4DBpm7+ogc8PNTigZeLxRGnb9/zxQiVgpPz9u
         TAPYFF30dzCrVYWVAmpznu6tG3IIPxyy7LIby+t8f2X4eX5jgFQ37bVoESW5BWM9mvIb
         yv1PIm62wYV0V1iw3QZXwaoc0BQTSlmZjOTnULYklPUaSc/k6rpii8IppA08BCTZAa8K
         Ceprfb9LTLoXnFHqRo5t5WHuBaM0yOqI3Tyiti3TrrHn4EdBRoTvMSpocUJNuqfTRQhU
         LWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697583; x=1739302383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHjP7gj6o+oH3NbAr56dzEfdgv1Prurjy+rUsRta40E=;
        b=Ud3KQQWs9g+ANv57/lD1JwGZhNeX6JX9WZuXa+ZBUj8Dlmz3WgHrvXwHVQkMCkqal9
         cc/xaYU2JctjqPBfmS7wcs1+GE1idq1SfHMN1IKwDX2ESKJPFnlswJq0AuenofWMRBXX
         MoG0EkO6yc8SpEN7Pwawsa/L12EVVe5obUCDRkm1SG0JRSz57xPFGhb+cnLiw4J394RP
         NFNq9mJ55PleuP7n6R3ENs0qgHCITcSoufxty943OPTmZCbiNThTZjaRxVg+8GaWZvBm
         7XOP/cqiglxYxy0kptZuj6G8kHdfMEzAXzlwYKgleRPSXY7ybkfPWHSkmdwpF6Qghxzd
         C/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXhUeycm76TGMIenqJ2HYzotoJ1wUOzDd9gSXwV7P73Pk6/MStyXy11h+/EnGW98QvxwVBOvoLsMJ+cEl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDjMlhucNYNUwnGXKgpReFnmH2b9wda2IrH4aAXqbACjWSNsmX
	k4o8feN3dT+bDAZJQoTXFL9jNgezfomOhykM6WooPiKVnKvzIJJSkeNitJkdYWOpqCBlHatW5XT
	aAw==
X-Google-Smtp-Source: AGHT+IHAs4f3eaCGVAUXB0jWrqWaLt84ZIAgfeob9iDCxzXERNZ2tG3HGxCWeqQKtMucRgij4r62wRc8BZ0=
X-Received: from pjbse7.prod.google.com ([2002:a17:90b:5187:b0:2ea:61ba:b8f7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5404:b0:2ee:e2f6:8abc
 with SMTP id 98e67ed59e1d1-2f9ba26c483mr7041217a91.10.1738697582766; Tue, 04
 Feb 2025 11:33:02 -0800 (PST)
Date: Tue, 4 Feb 2025 11:33:01 -0800
In-Reply-To: <cck44jwjx7h4xtxf32scqy376fd575zn4mhfzxu5k4dry7le3g@thckuzeoujuj>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738595289.git.naveen@kernel.org> <3d8ed6be41358c7635bd4e09ecdfd1bc77ce83df.1738595289.git.naveen@kernel.org>
 <dc784d6e4f6c4478fc18e0bc2d5df56af40d0019.camel@redhat.com> <cck44jwjx7h4xtxf32scqy376fd575zn4mhfzxu5k4dry7le3g@thckuzeoujuj>
Message-ID: <Z6JrbfQ-4bsERzA1@google.com>
Subject: Re: [PATCH 1/3] KVM: x86: hyper-v: Convert synic_auto_eoi_used to an atomic
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 04, 2025, Naveen N Rao wrote:
> Hi Maxim,
> 
> On Mon, Feb 03, 2025 at 08:30:13PM -0500, Maxim Levitsky wrote:
> > On Mon, 2025-02-03 at 22:33 +0530, Naveen N Rao (AMD) wrote:
> > > diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> > > index 6a6dd5a84f22..7a4554ea1d16 100644
> > > --- a/arch/x86/kvm/hyperv.c
> > > +++ b/arch/x86/kvm/hyperv.c
> > > @@ -131,25 +131,18 @@ static void synic_update_vector(struct kvm_vcpu_hv_synic *synic,
> > >  	if (auto_eoi_old == auto_eoi_new)
> > >  		return;
> > >  
> > > -	if (!enable_apicv)
> > > -		return;
> > > -
> > > -	down_write(&vcpu->kvm->arch.apicv_update_lock);
> > > -
> > >  	if (auto_eoi_new)
> > > -		hv->synic_auto_eoi_used++;
> > > +		atomic_inc(&hv->synic_auto_eoi_used);
> > >  	else
> > > -		hv->synic_auto_eoi_used--;
> > > +		atomic_dec(&hv->synic_auto_eoi_used);
> > >  
> > >  	/*
> > >  	 * Inhibit APICv if any vCPU is using SynIC's AutoEOI, which relies on
> > >  	 * the hypervisor to manually inject IRQs.
> > >  	 */
> > > -	__kvm_set_or_clear_apicv_inhibit(vcpu->kvm,
> > > -					 APICV_INHIBIT_REASON_HYPERV,
> > > -					 !!hv->synic_auto_eoi_used);
> > > -
> > > -	up_write(&vcpu->kvm->arch.apicv_update_lock);
> > > +	kvm_set_or_clear_apicv_inhibit(vcpu->kvm,
> > > +				       APICV_INHIBIT_REASON_HYPERV,
> > > +				       !!atomic_read(&hv->synic_auto_eoi_used));
> > 
> > Hi,
> > 
> > This introduces a race, because there is a race window between the moment
> > we read hv->synic_auto_eoi_used, and decide to set/clear the inhibit.
> > 
> > After we read hv->synic_auto_eoi_used, but before we call the
> > kvm_set_or_clear_apicv_inhibit, other core might also run
> > synic_update_vector and change hv->synic_auto_eoi_used, finish setting the
> > inhibit in kvm_set_or_clear_apicv_inhibit, and only then we will call
> > kvm_set_or_clear_apicv_inhibit with the stale value of
> > hv->synic_auto_eoi_used and clear it.
> 
> Ah, indeed. Thanks for the explanation.
> 
> I wonder if we can switch to using kvm_hv->hv_lock in place of 
> apicv_update_lock. That lock is already used to guard updates to 
> partition-wide MSRs in kvm_hv_set_msr_common(). So, that might be ok 
> too?

Why?  All that would do is add complexity (taking two locks, or ensuring there
is no race when juggling locks), because if the guest is actually toggling AutoEOI
at a meaningful rate on multiple vCPUs, then there is going to be lock contention
regardless of which lock is taken.
