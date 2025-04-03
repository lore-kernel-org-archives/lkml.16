Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DC5190679
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694315; cv=none; b=KXJyVVUqSmR0cbNFNCmZxrHRMY7rMmr/h+DX/ejX6m6b8BNuMGxFWgwXi2rAX1Iw8etq8thK5Svq7hMBaNEVRAOvEzXupWBK8jxIw5ZBNlZcdyeLSA+QDZkeVRQw7R7Tq6PLk68BEOZm4mu3SV3NijLevCsUMSNpgPXt6FFvYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694315; c=relaxed/simple;
	bh=KPQddjkqY2woTfI2cLtPZbW+MJntKMtuNGsZM5WDnFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9lpLxeMxQv3NFbkIopqyOgG/yIXBtaen2PE+1tEkrP2GmeIoQkk59nrAL1ady28/opK+atgTf01b336n2J3R4aphq1duHoh/n5OxlDCq0xBwd80Ejg0KaCajMaMRl9KW3HZ3e1tZGAOl95oEhirX0y8EuKSkFJlLpCVm2q+E34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YkKulaQa; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YkKulaQa"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso1708175a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743694312; x=1744299112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2SVexGeljhSdSxj9UAkbIi7n+kiPxQUm8cURRQIGIRA=;
        b=YkKulaQa6F8vJw9Pb8lzcWw9wVsDUgmRAUzMmVowwq0u63Pv4ZDEvAuDSL4Ht2v6Sj
         l46HvQLnNqrVAyHXn75HozmxIzdXH9Aao9T5IMw56g+MX5gzRNVcA5MshuJN3rUFcapm
         H9KwdIfMG/bnrSeqyKik9Lg7wi3OsHtndJM3LKMb9PPhOdE9MaBbpMeHYukWdEj+Kl84
         c9bUwetUDb64huosAsM6bRjq8vMFTclh6tlm0pWIXdOvUS+wVxikLY+LTbVKH9cVuHXw
         XuYsmNZddEeXVQ0P2VXbckjPU47uzm3xFl7R+Cf+VprP/VfCM/yS+hfE2T6y8cjUUgsk
         0SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694312; x=1744299112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SVexGeljhSdSxj9UAkbIi7n+kiPxQUm8cURRQIGIRA=;
        b=skmaeH7cNKbQf/opOU0MHGDK3t8tSBYxbEwi5vpSDD5q1gXlGvmHie6TvLsE0DP9fB
         oDPmVqXLCL4vc4goL7FZozlLV+O1SDq8yZbPrUIyIGX7utqYKQDlBNs3hlguoVHxX2J3
         6q9DILOtbD8myu+py0mPxrbOvM030VZXEckbouWS86TexefFxu5JrCI5IK7+UXnrhcS7
         uUtgC7dU7de4lUEHRtHaG7eIYtwxu/8CL1o7t5j1TuM6JZsaQ1qLjh4swrpnczH677OQ
         7b8vS8pgZRWAfEZWBKU9nhqKL2RlKszfYg5DxjFHFrS46ewPP+ImWJ0lrP6LMZ3lPTvs
         V29g==
X-Forwarded-Encrypted: i=1; AJvYcCXOpLuKOoM9uVk7UkXVDzjL2x63EVNHsTQfuNahe04Kax7y5aeCdIIB2SCxvo9H0BRvyoPSl+0jqzCUYBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5kVzXigZ2Jt3CWRFPm08rVKS2ll4t/J8xx8S2OyEMPwxX+V6
	tNPKd9+XFNSYBj4BKSAWFNygXXeacFtdopYfgyQXxH7qAFUpAl18ZgOZAGgvZA==
X-Gm-Gg: ASbGnctw1oR4fEDi4k5Cva8Nq6Ah/UhyR9QFcSDb32wk5E1KvquKOK1Nc/xHO7slWJz
	LC76DIPUmNeR7k+j7YGRLC5z4tQKffJhF9Q1+F3I8HC80m7iME6oxCmzcTYgEC4ycWYDEY4HJuE
	l32CUSkIILiPSSZSw5PNXI70JbrYqICg5raqb5yMJZMEgTHJGX8CCnqPz9vn2aveFCGqImTgbZZ
	zFutqYTnzse52J3vGdw6x0PsFczhELcH4dIYOM7PUDmPECPMKmci35Q0JsBLhG8/tedkzfVoaCf
	Dka902gtHHC9TSpht3YO4nqnVnb+cUF3uwg33CE8PrB7VBZO0JTjSe1w7USvvg4qrYOVWgZP8of
	x6tTgrlFxWBP7Sy0g
X-Google-Smtp-Source: AGHT+IEGEPfe6jLP9yTD8EczNIfaOYVt4yM5HvzJTIY1ayuEiVqh4iVP20QX+O0oM2W0n9OiZudOCQ==
X-Received: by 2002:a05:6402:1e8e:b0:5e1:dac1:fa22 with SMTP id 4fb4d7f45d1cf-5edfdafe39dmr16976129a12.21.1743694311816;
        Thu, 03 Apr 2025 08:31:51 -0700 (PDT)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4027sm1097010a12.73.2025.04.03.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:31:50 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:31:47 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 3/9] KVM: arm64: Add a range to
 __pkvm_host_unshare_guest()
Message-ID: <Z-6p49EcsZKid7L1@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-4-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110038.3733649-4-vdonnefort@google.com>

On Thursday 06 Mar 2025 at 11:00:32 (+0000), Vincent Donnefort wrote:
> @@ -1012,51 +1011,52 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
>  		return ret;
>  	if (!kvm_pte_valid(pte))
>  		return -ENOENT;
> -	if (level != KVM_PGTABLE_LAST_LEVEL)
> +	if (kvm_granule_size(level) != size)
>  		return -E2BIG;
>  
> -	state = guest_get_page_state(pte, ipa);
> -	if (state != PKVM_PAGE_SHARED_BORROWED)
> -		return -EPERM;
> +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_PAGE_SHARED_BORROWED);
> +	if (ret)
> +		return ret;

Given that hard rely on kvm_granule_size(level) == size above, we should
be guaranteed that the PTE covers the entire range we're interested in.
So is there a point in starting a new page-table walk here? Could we
just keep guest_get_page_state() directly?

>  
>  	phys = kvm_pte_to_phys(pte);
> -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> +	ret = check_range_allowed_memory(phys, phys + size);
>  	if (WARN_ON(ret))
>  		return ret;
>  
> -	page = hyp_phys_to_page(phys);
> -	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> -		return -EPERM;
> -	if (WARN_ON(!page->host_share_guest_count))
> -		return -EINVAL;
> +	for_each_hyp_page(phys, size, page) {
> +		if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> +			return -EPERM;
> +		if (WARN_ON(!page->host_share_guest_count))
> +			return -EINVAL;
> +	}
>  
>  	*__phys = phys;
>  
>  	return 0;
>  }
