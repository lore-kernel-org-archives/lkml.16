Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6126A1C3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279080; cv=none; b=Cop7wJt+rPHbbH44wabg7sID6kIYI6p3uFpL5ORqZtGgreLu/XDU+ed8UpqdC0bIb3je1ccZaMQyoIO8JBp5KTlOS/mGxxzRgKlkrAmDyQfDgBrBRiaJxevXZwkj9o2+VaGIEMhHmMGiCUx2tdtMQ+Bd0L5SkowcGPFJo44E8rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279080; c=relaxed/simple;
	bh=CW5g3wYp9KL1gVQvH/LT0BdadUWQJrj72wibka1rya4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8w8PH53rcA/ZEbu4j/RTOQ78CCprSF+GxBwm5dYJn22ejfrlb1nwKk1ZCgAsAx52a/9Yv+HUDFf57fUUj/rm62CMzBT9gYnfXpEnkbm9NHUhXoisUjiWGg6uq0tmc7C/PVONzd8gjf+tvjl7zyoYdQQP11YDF8N5JlOeMNTJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZlh9D5H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZlh9D5H"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso4817605e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744279075; x=1744883875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8W+GulkDGBime4ZK9OwOUCjZYgRnq/dZvJvvvfuncM=;
        b=eZlh9D5HLpdQ1qoqM2u9RUioS6Qh4POaNMZMb0dho22ZQzQh+AIW7Oo+9hse/8alxt
         dlPDP37MtV0gFViHFdyHedGvL2NPkXz41GWMwiaQ9SY3GKisnVzkpVImL+Qb6NiLcGlV
         wvlKeIOX4Cj7+Ru30GaRFxZlo8SLVZY3MBE71lfQW6URspktK5t2YigPslgrs2yJvXI2
         MUws763C0uGSWh1jDxosu4SmXDPnts5z9nGHcgu+R6Q7g7T/fJqhrQpDxIRFS7XWElQP
         eEnTxrwgQprEpvPYyXpgzSBcpz0Wtnff6XAAIUvMjjCMXb1qSmgRObfKWGBrAEqIN7mF
         3nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279075; x=1744883875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8W+GulkDGBime4ZK9OwOUCjZYgRnq/dZvJvvvfuncM=;
        b=e+aRE/IUQF7qQTilqOcXWwsqgTE2WcvuyUu18XYJda3uEM1VYaPp1naN8EroqxZeyu
         kBqy5dwHe3pgusONC2DvRuj0bMdcnJgdqSSQhuBjIu0wNGOZvovrdFHK+2x93iKS1wpU
         4Dqi9RzhgvoCmyKH1fL5hqPPSexb1AZMLLBwmXT5zveZQkr/R/MU/ks71ELu9wWVAGuE
         SmWJ3sVPfR+Z4dFE2huTvUcGPYhE+Ns/jNJe70amOFRaForPtnHIlewMfd3BPJnezLCl
         6NXpfoiEfjVDHJTHR5Xjq5wz01MfInOApZAiVPs5v4XfMwE+Fw7mimP3N3U97BfglI4/
         BQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCU0ufqNbJ5B1KtvtIdOgE7T/WI/uVtu7dkBt7Bj4vP9ljtfflBxHz5mRYbT9MvtXF8+rgl21TfBqnU1s1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNntpiySLVMR2POObm6u7tu/6UN1vVMGBz62LEzo7nUCBLcAHy
	AlP8pMnOIZXxoLyAg2787L1uLSiMuoE4iUk8M6aKghWpGCeuVciUaBbUAuJcOSc=
X-Gm-Gg: ASbGncskjI408jJIfysDPQu0aAWnbzZV/NAVHuROpdCMrOpP1PygnFZvI5U0TI+S74s
	LTfs5qV5QZ0VlMyEwbM/dd4OkC+2nbZi/IkbNL93CKWE978ak9IByYT9g2CcqX3C78DcPyKvGbT
	GDOvldG5APEGRRYRXQucGDmz50edys29QLDvpuBCf8lturBWWMbt+ZFV06DjLpVON+5kbb+suSM
	e8T5EFUWUwEaOgpZv6B8ZU5PLR1cgYE2C0/nENrFdWCwHWu/SEcWpfhM6ifSrXCwVjYICHhStYJ
	XeMAximeLckyh0i1fw3FzJVQg3oVXm5Sj88OZdwyT8WhpucPRMtxFBxf
X-Google-Smtp-Source: AGHT+IEI7OSG+hIdjY4nTYGxTWexSVcR9vMqNh2S58M8qMW4Ld4ib5ru6erbmUkRfTs1cPbuiU/iwA==
X-Received: by 2002:a05:600c:1d94:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43f2d7b88edmr23069305e9.14.1744279074833;
        Thu, 10 Apr 2025 02:57:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2338d7d8sm47906135e9.4.2025.04.10.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:57:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:57:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Melissa Wen <mwen@igalia.com>
Subject: Re: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations()
 error: uninitialized symbol 'ret'.
Message-ID: <6ddfc908-22a0-4ed6-b5a4-6df9be85ff4e@stanley.mountain>
References: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
 <b402252a-91de-4983-abc1-65f78e7e6ae7@igalia.com>
 <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>

On Thu, Apr 10, 2025 at 11:27:43AM +0200, Christian König wrote:
> Hi Maira,
> 
> Am 09.04.25 um 21:49 schrieb Maíra Canal:
> > + König
> >
> > Hi Dan,
> >
> > On 02/04/25 05:43, Dan Carpenter wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >> head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
> >> commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
> >> date:   2 months ago
> >> config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
> >> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> | Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
> >>
> >> smatch warnings:
> >> drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
> >>
> >> vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c
> >>
> >> cdec4d3613230f Eric Anholt 2017-04-12  589  static int
> >> 04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> >> 04630796c437a9 Maíra Canal 2024-12-20  591               struct drm_exec *exec_ctx)
> >> cdec4d3613230f Eric Anholt 2017-04-12  592  {
> >> 04630796c437a9 Maíra Canal 2024-12-20  593      int ret;
> >> cdec4d3613230f Eric Anholt 2017-04-12  594
> >> cdec4d3613230f Eric Anholt 2017-04-12  595      /* Reserve space for our shared (read-only) fence references,
> >> cdec4d3613230f Eric Anholt 2017-04-12  596       * before we commit the CL to the hardware.
> >> cdec4d3613230f Eric Anholt 2017-04-12  597       */
> >> 04630796c437a9 Maíra Canal 2024-12-20  598      drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
> >> 04630796c437a9 Maíra Canal 2024-12-20  599      drm_exec_until_all_locked(exec_ctx) {
> >> 04630796c437a9 Maíra Canal 2024-12-20  600          ret = drm_exec_prepare_array(exec_ctx, exec->bo,
> >> 04630796c437a9 Maíra Canal 2024-12-20  601                           exec->bo_count, 1);
> >>
> >> This is a false positive in Smatch.  I can silence the warning on my
> >> end easily enough to say that we always enter the drm_exec_until_all_locked()
> >> loop.  But the question is why do we only test the last "ret" instead of
> >> testing all of them?
> >
> > AFAIU `drm_exec_until_all_locked` will loop until all GEM objects are
> > locked and no more contention exists. As we have a single operation
> > inside the loop, we don't need to check "ret" for every iteration.
> >
> > I believe Christian will possibly give you a more precise answer as he
> > designed the API.
> 
> Yeah that explanation is absolutely correct.
> 
> The drm_exec_until_all_locked() helper loops until all contention is resolved and all buffer locked.
> 
> You could avoid the snatch warning if you move the error handling into the loop, e.g. something like this here:
> 
> drm_exec_until_all_locked(exec_ctx) {
>     ret = drm_exec_prepare_array(exec_ctx, exec->bo, exec->bo_count, 1);
>     drm_exec_continue_on_contention(exec_ctx);
>     if (ret) {
>         drm_exec_fini(exec_ctx);
>         return ret;
>     }
> }
> 

Don't worry about silencing it.  I already silenced it in Smatch a couple
days ago.

regards,
dan carpenter

