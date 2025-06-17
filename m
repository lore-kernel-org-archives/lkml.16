Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ECE298274
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202793; cv=none; b=mCR+sqODGiddHr9bsyzLJJoxGLN5D10ymTLlSe6tRrbphNiiwX5lql8gjlV75QqbQG+N+CncBBugHp3AXwqanHhpjgPmkJLdFxDgJu4k2oWlZOrEzEb2qeCaQ4IHYi3FmCydj4LTzE7PL+2BFQx3PvSJpINUjsh69uU2btSBfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202793; c=relaxed/simple;
	bh=a3Bkx9998Qy+wrgZpWrw+TgJZmcL4kioGkDitnYrc1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8dZ7iLNfAdZde8j3Pllj2LhRGa+XCa9VMKKbk0ZzLoVJBs9JSru2/rLSGe/fBAEUTTcxhDQMKs+BpVctTwJ0XmQZeQUd+z+GB5R8s+bT7y+mcw3WjjusAgEV0tr9hTaNGd75FjCDpNAuuDdsOmlE+Pbw+D+sPNidGVVqfa5TzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XhbX4v9I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XhbX4v9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750202790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bEsBD5Y/shPQUCHjJaNwvlMTpenqDbmzETQpk04GETY=;
	b=XhbX4v9InsRTIVqpn2FzAT5wbRXPU6RuhGiiFeNuzUnkdv13RoWsiltsegIWUQvqSlDTy/
	8jO7yI4QHOl4HnUJsUc0ifjsZv6tkVRiUGyErs6gBX3zMk2wSuw99Inj/XhtIwHgj1Loyj
	Tk9rgdmtaMi4hEQ1rZBEMwLM7xuM5qk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-wL_hlICwOse8ZkYE8SyPfQ-1; Tue, 17 Jun 2025 19:26:28 -0400
X-MC-Unique: wL_hlICwOse8ZkYE8SyPfQ-1
X-Mimecast-MFC-AGG-ID: wL_hlICwOse8ZkYE8SyPfQ_1750202788
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cf6c53390eso617019285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202788; x=1750807588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEsBD5Y/shPQUCHjJaNwvlMTpenqDbmzETQpk04GETY=;
        b=krc9KJXGgH5lCCBNl5tdKinor3B1LXJ72HsSrv59TKpDNI8xQ7Ot8nGKLbKDiQmMZL
         4N1q7JWWVt9GKO6vcJDai67XGAaqXU2jwjDDiByyIYYStAsr1qPc32uwEJ8Km76R4vZX
         ZshAD5alHk/6nCCXxnVOTso7f/y9yeYt3YlaGQ8UMYp+gZRzkaXHnz9y22wCfBk+OgJJ
         GL2SSzTEl2OPQ1G8Naw4LwSTiPOCMpKmW2Uf7DtP6zLgxmOPw3lzIDJHUt2i6TBaKtII
         wmk4KVwzVTd3YP3dbG29cW6mmlnj1aFncOhmhU12M6uaQAuiUMGHFP22ZpaQIEX/n39b
         5ATA==
X-Forwarded-Encrypted: i=1; AJvYcCUY/s76Xcvr9D8wUsEXVPvFak/nxHZhRJ6UAtl2tCKg1fxxUgc4tJWTPHXlQEsm5tFlBsOmjs9pwmy21Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKVnkAg4jQ9FPSil3yny1sYQn754B3x8p91aC8NxaoxscWQ6C
	AUZ66cbnAOW0jNqRXis5Hq4/g4oyYTr57UoGsCyJHAppR8gtlr3/5WGO7HPWUDD2VYqavOwwzpG
	bttitWw7usTREEbEvGqNIQuqSTz5HGrCEmwgGqQ3+5quALCMjRd0XkDgjWo3mplhVuA==
X-Gm-Gg: ASbGnct9uS7ib9E02GjYNUQ49bP2M9C/hmEmZdtHjbIMb5iznixvrnVQr9Mpc/DHuf8
	Xrsr6bBDQ1kQPKb5UoUZg4UTM8XQBiIu8cX9tYVC4wWw3W+/3sNPTVl0c3FF6CCfAvvlQyr2KrF
	YU61oy2a+ZaM46xp+O52VawpdfDIl+lM2D0G7+1jDFYsSyus70opG0/soxKSrjSvH6JH4QQ9USx
	6xyAfvFaN1YAf/4kmQXRfGp3zMuK9Ukon/mCM3r8tlScCTagowqFO+Hx3kVJ4ODTPKJb0jgb211
	6wNCvekACuwqRw==
X-Received: by 2002:a05:620a:454e:b0:7d3:c4cb:1b76 with SMTP id af79cd13be357-7d3c6cf0880mr2064453685a.41.1750202788274;
        Tue, 17 Jun 2025 16:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi3MMf4tNBUwb4DWR6Icb7TRcNxnrJ4m6pAGFQDw3d9WUhT0y7JRmDmGn7yEga4dgomvUXJw==
X-Received: by 2002:a05:620a:454e:b0:7d3:c4cb:1b76 with SMTP id af79cd13be357-7d3c6cf0880mr2064451585a.41.1750202787919;
        Tue, 17 Jun 2025 16:26:27 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dce685sm703341185a.10.2025.06.17.16.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:26:27 -0700 (PDT)
Date: Tue, 17 Jun 2025 19:26:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kvm@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area
 hook
Message-ID: <aFH5oO1M1_TZz4NF@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
 <aFGcJ-mjhZ1yT7Je@x1.local>
 <aFHEZw1ag6o0BkrS@x1.local>
 <20250617194621.GA1575786@nvidia.com>
 <aFHJh7sKO9CBaLHV@x1.local>
 <20250617230030.GB1575786@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617230030.GB1575786@nvidia.com>

On Tue, Jun 17, 2025 at 08:00:30PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 17, 2025 at 04:01:11PM -0400, Peter Xu wrote:
> 
> > > So what is VFIO doing that requires CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP?
> > 
> > It's the fallback part for vfio device, not vfio_pci device.  vfio_pci
> > device doesn't need this special treatment after moving to the new helper
> > because that hides everything.  vfio_device still needs it.
> > 
> > So, we have two ops that need to be touched to support this:
> > 
> >         vfio_device_fops
> >         vfio_pci_ops 
> > 
> > For the 1st one's vfio_device_fops.get_unmapped_area(), it'll need its own
> > fallback which must be mm_get_unmapped_area() to keep the old behavior, and
> > that was defined only if CONFIG_MMU.
> 
> OK, CONFIG_MMU makes a little bit of sense
> 
> > IOW, if one day file_operations.get_unmapped_area() would allow some other
> > retval to be able to fallback to the default (mm_get_unmapped_area()), then
> > we don't need this special ifdef.  But now it's not ready for that..
> 
> That can't be fixed with a config, the logic in vfio_device_fops has
> to be 
> 
> if (!device->ops->get_unmapped_area()
>    return .. do_default thing..
> 
> return device->ops->get_unmapped()
> 
> Has nothing to do with CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP, there are
> more device->ops that just PCI.

IMHO CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP doesn't imply anything PCI specific
either, it only says an arch supports PFNMAP in larger than PAGE_SIZE.
IIUC it doesn't necessarily need to be PCI.

So here in this case, get_unmapped_area() will only be customized if the
kernel is compiled with any possible huge mapping on pfnmaps.  Otherwise
the customized hook isn't needed.

> 
> If you do the API with an align/order argument then the default
> behavior should happen when passing PAGE_SIZE.

This should indeed also work.

I'll wait for comments in the other threads.  So far I didn't yet add the
"order" parameter or anything like it.  If we would like to have the
parameter, I can use it here to avoid the ifdef with PAGE_SIZE / PAGE_SHIFT
/ .... when repost.

Said that, I don't think I understand at all the use of get_unmapped_area()
for !MMU use case.

Thanks,

-- 
Peter Xu

