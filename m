Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B534BA42
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 01:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643358; cv=none; b=eGuNrwJ++mW01L/1h9VtGvRHxo7ZYhm2l5B70iuBWYCGaZvURqBU9hQeR7FYrFSnmzVUfIHgP0MoF/ZkA/H3puG4IQ7e4Nn9e3G/nwK7TJ+MaTbOSX9YYPr6rp0ugtGmFV2KkBFGr2UQjSpH8Zegz3OAn9PYomJTYBFiSu+8dcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643358; c=relaxed/simple;
	bh=R8DoRHeCqkdDoh1zmRk66sV3y9QX4YBRKQLRivDDbzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6Y0OEWqGCSJ6NZcTaEERAzYSEAFhXqfR2yRhNxqWkA9fVoQmWo+vLpspZL9JRtRH6xLQbOXo5qhBNf7c5KBKQTnVKTivA/DAnt5ITsc1phYbMw1KcmRqHZZ+sKn7gPDpQoHIDxqhIWzOz9fsk835DDmC3Kvn+JFF4SStVs0zj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=0E3LJfFd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="0E3LJfFd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so427122a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 18:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1743643356; x=1744248156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H4rcAW6CiUL4EGwBHYCgCAM1aNdXUEavAlcbulq5QK8=;
        b=0E3LJfFdjJafcIs//Rs4tJKQOVEQV3xy7BGRprMxth/zweCnJNldaWlqtR6x4cRK6S
         UDytfkbDH+uTX5K60dwUsv0zmnG8vzGci9gB50uvAeXuBPQdFqk0z2pJB7NjsjACA2s+
         OcaZHKC9a99hP3g19Za9tEeXrgJMQDtYgEhNSkCj6ZztsSiMcz7T5sxfSym5PMHeEG8v
         0t4+SOlvZoJnXZ8GgJn3Jw/fqDeQpQWqMiXX/rpB7fFX9cMg1SpxXQgc3Pnic0KGOzMx
         ACwKB/5y0uPpUvEc1k6Ki4XtqDOHKNnyJclVj6Y78HePgrWfrHz/J6Gy/1AFiERpiYt1
         rp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743643356; x=1744248156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4rcAW6CiUL4EGwBHYCgCAM1aNdXUEavAlcbulq5QK8=;
        b=Xk85GR8fneYantGynZujuapzwWXnjoZNEWpbQS0pK5CWSxMH7v0xxKX5cE85SsciSl
         Ch4AfDcvw30ly8Dqs+wI/WhpuVQ1FDsnIquSXiKcVHr3VNcbSF9iQ9x5dWk/h+EHnJm3
         3VOpbMOYYe2RxwBGNkfP4KWJUtYVJ9yA0ASeP03tvfwkIJcmEQhC0QHrJeoWDPvSgmCR
         ffuCTW9HZOOYKgsHmJvUXwv7HVdzgt86e21VRg7iz3raPFxueZClKsXauRuKjaHOJ1rP
         U99QdG0ZIc7cGXvggzYnl+st0wrM6SZpzdfChV/V+9jjZbgfWzwh9lxGA19T54NL7iP3
         HzKw==
X-Forwarded-Encrypted: i=1; AJvYcCUgurWOliOuFbO8YizFO/FmioCC2+rKabvjNs5O4YLZ5+SHK6X6XGHfLhzQQ8RSDmyQa9epnKtYra2G+PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoI0yUfcF58bB8EoxoaKfrIvyCgNnu5uXWP0s10zcAsotzI+f
	9j94eH01hjTYn0A0mGNR1vBp06Hlm+g9ESJ9PkTQG8Giky+DaGHh2j9xDnfsJfk=
X-Gm-Gg: ASbGncu9yfwSdKn7zERUoCXFr2Si5RPIQB5wmNGupx5ZuTfLx/e40oyB+qPI2zXygZ7
	sdL5yuug6dZhNF/VjkBS2+XZOBFx75Uq8IXnf5bM3c/mI7Z+whXUR28xBTwFEzW1iqpYzAcE/xw
	+lqMQSFfoLdx/J8IHpNIheE5MWh2U2hSxpfTVOl25L2IMRxbOE5ZF2mqIZ0NdWF90Atn8G/pJ/T
	6SMCn4WmXHtSTPO3lZ0+gHZ9K0C+LkDbAwPriuKPvSdwwwqScvmCEhrK4rv7FfkeS10d14HrNuF
	pjxGUi0ARq2Q8pTvYTGEgJdeffkLyKztTpSD/B1aLcllkqnNum7zsE2NK+IHb+a2Z7a1oyBP50U
	/hdD2oe4=
X-Google-Smtp-Source: AGHT+IHMRa3sFAfbWro38Uxsf5pzpkFaygYzxLs0JzIu4oVQOmbGGlje/VbuGD8ibb/J/RjYbjK44Q==
X-Received: by 2002:a17:90b:2e0b:b0:2fe:a515:4a98 with SMTP id 98e67ed59e1d1-3057cbef71dmr1095737a91.31.1743643355647;
        Wed, 02 Apr 2025 18:22:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3058494a321sm162810a91.19.2025.04.02.18.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 18:22:35 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1u09Hr-00000003lXk-0oE4;
	Thu, 03 Apr 2025 12:22:31 +1100
Date: Thu, 3 Apr 2025 12:22:31 +1100
From: Dave Chinner <david@fromorbit.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Michal Hocko <mhocko@suse.com>, Yafang Shao <laoar.shao@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>,
	joel.granados@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <Z-3i1wATGh6vI8x8@dread.disaster.area>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <Z-2pSF7Zu0CrLBy_@dread.disaster.area>
 <b7qr6djsicpkecrkjk6473btzztfrvxifiy34u2vdb4cp5ktjf@lvg3rtwrbmsx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7qr6djsicpkecrkjk6473btzztfrvxifiy34u2vdb4cp5ktjf@lvg3rtwrbmsx>

On Wed, Apr 02, 2025 at 04:10:06PM -0700, Shakeel Butt wrote:
> On Thu, Apr 03, 2025 at 08:16:56AM +1100, Dave Chinner wrote:
> > On Wed, Apr 02, 2025 at 02:24:45PM +0200, Michal Hocko wrote:
> > > On Wed 02-04-25 22:32:14, Dave Chinner wrote:
> > > > Have a look at xlog_kvmalloc() in XFS. It implements a basic
> > > > fast-fail, no retry high order kmalloc before it falls back to
> > > > vmalloc by turning off direct reclaim for the kmalloc() call.
> > > > Hence if the there isn't a high-order page on the free lists ready
> > > > to allocate, it falls back to vmalloc() immediately.
> > > > 
> > > > For XFS, using xlog_kvmalloc() reduced the high-order per-allocation
> > > > overhead by around 80% when compared to a standard kvmalloc()
> > > > call. Numbers and profiles were documented in the commit message
> > > > (reproduced in whole below)...
> > > 
> > > Btw. it would be really great to have such concerns to be posted to the
> > > linux-mm ML so that we are aware of that.
> > 
> > I have brought it up in the past, along with all the other kvmalloc
> > API problems that are mentioned in that commit message.
> > Unfortunately, discussion focus always ended up on calling context
> > and API flags (e.g. whether stuff like GFP_NOFS should be supported
> > or not) no the fast-fail-then-no-fail behaviour we need.
> > 
> > Yes, these discussions have resulted in API changes that support
> > some new subset of gfp flags, but the performance issues have never
> > been addressed...
> > 
> > > kvmalloc currently doesn't support GFP_NOWAIT semantic but it does allow
> > > to express - I prefer SLAB allocator over vmalloc.
> > 
> > The conditional use of __GFP_NORETRY for the kmalloc call is broken
> > if we try to use __GFP_NOFAIL with kvmalloc() - this causes the gfp
> > mask to hold __GFP_NOFAIL | __GFP_NORETRY....
> > 
> > We have a hard requirement for xlog_kvmalloc() to provide
> > __GFP_NOFAIL semantics.
> > 
> > IOWs, we need kvmalloc() to support kmalloc(GFP_NOWAIT) for
> > performance with fallback to vmalloc(__GFP_NOFAIL) for
> > correctness...
> 
> Are you asking the above kvmalloc() semantics just for xfs or for all
> the users of kvmalloc() api? 

I'm suggesting that fast-fail should be the default behaviour for
everyone.

If you look at __vmalloc() internals, you'll see that it turns off
__GFP_NOFAIL for high order allocations because "reclaim is too
costly and it's far cheaper to fall back to order-0 pages".

That's pretty much exactly what we are doing with xlog_kvmalloc(),
and what I'm suggesting that kvmalloc should be doing by default.

i.e. If it's necessary for mm internal implementations to avoid
high-order reclaim when there is a faster order-0 allocation
fallback path available for performance reasons, then we should be
using that same behaviour anywhere optimisitic high-order allocation
is used as an optimisation for those same performance reasons.

The overall __GFP_NOFAIL requirement is something XFS needs, but it
is most definitely not something that should be enabled by default.
However, it needs to work with kvmalloc(), and it is not possible to
do so right now.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
