Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBA1FAC4D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507465; cv=none; b=oDuCPVXZPM1Gkq7VdnJeUnAYDUQNpwCc9xOeUEqrA8cb2otwSpFzpR+2o+oYdEfZpPBNu9ztCL5zoaW4VmYJC+FqZAbfPaC8Qantm6i6RF4nuQVLCxijQjwjZYtFo3wH7cgueEvkU/+1NeYYiuzcR29F/lYE1d+IcPLrb86jSnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507465; c=relaxed/simple;
	bh=pcxsqCcTw4dX2O/eGGOpIr7n1wSZLa6CBpNkqJb13Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYYMgkNDqyxNpxza+ERBZlQn/ZIdoX+cmQ2RY9iU/PFYRCiY64SMVltuwKQjIPiyOM4b9WEt3E0YFMHuuzu5uUscyH+bjJ5xq75yfzVxr87V/3lZqh5P85vRAfIYATpX9D70DyNEW6pvHyzy0CytnMxCnQ1V5yOYnjDEUfe/D1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=jfjrv5Fy; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="jfjrv5Fy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=HE/RSUboQWuGBGJkjqKZ/6rnsYTFUJOgslonvJ26GG8=; b=jfjrv5Fy1QlfGLRn
	Lo1FOEFMnwl1Ojdlg5iC5keO3lVbfbUzvNplXaUCaQp2+kcL2709CKodrLfgjziaPDaVWkdi8Rqt3
	4/e6LvDb+ifBcFT59Uu76xm9LB5H4HRd5J9S2F4uM5Bir9c8SLxvwLzVfsoYqHhrNxWlTZIPQfvMn
	GBwH7fQ6AxY9XClWJuygXFekMjx0rVjc1ZzXBp9KWkJpLBYfVzOlAeiuyyOywKW+cQg0UuM1L7S0U
	yxEX3Z2pZnblRW2TvamJjwl82DaVW/nh0JJ9kgqWSgFusuv+qZ4jezTZbL4mwSYFOV8lCstlkPY3F
	jYonIdiMrlGda0ZjJQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tzZvj-008Jrn-1V;
	Tue, 01 Apr 2025 11:37:19 +0000
Date: Tue, 1 Apr 2025 11:37:19 +0000
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
Message-ID: <Z-vP7-PaLhsHozbw@gallifrey>
References: <20241225175010.91783-1-linux@treblig.org>
 <Z7416P1rZPNMHQq7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z7416P1rZPNMHQq7@gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:36:51 up 327 days, 22:50,  1 user,  load average: 0.05, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Ingo Molnar (mingo@kernel.org) wrote:
> 
> * linux@treblig.org <linux@treblig.org> wrote:
> 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
> > removed in 2017 by
> > commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
> > intel_uncore_forcewake_reset()")
> > 
> > Remove it.
> > 
> > Note the '_unlocked' version is still used.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  arch/x86/include/asm/iosf_mbi.h      |  7 -------
> >  arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
> >  drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
> >  3 files changed, 26 deletions(-)
> 
> Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks!
Any idea who might pick this one up?

Dave

> Thanks,
> 
> 	Ingo
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
