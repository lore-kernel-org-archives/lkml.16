Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C5221F33
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743532443; cv=none; b=Ct5bBFZ+pDVjBdGtDqONusUp4NoFiQrCIeSjPsJ1JaxnftSMuJP2YbWdZ02h6zTmFgz2BS29L4k64FVK0ACiv/eUeThrruKSKwowjTWLKuy8XgL7ukTkoWGVDkmAgIcTKZ0en5nEjsYK7t29kZkY0+SWS1zS7r5+flK4qlKZlLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743532443; c=relaxed/simple;
	bh=X8LDjNcfXQ4Bn/njeKqzo2cM5/0QgsnINerxJbWT884=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkKn78Xbu41flDA4zTsygBfXxVLzrX22y7iHi7dQsJ4zNgDtWnCNaM+JrAIxGBEdyhhH3znp0DgA61X60MheCIAH0OwRZYURSOfwcj2eDGhn2aIWHf+9pMxOD4BJlC9gdTSAV0vsx/gvIXajrfDJc1WoJyRqW8VtfwgMwnm8eag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bxgVL3n3; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bxgVL3n3"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476a304a8edso54257131cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743532440; x=1744137240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvFO86uOfXys++aHN99bumZHLvFpFBrUvW1hjDZlBME=;
        b=bxgVL3n3e+PDofbiAT4TqUKsTxcbwLnTYM1Kre0JlfHg5Z0Bkxi3iW1a1jd+RZMkZc
         gY+gineO8xxaAMpBpe40zMhix/aQhNuJyM8x+5OzAeeV3WuL4QWtqWSI/ukQPNR+SNAm
         1lbty8gnJBtWHKHpkx72Xd1sqsum7XdZJy9+tDCgPoed2a5DdZbPxxm1C9Xvpw7QJmUe
         8Q6GIMZtc7E1zn8AdSqbJMhCBiGBWrLp8P7Jzvd/tBbEXFO7VLX8g+RxBk2NSM2BdAEF
         et9xn2ZXhYHicb3oCMFnHqFCdMv/E3hG1i/FTfWOfgB44ArZLhm0f3EilcHaHpOIZmCa
         k/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743532440; x=1744137240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvFO86uOfXys++aHN99bumZHLvFpFBrUvW1hjDZlBME=;
        b=q9932YIr18Rclp1I46Iod5S1BhJVnEnUKmDMGiF4O1JKmVzOsjCv+hx5ziEO2QyVJO
         n4R2ZQhN+QCwEmr7v8Z2vZpIeYyhUOE7PSvhJI6SuFp4NeuTu6BX+i/7Ta/O8gsUbUV0
         PXZ68bS6EpVAyBx2TGlPabCdb46SqeOf/YElSByWsmPEy68TB9Pve4IevNK5mVoAcPLz
         cH+bjSLUAAHVOeDhx6Z0odY9Ib0eq05DWl6Qfo6cD8Vy/4Yuwcrz48HaCmI5R8OolXSr
         Cz5wwzlpBBj8NRnHIX3fN+cRggvDebisS+Q2gGoJ8KkJEpa79YIMN4XEMi0ZXRt2dgl6
         4tSA==
X-Forwarded-Encrypted: i=1; AJvYcCVEK9XzInIzpf26mwAZ1rWL2P+ksM6Rdk3X/rf0jbmgHEAkV0dxFTzbMHZRG8ucPRQsV49N+uzYFLFCeQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLsvymzs9G2blrJtXnhKrv9iZhfsje6sNPQJm94SFeVsldGHYn
	Kw5RYbpdAFTzok0jW5Fi7JfJGIH3PGYwJBumzg6L79DUe+TYofKrUUuYbApnGmo=
X-Gm-Gg: ASbGncuD9lzH+uii6XaEIykYX6w0aFGQEKs1t091lo4fZynn1SteMJGR6I9YKxHWHv0
	Gdx733+uT6BVniuLYlnNEjXaQo3tEzNamzuYqPjOC0OVKpm5XHgm+yISBBzaTwTfG5gGszz9pkU
	wT6g4FkMR4XX1pEdjkNJfKVA7s93mZVmrWmb2p7nz0HxGb3uSdGM8QVYs5fw9d2h957q357N87r
	+IY9v+BW7gR+VDI3QiX+dX6iL7++WZCWhAfsm2O4U2AA9QcMTgaFCAdjSAZ2pREju349Ishd94O
	QErAPeQUoT/sUaeD1GYn2RLrwxIThf3sovQ7ZFFe2H2tVyaxLpqNC/c6G84Z0kzMWyDzeLAZMSk
	qaUsXduTFldrBPysne+FnJVw9TLc=
X-Google-Smtp-Source: AGHT+IEIYtaOaF9anjPimhqDpAgFdltbw1UzV5b/pfKJo08pDKfU/jOer4wWpo31Zghqh/X5Dhy8Cw==
X-Received: by 2002:a05:622a:1a01:b0:476:7b0b:3110 with SMTP id d75a77b69052e-477ed72a711mr245214581cf.20.1743532440314;
        Tue, 01 Apr 2025 11:34:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a6579sm68620191cf.73.2025.04.01.11.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 11:33:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:33:57 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org, linux-acpi@vger.kernel.org
Cc: kernel-team@meta.com, x86@kernel.org, linux-kernel@vger.kernel.org,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
	rafael@kernel.org, lenb@kernel.org, david@redhat.com,
	osalvador@suse.de, gregkh@linuxfoundation.org,
	akpm@linux-foundation.org, dan.j.williams@intel.com,
	Jonathan.Cameron@huawei.com, alison.schofield@intel.com,
	rrichter@amd.com, rppt@kernel.org, bfaccini@nvidia.com,
	haibo1.xu@intel.com, dave.jiang@intel.com,
	Ira Weiny <ira.weiny@intel.com>, Fan Ni <fan.ni@samsung.com>
Subject: Re: [PATCH v8 0/3] memory,x86,acpi: hotplug memory alignment
 advisement
Message-ID: <Z-wxlQBIIjqbbPqu@gourry-fedora-PF4VCD3F>
References: <20250127153405.3379117-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127153405.3379117-1-gourry@gourry.net>

On Mon, Jan 27, 2025 at 10:34:02AM -0500, Gregory Price wrote:
> v8: nits and tag pickups
> 

I apparently already cleaned up the remaining nits. So this has been
stable.  Just did a rebase on mm-unstable and it was clean, so this
should pluck cleanly.

Andrew, do you think this should go through mm or another subsystem?

~Gregory

> When physical address regions are not aligned to memory block size,
> the misaligned portion is lost (stranded capacity).
> 
> Block size (min/max/selected) is architecture defined. Most architectures
> tend to use the minimum block size or some simplistic heurist. On x86,
> memory block size increases up to 2GB, and is otherwise fitted to the
> alignment of non-hotplug (i.e. not special purpose memory).
> 
> CXL exposes its memory for management through the ACPI CEDT (CXL Early
> Detection Table) in a field called the CXL Fixed Memory Window.  Per
> the CXL specification, this memory must be aligned to at least 256MB.
> 
> When a CFMW aligns on a size less than the block size, this causes a
> loss of up to 2GB per CFMW on x86.  It is not uncommon for CFMW to be
> allocated per-device - though this behavior is BIOS defined.
> 
> This patch set provides 3 things:
>  1) implement advise/query functions in driverse/base/memory.c to
>     report/query architecture agnostic hotplug block alignment advice.
>  2) update x86 memblock size logic to consider the hotplug advice
>  3) add code in acpi/numa/srat.c to report CFMW alignment advice
> 
> The advisement interfaces are design to be called during arch_init
> code prior to allocator and smp_init.  start_kernel will call these
> through setup_arch() (via acpi and mm/init_64.c on x86), which occurs
> prior to mm_core_init and smp_init - so no need for atomics.
> 
> There's an attempt to signal callers to advise() that query has already
> occurred, but this is predicated on the notion that query actually
> occurs (which presently only happens on the x86 arch). This is to
> assist debugging future users.  Otherwise, the advise() call has
> been marked __init to help static discovery of bad call times.
> 
> Once query is called the first time, it will always return the same value.
> 
> Interfaces return -EBUSY and 0 respectively on systems without hotplug.
> 
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Tested-by: Fan Ni <fan.ni@samsung.com>
> 
> Gregory Price (3):
>   memory: implement memory_block_advise/probe_max_size
>   x86: probe memory block size advisement value during mm init
>   acpi,srat: give memory block size advice based on CFMWS alignment
> 
>  arch/x86/mm/init_64.c    | 15 ++++++++----
>  drivers/acpi/numa/srat.c | 12 ++++++++-
>  drivers/base/memory.c    | 53 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/memory.h   | 10 ++++++++
>  4 files changed, 84 insertions(+), 6 deletions(-)
> 
> -- 
> 2.48.1
> 
