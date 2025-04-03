Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D80241CA0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668847; cv=none; b=H8+jeuOnZ+fscdqqRDoK45mVRA2wDPqy/z8DUMOvy+RkI+510LO7zNp8dcugUGKZaHpm+Tcnv8pK9lrz6TrbI6n9JzmDzjj4+5Ejz3WBOS/kZAsiuX5Cb9OIG/MnxEBWMmJvgdNoD1Zi7UmHxKYIN8YofME63SVOyy+uURZlcdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668847; c=relaxed/simple;
	bh=12oR6S8hqizhC2JzsMUHt5AD60AQYme5Jkz+Gstpjs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6FMjYnMkUwA5QRUqWWRpUUYq04uYvUseGRJ9JsXUQWR1Z7OeMXIBiN89PeLMGLiz11HRuYW8B6D2IyN4zzRDtctkBbsfDvZ+Qvq8GiCxGZ7+QO6GrsBE9Qh93KCejqEQY43cTnCSvONtShPehc8ZOiCIM0nkzML/bf4O7h3apU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=H6rij/C3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="H6rij/C3"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac7bd86f637so69651766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1743668842; x=1744273642; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o+Mp6jmtYK1H17CFfYiwi2sa1wA1pdf2H15LrCJwia8=;
        b=H6rij/C37zCroHpD8D5hIQu0TWiqjeHv70DRl0kzPf38ek8ZQ0ywSHmZqFsh8Z4q+H
         BTTKPCdCZnAjcx0BHJJXgkhVt+1aHtpRt8BfRr3VXYHvuRJgzmL+GtlimCIBXYfeuFTS
         NgBvq3XJqB4kq6+c1UGphaY6UjLsoG5Theiqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668842; x=1744273642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+Mp6jmtYK1H17CFfYiwi2sa1wA1pdf2H15LrCJwia8=;
        b=BVxs38DWo79G/IVt/s0GuT1K0xf9aBPiQnkIyVIaHj72+E1yQTqkU5Pzo73AK+XPOs
         MujKrZa7IwN1kkEnxc4uo6ngMWBMmnEMB5eVbPYZU6nLXdLVE/ob98VbSl/E/T0WRPsO
         QZ+Enq+rQK3bJXTQgz+6nnP4rUsAX7mjrPcjp3tb6fp7mxQrx1f4Gb60RoOa6XUBdG2n
         4JP7mctS4BoP+WUljvw7x23q1Py8kj7olpTMfPJSv/inH5TXTooJXeUCrFszb4TTktPj
         WH8eZ8Nmln16+5f8Ui/hv4U4CL7wC86F8ycVQgWJaBxvTcWuStTyM1EhTjhB3Y/jXq4G
         00aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkvE21CH1tQfKABtglJujPmH7GTeciqom4YQ6AShlQDaY3Yjd6h4nEbDDU8Wd9mHVvb5PyHeL8XlzHsfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTuBLcnE1GQNqZ80+aAtebevvUur15/BqKAwaQ8LaG6FDt79y0
	ylUWASl0G0aTGOs8Fqnflwd2lOwdaDMUzawCQz2/hLLWExFZG+8Z5I6um41MZgQ=
X-Gm-Gg: ASbGncuK+12lGTCSpT4aFVbRKHCBqWM8+qV9E9L2jaYTbz7o6VqrFmOi8paUqjH3Oj5
	46pmZe+zgG+4CdI5r6jAU6EGwo0FlkaPtFLfZxtkB3o+Tns8Ja83pCWkcaVCWDLXaVrpAqF+u7N
	5NsbG7mXw6dIRXVdosTYDJwtY4/CVT9mcWvR08Zz4T4HzyObw6qJoP47VzU+HPxaLAnXAGNENxT
	BmxPTWO/UeJPuuRu8o+D3k2NtKLicdWiCPmk3AWgzcp2lqCsgqeFOTTQkdTHOP9u6sub7Q5ZXdN
	SuqI/PmcpqnZFY1ZywMbblSPR+fpfyVMQLP8dEl6kLOxcxWFw8r79Y1Z
X-Google-Smtp-Source: AGHT+IGcfR+2lbcGxpYCyqAi52EwdZb7Vb//nyaqQ4Ire5aanYllMG0HRfmeR5SThj3fwVAh+TVljw==
X-Received: by 2002:a17:907:7f93:b0:ac3:ed4d:c9a1 with SMTP id a640c23a62f3a-ac7b6dd2448mr199507466b.17.1743668842335;
        Thu, 03 Apr 2025 01:27:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2170sm55536566b.170.2025.04.03.01.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:27:21 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:27:19 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
Message-ID: <Z-5GZ3kJDbhgVBPG@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
X-Operating-System: Linux phenom 6.12.17-amd64 

On Mon, Mar 10, 2025 at 01:06:06PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's preliminary work to enable dmem tracking for heavy users of DMA
> allocations on behalf of userspace: v4l2, DRM, and dma-buf heaps.
> 
> It's not really meant for inclusion at the moment, because I really
> don't like it that much, and would like to discuss solutions on how to
> make it nicer.
> 
> In particular, the dma dmem region accessors don't feel that great to
> me. It duplicates the logic to select the proper accessor in
> dma_alloc_attrs(), and it looks fragile and potentially buggy to me.
> 
> One solution I tried is to do the accounting in dma_alloc_attrs()
> directly, depending on a flag being set, similar to what __GFP_ACCOUNT
> is doing.
> 
> It didn't work because dmem initialises a state pointer when charging an
> allocation to a region, and expects that state pointer to be passed back
> when uncharging. Since dma_alloc_attrs() returns a void pointer to the
> allocated buffer, we need to put that state into a higher-level
> structure, such as drm_gem_object, or dma_buf.
> 
> Since we can't share the region selection logic, we need to get the
> region through some other mean. Another thing I consider was to return
> the region as part of the allocated buffer (through struct page or
> folio), but those are lost across the calls and dma_alloc_attrs() will
> only get a void pointer. So that's not doable without some heavy
> rework, if it's a good idea at all.
> 
> So yeah, I went for the dumbest possible solution with the accessors,
> hoping you could suggest a much smarter idea :)

I've had a private chat with Maxime to get him up to speed on hopefully a
lot of the past discussions, but probably best I put my notes here too.
Somewhat unstructured list of challenges with trying to account all the
memory for gpu/isp/camera/whatever:

- At LPC in Dublin I think we've pretty much reached the conclusion that
  normal struct page memory should be just accounted in memcg. Otherwise
  you just get really nasty double-accounting chaos or issues where you
  can exhaust reserves.

- We did not figure out what to do with mixed stuff like CMA, where we
  probably want to account it both into memcg (because it's struct page)
  but also separately into dmem (because the CMA region is a limited
  resource and only using memcg will not help us manage it).

- There's the entire chaos of carve-out vs CMA and how userspace can
  figure out how to set reasonable limits automatically. Maxime brought
  the issue that limits need to be adjusted if carve-out/CMA/shmem aren't
  accounted the same, which I think is a valid concern. But due to the
  above conclusion around memcg accounting I think that's unavoidable, so
  we need some means for userspace to autoconfigure reasonable limits.
  Then that autoconfig can be done on each boot, and kernel (or dt or
  whatever) changes between these three allocators don't matter anymore.

- Autoconfiguration challenges also exist for split display/render SoC. It
  gets even more fun if you also throw in camera and media codecs, and
  even more fun if you have multiple CMA regions.

- Discrete gpu also has a very fun autoconfiguration issue because you
  have dmem limits for vram, and memcg limits for system memory. Vram
  might be swapped out to system memory, so naively you might want to
  assume that you need higher memcg limits than dmem limits. But there's
  systems with more dmem and smem (because the cpu with its memory is
  essentially just the co-processor that orchestrates the real compute
  machine, which is all gpus).

- We need a charge transfer, least for Android since there all memory is
  allocated through binder. TJ Mercier did some patches:

  https://lore.kernel.org/dri-devel/20230123191728.2928839-3-tjmercier@google.com/

  Ofc with dmem this would need to work for both dmem and memcg charges,
  since with CMA and discrete gpu we'll have bo that are tracked in both.

- Hard limits for shmem/ttm drivers need a memcg-aware shrinker. TTM
  doesn't even have a shrinker yet, but with xe we now have a
  helper-library approach to enabling shrinking for TTM drivers.
  memcg-aware shrinking will be a large step up in complexity on top (and
  probably a good reason to switch over to the common shrinker lru instead
  of hand-rolling).

  See the various attempts at ttm shrinkers by Christian König and Thomas
  Hellstrom over the past years on dri-devel.

  This also means that most likely cgroup limit enforcement for ttm based
  drivers will be per-driver or at least very uneven.

- Hard limits for dmem vram means ttm eviction needs to be able to account
  the evicted bo against the right memcg. Because this can happen in
  random other threads (cs ioctl of another process, kernel threads)
  accounting this correctly is going to be "fun". Plus I haven't thought
  through interactions with memcg-aware shrinkers, which might cause some
  really fundamental issues.

- We also ideally need pin account, but I don't think we have any
  consensus on how to do that for memcg memory. Thus far it's all
  functionality-specific limits (e.g. mlock, rdma has its own for
  long-term pinned memory), not sure it makes sense to push for a unified
  tracking in memcg here?

  For dmem I think it's pretty easy, but there the question is how to
  differentiate between dmem that's always pinned (cma, I don't think
  anyone bothered with a shrinker for cma memory, vc4 maybe?) and dmem
  that generally has a shrinker and really wants a separate pin limit
  (vram/ttm drivers).

- Unfortunately on top of the sometimes very high individual complexity
  these issues also all interact. Which means that we won't be able to
  roll this out in one go, and we need to cope with very uneven
  enforcement. I think trying to allow userspace to cope with changing
  cgroup support through autoconfiguration is the most feasible way out of
  this challenge.

tldr; cgroup for device memory is a really complex mess

Cheers, Sima

> Thanks,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (12):
>       cma: Register dmem region for each cma region
>       cma: Provide accessor to cma dmem region
>       dma: coherent: Register dmem region for each coherent region
>       dma: coherent: Provide accessor to dmem region
>       dma: contiguous: Provide accessor to dmem region
>       dma: direct: Provide accessor to dmem region
>       dma: Create default dmem region for DMA allocations
>       dma: Provide accessor to dmem region
>       dma-buf: Clear cgroup accounting on release
>       dma-buf: cma: Account for allocations in dmem cgroup
>       drm/gem: Add cgroup memory accounting
>       media: videobuf2: Track buffer allocations through the dmem cgroup
> 
>  drivers/dma-buf/dma-buf.c                          |  7 ++++
>  drivers/dma-buf/heaps/cma_heap.c                   | 18 ++++++++--
>  drivers/gpu/drm/drm_gem.c                          |  5 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |  6 ++++
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 19 +++++++++++
>  include/drm/drm_device.h                           |  1 +
>  include/drm/drm_gem.h                              |  2 ++
>  include/linux/cma.h                                |  9 +++++
>  include/linux/dma-buf.h                            |  5 +++
>  include/linux/dma-direct.h                         |  2 ++
>  include/linux/dma-map-ops.h                        | 32 ++++++++++++++++++
>  include/linux/dma-mapping.h                        | 11 ++++++
>  kernel/dma/coherent.c                              | 26 +++++++++++++++
>  kernel/dma/direct.c                                |  8 +++++
>  kernel/dma/mapping.c                               | 39 ++++++++++++++++++++++
>  mm/cma.c                                           | 21 +++++++++++-
>  mm/cma.h                                           |  3 ++
>  17 files changed, 211 insertions(+), 3 deletions(-)
> ---
> base-commit: 55a2aa61ba59c138bd956afe0376ec412a7004cf
> change-id: 20250307-dmem-cgroups-73febced0989
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
