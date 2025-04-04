Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0620E33E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786497; cv=none; b=ZlJRzi0vMO61rAWKF55e2bBgOwrQIrRA9zGCfU5YORBMtqAqkoUUydtZ1/ELXVHWtRRV/Gujjv1RrgfYmmN7Nu5vAbKIAxYlXw1TpwGntldzLjc2A9L/1206WqQvB2txHn77MW6SyFjz33aVKTmfFfggwKjAXP4BEKHdHhITvj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786497; c=relaxed/simple;
	bh=KCcZLLVuoSdc3w18qTEjWe86uuWT8hoT8Z8E6CPkYsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLq1U7r/v+AKxpWiR2DWqp/uxI+l/QXmQeWBt8yn3Srt10llc37t1ri7EfD3l0KaOZt7lpAEYVQxxNAL21CZmCem8U5q0ONihnQVm1v48a2DH4Q1XGkJKailTi627zapiKLjbZ8H+j+aWs9wQX+DCEifFzeD65Ec9b5Wp6g6j0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NYvSamok; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NYvSamok"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso24167895e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743786494; x=1744391294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4k6IoGtIEG6cR51zQzmX/5gWxNHbCnuUK9lpXUrxdQ0=;
        b=NYvSamokNzoiUq9jYRY3RmgxABZ2C2N8BpAc4/AmktJ+OGbGqSw6lgcNlo9ZdI44gG
         LTqzm97N9n6Pi5L7ymm/OSlB65+4+YqXxxLYMm1SZR3qXF7RE8gUJbCv+A7nj9rB5vqZ
         vw7jyIZJpl84G6ITs4Mwmq+CGCAMJE639xpQ8MOh5FvBDvMuNCHmkYVWXKAVOMM+x147
         7eHBVlLs4ApwHedptLcRx11JbBNxoTN5scw//WjXl1qZvDvX3Eg3PxUf0lQzG/FlLkfg
         47whb5YpSPcWqRW+Qa4cV3nbwrRfu41EFXXNC3HT4FJFdMsjyS/FG8BXxUsgZXesz9Rd
         6d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743786494; x=1744391294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k6IoGtIEG6cR51zQzmX/5gWxNHbCnuUK9lpXUrxdQ0=;
        b=K8Ae8QV9ORPuTaA4h3q6KjpHkXLZlBA2m6TuPGT6wDtw2WD9D+A4QSHVGdXOQYJiTg
         1N+zJftmcuyawLtIA4noR8DRQWs7eYFndqGAA+ijAVLTX/T+FdLcqLVFqsvKK+33UZPx
         HFnj7uXq8gh82H/a9a6kDNabIuDO2rmSFZ1N1OWW9WOxT5ng2idKeX4VhOHFk9Zz8plD
         ElKaw6BDPlV0XNvx5Td0DFBWJczQg6IffL64abRYUYHmB3avsJzh20Lo8Dw8gxz+PuLb
         3BBjISALlRD1e+LGqS6rv0j/e46UAM/AlifIfDgPG2V91zqNMotF17qXCvY4qgr+AoeX
         BfLg==
X-Forwarded-Encrypted: i=1; AJvYcCU7dKBJIyhTUyKUp9XMjD8F+a0MH9EKhd+H5hjcVx3fiuR8wW3nqflF+SKIdBN8L94Q6LXXDIOJ3B5LJBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+/gcG4uKBI42OyiQukMfkbd6vYPR5woifQ5ua+mdS9F6g4V0
	lw2/4PSXFKWRVJupL3JrIU5FUf2bsDY8dkWi+PScpQ2iST5TtDEfByxhbNyf3A==
X-Gm-Gg: ASbGncvmSqxdPiqRaZUdeEy3As05P4X340F/3hft2y/YJjsL8CEIT90sv2P07k+TAKo
	rOCB0Dz5iXZ368Ep6Ff2kJ1G9lsVntD0EovtxUqTGJQ6cnQ7dmm4d5dACeDZ8sKcfwLet8pyDQf
	CaDDNDArI3gSnaNc6yuJHXbzB2SgO0dbYsDQYEfzcsB7Vw2J4LdV2hR/+E/8DeCm8wg2rDEpfEE
	gjnuB/aXWzO0isEpiFk3JYYLFTgcdiYGj4bagPOw3N4ilsxmmxy27tIhp75zzacr4fJBG0nqsf+
	ZQZes4H3Oyq2QpxrGLwfSmmYoTMg1fGLZ0OKCUQqFJClCrEY1gBQP3ypO8zOxqfB/rGLntgMIx/
	6DApe+Hs=
X-Google-Smtp-Source: AGHT+IF6UPxO13DnLOo0uQMw2P2nlLBQDZOGt8vDi72vp60MMU8fX0APY0XE/2SORIk1/20Jd4eB7w==
X-Received: by 2002:a05:600c:3484:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43ed0b80b30mr37929175e9.2.1743786493987;
        Fri, 04 Apr 2025 10:08:13 -0700 (PDT)
Received: from google.com (35.157.34.34.bc.googleusercontent.com. [34.34.157.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbc64sm50289385e9.21.2025.04.04.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:08:13 -0700 (PDT)
Date: Fri, 4 Apr 2025 18:08:10 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
Message-ID: <Z_AR-jwodVPT5oOg@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-9-vdonnefort@google.com>
 <Z-6ZU7DWkxnVIbff@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6ZU7DWkxnVIbff@google.com>

On Thu, Apr 03, 2025 at 02:21:07PM +0000, Quentin Perret wrote:
> On Thursday 06 Mar 2025 at 11:00:37 (+0000), Vincent Donnefort wrote:
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 1f55b0c7b11d..3143f3b52c93 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1525,7 +1525,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >  	 * logging_active is guaranteed to never be true for VM_PFNMAP
> >  	 * memslots.
> >  	 */
> > -	if (logging_active || is_protected_kvm_enabled()) {
> > +	if (logging_active) {
> >  		force_pte = true;
> >  		vma_shift = PAGE_SHIFT;
> >  	} else {
> > @@ -1535,7 +1535,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >  	switch (vma_shift) {
> >  #ifndef __PAGETABLE_PMD_FOLDED
> >  	case PUD_SHIFT:
> > -		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> > +		if (is_protected_kvm_enabled() ||
> > +		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> 
> Should this be
> 
> 		if (!is_protected_kvm_enabled() &&
> 		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> 
> instead?

Duh! Indeed that's what it should be! 

I'm going to send a v3 addressing all those comments of yours. Thanks for
having a look at the series!

> 
> Thanks,
> Quentin
