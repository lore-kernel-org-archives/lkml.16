Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C9EBA4A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604910; cv=none; b=saVe7uOJAaoyb3zvgO7uGMDLXTt1ZBSWT/VX3DGGTcaK+iLkmURu5FlkdrjYWbvdW+IZ5JpZzQLpO7PWmW+Fa525CY9XEat3ui0NRz7CtA443sYWDvtsoNjCF3X0uYa5c+1APc7dCF9sa4eYgZae722BHLMp7QE5kzyKmkyxyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604910; c=relaxed/simple;
	bh=reQKOsEwp2FYk/6VWttUcuDGDB8R3cKIuV+1d4rvuEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2OMiwXIE1OINqeFm5oS02CTLV9v+4+tWvFXCp/dBqPQtBl8P4ACdDJLS0lWXBzqaszyRgPxG9pEsmViABk4rpTiEemha7vooAPa+dT0cd9cu5PbQo4QMcQh0wfVG3yQyZBHnH/vy8ruSJmYprX+VG83XwQjgeCyVh90a/Kzln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=fouvFlHI; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="fouvFlHI"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so12905407a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1743604907; x=1744209707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGEiASZSro6SNX8sjA9X9P0aIH8e4cz3zuHFM4t+mVc=;
        b=fouvFlHIb0ZK7WEdxR2weyH6fCoPLUhr26jGIYN9DdpoyzyNzAl4jw6Dygg2M3rjfb
         jvBHYrFt3r3hR3hZLMpplKpzoxAOCnBWggHxgVRwAuILVbHEbIC/DS1pOGvpcqm3p/p8
         UezRbpYjcyIwL9E2RcEumygnooFkF5m49D680=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604907; x=1744209707;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGEiASZSro6SNX8sjA9X9P0aIH8e4cz3zuHFM4t+mVc=;
        b=O+q/I4ToDGK2FLxdSrBHCljbWGswbYsakyLU0FA5UeZQXFEIny2Hy5s0xwjDS4EC/N
         sPwsEHIw3eTBUHt5S6FoufH7z3uOR8E7nQ+oQ9h57VCUwLyqyDZUyACaV8fGDOHFTmy6
         S42OK4OXRkXMXz9oJA0hJOnsgO26RUyOECIbAIBGwrSuxBYBsRBBbU6zaie0lvInTv4K
         YaQuW4yDvjLmFWEdd+mHGpn36Sft8J8wci2udIDo1kv08jiD03ovKMtRR8mBhIjTovbk
         kb88O1omoyQj8sXOSKuX014onn6Fx2FbaQdw4R0FP6v5WnQchIpItw7dM1kMUFo5RtmO
         ezhw==
X-Forwarded-Encrypted: i=1; AJvYcCXWMgOWbX5+RK0XV+O4gU31uO+cWsRa6plLWMXyiUaJcXVpG8UsKDnXR6U9fNSYZOYEe7CuKgKD/HJa+Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWslZXb7EqBXKgUkR8vVc1hXtbIR1qUjjJac7ugFkWy/Dl63VS
	Y9Nwhd6J+IvONPUE6aShE/40pVJCL15tqhh0x4yLEJYXgk8hASj/9ffxyQnleswVQxs/OJXL9Ye
	CN8A=
X-Gm-Gg: ASbGnctdmRgxYJDmphlNBHE2b2it0P1cmyPOHBhubM1TMJkxR8GsJHGbCLiLow0RQ/+
	CL6Kg0k6tiPluphyKISs2YJnmPfVx36XBL0rf7gWnSpuvi8mslFTx90AN42VjjbQ/Dxf+saKhn2
	PT+wvUXkOiFsCf24FZCR76ZdMXoTKOzxTArb8UU5G6IEm9992UpgOCNQEky+G/NlYKzrxvGQKfp
	iqZX/47na0ffdNgNeV35URHqY1o9YDjHJSeL/yw9BhhTrHOi4nnHA7fvVQ/j78Fu51+pzX1u+1y
	vF/8XWLuAzaDn44xvmgyhBUP51AiourksNuhP0Alc2OYcCltcztJ21w9plZNkABGK5w=
X-Google-Smtp-Source: AGHT+IGbB74rYUMKNwVBsDPnpOSl78Nh+zCx8TOFn5vmCeSSrll7rHTt8SFf0CFrfFvH9mieMMSzJg==
X-Received: by 2002:a17:907:97c4:b0:ac7:18c9:2975 with SMTP id a640c23a62f3a-ac7a1abde58mr206719466b.48.1743604906698;
        Wed, 02 Apr 2025 07:41:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71973097dsm911236766b.184.2025.04.02.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:41:46 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:41:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dave Airlie <airlied@gmail.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
Message-ID: <Z-1MqJen5o0yhoQQ@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dave Airlie <airlied@gmail.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>
References: <20250331133137.GA263675@nvidia.com>
 <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com>
 <877c433bys.fsf@intel.com>
 <20250401194649.GE325917@nvidia.com>
 <87v7rm203e.fsf@intel.com>
 <20250402130347.GB342109@nvidia.com>
 <87r02a1xge.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r02a1xge.fsf@intel.com>
X-Operating-System: Linux phenom 6.12.17-amd64 

On Wed, Apr 02, 2025 at 04:53:37PM +0300, Jani Nikula wrote:
> On Wed, 02 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Wed, Apr 02, 2025 at 03:56:37PM +0300, Jani Nikula wrote:
> >> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >> > On Tue, Apr 01, 2025 at 10:42:35PM +0300, Jani Nikula wrote:
> >> >> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >> >> > So, I'd suggest a better way to run this is first build the kernel,
> >> >> > then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> >> >> > generate a list of headers that are actually part of the build, then
> >> >> > only test those. That eliminates all the kconfig problems. Opt out any
> >> >> > special headers that really have a good reason not to be stand alone.
> >> >> 
> >> >> I think we'd want the drm headers pass the checks independent of configs
> >> >> (apart from CONFIG_DRM). One size doesn't fit all.
> >> >
> >> > Why? That demand is just making it impossible to make shared
> >> > infrastructure, and I don't think DRM should go off and build its own
> >> > stuff just for DRM in a way that nobody else can use it.
> >> >
> >> > If you really, really, care then you can have your makefile codegen an
> >> > "allheaders.c" that #includes drm/*.h and compile that.
> >> 
> >> The v2 series [1] generalizes the header checks and it's no longer in
> >> any way dependent on DRM. For starters, each subsystem/driver needs to
> >> decide for themselves which headers are to be checked.
> >
> > Yuk. The idea at the top of this email is alot better. Why don't you
> > implement it?
> 
> Because quite frankly I don't have the time, and I've already spent a
> disproportionate amount of the time I didn't have on hiding the turds on
> the existing header test thing this week.
> 
> >> This can be expanded with more clever ways to choose the headers to
> >> check. But we have to start *somewhere*.
> >
> > Bah, that argument only works if nobody has better ideas. There are
> > meaningful technical problems with your approach, and proposed
> > solutions here.
> 
> There are also meaningful social problems with the approach of making
> people do a lot of stuff they didn't have time to do in the first place,
> just to end up not merging any of it ever.
> 
> What I've been focusing on is to fix this stuff enough to make it work
> for 6.15. If it's accepted, *maybe* I'll look at further improvements
> for the next merge window. And if there's enough interest, there's a
> baseline for others to build on. But right now, seems to me it could all
> just be reverted in a whim, with all the time wasted.

Yeah, this header test stuff is clearly not as easy as it looks. Even for
drm Jani had to fix up a few things every time this effort was restarted,
and we have very modular and clean headers and really try to make them
stand-alone. Rolling this out as a flag day change is just not realistic I
think, it's just setting yourself up for failure. I think there's two real
optiosn here:

- Gradually roll this out, ideally with support in main Kbuild so it
  doesn't have to be replicated.

- Just shoot it down and move on.

This isn't a refactoring, it's pretty substanstial change in how headers
work and how people need to treat them. And you just never change people
with a flag day approach, that doesn't ever work. And if you try, you'll
just piss of a lot of folks who are taken by surprise by your change.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
