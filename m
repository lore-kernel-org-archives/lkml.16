Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA481F872A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747418015; cv=none; b=GCaIMMXVrONTraavtcK2cEn29nMpDjwqQaPRe27AeBw0DDNahOSXBU3KnllmxQ7UxyNUfGP0eBEad1H7twlabY3ei2NAe/X5kkGeydDkLCuSjSwn0DX2uK+6ZP7bYmTVKMPGgjB+B10WIajuKni/nG1t+xSgmXDoTTLXtgxTXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747418015; c=relaxed/simple;
	bh=8upEJ/Pro8IkXndSvkiwT/kFxgoDTzCkAC7XhGjYZVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwbQpaN01wsZ3ayZmMBwX1OwgABnsku7VC44kfLmI34Mcj7G5RM6ZhHDHLlRHfutRrlQ06WVCveyZGfy+f+tORk/zcDgs84/vbg7hob/ylDgAKwd3iAQlpTOwsJh/jfOiMTrDTuoXnvinedtKnCsChDiy6QVJgonaozfQZuj10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eE8eh02m; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eE8eh02m"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so19157905e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747418012; x=1748022812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PUV/bkg4QUBVAIj3GMyPK/efOdWpKA1GWmXkehoUR4=;
        b=eE8eh02mM/eskQiOjORWmd/L6TFgoscMWFVXaMSGliPi8Pe1YVB+x+VX8gXkDwi5d1
         2i/ILNZw1z4G4DpYWQUUybD6cF0mw4GRp7OmfEmqzvuo306uoQl1usdsHsypJhnUQxnO
         bZCidHvQhijyG7F0j3NwcAnpBVsw2+22a04wfZNJbqsQV7CEeekKbXrnsDNTiB9wR5M/
         9HQWLybSZ7xWatxVPpqbR4uCiCY6Q3zIeDFGVUMWqyVmNDgXYsXg8oCJ5OCeAFfyxrub
         nLidioA2cz7EcpldAXE+tu0QmYaZIMmH41bvntU9q/Kz0ACy7dU74GlPE+AlDA0dlEOB
         bNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747418012; x=1748022812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PUV/bkg4QUBVAIj3GMyPK/efOdWpKA1GWmXkehoUR4=;
        b=LHBZPdO04q6nWrqLGGa8GM2wrsRNH4qLfQWBntwJUf92CHxe1f7IDIwv4cCWLjW71F
         3fB+7Aib/MBT47g6gDhUL6KvJAKxYNQf3BaRIDbnyda0nZ4oeVh8posTDVQBx3xxYOh8
         /Q8hXggnX3aSg56eBzjmKf+0zCpHZWyTHsn1WZILk5CHeY1Tem/rN1U9iHOeGA57/l3/
         PB9bRpWc98S4//f25Ze7ZL6yJpjC9KhqyKoaOhpVmxWC+O4KlvjpYuou1D9NL/2gdz1z
         7Enbqf35P/vUwwPqFzDXwWPxej2H7cOi+mGTg9QemyCAb9taGeip99VXqghsHJq4m3aE
         ZsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBpUnLXAlMRI+ceSqWNUl8mjUwBTExwc6YgjAl5VvjMihUU3124KfBFpsMJ9CHUeRtDsaOS9nmcSgoa4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzahenjpaA/3w8c3Q89N71qDzp4+3IppmAWzSC6CYYeHa73LCPy
	80ea1TcG0MByrMr1w0lyWBY4ZMjoPkTBji1Zk0XrY+IFU4zs0gre8rNNJvCTQDyRbA==
X-Gm-Gg: ASbGncsYMMAcLrUyhfkwlzR0gmIzwDIxsT+NoohsiOhoJJUniweHhkcKPwYx2KxKTd2
	xC5KtaN48FUgC0UcPTLH8qkLFMvV+kM7J+IxJvsyvNM2sVl3dbwJ0aW4tUMbMhDuyEcYi8PlwpV
	ShNO6usFDhBJESKZC3v6e0d8QVsIRpnmukTXAWsZGdv7k30V5bXsjdzBUJO6Q9ro1faQPcREuNg
	TUG/fxgyOGi+FazVcxfBuSv5HPT/9GfTh1yxVwKMgEzXBFJmv7BaBtEfkQeqUAht3Rze1xjtqtr
	ZGfL7E90uGmMxZph8U4de+wjfM/11Ez/l02+ljqharYkytWGSswjPRNM7pcHtH/VT11y0Dc1Pok
	GcAYeCnumqdsm/KtFlFTmxDy5RFI=
X-Google-Smtp-Source: AGHT+IEv0Zz+YAfIIihBgvDHDhxHsSF6QrQSMcho8CQZS8XKX5FCrwPQKgycTnORAz6U0zTZnRbJsw==
X-Received: by 2002:a05:600c:1e09:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-442fd624854mr45671515e9.8.1747418012214;
        Fri, 16 May 2025 10:53:32 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50b9b2sm42329115e9.12.2025.05.16.10.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:53:31 -0700 (PDT)
Date: Fri, 16 May 2025 18:53:27 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v4 01/10] KVM: arm64: Handle huge mappings for np-guest
 CMOs
Message-ID: <aCd7l455qd4NmOeb@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-2-vdonnefort@google.com>
 <86bjrsg3az.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjrsg3az.wl-maz@kernel.org>

Hi,

Thanks for having a look at the series.

On Fri, May 16, 2025 at 01:15:00PM +0100, Marc Zyngier wrote:
> On Fri, 09 May 2025 14:16:57 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
> > size as an argument. But they also rely on fixmap, which can only map a
> > single PAGE_SIZE page.
> > 
> > With the upcoming stage-2 huge mappings for pKVM np-guests, those
> > callbacks will get size > PAGE_SIZE. Loop the CMOs on a PAGE_SIZE basis
> > until the whole range is done.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 31173c694695..23544928a637 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -219,14 +219,28 @@ static void guest_s2_put_page(void *addr)
> >  
> >  static void clean_dcache_guest_page(void *va, size_t size)
> >  {
> > -	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> > -	hyp_fixmap_unmap();
> > +	WARN_ON(!PAGE_ALIGNED(size));
> 
> What if "va" isn't aligned?

So the only callers are either for PAGE_SIZE or PMD_SIZE with the right
alignment addr alignment.

But happy to make this more future-proof, after all an ALIGN() is quite cheap.

> 
> > +
> > +	while (size) {
> > +		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > +					  PAGE_SIZE);
> > +		hyp_fixmap_unmap();
> > +		va += PAGE_SIZE;
> > +		size -= PAGE_SIZE;
> > +	}
> 
> I know pKVM dies on WARN, but this code "looks" unsafe. Can you align
> va and size to be on page boundaries, so that we are 100% sure the
> loop terminates?
> 
> >  }
> >  
> >  static void invalidate_icache_guest_page(void *va, size_t size)
> >  {
> > -	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> > -	hyp_fixmap_unmap();
> > +	WARN_ON(!PAGE_ALIGNED(size));
> > +
> > +	while (size) {
> > +		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > +					       PAGE_SIZE);
> > +		hyp_fixmap_unmap();
> > +		va += PAGE_SIZE;
> > +		size -= PAGE_SIZE;
> > +	}
> 
> Same here.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
