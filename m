Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F539461
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535704; cv=none; b=MlX7w1vxnf0DQocYPtDD9af7zSGaA3XhnKoE4afUEJ1h9Th1Ky4LtYUKd0bfBAD6Qk4yrvjVlZSDhWaYSMuASi+cstMEeWqPKGeYf4k5LMY/BMku0CqFMWLMbGlJz2yrEU53zLMH9FBaiirpsURX0pfKGrRZndLOciSnUTtgql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535704; c=relaxed/simple;
	bh=BoO3X5sv35GYBzLBsKhBYN5I1B1lDr/gYUiTCSctubs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N0WxksLlxR0k64BIF9y/kulslGUtuwQC6Ju2hFNIJgl6TuUCfUJRexLzDWZBKL5rzYPj0kfOf2GScNyPam14duq00hWqsYTT4erO9EDKXvFLNimF5UZhvK7DIuAAHD0WEAxnduPN4dKuNGi1MCuV3SJ/jMg/ExiUEtrduvN3MWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBJs6vAc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBJs6vAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743535703; x=1775071703;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=BoO3X5sv35GYBzLBsKhBYN5I1B1lDr/gYUiTCSctubs=;
  b=TBJs6vAcvrqq3P/0e5UnbcF64lFFwgq5Q8GznHpYcfN5nuk8tEo3Japo
   7dwEUWvQxYrxAEcNTfkGRPGfDMb4x5KN5FDZuMwcCQ2Vh6g2HZEczAOyN
   3Gy7+hTxDrn/LzhVr2gzjiKuBCCqOG6EvLmyF8EGJeDlQsuBKBTTyMP5E
   On74F7flJWOw9nMwTQgBsER/xKDSjaqp7dDXQF82JKO4OgoxbguiW8xuY
   hrXvbtUjQS7ZUcV3HoRTKsHz7f5286Z3xVhdmEPwvkduZ4eGxxXIfkqU6
   SAGyqPgb/SGhr+z7vwLLoOh0aWecbz7peaD9X0LS+3YVjeIquF6CqJTuX
   w==;
X-CSE-ConnectionGUID: GciFQRfoREyPr2glI4iTjg==
X-CSE-MsgGUID: aBFAfsNRS++biy4A9qIx/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48746210"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="48746210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:28:22 -0700
X-CSE-ConnectionGUID: 7FkweBzBTBKclc8lK0FguA==
X-CSE-MsgGUID: +7L/gaqXTxah024DgvSOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131678505"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:28:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
Date: Tue, 01 Apr 2025 22:28:16 +0300
Message-ID: <87a58z3cmn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 02 Apr 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, Apr 2, 2025 at 1:12=E2=80=AFAM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Tue, 1 Apr 2025 at 05:21, Jani Nikula <jani.nikula@linux.intel.com> w=
rote:
>> >
>> > The header checks have existed for uapi headers before, including the,
>> > uh, turds, but apparently adding them in drm broke the camel's back.
>>
>> The uapi header test things never caused any problems for me [*],
>> because they don't actually pollute the source tree.
>>
>> Why? Because they all end up in that generated 'usr/include/' directory.
>>
>> So when I look at the source files, filename completion is entirely
>> unaffected, and it all works fine.
>>
>> Look, I can complete something like
>>
>>     include/uapi/asm-generic/poll.h
>>
>> perfectly fine, because there is *not* some generated turd that affects =
it all.
>>
>> Because for the uapi files those hdrtest files end up being in
>>
>>     ./usr/include/asm-generic/poll.hdrtest
>>
>> and I never have any reason to really look at that subdirectory at
>> all, since it's all generated.
>>
>> Or put another way - if I _were_ to look at it, it would be exactly
>> because I want to see some generated file, in which case the 'hdrtest'
>> turd would be part of it.
>>
>> (Although I cannot recall that ever having actually happened, to be
>> honest - but looking at various header files is common, and I hit the
>> drm case immediately)
>>
>> Would you mind taking more of that uapi approach than creating that
>> hidden directory specific to the drm tree? Maybe this could *all* be
>> generalized?
>>
>>            Linus
>>
>> [*] I say "never caused any problems for me", but maybe it did way in
>> the past and it was fixed and I just don't recall. I have definitely
>> complained about pathname completion issues to people before.
>
> I know you dislike this, and I NACKed this before (but too late):
> https://lore.kernel.org/dri-devel/CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=
=3Dr-sJk+DxigrA@mail.gmail.com/
>
> Compile-testing UAPI headers is useful
> (and I believe this is the only case where it is useful)
> because userspace is independent of any CONFIG option,
> and we have no control over the include order in
> userspace programs.
>
> In contrast, kernel-space headers are conditionally parsed,
> depending on CONFIG options.
>
> You dislike this feature for the reason of TAB-completion,
> but I am negative about this feature from another perspective.
>
> We cannot avoid a false-positive:
> https://lore.kernel.org/all/20190718130835.GA28520@lst.de/
>
> It is not <drm/*.h> but <linux/*.h>
> However, it is annoying to make every header self-contained
> "just because we are checking this".

As I explained earlier in the thread, it's not *just* about the headers
being self-contained. It's *also* about checking header guards and
kernel-doc, maybe other things in the future.

If it's possible to do opt-in build checks for this, and catch all of
these pre-merge, why shouldn't we? We can catch a whole class of build
issues and bypass the subsequent fixes with this, and make life easier
for us.

> Actually, it is not a real problem when the relevant
> CONFIG option is disabled.
> I did not interrupt him because he was doing this
> checkunder drivers/gpu/drm/i915/.
> ()
> But, I am opposed to expanding it to more-global include/drm/,
> or any other subsystem.
>
> In my opinion, the right fix is
> "git revert 62ae45687e43"
>
>
> If we continue this, maybe leave a caution
> in capital letters?

Or maybe let the subsystem and driver maintainers decide?

I don't think there's a *single* header under include/drm where them
being self-contained depends on a config option. I'm sure there are
plenty in include/linux, but I wouldn't say they *all* do.

Maybe help and support us in generalizing this in scripts/Makefile.build
to avoid the boilerplate, and make Linus happy, instead of trying to
block us from having nice things? Please?


BR,
Jani.


>
>
> diff --git a/include/Kbuild b/include/Kbuild
> index 5e76a599e2dd..4dff23ae51a4 100644
> --- a/include/Kbuild
> +++ b/include/Kbuild
> @@ -1 +1,3 @@
> +# The drm subsystem is strict about the self-containedness of header fil=
es.
> +# OTHER SUBSYSTEMS SHOULD NOT FOLLOW THIS PRACTICE.
>  obj-$(CONFIG_DRM_HEADER_TEST)  +=3D drm/
>
>
>
> --
> Best Regards
>
> Masahiro Yamada

--=20
Jani Nikula, Intel
