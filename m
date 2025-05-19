Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E8199E9D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665978; cv=none; b=SM1ETq2/RqtRqQ6pGL135oqFBsYarha++KKtU2o+Rh06rf3j/OD+IpF/AS+ad6dP1NrVj1lfQeP2ldYHXfHqm1XSOdMD1YdT+57MwCeC2bhM7qg/Z1bSSi2xP9GR2O13ZAHhmKSlkDO1yzFXjFZxnx8nE7QFy2iiIJbI4kMjJqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665978; c=relaxed/simple;
	bh=b407WGJFqvxUfiereTRtKfvLxMRLPUiIXKAC5mokj5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqcYAYtV9Ptg8j7+dOLjiPQgRQ1qW/y+KuBGC/dPZx516WNIVxdJjd/4kFT/BVOyjWx24yPiWc4R/rN8Bi2oYD6RfKdv3Wdyw529b9X1y2b/lI0otlTv4+6ay4FGXrb4k98OgTMs0S4g4exbqYYFodYNozGlm7BssYGMicXkikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NVLnpNin; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NVLnpNin"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6000f2f217dso3504521a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747665974; x=1748270774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSIIDWdlqzl+xIuuE81sCKCMdcV/4Mu0UdNur2XU8WE=;
        b=NVLnpNinjsxwodqNq3PLfg9H7QHfIQpxuRN+0rm8rlFucaic3zXzm4zhW0udf2ugah
         Blqg/iSSaGPoOzG33syt2CiiOZxOPoxUlAeq3TsIKzqdf/qP9rW97+vcAih88v3bcgoh
         klz+Ieyo/R48GUo5I7o2A+nI4R7hzev6QNTHW2JpiKHyMpN3NOdz1waxOwxaTcyrwoBk
         HqvOfdPIwQjKd1sRg4PsvPvmWFWHB5oKCXPnJf2GDg+WABlY/24EFy1vAjymRxU0ob6H
         L7FgPIxqVkqH+GTQwzTSw+k8gVycoYCgh4PC6S0SgSTe134ktkWNp4dPUtuj3IX/jGhp
         tLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665974; x=1748270774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSIIDWdlqzl+xIuuE81sCKCMdcV/4Mu0UdNur2XU8WE=;
        b=QGS7HHj9PDjOaAsorn9u0zlASlVj0tuo/3tSXrmGTkyhm0GVXVrbDWZa+LMMul6Nj/
         M74I4GmELy3GZm0aUueKnWlqnud03zIqAClGK21c96pJFcNMfvuTR6AUwMFPCSNVkdcm
         75KDWwO2H7+00yQmzFT/5YRGSofjf0hyU73lNmU+KweNG8IYcr/CrnvjdY/3ZnfKxcT9
         PntcNauc0qN85AXE074BR5Iw+QfT6PUKH9r3n5EP1ym27Bb+uKjqm7QkVYXwM2nh068J
         G6shPciMfBXfCIcITvwPH23GtdoklfYduAF9hRWPFw2uNNOrsgoHwdvyNx5IIgb/P/6r
         TJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj00T8Gu9RoXIItYW204Gj2u9DR9WEOVxwIds50OG7CyQJKM9VgUFmTdIBidr8Sa2yr65nV25Lw2NC670=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjyse6zu2NRfl+grVEJFgJbpckhCBO5RzOR5xMA9B05AMp+tlW
	Pm2JvRBrN4j1DOlW8eYGOEtPUfyKxQPOmvs8LITcZGTywcqRUwNAFMb9nDjnpjbJ1w==
X-Gm-Gg: ASbGnctZhsgVmlrG3r9Iuz8jt34JI9UBFAb8HyuYVod0EPtMNbMTc8tNNOUB0Ht2cf9
	u7Q4SYqXretkA4Hdtblo7mJ9xfu+cfBUC5XU04ifCnf6Itn/8x2H/u3Uo9Ne4TLflCNXu/AroX5
	Hyz0WrfWgdmLPbV1gQV63qYSEj0VV4np2M5p4Fp5A2q0DKAP7zNYnbwb37MzawuBN8P7FWljygn
	PKw6rFER6a00XqTda/Um4nyhrHZ5VaE2XHTzZ8AyHUezJi5WiZkYazw2BbN4Tz/SyGBJ9alckuS
	h12XlZhJlXJ9k31UHPTvgPSaU78JFLn9hgdjtTrBXes8t93O0I37pg48YJnaum4t0ac2TmM0Wtb
	HKMg2PVWOeQ==
X-Google-Smtp-Source: AGHT+IEC3KHkrShBXny3Q7Ir1m0+6kZ8RmzKZn0Y25hUeD6jm+0Maqs5MW8iW3AbNc6hR400bbV0fQ==
X-Received: by 2002:a05:6402:4415:b0:5fb:1c08:d8f7 with SMTP id 4fb4d7f45d1cf-6008a5a8caemr11231023a12.12.1747665974299;
        Mon, 19 May 2025 07:46:14 -0700 (PDT)
Received: from google.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e5383sm5849380a12.37.2025.05.19.07.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:46:13 -0700 (PDT)
Date: Mon, 19 May 2025 14:46:10 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4 02/10] KVM: arm64: Introduce for_each_hyp_page
Message-ID: <aCtEMoZSCfRAPHXN@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-3-vdonnefort@google.com>
 <86a57cg1bj.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a57cg1bj.wl-maz@kernel.org>

On Friday 16 May 2025 at 13:57:52 (+0100), Marc Zyngier wrote:
> On Fri, 09 May 2025 14:16:58 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Add a helper to iterate over the hypervisor vmemmap. This will be
> > particularly handy with the introduction of huge mapping support
> > for the np-guest stage-2.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index eb0c2ebd1743..676a0a13c741 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -96,24 +96,24 @@ static inline struct hyp_page *hyp_phys_to_page(phys_addr_t phys)
> >  #define hyp_page_to_virt(page)	__hyp_va(hyp_page_to_phys(page))
> >  #define hyp_page_to_pool(page)	(((struct hyp_page *)page)->pool)
> >  
> > -static inline enum pkvm_page_state get_host_state(phys_addr_t phys)
> > +static inline enum pkvm_page_state get_host_state(struct hyp_page *p)
> >  {
> > -	return (enum pkvm_page_state)hyp_phys_to_page(phys)->__host_state;
> > +	return (enum pkvm_page_state)p->__host_state;
> 
> I'm not quite sure why we have this cast the first place. If we are so
> keen on type consistency, why isn't __host_state an enum pkvm_page_state
> the first place?

Purely for cosmetic reasons TBH. The *hyp* state (as you've seen below)
really needs accessors with some logic to decode whatever we store in
hyp_page (the _complement_ of the hyp state in practice). So we
introduced accessors for the *host* state for consistency and obfuscated
the __host_state type in hyp_page to encourage the usage of these
accessors. None of that is strictly necessary, though. And the explicit
cast can go, it is already implicit from the return type of the accessor
and the compiler should be happy enough I think.

> >  }
> >  
> > -static inline void set_host_state(phys_addr_t phys, enum pkvm_page_state state)
> > +static inline void set_host_state(struct hyp_page *p, enum pkvm_page_state state)
> >  {
> > -	hyp_phys_to_page(phys)->__host_state = state;
> > +	p->__host_state = state;
> >  }
> >  
> > -static inline enum pkvm_page_state get_hyp_state(phys_addr_t phys)
> > +static inline enum pkvm_page_state get_hyp_state(struct hyp_page *p)
> >  {
> > -	return hyp_phys_to_page(phys)->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
> > +	return p->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
> 
> And we don't seem that bothered here.

Cheers,
Quentin
