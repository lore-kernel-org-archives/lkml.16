Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A4916C69F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652391; cv=none; b=bnxHOCtZYPWSdKZrnlpGX8VgBUBdi8ssy9jqlYVuz30OI9ZCzO7e12yiXUw/zW9v3M3UpRX7Rdqj9tghxxPCwjAPyKk4S1t/4Hyj5Htx5Q3EoWg6noBnSxWNJGZUwNYHkKnscT56zi+bcDRh7YKcEJD40xtkwQy0WbZU4GO1Bq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652391; c=relaxed/simple;
	bh=zyBkTPLPDUugFfEyrK4SEBiCCO50tQOFJXyqVkn+Mrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQdUWPNRQEy1U6OO/2lJuw5OOPLQFA7nwlQbdRuam0lRk3s+x49UFMzNIwDtCiHuiVsyUmu+AQ+6p5bkng4vZJiDx2+SeCNMYkD25m3yGmWueKGAEls3qYptY72YqeWZMEXsrLDi9/+EPM7FxxNLyph6RMU0HS42BgZuqSbWt70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ikzCnLeX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ikzCnLeX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21670dce0a7so107930645ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 22:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738652389; x=1739257189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+YEQ3g7cuvAbzvyL1CtZJwjxm6Bf8B0jYPKPxe+7hw=;
        b=ikzCnLeXfLx0uFlQxW8K5Z+x17XEV6bTM12lG7ospQr2A+jZE0YMQEVyfpPj6f8rSW
         w+bfXLm3ZcSByxiLOfus+z1Ssr3jhGyN6dh+Ab28I1Zz7rr3ycswf6i2OBgyIZQXCJyF
         LyvT2wDQgLGBBtCOwvQhky60eNh3LMPND8Lag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652389; x=1739257189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+YEQ3g7cuvAbzvyL1CtZJwjxm6Bf8B0jYPKPxe+7hw=;
        b=jd9gc3c44NOPVcGHJFToVcHhzkmwzmIYgqti0IQPcNQ5yFl41mmO8MuKAXUmFgYNuf
         kwDPZv6v/I4qWXp+dwqBHacWh4CB8AQOFyv9dja2Ep0dMT0MM35hDqJ5wSEGuifbXKQv
         UNAj70EU1twfQRRG3IamFrKlonMPjcQYw7mFrhXvBt1ncO92fCvHnav50zvRoZmTJrSZ
         WUQe6wpeBs965qQcNysfCe3VRLcMg7+KzKTppsODhIZ26iHpSbDTSVXWBHcZSJ1xexND
         F3IsPHMTE5qt3+A37KwMAxbfXG7Ae9/+nZH2UlsHjOD+IXZQaqF1lvvNMWenpNYiz8ao
         512g==
X-Forwarded-Encrypted: i=1; AJvYcCUN++UXzCi8lneMD3AtCnpP43bllfnKktokAQ0bThlPJFC9Fx0lMIb9wXI0rc2cp07jv1SbhbkafFtkCco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjIUcp8rcBDdcc4+zfnNqeZnxBK1PwBAfV4s9wp4auygXsBX7/
	Cp7wxnEAn82HTDBDdRKJBbWAYLPKe5u4BZz+ibZTEDo1jNxv4dvlc5QU4e/TwHCWMvSJgwcpSso
	=
X-Gm-Gg: ASbGnctuLcEj/ShU92k6e2YEQb5DexFDDZLnGaRiO/qK2tbsToiZraYzEFLe0rV5Hbn
	gN92fwUy0ySeDFUVgJwxNO8MoB75rizn8khe3Gi0bh+IHRwjGTGdy/yYKdReWfOmuwrSHlbwwJW
	fvSf5vVb4vyZ40MoUrIbdFv2fOxRAdAuGCV59FI59uuuN9c4aA7WVg97CJUzv7t9s9wQhMok5uv
	Gb9kCm0HIdCyTmK/3zjkVIMMZ6w9gSHw4dWlWs83AJ3UY4ABkm0Y+++wKgK1YEyk0JdTtRWuS70
	6OonYK3wWJNEuOROXMo=
X-Google-Smtp-Source: AGHT+IF55oC/PN1lc6ktg54goxJcr15MfhispZX9A93vkGnLFcyT6hS+K9BYYePkhcapgVnMViWuMA==
X-Received: by 2002:a17:902:e804:b0:212:615f:c1 with SMTP id d9443c01a7336-21dd7c62427mr422142425ad.14.1738652388771;
        Mon, 03 Feb 2025 22:59:48 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:5d42:47ec:e16e:5797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33200f2sm86950525ad.242.2025.02.03.22.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:59:48 -0800 (PST)
Date: Tue, 4 Feb 2025 15:59:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Ew9AWNHacRIfhA@google.com>

On (25/02/03 21:11), Yosry Ahmed wrote:
> > > We also lose some debugging capabilities as Hilf pointed out in another
> > > patch.
> > 
> > So that zspage lock should have not been a lock, I think, it's a ref-counter
> > and it's being used as one
> > 
> > map()
> > {
> > 	page->users++;
> > }
> > 
> > unmap()
> > {
> > 	page->users--;
> > }
> > 
> > migrate()
> > {
> > 	if (!page->users)
> > 		migrate_page();
> > }
> 
> Hmm, but in this case we want migration to block new map/unmap
> operations. So a vanilla refcount won't work.

Yeah, correct - migration needs negative values so that map would
wait until it's positive (or zero).

> > > Just my 2c.
> > 
> > Perhaps we can sprinkle some lockdep on it.  For instance:
> 
> Honestly this looks like more reason to use existing lock primitives to
> me. What are the candidates? I assume rw_semaphore, anything else?

Right, rwsem "was" the first choice.

> I guess the main reason you didn't use a rw_semaphore is the extra
> memory usage.

sizeof(struct zs_page) change is one thing.  Another thing is that
zspage->lock is taken from atomic sections, pretty much everywhere.
compaction/migration write-lock it under pool rwlock and class spinlock,
but both compaction and migration now EAGAIN if the lock is locked
already, so that is sorted out.

The remaining problem is map(), which takes zspage read-lock under pool
rwlock.  RFC series (which you hated with passion :P) converted all zsmalloc
into preemptible ones because of this - zspage->lock is a nested leaf-lock,
so it cannot schedule unless locks it's nested under permit it (needless to
say neither rwlock nor spinlock permit it).

> Seems like it uses ~32 bytes more than rwlock_t on x86_64.
> That's per zspage. Depending on how many compressed pages we have
> per-zspage this may not be too bad.

So on a 16GB laptop our memory pressure test at peak used approx 1M zspages.
That is 32 bytes * 1M ~ 32MB of extra memory use.  Not alarmingly a lot,
less than what a single browser tab needs nowadays.  I suppose on 4GB/8GB
that will be even smaller (because those device generate less zspages).
Numbers are not the main issue, however.
