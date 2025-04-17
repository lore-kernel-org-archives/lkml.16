Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8939851
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892285; cv=none; b=t7BtA26UfRC4rdSSLrp/WHgZ6T4+gNwDxVpPs/IZTPsXZ+JOS0zbDWPCyqpasSjrza++qaB6H77OGkJ1XNUxne2X+MpbFmZASJQQv4cmtsiQrLZ0kGfIGT+ZfkdcRcIf+P5he8gcoYkBrd7Upc8hYlcdC6FZRHObbj5OrRSTWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892285; c=relaxed/simple;
	bh=aI5HTFtXWensYCzuorIVAP9oUM4ihcHFh41OUyrv4QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiT3r3acxXWHgZhnjRhOAhplpaol6fxG91yxs8LLvnMmxrJ939i8u0S+PFI70viTCA8/pqK/k6mqUzOt8pbgUhAU4YJyni31aYmxxB3+MDB3+K0jZxUwDSN9vyV3Wmhzki4P6jp0sef5FsWmcKcmPucPB+0AbqPDVgxTBuDK7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=uLRCuR7+; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="uLRCuR7+"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad74483fso8271516d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744892281; x=1745497081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6zGWREKiNSbSEtD4UDjmKU/QdI2LbKnHVnU0n3Ksd+g=;
        b=uLRCuR7+9YS47KbMtu6APXFRS+ah+/KfiOG4iWikCPq+U5XYWQ6YDmlYeY9YjI6iUc
         yxLiOhdcW+ZSjOQugOqYNZHSBWl+RESnSEWjd1f5hiAxJ6bc+azhyDAjvk1KOgUTc+AQ
         Rs1s24JPwR+Ulib0Fv4FwaRM7klV1bOKH2w+byjpB4JDyIJZVoz++6jQKRdpFAEIlKbs
         TBB2Vc3khVejT/M0x9lY9xHyKu7WMBcHWy+KpCerjuLmQ7TF4pVaNQoXiwDVzrEZy9W+
         WAOwx/XGd8RHzlPidNVh5uJ5xRaS4D3VY7tRaByk8div6r3DADrxJSINFiA2O/AIukRr
         neUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892281; x=1745497081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zGWREKiNSbSEtD4UDjmKU/QdI2LbKnHVnU0n3Ksd+g=;
        b=AeXbGQ6BKSJkC16zlsib0Dn9VUW98D7Nr9OG+WN3ihpkG2pBRI30tp56gEsceIdz5C
         pRQS7ePUNNafXddPpnbjj3BwHGNo20X4RSmwF5f4t+lS7GlH00tb/LeYUjqANw4fz1Jg
         ioesahh0O/AKxn1WBYw5iOa/7PAFgVcM3vBRfzTdzYbdfmmbun2t+q2GObznqDYZl8tI
         UofbtGLzCi3/2W4RFR9JbFvf2IKk3nj0PMpj+lOC66EfVzyNZlhc6nNyipaQFSpHgvLa
         uLA6fxHktGkt77/UZ2rhNs9rwbbxwovnFgqBktTBYY89PK1+DtZLi9VvIQg/KDEe3h2a
         GFjA==
X-Forwarded-Encrypted: i=1; AJvYcCX7RMU2HHm46bbJUjfr+8NZcsMjxLlp1MT8/J/wyLNEneiwcNhRG7dcrrYkLftA9++F8foxlcW0a0daxlM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CbvCQfjB4j1AwY15XWjcx1mlOYN7M0jXN96oQ1YlQ3VHizG0
	cM/nhiaZcL8f0MLsEAiL9/jgTtAASHtetJ2jcsaH1yzmzJ8xcaz54GZnhDZnIdA=
X-Gm-Gg: ASbGncs7Dq77ITbTAcnq5Ma1BreqVv4y35rHxU4YvSNORAKNgCif7YIrpTdseYS7EFg
	EtSajVGJs/7jT0vIR0b80mmY8EO6CmFHsHRgrR6dmMdIIFfCZoTAi4x5Oi9zI34n6BfuAHnRGT4
	0MU8E8Iu5U2YxTNAmmvWVNSAgZRcpmxRKQFGcoEUTmO1NczyoPg19gyce0VCuyQDLuQ5r0HTz7w
	rdSHlKvY/xRlI4vC6qI3OMWMwnuME3+vMpddlHe8+kDDAz2PraUI5FFyHsYsBUTJoZUSVgZh1FE
	DjOVm/We1UzNbeEhZnkUbMl1ABv4OrLqt0+BdJg=
X-Google-Smtp-Source: AGHT+IHqIQIkHHKFNpzRwxoPPSkGF/U7CIZx4JLl8hQ4M4aX6BdWZoE18416/VYbXnz2bZdENGdsrg==
X-Received: by 2002:a05:6214:5293:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f2b30516c4mr96452066d6.34.1744892280753;
        Thu, 17 Apr 2025 05:18:00 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea07d4csm126932316d6.84.2025.04.17.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:17:59 -0700 (PDT)
Date: Thu, 17 Apr 2025 08:17:55 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Barry Song <21cnbao@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
Message-ID: <20250417121755.GB780688@cmpxchg.org>
References: <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
 <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
 <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com>
 <20250416141531.GD741145@cmpxchg.org>
 <239cfe47-9826-402b-8008-de707faa160e@redhat.com>
 <20250416181835.GA779666@cmpxchg.org>
 <CAGsJ_4zt2Yuornri1bO=3o7myey1Q2dmvtjn2baD0ahxOyoNjw@mail.gmail.com>
 <20250416235849.GA780688@cmpxchg.org>
 <CAGsJ_4wfWLbDC5SruF5TtH-VXE08OWxan12qNYSV3vGzBfe5Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4wfWLbDC5SruF5TtH-VXE08OWxan12qNYSV3vGzBfe5Bg@mail.gmail.com>

Hi Barry,

On Thu, Apr 17, 2025 at 10:43:20AM +0800, Barry Song wrote:
> On Thu, Apr 17, 2025 at 7:58 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > On Thu, Apr 17, 2025 at 05:54:57AM +0800, Barry Song wrote:
> > > I agree that "access locality and recent use" is generally a good heuristic,
> > > but it must have some correlation (strong or weak) with the process lifecycle.
> >
> > I don't agree. It's a cache shared between past, present and future
> > processes. The lifecycle of an individual processes is not saying much.
> >
> > Unless you know something about userspace, and the exact data at hand,
> > that the kernel doesn't, which is why the Android usecase of MADV_COLD
> > or PAGEOUT for background apps makes sense to me, but generally tying
> > it to a process death does not.
> 
> I agree that MADV_COLD or PAGEOUT makes sense for background apps,
> but I still believe process death is somewhat underestimated by you :-) In
> Android, process death is actually a strong signal that an app is inactive and
> consuming much memory—leading to its termination by either userspace or
> the kernel's OOM mechanism.

That's exactly what I'm saying, though. You know something about
userspace that the kernel doesn't, which results from the unique way
in which app scheduling and killing works on Android. Where you have
recent foreground apps, idle background apps that you can kill and
switching back to them later transparently restarts them and shows the
user a fresh instance. But you have to admit that this is a unique
microcosm modeled on top of a conventional Unix process model.

So this doesn't necessarily translate to other Linux systems, like
servers or desktops. There is much higher concurrency, workingsets are
more static, there is no systematic distinction between foreground and
background apps (not in the Android sense), OOM killing is a rare
cornercase most setups ususally try hard to avoid etc.

But surely even Android has system management components, daemons
etc. that fit more into that second category?

> We actually took a more aggressive approach by implementing a hook to demote
> exclusive folios of dying apps, which yielded good results—reducing kswapd
> overhead, refaults, and thrashing. Of course, it is even much more controversial
> than this patch.

That doesn't sound wrong to me for Android apps.

How about a prctl() to request the behavior for those specific app
processes where you have clear usage signal? And then by all means,
outright demote the pages, or even invalidate the cache.

Delete the files, discard the flash blocks! (Ok that was a joke).
