Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A5520468D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818837; cv=none; b=Ouxzou3seodSrJAYiW0Wb6tljixNzy2mjOFAOyxiXRbetPXmH13rL7y2PlTWgbWzRIOOLRPm+8pofscNeWMxkUkWixbHMzMU8bWlWjkTVta8ZkMppUCdTV9ctn+O6ZeJDVCKHxAraDb75J9aBjIjOSekNvllz0Mhdw1/iDaPZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818837; c=relaxed/simple;
	bh=glmNT1BbAi86Vu1viujSYC8MN3OzvhCYDxVNgCwDMOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPVIXjVJ5sxAXrC01ld0nmeL1geY1GH5TsZHztTeAUFXPkCdua+V7sFgDUXCncifX8iYrmAldo46FKlb+b1VTBFyZh6XEJc/MGc3VnA0+ec1C6wzw01FqIERSmSOFaUDRsUKnR8uhBhNwfkrpsHPAhcwHddzY/7CDOrpzqpK9R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RKRGmnQa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RKRGmnQa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2242ac37caeso183395ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744818835; x=1745423635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eI0hqFIi9hhMaOETvsAWB98XuGpw5hSchlp+ya2NdF0=;
        b=RKRGmnQaXJMTpKq0QMRHhbODtmoXhhnpP/AQrCgUeDHWZWa+DL6x1N+6aXUZHuHGFc
         iE6dl/wV2WAHJ8C5GcealehDDy1hmuNfVYS28bcvLcz/L+4WdNAowVInG346f1i0V+qD
         FhdRpzDrsByA5bqg2b5/dxfFMMfFttoz6HiCgQG+vqnhibgqMV+6IIFw1zAwmwKF6WmN
         fGy6YB48dXMa+lEwDRXBDCjzxMPxuXuks2e2Q4HWPQLSXJIBfgWqN6MxLFab70NJfWJa
         iF1C2695OUAW1WIZJPUlhzGuqSJhurn+cYw2H6437J4uCdKNe6//2opR1HcMz9aoXd0Y
         EfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818835; x=1745423635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eI0hqFIi9hhMaOETvsAWB98XuGpw5hSchlp+ya2NdF0=;
        b=QRtA4weIDUADjaaDxea4jyOY4D4NIGihkPeIg2sn3Pgy0XR99uL+rWzbDLC44vUn9s
         At/mSu9WflnxgjzCeU5LnN3L4qlR1fJ5WVVxPzX5tpfEuRQF7pJVYNUqCzFZb0FhZh/v
         bBnyjACleXXFLz2e4a7MQaDae/IuRcVQD2YY7N13gUUHsMlml9W9JDY6lQ8W0Tf81fos
         TYlOfYyef+RVfgD3qc7StcyfN0CF2pYHmnPYb7I/JS7IFBPIa9fovonRBFpFPsPCAGMP
         AHdwCHtf2pme7DNCRCRKLz5K/pjS6wbTrotZBh3QpjxbWOA+Q8zrNPN3+YqoY2O+3Mg2
         iZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZn51rNKze8GGSmPoqnJ8dRlyZNhGayr3JANzbDjFgtxTqd05w8vcphfbgqrqYmYzMbPpbvLI26EKHrD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwpWh+PGIY7K22LLiLC1+RFOpCNoMpJHKGoxFVjg8deefUz2uL
	o56MM/KTq82cXV+31erTwV7HnueJGD9PmEFtveUtsElPWzA063UfVduwoRzSmBq95vUFeXj3kYU
	YeA==
X-Gm-Gg: ASbGncs0nl13COf/2HzQki/kF+DtBtQaP7CPhVuW2cAw3pxnLCcnxzbcgWnxt/sscY0
	9EJCPrdPuPhJH9tyLuuzj++DzYEIv9ytdl3yQQJYwQlpyETzzuI1Pv+1os7V+EAUVi4NI341p+o
	J6WoXrCvir9+wteBMfmOBn/nT1plD8cNDDI8Y1xb7M+TIFJwmUqvZ1EqQ4KB0yyrC/fJErPFZSY
	R2L1DyePq2+prXodb4ZWkGyHWO9Yb3kbmPTTf1YHEMw+0f9Hjlb3IA7Xu/25HX6hcYYKQYd6gPS
	YW4k4yvgdPTh2ovmUhFetvQ64z8B0STnSlL+iBInwcqOW2idlnfIC8AN8ivxcXAOMrgWlqraVqk
	VHg==
X-Google-Smtp-Source: AGHT+IGW7bV/dNSGL8pCQfslTd7/5svY9xc/915CTEb9/xFu4LQPdMWsZ8vx5QfVS5f4fDQb1/N6kw==
X-Received: by 2002:a17:903:1aa6:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-22c353bac4cmr2148905ad.0.1744818835300;
        Wed, 16 Apr 2025 08:53:55 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa7638sm15905665ad.142.2025.04.16.08.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:53:54 -0700 (PDT)
Date: Wed, 16 Apr 2025 08:53:49 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] KVM: x86/mmu: Dynamically allocate shadow MMU's
 hashed page list
Message-ID: <20250416155349.GA701848.vipinsh@google.com>
References: <20250401155714.838398-1-seanjc@google.com>
 <20250401155714.838398-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401155714.838398-2-seanjc@google.com>

On 2025-04-01 08:57:12, Sean Christopherson wrote:
> Dynamically allocate the (massive) array of hashed lists used to track
> shadow pages, as the array itself is 32KiB, i.e. is an order-3 allocation
> all on its own, and is *exactly* an order-3 allocation.  Dynamically
> allocating the array will allow allocating "struct kvm" using regular
> kmalloc(), and will also allow deferring allocation of the array until
> it's actually needed, i.e. until the first shadow root is allocated.
> 
> Cc: Vipin Sharma <vipinsh@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  4 ++--
>  arch/x86/kvm/mmu/mmu.c          | 23 ++++++++++++++++++++++-
>  arch/x86/kvm/x86.c              |  5 ++++-
>  3 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index a884ab544335..e523d7d8a107 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1333,7 +1333,7 @@ struct kvm_arch {
>  	bool has_private_mem;
>  	bool has_protected_state;
>  	bool pre_fault_allowed;
> -	struct hlist_head mmu_page_hash[KVM_NUM_MMU_PAGES];
> +	struct hlist_head *mmu_page_hash;
>  	struct list_head active_mmu_pages;
>  	/*
>  	 * A list of kvm_mmu_page structs that, if zapped, could possibly be
> @@ -1985,7 +1985,7 @@ void kvm_mmu_vendor_module_exit(void);
>  
>  void kvm_mmu_destroy(struct kvm_vcpu *vcpu);
>  int kvm_mmu_create(struct kvm_vcpu *vcpu);
> -void kvm_mmu_init_vm(struct kvm *kvm);
> +int kvm_mmu_init_vm(struct kvm *kvm);
>  void kvm_mmu_uninit_vm(struct kvm *kvm);
>  
>  void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 63bb77ee1bb1..6b9c72405860 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3880,6 +3880,18 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
>  	return r;
>  }
>  
> +static int kvm_mmu_alloc_page_hash(struct kvm *kvm)
> +{
> +	typeof(kvm->arch.mmu_page_hash) h;
> +
> +	h = kcalloc(KVM_NUM_MMU_PAGES, sizeof(*h), GFP_KERNEL_ACCOUNT);
> +	if (!h)
> +		return -ENOMEM;
> +
> +	kvm->arch.mmu_page_hash = h;
> +	return 0;
> +}
> +
>  static int mmu_first_shadow_root_alloc(struct kvm *kvm)
>  {
>  	struct kvm_memslots *slots;
> @@ -6673,13 +6685,19 @@ static void kvm_mmu_zap_all_fast(struct kvm *kvm)
>  		kvm_tdp_mmu_zap_invalidated_roots(kvm, true);
>  }
>  
> -void kvm_mmu_init_vm(struct kvm *kvm)
> +int kvm_mmu_init_vm(struct kvm *kvm)
>  {
> +	int r;
> +
>  	kvm->arch.shadow_mmio_value = shadow_mmio_value;
>  	INIT_LIST_HEAD(&kvm->arch.active_mmu_pages);
>  	INIT_LIST_HEAD(&kvm->arch.possible_nx_huge_pages);
>  	spin_lock_init(&kvm->arch.mmu_unsync_pages_lock);
>  
> +	r = kvm_mmu_alloc_page_hash(kvm);
> +	if (r)
> +		return r;
> +
>  	if (tdp_mmu_enabled)
>  		kvm_mmu_init_tdp_mmu(kvm);
>  
> @@ -6690,6 +6708,7 @@ void kvm_mmu_init_vm(struct kvm *kvm)
>  
>  	kvm->arch.split_desc_cache.kmem_cache = pte_list_desc_cache;
>  	kvm->arch.split_desc_cache.gfp_zero = __GFP_ZERO;
> +	return 0;
>  }
>  
>  static void mmu_free_vm_memory_caches(struct kvm *kvm)
> @@ -6701,6 +6720,8 @@ static void mmu_free_vm_memory_caches(struct kvm *kvm)
>  
>  void kvm_mmu_uninit_vm(struct kvm *kvm)
>  {
> +	kfree(kvm->arch.mmu_page_hash);
> +
>  	if (tdp_mmu_enabled)
>  		kvm_mmu_uninit_tdp_mmu(kvm);
>  
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index c841817a914a..4070f9d34521 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12721,7 +12721,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  	if (ret)
>  		goto out;
>  
> -	kvm_mmu_init_vm(kvm);
> +	ret = kvm_mmu_init_vm(kvm);
> +	if (ret)
> +		goto out_cleanup_page_track;
>  
>  	ret = kvm_x86_call(vm_init)(kvm);
>  	if (ret)
> @@ -12774,6 +12776,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  
>  out_uninit_mmu:
>  	kvm_mmu_uninit_vm(kvm);
> +out_cleanup_page_track:
>  	kvm_page_track_cleanup(kvm);
>  out:
>  	return ret;
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

Reviewed-by: Vipin Sharma <vipinsh@google.com>

