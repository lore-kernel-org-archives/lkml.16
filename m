Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1A478F34
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737217; cv=none; b=DoNGVuO2a4Z6Z2l4bZuyVlov/H1mRvXmTtVHWSrpfZnWgfHNk+VY0oA0NJ+NRh4PL7TmpmnQSc6/XAGnaxhVVrF1FiDaLb76FMnn+ZxN12NToKeNTwbFPPJlANVotE+z+OC/oH27DO4LRYyyAbdoBEj4ReJXtNT0PR9/QfhY1tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737217; c=relaxed/simple;
	bh=V2CHvHVl5DnZ6ldHppAkmVC2F7/rCBROZqalm35n2Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glpSNDXlbp/WN0qBEqMOJ92+z4cMaZrgCLnk72Ar579/HJUicLsC1MqMs7yE+1BE74k067VOYJ7Lvy5I6waO+rQydlAJpZGOpFeFVWM09MCyl7cHu+VJjALq99TluFYCiQqVDOXMBhSNv1yD4v7n9M6OGwl/W1e133lY2cdLeWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=VRwmvpPx; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="VRwmvpPx"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c7913bab2cso154603985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746737213; x=1747342013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zQEnUDiH17j0axkwQIQsd15gk3w4WvOGH1IVj+x3pR8=;
        b=VRwmvpPxzjnxc+z6Qlow3V3JkxELJ9AUnwOaVY9XuWWywjA8H1BKqGhtHhpaw1m2Zk
         T/WHABGL5sIR8nerhAmQc46AE4DcpZ70NiqvgDIZNGrRm/nZrXF/JEvQdFLbfQrrr1n9
         Subf/+k8oifbODtCvJxcT/e5RKxboTTfB93tpvBLL/QDt4aOssVUYxxEMgbA5mMIuolp
         nXetZ3n48OxyNdRoTR8JLDCge3BFb4J1GRkUlUQPKN0hCxELTfEMIlAZOh4Xd1psYR2C
         yadNCR/wtXvYwVE/nm/VOXwsmORRSPiIC7arPr2m3fbLIePQ2FTExXv5AiTGmUeh0CnQ
         Ps1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737213; x=1747342013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQEnUDiH17j0axkwQIQsd15gk3w4WvOGH1IVj+x3pR8=;
        b=Rk3vlitsFdm0TeLjEzsLjXR+kVaafh4aDymlBYPhsydESkDCMzZcYo5Lv28x/Z/23y
         jYWc+WS5wj2TRR8uShr3Q+hykOrOK4QC7mm0Mh32UT9JOukw7bT7L8qaHx8Fbk0Vbloy
         Q8Ye6bOIt/eYFkI0codwIRaRoQaigsCzUBBMfnHEmd2mLLHQx5th9rbh6mLYUTBMKA86
         QgqzpsdHVg8ud4pAtEz9YuaWQ2b8vQufd1JUzY38XLbv6AvoO/TcXOR6jqPGiPvwBUKU
         oWT824Wepiz43EOkO2QjZNahbAIwJ3+Ad2QMf6Kym9eGGoOhKnbWV9DFo14sA3xgOft5
         Pnsw==
X-Forwarded-Encrypted: i=1; AJvYcCVQos9efVIPPYZWZS7ee2YdIthXHT3wnBvLEUAE8UwBvKLm1JCb02AD2iPLIUbYhLjd++mbqQG6oaje8/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPjFGZ80NSorb6A51RDqa4pBe/jh7EfLnr3G3isOHvQ3oOprF2
	3Jpm6zzPEcAEo7KRXC8UjOIi5P5FJff87UuS9QF5EG9iHX0h1grJgIhkxvhOeOc=
X-Gm-Gg: ASbGncsbRfIJXCRcmacnRdt4fWPWhU259q6P2ArYSQboNY/oCx2GTHRg4B7lauBxmV3
	iEkmCx+p0cNz45DpY+pzgNDZHgzNPZmfYbTme+kUhjrJMnSO5K47kz4f6TSLyKVuXAUA/pPov/J
	Yf7tF6QID4dSdfAQ32L33Iwz8eYzcX54i4DF//LtCC67ILQREHSvFGh8wV0cA3KbVMHn3sq2P9f
	0vJCQOVLwvL988I263koHaLFgxVw5k+YFBSSiz+KDTozAJYh/rxIFoXYIgdDnEqsltxToNN39x7
	OSXovmCEQ1FhqYRHgDBNSaP8b/jNk7Hl3ixbJCw=
X-Google-Smtp-Source: AGHT+IHeeTbu3oSEAaZfd20nR1n/PId7yFctl0Zs1lNl+athCGKHq7I+Zd6dkLIXBnQuGA3moXaPoQ==
X-Received: by 2002:a05:620a:370b:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7cd010f19bamr172019485a.23.1746737212814;
        Thu, 08 May 2025 13:46:52 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f98942sm38704085a.49.2025.05.08.13.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:46:51 -0700 (PDT)
Date: Thu, 8 May 2025 16:46:44 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Message-ID: <20250508204644.GB323143@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <20250508052409.GB320498@cmpxchg.org>
 <13898284-B62B-412D-A592-856406F7D7C0@nvidia.com>
 <D24FC56F-CED6-40DB-8216-6B705473106C@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D24FC56F-CED6-40DB-8216-6B705473106C@nvidia.com>

On Thu, May 08, 2025 at 03:17:05PM -0400, Zi Yan wrote:
> 
> >>> @@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
> >>>  		     migratetype < MIGRATE_PCPTYPES))
> >>>  		migratetype = MIGRATE_UNMOVABLE;
> >>>
> >>> -	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
> >>> +#ifdef CONFIG_MEMORY_ISOLATION
> >>> +	if (migratetype == MIGRATE_ISOLATE)
> >>> +		set_pageblock_isolate(page);
> >>
> >> Are there paths actually doing this after the second patch?
> >>
> >> There are many instances that want to *read* the migratetype or
> >> MIGRATE_ISOLATE, but only isolation code should be manipulating that
> >> bit through the dedicated set/toggle_pageblock_isolate API.
> >>
> >> If there isn't one, it might be good to enforce this with a VM_WARN
> >> instead.
> >
> > I checked all set_pageblock_migratetype() callers and do not see
> > one using it for pageblock isolation. Let me replace the code
> > with a VM_WARN and add a comment to tell users to use dedicated
> > pageblock isolation APIs.
> >
> 
> Actually, move_freepages_block_isolate() calls __move_freepages_block()
> to move free pages to MIGRATE_ISOLATE pageblock and
> set_pageblock_migratetype() is used inside __move_freepages_block().
> So the branch has to stay. Will use the suggestion below.

Ah, good catch. But looking at the callers, it's:

move_freepages_block()
move_freepages_block_isolate()
try_to_claim_block()

The last one would benefit from having the set_pageblock_migratetype()
there explicitly, as this is what this function is supposed to do. It
also should never set the isolation bit.

move_freepages_block_isolate() has two set_pageblock_migratetype()
calls already. And after the series, it should only manipulate the
isolate bit, not change the actual migratetype anymore, right?

Maybe it makes the most sense to move it into the three callers?

And then fortify set_pageblock_migratetype() after all.
