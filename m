Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E58239072
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602042; cv=none; b=cyZr+iROmDd32uM2WsHwqAb/qEA8hD5Zwjp7YuSFzeqyDeIIjON8SgXrjMh1P0lSx7NP+yTLz/cqLGPMVR+FPbuQm5Fo7Ncix1TLVcglintQCsb6O17uoB+HNEkudhSoN8eM31jMhTCLiJoJt8TaocnojylGD5Dkooxj2dHrR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602042; c=relaxed/simple;
	bh=sFz3S6P+ubR2AXzntU0wmC+tnrCYNAOMsylpPK3blDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=We18oJnoJJ75SRQVFNSzwE6IINdD2JI9JO7hA3Ki7QeXb9OO1IDuF8IlWmi/deSj1Ku8yzWTr9UXuxEH5xseBVwPFg00r+bPfLwkqYzTg6afK49Tl+Qu0p+/XZTvdUfO8Ad9Q3HmpRZxBVPuvcK2MOiwUdVjAtQ+n9+b0Dv4Wfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlhlIjzL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlhlIjzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743602040; x=1775138040;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=sFz3S6P+ubR2AXzntU0wmC+tnrCYNAOMsylpPK3blDw=;
  b=QlhlIjzLDyYuffV2/F0/dLTuyauIxzVsS0pQ2wlhVu6e30GNnCuYtbdQ
   0UnD91z6PvrNWBS+G7VkvM/ak9N7EFU5nqXrEo4+TT9GIYZNtEV7qs2TQ
   D+1ryRUo/1hg+UB+2V6wx3U4lluu1YysTJwrrVzrPUa+7IDEhcB1w9Cqt
   T4EV2wOZmNgmpqNFBhNTN9WZSY0I0RPvH8kLJHLCw82Yj/vd1tZvgssV5
   UnYapM/iQvw/E5TZF7P0K2kLCQ//6TUDVR14N2tbiOLHFspRhebEURzMK
   R9FlohjWZ9jCj7OTlB9Ocmuto2aHfNfleHuNc1+EKgtVA13n1Fd8SQskc
   w==;
X-CSE-ConnectionGUID: zsKN6nQ+QC2pz5InJz0/4w==
X-CSE-MsgGUID: PXkpd6glQ62g+A2JkM1tjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45110365"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="45110365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 06:53:44 -0700
X-CSE-ConnectionGUID: 4082ts5bRKuIxGU2W4wSOA==
X-CSE-MsgGUID: X4GUFp0PSbS8RF/HpzZwKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127194467"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 06:53:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <20250402130347.GB342109@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com> <877c433bys.fsf@intel.com>
 <20250401194649.GE325917@nvidia.com> <87v7rm203e.fsf@intel.com>
 <20250402130347.GB342109@nvidia.com>
Date: Wed, 02 Apr 2025 16:53:37 +0300
Message-ID: <87r02a1xge.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 02 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Wed, Apr 02, 2025 at 03:56:37PM +0300, Jani Nikula wrote:
>> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> > On Tue, Apr 01, 2025 at 10:42:35PM +0300, Jani Nikula wrote:
>> >> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> >> > So, I'd suggest a better way to run this is first build the kernel,
>> >> > then mine the gcc -MD output (ie stored in the .XX.cmd files) to
>> >> > generate a list of headers that are actually part of the build, then
>> >> > only test those. That eliminates all the kconfig problems. Opt out any
>> >> > special headers that really have a good reason not to be stand alone.
>> >> 
>> >> I think we'd want the drm headers pass the checks independent of configs
>> >> (apart from CONFIG_DRM). One size doesn't fit all.
>> >
>> > Why? That demand is just making it impossible to make shared
>> > infrastructure, and I don't think DRM should go off and build its own
>> > stuff just for DRM in a way that nobody else can use it.
>> >
>> > If you really, really, care then you can have your makefile codegen an
>> > "allheaders.c" that #includes drm/*.h and compile that.
>> 
>> The v2 series [1] generalizes the header checks and it's no longer in
>> any way dependent on DRM. For starters, each subsystem/driver needs to
>> decide for themselves which headers are to be checked.
>
> Yuk. The idea at the top of this email is alot better. Why don't you
> implement it?

Because quite frankly I don't have the time, and I've already spent a
disproportionate amount of the time I didn't have on hiding the turds on
the existing header test thing this week.

>> This can be expanded with more clever ways to choose the headers to
>> check. But we have to start *somewhere*.
>
> Bah, that argument only works if nobody has better ideas. There are
> meaningful technical problems with your approach, and proposed
> solutions here.

There are also meaningful social problems with the approach of making
people do a lot of stuff they didn't have time to do in the first place,
just to end up not merging any of it ever.

What I've been focusing on is to fix this stuff enough to make it work
for 6.15. If it's accepted, *maybe* I'll look at further improvements
for the next merge window. And if there's enough interest, there's a
baseline for others to build on. But right now, seems to me it could all
just be reverted in a whim, with all the time wasted.


BR,
Jani.

-- 
Jani Nikula, Intel
