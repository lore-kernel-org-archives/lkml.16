Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551320B7E1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786336; cv=none; b=kfBRpl706s6L3tHTutwpKUxdDiGLeIlH7NUP9VLPIA6kmjXfQHH74yTD0JTPtH4cEUYMR7tsnohRJ3+YlppXwk7gXVMC06tpZcVTOk1hMwVTk6/WkNmAuJ3bfTQPrVkfKvwZOQcHS6YVqELLl7RqYonxDu3t192diOEvBeigob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786336; c=relaxed/simple;
	bh=iO8nNca6CjCJe5afrLQ0fcpI2xk8JQtBj1QNgWxRfkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUXcI+PjrNc9/nUbQewPq4z1snDqFWcN6xbQ/6ZAylR/dGYWJJu6bjGyfiu3GEFHcqIqvYnKYAXfq9nG3pAlMR1PKfX+DNPmZTdqwKdHG2pm425olIaIWN29aLzpCAsWEC54Z4igQwDBylG2Y/6hTAAKcH6tz14S7JPgf74Sl1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H3NVeW/H; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H3NVeW/H"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso57949166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743786333; x=1744391133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwDqXCtOct8DsFXT3x26lNRUVVnIjXvE/cNDH38nXmY=;
        b=H3NVeW/HN3E0huIvNXb9lCEax2z0Znt3OnAcWcqf/Tiv5frxz0TFmsDQKmZdzguxM2
         9GIUroUoKLaJLJTM4ZAlMFAfD+fJF/AcR0RwW/DBzBQjhGX/mG5/jODlKXYUz7rbYkRa
         swxhmjgtY4TIJd+4JOTOGyp9QGNIA3xyoARtdumoJWMH0Nodf/BMwzw4QIFFurTpDNpk
         vANfrtKOSXaMQS8NMfy54Z+X2Jiy4O7cBZErXx7vumKtI+XopMNthIZBn/VGCq2izyIv
         J7TM/tbaABp2tMsdTv78Eh2iDVYHpmTC6bpL/V8O3qCdD/eEkqKytRCU5vCSm1yvBiFQ
         Ce1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743786333; x=1744391133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwDqXCtOct8DsFXT3x26lNRUVVnIjXvE/cNDH38nXmY=;
        b=LIgU6NW0YpNTBzdCk5niw4EirT7NKebOKsjDefZruGwL1jj9Iz8DKxrz6HEVRNgLrb
         f++f3ThI7hnd1sj1RUnMWV1BuXT13lpCiSMzopU+SEVbhKT02rJeABIsLJxbZjQKpZiz
         ypjgZopUjrsRHxVQuJA9CLLtdEEC+4HN2CsGGGu+kuUzpP0i2irpxDxOLmN7YasucfvC
         XFpcP7y2wyqNCQ2Ot6sZgxRILjHu1dUIXNypkOY1uZQdMeAyaqTcV5IJGSvFTvR/IzuR
         zE4jss/4UFwJLflqIFaHFucdjNAtVwII15a00X4nv6hTZKom0xPfVJ8XuuwzIUvVkECK
         W8JA==
X-Forwarded-Encrypted: i=1; AJvYcCXh6hWpN2tYSosP0EtF33UEnMXZYRZNm1rzUwldVyp/ab8OppYS4ik8JP07xAh6agmifDnh8rd5kIKySCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkuXcKxW9Z359iu1y/QhLV5MBt9BYv0t2XDeDyEJBCtIQB4Itg
	Ztp0vHgQQr4AMC7RVz1D3BJes/uFGBx1VQ6By7vafZz1n+C7OwSfPOLwS3Rutg==
X-Gm-Gg: ASbGncuG4t4QtmXznAYu74rjwOiRNarlF+UoHNsi4T4LZ5KRdRF0QF0XelH+dblROTQ
	6GfJ6PWcmwqPelTy01pL4vuZI+NQ2lmh/SVWOAQC0vv9Nm31+EtFDk4zxjdAtuBCrxiKqS2aJhP
	tj/hshsxt2ehZE4S8QDn++DO+IcLe/eKNzUEF7HNubNOVDESGVAdmVVwkUqTfLqfluE7HDTedW9
	fCsEMuZ/fPAFJjvXCpNFPvvHvOdomSMuC5uKT3CHgo3o7JdQrWsKq7kln9kkUOCAfDywmDEEwme
	jBg1RNpEkXAyDmSi0wahpsJ5ErRRtYsQfHFAkuK2PnqjoGYRwDhxUsHg15DWnR4qI8hlgpr9WuQ
	V1ZeaIhA=
X-Google-Smtp-Source: AGHT+IHNmd6B42CvAAoOrmSaCgMaRG/rblZajqIa3A/ogW1Y5oG4oBfPNhJiyFRf09FleJPZU3ziJA==
X-Received: by 2002:a17:907:9693:b0:ac3:3e43:3b2b with SMTP id a640c23a62f3a-ac7d1878c0amr443601366b.18.1743786332804;
        Fri, 04 Apr 2025 10:05:32 -0700 (PDT)
Received: from google.com (35.157.34.34.bc.googleusercontent.com. [34.34.157.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0184d0dsm280758066b.130.2025.04.04.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:05:32 -0700 (PDT)
Date: Fri, 4 Apr 2025 18:05:28 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 3/9] KVM: arm64: Add a range to
 __pkvm_host_unshare_guest()
Message-ID: <Z_ARWDH60WayM0MP@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-4-vdonnefort@google.com>
 <Z-6p49EcsZKid7L1@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6p49EcsZKid7L1@google.com>

On Thu, Apr 03, 2025 at 03:31:47PM +0000, Quentin Perret wrote:
> On Thursday 06 Mar 2025 at 11:00:32 (+0000), Vincent Donnefort wrote:
> > @@ -1012,51 +1011,52 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
> >  		return ret;
> >  	if (!kvm_pte_valid(pte))
> >  		return -ENOENT;
> > -	if (level != KVM_PGTABLE_LAST_LEVEL)
> > +	if (kvm_granule_size(level) != size)
> >  		return -E2BIG;
> >  
> > -	state = guest_get_page_state(pte, ipa);
> > -	if (state != PKVM_PAGE_SHARED_BORROWED)
> > -		return -EPERM;
> > +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_PAGE_SHARED_BORROWED);
> > +	if (ret)
> > +		return ret;
> 
> Given that hard rely on kvm_granule_size(level) == size above, we should
> be guaranteed that the PTE covers the entire range we're interested in.
> So is there a point in starting a new page-table walk here? Could we
> just keep guest_get_page_state() directly?

Ha yes, the walk wouldn't do anything more than what we can with that PTE!

> 
> >  
> >  	phys = kvm_pte_to_phys(pte);
> > -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> > +	ret = check_range_allowed_memory(phys, phys + size);
> >  	if (WARN_ON(ret))
> >  		return ret;
> >  
> > -	page = hyp_phys_to_page(phys);
> > -	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> > -		return -EPERM;
> > -	if (WARN_ON(!page->host_share_guest_count))
> > -		return -EINVAL;
> > +	for_each_hyp_page(phys, size, page) {
> > +		if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> > +			return -EPERM;
> > +		if (WARN_ON(!page->host_share_guest_count))
> > +			return -EINVAL;
> > +	}
> >  
> >  	*__phys = phys;
> >  
> >  	return 0;
> >  }
