Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB37185E7F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771540; cv=none; b=Pynr69QCmqs96Sx9w3ZVkHPxJMypvCmaxncpp5gAV9LIs7+Iy7s+49R4HXfABoQx4mmzZQqVvtkAFKexW0waeGbcUt3Q8PnbG3z+HRtwIwAWHujkhzoHQyNCee6D+pe6FiAoIvlc4srthfbBqxEnF9wzpHqARbiwXkkLWL/vpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771540; c=relaxed/simple;
	bh=7GtzonogMvHHgGMGnFdGJR/KaR3oN192mOjriytdFq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3jlGCabdgcugqEH4+udYXXuJgODVQtGueMy6EEM3S6q8jjc+qJXahohTG8x7M35irWOuSVdHFkbhtgslaaUDM3gduxPRMW2NRYfqADiK0v0874L11Lhn2Qy5zUL9V+jmk6wqGsDMzSYN0rPxD6CYVbPL/QnYQOkraQ+w9aEYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=GuO847zS; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="GuO847zS"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-46fcbb96ba9so75443071cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1738771536; x=1739376336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nI3OxNrtDO2/9J234gYunPE+YsfotDZVga3ivwTWhbY=;
        b=GuO847zSa5SDVSAjZoADJH/XEpGrA/2iY/sib4X2bRYDQh9rH8L2OWLjO+LUqqigB2
         kAACUbDDwmpdTmESt+kAocmB+576/uhwdqn2jrasUT0ZzL5kSqw3Fh5maxORjKUYAIrM
         WOVPqUOAY46GkSGqX9j4W6I90r9UEvURRCiA6g+LtefbBTHFm8Oe6P5Xw8nHFXrVtNTJ
         HSJaBCXCTW9kUXa6tttK8lDaHn7j5LavN07UMfkh35QfLIyhYO5IvTS4EKZW7H2Dcoj4
         R3l/3+tyhdZaQWEBlS/Z+2WMo1s8BT8VUk/Y3vjtqOcsS6ay7tzaiAqtSXC+10N0M4Fl
         iteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771536; x=1739376336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI3OxNrtDO2/9J234gYunPE+YsfotDZVga3ivwTWhbY=;
        b=QMAi8zuYUL85t6dEgrFnsaqAatoaOhkBYeSuMgTPJyEcfxAL3ABQXrWpH0+t/Q26nr
         gUI8omVBhku+lAR/4MBInIueuO/SO4i21Lj26sVXqt1ShT2/6zBa/FJcZ+/gnJ//CRmz
         dVirwX+hlc/eAVdO0nxLwpFlu9pDIxI1nIYYjEj+YiJfKcdaCl4qCCh5LmisMzQeWZJL
         po9NVSFXsFIYmwAIWYYAfj46OltAxemcHXyKtdDmZxXy0hLEJ2KIjq2hkXVFNgih931o
         JiDLBdP2QKsd3hUhgA54faVB4ibXRb+QppMp7R7aJTxL7CxgPdTcrRx+ZnIuSquyM1uv
         mEGA==
X-Forwarded-Encrypted: i=1; AJvYcCVLF2BE12cah0HGpuOyml4jcmQ7SryBFHzQ8VOY5xSHuNZzQXrv+gpXsMbs/POWU0z5mYBmLxMc8eA9vSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46cCeF6sZqJVcwByL6QwWNkPiEtKs5/TJlrKyIq4hQRFZj0Te
	T2ollBbhZKcDu0DhHM5DqrU/jR8UPiIRcm3wGecYWfAsO5hTSHJEovaBghzHWjI=
X-Gm-Gg: ASbGncvzobokllMLQDaAWQQpr+wFLWGvU+5eWxQTa9N8YF0kSl3+fDge+QZn3obZX/C
	/ZFqf2PT6oNpd8/ftf/p3s/kmF3t1YHrAB76+l81ho/KoIvUMMAeo7Y36pBTsNPKq/Uee/wqmIr
	SWd902YeD/Zs86WG0BDsLURLR9/mxSH+Rh6IGDA0CxV+0lhjWL5775nANAv+hbz+HIJtAgPlzK7
	fpRWcMJbk3Jei99n1ne/eTb1gCbn6ESXvppSE7eP00ZfaAihbWOktOUpHavYykM92iW6/rFTvuT
	tIH6Hgf85yfJBA==
X-Google-Smtp-Source: AGHT+IGDxwlKxUxtmqiAukdUNAhCmwtT1XnLXZnSe9RyA+1/jO1dxUHk3/+YWgtCBRrKv23ZyapWoQ==
X-Received: by 2002:ac8:7d91:0:b0:466:b122:5143 with SMTP id d75a77b69052e-47028168982mr51301281cf.16.1738771536086;
        Wed, 05 Feb 2025 08:05:36 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-46fdf18cbb8sm71612721cf.78.2025.02.05.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:05:34 -0800 (PST)
Date: Wed, 5 Feb 2025 11:05:29 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Bharata B Rao <bharata@amd.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Raghavendra K T <raghavendra.kt@amd.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, lsf-pc@lists.linux-foundation.org,
	gourry@gourry.net, nehagholkar@meta.com, abhishekd@meta.com,
	ying.huang@linux.alibaba.com, nphamcs@gmail.com,
	feng.tang@intel.com, kbusch@meta.com, Hasan.Maruf@amd.com,
	sj@kernel.org, david@redhat.com, willy@infradead.org,
	k.shutemov@gmail.com, mgorman@techsingularity.net, vbabka@suse.cz,
	hughd@google.com, rientjes@google.com, shy828301@gmail.com,
	liam.howlett@oracle.com, peterz@infradead.org, mingo@redhat.com,
	nadav.amit@gmail.com, shivankg@amd.com, ziy@nvidia.com,
	jhubbard@nvidia.com, AneeshKumar.KizhakeVeetil@arm.com,
	linux-kernel@vger.kernel.org, jon.grimm@amd.com,
	santosh.shukla@amd.com, Michael.Day@amd.com, riel@surriel.com,
	weixugc@google.com, leesuyeon0506@gmail.com, honggyu.kim@sk.com,
	leillc@google.com, kmanaouil.dev@gmail.com, rppt@kernel.org,
	dave.hansen@intel.com
Subject: Re: [LSF/MM/BPF TOPIC] Unifying sources of page temperature
 information - what info is actually wanted?
Message-ID: <20250205160529.GB1183495@cmpxchg.org>
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
 <20250131122803.000031aa@huawei.com>
 <20250131130901.00000dd1@huawei.com>
 <de31971e-98fc-4baf-8f4f-09d153902e2e@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de31971e-98fc-4baf-8f4f-09d153902e2e@amd.com>

On Wed, Feb 05, 2025 at 11:54:05AM +0530, Bharata B Rao wrote:
> On 31-Jan-25 6:39 PM, Jonathan Cameron wrote:
> > On Fri, 31 Jan 2025 12:28:03 +0000
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> > 
> >>> Here is the list of potential discussion points:
> >> ...
> >>
> >>> 2. Possibility of maintaining single source of truth for page hotness that would
> >>> maintain hot page information from multiple sources and let other sub-systems
> >>> use that info.
> >> Hi,
> >>
> >> I was thinking of proposing a separate topic on a single source of hotness,
> >> but this question covers it so I'll add some thoughts here instead.
> >> I think we are very early, but sharing some experience and thoughts in a
> >> session may be useful.
> > 
> > Thinking more on this over lunch, I think it is worth calling this out as a
> > potential session topic in it's own right rather than trying to find
> > time within other sessions.  Hence the title change.
> > 
> > I think a session would start with a brief listing of the temperature sources
> > we have and those on the horizon to motivate what we are unifying, then
> > discussion to focus on need for such a unification + requirements
> > (maybe with a straw man).
> 
> Here is a compilation of available temperature sources and how the 
> hot/access data is consumed by different subsystems:

This is super useful, thanks for collecting this.

> PA-Physical address available
> VA-Virtual address available
> AA-Access time available
> NA-accessing Node info available
> 
> I have left the slot blank for those which I am not sure about.
> ==================================================
> Temperature		PA	VA	AA	NA
> source
> ==================================================
> PROT_NONE faults	Y	Y	Y	Y
> --------------------------------------------------
> folio_mark_accessed()	Y		Y	Y
> --------------------------------------------------

For fma(), the VA info is available in unmap, but usually it isn't -
or doesn't meaningfully exist, as in the case of unmapped buffered IO.

I'd say it's an N.

> PTE A bit		Y	Y	N	N
> --------------------------------------------------
> Platform hints		Y	Y	Y	Y
> (AMD IBS)
> --------------------------------------------------
> Device hints		Y
> (CXL HMU)
> ==================================================

For the following table, it might be useful to add *when* the source
produces this information. Sampling frequency is a likely challenge:
consumers have different requirements, and overhead should be limited
to the minimum required to serve enabled consumers.

Here is an (incomplete) attempt - sorry about the long lines:

> And here is an attempt to compile how different subsystems
> use the above data:
> ==============================================================
> Source			Subsystem		Consumption         Activation/Frequency
> ==============================================================
> PROT_NONE faults	NUMAB		NUMAB=1 locality based              While task is running,
> via process pgtable			balancing                           rate varies on observed
> walk					NUMAB=2 hot page                    locality and sysctl knobs.
> 					promotion
> ==============================================================
> folio_mark_accessed()	FS/filemap/GUP	LRU list activation                 On cache access and unmap
> ==============================================================
> PTE A bit via		Reclaim:LRU	LRU list activation,	            During memory pressure
> rmap walk				deactivation/demotion
> ==============================================================
> PTE A bit via		Reclaim:MGLRU	LRU list activation,	            - During memory pressure
> rmap walk and process			deactivation/demotion               - Continuous sampling (configurable)
> pgtable walk                                                                for workingset reporting
> ==============================================================
> PTE A bit via		DAMON		LRU activation,                     Continuous sampling (configurable)?
> rmap walk				hot page promotion,                 (I believe SJ is looking into
> 					demotion etc                         auto-tuning this).
> ==============================================================
> Platform hints		NUMAB		NUMAB=1 Locality based
> (AMD IBS)				balancing and
> 					NUMAB=2 hot page
> 					promotion
> ==============================================================
> Device hints		NUMAB		NUMAB=2 hot page
> 					promotion
> ==============================================================
> The last two are listed as possibilities.
> 
> Feel free to correct/clarify and add more.
> 
> Regards,
> Bharata.
