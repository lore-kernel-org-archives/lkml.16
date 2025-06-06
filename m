Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E6519DF7A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749233520; cv=none; b=LIyAHwXG39/yP/IPRR7dwr1843qLFl26JKOO+UVfJktqUlgpkRCAydYKEc2IapIUWveaxnxcn4rJqSW6v/wzec9kEw4Hxu7UCFq1dqRh/9n59tzJulQNfeeimDFpLtJDIgOyltpJgvzOXWhi00v+mpL6ROtkKWVQNzyi5Oc5HFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749233520; c=relaxed/simple;
	bh=AGMz9ZKOylSWIfehSBLwfJo5U8gevcDw4zx/mHAF+AQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G0lXaQzrwPpOOyEZ5vw4xQNkLDhqQzTYJOykhpwM2E8H+0pVd4/2FKd1juQPYOcXiCb1AI++TseQ87T7xuwg4XdaOtfsIXZZMSvXVhKKJjtA4A5idJvuz2JhCLeHiAvaKzLUfbgLEx7vaJ9oBTF7b4jvnFmrPiM/u/+vCdYznwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eA28uik/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eA28uik/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-310efe825ccso2525603a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749233518; x=1749838318; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=goGsGlGK4aCvgRlt6QQZwnV9SY/etRc0Yb1ngROaDOc=;
        b=eA28uik/Br9V1/XB+KszSrD+0dhR5algzMcBbryOaz3edrsCUr5avDn5fwuaB2hJ57
         avlvw15gA1gGun0kXNa83pAeFcgQv38t8KxeP5AKF3i1bAGYIMxp51VTwHPyi3GCYIMQ
         WNQlknOFAAzxsdSnqbxfttbPCUzIWB78sHCtzQ4Nhp2/sVoVvxkhJ0Kid/Ej0yq7KI9T
         DACO2fS0Px5gceAybY/T8BHeJKcQS5aZqxq/xlXnkA6mq4LIuAxMzTWB/1XxNDoQZhn9
         Xup14L84agz5F39sm1dogRgChmqBCnW56xTgGTMvWw4otL6Wf5vQ39XfjGKNgaH+rBas
         RYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749233518; x=1749838318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goGsGlGK4aCvgRlt6QQZwnV9SY/etRc0Yb1ngROaDOc=;
        b=uzTbCy/08FTAFYkFfKfT2PNEifo8DZ6iEEhRwj7kbyG8HQALl0EX+tvNyNmcCAQb3J
         rahVgoTRFePUSCZWsUoswtrLzMJFODy131hArZJWGL+TEV739wtnBlkSfSHPbAQgLS1w
         2XQNLzsr8XW3lxMl1FAjkXRU44V39aRbmq/Xz+Qxmp3T5fHt7kh77eoDQ4Ip4NvB445d
         1+G2WU9bVdl+cL7V5Xdm22lCqKrGPqHTA31II+p0rkP1B+iEqDyUdWQKVVwviEPkwHqY
         Y/u8Rz5XY3aOd4ysMRdJn0YtxzQiJx2pPeF7Ov7WTTo5g3ToxLmS3CYGNwDctguiqSpd
         RUyg==
X-Forwarded-Encrypted: i=1; AJvYcCXx/1iOXelG67Vs6rtNmuJYrkDBjhKX8CMWFuauECI2ZouOnRdcq6vxBN6NtwFjtjlgZjWtczw00cjb49c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlxFdfbvE/osQ6PpQWDkEdCy874L+XeL38SZqlx5pAR5WHMWK
	OFRuSfqs2D0RjtyDDDzljEPzrnyZf5y4+QFZg+B8SkTXaEtkGwCpmdhbfaFZcZhXGXSujff3fst
	tSiMjbg==
X-Google-Smtp-Source: AGHT+IEL48Zr+RVpxcph90N0P9k6HL0QyILrRx6484oP33DwOnxzZeVG7VJ6lc1LW/g9pPx5ZMAaWFJF2Pc=
X-Received: from pjbqd13.prod.google.com ([2002:a17:90b:3ccd:b0:312:4274:c4ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c5:b0:313:33ca:3b8b
 with SMTP id 98e67ed59e1d1-31346b21437mr6696240a91.9.1749233518162; Fri, 06
 Jun 2025 11:11:58 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:11:56 -0700
In-Reply-To: <20250524013943.2832-2-ankita@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250524013943.2832-1-ankita@nvidia.com> <20250524013943.2832-2-ankita@nvidia.com>
Message-ID: <aEMvbIu530nCqwhG@google.com>
Subject: Re: [PATCH v6 1/5] KVM: arm64: Block cacheable PFNMAP mapping
From: Sean Christopherson <seanjc@google.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com, 
	lpieralisi@kernel.org, david@redhat.com, aniketa@nvidia.com, cjia@nvidia.com, 
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com, 
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com, 
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, 
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com, 
	sebastianene@google.com, coltonlewis@google.com, kevin.tian@intel.com, 
	yi.l.liu@intel.com, ardb@kernel.org, akpm@linux-foundation.org, 
	gshan@redhat.com, linux-mm@kvack.org, ddutile@redhat.com, tabba@google.com, 
	qperret@google.com, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"

On Sat, May 24, 2025, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Fixes a security bug due to mismatched attributes between S1 and
> S2 mapping.
> 
> Currently, it is possible for a region to be cacheable in S1, but mapped
> non cached in S2. This creates a potential issue where the VMM may
> sanitize cacheable memory across VMs using cacheable stores, ensuring
> it is zeroed. However, if KVM subsequently assigns this memory to a VM
> as uncached, the VM could end up accessing stale, non-zeroed data from
> a previous VM, leading to unintended data exposure. This is a security
> risk.
> 
> Block such mismatch attributes case by returning EINVAL when userspace
> try to map PFNMAP cacheable. Only allow NORMAL_NC and DEVICE_*.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Sean Christopherson <seanjc@google.com>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  arch/arm64/kvm/mmu.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2feb6c6b63af..305a0e054f81 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1466,6 +1466,18 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>  	return vma->vm_flags & VM_MTE_ALLOWED;
>  }
>  
> +/*
> + * Determine the memory region cacheability from VMA's pgprot. This
> + * is used to set the stage 2 PTEs.
> + */
> +static unsigned long mapping_type_noncacheable(pgprot_t page_prot)

Return a bool.  And given that all the usage queries cachaeable, maybe invert
this predicate?

> +{
> +	unsigned long mt = FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(page_prot));
> +
> +	return (mt == MT_NORMAL_NC || mt == MT_DEVICE_nGnRnE ||
> +		mt == MT_DEVICE_nGnRE);
> +}

No need for the parantheses.  And since the values are clumped together, maybe
use a switch statement to let the compiler optimize the checks (though I'm
guessing modern compilers will optimize either way).

E.g.

static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
{
	switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
	case MT_NORMAL_NC:
	case MT_DEVICE_nGnRnE:
	case MT_DEVICE_nGnRE:
		return false;
	default:
		return true;
	}
}


>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1612,6 +1624,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>  
> +	if ((vma->vm_flags & VM_PFNMAP) &&
> +	    !mapping_type_noncacheable(vma->vm_page_prot))

I don't think this is correct, and there's a very real chance this will break
existing setups.  PFNMAP memory isn't strictly device memory, and IIUC, KVM
force DEVICE/NORMAL_NC based on kvm_is_device_pfn(), not based on VM_PFNMAP.

	if (kvm_is_device_pfn(pfn)) {
		/*
		 * If the page was identified as device early by looking at
		 * the VMA flags, vma_pagesize is already representing the
		 * largest quantity we can map.  If instead it was mapped
		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
		 * and must not be upgraded.
		 *
		 * In both cases, we don't let transparent_hugepage_adjust()
		 * change things at the last minute.
		 */
		device = true;
	}

	if (device) {
		if (vfio_allow_any_uc)
			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
		else
			prot |= KVM_PGTABLE_PROT_DEVICE;
	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
		   (!nested || kvm_s2_trans_executable(nested))) {
		prot |= KVM_PGTABLE_PROT_X;
	}

which gets morphed into the hardware memtype attributes as:

	switch (prot & (KVM_PGTABLE_PROT_DEVICE |
			KVM_PGTABLE_PROT_NORMAL_NC)) {
	case KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC:
		return -EINVAL;
	case KVM_PGTABLE_PROT_DEVICE:
		if (prot & KVM_PGTABLE_PROT_X)
			return -EINVAL;
		attr = KVM_S2_MEMATTR(pgt, DEVICE_nGnRE);
		break;
	case KVM_PGTABLE_PROT_NORMAL_NC:
		if (prot & KVM_PGTABLE_PROT_X)
			return -EINVAL;
		attr = KVM_S2_MEMATTR(pgt, NORMAL_NC);
		break;
	default:
		attr = KVM_S2_MEMATTR(pgt, NORMAL);
	}

E.g. if the admin hides RAM from the kernel and manages it in userspace via
/dev/mem, this will break (I think).

So I believe what you want is something like this:

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index eeda92330ade..4129ab5ac871 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1466,6 +1466,18 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
        return vma->vm_flags & VM_MTE_ALLOWED;
 }
 
+static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
+{
+       switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
+       case MT_NORMAL_NC:
+       case MT_DEVICE_nGnRnE:
+       case MT_DEVICE_nGnRE:
+               return false;
+       default:
+               return true;
+       }
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
                          struct kvm_s2_trans *nested,
                          struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1473,7 +1485,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 {
        int ret = 0;
        bool write_fault, writable, force_pte = false;
-       bool exec_fault, mte_allowed;
+       bool exec_fault, mte_allowed, is_vma_cacheable;
        bool device = false, vfio_allow_any_uc = false;
        unsigned long mmu_seq;
        phys_addr_t ipa = fault_ipa;
@@ -1615,6 +1627,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
        vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
 
+       is_vma_cacheable = kvm_vma_is_cacheable(vma);
+
        /* Don't use the VMA after the unlock -- it may have vanished */
        vma = NULL;
 
@@ -1639,6 +1653,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
                return -EFAULT;
 
        if (kvm_is_device_pfn(pfn)) {
+               if (is_vma_cacheable)
+                       return -EINVAL;
+
                /*
                 * If the page was identified as device early by looking at
                 * the VMA flags, vma_pagesize is already representing the
@@ -1722,6 +1739,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
                prot |= KVM_PGTABLE_PROT_X;
 
        if (device) {
+               if (is_vma_cacheable) {
+                       ret = -EINVAL;
+                       goto out;
+               }
+
                if (vfio_allow_any_uc)
                        prot |= KVM_PGTABLE_PROT_NORMAL_NC;
                else

