Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9AD482FF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748389591; cv=none; b=jczUtC9L1J5VVZWYBB+X5YbNTwQiML0xhXjAFv3aUuT+/tlvuZj50EraQNDdYAolYn93hfDhJyzhd9hbWEIPo4NKQ8a3Rz4bQoyzQvxgKuqQqVholMIoP8SJcxXt4VZ/1rXj8m6xC/Q+8Dh1YBHlPlzs1T4mxhSZmNmLFTLqXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748389591; c=relaxed/simple;
	bh=w9k27e6ivEkvX62w7CLEDBn6NKxaYaBba5dwqf+Javs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHT4X/NJf6zBlQ5aqcrVM1CRtKSQN7AinT/V3LuA6Ms9XrgdQnnMmsEUn4gvgeFvORbmhNcfN+pzqf7rCuHO+j5br9IQif1vWUsCANrzlxMwKRg3Vyf9qggz8NGoPNT3xI++ffY4wyrW0KqhetGkezfQByt7PUe5CilOpsYBoOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=g7407RMl; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="g7407RMl"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5a88b34a6so365490185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748389588; x=1748994388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x27HLUEG8WW6UX+8oJoT2et4kYwoGBxnP1FXk7AWqNI=;
        b=g7407RMl+kWnlhGK8fDCnOzVIFIhH6Me+UHERJOlQfz6WLhToASum21rkBtZE9xxfB
         AOongEL8v672HmQVvJYEEeyWTRZQp638QZ6Upi1rakGMsgFRR/z41Ok+pcCNRsF8WDep
         ZEyqrmf+HIETJlNelTfJB4f3cE9QQuT4GK7Lm6bNZSXMlhFYJiDgYQvd4CgzLQdjujrK
         Gpbx3/0Dx4dc0Wq/nYJIGn+mZ/heuBRHZlR8hc1+K4cpurJUXozXFsGRxxry++lvYfGw
         nuGWNr/H7NCX7vkZUJ364ogPEpkWQvmFGwUa0Rn0ipkvzip8FkNT92bMLCqTUhBTNIFJ
         krug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748389588; x=1748994388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x27HLUEG8WW6UX+8oJoT2et4kYwoGBxnP1FXk7AWqNI=;
        b=iG+0y37tTA6x04Q36XYzdACUsp1ip7KmGw4jj49D72bmJOrDnVx8aL8B1V3CfZG+RY
         4XuzWt9TGYCrkUhpvyuHuZzQd1qOGrMZxWxPu1KQsfIOCiPYJ7QIES1SaGu/T+Sl/Hht
         g32ZbjBnlB7psXvn21gmx60GgqK+mQ4HFrhU7eBSCn15CttxCMPZYU1475/96fYHl7qp
         /Tgzs9v3M5ZRcK8WYN7Ah5/6jiFoe6UhAq7ywIhrFrw8kpIOhjetZWwemp5oQKXi3Vxj
         uqYhIcBYBSigm6B4HFqKW7bpiscmDiiidGUkw5JG7zIyL+joENjkCVRElsRy6Pl/hiSQ
         KpMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL9+MX5QT+8KJkSe1pgjhQcm93Oggmb93p+qUVxbg8EVhMOtpPAn4Q3oFUcBTd/CKElWtpLzh34CThk/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVA0F4VV84m4BxeSkfgy02mvusTYyI10GV+ekgQr1+DYuYCvu
	XxR2HKOqihRFfcZvDdgwN5WWrLG1WbhrDW+9gOLgik0UMxysFWtH2HvaExo3ppgPAkg=
X-Gm-Gg: ASbGncs66a1u/kGP5ItYTFdNoV+v9ITCC4AYNISYmis2agIBj0xqJeyJ3gJbrIw/DEv
	21aStR4o/FOiQAEpLiDIePxhBX0Klv3DiYyswcz96SInltReMHMI8GMklOPHK0GilXfZ1cIbaD+
	yjliD47WaIuHf1Kk2b98EeqAB01VWHMeCIsfET8idt8AhdnpMuscY9Lug5RIV2yIcpKFSGfFDYB
	kB2KN70vxddTh4uJgYvGjUW+ZmzjdoODjBGcRm/6qwh6f20osrutuckqRWzOjqJPPGCRO1+4sZD
	C8Fd//y0Yr4Y+sZeZGWeXOO4b6oaq37kX5gPdzdwHRVVlKJBrgFrsQ0aeVECONcFd8kG5lJFHav
	rxhqlHbjYoqCCmR1B+BWJCip1EUM=
X-Google-Smtp-Source: AGHT+IG2LIXWRwXIEm9zEbH1VczQ/bdtWJaWFEe3ZVwPZVR6dfseFMeF7NFlZZ2UfIYaun6kdt2SLA==
X-Received: by 2002:a05:620a:2687:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7ceecc3f6e1mr2440274085a.53.1748389588306;
        Tue, 27 May 2025 16:46:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb8210412sm3956585a.36.2025.05.27.16.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 16:46:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uK403-00000000f5z-0Q7F;
	Tue, 27 May 2025 20:46:27 -0300
Date: Tue, 27 May 2025 20:46:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, lizhe.67@bytedance.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for huge
 folio
Message-ID: <20250527234627.GB146260@ziepe.ca>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
 <3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
 <20250520162125.772d003f.alex.williamson@redhat.com>
 <ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
 <20250521105512.4d43640a.alex.williamson@redhat.com>
 <20250526201955.GI12328@ziepe.ca>
 <20250527135252.7a7cfe21.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527135252.7a7cfe21.alex.williamson@redhat.com>

On Tue, May 27, 2025 at 01:52:52PM -0600, Alex Williamson wrote:

> > Lots of CSPs are running iommufd now. There is a commonly used OOT
> > patch to add the insecure P2P support like VFIO. I know lots of folks
> > have backported iommufd.. No idea about libvirt, but you can run it in
> > compatibility mode and then you don't need to change libvirt.
> 
> For distributions that don't have an upstream first policy, sure, they
> can patch whatever they like.  I can't recommend that solution though.

I appreciate that, and we are working on it.. The first round of
patches for DMA API improvements that Christoph asked for were sent as
a PR yesterday.

> Otherwise the problem with compatibility mode is that it's a compile
> time choice.

The compile time choice is not the compatability mode.

Any iommufd, even if opened from /dev/iommu, is usable as a VFIO
container in the classic group based ioctls.

The group path in VFIO calls vfio_group_ioctl_set_container() ->
iommufd_ctx_from_file() which works with iommufd from any source.

The type 1 emulation ioctls are also always available on any iommufd.
After set container VFIO does iommufd_vfio_compat_ioas_create() to
setup the default compatability stuff.

All the compile time option does is replace /dev/vfio/vfio with
/dev/iommu, but they have *exactly* the same fops:

static struct miscdevice iommu_misc_dev = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "iommu",
	.fops = &iommufd_fops,

static struct miscdevice vfio_misc_dev = {
	.minor = VFIO_MINOR,
	.name = "vfio",
	.fops = &iommufd_fops,

So you can have libvirt open /dev/iommu, or you can have the admin
symlink /dev/iommu to /dev/vfio/vfio and opt in on a case by case
basis.

The compile time choice is really just a way to make testing easier
and down the road if a distro decides they don't want to support both
code bases then can choose to disable the type 1 code entirely and
still be uAPI compatible, but I think that is down the road a ways
still.

> A single kernel binary cannot interchangeably provide
> either P2P DMA with legacy vfio or better IOMMUFD improvements without
> P2P DMA.

See above, it can, and it was deliberately made easy to do without
having to change any applications.

The idea was you can sort of incrementally decide which things to move
over. For instance you can keep all the type 1 code and vfio
group/container stuff unchanged but use a combination of
IOMMU_VFIO_IOAS_GET and then IOMMUFD_CMD_IOAS_MAP_FILE to map a memfd.

Jason
