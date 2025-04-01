Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C93613635E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472227; cv=none; b=JV+QxMnzzOJ54PVYX0PwkKk8Ogf7eAFnty2SgZtt8nZOi1/bfBrusK7gtFqgIRqw9mER7fOMlQJHaR/vxMt7vsC5DrQ5ogZI5dqceGvQGmpsdtbMH/XZGf35tr7McskxLfXP/jhWnBuuKIhqCJnzhygU6+GcbUqe0an07mzhW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472227; c=relaxed/simple;
	bh=+ouH6MfI+4ZLNik7fBSUo+bubc71z47WVA/0RfhbfrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLhVHTUC3pR6I0qDh8S9FQbu6kCc50xMXCJhH6jF/wwyQpRDY6Hfh5NYB9YF9nXjIm7JYoogvWy+QOGWDhaAuYvxByru7qafhC6qfHJVPDVP4P3g1HCHWp1jkz9GbXktRmixRle7YqT2QIgftGYh0Qt64oVCKw4FEJzmRfLa61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK82w01b; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK82w01b"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22409077c06so136979585ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743472225; x=1744077025; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DR6/7Rb3+f7hTr23XIdL/GaAPLwuiXpD3LtU+Twlhs=;
        b=NK82w01bQlSmIvti8nfjuD/yhQoh+AZVTLbbGKVvdxYToei7eHb/KkZshcdj/dcu6Q
         e3IYY8RcagB9x/+TwOrowhYXf9qfeoDQK0ZT3J3FgHWVULvxIfJk/c2IHRGPk29+ocIU
         8ozyyk6wtyCdA700I5sU3SapifGpze1Vxv/GsGQxmP4ni6ne6/chkvk69lIlZKR7bDqy
         kgwCh9dD5r25AiqAergyRW3fYiRtjlCwKFEWqiQVBC/Vgqc6mk0snvrLbRhJsMjls6Gd
         T40jbSLiTas8n0Wv0h4PSQpQTg+mfxS3LgJPXqDB0EGRaS28icFhkT7sRz3pUqmM4vJQ
         qVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743472225; x=1744077025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DR6/7Rb3+f7hTr23XIdL/GaAPLwuiXpD3LtU+Twlhs=;
        b=tiZUNFnus6CLdQfQ6Z53NxuK2BT5NkBjIvAAdtGgAuHtGnsLHyX8QEy1AVYqiaPbl8
         i6FtOsI7NSKmHpZzAoVQPh7BCBQV5wTmzvC5r1LQe4WVFoMmyQhUNHnfUxWCDvQSBQci
         th9uYkaw8O95jvZK8ncJ5E0Kc8y8LNGyXGosZrkcnd4XrmAnZh79HcCNhE7u7AGSfmvq
         kvW7N2f1NdSC1UYBXOYHB8PtBIcq0MNbXAWFxi95cI7zKBB0irmrQ0htBzFWpdbC4zsw
         FN9Hrw2a5v2G/haLIcWkOIsNTKMtsprNCOV7zbBni5TImg1bdhMK5lMezUrUu0EUIvi9
         RtMw==
X-Forwarded-Encrypted: i=1; AJvYcCXxwh+cwQl/1FlvJQp4pjgJkr1XXgmfIsKYrbZX1E1h5bootvvEByNz6UDFAhlmma16saao5Cu1hbnu328=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNuDgXp8jPcCd23dfIgvb6krgl7YMnKoud7u96gwBoqKpEM2c
	HsGY+5GB8e+U/rMI2pkSycgbXdzdI4DA/GskvT0nzL5L5HXsOt8wVaIuB0KZ
X-Gm-Gg: ASbGncsJoySAZqc4cMOvAvhuA3FUG5Zi0KwCSg1R4I1DBPNR1DE9wE2H580mb7vLQWC
	RbNckhuJAXzpG5rR+OIQEVLSQMTIqGSZEGxDTw/q+JHeaXfN7uPyrD04jKKFrh8+qu5h5lWqUVB
	BLkvW9hL++Y1RHvtVaAQFXtVXsGMrRpKa69lP4U+BLz6pHKd0AqV9/Qkp2n+KAbibg1XNhRhFXF
	XmbHqCQZnG1DLhF0THbxlSbmSUe8Pf4+dpWqeOhI+jDE42nupaArdHtSrX2Aqev+GaBuau2BpEX
	ykiiAUnu9OJbNmxS5KzX3lddqz5c/jeq+thu8FlmGwNDmmiHsA4eLepznI6AS+Bo29PwtdPJJBb
	s
X-Google-Smtp-Source: AGHT+IHtI0piyfctYHl/2LDM631SG2KQBeqHfKgiXx+fJ+ld+X2QEuuYWayk5WgzDYrz5IBcvUxxzg==
X-Received: by 2002:a17:902:e950:b0:224:2717:7993 with SMTP id d9443c01a7336-2292fa0e25emr168033925ad.45.1743472224684;
        Mon, 31 Mar 2025 18:50:24 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971063dedsm7944649b3a.96.2025.03.31.18.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 18:50:24 -0700 (PDT)
Date: Mon, 31 Mar 2025 18:50:21 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Huan Yang <link@vivo.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
Message-ID: <Z-tGXf5mfTclxZgl@fedora>
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com>

On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
> HI Vishal,
> 
> 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
> > Currently, users have to call vmap() or vmap_pfn() to map pages to
> > kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
> > without struct page). vmap() handles normal pages.
> > 
> > With large folios, we may want to map ranges that only span
> > part of a folio (i.e. mapping half of a 2Mb folio).
> > vmap_file() will allow us to do so.
> 
> You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
> 
> how to use, maybe I missed something? :)

I took a look at the udma-buf code. Rather than iterating through the
folios using pfns, you can calculate the corresponding file offsets 
(maybe you already have them?) to map the desired folios.

> And this API still aim to file vmap, Maybe not suitable for the problem I mentioned in:
> 
> https://lore.kernel.org/lkml/20250312061513.1126496-1-link@vivo.com/

I'm not sure which problem you're referring to, could you be more
specific?

> Thanks,
> Huan Yang
> 
> > Create a function, vmap_file(), to map a specified range of a given
> > file to kernel virtual space. vmap_file() is an in-kernel equivalent
> > to mmap(), and can be useful for filesystems.
> > 
> > ---
> > v2:
> >    - Reword cover letter to provide a clearer overview of the current
> >    vmalloc APIs, and usefulness of vmap_file()
> >    - EXPORT_SYMBOL_GPL() instead of EXPORT_SYMBOL()
> >    - Provide support to partially map file folios
> >    - Demote this to RFC while we look for users
> > --
> > I don't have a user for this function right now, but it will be
> > useful as users start converting to using large folios. I'm just
> > putting it out here for anyone that may find a use for it.
> > 
> > This seems like the sensible way to implement it, but I'm open
> > to tweaking the functions semantics.
> > 
> > I've Cc-ed a couple people that mentioned they might be interested
> > in using it.
> > 
> > Vishal Moola (Oracle) (1):
> >    mm/vmalloc: Introduce vmap_file()
> > 
> >   include/linux/vmalloc.h |   2 +
> >   mm/vmalloc.c            | 113 ++++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 115 insertions(+)
> > 
