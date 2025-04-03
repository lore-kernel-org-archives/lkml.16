Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C22C23F42D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664969; cv=none; b=ceU3dyVwziSEDPhUUmLc1fpFcEiSgIHmEgCBBOf4nc9Et6ODFqbi41/64jrjDPVrTXhGse5wT2uivY7GEs+KgnRjV13dhbnpp2UnBRfj9Yp5nT75MLXJ7KlHG04frtKI1x0JwsM3nHFMFg0wFzUchxcydS5YR1YI+9q6aGVusjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664969; c=relaxed/simple;
	bh=FO410BSFVlQOV0QN78f0n3VXDiOcSF0PfN3Jjykz7Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcFiCif0vgEYAqSbjY4apZJOagefwItjMaTMXsybz0SLVxK9MbAkq+xEKqmBgqJoAoFmmSLVXHSyl9r+8nW/EtGnZOih6AIwm9yLJmF+zR/Pswl8sjVD8NrloSM9f1o7S6z16dhah/MTm3+HECBgOK+uGcA1vS0/jHWBnHMdf0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TSWHoy7q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TSWHoy7q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so2692845e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743664965; x=1744269765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qsvZgx94LpNiH7bsvaOm+wd6d767CLq7Qj7GevcR80=;
        b=TSWHoy7qKAJt/HvzZu7+aNWc/lf76c6P3FMLZGecoEHISZbHjLkJwTwBJvRkkFlCuB
         je5/E8o8OgYzmmbxI09Q82omAvb9Y7SwN9nWypinosLK+y1EpsAxtd4vtsXaMjPYWrsw
         qwDS1eirPVc4q8l5a+QoLW2FdqSSCV82qKQULOo0896D9VECI8y9j7CeOqWxmhEaSjon
         gdmzAVaNh/nitcYkihhTK4E6CMQRaHYoz0upf6e1uhxOjBsBYNEZO3PZdyTzJ3i9Uhku
         bDCnBNuZmpelIhc+s6hnzi9nz663hdruU8L7Sit1zVX066zjA/m0jpINDwgoSdRQvVJd
         B5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664965; x=1744269765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qsvZgx94LpNiH7bsvaOm+wd6d767CLq7Qj7GevcR80=;
        b=r8lNL710SsNKIWLwFDP9iupIOBe4PD8ODwqXJq73qINBNb8rQiMIs7XgkSJHUA8oL9
         3lT7iXfW44t4Npi+z66gm3xSr1/8v3PyRjQFCSwdICFwfNwqAS94JPVuwbQamMWlMr1i
         Va7YC9C0qjlzZPMq0G+IeYH7hVBBm5xcmEVqU9mKo/cubqR5xmbif+wTZQdnFkj8kLWD
         asuTfT2dG6mniu+UkZQtChm/K+uM8wJ+awVyemEVywHQ4CTwwuRkZHrdTWlTd9h8ojqr
         MApyj+/15go9aDSg6rnVOAH0FE+p4PXXwVcUIVLVr38B0TDdp2Sq+AX+jCK1+8KPDOvr
         xxqA==
X-Forwarded-Encrypted: i=1; AJvYcCWycD55TsEXBrbmcL+PePbWQ9uBy+TuOH7NaVifOFNmZGk/+fSrTLScPYS1dN+83uKMZfdih0/o0G4S6Sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQe0Uih5roC/25vuhpkkwM5Ww3DO7Ypyo87SswMwkHilKQcHm/
	Mxs3Da9xn66VkijllHAqOvL2R9jSVv9dCR8PWgnwqXPJXHTDyECFUZ29mVoF2mE=
X-Gm-Gg: ASbGncu7bUiuuZzWCQ4Pb5eK4xdT7AMNIfec5kCccEahowEleSsYsDHgrloGbdBVaF4
	5q2s1pOzkfV2putaCIbW7PRSGe1nNLeh+QOFwfXEsDRqU8iWOENTUhlRl+SAz57CkgE+dcow+Lr
	dQRT+SUPTgsKhmke1Chh5OP6jn6Iuyl+tvWq5kpoBXSCGNO48lyI6KzzDMQ8sf40S8vdZ+gs0je
	YQs4S9u1ohbd0TbMOHGPEZmADCnd0Ac21kwaMREx1MbJ01k5sbU4BWB2rgQ+xpRWQVJtowWS4Rn
	t9DJiwNP6hHPqBSuBM2pdd55cSuF0O9kvsvaOfw2YNFEG7coFvNX5K0=
X-Google-Smtp-Source: AGHT+IFghQQVMJEwJv3TH5fwoOtmpQiB/vJEk3mApbx86ikuS8MDaGrsUMgmPS2nUiK//ZwBDckelQ==
X-Received: by 2002:a05:600c:1e21:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43eb5c70cc3mr52822185e9.26.1743664965426;
        Thu, 03 Apr 2025 00:22:45 -0700 (PDT)
Received: from localhost (109-81-82-69.rct.o2.cz. [109.81.82.69])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec342babfsm9992235e9.1.2025.04.03.00.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:22:45 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:22:43 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Chinner <david@fromorbit.com>, Yafang Shao <laoar.shao@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>,
	joel.granados@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <Z-43Q__lSUta2IrM@tiehlicka>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>

On Wed 02-04-25 21:37:40, Shakeel Butt wrote:
> On Wed, Apr 02, 2025 at 02:24:45PM +0200, Michal Hocko wrote:
> > diff --git a/mm/util.c b/mm/util.c
> > index 60aa40f612b8..8386f6976d7d 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -601,14 +601,18 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
> >  	 * We want to attempt a large physically contiguous block first because
> >  	 * it is less likely to fragment multiple larger blocks and therefore
> >  	 * contribute to a long term fragmentation less than vmalloc fallback.
> > -	 * However make sure that larger requests are not too disruptive - no
> > -	 * OOM killer and no allocation failure warnings as we have a fallback.
> > +	 * However make sure that larger requests are not too disruptive - i.e.
> > +	 * do not direct reclaim unless physically continuous memory is preferred
> > +	 * (__GFP_RETRY_MAYFAIL mode). We still kick in kswapd/kcompactd to start
> > +	 * working in the background but the allocation itself.
> >  	 */
> >  	if (size > PAGE_SIZE) {
> >  		flags |= __GFP_NOWARN;
> >  
> >  		if (!(flags & __GFP_RETRY_MAYFAIL))
> >  			flags |= __GFP_NORETRY;
> > +		else
> > +			flags &= ~__GFP_DIRECT_RECLAIM;
> 
> I think you wanted the following instead:
> 
> 		if (!(flags & __GFP_RETRY_MAYFAIL))
> 			flags &= ~__GFP_DIRECT_RECLAIM;

You are absolutely right. Not sure what I was thinking... I will send a
full patch with a changelog to wrap the situation up.

-- 
Michal Hocko
SUSE Labs
