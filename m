Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C892AF10
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436526; cv=none; b=Kbv0YbhtANph1NWkR8efoHE0f94hDb6F7eccqT28BZvgPzye4dXXERlY0e/OZ8DHUmwIuhvqshUOBMV7eOYKalHOOouxb39fH3JWIW+tAn2f85gQ4cHRU7m91dU6vkqT87X94h2K0ougvo64SePQ/B1ue7MlW9K4DFWd+ogzXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436526; c=relaxed/simple;
	bh=IcngPgR6M5TB8qYn6mtbX/fvCkHZoBGXi45TirQJw64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEjVyeGq8tPy8NPVf9uDu9Hb4AKwPy6Ec1TD6/bRE5gdlTLRkcKt5CUQoANfOzzicPxbCA3RbyQEMpGDCyVEgbilwZ//PLJwoLrNydmkGZTQaoeeUIDSiIm3wMRsQYVg+gFv4fL9LV0UswtuaZI4cT8N+GIocawpYAcd6+H81MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=0SI0X208; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="0SI0X208"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c56a3def84so478715685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743436522; x=1744041322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9rmBmcbSh4OaQUIolxNDWwr8B+JGcf4MNJtJY/uDPg=;
        b=0SI0X208nCoubl4UPVRGn8qhYxMTLfiB96HKxEXcyHPLsXXOswvxirB7eKPlZRZnMt
         HmBxe8CziiChP5rLMA05whUmC9boQhpuBx7f9LLwg/e+o1FSHFgLv6X6IJvH/WwzbiHe
         qAmMFbP/Y8nzmY5UFNUEP9s68n9zAcB6kGva6SNCG2MP97K4YcZphcUHlXna20uqiQux
         xi1R80AVU3gmQ7nKqGNz/RlcKkPEIseloDflPNyjglVVgkgSAsNralwkd/gAWb4WzdhQ
         PL09fNEJkwzDRTkRU4mOTrdXlcc/4m09QN/jugYD/Xu24p1iLbzpvryUFO9uVZYExk75
         pssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743436522; x=1744041322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9rmBmcbSh4OaQUIolxNDWwr8B+JGcf4MNJtJY/uDPg=;
        b=V49jU0vIYg+CPlYvN/iGdGtHmT0L37fMcIu/ge7tmQLP/I0MxtFMgHIu2hf/hnfUQw
         5iiGbNd74+yoRdJbejPRb7WHpsaSNlO7FgymbaiX0RHV3B163Ss5JVP42x5Nl4Nb/gqd
         QD6gQeoaHjA3T1QxebPwDnW8e3c5w/T2ekYHFIY+XVblK+q0BVwbEgYPNIET7glUatsI
         ccWj5SQG505at8Vmizd8OGYav96OFRboERcAkeyfW/ot57vBtcavCwRSFT189TIV0gP4
         KOS1QHEkVvKz1H6UfLEJl/Z9uYnoS+j1+q3uzBsLZlNffPwzeGTnXPut6jXsxp4VB14r
         O37g==
X-Forwarded-Encrypted: i=1; AJvYcCXD3599EbazDr5PeOMG2QiWpQXoMFpJTSVmDf4JcDwqp/X73+hvO+mSXCDO1jT2D2gr4wp050nKeZDQhr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlF4IVh6QTgVdIUWVeJB2/rMSql+JA2kzVMzy7LsVPzKrCLzrz
	obrwmC0rvGo3Q1fh4lZPjKktlh5cPq3rIfYzZ+WgsLXAPshqAWhSvuH0ksWV+yBHhzbAWMVid6E
	w
X-Gm-Gg: ASbGncuHYbnSvF29KhkuTbxivLeWZG398VfgzKjLXXNJCuR5YM2qiFFtOUtzg2Mbs6W
	tZxc8UuFqG6wmh2KqxVti23Sn9dpOB5+ibm1sLLW5Ps13uTn01nJBSnSzsOhLH7VNqvfqndq6Nl
	pNNszLh7wj5EPw0SKYhWDr08CLXQ8gTC33/v6p8Rtc30FxoaYKYIYP8OBUUGeCes7ELpBkIEoES
	4YSXEgiVWErIl/A2Qru5ORRkfiuV7ZzzCmwo70IeOLmEejySM6d8nXNUnkY7kXFdeIXf0z0UYcZ
	7HaClW8jgWTztVyjtPWL2LepJDhfSVpLKpXJFAOWREo=
X-Google-Smtp-Source: AGHT+IE/9Hreu+XjtQKS3KMlZ8K6ykg5PwpmolFGFyVQO4qrJ0x7e31qsA952paxEM+UPVjR9yTRbg==
X-Received: by 2002:a05:620a:8110:b0:7c5:9769:3da8 with SMTP id af79cd13be357-7c69087dd3fmr1235417885a.43.1743436522201;
        Mon, 31 Mar 2025 08:55:22 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-478bef25a69sm34846411cf.37.2025.03.31.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:55:21 -0700 (PDT)
Date: Mon, 31 Mar 2025 11:55:17 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm: page_alloc: defrag_mode
Message-ID: <20250331155517.GB2110528@cmpxchg.org>
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-4-hannes@cmpxchg.org>
 <D8MVZ8L12HJN.1LN4G4H0ESLY6@google.com>
 <20250323005823.GB1894930@cmpxchg.org>
 <20250323013405.GC1894930@cmpxchg.org>
 <20250323034657.GD1894930@cmpxchg.org>
 <D8NUEJHT150J.17YZMGLU54JG7@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8NUEJHT150J.17YZMGLU54JG7@google.com>

Hi Brendan,

On Sun, Mar 23, 2025 at 07:04:29PM +0100, Brendan Jackman wrote:
> On Sun Mar 23, 2025 at 4:46 AM CET, Johannes Weiner wrote:
> > On Sat, Mar 22, 2025 at 09:34:09PM -0400, Johannes Weiner wrote:
> > > On Sat, Mar 22, 2025 at 08:58:27PM -0400, Johannes Weiner wrote:
> > > > On Sat, Mar 22, 2025 at 04:05:52PM +0100, Brendan Jackman wrote:
> > > > > On Thu Mar 13, 2025 at 10:05 PM CET, Johannes Weiner wrote:
> > > > > > +	/* Reclaim/compaction failed to prevent the fallback */
> > > > > > +	if (defrag_mode) {
> > > > > > +		alloc_flags &= ALLOC_NOFRAGMENT;
> > > > > > +		goto retry;
> > > > > > +	}
> > > > > 
> > > > > I can't see where ALLOC_NOFRAGMENT gets cleared, is it supposed to be
> > > > > here (i.e. should this be ~ALLOC_NOFRAGMENT)?
> > > 
> > > Please ignore my previous email, this is actually a much more severe
> > > issue than I thought at first. The screwed up clearing is bad, but
> > > this will also not check the flag before retrying, which means the
> > > thread will retry reclaim/compaction and never reach OOM.
> > > 
> > > This code has weeks of load testing, with workloads fine-tuned to
> > > *avoid* OOM. A blatant OOM test shows this problem immediately.
> > > 
> > > A simple fix, but I'll put it through the wringer before sending it.
> >
> > Ok, here is the patch. I verified this with intentional OOMing 100
> > times in a loop; this would previously lock up on first try in
> > defrag_mode, but kills and recovers reliably with this applied.
> >
> > I also re-ran the full THP benchmarks, to verify that erroneous
> > looping here did not accidentally contribute to fragmentation
> > avoidance and thus THP success & latency rates. They were in fact not;
> > the improvements claimed for defrag_mode are unchanged with this fix:
> 
> Sounds good :)
> 
> Off topic, but could you share some details about the
> tests/benchmarks you're running here? Do you have any links e.g. to
> the scripts you're using to run them?

Sure! The numbers I quoted here are from a dual workload of kernel
build and THP allocation bursts. The kernel build is an x86_64
defconfig, -j16 on 8 cores (no ht). I boot this machine with mem=1800M
to make sure there is some memory pressure, but not hopeless
thrashing. Filesystem and conventional swap on an older SATA SSD.

While the kernel builds, every 20s another worker mmaps 80M, madvises
for THP, measures the time to memset-fault the range in, and unmaps.

THP policy is upstream defaults: enabled=always, defrag=madvise. So
the kernel build itself will also optimistically consume THPs, but
only the burst allocations will direct reclaim/compact for them.

Aside from that - and this is a lot less scientific - I just run the
patches on the machines I use every day, looking for interactivity
problems, kswapd or kcompactd going crazy, and generally paying
attention to how well they cope under pressure compared to upstream.
My desktop is an 8G ARM machine (with zswap), so it's almost always
under some form of memory pressure. It's also using 16k pages and
order-11 pageblocks (32M THPs), which adds extra spice.
