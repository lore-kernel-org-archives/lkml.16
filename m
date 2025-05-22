Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68972638BA
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902020; cv=none; b=CYE5iqeXU4cBIScDbRJutxeCf9XfZAZwNo11/21vFsnonIAO4igRh5wu1fyfeWGpLL6U51djKHdB6iKruD4jRAoiz96bw13eHpKVA13l+W+z38+3soHL0skuxkB58UOOES1Px32Ftua4ZOnxDcEk9QtC2KcHdghl2f/5HGSUGXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902020; c=relaxed/simple;
	bh=H5WO4l0lMwPhufkFAFJJF+7x6CoP4lT7Mp9z3TVrCvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrRQY0jfT3CDZ1auP79b17+h2tDGKM+7ukecDIZYZXV3x3oSP9RGdqjZJZu73T5A+X4H2TROWN1k6F0igi6W/cqPWqCxNQa5yL9xkYHdceQHftZaK5eiFXaO3PVtzhPqXzQPRUSXkMRTQjvJZRsSCBC8Szuxf62ye8B2gBdHxjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Ozt5v6zl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ozt5v6zl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-231f6af929eso62104795ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747902018; x=1748506818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RcuFGqMF/ZgB6n2L9RXkll3Uqc1w8n3CtfrWdVWfP90=;
        b=Ozt5v6zlO/Sv87cmdyRoZXc2xsMAAXaw3oQcM3xMR31eisU4VCrEXCgLngL5qUCi4A
         4tzwrFrIIZMrUNt54iwAWtL52et+16H1mYeRnijwTzIRv1W9LMdOYEqbGzd7rfyiwqkA
         LJCz7zNPWWKBV67Mi0scgx4joex3sfeFYAfuSEmx8Gp3a2sxB41ako3RNyvdgjLbYJNf
         i7VyM6LgOTKhabSPnXDOJIVw7zGyxOBF5WIpeiEBzRfOZOPuwUa7supdF7KdlqKh5FUB
         /AsS31PWJQ5Wr5nlWg2o07cOS0xxKkHRZ7US3UTEqBf93D1XutWupNPBIoQluDqkw8HA
         OfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902018; x=1748506818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcuFGqMF/ZgB6n2L9RXkll3Uqc1w8n3CtfrWdVWfP90=;
        b=ka29Ne3kyYPsuzdHQP9Z+0n4hIISMtoqQPLkppZBv5p56SbZu7yIY2qNEeg4a457og
         CPbW4TKxf8MnC6gK0us1R/2zRQYDNdxWIUvK6Gd9MT9iDZQzhxn6er/NHaXNhoA6Kb6G
         l/zTax1ewfU/ig1HJqLT/3EtzijJoJFUIzwu174VNNDfpA1LQqWRSdK4DD+VJxmYLoaz
         bdn2bb4nyPk+CbAYtEsWw2WrWdb+N3/cf+YokS4lpPOJdwyDdZ8FFgk6wt532V06oka6
         xbPefQXhtlYieGyiJnpicgLcFDMZx7APsdhYjPJncCflfPiwrAGFj+qLsGGOCBu7FOld
         UJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCIMdi2R0qxUY3bZKbVlL+80Y8JXDseWHkBjlIqBPMRm4RrgPmW7Eps3I96BNDUmLn7VzIM9t9xk0D/w4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8AQtFgpmDT16qEwM/c+FHU222EfEKrYbVGEd0YBrLi399ull
	nClBtw/g8VFp7027jklXLClMVP5+QxoeaaGgQSnxLOkgecCzEla+bCrQBR1XLIxH6NM=
X-Gm-Gg: ASbGncuIOUMwMBMVq0DwKip3UpgITcTokPlSuPQOqIwdEO1wf+YykQ8/MXXOGP3wE9l
	Jw4rMupN08iAopyl7xXsl3HRB/zsu+RMpHUmzVzCO8NNNn9gKdKMSsZFDAm7EBp/SE5Dn/+Yiip
	v3Deb1ZG/s8jklCo248H6SwwhLRxUGmkElw0ZRCirHpyNTEpyLBeGfIiZ1GcHuPugfogLjP9yLz
	RZU+zVI/CNwp2j5s40SnSXX80SAFbNg8KP9usDbII+5jl5Lsoikgk8mxY+cdyoZmsFel5I9/dGz
	rQlxt+Lq2F7yERgBYNd2M9CnzRimCW7mhs6qV+Ox4L10gl1S2928LA8EpPi8
X-Google-Smtp-Source: AGHT+IGWUWoZ8nlB1v4QhGuyYjXUJIGpjeTdY9aoCLZrIG7jsg9/EnwS5AkAfpjE8UnXzW0/hfZx3Q==
X-Received: by 2002:a17:903:19c4:b0:220:e655:d77 with SMTP id d9443c01a7336-231d452d0e3mr353009895ad.36.1747902018137;
        Thu, 22 May 2025 01:20:18 -0700 (PDT)
Received: from cyan-mbp ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adca4asm104828005ad.78.2025.05.22.01.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:20:17 -0700 (PDT)
Date: Thu, 22 May 2025 16:20:13 +0800
From: Cyan Yang <cyan.yang@sifive.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq
 vendor extensions
Message-ID: <aC7ePdD0bNhi48kz@cyan-mbp>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
 <20250516030310.16950-3-cyan.yang@sifive.com>
 <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>

On Tue, May 20, 2025 at 11:26:39AM +0200, Geert Uytterhoeven wrote:
> Hi Cyan,
> 
> On Fri, 16 May 2025 at 05:07, Cyan Yang <cyan.yang@sifive.com> wrote:
> > Add SiFive vendor extension support to the kernel with the target of
> > "xsfvqmaccdod" and "xsfvqmaccqoq".
> >
> > Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
> 
> Thanks for your patch, which is now commit 2d147d77ae6e96c1 ("riscv:
> Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
> in riscv/for-next.
> 
> > --- a/arch/riscv/Kconfig.vendor
> > +++ b/arch/riscv/Kconfig.vendor
> > @@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
> >           If you don't know what to do here, say Y.
> >  endmenu
> >
> > +menu "SiFive"
> > +config RISCV_ISA_VENDOR_EXT_SIFIVE
> > +       bool "SiFive vendor extension support"
> > +       select RISCV_ISA_VENDOR_EXT
> > +       default y
> 
> I guess this has no dependency on ARCH_SIFIVE and does not default
> to ARCH_SIFIVE because this extension can be present on non-Sifive
> SoCs, too?
> 
> Probably I should have asked this when the other RISCV_ISA_VENDOR_EXT_*
> were introduced, but at least for ANDES I already know the answer.
> 

Yes, you are right.

ARCH_SIFIVE enables support for SiFive SoC platform.

RISCV_ISA_VENDOR_EXT_SIFIVE enables support for SiFive vendor
extensions, which are not limited to the SiFive SoC platform.

> > +       help
> > +         Say N here if you want to disable all SiFive vendor extension
> > +         support. This will cause any SiFive vendor extensions that are
> > +         requested by hardware probing to be ignored.
> > +
> > +         If you don't know what to do here, say Y.
> > +endmenu
> > +
> >  menu "T-Head"
> >  config RISCV_ISA_VENDOR_EXT_THEAD
> >         bool "T-Head vendor extension support"
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Regards,
Cyan

