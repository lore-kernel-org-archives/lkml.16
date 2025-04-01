Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CEC3234
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541381; cv=none; b=QKJ0oskRxwlSElPRAXfTm22xI+Oogo2xWggZlSZbrcdDGiT2iWHWh9+RbY95cMQzhwzepehIilE1Iu64BP47dnbrR8+qNfj5zMhHKFPVO3waDQU0lRu0vK7wUpN9jhJKLxY6TWyd9sMEnXmC8bEJ6DJAcYeOH05VzV2cF4QY9O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541381; c=relaxed/simple;
	bh=x7GlKHcfHS7C2T8/ZVtyc/F66m+sAWa86yJFtfBeq8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AADNGLroxWWlGVV73qZ3fELHNnmLf7vsfGmIW/YgI3fu4cyZ8DEXepfFlASyF03JhhCo2t/5DV7SC0xhSTUBxBz/Z7n+FA39WXHRmb8jNr9wGm/26gxZAt+xsFZigskjC4Gud0ZeXC6+98BhdVa8jG+a8tqD7q+NvuWYLq/lOMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=WuPUg7LZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="WuPUg7LZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=g6StCyFpesYqaHVFLkyaouJmKdU5BfnU8LCrhZCDOCE=; b=WuPUg7LZBd19mvjU
	ZIGuJrVfFNtMuEjPcGLLx5VymD7xLMsLJNVHURqDPSNskBzNOpknpQlYefSYPGLwSBI/QpZf1eEoV
	PdNA+hIZf9lr8sBKCiL3p2V012JKYq6H1c22JHZ7TwJT188AyOh8mau8eeFt99CHLOczjksqHZdHD
	TgUNmMSRgo24r5Pez7w7PHu59TfvV5D2WGB8ObEFyUr3VRoqF3S8yQD8PNuZlDaoRPkVuoPsYoNNA
	Om0HFfxYHm2hZ3d0TGNt4W6u7B2anWSwNnm4Qz5ucK7t4nV3AG6y4MnuhV6kDCsSSDknly3ZxeEp1
	ikJ0mztKAV3jAZ4eRQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tzikn-008RMK-1P;
	Tue, 01 Apr 2025 21:02:37 +0000
Date: Tue, 1 Apr 2025 21:02:37 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, x86@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/platform/iosf_mbi: Remove unused
 iosf_mbi_unregister_pmic_bus_access_notifier
Message-ID: <Z-xUbXnU40c5ZkYQ@gallifrey>
References: <20241225175010.91783-1-linux@treblig.org>
 <Z7416P1rZPNMHQq7@gmail.com>
 <Z-vP7-PaLhsHozbw@gallifrey>
 <Z-wxRln0avv8Fz55@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z-wxRln0avv8Fz55@gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 21:01:18 up 328 days,  8:15,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Ingo Molnar (mingo@kernel.org) wrote:
> 
> * Dr. David Alan Gilbert <linux@treblig.org> wrote:
> 
> > * Ingo Molnar (mingo@kernel.org) wrote:
> > > 
> > > * linux@treblig.org <linux@treblig.org> wrote:
> > > 
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > 
> > > > The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
> > > > removed in 2017 by
> > > > commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
> > > > intel_uncore_forcewake_reset()")
> > > > 
> > > > Remove it.
> > > > 
> > > > Note the '_unlocked' version is still used.
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > > ---
> > > >  arch/x86/include/asm/iosf_mbi.h      |  7 -------
> > > >  arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
> > > >  drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
> > > >  3 files changed, 26 deletions(-)
> > > 
> > > Acked-by: Ingo Molnar <mingo@kernel.org>
> > 
> > Thanks!
> > Any idea who might pick this one up?
> > 
> > Dave
> 
> We can certainly do it via the x86 tree - I've added GPU/DRM 
> maintainers to the commit's Cc: list.

Thanks again! (hardly urgent, but just trying to clean up 
my backlog).

Dave

> Thanks,
> 
> 	Ingo
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
