Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3904427979C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665247; cv=none; b=ld5KEW2xthl09MzXo5qFYYyAy47/eTR9S0N4Q6fN5f/ftuGUugQkDFswloLuAa0nyZR3jFTA+mLcjjjsqIt1cbdKt/7D44nj25Fzssb8R5nLgyrpCaWbNhZgkUq72IakeP1vHjsvGJJ7rPx5QRChHBPOhUyvke8eLp2zHF2eQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665247; c=relaxed/simple;
	bh=I9lzMgSvH1LyOBPTWN5xRM8c411OK22ElmVpA1UPYeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVIxl3Qjf03QMSRjD8iMXG2q8LScCdyftC9HkNv5Dc5ZGe/4gvd/FXL+izICYbUEJMjbZn093I0oYfG+WoUnvXqhtzzflzDuBZeReJo9F+mSTNt1Ji0CUGo70uVhCJijB0E/Hp6DL1KNvVJbFSWWJYKamomoQIBbc6yAQtOJKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zR0oErhb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zR0oErhb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6020053cbd5so548520a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747665244; x=1748270044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmGAnLS/NEWC0m080CBn1UiyJaS/KFlnJ1TZ/Bc5c1s=;
        b=zR0oErhbePh0YDUyWuBqMCOEa3HrHWnSrX+n9zqo/A6g8NDbUtuy9eV4fdvum67mnX
         nQGhHUgrJ+MYCHuOmkIjRyR+GzHzoOqjjdZNHlJNp7w4Dk3hopa9FnrlxtTxdYeHuOKQ
         ZpR2WoK6tGgqv4VRcAjdTXK9PsBQwBDN+qgnXwHgqaDDoaKaiTFz6rTtO/VJ75Tt9zg7
         WJdlrSFxMrEjxoDT99+tbfSjf9pNLXKl8VarUK8tj+XgVv3Wv5FK+XeRi7o2eLaW25w5
         yPaHdBXoIPFFPicmY11XPkRrGRDY/VyKt7KaUpTltr0vn2e2va4i4ZgTxICOWISDyrXw
         vdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665244; x=1748270044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmGAnLS/NEWC0m080CBn1UiyJaS/KFlnJ1TZ/Bc5c1s=;
        b=PwZisBe+9Xan0xfB0dK8YZqOzAoPmC3L+nsKuFgVg3brAhYrrhszhcPI4IGRbG/yEf
         R3ENgyrTUfZEQukIBds+bVdmN5zi1/Wm1VnwEtY1zW65Ejg4Nx2UjHUilGJFSCWwcFQY
         i+IZ1IVfGWX+4xs7j/R29oHKNC2veVWSHkbkGqSYkYsTXcfYKjtgODi6fxY20laQgttH
         uyyEz4AvpqBnrlXQ1oMA+bpQNpHL+HnJ6kVIrzVMAKdAcT8fgZqQvT6clh2UPFDKGupa
         rX36fOIofA3b0RI8DjUlrCPo7XkQgUc/b/V1pRZNg2xZrAvPHyir9wuceTKNbjQiqFq7
         U3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWmHXdsCd1Ixw+Xac1rOmlj5IAn8zdSEkcGxzPE6dRUU7w0JBbkMXl+FIc5r2oevRRWu54MrWRjM9jbR0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW3gNoI7Ql7y049JwN7kaigR93fwr1LD2H/LZNcsBNfeVFciDd
	DfnSw40aHChAaHSsl+LKMceBz41RwDou4I3gayuRaCZhurM3lcfZVxoL9j9qXKPOOQ==
X-Gm-Gg: ASbGncv79UMi6yiThkWaIAE3KlD01yV7OAUlSkoxXrYASRFvU1Njr8jeFHlTyKRq1xW
	DNtv7BcfqInmPa2ISup0rfu5llQtAHXjkChPKJpafhV1+SopdNOiZyygyzp8hxc2ce1tkOWRP7M
	K5nutBitPIUOmLYyAeokWVHqIbS9nTot7NhLk0+NhzCuNQ5EV0UM3NWVBXI4STrXC46srN/K2jc
	aujwtRIUOKNvciyA+TPV4Nob8aqbzY6IDXdNvtzrjpg0WBENbOmp58d7VhpKR+M0gSAz20Xx2Ws
	pa/Sg3+g+XKoJh3zCMz1cCugvj6bc/keIe51i+6jgbsypRnRshH3N+TDpZJpwCL0YlEDsl+Q2Da
	6dUsFa9n7LQ==
X-Google-Smtp-Source: AGHT+IFE+1r+T6jz9dM4N+qGxperYjlRM0Iv/bL9K0RKQrkNyUXEkMkSDlbXHKfSpRXLx2HecBekhg==
X-Received: by 2002:a17:906:dc95:b0:ad5:5447:6ec2 with SMTP id a640c23a62f3a-ad55447bff9mr850796666b.53.1747665244323;
        Mon, 19 May 2025 07:34:04 -0700 (PDT)
Received: from google.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d43840esm594158466b.87.2025.05.19.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:34:03 -0700 (PDT)
Date: Mon, 19 May 2025 14:34:00 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
Message-ID: <aCtBWPe9Vjy04Srg@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-10-vdonnefort@google.com>
 <865xi0fzwk.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xi0fzwk.wl-maz@kernel.org>

On Friday 16 May 2025 at 14:28:27 (+0100), Marc Zyngier wrote:
> On Fri, 09 May 2025 14:17:05 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Now np-guests hypercalls with range are supported, we can let the
> > hypervisor to install block mappings whenever the Stage-1 allows it,
> > that is when backed by either Hugetlbfs or THPs. The size of those block
> > mappings is limited to PMD_SIZE.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 78fb9cea2034..97e0fea9db4e 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
> >  static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
> >  				      enum kvm_pgtable_prot prot)
> >  {
> > -	return true;
> > +	return false;
> >  }
> 
> Can we get rid of this callback now? And of the .force_pte_cb field in
> the kvm_pgtable struct?

I think it is still needed for the host side -- see the comment in
host_stage2_force_pte_cb(). In short, it is not safe to put down a
RO block mapping for the host. Re-mapping one page RW in the middle of
the block for example would cause us to 'lose' the RO permission for
the 511 other pages (assuming 4K pages obv) when we zap the block and
we have no way to reconstruct that lazily as we do for guests.

One way to solve this is to teach pgtable.c to inherit the block
permission/attributes/sw bits/ ... for all the PTEs in the newly
installed table when we zap a block. That is actually quite cheap
and easy to do in particular for KVM_PGTABLE_S2_IDMAP page-tables
(a.k.a the host) -- Android does that downstream FWIW.

Thanks,
Quentin
