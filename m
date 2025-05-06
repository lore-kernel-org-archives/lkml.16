Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447A2165E4
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523362; cv=none; b=NsfvBq1Y6zjTa3mSjeUb4QhrpXRRjmhF0fdu8gNpOyt/7RyBZJjdKHbh6qC312P5odI1kQ9pq5yihqnm8ZTwrtQ3BaKqFK9uEs6yrIVyovgT7pVBF3uQb+GbGQyD1rYtF4y0Ze1kdcUCEw5RDAeCj6URoiNd2Le4kAq6Rs/Izvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523362; c=relaxed/simple;
	bh=IXbem8G2R35AAr+aAT8vVVC/AjXI63AKfjNdsXUs0Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGxiwa4RtUz6r7xBgdZOZvxiwI5V+jC1cUpUMb1tPZsqtwdx23EsIc7eYYM8dovcVU996tqP/pO05MsDzRgcyGkTWI8438I6xfZZOGf4MP/lRRPBKryew9GsQjHxGQtEj48/dV4XlvYlXKwlDuzyzBJ5UrtV9Yi68qUj4xljPJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rRQ2WK6O; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rRQ2WK6O"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso33935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746523358; x=1747128158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PKyiTW7t9VlHIC0Fir8qyHkI243/6y/pnmH8hpJckY=;
        b=rRQ2WK6OdP+KLUAzdynzJJT+jLRA5D9KNnTXCz8TKWT+90igkuIYnFtD3SeuDtG7Sq
         KGDXNO91CgS/OzSBP8znNh+4EUAT9w4AMWGVGEn9ITxwQoz/PeSgwzV346/GopTfMFZ9
         EhpnzJtZ4G5z2eNyUIniawRYKQwOfoVlW9MNnyf78taTSxfTrTLv9/yAg+pNyTzqXc5f
         U3Dvat2jTJSG5H1Qqb3rW8j3EBwQm779r4yDekmE9nhCv0xUxm50/VWTc65g98bPnpqA
         CnBEQj4mAHwr0/HKnThGglIlWzLMrHFIbmklFmEQv+K0uhyx1iZPu1N4AgcJJpaSU7t/
         XzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523358; x=1747128158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PKyiTW7t9VlHIC0Fir8qyHkI243/6y/pnmH8hpJckY=;
        b=etLPpvmXMaZ2dRgNEJzg2VJYmWJXAKnWb2bgcqA3jHNpPhwVV14utr2tPmHnDokMj4
         OVsuMH3LJV/seI6tOAa6DRgzh5dDLJrOdxhXZkC6N5t9Ou12qDYn7tN9PePtwIaMIWKe
         MCknLHoSJyLeUhtun6jkBuPgro+FiyWdZQyHBbGS5LCtpVutPMwBTbdTpMMs/9B//gnr
         E/QG2qGYYgLBJsfVerqOy1T2CuQ9JFBdIi+QWMPIx1B0adT1DO8N20GytSDUqyRYkKk/
         gAfDuQzzj94gRBDWLRXBReGanU2hBtWy3aus2zXof0TMXMmWZ/oaSKgucdOFJpNlkakt
         n8ZQ==
X-Gm-Message-State: AOJu0Yze4MkqHcBq8UHjDTMhZH11JxxHy1NGrPvkptbhIFE8Mxhz62A4
	1XOw2twT52DIKJh5JBfcg5r1YAW+SlFX8J6wUpSwdb9pCs3f0E6kY3FenOQUGQ==
X-Gm-Gg: ASbGncveoHpeHXzNHjnDcSZA4tUtDtF81M2ckz5WG4+9ghFdSfkPgo9p8lIXsaFIuEy
	P7p7+RQgpo7y47FdVRljbGQjB0Rl8pThioz8AYJlqidaPl/9Y4q9KkhtLdb4AheNiy72/qaVAEl
	xLsUCKcYvbOGJThBgCbzXwWH0RpzfKhU11nkQwi+rDRL6nBT6014OL+6piSK1A4Hf9dahMBNmXA
	AC03V7ZNH1IER6lRCAQLkZlliT5edqDdJaKOG8URz/W+mFNUEc8n21frfD2CavnwGMa2jZTN0/9
	VRpMzXmzCK2J19seGyYsEYZUeaW9YV8LcAuQslTpiZT2f/GnGYmzq1cYxiQBdP7ChZWr+kxh7CV
	HVyo=
X-Google-Smtp-Source: AGHT+IHDtwlAgJFzUnwiJ122yccBNhS4YJpQ3qlNsrd7r09OaCmmMYMxQB11yASqxuqK4r8lQg5APg==
X-Received: by 2002:a7b:c04d:0:b0:43b:bf3f:9664 with SMTP id 5b1f17b1804b1-441d123cfd5mr707515e9.5.1746523358264;
        Tue, 06 May 2025 02:22:38 -0700 (PDT)
Received: from google.com (202.88.205.35.bc.googleusercontent.com. [35.205.88.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b287desm208303605e9.38.2025.05.06.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:22:37 -0700 (PDT)
Date: Tue, 6 May 2025 09:22:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com
Subject: Re: [PATCH] KVM: arm64: Fix memory check in
 host_stage2_set_owner_locked()
Message-ID: <aBnU2aXDvznmGU2l@google.com>
References: <20250501162450.2784043-1-smostafa@google.com>
 <86ikmegmw9.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikmegmw9.wl-maz@kernel.org>

On Tue, May 06, 2025 at 09:32:22AM +0100, Marc Zyngier wrote:
> On Thu, 01 May 2025 17:24:50 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > I found this simple bug while preparing some patches for pKVM.
> > AFAICT, it should be harmless (besides crashing the kernel if it
> > was misbehaving)
> > 
> > Fixes: e94a7dea2972 ("KVM: arm64: Move host page ownership tracking to the hyp vmemmap")
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 2a5284f749b4..e80f3ebd3e2a 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -503,7 +503,7 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
> >  {
> >  	int ret;
> >  
> > -	if (!addr_is_memory(addr))
> > +	if (!range_is_memory(addr, addr + size))
> >  		return -EPERM;
> >  
> >  	ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
> 
> I vaguely seem to remember that there was an assumption around
> addr/size representing a single page, and therefore addr_is_memory()
> was doing the right thing.
> 
> Has this assumption changed? Or is this only a figment of my imagination?

From what I see, this might have size exceeding page size in the
following cases:
1- When creating a VM with 4K kernel as the struct pkvm_hyp_vm size
   is at least 0x1130 (without vCPUs)
2- When creating a VM and PGD size is bigger than one page (for cases
   with concatenation as 52 bits and 4K would have 64K PGD)

Thanks,
Mostafa

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
