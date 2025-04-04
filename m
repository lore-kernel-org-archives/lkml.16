Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255421D5B5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797010; cv=none; b=on0tj5ejSFqfVO3cpnngzctQAAg3u40KZAwExqqY2m8mUk3/qKbpKDYP8pzUjrMbc9mtS5eJYQU3Up+EMZBlOGLgYc+aOj2/mt55jpaHcq8PwIsz7pTFWbWy2C/It9yv/YpQKDo8dzV699PFlQgBe8PM82g4H5Y9B6iAtu+nHLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797010; c=relaxed/simple;
	bh=DyJalFc9IvIlPQ0hAHs/kVVK3YCaVNKPLXqqkh+SLnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHs/BGmcR+Hn6U2jvN51URyvqrFP+Hn/LDQEp99eiEUHja9nzBtLB6X3hV6Gs3zXencRYAjEfYiKW2XtZrLygnEo/yKN8Kn1BdCjb36szzuETI2OilShBFiWKAAwthSgalGKjviVLIhhCmUZLUoL5tPAZ4d1GIMOOFuoNttWI38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=U5cw8A75; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="U5cw8A75"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e904f53151so20513746d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743797006; x=1744401806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cclz9oqGLWTaYFCssVoMtVZnVxrzRlRpqGeMDEZ9cgE=;
        b=U5cw8A752k1KTcz8tAkITi8uV/P1ru8+Yne+q1cAH9GUGVWQ687/ZZevYJLEISox0r
         67wtPCQKm+gjCg+R4W73C/Lk1Cu9hJzIF2GWQxONHFyFy+kE1xj3BzRCo4sPsbrNFmT2
         Xb2yliuzUMuRyiUY6WEeYQtA57HDe4cOSqvuZXOgoDMLmPHV3MTHa0netLByXmfktqxq
         SLK++APYvty7k0kIie8H4NRrWhdfclajkbaw2Jw0nWADzhfz/4PR4KJeocTbiulcAzV+
         +52rALiW2moX94BxDWDsxKniiESxlWe1/uAJ9b19mO6MwwBhJM/kILSitDBxwxIqAe7U
         kNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797006; x=1744401806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cclz9oqGLWTaYFCssVoMtVZnVxrzRlRpqGeMDEZ9cgE=;
        b=X3mHdJvy6YobMqciYhvvKiBOLXrUE4ElaciHrHTHev0fxtnjeDQKK4o/JYpYqJMw0G
         0B83EV9d0hKlVs4Ob7h02XMKww2aGjxKNqbFqtPo4uJvkRXr9euLz48AP+VWuN9rSmJE
         QHvGgkbMnGMhsLjtPPcVmdJrRLH82wdPa6aHBDuIhbPCsTTpvqDervZ8j3zBE0XKQjSm
         SHtUlmKElBFVVVIea+oxlXQIU47IvlfGGUPWXxDUXyFDhboou2/OsrnkFZJlQNv1WBYB
         drB1+8GsoPSHGmu18x7qC2TT6zA4etaRTPvMgbRxfZRvGj3bc9Ap5GYOSfGV17cE1DY8
         dM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpgEnPt8aF2SHOm89DSg/4t60dAwZF6MWMIJGv9qVtOmZ/xe+cZXVmx3+mTLBj2L0skQksm9KKLH8DezI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5/qXsa1bYAWf9TsCDVmJO2sZQ867g5TkfFXWCG/4Gq4ULsH44
	lZF6Eua/SfH+POtter25IOpYxvqjdXMlPtjW6wZRO4+F8JyXpzVAYXIfpPaPbNs=
X-Gm-Gg: ASbGncvWR+VpGbqtbDWevOaZuoO+ioiRs08rxXLz808DDY23h0RGfZ5OfE4hbFvLFJ/
	/xf/PiLPk12KM2rwWcGqJhMbKIYPfCnWnzwFicB7UlgDNeVcXG2smMqZHB0kIqHvA2LQUbOycq2
	wm/q457puz/eXjqvun6AsPeY08EqMTFDoG9lUekvoWu6SIiss3OsKO4eimT+2v+rdj/vkKZIeSi
	FfTTGBeDtLpLVpwrIoxP/O9laYwb8YarW5namEp08vHLVSTdG+Ge1T1+XQ2nOnZH61k2WNDVGcW
	2O1mQ2x5atOCBslnjdo44Lj11+7Mmpf0lrsiaTcWKY0=
X-Google-Smtp-Source: AGHT+IHEX1GGSr8Rz2mK8ZEWPKRs+r7Q4v4MEWtu7WIbX+t6qTFo6V56NTaAgz0a+ENJKN1hWNqbUQ==
X-Received: by 2002:a05:6214:19cd:b0:6e6:61a5:aa57 with SMTP id 6a1803df08f44-6f05843ff4fmr65127836d6.14.1743797006271;
        Fri, 04 Apr 2025 13:03:26 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f0483a3sm25545376d6.63.2025.04.04.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 13:03:25 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:03:21 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH v2] mm: add zblock allocator
Message-ID: <20250404200321.GB373778@cmpxchg.org>
References: <20250404192813.925835-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404192813.925835-1-vitaly.wool@konsulko.se>

Hello Vitaly,

On Fri, Apr 04, 2025 at 09:28:13PM +0200, Vitaly Wool wrote:
> zblock is a special purpose allocator for storing compressed pages.
> It stores integer number of compressed objects per its block. These
> blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
> 
> With zblock, it is possible to densely arrange objects of various sizes
> resulting in low internal fragmentation. Also this allocator tries to
> fill incomplete blocks instead of adding new ones,  in many cases
> providing a compression ratio substantially higher than z3fold and zbud
> (though lower than zmalloc's).

Do you have zswap/zswapped meminfo metrics from these tests?

> 1.1 zblock
> 
> real    25m53.040s
> user    96m43.424s
> sys     4m56.652s
> 
> real    25m20.748s
> user    94m24.324s
> sys     4m58.005s
> 
> real    25m37.486s
> user    95m35.913s
> sys     4m55.892s
> 
> 1.2 zsmalloc
> 
> real    26m17.934s
> user    97m13.342s
> sys     5m2.415s
> 
> real    25m50.694s
> user    95m22.065s
> sys     5m1.305s
> 
> real    25m57.714s
> user    96m14.675s
> sys     4m59.081s
> 
> Since zswap is used starting from minute 21, this gives 9% in average in
> advantage for zblock.

This might be the linker step swapping out source files that are no
longer needed. Do you have metrics for zswpout and zswpin as well?

My concern with this allocator, and the other alternatives to zsmalloc
before, is the following:

You might be faster at allocating objects. But if storage density is
worse, it means you have to zswap more pages to meet the same incoming
allocation demand. That means more object allocations and more
compression, and often a higher rate of refaults and decompressions.

I would assume you're at least zswapping out more to make room for
whatever happens at 21 minutes. This doesn't seem to hurt the time,
which is promising and highlights how much faster zblock is.

But for the full picture, it would be good to see the reuse/zswpin
rates, especially in the context of overall swap activity.

And if there is no notable swapin rate, maybe test without tmpfs and
tune the memory allowance to force at least some degree of reuse.
