Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B178137C2A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478879; cv=none; b=QxjZGBA2flUC1ZE6hey/Klm4McX18Xc6e3MNajbC13krBnhhIfS7Axx3kJVbqp17JH2BjKdbG5qqI9t3r+X85s2Ir+OffuUaDyLz3W0gPAvO4RW+VvohlkCpLpQL0peJsrI9nndDtF5Fatrnds4s9Ru9eSjucNUbyifBAPfVPNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478879; c=relaxed/simple;
	bh=wNCK673TSNOcz+SGKsVUt9JPBx+XFVGFRTrhCpLO0Lk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILmzeViI3OS1eGrkZO6w7aqnfiZ3Ago1XmuOH+j3o4xXMyEK0WRKoxpBxNL3ka6dXf5MHEdmEkC/JwcZP0pzw6N8NolDBrOogP+X0IW7EbP32FmoADhkXWl/171413juVfRdsOwPphXJ503laipzXzV1uVKFH3bjFOYc/qF7gF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xp2jduyh; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xp2jduyh"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-231d13ac4d4so67424415ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749478877; x=1750083677; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSIEw/2MydfV3kI4WHDS//5IkvGuSP6WLCIhrE/jR14=;
        b=xp2jduyhZG2gfbxaw4yLcKowZ2UC2RJUYojgGAVf2xwmIrfAmkQlyZj8lU2dHf43ss
         jo4gncmRkHF0chkH0ftgkob6oStyvq8DllB6ns/kj8l6qAHUi5ZJU751u8t/ep0sAyTa
         1hep9IOU8Dc/n6F37W8TUqziMxiUeu8YyuJ333dKYbMhM/TYf/GSGpnwJ+xDH1dzLVS9
         wt19GsaOMicRe/RDN4sbabU4E0iDzQI0W0v9T7Kp46WDIP9AuhVmDMtsRC5OyW+6H+bS
         JlzDm+Lo103JdWt1htKc6TSWzg615p2l/CgJSMwA4pe4r49txxN7NtKoGrKOP/AJUjjR
         4yHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478877; x=1750083677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSIEw/2MydfV3kI4WHDS//5IkvGuSP6WLCIhrE/jR14=;
        b=nLH2gM1zFbqLr8c2QWxQVB84Z8a6nJCrvEXGQF7PBgbQBb+ul37NsT+2MC2UkxSMIA
         FdD8ax3Jry/oTLpjho73fp667B1iz8p2VfxT9KEm3KhQ3jgHkSuzjf2W9gsprRpMwfCS
         vC774OfYStlyY89n7j+qE+5/bSzzKn7DeNtZSN1m32EKqgWqlwqW6tzdXmc6T8pyE7xH
         GPUWZkfGkTN5Qp6IG0lPk0JziTS1mSAYxwK4S0Wt2cOpGoNyV/ieJLZ4vHPT7paLjonH
         PnE6MxP6Hah71hhsfn9VC4Njpu2qcHKJjDaoPWW4j40KkR+Hr7/PjQWIvFmV5fteNAOg
         M4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUBkaUJ6qjIm7tjKzFLdxT1uK78n55/gFJn5rXj3PbnLVnqBj4dHu/T1Ogrfkv+WztGkA8cGRo1II32Ymg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw5mIrUAIVWluPhnb6r2zOQvUWRAHK235E+P1QOZEiJ0wvJuNI
	2w2Wjy0jqvL2fSqnbjfbmPUEJH4fkQxMbQoTvG6du+SUBQoQhKZKGYD5uHeCyXxFTBDMSrvPGIn
	+qxUglw==
X-Google-Smtp-Source: AGHT+IERysFaxhAHifqxHTi2VcbI8oY5rYOLco6ZrI9WGaP0rXEe5OjT6M/29a/9l0QmkI+VOJHg1ucx2CE=
X-Received: from plbju5.prod.google.com ([2002:a17:903:4285:b0:234:45eb:5e18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f544:b0:235:f3e6:467f
 with SMTP id d9443c01a7336-23601cf6bd8mr192715225ad.2.1749478877172; Mon, 09
 Jun 2025 07:21:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 07:21:16 -0700
In-Reply-To: <20250609122402.GM19710@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250524013943.2832-1-ankita@nvidia.com> <20250524013943.2832-2-ankita@nvidia.com>
 <aEMvbIu530nCqwhG@google.com> <20250609122402.GM19710@nvidia.com>
Message-ID: <aEbm64VUr_GmBFzI@google.com>
Subject: Re: [PATCH v6 1/5] KVM: arm64: Block cacheable PFNMAP mapping
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: ankita@nvidia.com, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, 
	shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com, 
	aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com, kjaju@nvidia.com, 
	targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com, 
	apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, 
	mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com, 
	alex.williamson@redhat.com, sebastianene@google.com, coltonlewis@google.com, 
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org, 
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org, 
	ddutile@redhat.com, tabba@google.com, qperret@google.com, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 09, 2025, Jason Gunthorpe wrote:
> On Fri, Jun 06, 2025 at 11:11:56AM -0700, Sean Christopherson wrote:
> > > @@ -1612,6 +1624,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >  
> > >  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> > >  
> > > +	if ((vma->vm_flags & VM_PFNMAP) &&
> > > +	    !mapping_type_noncacheable(vma->vm_page_prot))
> > 
> > I don't think this is correct, and there's a very real chance this will break
> > existing setups.  PFNMAP memory isn't strictly device memory, and IIUC, KVM
> > force DEVICE/NORMAL_NC based on kvm_is_device_pfn(), not based on VM_PFNMAP.
> 
> kvm_is_device_pfn() effecitvely means KVM can't use CMOs on that
> PFN. It doesn't really mean anything more..

Ah, kvm_is_device_pfn() isn't actually detecting device memory, it's simply
detecting memory that isn't in the direct map.

> PFNMAP says the same thing, or at least from a mm perspective we don't
> want drivers taking PFNMAP memory and then trying to guess if there
> are struct pages/KVAs for it. PFNMAP memory is supposed to be fully
> opaque.
> 
> Though that confusion seems to be a separate issue from this patch.
> 
> > 	if (kvm_is_device_pfn(pfn)) {
> > 		/*
> > 		 * If the page was identified as device early by looking at
> > 		 * the VMA flags, vma_pagesize is already representing the
> > 		 * largest quantity we can map.  If instead it was mapped
> > 		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
> > 		 * and must not be upgraded.
> > 		 *
> > 		 * In both cases, we don't let transparent_hugepage_adjust()
> > 		 * change things at the last minute.
> > 		 */
> > 		device = true;
> 
> "device" here is sort of a mis-nomer, it is really just trying to
> setup the S2 so that CMOs are not going go to be done.
> 
> Calling it 'disable_cmo' would sure make this code clearer..
> 
> > @@ -1639,6 +1653,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >                 return -EFAULT;
> >  
> >         if (kvm_is_device_pfn(pfn)) {
> > +               if (is_vma_cacheable)
> > +                       return -EINVAL;
> > +
> 
> eg
> 
> if (!kvm_can_use_cmo_pfn(pfn)) {
>                if (is_vma_cacheable)
>                        return -EINVAL;
> 
> >                  * If the page was identified as device early by looking at
> >                  * the VMA flags, vma_pagesize is already representing the
> > @@ -1722,6 +1739,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >                 prot |= KVM_PGTABLE_PROT_X;
> >  
> >         if (device) {
> > +               if (is_vma_cacheable) {
> > +                       ret = -EINVAL;
> > +                       goto out;
> > +               }
> 
> if (disable_cmo) {
>                if (is_vma_cacheable)
>                        return -EINVAL;
> 
> Makes alot more sense, right? If KVM can't do CMOs then it should not
> attempt to use memory mapped into the VMA as cachable.

Yes, for sure.

> >                 if (vfio_allow_any_uc)
> >                         prot |= KVM_PGTABLE_PROT_NORMAL_NC;
> >                 else
> > 
> 
> Regardless, this seems good for this patch at least.
> 
> Jason
