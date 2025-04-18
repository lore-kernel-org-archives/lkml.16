Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E62459C4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745016172; cv=none; b=ckihPlg1M++TMoKb/FOHhteRTRuc8K+0Nn4cu5jZ7aqzlBCG1d3u8VC7ckKJKxAgiAf5SNb7n4BXnw7hfAwX84UT5lliuvVx2DecxI8FkSe/8wNKBDpgwMGRQht6MrEcA5veTgU7YtCJiWTjQNdMkojxHr2SozcE+ectG9P6Pwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745016172; c=relaxed/simple;
	bh=t3X+pA7d7pe5WgVZwVbsVFHqami6c3DEPhTKhsdbi1U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOopb8faiScHv4ORqK2YfkPbyPrS/owhsoO3NH2EWSgMWRkdwObbU0K7pDMlfbviV8qxQRVw09rbFINJjBGGcTdr4MG+83AvXscnXGcJAameSxm9tNJwcRuYTJNDcJZT3lqP0AB/JuuyL8n+3dizIyDbgZTmYx3H1to2BxRuDxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdrhqLgf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdrhqLgf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739525d4e12so2023836b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745016168; x=1745620968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgmTL9oN5DIMe3Fsp6gnWf0VH3wcE7YG+W1w6XJGAF8=;
        b=kdrhqLgf+CAJ6dQrTqoB5iMNkXqPk4J20jsgPIqyfHHrOqCD6zWu23EmmkhqGkQ18m
         KeiyC2J6XDpsQThj/OVO1j34XE9DzzQOP2jQXncSFstiJJivEXbm6GAK2EoGnvjUewAd
         8b1TAYxHzSYSWebg7c/2vlbrOPhgdCq4ZoZ9mOdiT0qJzpHbojeMDRTR9FGFVWA1GEP6
         FXBHpIBQwx4itAhYWY65/VJ6UID0W/4hNxDtVF8xv2FQVgbIpZugkUBs9xEmu9uZ6j86
         xf33jATY11ykqDN1fVvoqeQN2fAEXMJKM5901g6ns7tN5TRjiWWuoJrSgpFjpVk1x97w
         IrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745016168; x=1745620968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgmTL9oN5DIMe3Fsp6gnWf0VH3wcE7YG+W1w6XJGAF8=;
        b=bgX204Fm89PAw9wdN9p+tddar9HGjR70BvWtl2lJT37bHKX5SUt6ap1pstf96iAreN
         TNjzq82B6N24iD7Ycxc+Bh3H5MJGUxsqwwaPAAL3XTgpJ0kzKCZGqVDojRfX3DFdjlGX
         mAkyhntt/f7mgxzvDdfu4CBXejQdW4JpUXkOs/zrHlylSjyEK/1R9kGoLiA7aWehx/K7
         eARZc3BjVpM4k/Zjz9JhGRGJf2ob13IA4esXqL4I+9ZWNr7pWfC4sXAo28cKgpAZZHYR
         Eh4uA2RU0bJvMC4rf++LXWinfH4lagCpOXeZ2Ss4Mz0Ko9bmEvyIJZSPd/UeaV7J07I8
         kpRg==
X-Forwarded-Encrypted: i=1; AJvYcCVzqynH6youUqPG5u8u8PqctSbgFQB6T+DquzCVM7L9c1BWQ5fWA6XOT0/+juE+Dv8V4hLTt73b6RhpKGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7NOquXISWLp2L877re6u09Q6xhYXhz7LzVNsxXubgK7zL23B
	7hF2vyOKose8ootmgfHJvrcC56lrJ2tk8TYj3AcetMCUSJWOP1jM
X-Gm-Gg: ASbGnctyjFky0gXpAPLmV0I0cRXDwQMZdoKGWpILJFQm5caROzi2ZSPGPIl9KuRS8te
	/oOgBQuzsk8n7yyrc1GOEJOcyb8hlJslmLNgejgK6TsRUqfWpNnoDe15qs3M/bB5Q/0RHeZVDBp
	1KhOd2HEjZI6ET3tpMYoW61L6S9BY0Z3ehZ2QU2KMorJefGmz4j3KGBMdhi+hb7xxduKRP+OGHZ
	Z567d4Z4a0wdcTads6HYC+KiIUWfUgQaWitKI8PP5xuvCduHSeGfLxtTe6jZcoRR/g1mBp7WFog
	G5NB4ydiA3OMy+nFFaOKAwK4Er+EsMdiYEoU
X-Google-Smtp-Source: AGHT+IGgefdlO0e//1jWeM5CqboYo60WpnvHsKtXus2GnvC33Rp2p8SbJVkWXMYbmcIKQvXFijMZOg==
X-Received: by 2002:a05:6a00:4c17:b0:736:57cb:f2aa with SMTP id d2e1a72fcca58-73dc14d34f3mr5438974b3a.13.1745016168262;
        Fri, 18 Apr 2025 15:42:48 -0700 (PDT)
Received: from debian ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm2126398b3a.83.2025.04.18.15.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 15:42:47 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Fri, 18 Apr 2025 15:42:45 -0700
To: Matthew Wilcox <willy@infradead.org>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
Message-ID: <aALVZdStnPQ-d9PA@debian>
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
 <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_XmUrbxKtYmzmJ6@casper.infradead.org>

On Wed, Apr 09, 2025 at 04:15:30AM +0100, Matthew Wilcox wrote:
> On Tue, Apr 08, 2025 at 05:49:10PM -0700, nifan.cxl@gmail.com wrote:
> > From: Fan Ni <fan.ni@samsung.com>
> > 
> > Convert the use of &folio->page to folio_page(folio, 0) where struct
> > filio fits in. This is part of the efforts to move some fields out of
> > struct page to reduce its size.
> 
> Thanks for sending the patch.  You've mixed together quite a few things;
> I'd suggest focusing on one API at a time.
> 
... 
> >  out:
> > -	trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenced,
> > -				     none_or_zero, result, unmapped);
> > +	trace_mm_khugepaged_scan_pmd(mm, folio_page(folio, 0), writable,
> > +				     referenced, none_or_zero, result,
> > +				     unmapped);
> >  	return result;
> 
> ditto,
> 
> >  	result = install_pmd
> > -			? set_huge_pmd(vma, haddr, pmd, &folio->page)
> > +			? set_huge_pmd(vma, haddr, pmd, folio_page(folio, 0))
> >  			: SCAN_SUCCEED;
> 
> I feel that set_huge_pmd() should take a folio.
There is a patch on the mailing list for it,
https://lore.kernel.org/linux-mm/20240817095122.2460977-5-wangkefeng.wang@huawei.com/

If the above patch is needed, do_set_pmd() should be converted to use folio.

Fan

