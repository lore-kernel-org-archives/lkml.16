Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65341264639
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827799; cv=none; b=ZBYmAeOE1ta+XUxaWapY/eDasleRUQ6TY45IZq7LU6l49CZ6ZQEWf3Ose46NtN/l48uo32s/6y00DVMdXEmt6w8iycYt8lka3Z6NCVhwZLX+615HtRlR7WzdrG8YgZrKvmkMqBDUzBsM0jUYIl5AYYeqrCXRo6INfNmITeXj16g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827799; c=relaxed/simple;
	bh=HJ6NrVExj4Lhqi5JsQ+QdL61wkHctJ7hVp6jDQO888w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuJgZ7/ZKoFxIYtC+veE6oHUjo0XgJ/dXKSFDIidGLAjRh30wSRTti36nKKYlznSKkV38IvsKzvrIqQ2eTaBd9NuHcblIZoJLp8rkwXkEYVIODtuyVkmAaPpHGP1W1+iE6NSLsXtyqwJ+eaGVyRfEJ+HzONTL4iHomE6sHcs5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lQKRyDci; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQKRyDci"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so53864295e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747827793; x=1748432593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIj47rywpj/D2C6gd9xtKK9WJO9HLsTC+3sPjXM4C/Y=;
        b=lQKRyDciLIpHjdmHK8qfh3O6tJvS1Gp06zH6LGaQjWmX/WnSuN0RiIp+RXuG1WPYTP
         KF+oCRMNiqsk6t5wDTenvXARo/5z9ZbY7v1fwcvouUElXikXMN5Gt/BWNOqRfguQwX01
         xfrXTCW+BhquvhCmWun7g1Ol+nyMgSDgKXUiaiLrrFBxUAyMk6i4yuhvd1zXVofnkl4x
         PKfJ4eWpz5S+rf/9/P3qGdCN0yK9jykOZrWOyPq/oGOWERYeO4kKkAWkEK4GV8QGAniZ
         PaMCvAXP7l2licSgppDYFdrdJgWT3V9dVLi2yHxf2AjTJNKBPSYf6Hpre/BAz39dvsp6
         YOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827793; x=1748432593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIj47rywpj/D2C6gd9xtKK9WJO9HLsTC+3sPjXM4C/Y=;
        b=Mh8+Q+78ks3ycJkx7o8ok/aRj+mGbA6sasoIm7LOjRZ9S6T3Mw28hNVYJHI7UPXYXs
         taYpYMIhi2klInkfjqmYPYB0cnCXphE/RTzMNuvrG9IG7XogBF0ZpOyFH62V5ZGvN+Qb
         SktooKPv2seECsaxhR7eHfq7xVSF97lqDmIx+QavQ6MtwzHdwJ4Glh6GKU4kZ+nFVndh
         6gk2/FOeOy2VIMDdZ4VdOWvjIx2qJdl98YnxSXDjToCD7aAaAlsgyiTaCFERLM8iOC9o
         eMT5+7+Vgxb+q53QRzuIVtbZnPyyddekQNmfYDh658Awi7x6qvfZ61q7WP5BqkdtkOGw
         arvg==
X-Forwarded-Encrypted: i=1; AJvYcCUJcUy4c9BfyfH76iHONJ6U+SkaF9Y4UBf2/FxNLAykRjJM28HNppQtst2x0hOXs9qfeKsZldJ7M2aoJrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0t+afuoqV5XxqR+ZgGVEw1S8po2H5tc8jdlxQ0Y7n1jW0XKP4
	vK/d7d2m1rf9HwoO4Z/VFXoLKR7Dxb6ybo/iNjgZc8OwYXBranU8TkPDrBncdeT8BQ==
X-Gm-Gg: ASbGncv9IfaT0rN3b8EQL5k7X6x582MLgPTLp4/wGFHm9DR8OqHGSSmZZtpRZLSi5tA
	ET7R3B0bMbQi0jDHAJsecrW91REY81LST/eHOnkvHaWXnVubC3w/bUi3CbU9vtXUdllsvV13/G8
	jANTffcXXNB1riAymG4cIhQ9oaA8EG12M8mDF8B6D+bZ9pFn3YZQqbkxyz2LFijA+Sag/FnCKrC
	bH9XmB4iFrL4kYBdMKDQn5Y8IaJwupDPQ70KN/F7UhKsKBT2ef74K9RdUGqb5G8Q70/CsQRlgtL
	+jq+bBX5Iu7F8I4VDBwHwOcjk+IF4gZ4L5ISVvGTFo3x3NLtZ1JJF5gaxkj+dr5SlVReUZVojaW
	kMpyierv7jv6yHy3PK41XgdgB9UY=
X-Google-Smtp-Source: AGHT+IFyiCTkts5eQTrnHL23MgrDGPsbhNN/YKTP/ITQvr4EG2o+sxQ9Os5W8avbkK1VKu9zMlICZg==
X-Received: by 2002:a05:6000:2012:b0:3a3:4b95:a8ce with SMTP id ffacd0b85a97d-3a35fe5bb43mr16581965f8f.4.1747827793442;
        Wed, 21 May 2025 04:43:13 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm19215908f8f.22.2025.05.21.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 04:43:13 -0700 (PDT)
Date: Wed, 21 May 2025 12:43:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v5 10/10] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
Message-ID: <aC28TB_2Aul4s1T6@google.com>
References: <20250520085201.3059786-1-vdonnefort@google.com>
 <20250520085201.3059786-11-vdonnefort@google.com>
 <86tt5edy7t.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tt5edy7t.wl-maz@kernel.org>

On Wed, May 21, 2025 at 12:01:26PM +0100, Marc Zyngier wrote:
> On Tue, 20 May 2025 09:52:01 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > With the introduction of stage-2 huge mappings in the pKVM hypervisor,
> > guest pages CMO is needed for PMD_SIZE size. Fixmap only supports
> > PAGE_SIZE and iterating over the huge-page is time consuming (mostly due
> > to TLBI on hyp_fixmap_unmap) which is a problem for EL2 latency.
> > 
> > Introduce a shared PMD_SIZE fixmap (hyp_fixblock_map/hyp_fixblock_unmap)
> > to improve guest page CMOs when stage-2 huge mappings are installed.
> > 
> > On a Pixel6, the iterative solution resulted in a latency of ~700us,
> > while the PMD_SIZE fixmap reduces it to ~100us.
> > 
> > Because of the horrendous private range allocation that would be
> > necessary, this is disabled for 64KiB pages systems.
> > 
> > Suggested-by: Quentin Perret <qperret@google.com>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 1b43bcd2a679..2888b5d03757 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -59,6 +59,11 @@ typedef u64 kvm_pte_t;
> >  
> >  #define KVM_PHYS_INVALID		(-1ULL)
> >  
> > +#define KVM_PTE_TYPE			BIT(1)
> > +#define KVM_PTE_TYPE_BLOCK		0
> > +#define KVM_PTE_TYPE_PAGE		1
> > +#define KVM_PTE_TYPE_TABLE		1
> > +
> >  #define KVM_PTE_LEAF_ATTR_LO		GENMASK(11, 2)
> >  
> >  #define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX	GENMASK(4, 2)
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > index 230e4f2527de..6e83ce35c2f2 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > @@ -13,9 +13,11 @@
> >  extern struct kvm_pgtable pkvm_pgtable;
> >  extern hyp_spinlock_t pkvm_pgd_lock;
> >  
> > -int hyp_create_pcpu_fixmap(void);
> > +int hyp_create_fixmap(void);
> >  void *hyp_fixmap_map(phys_addr_t phys);
> >  void hyp_fixmap_unmap(void);
> > +void *hyp_fixblock_map(phys_addr_t phys, size_t *size);
> > +void hyp_fixblock_unmap(void);
> >  
> >  int hyp_create_idmap(u32 hyp_va_bits);
> >  int hyp_map_vectors(void);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 1490820b9ebe..962948534179 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -216,34 +216,42 @@ static void guest_s2_put_page(void *addr)
> >  	hyp_put_page(&current_vm->pool, addr);
> >  }
> >  
> > -static void clean_dcache_guest_page(void *va, size_t size)
> > +static void __apply_guest_page(void *va, size_t size,
> > +			       void (*func)(void *addr, size_t size))
> >  {
> >  	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
> >  	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
> >  	size = PAGE_ALIGN(size);
> >  
> >  	while (size) {
> > -		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > -					  PAGE_SIZE);
> > -		hyp_fixmap_unmap();
> > -		va += PAGE_SIZE;
> > -		size -= PAGE_SIZE;
> > +		size_t map_size = PAGE_SIZE;
> > +		void *map;
> > +
> > +		if (size >= PMD_SIZE)
> > +			map = hyp_fixblock_map(__hyp_pa(va), &map_size);
> 
> You seem to consider that if size if PMD_SIZE (or more), then va must
> be PMD aligned. I don't think this is correct.
> 
> Such an iterator should start by doing PAGE_SIZEd operations until va
> is PMD-aligned. Only at this point can it perform PMD_SIZEd
> operations, until the remaining size is less than PMD_SIZE. And at
> that point, it's PAGE_SIZE all over again until the end.

Arg yes you're right :-\ 

Shall I respin a v6 with that fix or shall I wait a bit more?

> 
> Does that make sense to you?
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
