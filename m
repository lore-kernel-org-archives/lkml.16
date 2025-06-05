Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A15F28E17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 22:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749163672; cv=none; b=TjGENZp9nfuaKoM1Q7HPV7HQ52PTKNr6Xfo9WV6cOTbCCvID++KwiWCIcJYEIe3G1g7gq/DVNddtItKBOSzl9xgoCoPVmB0wzg4poln0BtazZHS5cL8xyQGBV7cDfUig4+CQDjgqctHADLhSoILrfiaYNG4vQxEFVdIeoJE4An8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749163672; c=relaxed/simple;
	bh=cvzViqUXMRfsW6Wx1QCAZBB63ewQpSvnWyRr9Mqmat8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ngxzq3XJ/0d3FMjv2Sz8pHObkO0SqqOFrDxKFBkcz8tjmM3TZM6ru86q9woaju2LM5u5shwOod+8oW6F1Z+/iCh0zdcQMzkZdCWGX/d1iSN9zq+kOOYni3M7qKWUximqkrEC0M2EOWnCq0s4gBpK14ycT8HKxlXjz/Bwx8yyu8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lC6XnMVW; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lC6XnMVW"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747fa83d81dso1315874b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 15:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749163670; x=1749768470; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dQa4RZKS4Qz47fRGsfEi2gcQhtmL0q5YIoUaqY8Vz5w=;
        b=lC6XnMVWp/Kd7gP9haO8pqNRD8709CK1cU3nm0/0UwEv8lxm3JWHJGupdVvOY3m1jj
         qhyDKKADEspWYWiRMpQNKCsHdnK+6Bg63EPgaMpo2Sb6CHsRnxdTOEblOQC5hW5LTe+P
         9Q3h824rwx4lL70H8BpGR4o3Xxb9eWbwVLi90JHHiko+7Jz3FMEMXF5+hFmnyR+Lz6gD
         mGhTm3HSa1CAbVysZoggd0azSp1xnEQO4zac/JQJi1KM9SKQpjBtAH/05b67e6FHwDXk
         GdNx+XnVEhCIhUJtbuEFbWvFnmjOASn+aIuhegEy5DgVtEmbzkwtfdHZzzJdM6+k3C0m
         AJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749163671; x=1749768471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQa4RZKS4Qz47fRGsfEi2gcQhtmL0q5YIoUaqY8Vz5w=;
        b=lHyw5SNHfwx4X1/IXBxOg92uRwNvdLEkObGeniBlolyQGWtPTt0tQcR04gIKOLI5AQ
         LNSzKvDMd7//5vsBmXwUXARoTh7vKp0DnEIub1WJQd0JtZowaiyuytz5d2O0CepHuyUy
         tbHYIFCZ5xR7GkIzW6zy5E2nn3dVoEtu7+eZ1ENiSsUspXv4/HUmAuB36UY0Nwg87mme
         0MMjC9aLwz8ykSTpGMCOucrrxfC3XWjJ0uiB/n2mVfzKubJc7L7v+oMpi53HnBvpD0Ge
         7FhGihNSSO6peuhZDcxx1RsZQQp0Wxt+mlRPUphiBwHPSGJKRgqdYNSfROYCmkGvgJkr
         +UEg==
X-Forwarded-Encrypted: i=1; AJvYcCXPG1vtsoJT6d3zq+54hyfVw98m+uDmRYFVF3q9i8sXkohZk52jPetVfDtNDuMwTmWG9sGvd9oKabwIB6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnKsvzaTliwErrEXfbdkcgenOZMIt/7Bqga7V9pQLy+O7KfcyH
	9+4U9a/wwxT+8VpNGV9mXGAyizaqu3J/vgWMviZpuGkD55i2ferDNyDnfChAQsmVesLSTD9KNfz
	G8UIi1g==
X-Google-Smtp-Source: AGHT+IEbU8/7oKw60IdekSZ2uPK7tOP69qubBrOPVxWkcsFEQioE7o+fXimMV9GAzzkkwAHHPR09XNVnGaA=
X-Received: from pfun18.prod.google.com ([2002:a05:6a00:7d2:b0:746:32ee:a305])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9982:b0:215:dc01:8b1f
 with SMTP id adf61e73a8af0-21ee2618e1cmr1276375637.32.1749163670714; Thu, 05
 Jun 2025 15:47:50 -0700 (PDT)
Date: Thu, 5 Jun 2025 15:47:49 -0700
In-Reply-To: <729bd284-f1df-d384-8db1-37b448b0c1da@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401161106.790710-1-pbonzini@redhat.com> <20250401161106.790710-14-pbonzini@redhat.com>
 <729bd284-f1df-d384-8db1-37b448b0c1da@amd.com>
Message-ID: <aEIelSM6viCxaHj7@google.com>
Subject: Re: [PATCH 13/29] KVM: implement vCPU creation for extra planes
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	roy.hopkins@suse.com, ashish.kalra@amd.com, michael.roth@amd.com, 
	jroedel@suse.de, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Apr 21, 2025, Tom Lendacky wrote:
> On 4/1/25 11:10, Paolo Bonzini wrote:
> > For userspace to have fun with planes it is probably useful to let them
> > create vCPUs on the non-zero planes as well.  Since such vCPUs are backed
> > by the same struct kvm_vcpu, these are regular vCPU file descriptors except
> > that they only allow a small subset of ioctls (mostly get/set) and they
> > share some of the backing resources, notably vcpu->run.
> > 
> > TODO: prefault might be useful on non-default planes as well?
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  Documentation/virt/kvm/locking.rst |   3 +
> >  include/linux/kvm_host.h           |   4 +-
> >  include/uapi/linux/kvm.h           |   1 +
> >  virt/kvm/kvm_main.c                | 167 +++++++++++++++++++++++------
> >  4 files changed, 142 insertions(+), 33 deletions(-)
> > 
> 
> > @@ -4200,8 +4223,13 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
> >  	 * release semantics, which ensures the write is visible to kvm_get_vcpu().
> >  	 */
> >  	vcpu->plane = -1;
> > -	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
> > -	r = xa_insert(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
> > +	if (plane->plane)
> > +		vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
> > +	else
> > +		vcpu->vcpu_idx = plane0_vcpu->vcpu_idx;
> 
> Don't you want the atomic_read() for the plane0 vCPU and use the plane0
> vcpu->idx value for non-zero plane vCPUs?

+1, this looks backwards to me as well.

> 
> > +
> > +	r = xa_insert(&plane->vcpu_array, vcpu->vcpu_idx,
> > +		      vcpu, GFP_KERNEL_ACCOUNT);
> >  	WARN_ON_ONCE(r == -EBUSY);
> >  	if (r)
> >  		goto unlock_vcpu_destroy;
> > @@ -4220,13 +4248,14 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
> >  	if (r < 0)
> >  		goto kvm_put_xa_erase;
> >  
> > -	atomic_inc(&kvm->online_vcpus);
> > +	if (!plane0_vcpu)
> 
> It looks like plane0_vcpu will always have value, either from input or
> assigned in an else path earlier in the code. Should this be
> "!plane->plane" ?

Even if plane0_vcpu were viable, my vote is for !plane->plane, because that makes
it much more obvious that only plane0 bumps the count.
