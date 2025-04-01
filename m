Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8C2101AE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743532366; cv=none; b=D+Of/9Y2E3fm2DWDIrXzSA005lDFzTNj1VucXkxxpEHJWMGiw/40GrXZ+AstTLScMDtyYrBQdjZiDI2BMeS0rs3h4LTqQMUlQ8f8rCXA1kA7g68XEtNOrDEG3i0eo+8IymgMQ9DCTScWnelapq+LglETqrpTyOb9iCyFiTGk7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743532366; c=relaxed/simple;
	bh=cvFFTYcrBni4gtaak/3Jl+TFfhXTOIlg4eTTzXG27vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAjRCcx0n6+NjZIQcxYKZGrMdtrbM/Fy33Fc5lPeRoRvH1bJ3AwWl4ntVRjljLVH6rlf4+4zq9Wgw1ALzg5M9TcF+Z3W4WylAM0kSaFa+DQx8a82uPPcrZZ2RU0fCtbbQILQeKLDcWYlDaB0zcooi8Dc/7Dc+Jxo5eGlmhg9LH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHLAXknC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHLAXknC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84948C4CEE4;
	Tue,  1 Apr 2025 18:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743532365;
	bh=cvFFTYcrBni4gtaak/3Jl+TFfhXTOIlg4eTTzXG27vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oHLAXknCZvHhCqvsy3VBdjk3S1cbt7IlZdddNnys+8NHFQdMcM7knQiDoEU3x9hkV
	 Ew46rGzwSzTC0oSSqHBGjK4GX5tTlESfkF+Rl4h2nWk26E1tV1hpuGTdXtWZSaHJyj
	 8bi0ERfeMDYObuWLjOgcucR1CMAJMGZVno4/nXVOaoLaB0WliRhsDB753mr5shAHWu
	 FkLZU2VSkpdUwTDYmY3GMmVW5y2kd+7OgCNJI3w0JzkPxnk5yeCBjZLkXtgB03Lox3
	 yPFsJ5/twotmU6LcPKMd1cOURLXoyKyQ3x1bxkqHYUYssNjERQciijXMnHLGCgcR7/
	 n6CskBWbhPsOQ==
Date: Tue, 1 Apr 2025 20:32:38 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, x86@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/platform/iosf_mbi: Remove unused
 iosf_mbi_unregister_pmic_bus_access_notifier
Message-ID: <Z-wxRln0avv8Fz55@gmail.com>
References: <20241225175010.91783-1-linux@treblig.org>
 <Z7416P1rZPNMHQq7@gmail.com>
 <Z-vP7-PaLhsHozbw@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-vP7-PaLhsHozbw@gallifrey>


* Dr. David Alan Gilbert <linux@treblig.org> wrote:

> * Ingo Molnar (mingo@kernel.org) wrote:
> > 
> > * linux@treblig.org <linux@treblig.org> wrote:
> > 
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
> > > removed in 2017 by
> > > commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
> > > intel_uncore_forcewake_reset()")
> > > 
> > > Remove it.
> > > 
> > > Note the '_unlocked' version is still used.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  arch/x86/include/asm/iosf_mbi.h      |  7 -------
> > >  arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
> > >  drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
> > >  3 files changed, 26 deletions(-)
> > 
> > Acked-by: Ingo Molnar <mingo@kernel.org>
> 
> Thanks!
> Any idea who might pick this one up?
> 
> Dave

We can certainly do it via the x86 tree - I've added GPU/DRM 
maintainers to the commit's Cc: list.

Thanks,

	Ingo
