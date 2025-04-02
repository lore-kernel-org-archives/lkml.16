Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014B12D1F1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628623; cv=none; b=Xo+3ORV9FqV0+tLrMldhm8oHdYbOucYxvLin21icGesxbMKn0jbgBTV3JorrCDjRN//NdvZd3mwbTunsFkt31f4mIQd0wW406VFDx+nvs+6wgTIuutU+CU6s8pOXvVeSuhdZfRpdGxt/jKJWCIIXP89s0wYTdJwC5coiRY9i+3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628623; c=relaxed/simple;
	bh=yRY4i3WLmUWyAE8o8P8TYb1tByrQrsV7UggoX7SedcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw/MrE1vOJiHcW9rx6+NcZ9p714bYz7Y8wOVxoc3A/WQmbb9c+xo1YIxsYYWRvLKc+UCq0yupwudoMAfckfNgeas5+P0+cItpGfeqC4Jz10ffaGsvZtw9mCtlk8PvgLPMRa5wqzmPWKCpU3QknbsovA7Ba+24kOIq4FC81nJEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=gc+pmdpQ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="gc+pmdpQ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399838db7fso207849b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1743628621; x=1744233421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc/zZ+DuPIPBwVNZBMJ0HujjjSUEiZ7ohcynsD7aA4A=;
        b=gc+pmdpQ0+9siX5+vh2aTvHczGfhbe/dnXiKMxqGEozOM+vqaV5XQqsXQzykxl5Vwo
         Nih5jA3YnBHYGVSAHafQtJ0btXDHDkL7rGAnmijaDWvnNCyEhaUzme0QytW49n4kiZVe
         HdarkrdOZxyqT6ysO33SUv2vg0QEiV5x3yg5iU9467esk+te3gSYy4Cv7NLAKQdwljp0
         N11HwzgMVhjZCAUaimSRcd2IgOimlYRxXO0EB7CmK2iEuvczPOiTtLiMtbR54t9Jnv4y
         Yl4ABma7Ogqt7yv2z7lcHmue6KGy2ip5KPV5M6gA7SorGVy2+zqplRTDgKhVknCHOAsF
         AIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628621; x=1744233421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc/zZ+DuPIPBwVNZBMJ0HujjjSUEiZ7ohcynsD7aA4A=;
        b=D0eN3Vuz9mCLaU0r5UpU/0Z5XQePq3jP36kJ5er5p/4Ln1QmJqFvsg4BlFFCymxjR7
         sidlEq6GirmwZ6MzeOaoYUNLLmMyLCpL4wQq7I5JaezlXXynrR3WGzQeihFA/4mYmZYC
         sJ3ZEIPfq+UKohm/TwFxnlUvNdh1daQzK+Ftnv5r9yfGrNDEsdBD2dh6DhpD1ZtNMdhk
         RMsoYBnbJ1/3wUsAMDiuTwaf5+sP8Oyct6fqdmOi+Q9rzdIzO3myN8Xq4zLovAl75yLT
         UVH9GMqwrz7UiJvXKf7bK54qcHJ1dTciMe0bUksdiOdZ9aSROF1tKdi2/jXn1eHtmQno
         ViRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJBgBqzXG1nbxpOP+jWlhM6TmOCI4sKq0RMsaZce3UlHCMaVL6fOtaIvHeT8Fby2KvWqlX0POMqk9wZ1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTPFQG8kFs43LaPJ4P+h2gWel6gLXWHvypwqw3kMsqhBXQHsI
	3jFK6KIMC0wVbYbNkUG+stn+P4XO2QNo0DnHibDRMem6QhjTOc9AaIN+JJrpI/E=
X-Gm-Gg: ASbGncuETbqXqbXuT7QQSUDsjds+gPYiSb47+jKJ3l7xY7aUxpPyVRrrfWuyvnTA70Q
	DvcaENdNA0gH4yEEC7Ll6BDbY9NrQK9mrzOtfFTmNrDfbJFPDr3cksZNvcxu0HS4wl5Z6CbxHCb
	nk3w+bKxa5qPNVKjAG10JeDWMvbqpjGLHgnTBlhVYzFcYyYQb0YlhlIi77QG/O68WycX/PpBBmr
	TubS0E53nuGTVRLrUdc4PgMlsKGHj0Y6H6AYhFJyOg5HW9pVFX1AEEqbOsLK4vlgQc+POAKx6VZ
	WrL3Z6oyiOm8HCCY9BEZPhm0CEUnLLtDzxdzkX3oCBe7p7O9Tjk+kZh/VwL9rt4j5vsC1W4e6TA
	Zf1uQEYVzNICVlXFbJgdS+ApbHYGZ
X-Google-Smtp-Source: AGHT+IETTieNbw/k3oeNyL1K32Iu4F4JpFYjFu/JJSEnpgavTw/4tVMQ23H2f0Cx5addp90wkEKvIA==
X-Received: by 2002:a05:6a00:4c17:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-739d6457e2dmr1406094b3a.9.1743628620577;
        Wed, 02 Apr 2025 14:17:00 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710636a3sm11855554b3a.94.2025.04.02.14.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 14:17:00 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1u05SC-00000003h3r-2yeA;
	Thu, 03 Apr 2025 08:16:56 +1100
Date: Thu, 3 Apr 2025 08:16:56 +1100
From: Dave Chinner <david@fromorbit.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Yafang Shao <laoar.shao@gmail.com>, Harry Yoo <harry.yoo@oracle.com>,
	Kees Cook <kees@kernel.org>, joel.granados@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <Z-2pSF7Zu0CrLBy_@dread.disaster.area>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-0sjd8SEtldbxB1@tiehlicka>

On Wed, Apr 02, 2025 at 02:24:45PM +0200, Michal Hocko wrote:
> On Wed 02-04-25 22:32:14, Dave Chinner wrote:
> > Have a look at xlog_kvmalloc() in XFS. It implements a basic
> > fast-fail, no retry high order kmalloc before it falls back to
> > vmalloc by turning off direct reclaim for the kmalloc() call.
> > Hence if the there isn't a high-order page on the free lists ready
> > to allocate, it falls back to vmalloc() immediately.
> > 
> > For XFS, using xlog_kvmalloc() reduced the high-order per-allocation
> > overhead by around 80% when compared to a standard kvmalloc()
> > call. Numbers and profiles were documented in the commit message
> > (reproduced in whole below)...
> 
> Btw. it would be really great to have such concerns to be posted to the
> linux-mm ML so that we are aware of that.

I have brought it up in the past, along with all the other kvmalloc
API problems that are mentioned in that commit message.
Unfortunately, discussion focus always ended up on calling context
and API flags (e.g. whether stuff like GFP_NOFS should be supported
or not) no the fast-fail-then-no-fail behaviour we need.

Yes, these discussions have resulted in API changes that support
some new subset of gfp flags, but the performance issues have never
been addressed...

> kvmalloc currently doesn't support GFP_NOWAIT semantic but it does allow
> to express - I prefer SLAB allocator over vmalloc.

The conditional use of __GFP_NORETRY for the kmalloc call is broken
if we try to use __GFP_NOFAIL with kvmalloc() - this causes the gfp
mask to hold __GFP_NOFAIL | __GFP_NORETRY....

We have a hard requirement for xlog_kvmalloc() to provide
__GFP_NOFAIL semantics.

IOWs, we need kvmalloc() to support kmalloc(GFP_NOWAIT) for
performance with fallback to vmalloc(__GFP_NOFAIL) for
correctness...

> I think we could make
> the default kvmalloc slab path weaker by default as those who really
> want slab already have means to achieve that. There is a risk of long
> term fragmentation but I think this is worth trying

We've been doing this for a few years now in XFS in a hot path that
can make in the order of a million xlog_kvmalloc() calls a second.
We've not seen any evidence that this causes or exacerbates memory
fragmentation....

-Dave.
-- 
Dave Chinner
david@fromorbit.com
