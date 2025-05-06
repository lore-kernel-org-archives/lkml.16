Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478972673BF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527804; cv=none; b=JtsiDKDkgCJCOa4bJZCTDrwAUidV3xyZQdSmr4BPbBFMoli5moqthS6C3GYztKRwwIj67hJn9b1tMw14sUKTsCfg5tDE4bsedx7jPTCR+Z1DIfCYi4Pll9tGoR/8rBr8Vlfo6BDge7B7BdTfFOA9A06Vxzryz3jN7FCHQtGgE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527804; c=relaxed/simple;
	bh=doINJDVKHGcrz+5RKbuuacCK4OinbdLgMhBEmYZ+Kz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyQY9ljxXg6k+fNVFjeCmPbB8gXAUIBj3tCbJk4pftSKhln7D2wy6HKVw5E75FhdzFzxrIC9t5abBteQ+rZ76ekfUrw2J/ql2HCkeHTDYvGHJon8ITWq+He3Z5jzTIxf/YVIqjZO0AUrtNpde0JJQnKrV5dBrLILerMjQ4N0Pyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gl6+qqiC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gl6+qqiC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso189576f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746527800; x=1747132600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83BB7SmwDzPYUhpIg9noheded8S+cXeSPX7ePATlnPI=;
        b=Gl6+qqiCQ8sSVDoDchhf/C/z0q6sF10y5cB7qU0qGL0f3N0PJvrrdj3bQi/K8HxcSO
         Sgo0rsEpuUp73gn+aL1ln1dnOM/DuBVykHCgkQa2WapcFinXzP/DUTVWMUbrYSdTtNwe
         WlrMb/Fms+nz2Rl5rnbs0DESp/DZIfZNe0Zw95sE5Eza3PxWIplcHGQmnGterKO4HkVo
         1o67/IUGsKPz9ODjNv+pBYxbUTWytIsDTGK5Z3hmK4cn6KixbBeaya8RINemugqWfyHT
         b3KLXtU042S+QEvSbXGTIjuPao19CbGQOEzBwTYljDzgzDjm0usxLlQiKNOfdH6ngiQf
         Mb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527800; x=1747132600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83BB7SmwDzPYUhpIg9noheded8S+cXeSPX7ePATlnPI=;
        b=gRNPE0k7OkLbN0eeQmt4v7+EFU1y0Wbh42fLbPxZCUxEiM0WYSd49ssDBxg5MTHHA/
         vFoN4epBnq8aHJCYsdNsdQCcqr2ruQfBXgCcl+G9AcMb/LCswXV89mtynhqVPLnE6qW3
         MbQ23dCzMlIUIaABHrhboVoVXPQ56+ZnkznzmxUAhf8a9DEK4QnwO6lK879Fy6aaArFJ
         2ROGKTbaA/qRER8Y456umJ+K5ZCRsWE9suN/+SbuKrNZmwQFXAbdXcblfwE4vxSgyNcQ
         Mm4tXxydIN9O3HrwNF8BM/mqPdLmWz6sG9KcTF97RLVshPGgUHGIq7+zpZb3NC6VEDUI
         8tcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUCAbZG6WIJdY3ID0X6Xb6/Hu6pxUJh0uv9eAw/a3u42xaRAWveN628fhlrsf67NulL84NbO2CVHLy+Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1Yell4KYnLCu67IJBhYPFbPAzhce0lz/6/bHVv4mlJoPOAUT
	pH6r/L2mmJbsaKHOY4dK1/NOlbcDwlENSqfRMBch1SJC1TX7wUaAnY5Qtjd0ow==
X-Gm-Gg: ASbGncsKl42zNSfAv6cl2EibloLz0wBJD7hABCAs1HarMt1+Bh3ITgLdaNB6lBaxcNb
	EwhcI3mHNgn3+YI3wahG9TyY4m3PzusMEtPKwHlp7s0Jhl9UE+hiO4gLH+GqLvhSIrXyuGaW8nr
	QESGQVnoFkmELRG054BBEsvghHPivJVO6Iu0yBC0WCc3MOQ/hMR5gotzPNNN5yrxO3OpPgB8AwD
	k9fd7+Ohes36Dpkzi0naxFYmo6ze5V4aLL7EUmMDPTKXT88/6LupS9IeZMKrO8VfI5XzQ/D5d9M
	HvLtGvEdUertH67Cx1FCmZwiaACI9V7M0bTXRDwvQ+92julk0tFjcp2JdbbZd8rZ/V11nZDQcle
	KjSJyAQ==
X-Google-Smtp-Source: AGHT+IG2CayH2yxmNUdwN95+efpUFPMFHxnxBFQj2axpQ8sGyin+5/PNn5XBefvcRCOTd+k50QaHVw==
X-Received: by 2002:a5d:5f8a:0:b0:3a0:7a7c:2648 with SMTP id ffacd0b85a97d-3a0ac0eaa24mr2087956f8f.27.1746527800468;
        Tue, 06 May 2025 03:36:40 -0700 (PDT)
Received: from google.com (24.204.140.34.bc.googleusercontent.com. [34.140.204.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b0dffaa1sm1179414f8f.31.2025.05.06.03.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:36:40 -0700 (PDT)
Date: Tue, 6 May 2025 11:36:35 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ott <sebott@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix uninitialized memcache pointer in
 user_mem_abort()
Message-ID: <aBnmM7DSonZr_VHC@google.com>
References: <20250505173148.33900-1-sebott@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505173148.33900-1-sebott@redhat.com>

On Mon, May 05, 2025 at 07:31:48PM +0200, Sebastian Ott wrote:
> Commit fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM") made the
> initialization of the local memcache variable in user_mem_abort()
> conditional, leaving a codepath where it is used uninitialized via
> kvm_pgtable_stage2_map().
> 
> This can fail on any path that requires a stage-2 allocation
> without transition via a permission fault or dirty logging.
> 
> Fix this by making sure that memcache is always valid.
> 
> Fixes: fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM")
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/kvmarm/3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com/
> ---
>  arch/arm64/kvm/mmu.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 754f2fe0cc67..eeda92330ade 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1501,6 +1501,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		return -EFAULT;
>  	}
>  
> +	if (!is_protected_kvm_enabled())
> +		memcache = &vcpu->arch.mmu_page_cache;
> +	else
> +		memcache = &vcpu->arch.pkvm_memcache;
> +
>  	/*
>  	 * Permission faults just need to update the existing leaf entry,
>  	 * and so normally don't require allocations from the memcache. The
> @@ -1510,13 +1515,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (!fault_is_perm || (logging_active && write_fault)) {
>  		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
>  
> -		if (!is_protected_kvm_enabled()) {
> -			memcache = &vcpu->arch.mmu_page_cache;
> +		if (!is_protected_kvm_enabled())
>  			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
> -		} else {
> -			memcache = &vcpu->arch.pkvm_memcache;
> +		else
>  			ret = topup_hyp_memcache(memcache, min_pages);
> -		}
> +
>  		if (ret)
>  			return ret;
>  	}
> 
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> -- 
> 2.49.0
> 
> 

For the pKVM part 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Thanks
