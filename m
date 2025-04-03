Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4862C24DFF6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690076; cv=none; b=jeU9SsA97h6h1IsWQbzos7wr4g81fR5kAsa4WFDtxZ3k8BxNviaOgRQMwdL10N9aKRSas1/RC7O8yQ6eDXsY/4YbVxTi96bUHIkUQib6lmNuUYTIHxdvsnAI3ztlFdWDizY7cmiuPeRynX6oOU59EJk5PQ13SrDXhlQ2VZ4miO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690076; c=relaxed/simple;
	bh=6bn6maREDF+L1e+/f66gyRIINYrf9kDWSpu9v95X1Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvh7qY1Sltsz28veHdScRIRDNFWvDv97RsUULM+fDnzZcCtqf1uqm72xA73l8GR0W/iK/Yo0MMI8DlwLZTHnvGRzxxajP8Ci2e0jV8nD5OvGj9pFjQwDKNQHTRjCdgQu99JWX+8SxHroxJ9CBuhbGn5TtWOVLVBRVJFDbi6h2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aD9866Fi; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aD9866Fi"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso1803213a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743690072; x=1744294872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdKyMlf3QjSGqDaSEQwhmI34sCc+7J8IQI9BHCCFOAE=;
        b=aD9866Fi8OBjbOemBtqeRTGT/a+iVv4wsBGkkhvdCsRTjFswiFoj5jTjph62w8EUvG
         VzXElGeT3w9YuojSIAFDUGFvSIFJa3tSgSxoXreqHtehEPh2mxDnfAYbp+2ybSA8HzZf
         iP69CnG2NcT4eYG7WsJguR3v+/kbQRTs5ymjELyrLNxslzM4g/FhlbExievmfxr8F/Ml
         nyddEupYBhTLfkUveaYRZ38gZbCPgQCJU8cZErRd5HqAuxL1pw8/SlL80n6LCXSHOeqx
         WOfAXeuNOc5j/yCr2D4TvXPdtKsN+kwXqjUX3EtnHdz6QjOS2eW9udl8Ve8IichVQ8BD
         rFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743690072; x=1744294872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdKyMlf3QjSGqDaSEQwhmI34sCc+7J8IQI9BHCCFOAE=;
        b=jimhEXBf7BzukcvKF2wDzGO4ra9haNq26keO93zST3R+T1W8ZCIrmCppJRMm4bhHv3
         NHj1Mxk7oMSsccJwKDhBAlA12rY4cGTwfpzB4zbI8x2oCQTDD76VnZP3vQinOIUlDGfz
         4NUD92ucL6pVJ2BMLZzlajj6yC4HdildXatAQiCX+oxULeEYsGKyYvoj0Khi8A7VGj3R
         0LiThF+Ip8X0qhkU41p8ljdQB2kyYPPfNdbbQnQtHfmlwsiLKlZsIWdOHDnjeTXC/spy
         sT3Vk4egq5TQxP3/Av1h6L08o0M+2V1SqTo9lHmxcBOEB5to646pKJ0ohcrX+LE2EmDL
         CzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqBbPE1o4HLJCJ3XeH6r01s5Ssub1ss/ymsRdXPAX/9DpzXWAMDRnvxvwBNSiP4fwZdpN/aQ35D3aFBHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6HJWI/lKbiV5Qfhqj0Pblo9uoPhYUGCEQO0Ocr+NWWefnUP4S
	R1vDndMAlpC1tXU9Evn6zHzV/aZ9RqZRR6b6yoELlkTqWUpyAAxpN5FzPVCO+Q==
X-Gm-Gg: ASbGnctLCvyp6RUNquua6GG8GqYoZPO6aaNOTnJwnnlavOFrg6K3WscPy8RA/Fk40nO
	nifXMmpVpxgx3HuV8rDnTti+2E4KNoLZxp1CwWaY5RxkpRD96xCySAXccyvrAPIsnVMfRfQqoCQ
	Q/eZGWGedPkrF7STuAWjTPmJKba6c6hZaX1Qf796J6FxjZscDySOrfScCBurQklAXHnc5lPiWe+
	yhDFdsYnyM5XzxY0cTijIjnNya82cRsPdN4RJmPNUAHEK6FIU6n/6OUggCziXrvI7IMDF5uz8lt
	yfkq0CHomMtkuwUs+S7hxKfy4fH8Q1X4JTpJynbyGlw+0+rABnM0a2iXJXFIOhi7zQvcOYVhcxH
	HVZRoIg==
X-Google-Smtp-Source: AGHT+IH9NWYIICiILBtI5t/w7XFm2+Ky2qyQvmJWj71kOjgDjuSgYqFoF+3azC8fuvUTcmLQ14dsAw==
X-Received: by 2002:a17:907:97c9:b0:ac7:2f8b:6844 with SMTP id a640c23a62f3a-ac738a4b2a5mr2120901366b.23.1743690072237;
        Thu, 03 Apr 2025 07:21:12 -0700 (PDT)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5c599sm99498766b.6.2025.04.03.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:21:11 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:21:07 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
Message-ID: <Z-6ZU7DWkxnVIbff@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-9-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110038.3733649-9-vdonnefort@google.com>

On Thursday 06 Mar 2025 at 11:00:37 (+0000), Vincent Donnefort wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1f55b0c7b11d..3143f3b52c93 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1525,7 +1525,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	 * logging_active is guaranteed to never be true for VM_PFNMAP
>  	 * memslots.
>  	 */
> -	if (logging_active || is_protected_kvm_enabled()) {
> +	if (logging_active) {
>  		force_pte = true;
>  		vma_shift = PAGE_SHIFT;
>  	} else {
> @@ -1535,7 +1535,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	switch (vma_shift) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SHIFT:
> -		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> +		if (is_protected_kvm_enabled() ||
> +		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))

Should this be

		if (!is_protected_kvm_enabled() &&
		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))

instead?

Thanks,
Quentin
