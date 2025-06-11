Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF826AAAA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641345; cv=none; b=r1t4zNohE7H1IOcI2fnBHjS+5qScR/BCuTMRWRYpc8Xb8R9nq6KYzhRkSGMcJ39TQTTZGCC7uv5gAKkiVrTthA03A6rsjyJO4sMmNj/MTU0xOcrJFJ4F9yEGWtKNd/9e0vjyqTEt2WUln3+Ar/d3LvQ7LnA36Kg1hhdSCLKA18o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641345; c=relaxed/simple;
	bh=1JqugHdq4Phks00PXJ0yxUsUoqF+17XSnAexnueU1vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8ku8QOrIuj3wiT70P2yzbBNs/7Y6HOSXKSRTgyw4bRu9f4R/z6cQ/5mfPdNnuOQZb38TfA9lbrpfLKHbe1QMW+WuFhOlmgZ6dDFlSRb6T7z8Kjp1+swvfL4XlNl4gbwrbEa5VrGD8PKSeBbIy6o4d7Pjfg22s4KjTJ77SNpvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EAkVc/gy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EAkVc/gy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f71831abso6050290f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749641342; x=1750246142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5eBwBbTQUmE/jg9qxOQzcw7gsljfjr3T8EkpVA+lR8=;
        b=EAkVc/gy8iN+P3mKkRQwpT9Cn1+kDc1FbLb8ZCblYb5glJRLclg/hfyYmWyrNEVRJo
         RDUsCaTOWI+7IXpDB29p0IM5HK7f9wNkA1Lr/N5PkLQOyTdiIAmAAsBE049dUm8PxKCh
         kPJWrJU8UgS3J346xmA2o11VwG2seV8mA27vC77iNBKWzJnaugFRvnvXOwYahkkxkt05
         i7YlY/vIlhzNDbB/nnd2HrhBlrWjeYclamjBh5r/mWFM0ldV94jr8OMrEKDyMBTWQ06x
         CMg1bRvfUUfxEokBXJN1qqmcwc6JPl0RfSMddCMtJ1lE85OpinO8Qy+q3AQ3knyqY5j2
         /Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641342; x=1750246142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5eBwBbTQUmE/jg9qxOQzcw7gsljfjr3T8EkpVA+lR8=;
        b=NLznxMz4Mv1xDQvhnm9Ma7P2NnXzHfbJJUN9N9vEjmBNqaaXRXHIcac6Ur/jZv1uQr
         2HuHyw73Oz/BsBCoOBGntMaEP7kc2t265Zt40fNlb8P77cFb/q43ut01BqFesig5XxPa
         5PuHC0mzoBn1QWREWqj1LXMxPviAqoK0em/6oJirrDRy4kCR7pWv9hvjWlnGRK0JoTux
         nUiCiY/6/LnSk+E58zYZ+WcVr8gqJdE4y0vJyQZSa/ighLAjfq9HIPxBdCsu8QOU+E6K
         iuK/q/dbWhcQgVMWg1z6Ukd7QC/rq1zqrulRhXeGPDG1e3RTyUSuje1eodmy0tIYQpnk
         2SHA==
X-Forwarded-Encrypted: i=1; AJvYcCXxIiAZPm22luR8w4yRAJf8i5EKAggB2QGgiuG8gRNOIpwbuRW8KfjNd96dpP1hRBHwYkGn5GxdJdeFBSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqAGPRu3123uQ/BJRsMSiBNJaXKfbjWY1NcNa0edoc24m4+Uz
	V/tvJD56SKccOMe4z5yzAPJkbdylNT6yC/dgyOVV057W8WqPMpqFUO38X2kTUf13Zjg=
X-Gm-Gg: ASbGncujLhTifNV51fdxALGmyAHY3fXx3iqTZ8ACzsi9fmVIie53nP2vXCAjlW19xg7
	0SPN3pygXhh3RW+mi3J0jRmcv3L9K51acgPHGZD2GJ5erq4+aiVJKjAN7c6GNQCWm7q3y6XaGcV
	pkcSh+hFHoY/IFK+VwYhB4mJpWoRz9LgiS5OjiF1NH1QYa1YTUQmHQJTZwAapOirv3vJ6Z2Wv1M
	oDV7dO2DnhqDXPzsyQv5sHlCy2ogfGhUUJpE+3dsTgYQq2L/jVfb9CF4SPcgwbADBipT9GfJRR+
	+QgzxaSF9brD2dJ9hQiwnpBAXY/fR7hRJq7R9PZt6wzwxHWuiA==
X-Google-Smtp-Source: AGHT+IGR2AIUE7a4nEZNX6K/UcpKOCr7ODBk7la16aB9kHn6bvTqIQ8QJX5Tm6kGkYsyX0BXvJw49w==
X-Received: by 2002:a5d:64e2:0:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3a558af780fmr2434572f8f.53.1749641342318;
        Wed, 11 Jun 2025 04:29:02 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323c08fasm14761939f8f.44.2025.06.11.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:29:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:29:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in
 kvm_riscv_gstage_map()
Message-ID: <20250611-352bef23df9a4ec55fe5cb68@orel>
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>

On Wed, Jun 11, 2025 at 05:51:40PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The caller has already passed in the memslot, and there are
> two instances `{kvm_faultin_pfn/mark_page_dirty}` of retrieving
> the memslot again in `kvm_riscv_gstage_map`, we can replace them
> with `{__kvm_faultin_pfn/mark_page_dirty_in_slot}`.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/mmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1087ea74567b..f9059dac3ba3 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -648,7 +648,8 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
> +	hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
> +				&writable, &page);

I think introducing another function with the following diff would be
better than duplicating the is_write to foll translation.

Thanks,
drew

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..6c80ad5c7e89 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1288,12 +1288,20 @@ kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
                            unsigned int foll, bool *writable,
                            struct page **refcounted_page);

+static inline kvm_pfn_t kvm_faultin_pfn_in_slot(const struct kvm_memory_slot *slot,
+                                               gfn_t gfn,
+                                               unsigned int foll, bool *writable,
+                                               struct page **refcounted_page)
+{
+       return __kvm_faultin_pfn(slot, gfn, write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
+
 static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
                                        bool write, bool *writable,
                                        struct page **refcounted_page)
 {
-       return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
-                                write ? FOLL_WRITE : 0, writable, refcounted_page);
+       return kvm_faultin_pfn_in_slot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+                                      write, writable, refcounted_page);
 }

>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>  				vma_pageshift, current);
> @@ -670,7 +671,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		goto out_unlock;
>  
>  	if (writable) {
> -		mark_page_dirty(kvm, gfn);
> +		mark_page_dirty_in_slot(kvm, memslot, gfn);
>  		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
>  				      vma_pagesize, false, true);
>  	} else {
> -- 
> 2.34.1
> 
