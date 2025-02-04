Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2722278F3B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665966; cv=none; b=fao669eKzeCTZ1njyzXEuHuXUfWUAMNwBD0fs2eB3LzRmnAxKbD0SydX9VA6PDnYqg3aiTcRKAxqHmkDcLHhtUxbEQ+zRYbQikAck2MCYgat+Byc03oxY/ROjXw+IjP2Xox2Gj69JZbtB2uD4W6ugYtQjd4bSFvIjQTmrJnO7NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665966; c=relaxed/simple;
	bh=SAKZdCpF6VWRRRVgXzqc0IBfTpqzPm6KgOgVIbkAD1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjJmAf2SuEtuzhR8Xr0nvtpBvPheuOuSAXRLhnJoscL7HKKrnwIp+NvNanHMH4Nv9SyWe3+LE4JjrnvX2jd1KH08W2NZcMjvNOu85/qlR4nqkp+S2MBJjS39cLNf/8Qc+649TAE+PdnT2ePUkuFFWMfHZh9aeUhjubutRhTDQQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=PmhAfLTD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PmhAfLTD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38632b8ae71so4559795f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738665960; x=1739270760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTqSzT/TXDWQqYRy4tctsFxrDEke2AKGwuYUOQfB5/U=;
        b=PmhAfLTDGx4n0LsiW83PPSloRy1STsMcDoRAIacNvmo98RAvif90vN281CAS5GRLDq
         wbic6VW+2rjv+NoMCCEcRKPOBHMu0JpO+RVye+3Vm0tb4wR2U87hps6uGuM3fYMakIs5
         QnWT9EN/3vtA0CLoaX2zkpUp1gTQ2vCg3JBzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665960; x=1739270760;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTqSzT/TXDWQqYRy4tctsFxrDEke2AKGwuYUOQfB5/U=;
        b=YzuM+1Riw/+BFjfg0CXM9C5eX2cnE1/pmAtvpEqBhAmEGyYeUxI0OCmVSIuWcFz18T
         DscROCCz4yLTz8uASyVV9oQC7fDnYhSpVjck3F99VtDHuQxzS2NT/yTwylsWY6YuD8yD
         NJb33zItoy8DGO8hVy5mEoeIkTqT6fdW+5IFyiWqI9z3je8gdHzyGwHgm5X9V7gNa2Hk
         vDaJHW4u1gWGn8M+O7BcVnNpxX54lYpg3AMj6w5cWNymUZpwAFvcRTFZTfRCoGRIpb1e
         bPPWg3/vd1s+opIzIkKJDsYybZVbQQMsQWjYB/ppR5ypS12LDk+kOb0bLc6kseWcPUVr
         3qrw==
X-Forwarded-Encrypted: i=1; AJvYcCXGUY6CtBxW1Y9T6gydIYAXVGugX0Zc5S5bVQONdV5ixMWWgo+d3U0e/8TWYne97fhSOA+20v/B4rpowLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRQkIxQJxYOxku5Y59xizeAfneab6Dfxvb0izhQfAWjhyAf8L
	8G98wzxK1W5VyJ0+YM6yl1D9J19CS/+rPxm2uLsNuL8UbmxaERRmBUfeGvZHov61jFmpbpFvXhg
	E
X-Gm-Gg: ASbGncuZ+h/YO2pMXsNotqThA+rZSKkZM6AQIK+DaKLyBEGjIr6Nx+yUAav4V4BKN4v
	aFjYMANk3RwgdfBdBtZRG05kkFe6pwgRwtnY9SNroS6UPA9Nz0oAk0wVzD6PsYS1W15y1SVObB2
	AMBaR3A73ig65gWSocrPiZPahsLhUi+yIAHRKR9HUogbWF3M35iE1lEFCaFJePk1RywYjOIl8OW
	PIQzIE8acpd5Rhyx2XXJIpXXQIhBkHN7lmfSn022w7SMnQdPtMmKUEe8vbQ/w72AA5kVU2TLRpu
	NDRzsHTUGjIOmY3+W2JbyYgSTfg=
X-Google-Smtp-Source: AGHT+IGWhHTEnUp8RUiWMKHvCVuyT8/rXL2ynOFabY336YUpw5mRZI1i4GZUr3SXSEIaoymXJPH+Tw==
X-Received: by 2002:a05:6000:1faa:b0:385:fa3d:1988 with SMTP id ffacd0b85a97d-38c5194ca8emr22392899f8f.8.1738665960211;
        Tue, 04 Feb 2025 02:46:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc13139sm220098775e9.3.2025.02.04.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:45:59 -0800 (PST)
Date: Tue, 4 Feb 2025 11:45:57 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Huang Rui <ray.huang@amd.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Lingshan Zhu <Lingshan.Zhu@amd.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object
Message-ID: <Z6Hv5esGqHWU2TVe@phenom.ffwll.local>
Mail-Followup-To: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Huang Rui <ray.huang@amd.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Lingshan Zhu <Lingshan.Zhu@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <40485636-7ea3-4e34-b4bb-1ccaaadd4e47@amd.com>
 <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Mon, Jan 20, 2025 at 05:54:10PM +0800, Huang, Honglei1 wrote:
> On 2024/12/27 10:02, Huang, Honglei1 wrote:
> > On 2024/12/22 9:59, Demi Marie Obenour wrote:
> > > On 12/20/24 10:35 AM, Simona Vetter wrote:
> > > > On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
> > > > > From: Honglei Huang<Honglei1.Huang@amd.com>
> > > > > 
> > > > > A virtio-gpu userptr is based on HMM notifier.
> > > > > Used for let host access guest userspace memory and
> > > > > notice the change of userspace memory.
> > > > > This series patches are in very beginning state,
> > > > > User space are pinned currently to ensure the host
> > > > > device memory operations are correct.
> > > > > The free and unmap operations for userspace can be
> > > > > handled by MMU notifier this is a simple and basice
> > > > > SVM feature for this series patches.
> > > > > The physical PFNS update operations is splited into
> > > > > two OPs in here. The evicted memories won't be used
> > > > > anymore but remap into host again to achieve same
> > > > > effect with hmm_rang_fault.
> > > > So in my opinion there are two ways to implement userptr that make sense:
> > > > 
> > > > - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
> > > >    notifier
> > > > 
> > > > - unpinnned userptr where you entirely rely on userptr and do not hold any
> > > >    page references or page pins at all, for full SVM integration. This
> > > >    should use hmm_range_fault ideally, since that's the version that
> > > >    doesn't ever grab any page reference pins.
> > > > 
> > > > All the in-between variants are imo really bad hacks, whether they hold a
> > > > page reference or a temporary page pin (which seems to be what you're
> > > > doing here). In much older kernels there was some justification for them,
> > > > because strange stuff happened over fork(), but with FOLL_LONGTERM this is
> > > > now all sorted out. So there's really only fully pinned, or true svm left
> > > > as clean design choices imo.
> > > > 
> > > > With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
> > > > you?
> > > +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
> > > in complexity that pinning everything avoids.  Furthermore, this avoids the
> > > host having to take action in response to guest memory reclaim requests.
> > > This avoids additional complexity (and thus attack surface) on the host side.
> > > Furthermore, since this is for ROCm and not for graphics, I am less concerned
> > > about supporting systems that require swappable GPU VRAM.

I kinda ignored this one, because from my point of view it's all clear.
But I guess better to elaborate some more.

> > Hi Sima and Demi, I totally agree the flag FOLL_LONGTERM is needed, I
> > will add it in next version. And for the first pin variants
> > implementation, the MMU notifier is also needed I think.
> > Cause the userptr feature in UMD generally used like this: the
> > registering of userptr
> > always is explicitly invoked by user code like
> > "registerMemoryToGPU(userptrAddr, ...)",
> > but for the userptr release/free, there is no explicit API for it, at
> > least in hsakmt/KFD stack.
> > User just need call system call "free(userptrAddr)", thenkernel driver
> > will release the userptr
> > by MMU notifier callback.Virtio-GPU has no other way to know if user has
> > been free the userptr
> > except for MMU notifior.And in UMD theres is no way to get the free()
> > operation is invoked by user.
> > the only way is use MMU notifierin virtio-GPU driver and free the
> > corresponding data in host
> > by some virtio CMDs as far as I can see.

Yes that's what I meant that you need real svm/hmm here. You cannot fake
the amdkfd/hsakmt model with pin_user_pages, it fundamentally falls apart.
One case is overcommit, where userspace malloc() a huge amount of virtual
address space, registers it with the gpu, but only uses fairly little of
it. If you pin that all, you run out of memory or at least thrash
performance.

For the hsa/kfd model, you must use hmm+mmu_notifier, or you're breaking
the uapi contract.

> > And for the second way that is use hmm_range_fault, there is a
> > predictable issues as far as I can see, at least in hsakmt/KFD stack.
> > That is the memory may migrate when GPU/device is working. In bare
> > metal, when memory is migrating KFD driver will pause the compute work
> > of the device in mmap_wirte_lock then use hmm_range_fault to remap the
> > migrated/evicted memories to GPU then restore the compute work of device
> > to ensure the correction of the data. But in virtio-GPU driver the
> > migration happen in guest kernel, the evict mmu notifier callback
> > happens in guest, a virtio CMD can be used for notify host but as lack
> > of mmap_write_lock protection in host kernel, host will hold invalid
> > data for a short period of time, this may lead to some issues. And it is
> > hard to fix as far as I can see.

I forgot the exact details, but when I looked amdkfd was taking too big
locks in the migration paths, which results in deadlocks. Those were
worked around by taking even bigger locks, the mmap_write_lock. But that's
a design issue with amdkfd, not something fundamental.

hmm only needs the mmu_notifier callbacks to work, meaning either context
preemption and restarting, or tlb invalidation and gpu page fault
handling. Those you can forward between guest and host with no issues, and
with hw support like pasid/ats in iommu this already happens.

Note that the drm_gpusvm library that's under discussion for xe had the
same issue in version 1 of relying on mmap_write_lock to paper over design
issues. But the recent versions should be fixed. Would be really good to
look at all that. And then probably do a full redo of the svm support for
amd in amdgpu.ko using all these new helper libraries, because my personal
take is that fixing amdkfd is probably more work than just writing new
clean code.

> > Finally I will extract some APIs into helper according to your request,
> > and I will refactor the whole userptr
> > implementation, use some callbacks in page getting path, let the pin
> > method and hmm_range_fault can be choiced
> > in this series patches.
> > 
> > Regards,
> > Honglei
> 
> Hi Sima,
> 
> I modified the code, remove all the MMU nitifior and use pin_user_pages_fast
> only. Under this implementation userptr fully
> managed by UMD. We did a performance test, it decreased by 30% in
> OpenCL stack in Geekbench6 benmark.
> We use AMD V2000 for test:
> use MMU notifior + pin_user_pages:
> near 13000 score: https://browser.geekbench.com/v6/compute/3257793
> 
> use pin_user_pages only:
> near 10000 socre: https://browser.geekbench.com/v6/compute/3496228
> 
> The code is under clean up, I will send out later.

pin_user_pages is fundamentally broken for the hsa memory model, no amount
of benchmarking different flavors of it against each another will change
that.

> And I found a another thing, it seems like in intel i915 userptr
> implementation, the pin_user_pages is also used in MMU notifior.
> Code path is: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/gem/i915_gem_userptr.c?h=v6.13#:~:text=ret%20%3D%20pin_user_pages_fast(obj%2D%3Euserptr.ptr%20%2B%20pinned%20*%20PAGE_SIZE%2C

Yeah i915-gem isn't great code and shouldn't be used as example for
anything. This is Dave&me asked Xe developers to create a lot of the
infrastructure in drm libraries, to make sure we have a solid design here
and not what i915-gem did.

Also note that i915-gem userptr is for buffer based userptr, like for
VK_KHR_external_memory if I remember correctly. This is not the hsa memory
model at all.
> 
> Patch set: https://lore.kernel.org/all/159353552439.22701.14005121342739071590@emeril.freedesktop.org/T/
> https://patchwork.kernel.org/project/intel-gfx/patch/20210323155059.628690-17-maarten.lankhorst@linux.intel.com/#24064663
> 
> And I didn't find the hmm_range_fault code path, maybe I missed it?

i915-gem never supported the svm/hsa memory model in upstream, so yeah
it's not there. For drm/xe see the work from Matt Brost that's currently
under discussion on dri-devel for what it should all look like.

Cheers, Sima

> 
> Regards,
> Honglei
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
