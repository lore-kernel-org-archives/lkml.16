Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001DB24BC06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690263; cv=none; b=RlHGmZBCrWgDU0Jq+H37nq34vkrCEZwAG+OQMioKoeMotKrHGf2ikwO0BPfmYlErmUx/mdHbPupiVIx8GZ2aVmHK2coxo1aWR9VqDk9cT3B7+eRW1Wp4ojopgXEt9IUWN+eRHyCRzMY57vExUFdLgVH05xDgEmLarD6oASWuaEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690263; c=relaxed/simple;
	bh=EkUq54YbtHaSFlkcgNeh41msuRCSH1wM/iY0EssPtSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxOm7X7wqeBQlkzJPdrZRS0aWkCQmXF76S+OKxJNvfchLxR9ArRsCURdQGNGe9QPEdSfCJ0VTzwg2neJDstQVRLY70Q5iz9GngmH5BRTZ/bAfi15xM840Zc1ivZCngh7NkVpwCmhnPmJkwM4FLgEB5hK0zJ4jy6YTCUpPS4S36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7J7/QJP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7J7/QJP"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso1304401a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743690260; x=1744295060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDpmek/X0kwpQJH4VvCCmLBAuzVkaDGKXNEK4ox1gYY=;
        b=o7J7/QJPUEjsItfSayuf5PQMSpoAf2Z/ywHOC7wn1Ot1rERC5EwpKu2nV+a/9TzZzT
         H0ltBVcVD1HHVaRIyplk7vLDs9Tssc0PgeksUlW0HQxAOE/iMrgnxYRMe+NKjxKiGuoW
         +CU+hCqx6IWW8IeJlPpjpi6X5Ibw3JPtI9Vo2pp7ReL6rlGlLYQPB9owduBalu5URd97
         4GLIbZ78PeHSKHh+UDvK11SpjA8nH5Pf+EdLHbHiZW1mQGZMyGWw5qdNxXL2YMgCKIIJ
         h1FlD9kGgWCCZf5PEhbUBm7gBk5/dnruJA4Yz7k3GVYY4M6FjcgGsLbpt2+bVfx8nxXN
         g39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743690260; x=1744295060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDpmek/X0kwpQJH4VvCCmLBAuzVkaDGKXNEK4ox1gYY=;
        b=oibQkdubYLygcTHDsjhApgjF2JM7KzMKWYhKyMMWkqLiNmiFy1H7ECW6k+4ItzV88I
         C8XT/59s6SixFwReG+RGBfsfYivy946TUV+t6/ZGStHfFR5oHNbVzSJRdVzYoJyDnknS
         KLhU40dSvZhIyZtUgLc0prq4VU4yc9tn5Gy1Gr4hwWZK/U+zG+Xa6NUyz+ZDVeKSX5w0
         rFJ36m1Hh5x92rEHmENyqZvKfrH2qjoLx++Sm3/r9bbWy+8bCJ1OkwkUORO4uScj/FWT
         kZik/KGy1N7macERtftaz/HuqV9e2ogrQJmcgmeLt9XSC1aasGtmwTmFMfRohtIe+Miu
         JDkw==
X-Forwarded-Encrypted: i=1; AJvYcCWE4sw7uAiwL3qHJwbNcT5tzysPM45V9QlYdyE0WnmgBWtXysr4TSvmXlOZw9EZuFbwof06vRUdZlvzQgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPaV4ci02f/aQCtQ8Sfa5TSloYDTr4Dyy6OE5pkLpLlbHK+Ao
	5DXb2XgHdlgmE7PdjFKAEAEAwmkgX1MnQIJPrLPJTWyTBgKYlaVhZGuEwR024g==
X-Gm-Gg: ASbGncvAqJ1y3/XeOymXeKAeuJc0pYwk8jhExmefMHnda2aAyy3+bT/g79JPL2gXKRe
	2mOITXDNQe5OFzb8eiVmsNS1/4h0GTG+szzsTKWLPbzLeR+G1i5U03oAvPqmajWE5HrtNOeo2Es
	qo/F8i3p+OpVj65QanT5Y9YrNSp0D1TFg5g2g3pSwSjr+IaiALk9muDHPh2gz7Gvz+wdroBgch3
	kDGgyAYr0/4ElFHmcoblsqlhiuoklrwqqCU3VuxeWMvbZiqvOfXXaDBRL9urbkG/X8TTUXZ2EfB
	GcLuoKQak/IidUcueZ5oF+GDWtoIwK6SjVTmEZPey0SytcNpZNRkhLBm1OaUatS3N4we4aOCPKZ
	yCvDuxcj9o7ZV5VpI
X-Google-Smtp-Source: AGHT+IGyNvHXBQg4ozO8/+QSZISlP/oFpgDXV5BJWgExW3afo1HCSCPDBCsyR32+joySAgPe8H3f4Q==
X-Received: by 2002:a05:6402:3204:b0:5f0:82cd:500b with SMTP id 4fb4d7f45d1cf-5f082cd5216mr3828226a12.19.1743690260100;
        Thu, 03 Apr 2025 07:24:20 -0700 (PDT)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880850f2sm1005128a12.59.2025.04.03.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:24:19 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:24:16 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
Message-ID: <Z-6aEOQlbfh_q2Mz@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110038.3733649-2-vdonnefort@google.com>

On Thursday 06 Mar 2025 at 11:00:30 (+0000), Vincent Donnefort wrote:
> clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
> size as an argument. But they also rely on fixmap, which can only map a
> single PAGE_SIZE page.
> 
> With the upcoming stage-2 huge mappings for pKVM np-guests, those
> callbacks will get size > PAGE_SIZE. Loop the CMOs on PAGE_SIZE basis
> until the whole range is done.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 19c3c631708c..63968c7740c3 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -219,14 +219,30 @@ static void guest_s2_put_page(void *addr)
>  
>  static void clean_dcache_guest_page(void *va, size_t size)
>  {
> -	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> -	hyp_fixmap_unmap();
> +	if (WARN_ON(!PAGE_ALIGNED(size)))
> +		return;

Nit: it doesn't really matter since WARN_ON() is fatal, but that return
looks a bit weird -- we really shouldn't return without actually do the
CMOs. So maybe just WARN_ON() and not bailing out would be clearer.

Either way the patch works, so:

Reviewed-by: Quentin Perret <qperret@google.com>


> +
> +	while (size) {
> +		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> +					  PAGE_SIZE);
> +		hyp_fixmap_unmap();
> +		va += PAGE_SIZE;
> +		size -= PAGE_SIZE;
> +	}
>  }
>  
>  static void invalidate_icache_guest_page(void *va, size_t size)
>  {
> -	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> -	hyp_fixmap_unmap();
> +	if (WARN_ON(!PAGE_ALIGNED(size)))
> +		return;
> +
> +	while (size) {
> +		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> +					       PAGE_SIZE);
> +		hyp_fixmap_unmap();
> +		va += PAGE_SIZE;
> +		size -= PAGE_SIZE;
> +	}
>  }
>  
>  int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
> -- 
> 2.48.1.711.g2feabab25a-goog
> 
