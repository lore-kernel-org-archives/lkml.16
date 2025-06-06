Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2618FDDB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749233682; cv=none; b=ckdRbf+Czbyv7Hkz94ZM4WL1zIwX2WSyON/YB3rlvx9/hNSXGa4CvK+5FRdA6AucugKIGtYP0yXacRi1IDIx10sVFpvD4EGXdoY4U8xks/LBwdUu29yLkvOnxD2fl7BydYgSlZC9DpDasOoHKbJ+wW/on6/rZvllseHg/lfl+BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749233682; c=relaxed/simple;
	bh=SjCd0Jkf33wyDVxQcPBEloOzNKGeAdLm4+GeA0r1Bac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dQ9u4E+sOJemq8a8FTJTyO6KBka8eDEw6G8KoJypbD9hE3JuPjF3psAr8g+8OS+geUg2qH+lhR6RceLB8EZw42EDiOlDB6fVygdLRX6cjj1VDQLAtGAlz2K0uqSjxmJzlTi6MSB7e5KyypVvG/IdFJUJYLU7RlhTGj70OamMEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I+LNF1Nv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I+LNF1Nv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-312c33585c2so2276490a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749233680; x=1749838480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAUhjYxThgXkitpnjxyy0unZevW/6JACvYls6YdZBNI=;
        b=I+LNF1Nvb3PnasRB2n8661wJL1MV+M4IDN/ASYTDOOGTkRidnxsFjlHYboZYJx93Pv
         cDnv4vQHk6177SWlcqiYyQZ6oSJfO6hFjAige8/sZs4qoF3M6q5FxAPJpRlKiBIFPCLM
         v3sXN5bU1PMHgcOjEC5CNAbB8+6Bw89Ail0Jlb5o/Nhsiuj+K+KD1RC6tt2nxMqNSv+4
         5NWX3TDzOlBT6Yl3DEG/Hg0rW7SdChOBWaDRG6Od1He8MEDKX9hDiYxW9TmhjnmpqslC
         YKWX1hu/E6zQdZn7JOdlcMU3K6dHyL2YDEutg3wVQ8GtcFC8yKHn6DypwjgqdoY46duR
         7s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749233680; x=1749838480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAUhjYxThgXkitpnjxyy0unZevW/6JACvYls6YdZBNI=;
        b=Xf3g6sPxFsdxFn5C5lE1Ieeg0w5iEXP9mzleF2Ak8ZMhKilM5Kbw4KIfutxP6DNc/P
         w5RfdhVzehQjYpA9zlLxast2bq9b4WO8Xh6keDGcK4VYHsTceIgV7vXAJZaSntlu8UGb
         pe6Tg3fyei5PxttKYBGVPd1l1KKD6zkTvFTd3yTK6cOvjQq/peDmc9VNoEeZyuQtH37m
         A0DtUxdyR0mCphD14mSB6rhtP2VD+MqG98aXFV6MNOM0WeQEz+JyaIftz710OIjNsrML
         YolLSCn0n5xCkMSs8meb4iT3JUX6fWzerJMDXxKoejRHPgN+TMsf2TzYU+zs6P88wYs+
         879Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8lmRhhK3jhXdC8dF+TL3SwZn2xDjT+k2MQ8aO5uLBJmI7EgYGoFvBIbkXelEgXL2KZksxogEdaMKpckI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrhSHsqK6x3LgN7aSdTU6AJ0DQITU5rHtgUSWgxOUMkus5/41E
	dZIZeKMeLCmxeAMIik5pIcxs/tt5wPX2o5xOjMSLt+c8RrWg2/clqESBIkH2VK1KRQHXHVHmIJu
	+03JLKg==
X-Google-Smtp-Source: AGHT+IEVafAx0DEdokAbHZYNqcfLZrJvGcnddWO2nYwmoBUbnL46jnQNAcO/DBxC/1OVXbJIbbas3Y6XETw=
X-Received: from pjbpq14.prod.google.com ([2002:a17:90b:3d8e:b0:311:d79d:e432])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c5:b0:30e:9349:2da2
 with SMTP id 98e67ed59e1d1-313472d24e5mr6030735a91.4.1749233680403; Fri, 06
 Jun 2025 11:14:40 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:14:38 -0700
In-Reply-To: <20250524013943.2832-5-ankita@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250524013943.2832-1-ankita@nvidia.com> <20250524013943.2832-5-ankita@nvidia.com>
Message-ID: <aEMwDqxsDgfXcLKw@google.com>
Subject: Re: [PATCH v6 4/5] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
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
> @@ -1636,9 +1637,19 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>  
> -	if ((vma->vm_flags & VM_PFNMAP) &&
> -	    !mapping_type_noncacheable(vma->vm_page_prot))
> -		return -EINVAL;
> +	if (vma->vm_flags & VM_PFNMAP) {
> +		/* Reject COW VM_PFNMAP */
> +		if (is_cow_mapping(vma->vm_flags))
> +			return -EINVAL;
> +
> +		/*
> +		 * If the VM_PFNMAP is set in VMA flags, do a KVM sanity
> +		 * check to see if pgprot mapping type is MT_NORMAL and a
> +		 * safely cacheable device memory.
> +		 */
> +		if (!mapping_type_noncacheable(vma->vm_page_prot))
> +			cacheable_devmem = true;
> +	}
>  
>  	/* Don't use the VMA after the unlock -- it may have vanished */
>  	vma = NULL;
> @@ -1671,10 +1682,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
>  		 * and must not be upgraded.
>  		 *
> -		 * In both cases, we don't let transparent_hugepage_adjust()
> +		 * Do not set device as the device memory is cacheable. Note
> +		 * that such mapping is safe as the KVM S2 will have the same
> +		 * Normal memory type as the VMA has in the S1.
>  		 * change things at the last minute.
>  		 */
> -		device = true;
> +		if (!cacheable_devmem)
> +			device = true;

I doubt this is correct.  "device" is used for more than just the memtype.  E.g.
hugepage adjustments, MTE, etc. all consult "device".  I.e. don't conflate device
with VM_PFNMAP.
