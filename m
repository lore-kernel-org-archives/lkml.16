Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A91EFF99
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510868; cv=none; b=i/5lbcV2XKn/7tPkdu8WD7bsFfHM1hKyqH2Qtsx6MCAhEFgf6t7Ov0PQ17Xs6KK4SeoBFNCciiVo34CTF9P7/j/v84ZQuhDlo4bc09Znx8FT3+60rrLyko3GESl6/DlaYfwydZpRCUnW9lsDw0rwU8w6jspJVpV6YcKfp/6w8qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510868; c=relaxed/simple;
	bh=WpDvcGC95FdqXMwYCtR6rzRwchjYHGN+FRT/YTcwsfM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GhL5MfUjbRKZVjJc7ePMMA+nIyJPkR2x7bMSkpiizHVn4+ct9zI4CZ1CKZcxUmaJO5+ZRsIV5urO6LUFRMu3wf/FotEHthXHPe5/ShZI2XkUKhStSVwlJNL+wpaBn9x4BaU+mfQSyNxBtafLboZiCCeBpxy3V354cvcvDzvHIVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVepWIEW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVepWIEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743510866; x=1775046866;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=WpDvcGC95FdqXMwYCtR6rzRwchjYHGN+FRT/YTcwsfM=;
  b=cVepWIEWJKEo3NAOShTJ98G6aeqGxL0fAq1fC2ja/ropOh7KbG5JtQtB
   EB9qsFHtB0GYVPauoicAKmhaD4FFyxT2BNdgouzMyd5O0hPfXJdY7a4/t
   hT5tZel/7x4mHKptXdudJKj5spbSkIDPM9dj8n9uPI8pid5HlFX3fU5Qe
   /POsDBWYDYtSLFDdLiDyDfyRBRMcXvuFEEGyrt2nfNnePnjSzOf1ERzYc
   xwwzMvov7c2WltHnk38MvQ+BchmnBXQCsFyLY9Q0NVrQYYmmre98k/Dd8
   CFcexG2PtctwgCGhQg/O8x8CIXVsf0dMLWwBU+m2ma99/jPJoNu12oXqF
   w==;
X-CSE-ConnectionGUID: 4g3yefA6T/y96Z1REsxqFg==
X-CSE-MsgGUID: Vhy9Z7+MQD2BdQV/iS9R9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55468741"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="55468741"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:34:25 -0700
X-CSE-ConnectionGUID: Xk03fOLUR8mypOoBYImmPA==
X-CSE-MsgGUID: 6u7+0urFQVeqnH8RBPzTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131509185"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:34:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, simona.vetter@ffwll.ch, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com>
 <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
Date: Tue, 01 Apr 2025 15:34:20 +0300
Message-ID: <87r02c2h83.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 31 Mar 2025, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Mon, 31 Mar 2025 at 03:17, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> I suggest a Kconfig knob to truly make this opt-in, only for developers
>> who actually want it.
>
> So honestly, the thing I *really* hated was the horrendous naming.
>
> I live in auto-complete. I basically never type out file-names, and I
> replace keyboards every once in a while because my TAB key has worn
> down (not really, but you get the idea).
>
> And *if* this feature is useful - and while I disagree about the whole
> "header files have to be self-sufficient" as a general rule, I can see
> it being useful for uapi headers - then dammit, the file naming needs
> to *DIE*. It needs to be taken out behind the shed and shot in the
> head, because it messes with TAB-completion.
>
> Having "this has been checked" turds that live in the same name-space
> as real files is wrong.
>
> In the kernel, we often hide them explicitly (ie using the dot prefix
> to make them hide, but also to make them not mess with auto-complete).
> That's an option. But some people hate the hiding, and if that's an
> issue, just put it all in a different subdirectory entirely.
>
> Yes, I realize that you guys may live in the whole "different
> subdirectory entirely" world of doing the whole build in a separate
> build directory, and might say "why are you working in the same tree
> as the generated files in the first place if auto-complete is so
> important to you".
>
> And to that I say "because I equally often look at the generated
> files". When they make *sense* to look at, not when they are
> auto-generated makefile checking crap.
>
> So please. This feature needs to be done completely differently.

I've polished, or, more accurately, hidden the disgusting turds [1]. I
hope this is an acceptable approach.

I've never claimed this feature is universally useful, certainly not for
all of include/linux, but I think it has been more helpful than not in
i915 and xe drivers. And now hopefully drm more widely. I wish kbuild
had support for it in a way that drivers could opt-in *if* they wanted
it, but without copy-pasting the boilerplate.


BR,
Jani.


[1] https://lore.kernel.org/r/20250401121830.21696-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
