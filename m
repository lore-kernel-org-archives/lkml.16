Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68E2951A0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021440; cv=none; b=GWRwZqJpGTrkAVS2ziVLx/rkhNHEUqT53BhhXYFkLARP4o/mwbhtBo9UeBMEchT1Bt9CMZp34rqAkbvJ+KgVFzr2JlZJFd51YycXFCjYpXk2pgOFx76Km1NQr/9sowGkVko+dXYLHgz/ZXIo3SD2Arg6cnkT3YeB58SnK/pVZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021440; c=relaxed/simple;
	bh=5NnJtdqKYJVhQjds2kWd0SpjFMdEvQzFH06HhWnZsfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUJxXRE4DKhzx1tCLwwJX7ZghaZkvrm2O3AGRNDg/QrmRVXMuhpJWE5tkIHlZEv1ERGysvEVjXUphjl1Mk6XTvnucQ/9cpfEgmPSnRy4VE6gurWzVIdOvXJzVxAIm3fxcer0vOXIuAn8IiGHookh3jvu7x99jiot9wrTijNPitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iij45RS+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iij45RS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751021439; x=1782557439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5NnJtdqKYJVhQjds2kWd0SpjFMdEvQzFH06HhWnZsfw=;
  b=iij45RS+ocV1b6ULDe+4/i5C9EBL/cNEZfS40QVLh7+Ar94rsWPwRrA0
   gh+EKdK4H8D5pq34yd6D3P/hPcIqv0gi4Qff8wqMcFbFTk8ar/+chQgXd
   YIEzdyJZepb1gzRgo9jus83y27Btrv7XrPG7yszlfRIprjeu3S/AwD6+G
   gASiIcpyb3lgp83cntgAFnjMrg1fKsHJKrIXpkcH3HY9If2LElmCMpx6N
   HyxXFeVthWYMz6vNPtf2soOKXYlV/wkS00bm0xx384C7M9t9Smzyx5cCf
   eZcE74i3gT99Py2+pppKyrJB0/Lw6bYNPNIRrkt6tN8q/S8sSxuqVPMgJ
   A==;
X-CSE-ConnectionGUID: O7jcoGlyT2amq/EY6qRqtg==
X-CSE-MsgGUID: IfFriJd3QgO3K2HwiykOug==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57137858"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57137858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:50:35 -0700
X-CSE-ConnectionGUID: WHbIMHNNRxCj2KkPBEuXhw==
X-CSE-MsgGUID: OMAEJkvfR86Ayy23cfPkfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153304717"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:50:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV6f9-0000000ASM6-1593;
	Fri, 27 Jun 2025 13:50:31 +0300
Date: Fri, 27 Jun 2025 13:50:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
Message-ID: <aF53djlieUNF_-aV@smile.fi.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
 <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
 <aF5eL1o3WNo3Q7_p@smile.fi.intel.com>
 <87wm8xbkyh.fsf@minerva.mail-host-address-is-not-set>
 <aF5w4QTbSkebYbk2@smile.fi.intel.com>
 <87ldpdbhj8.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldpdbhj8.fsf@minerva.mail-host-address-is-not-set>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 12:33:31PM +0200, Javier Martinez Canillas wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

[...]

> >> That's just because there is an entry for arch/x86/. The problem then is
> >> that there isn't an entry for drivers/firmware. It was orphaned then just
> >> because it was moved to a directory that has no entry in MAINTAINERS.
> >> 
> >> > See the difference?
> >> 
> >> There is no need to have such a rude tone.
> >
> > It wasn't meant to be rude, sorry. The point is that any change in
> 
> No worries.
> 
> > drivers/firmware/sysfb* and respective include are not visible to (any)
> > maintainers, they just might be sent for a luck of somebody to pick
> > them up by browsing the LKML for such things.
> >
> 
> Right. But get_maintainer.pl still reports I think the correct people to Cc:
> 
> ./scripts/get_maintainer.pl -f -- drivers/firmware/sysfb*
> Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/4=100%,authored:2/4=50%,added_lines:11/43=26%,removed_lines:5/11=45%,commit_signer:1/1=100%,authored:1/1=100%,added_lines:1/1=100%,removed_lines:30/30=100%)
> Javier Martinez Canillas <javierm@redhat.com> (commit_signer:4/4=100%,authored:1/4=25%,added_lines:19/43=44%,commit_signer:1/1=100%)
> Alex Deucher <alexander.deucher@amd.com> (commit_signer:3/4=75%,authored:1/4=25%,added_lines:13/43=30%,removed_lines:6/11=55%)
> Tzung-Bi Shih <tzungbi@kernel.org> (commit_signer:1/4=25%)
> linux-kernel@vger.kernel.org (open list)

The problem is deeper. This is default behaviour of get_maintainer digging
into the Git history. In the past people were complaining (a lot in some cases)
that they were included in the threads by a mistake because they made cosmetic
patches or the treewide change while not being interested _at all_ in looking
after the certain file / driver. So, with --no-git-fallback it gives nothing,
expect LKML.

> In my opinion both Thomas and me have much more context and knowledge of
> the sysfb codebase than the x86 maintainers. It was just for historical
> reasons that the sysfb code ended in the arch/x86/ sub-directory.
> 
> But you are correct that dri-devel at least should also be in the Cc list.

See also above. Depending on the options it may still give bad result w.o.
explicit mention in the MAINTAINERS (or via glob).

...

> >> >> > +F:	drivers/firmware/sysfb*.c
> >> >
> >> >> I would prefer these to be in the "DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
> >> >> entry instead of "DRM DRIVERS" since the former is what has most of the
> >> >> code for the sysfb infrastructure.
> >> >
> >> > Then do it, please, fix the above.
> >> 
> >> Part of the review process is to give feedback to patch authors. I don't
> >> understand why you expect me to fix an issue you brought up just because
> >> I ask you to rework your patch a little.
> >
> > In my humble opinion, the author of the patch that makes the problem appear
> > can help to fix that as well. Are my expectations too high?
> >
> > In any case, this was an ad-hoc patch due to the second one, so this one
> > may be considered as a administrative bug report.
> 
> That's OK, but it wasn't framed as a bug report but as a patch and that's why
> I gave my feedback. But I'll post a patch and add a Reported-by tag from you.

Sure, thanks ahead!

> Thomas, I think we can then only merge patch #2 and I will take care of #1.

I just sent a v2 without the first patch.

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko


