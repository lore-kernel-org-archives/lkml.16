Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A9A927
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 02:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744510869; cv=none; b=rDGCS4hOxcCa9bjNQKFROeA5A4NasGRFkAoVjtbJ1d1Re1FN8bp5zRL+N/iyzVdIB9iAlCiCDaGWj4yIHO+NK52L26n5sJAG/Jej2Jh+5fJFM/af3DsTFOCDKplEiqfLotvgOsYzEWL8CXghnD36FzNfae6BnHhlGblZe8s564Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744510869; c=relaxed/simple;
	bh=MQ2u2Ao89o14tyAt1jqrE8Qn1pZ/hO/EdPE3ujJKLuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXvWi9eIf7dxz1lt2GRqwowPeP247wr2VNR41AHDyuw6pD8ZmuiUF8EQDVM26tnqTr7BUeHvgDDFcDsC8uPE3Ji4RswRlVXsMRvq6xZT/R6ZnHY2QCC3CokVvRhkhPRlWzA7itWKfDoayq2/jigB3JxkHsrOgbDAJxvyZUXivUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=yacWiODN; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="yacWiODN"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476805acddaso31197591cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 19:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744510864; x=1745115664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jWkA7vQ/c+0VRrZgTyEC981ztpPVEml2pn39wtS3+nA=;
        b=yacWiODNeKF/IRT74cvXLPJElhOOaSbUetbRcV5egxZd/g/o4wK8V5vcAmkzzmw4cp
         p1WAv01EPU8WayB+B4L6d/3XAVoddfiBKJhIhjper0uD9Suxq1oFGIVL9emVGjm7PX8O
         G0WnwZK8I/BWPZm9OblZvELY8e0sNxF/Wm2sVSDc74TQ1SRSKY+FT5NqgAw4vMugS0PY
         xevkLvYTmumutYjOzaFAPoijCTkQIfzoJhVDG94MQ9K9id2g/8BzBlgSki18cRhANf4w
         OwGsAzgHnK6n7nxI/kCf/KI8Nm+20ZCOrKG4N9xpobBYDH6jjTHRybNyKN93NcNB34/8
         aTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744510864; x=1745115664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWkA7vQ/c+0VRrZgTyEC981ztpPVEml2pn39wtS3+nA=;
        b=JZX95vuRUHjZ1d/TPm6PI32SZDMXI503fHR8PM3lyAXYLIMw04viPxqPRQv7kfEg2x
         YHCps4/CZ3AcsEtxIpgrUVnlHB0TasGS51jDaz6uWXQHlU+7o2vcQ8JeqsYGThC8B6Uv
         9UAiSXbOGkdvQDOYd/JQuh0LBCPGZqrklTXYKo5G8UZLaYA9ei8vMjwUqQ7rTrTRuMG7
         iVhmb78v79KYD7xUn6uOupLblRvYoymdmMI5JrHxVJh3K/8qwFYrSs9K+tw43uQUj5o6
         mt6AXbwlRPGOVz8nMe7t5Ft4C95M1BILENHICf8HgkNCrf2q60NspW8fvl5HBEGZiwH6
         E1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQcqrQXxGM1pt14/IefpWT/WxQlPBYq0wknZ6VNZgQ1iRVdvmLp72hrOJQCJ6PzfB+oLysn356N4562ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhViGrHGYvJs9Hc9SAAjHK7PcZnT1Yahl7+HDmXInkYKKd4zUn
	MPPM9VebwpMKPDT3E8gHNMXOZ7VMaQVDB2TtlN+8gxk+NRlwrH+OCKenX/5FH0A=
X-Gm-Gg: ASbGncvC8M7DZG9Z4HdsAoYIz67Iszl6nvh6k5QTi5vX0fzle5rRbGPPYnbLYarDZOE
	6+52NVzUcPmcvWtuG1cbmY7DLy4jrH40yS+LAL4FYTCz5M46kBQQ4G48L5mEKycGo21J/uPIsaL
	VWG9gfQvZ+EqLsOplAo4+ecgJC9JHrBptYQa3a9LGNPCzxwQ8o5t1XeVPWPNI+wjSMhUOPLz5gB
	CbETQWoW95I/tl5hh8dHIShdI15g5woJcUhJJz7U7LNLLQ71CkkYvbx1zso+kWZ4gxaMgC2q4BY
	ZBkQj06STD13wHHv+dpFFox9r306ZfzXxmtFCzcAIHnf+hhugA==
X-Google-Smtp-Source: AGHT+IE4qpLB/60kyYML5kFw6me8KE+QS51k+9h7mGmPBWkU7zSVXEEo9OIhyQg2vUTPMcKfnaHZgw==
X-Received: by 2002:ac8:7f8e:0:b0:476:6599:3e29 with SMTP id d75a77b69052e-479775e2b50mr127090041cf.43.1744510864123;
        Sat, 12 Apr 2025 19:21:04 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ed9bd5fsm48787051cf.52.2025.04.12.19.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 19:21:03 -0700 (PDT)
Date: Sat, 12 Apr 2025 22:20:58 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: page_alloc: defrag_mode kswapd/kcompactd
 watermarks
Message-ID: <20250413022058.GF366747@cmpxchg.org>
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-6-hannes@cmpxchg.org>
 <46f1b2ab-2903-4cde-9e68-e334a0d0df22@suse.cz>
 <20250411153906.GC366747@cmpxchg.org>
 <efa6eb69-cff3-421d-94c7-e37a9a1e26f8@suse.cz>
 <20250411182156.GE366747@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411182156.GE366747@cmpxchg.org>

On Fri, Apr 11, 2025 at 02:21:58PM -0400, Johannes Weiner wrote:
> On Fri, Apr 11, 2025 at 06:51:51PM +0200, Vlastimil Babka wrote:
> > [*] now when checking the code between kswapd and kcompactd handover, I
> > think I found a another problem?
> > 
> > we have:
> > kswapd_try_to_sleep()
> >   prepare_kswapd_sleep() - needs to succeed for wakeup_kcompactd()
> >    pgdat_balanced() - needs to be true for prepare_kswapd_sleep() to be true
> >     - with defrag_mode we want high watermark of NR_FREE_PAGES_BLOCKS, but
> >       we were only reclaiming until now and didn't wake up kcompactd and
> >       this actually prevents the wake up?

Coming back to this, there is indeed a defrag_mode issue. My
apologies, I misunderstood what you were pointing at.

Like I said, kswapd reverts to order-0 in some other place to go to
sleep and trigger the handoff. At that point, defrag_mode also needs
to revert to NR_FREE_PAGES.

It's curious that this didn't stand out in testing. On the contrary,
kcompactd was still doing the vast majority of the compaction work. It
looks like kswapd and direct workers on their own manage to balance
NR_FREE_PAGES_BLOCK every so often, and then kswapd hands off. Given
the low number of kcompactd wakeups, the consumers keep it going.

So testing with this:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index cc422ad830d6..c2aa0a4b67de 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -6747,8 +6747,11 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
 		/*
 		 * In defrag_mode, watermarks must be met in whole
 		 * blocks to avoid polluting allocator fallbacks.
+		 *
+		 * When kswapd has compact gap, check regular
+		 * NR_FREE_PAGES and hand over to kcompactd.
 		 */
-		if (defrag_mode)
+		if (defrag_mode && order)
 			item = NR_FREE_PAGES_BLOCKS;
 		else
 			item = NR_FREE_PAGES;

I'm getting the following results:

                                fallbackspeed/STUPID-DEFRAGMODE fallbackspeed/DEFRAGMODE
Hugealloc Time mean                       79381.34 (    +0.00%)    88126.12 (   +11.02%)
Hugealloc Time stddev                     85852.16 (    +0.00%)   135366.75 (   +57.67%)
Kbuild Real time                            249.35 (    +0.00%)      226.71 (    -9.04%)
Kbuild User time                           1249.16 (    +0.00%)     1249.37 (    +0.02%)
Kbuild System time                          171.76 (    +0.00%)      166.93 (    -2.79%)
THP fault alloc                           51666.87 (    +0.00%)    52685.60 (    +1.97%)
THP fault fallback                        16970.00 (    +0.00%)    15951.87 (    -6.00%)
Direct compact fail                         166.53 (    +0.00%)      178.93 (    +7.40%)
Direct compact success                       17.13 (    +0.00%)        4.13 (   -71.69%)
Compact daemon scanned migrate          3095413.33 (    +0.00%)  9231239.53 (  +198.22%)
Compact daemon scanned free             2155966.53 (    +0.00%)  7053692.87 (  +227.17%)
Compact direct scanned migrate           265642.47 (    +0.00%)    68388.33 (   -74.26%)
Compact direct scanned free              130252.60 (    +0.00%)    55634.87 (   -57.29%)
Compact total migrate scanned           3361055.80 (    +0.00%)  9299627.87 (  +176.69%)
Compact total free scanned              2286219.13 (    +0.00%)  7109327.73 (  +210.96%)
Alloc stall                                1890.80 (    +0.00%)     6297.60 (  +232.94%)
Pages kswapd scanned                    9043558.80 (    +0.00%)  5952576.73 (   -34.18%)
Pages kswapd reclaimed                  1891708.67 (    +0.00%)  1030645.00 (   -45.52%)
Pages direct scanned                    1017090.60 (    +0.00%)  2688047.60 (  +164.29%)
Pages direct reclaimed                    92682.60 (    +0.00%)   309770.53 (  +234.22%)
Pages total scanned                    10060649.40 (    +0.00%)  8640624.33 (   -14.11%)
Pages total reclaimed                   1984391.27 (    +0.00%)  1340415.53 (   -32.45%)
Swap out                                 884585.73 (    +0.00%)   417781.93 (   -52.77%)
Swap in                                  287106.27 (    +0.00%)    95589.73 (   -66.71%)
File refaults                            551697.60 (    +0.00%)   426474.80 (   -22.70%)

Work has shifted from direct to kcompactd. In aggregate there is more
compaction happening. Meanwhile aggregate reclaim and swapping drops
quite substantially. %sys is down, so this is just more efficient.

Reclaim and swapping are down substantially, which is great. But the
reclaim work that remains has shifted somewhat to direct reclaim,
which is unfortunate. THP delivery is also a tad worse, but still much
better than !defrag_mode, so not too concerning. That part deserves a
bit more thought.

Overall, this looks good, though. I'll send a proper patch next week.

Thanks for the review, Vlastimil.
