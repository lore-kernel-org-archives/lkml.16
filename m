Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF98267F6C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211396; cv=none; b=Us4OC00R7wlJjlUgmoeRB0taY/V0E6ahtl2zivgBHNzHOYp7UxP2ml2SUoaZ0J/ZIE2rBWAUw2fZVJ9aMLs83DPBDRM0pnew8tDjZo7dp+WIgy5UYFiyDYXXQFtYtLn2kDUMGqQjG3h5RfoiIVTszDZ+ga8NNMpde2VQHLRb0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211396; c=relaxed/simple;
	bh=ZgPt0kY4v51PrWRwjEFd1UVcxTCxhC8NiE86uy2w7SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvuOtRGZyJmiHtKdj7zq0Jrbx+HNpQlViPrX2QY9woofUoiTJW1BluTtEWXZqVdz8AHYCgk7+1Qx3lDQeW7nhyKk0U0kB8dw1/w4GiAWGEvXLg/+BUkjXDphgHsT8nVFXmXOD1lt7bsmmDb2LoS4j9pqUvrGyK1amCf8AC4MG5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dF/+tUgb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dF/+tUgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744211393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B57j4Ps108WJ39MtEA7WB4JULRneEM8e8M06m5Z+dPI=;
	b=dF/+tUgbuupjhVv9H07zxI4cQUX731qYGJfE63WcBTJ5IoUZyMC2icRibtK42u/S38yc5i
	ZWCZssRfYW/CjxiNwn6HBhObbziTOmzPWPE6k/L57sr/Kt5rFgMuU112eCzorsu6g6S0IJ
	5xeh5j+67/K6oxrByMMR08INCsZyb5M=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-vUz62eWFOZm305aVqBE-Sw-1; Wed, 09 Apr 2025 11:09:50 -0400
X-MC-Unique: vUz62eWFOZm305aVqBE-Sw-1
X-Mimecast-MFC-AGG-ID: vUz62eWFOZm305aVqBE-Sw_1744211390
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6fda4eaca22so76041957b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211390; x=1744816190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B57j4Ps108WJ39MtEA7WB4JULRneEM8e8M06m5Z+dPI=;
        b=GunKXP/in+YWJeq1c8DuD16u9mmxj6NOE7l44SGTDuqx8fQwWIETgQ2seRQjOWlIUr
         0MShkFLpIRPa0zJ9jl1eiiMPb1TmjHBXZ/9ca7m/4EaATAHAeaEapTcpga9AHSnsE/ZI
         ewNo0LUqZJIigJK6W4pnffGgQG1bCfEDxbPiL1qSTCqDkPucnTjkVx3q8mehRYuRsgN4
         8NFvBJJtNARgMXX5PFcFvwkRoy/ORIJ92hlfj85+CktT6Mp05I64hhhAPG108AU+yUWt
         C1XWh90ImeQb/7GxNb4QFOZ8xco6oNGP8yY00EXXYzKZEjCddMDaF6LmuhByyy0K4fIg
         Fh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8+jFGd5HWcCexgGJ4ulsHrZAowUDHpYBSJ7iIUK3hRzFS5UaqnQPf7+KPe5osMyeawNHGeqRJ2Hfu/xY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHHbVKAgcQt/joSQdJiFtlM6JVsQWOPpM5R9lkk0GYXycOW83w
	1BuRqFTk8vCtnE3z5qUBGGTYIEgNLXdIVhZbwxI1PXjLdQ3Dm964VCGcjAGJS07JobDzboEQp+E
	V94hSLF1jbtVas8yPORhm8ugubPBrcE0+vD8VQ+jrjqGfcvnz99PDxUSi6rEULrBXiP5rQvx1uK
	tpFvyV3+mnuPZfgA6GzBIw+hoileK/40vM4Z0g
X-Gm-Gg: ASbGncvU7bBY6++KXH36/IQSJ2fXrjqLSvggKWH0yTd/MQ+l55GYteC2JpU53cwZQRm
	wGAiXc8bD9cZWCXM1/RxDza96yv9SmLibYF6E60eKuKhxvOML5iAFHHJvhqCDK3uLFJ0=
X-Received: by 2002:a05:6902:2485:b0:e6d:fe4e:2fea with SMTP id 3f1490d57ef6-e702ef93146mr5070947276.22.1744211389891;
        Wed, 09 Apr 2025 08:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAPGM5gyLOwLfn2UdRTVZky07wzaGcSPFlzlIDICN1npX81A2QuWPKW22/H4HhkZ/sajnEFn3RzZLt/hxweLI=
X-Received: by 2002:a05:6902:2485:b0:e6d:fe4e:2fea with SMTP id
 3f1490d57ef6-e702ef93146mr5070899276.22.1744211389481; Wed, 09 Apr 2025
 08:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local> <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local> <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
 <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local> <CAGxU2F7r_fWgr2YRmCvh2iQ1vPg30f-+W6FXyuidbakZkwhw2w@mail.gmail.com>
 <20250409113154.GGZ_ZaqgfRrrMij_Zm@fat_crate.local> <409a9171bc3224dd55344729ab3106917ac113bf.camel@HansenPartnership.com>
In-Reply-To: <409a9171bc3224dd55344729ab3106917ac113bf.camel@HansenPartnership.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 9 Apr 2025 17:09:38 +0200
X-Gm-Features: ATxdqUFDHs60Y8bJz4qgiFtoScY5UJ31NSfT68Bf62VVN8_SmIl8qmI4-UUsk9k
Message-ID: <CAGxU2F4cPgM1Uh+TDPBNsB1J8M-QgnEBF=vXQmxktJw3MXQbLg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
To: James Bottomley <James.Bottomley@hansenpartnership.com>, Borislav Petkov <bp@alien8.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, Dionna Glaze <dionnaglaze@google.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 14:22, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2025-04-09 at 13:31 +0200, Borislav Petkov wrote:
> > On Wed, Apr 09, 2025 at 12:43:01PM +0200, Stefano Garzarella wrote:
> > > Sorry, maybe I missed something.
> > >
> > > tpm_svsm.c registers the driver with
> > > module_platform_driver_probe().
> > >
> > > Someone (the platform I guess) has to register the device by
> > > calling platform_device_register(), as we already do for example
> > > for sev_guest.
> >
> > Maybe that platform device thing is the wrong approach. Why does the
> > core code need to register some dummy platform device in the first
> > place? Why can't drivers/char/tpm/tpm_svsm.c probe and init without
> > it?
>
> Because of the way driver and device matching works in Linux.  We have
> to have a struct device because that sits at the he heart of the TPM
> driver binding.  If we have a struct device, it has to sit on a bus
> (because that's the Linux design) and if we don't have a bus then we
> have to use a platform device (or, now, we could use a struct device on
> the faux bus).

I tried to look at faux bus, but IIUC, it doesn't fit. I mean, we
could use it if we had a driver here in sev/core.c, but using a
separate module for the tpm-svsm driver, how do we get the module to
load when we find out that the device is there?

In short, my question: how do we load the module automatically when we
discover the device?

faux seems more useful to me when there's no need to discover the
device, but loading the module itself starts everything. If, on the
other hand, we want to have it load when we discover it, we have to
either have a bus or have core code that registers a platform_device
that will then be recognized by the driver in a separate module.

> Busses can be either physical (PCI, GSC, ...) and
> abstract (virtio, xen, scsi, ...), so it's not impossible, if the SVSM
> has more than one device, that it should have it's own SVSM bus which
> we could then act a bit like the virtio bus and the SVSM vTPM struct
> device could sit on this (the TPM subsystem, like most driver
> subsystems, doesn't care about busses, it only cares that the abstract
> bus device id matching works).

Yes, I'm also looking at introducing a svsm bus as we've already
discussed, but that's going to take some time.

In the end though, platform_device is not that bad IMO. The tpm-svsm
is really a device provided by the (virtual) platform, so doing some
sort of discovery of the bus in sev/core.c and registering the device
if discovered might be a compromise for now until we develop the bus.

If you agree, I'll move all the discovery here in sev/core.c as I
suggested earlier, so that when we get the bus we'll move this code
somehow into the bus.
@Borsilav @James WDYT?

Thanks,
Stefano

