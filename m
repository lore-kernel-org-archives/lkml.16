Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40FC2E2669
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189169; cv=none; b=lsf1VP4L1rj9Q6aY/yLBG0DVbj03smnDtcbVZzkYuMCgt1c3SmwWbgLD2UAteBID6Fg8iIXk+XkdmNEladOpueu4OVKNGf26bplvgfNB3XbGberYn4ZAduPS+vWieWrsL1fCzYrh9xrbyujiqMADUNgO91BGOki9g/qVVCSoBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189169; c=relaxed/simple;
	bh=F8sGT+/sgtF0uvYnPIHZZx0Lfe8FrbZyk0U6/gz6wZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RokjHapWNndNtkwAjikRMK1f+v4NWljG6BH4mVt+mphgrss/PyLWp3LPJ49wS0CZev/qxtoIBmucbu1LPkJVxq0jwNRGrpNY1UtTaYC6D+bZxDAIy/62WSgkHj7hBFDzA6AvpQKwzQ6w0G6i4bybOvcRzYknp2Z0Bj2WjJ5Xo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7cZYVN6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7cZYVN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750189167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJl3ISS5vZpEM73Zu2QnVbFcIkeedrpFNBWR+QK1Ynw=;
	b=i7cZYVN6MSJFAjq37Y8sZkqitrheGKWNFzOtojrFec5DU05wrDatk1bwAomCMM1QBi/Jw9
	H5JN7Wjevi9EedzE0i8RJvHaGSFFptcjpOihKi2jSx3HFZmB8YffD21j0Ij7QNeZaIbcVT
	h8LVRNKxwS7rnNBNx7UWXUvLnI6NfN8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-9P6EhR8qMS-qke6QR5mGJg-1; Tue, 17 Jun 2025 15:39:25 -0400
X-MC-Unique: 9P6EhR8qMS-qke6QR5mGJg-1
X-Mimecast-MFC-AGG-ID: 9P6EhR8qMS-qke6QR5mGJg_1750189165
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74834bc5d37so8957539b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189165; x=1750793965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJl3ISS5vZpEM73Zu2QnVbFcIkeedrpFNBWR+QK1Ynw=;
        b=bWxBxprTyihsOqJjlKkGC5vvDxyVLgjZVmRnNV8YDd172LrIBXK4yujcH9ACToPSP7
         wR4UXzl1Vn8Q7jvGClJ3p1zN5FeffGH6Bevooz3KNl4+GDKcHoJm8Ugl3nmSc0HRnaTz
         dAME8iySfwig1EO2/5bZDFXHPJMTzj1iuJKmHntIGjbwM5fR5YOJtdKP4zyp0ZfrbQci
         vVzHxROVAHiS870BYDRpBufH4pC1G9cbQ9tpem0ho1diTylyL+wkj4ak9oiQwjpXHHMe
         mq2j2hfIdlMSX+pdRQ/0MNhTZ32GtAGeKMt1bcXdkFrC/ja9awHclzwYRt6xT7dXg2tz
         Me+A==
X-Forwarded-Encrypted: i=1; AJvYcCWZm21GK6QihGM2IzQzhKL117K0n7sAd63aQYVXQ54FTDr6tXIX4e6SCZ67h9/Gv+JeK41PuzujjjnjXFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4t4q++gu2hXrvUBX67GIx1ACKBYFBq5WQWRflPUPVSPXkX+5
	yvdgp45ner6N84Z5XAhh1p125XjG5zpsKjjEyyKUeORvONdx8a+O8eEmpRRukmIse5FNZdVTRGy
	TsdolxVMonzu+mDYO9uNM4PqqW72EN96IGZnnnto+LkXwI9FEaDOuctbP4jkU53Tkug==
X-Gm-Gg: ASbGncsXH++qEo7hFBq3EfIim+X3wOIPjZriRUSjDqCGJRVeoLgLx0d13ZvH6R9WgSY
	LTJ8FI59H6zmDBTYVYsusC4iA7a6qHDd3nxMv7DizkCSuU64n2ynxH4fryBfgpzMf6Q2c477lY0
	AXhV8o+649PisyGCCIadoVUFBzpTB+Jcxx3f8MIY6trOdcGdQbnOaI4fDZUb3hPOQWbBm0Nf6LT
	jimf1QBmOLTd2deXdDkNuhJZXFxhjpzzIOwk3oeiEtpFLayXZkbP/EzTU88kvc5Qu7MvHcphDUx
	LIt8RvZ3coKS6g==
X-Received: by 2002:a05:6a00:3a19:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-7489cffb6bbmr18361942b3a.23.1750189164739;
        Tue, 17 Jun 2025 12:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0d0QqjyrjopZorTKaCRFU/Z21FT70P9cxE4DFi+E6/jbvdkezfloKB99Q5wHRPPT6YtfIBg==
X-Received: by 2002:a05:6a00:3a19:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-7489cffb6bbmr18361911b3a.23.1750189164376;
        Tue, 17 Jun 2025 12:39:24 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm1700538b3a.57.2025.06.17.12.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:39:23 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:39:19 -0400
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
Message-ID: <aFHEZw1ag6o0BkrS@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
 <aFGcJ-mjhZ1yT7Je@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFGcJ-mjhZ1yT7Je@x1.local>

On Tue, Jun 17, 2025 at 12:47:35PM -0400, Peter Xu wrote:
> On Tue, Jun 17, 2025 at 12:41:57PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jun 17, 2025 at 11:39:07AM -0400, Peter Xu wrote:
> > >  
> > > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> > >  static unsigned long vfio_device_get_unmapped_area(struct file *file,
> > >                                                    unsigned long addr,
> > >                                                    unsigned long len,
> > > @@ -1370,6 +1371,7 @@ static unsigned long vfio_device_get_unmapped_area(struct file *file,
> > >         return device->ops->get_unmapped_area(device, file, addr, len,
> > >                                               pgoff, flags);
> > >  }
> > > +#endif
> > >  
> > >  const struct file_operations vfio_device_fops = {
> > >         .owner          = THIS_MODULE,
> > > @@ -1380,7 +1382,9 @@ const struct file_operations vfio_device_fops = {
> > >         .unlocked_ioctl = vfio_device_fops_unl_ioctl,
> > >         .compat_ioctl   = compat_ptr_ioctl,
> > >         .mmap           = vfio_device_fops_mmap,
> > > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> > >         .get_unmapped_area = vfio_device_get_unmapped_area,
> > > +#endif
> > >  };
> > 
> > IMHO this also seems like something the core code should be dealing
> > with and not putting weird ifdefs in drivers.
> 
> It may depend on whether we want to still do the fallbacks to
> mm_get_unmapped_area().  I get your point in the other email but not yet
> get a chance to reply.  I'll try that out to see how it looks and reply
> there.

I just noticed this is unfortunate and special; I yet don't see a way to
avoid the fallback here.

Note that this is the vfio_device's fallback, even if the new helper
(whatever we name it..) could do fallback internally, vfio_device still
would need to be accessible to mm_get_unmapped_area() to make this config
build pass.

So I think I'll need my fixup here..

-- 
Peter Xu

