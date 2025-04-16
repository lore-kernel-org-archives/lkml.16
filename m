Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28322F17C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790310; cv=none; b=W8mNEpEHHTIDJ7EDlM1iqSM83h0e2JUWUZ9dQUBL8V17PKkH2KklwBOHlFPBp7iU9y25CMgRh/5awBcYmPbdfB2+EFMCN5T+2rJu0b4KmmEM81MkwqcWzMZ4tKG3UnRxthQ0fmQAK8bWnl5tO4z8V7fSMdxKEbDeffC2ZFCIM1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790310; c=relaxed/simple;
	bh=WClZJphPAKT0rCGTksIfI63WVohPmsRPXLuc0VHL8mo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGcE9jUXBCk29Lv0kXdZ9IoTZBkzpN6xOGOM7w29bYIfQmQpv4y6EULeKECuWKZj3AFqy4nXb/2jdazreclCszfKw6Q8X+NGKLaqKbRcYQQI3h0srhNNtfnDlVf1h2P8cBcQuRexC5ChY5RTAkCxO0kgpRHf9/oL8eT9kU5fpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCIu8K5z; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCIu8K5z"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549967c72bcso7945052e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744790307; x=1745395107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciwF18FIoSl6flinaBgsXEg/q9ARKYCF47qL/2Ga2hg=;
        b=aCIu8K5zsdjuxk0w9EqWnmaiio8wYhZPehMZ5dFj0VrpLeKf3nYQR1fKYa29z/rDOD
         JR57pNeH2QHrMWWo/hEuc9cPeWJnsp+JpbgcHw1+66aMjfWLVnmw1iPItnV7z6aRDvvz
         fLEKjJfklWfardDDAbHiox/VyRkgdsNcAk06ZPI2S3BXEWA3GN0SpT2KEBuiL2QKT3mg
         Hp9VK0uzTB2bZ7o6MBfeKMMzKIu2sIyxYtfGjzaZzTs/DH7Vm3TznOEd1zkErWoOPjN8
         TKzj9v/nj85aoq+n+zLDt7XMLjH7yVKcMRKT+JJKmA0cYXXf5nROg7wUx0UQtZmZkbET
         tCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790307; x=1745395107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciwF18FIoSl6flinaBgsXEg/q9ARKYCF47qL/2Ga2hg=;
        b=wwjlPMq+ue3WNqUHLnkLWAj1QphAssNePR4i99VmqQutkr+N2751kp9Yx6JjbUodKy
         e+jtJrif6gvUh+FRoR0lHKYHnFMjs0RX+Kgsy4mY7ahw4dY2NsTx2gyCjODbtQ+u2EER
         lhBcOgqOvaJ+jsGVTVkgOaAzL/Netvxn0df2PnhJGzy5QdUsFAOyGppo0qCawgkMg668
         ErvlHk2izTyU/J6erCnVkxhkNuTxN1WZWvgoEccSqYRA+COK8/PApxd/q1q8foa2pb6e
         eW4indoAxqJKTcn7utcKve1+n/cZO2SUDxvNedfyj61KQTZ3DxZ0hjkV+enOz5aK70fG
         DgUg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Vh4FeGVs9SBZrlTMXLyulsA41bzxKo5ucO4a3CKZ/qFoiGtgp+z+hOFgm/X+2tTzcAFFULMKpbtYLok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNU8M8AmZOQy6W+iCCieoOarqbyJYFP80AbtL1l3a5/pyP+jUo
	wQl2KjfnQVoFGIkfAeiAPqc0or+qdasENgfw2AbQCNFs7lLWKKGZ
X-Gm-Gg: ASbGnct+L9U1R8mHF3RnZnTXj1q6ETWQ/mg2RqwiW89uwjMISsYYoK2gAko5aGe6uh7
	cX6awmjX5+Zt7bfn0SEhmouWz9NPHh5FG55URe48ikrwH/9xYsDSzg4PYN3c7JEzzbNN/4yhdaZ
	LEzXdMJABAolB/gbCsKSlLx9+eAMhtGdpttYJpdPKEnaPU8f/nZmF/OTTCT1ZzL+asGP/oOb7MP
	8lASSgpWLfAt7UWMgzx3gk+FRcglCnDHF489WIDuLSBP0Ka+98J1Y8HeftpzSSU4SFpyve1dBHP
	RFiAP7FQMd/G6ATmNJUEWaBykz0S6NtJimecioPXWxgzNejkNWvr4gGlWMFJ2i+Kr940a4d+VV8
	C9uY=
X-Google-Smtp-Source: AGHT+IFr59goIrMe9Y1DI6yEEQ+aVFoEoGORKgWsmeLv/jmbesbGGvwyvpLKpHygYjSjfS1o5n5EFA==
X-Received: by 2002:a05:6512:39d0:b0:545:d27:e367 with SMTP id 2adb3069b0e04-54d64ae6b7cmr259036e87.42.1744790306651;
        Wed, 16 Apr 2025 00:58:26 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d522187sm1581616e87.259.2025.04.16.00.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:58:26 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Apr 2025 09:58:23 +0200
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] vmalloc: Use atomic_long_add_return_relaxed()
Message-ID: <Z_9jH0cO-4AUM3Tb@pc636>
References: <20250415112646.113091-1-urezki@gmail.com>
 <zoxj24qmv3gxng2tz7ypxdlarktygsxjipbrr2opsaxgktrgib@7kzy5px2j557>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zoxj24qmv3gxng2tz7ypxdlarktygsxjipbrr2opsaxgktrgib@7kzy5px2j557>

On Tue, Apr 15, 2025 at 07:37:31PM +0200, Mateusz Guzik wrote:
> On Tue, Apr 15, 2025 at 01:26:46PM +0200, Uladzislau Rezki (Sony) wrote:
> > Switch from the atomic_long_add_return() to its relaxed version.
> > 
> > We do not need a full memory barrier or any memory ordering during
> > increasing the "vmap_lazy_nr" variable. What we only need is to do it
> > atomically. This is what atomic_long_add_return_relaxed() guarantees.
> > 
> > AARCH64:
> > 
> > <snip>
> > Default:
> >     40ec:       d34cfe94        lsr     x20, x20, #12
> >     40f0:       14000044        b       4200 <free_vmap_area_noflush+0x19c>
> >     40f4:       94000000        bl      0 <__sanitizer_cov_trace_pc>
> >     40f8:       90000000        adrp    x0, 0 <__traceiter_alloc_vmap_area>
> >     40fc:       91000000        add     x0, x0, #0x0
> >     4100:       f8f40016        ldaddal x20, x22, [x0]
> >     4104:       8b160296        add     x22, x20, x22
> > 
> > Relaxed:
> >     40ec:       d34cfe94        lsr     x20, x20, #12
> >     40f0:       14000044        b       4200 <free_vmap_area_noflush+0x19c>
> >     40f4:       94000000        bl      0 <__sanitizer_cov_trace_pc>
> >     40f8:       90000000        adrp    x0, 0 <__traceiter_alloc_vmap_area>
> >     40fc:       91000000        add     x0, x0, #0x0
> >     4100:       f8340016        ldadd   x20, x22, [x0]
> >     4104:       8b160296        add     x22, x20, x22
> > <snip>
> > 
> > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > ---
> >  mm/vmalloc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 7bb32f498d39..9d4027041a3f 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -2370,7 +2370,7 @@ static void free_vmap_area_noflush(struct vmap_area *va)
> >  	if (WARN_ON_ONCE(!list_empty(&va->list)))
> >  		return;
> >  
> > -	nr_lazy = atomic_long_add_return(va_size(va) >> PAGE_SHIFT,
> > +	nr_lazy = atomic_long_add_return_relaxed(va_size(va) >> PAGE_SHIFT,
> >  					 &vmap_lazy_nr);
> >  
> >  	/*
> 
> If touching this, maybe a step further -- I see false sharing with:
> nm vmlinux | sort -k 1
> 
> [snip]
> ffffffff845cb240 b vmap_lazy_nr
> ffffffff845cb248 b nr_vmalloc_pages
> ffffffff845cb260 b single
> [/snip]
> 
> If this is used enough to warrant messing with eliding a fence, then it
> probably also wants to elide some false sharing.
> 
> So at least the first two should be annotated with __cacheline_aligned_in_smp?
> 
> I am not going to push though, feel free to ignore.
>
OK, i see your point. I will check closer. We can place both into two
different cache-lines to prevent interference between each other.

But that will be a different patch.

Thank you for the nit!

--
Uladzislau Rezki
