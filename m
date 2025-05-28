Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE42B220687
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462989; cv=none; b=fHz091dVjUILgSPBx+slGiwCQpWwwe0La/W1byPxCfpwpm6YuAS2aFMl5jYfPvijLUKJJVcNhWmEAkIlQu0blJ1LH8ZHhN/aZ7ttn32X0rxeHJK7T46kGknr8fXACAsK4EPhYvatuAXQy9TsAdcOH9AcHxJ8JzkA+vqrX772OZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462989; c=relaxed/simple;
	bh=OYjwPIs0TzQA0aRsuoivWOqjA0CM0zUZyAIfgw/GceY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzbmOjkAcNMtLNI+5a3noeWNLbWR+jTReuubkrcMpDgR65PS9h/HKivengKpebMZ4/Q8DLmY4ogGqVXsXvOMoIhNVqUcl7/r1Tp6NRd2IuQ73M/dcooH6N1oCzbl3zfJygUBq4bcBrbxC5x8DmYgjYmgsdR79rlbsyOEH7VTWWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqHtSf8t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqHtSf8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748462986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4epIKwRgyQTi3ZuIRLGasK2wDW5JnSiHLO3mysT8gAQ=;
	b=dqHtSf8tBrvedYBu8uY/+qw34dVANYyb1jIVe4Tt/rzWA4j/bDJfZogH3qPQze1xUKuGI8
	cQPyp1VE1bsHssVVJVfBd9cu3RErVEAz5DQiJmFmQ83tGYPyXuDV4waCNEfz9ktyUOxVCr
	2AH0YJZahPqWpuQ9gCWQvBWZYluZvLA=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-kgSb1Mu3O0iHefr48fEHmQ-1; Wed, 28 May 2025 16:09:45 -0400
X-MC-Unique: kgSb1Mu3O0iHefr48fEHmQ-1
X-Mimecast-MFC-AGG-ID: kgSb1Mu3O0iHefr48fEHmQ_1748462985
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dc9fc7f4a0so319255ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462985; x=1749067785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4epIKwRgyQTi3ZuIRLGasK2wDW5JnSiHLO3mysT8gAQ=;
        b=TpL/uRmKUYEO4W8a2R2pTX5lOPuX6twT2soLBCWEAkfQpmKq9fdFWaEo8o/iJ6SBGg
         5roWaHypebLYQFTKN0jw9ls3yh9FkZmyIeH5U8AyimY/OA1GI2zay3ng9mhv/CHpFr7z
         9rkxJnaH6QXCR68pnlFB89OZ4ut8x6tMFGuoNFJ5XEWmXo1AD+0BiJHWh01USoPOW430
         jENeW9ZyZlWFe10K6EJB8AOzr1NEUxKrgdE+XpbKDt3NMuU5oEcWpIVANOTyhNOhdnEp
         QslrxcCinIDnCqxClD6TdbOtYnWnoWOMJAMHC07Qtd0go7tBoGUoOaL7ZuDmgjMS38Ma
         FGDw==
X-Forwarded-Encrypted: i=1; AJvYcCWapxpmPKcw6RMzRTkQt3Sr/28dRvkALwYowsxMXH1rCWZxiIW1e3/0mbhpP68CO8Ql72LRwfxQbk1a8kM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvox15pTTlb4QwlWm9Mx9jGOdi987LhwnaD9z899iNQFcK1n+5
	2qyg8sx1ghljIv14VpBLnhtPx56uMfjTxc/F8Ycpvizold7Z+MVRCdP7aqIaAfis1AhRoujMXOu
	HF6IHi6nryuX5HvG17t8+jP3HlQDRaufOoairBkxZ2r/TYEPQddC2hdZCSsGVtWTuhQ==
X-Gm-Gg: ASbGnctu2spmX7mK+/XBoOVEMSayvKcvLGd4mJ+IA4T1agnOnzCN+NcBfbcJC2T1wcC
	/WqDGmRgdr33UZoy544/bhNbZEUD3Giw+wv7W+vKMOfXKMQHNATWDmDtnt35Tn4+7ZpSIvmRcJw
	aw9RTYJjmIJMssu06ExsxwWP8609yiciMjv4PaUJQ9c1o7u0WfGK3H5kBSq2Zp15NP8yd7x78ef
	HaxhkUU8iG6RMraPHSsW+wgQxqLG6cPe0RSPr/DIY+zu3lA9C4uEREyZWw/R0Pn+JCAAO7BIHg5
	Uc//n7SHYovr4To=
X-Received: by 2002:a05:6602:2c0d:b0:85a:e406:5836 with SMTP id ca18e2360f4ac-86cbb8f7c9emr552149239f.5.1748462984658;
        Wed, 28 May 2025 13:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1rOZ6iMvniSbx4lNRjQibyiCEt0/JnaW+E8wRrzAONFdZ6+X4ew43SDLHpA7p0VVeDyESaA==
X-Received: by 2002:a05:6602:2c0d:b0:85a:e406:5836 with SMTP id ca18e2360f4ac-86cbb8f7c9emr552147839f.5.1748462984263;
        Wed, 28 May 2025 13:09:44 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdbd4cc665sm369599173.71.2025.05.28.13.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:09:43 -0700 (PDT)
Date: Wed, 28 May 2025 14:09:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, lizhe.67@bytedance.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for
 huge folio
Message-ID: <20250528140941.151b2f70.alex.williamson@redhat.com>
In-Reply-To: <20250527234627.GB146260@ziepe.ca>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
	<3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
	<20250520162125.772d003f.alex.williamson@redhat.com>
	<ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
	<20250521105512.4d43640a.alex.williamson@redhat.com>
	<20250526201955.GI12328@ziepe.ca>
	<20250527135252.7a7cfe21.alex.williamson@redhat.com>
	<20250527234627.GB146260@ziepe.ca>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 May 2025 20:46:27 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, May 27, 2025 at 01:52:52PM -0600, Alex Williamson wrote:
> 
> > > Lots of CSPs are running iommufd now. There is a commonly used OOT
> > > patch to add the insecure P2P support like VFIO. I know lots of folks
> > > have backported iommufd.. No idea about libvirt, but you can run it in
> > > compatibility mode and then you don't need to change libvirt.  
> > 
> > For distributions that don't have an upstream first policy, sure, they
> > can patch whatever they like.  I can't recommend that solution though.  
> 
> I appreciate that, and we are working on it.. The first round of
> patches for DMA API improvements that Christoph asked for were sent as
> a PR yesterday.
> 
> > Otherwise the problem with compatibility mode is that it's a compile
> > time choice.  
> 
> The compile time choice is not the compatability mode.
> 
> Any iommufd, even if opened from /dev/iommu, is usable as a VFIO
> container in the classic group based ioctls.
> 
> The group path in VFIO calls vfio_group_ioctl_set_container() ->
> iommufd_ctx_from_file() which works with iommufd from any source.
> 
> The type 1 emulation ioctls are also always available on any iommufd.
> After set container VFIO does iommufd_vfio_compat_ioas_create() to
> setup the default compatability stuff.
> 
> All the compile time option does is replace /dev/vfio/vfio with
> /dev/iommu, but they have *exactly* the same fops:
> 
> static struct miscdevice iommu_misc_dev = {
> 	.minor = MISC_DYNAMIC_MINOR,
> 	.name = "iommu",
> 	.fops = &iommufd_fops,
> 
> static struct miscdevice vfio_misc_dev = {
> 	.minor = VFIO_MINOR,
> 	.name = "vfio",
> 	.fops = &iommufd_fops,
> 
> So you can have libvirt open /dev/iommu, or you can have the admin
> symlink /dev/iommu to /dev/vfio/vfio and opt in on a case by case
> basis.

Yes, I'd forgotten we added this.  It's QEMU opening /dev/vfio/vfio and
QEMU already has native iommufd support, so a per VM hack could be done
via qemu:args or a QEMU wrapper script to instantiate an iommufd object
in the VM xml, or as noted, a system-wide change could be done
transparently via 'ln -sf /dev/iommu /dev/vfio/vfio'.

To be fair to libvirt, we'd really like libvirt to make use of iommufd
whenever it's available, but without feature parity this would break
users.  And without feature parity, it's not clear how libvirt should
probe for feature parity.  Things get a lot easier for libvirt if we
can switch the default at a point where we expect no regressions.

> The compile time choice is really just a way to make testing easier
> and down the road if a distro decides they don't want to support both
> code bases then can choose to disable the type 1 code entirely and
> still be uAPI compatible, but I think that is down the road a ways
> still.

Yep.
 
> > A single kernel binary cannot interchangeably provide
> > either P2P DMA with legacy vfio or better IOMMUFD improvements without
> > P2P DMA.  
> 
> See above, it can, and it was deliberately made easy to do without
> having to change any applications.
> 
> The idea was you can sort of incrementally decide which things to move
> over. For instance you can keep all the type 1 code and vfio
> group/container stuff unchanged but use a combination of
> IOMMU_VFIO_IOAS_GET and then IOMMUFD_CMD_IOAS_MAP_FILE to map a memfd.

Right, sorry, it'd slipped my mind that we'd created the "soft"
compatibility mode too.

Zhe, so if you have no dependencies on P2P DMA within your device
assignment VMs, the options above may be useful or at least a data
point for comparison of type1 vs IOMMUFD performance.  Thanks,

Alex

