Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0B25F7AC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207237; cv=none; b=izl8mHIDYW8AEhHitzr+9NFQqd0fJ+y8Wt6QQf7pigSdRAlmxHJiei81Laj5JJy0vtc2NIWZF6+/0Lkv1OgYyHhPvtfVdv7qvt/pBR85QFRHDjP43rBQjIAA5ImKNmRRgcfL6lWtgtGaG58odCy4AhFBR7BC/SgQY/b62FyXEqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207237; c=relaxed/simple;
	bh=fKAUplVIh9IVEilSqxt68vCgZpO8rfAd86TA8bIK61U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGGxEnm6GraWtvO0HdThwEMdpuGeZ1seP3gEL1LtspRZjpQxnolHk9ePKEuC0145sjNZEm+p9leCSqZTc59VZlbes8/A0KRRloS1431NV4LtLE4NuxqXG1SNryDbrIJSayJxSxp5HjlxKNTNQcWXwn+28MjRPyxn8XAL9rKpGMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=Ki55mXt9; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="Ki55mXt9"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c081915cf3so879710485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744207232; x=1744812032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lfO9/CEy4dgci6iz8QJ7UzHvpG+GvqY3wOSCyMzSDbM=;
        b=Ki55mXt9Hom4WOBoo1syI47/Peq6VYzCRgr07Xkth7Pv6+n5snVquciU5yjdz5/mW9
         wuZZ8l2gvxLGkqASk+ykEK0THPVXsnC1QTYBqSqpr4LMQ+JQGxgKnHZDkaexLNrKqrm5
         s122TcPGLLplU0fM4VOH4MHrK278yNvZGnezh45/rOHaLaT8tMALFqtQd2omWXqdmf1X
         DszIa2YfNsTijTDAX9X7ED4rj6xAXEMKlwmwiL35Vurh4uZ4j1GR6Yl+MdDNNHEE6+YN
         FGbfh4gY1xPbYZy2micJJYcoTW24bm8cY3OxE+fUs2BOhVuw9hhsGchj1y4JOVVB4cnW
         hQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207232; x=1744812032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfO9/CEy4dgci6iz8QJ7UzHvpG+GvqY3wOSCyMzSDbM=;
        b=cC5sOtET20aVKE7Dox9T3X0D+yX7/+AEUJsgEmk6XJcHnoSTBhvZHLTNLOm1SA7sd6
         ZGRmOz+9IDHawThSLyDOrQO69t+xMFKDTAnZjUE8VnYel5BonQszb4mdfjdrIdyQ7Usr
         wed9o5aSAcXmNCNxhLS890rnnNvdAGbn927sFe0JV+1+e39PQBOXxseNPQ+LpY36BwKB
         QWzg/reVelDzaNajkmFsMz//fdJVJJaG2Q9I20D/rkTV/Fw+AffJRiq82qOjkh87DBzz
         BIalbBDvjAAtDHMOMKk9gpWkClJhYJ87k26p0o0PO84MWXrUY6CzHC1iOPA9LQgeuLIV
         tjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgVd7wIl7r09FACt4bF2qJ/tjr5Xpr0UZvyBm5UIkg8XG/LhJBzA64JD8AcozMA0JHcpGb3sPI6Qhg33M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRh90hjYfNsf8vgFpUSDSAwLW4WboBz5TsVNdqOukiX1PrZRRQ
	ZQ3wKA/qVM6kZf16yjmcq4HYIfcZoVypMtJag7oVdZUMGqOW7b6PuxlISjcFX7o=
X-Gm-Gg: ASbGncsvPeA5YBJIi0QXIy8NN6fYC4JyPkwAwd1U9YYVSF1q4jnN6V7d1Vw9gNx66BK
	blRtVEj6gN3I/H1l6fRP9QoWcghaQoY/ovnXINYAs1uV/ZdI/bttSUrfG9+dJ8xki5FRLv2srpl
	K66iXw1y0Ip0G94v7ehiO9EnDK+lXgRu50cSckyKcaElp6k4uF5UNNY1Aw1njp9BdPQztaRpjje
	1s5x27NPBivUoCiSVAHo7X2h0AQAiEICTw2hqjUl2o2SV3+pSLB5Ue3i93XAEQRH4GXI/Wrjby8
	H6xm2JNkO+6fI45HcThhXHsi0cMSMtXg
X-Google-Smtp-Source: AGHT+IGzpZNpd5bWmJIrglPrlH0pmCswaggSnMgMXggJtdtTARzTu3BIp4nxphDdER+S+PLR/Q6L3g==
X-Received: by 2002:a05:620a:2614:b0:7c5:50dd:5079 with SMTP id af79cd13be357-7c79dd932c0mr375653685a.1.1744207232165;
        Wed, 09 Apr 2025 07:00:32 -0700 (PDT)
Received: from localhost ([2620:10d:c091:600::1:8699])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a10d3ba6sm76640685a.63.2025.04.09.07.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:00:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 10:00:23 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Carlos Song <carlos.song@nxp.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: page_alloc: speed up fallbacks in rmqueue_bulk()
Message-ID: <20250409140023.GA2313@cmpxchg.org>
References: <20250407180154.63348-1-hannes@cmpxchg.org>
 <38964e68-ac20-4595-b41d-8adc83ae6ba0@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38964e68-ac20-4595-b41d-8adc83ae6ba0@huawei.com>

On Wed, Apr 09, 2025 at 04:02:39PM +0800, Yunsheng Lin wrote:
> On 2025/4/8 2:01, Johannes Weiner wrote:
> > @@ -2934,6 +2981,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
> >  {
> >  	struct page *page;
> >  	unsigned long flags;
> > +	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
> >  
> >  	do {
> >  		page = NULL;
> > @@ -2945,7 +2993,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
> >  		if (alloc_flags & ALLOC_HIGHATOMIC)
> >  			page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
> >  		if (!page) {
> > -			page = __rmqueue(zone, order, migratetype, alloc_flags);
> > +			page = __rmqueue(zone, order, migratetype, alloc_flags, &rmqm);
> >  
> >  			/*
> >  			 * If the allocation fails, allow OOM handling and
> 
> It was not in the diff, but it seems the zone->lock is held inside the do..while loop,
> doesn't it mean that the freelists are subject to outside changes and rmqm is stale?

Yes. Note that it only loops when there is a bug/corrupted page, so it
won't make much difference in practice. But it's still kind of weird.

Thanks for your review, Yunsheng!

Andrew, could you please fold the below fixlet?

---

From 71b1eea7ded41c1f674909f9755c23b9ee9bcb6a Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Wed, 9 Apr 2025 09:56:52 -0400
Subject: [PATCH] mm: page_alloc: speed up fallbacks in rmqueue_bulk() fix

reset rmqueue_mode in rmqueue_buddy() error loop, per Yunsheng Lin

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/page_alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index dfb2b3f508af..7ffeeb0f62d3 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2983,7 +2983,6 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 {
 	struct page *page;
 	unsigned long flags;
-	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
 
 	do {
 		page = NULL;
@@ -2996,6 +2995,8 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 		if (alloc_flags & ALLOC_HIGHATOMIC)
 			page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
 		if (!page) {
+			enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
+
 			page = __rmqueue(zone, order, migratetype, alloc_flags, &rmqm);
 
 			/*
-- 
2.49.0

