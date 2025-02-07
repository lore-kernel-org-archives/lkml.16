Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16021195FE5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949362; cv=none; b=ABC9Uz1kHJ5wyTOrt4Pnksw2pJH6IkD/nAJZrXxSLhG/mcaRnKFGH26jlm8mAvGAfxBh9P7Rbgmep7djlJIYShzbYmpxLNXD4VwBPlq42OWkZSs4hTk0f4C9f/c/w1iLfsTL4o11cnjs7/f6PNIpl6FtnIOeh8Hib9TS7VkSQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949362; c=relaxed/simple;
	bh=8IjbTZjGhl0GZHrQmy0RQjKJ1BrqeqmFZwEnevxtmfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JATfMEc/vjuxrmEVtFpt6uWhhsEA6TXh4rFGqdErYb//a0CYawIwCO3+B7k3/ih0qz4a1cgY4Y3uQ9+RiZTvC/3b2tMNwt6RLayCzggAmFdJXlN1yxNaaWGBaVY9xVZs8Lo7l154u8iaMvQwRZqhmbNFHiMe4qazHcvgZQadi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=VQcAQiuL; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="VQcAQiuL"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e5b1837d182so2880808276.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1738949360; x=1739554160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pe1yEE3okQrQxigiaI6rQOtX6Rzf5xYLvQlxPdLkV2A=;
        b=VQcAQiuLj+glB/ZUYkwGEzkzG33Zm3ToRouT4FwPOujjKcFva6JEjhHW4z/E60I+6v
         eCBnl8dJ71ugxTgv1DgGD8ap2gMzwHjpNVt/k58GAYEpPERUyGrpYoT+1rYB4MLCljWV
         h/YQIRciaZ31BirYnZ3MhFw+zwj51dbw9lun64nkZfIG+R4jt7HaBLWkp1fwdsaHiG0s
         diWR9hLeb+ZemgFQG3v8HHkZzi4CXgmMexDomznt0Ux/D7T+qtrRtA0g6zZVn++25ooq
         K7OpU8LSiUzRNVSGLYm6uh2M+B0Q55WBcKVlEphcGyAB+NXrYtmg2sDwgX7FHRtD8Tzu
         O3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949360; x=1739554160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe1yEE3okQrQxigiaI6rQOtX6Rzf5xYLvQlxPdLkV2A=;
        b=OTfJCbcm7tFXXljOvj8DBSAOUI6t5SAiUdJCOh8bX/eStxlSRu+7hGnZYwb0RXOrjp
         OHxbUIsqq/KOzzMCKE1z1E69s4X+PaDi1sXkNitZx5N+YHwIKTawExYRr2SFDS4iMbcQ
         PcYh3tqRdLcWo6TgUs37/cYM6f7l+hwyrd3a+gt1grFjn4kFZg0EpRWTScqJgkuli05r
         c9t+pIXlXAg8vKNDIyZmAnXQLJCVS0C6W9RJ204zQeb4wCg1Getw1BH6SA26SKlj0+np
         bihk7n7LBR4wp5xJoUtgYIYEs2ErSLkZZuXt6vjwS0Ig2vbIzR7MMxAgFDLjXTypHnE4
         jKkg==
X-Forwarded-Encrypted: i=1; AJvYcCU9AXUPa/fkErrCe34X34V/feDNZDq9cIU85DRMp7QV3WHF5nrFplEOmhkAKvDGDpVxw8Gjrr8FpodrOG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWK1TShVdj+X0xwFvCKy4WRlxiv8RF6IvDd88YOlghzs3c0BA
	NvSRFwPmqKILATB7NY2NAJclmwK50Ld44xfPL8wGtAO9R8E6sGEeTWkytgdSZJk=
X-Gm-Gg: ASbGncv6j7d+a1vBaa+FaZEM5nm6Wl4oM9VC3VqjuOVlV4A2XpDkgFJ+Ty+IzrqCzE9
	s1czCweRKltCXnIrVHrKhUe+eKVMiIE0rT2XSM3kx0KHHmPnCcRFNLmAH/tOZt3vs2AIIVSlErD
	jEMR5fgd73qfwGxXLvY+rGw7LvxuIPBKHj2u2uHoxlY4ImEPRX2m+MPGoUHnKvAC8QqO2ImmO7K
	P0cjLaYNLBXTKMrMDKI/4NxwdKKEf4sXfjLaP73GfE6S31tpQwtkBapi7cEQxBrkxadFZzW+pwn
	DXy5IwxyqGZmJV6jrLKZZuNpF5yE1wm7fliW0TW0oq0nQZyor78h
X-Google-Smtp-Source: AGHT+IFwqoWDn7YO/bjFq7nIBquQqHcFTa9mKO/aRiVcSKON9nOTdNqg5xXZEzC8DXFG8NATZDlxfA==
X-Received: by 2002:a05:6902:2089:b0:e5b:4a7b:c518 with SMTP id 3f1490d57ef6-e5b4a7bc795mr2727436276.1.1738949359866;
        Fri, 07 Feb 2025 09:29:19 -0800 (PST)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b437d6841sm667699276.15.2025.02.07.09.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:29:18 -0800 (PST)
Date: Fri, 7 Feb 2025 12:29:17 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Christian Heusel <christian@heusel.eu>,
	Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Joanne Koong <joannelkoong@gmail.com>,
	Matthew Wilcox <willy@infradead.org>, linux-mm <linux-mm@kvack.org>,
	Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for
 FUSE/Flatpak related applications since v6.13
Message-ID: <20250207172917.GA2072771@perftesting>
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <9cd88643-daa8-4379-be0a-bd31de277658@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cd88643-daa8-4379-be0a-bd31de277658@suse.cz>

On Fri, Feb 07, 2025 at 05:49:34PM +0100, Vlastimil Babka wrote:
> On 2/7/25 10:34, Miklos Szeredi wrote:
> > [Adding Joanne, Willy and linux-mm].
> > 
> > 
> > On Thu, 6 Feb 2025 at 11:54, Christian Heusel <christian@heusel.eu> wrote:
> >>
> >> Hello everyone,
> >>
> >> we have recently received [a report][0] on the Arch Linux Gitlab about
> >> multiple users having system crashes when using Flatpak programs and
> >> related FUSE errors in their dmesg logs.
> >>
> >> We have subsequently bisected the issue within the mainline kernel tree
> >> to the following commit:
> >>
> >>     3eab9d7bc2f4 ("fuse: convert readahead to use folios")
> 
> I see that commit removes folio_put() from fuse_readpages_end(). Also it now
> uses readahead_folio() in fuse_readahead() which does folio_put(). So that's
> suspicious to me. It might be storing pointers to pages to ap->pages without
> pinning them with a refcount.
> 
> But I don't understand the code enough to know what's the proper fix. A
> probably stupid fix would be to use __readahead_folio() instead and keep the
> folio_put() in fuse_readpages_end().

Agreed, I'm also confused as to what the right thing is here.  It appears the
rules are "if the folio is locked, nobody messes with it", so it's not "correct"
to hold a reference on the folio while it's being read.  I don't love this way
of dealing with folios, but that seems to be the way it's always worked.

I went and looked at a few of the other file systems and we have NFS which holds
it's own reference to the folio while the IO is outstanding, which FUSE is most
similar to NFS so this would make sense to do.

Btrfs however doesn't do this, BUT we do set_folio_private (or whatever it's
called) so that keeps us from being reclaimed since we'll try to lock the folio
before we do the reclaim.

So perhaps that's the issue here?  We need to have a private on the folio + the
folio locked to make sure it doesn't get reclaimed while it's out being read?

I'm knee deep in other things, if we want a quick fix then I think your
suggestion is correct Vlastimil.  But I definitely want to know what Willy
expects to be the proper order of operations here, and if this is exactly what
we're supposed to be doing then something else is going wrong and we should try
to reproduce locally and figure out what's happening.  Thanks,

Josef
