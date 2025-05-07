Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F353072612
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611955; cv=none; b=b+4HhAFDYWsFlmTdE7nPaUTcWcxxQikch3cpCbsjgIILOeH8Ji6rkLD9yalzhK3epfVF0COAuEHms8XSVHdaB3QZGSeRVFybSB8O36vu63z187Gz5q7X4mTM8yy28INhOjXNBOa7usNzneF7r+RI5EXhCynoKvsLFLNHmcDdeOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611955; c=relaxed/simple;
	bh=hctf9fUxOwZ2dleu00wJef0Orl9bGT+3ecqQluILZ24=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tq8ZS4GQ+8MxNePmOhnK9eVVj0Vk9ojPXlRFfZpQWnNp4Gt7EwcFw1bcYJQFzTNWAUmm/k6ly5hhoK0aAwGaWlIkguY3YnwiKXsnmb8PyO6AFVlYFy33W4ShhbPPTXrnzd7ViYfV6TBzm+NdvrDNm+x5gtesUeTOSl2AMESK5gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNCQXLc9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNCQXLc9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54993c68ba0so8550574e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746611952; x=1747216752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3im7oKq6DmunvNsoANerEugtk0ANjYR+KXw8czHW92E=;
        b=UNCQXLc9IOhqZKs7fuLn7YbgroGRtD8EYw3YZHNqrXev/8HYTUapUs6rCk4p4CzvcI
         sI2jT+54zdEJ/IjgqU9XmlcIHjdYdSjazfYtRbGdd/Q8R2FIKLX0fTrWYLx/jwxYYrLQ
         GN6ff5Y5RrAWnTyKxkkKQH4yq8LskklfSv5t4UraRZPNH5sLuV60owsBlxEP0ArWpS6U
         pP7H/MopA6p5EQ5ejs9gEB8Wz2qY4RTTbrAeL2pD8FXaBby602Z05GmkXzURd3TBVv1A
         BPGJf8iSXVbQ/3fgYdt8NYhd0DUfs/m8UjilYpoMaL+fnNfnUEHc1viOtd9LsdjHOmmj
         yKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746611952; x=1747216752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3im7oKq6DmunvNsoANerEugtk0ANjYR+KXw8czHW92E=;
        b=P7UZ/4i3yfS0RrYAcBPGO/MX3i6KGDNliDgf+jUPJV+Jm9Nf754UIBMCa6MUIYAAuD
         eQboeixLG1zzjb/Jbod2SBNPzLbgX/BJ/mEj1pR2PZO/yNCXdqR8jTjMCprWPneXIuYj
         Rd22vSaDN7Mm9zd8HfwDAoQeb/9kMHx61VDz/7EpSxzpQRSphQ2LbXQhZtYYZygzN+Qu
         PrWEcORbMFSxvIoDYs1Y/aDASaMi2WfTjwnoosY3FL3M4m90bklM5vlCfmFh1teVbN7a
         AvRV2KRc4a/rxA9uqqyBs7HzMsfH1GC33/qT2bHXm2mFHsic/zp1mWf5B8B781R6KElC
         PgWw==
X-Forwarded-Encrypted: i=1; AJvYcCWDxWADJP8FIOoGQrSVN5EoGjElQS7YfPpjUdBZisTZLB8mdxUEIKV7ioqY8BlGeAwoEOpxz9/4sU4Lh30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkYVp2qkA59VTnfRKI6bYuM14itp7gk4+QPDHDYLLc9SOn2pdm
	EK2nx37333ik+PNjbwwUXCR+GUTEc06C+3F3j5YJsCEfOrsKMDvu
X-Gm-Gg: ASbGnctB5yiF5Pp68VvOCNPwhL0ApQ5Tc7khvdLsBNynmtutohonkTDD1Z5CwWxSHKg
	Ai9RW/n1kZDGs6a0SsGTGMHyy96Wz197vM6fCAbdeWrhkrq9LqvEkAfln9O9X8YBdLlncBNQUwy
	TmWsNJErCqA5ocwpaB91EdlMEXFN6deRmwS5iXOzL1bL0MW0G9cC9bHbn6kI0Lc77h8fpg3GY1D
	ypPO9X7/DTkwbL4au9tvE/e6i1fotrCphGXIW94rO2SCVCebjqsqWqdaJRXOEFRQ+PqCct38joA
	BaO+gpf5VQr9BYKcrg5ZMT0rNbOKc3zopvdDTHhgacClIxCttZQULQmXZuOFd6BTQwm4
X-Google-Smtp-Source: AGHT+IFbx6JULmkgFfScHp/VGvgyxdZmSckFXgpz3acQYOzG7NKBRoL1GFgQOF3vN2udAsuwjkOlwQ==
X-Received: by 2002:a05:6512:12cf:b0:549:7394:2ce5 with SMTP id 2adb3069b0e04-54fb963cbcamr957466e87.41.1746611951780;
        Wed, 07 May 2025 02:59:11 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6996sm2260787e87.236.2025.05.07.02.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:59:11 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 7 May 2025 11:59:08 +0200
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <aBsu7FnLjpF5rx3P@pc636>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>

On Wed, May 07, 2025 at 10:23:34AM +0100, Lorenzo Stoakes wrote:
> +cc Vlastimil for page_alloc.c stuff.
> 
> On Wed, May 07, 2025 at 11:02:00AM +0200, Uladzislau Rezki wrote:
> > On Wed, May 07, 2025 at 10:05:58AM +0200, David Hildenbrand wrote:
> > > On 07.05.25 01:21, Andrew Morton wrote:
> > > > On Tue,  6 May 2025 18:36:01 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > > >
> > > > > As part of the ongoing efforts to sub-divide memory management
> > > > > maintainership and reviewership, establish a section for GUP (Get User
> > > > > Pages) support and add appropriate maintainers and reviewers.
> > > > >
> > > >
> > > > Thanks, I was wondering about that.
> > >
> > > Thanks Lorenzo for driving this!
> > >
> > > Acked-by: David Hildenbrand <david@redhat.com>
> 
> Thanks David!
> 
> Am trying to strike while the iron is hot post-lsf and discuss with people and
> set things in motion :)
> 
> > >
> > > >
> > > > (looks at vmscan.c)
> > >
> > > Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is
> > > implicit:
> > >
> > >  $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
> > >  198195 total
> > >    7937 mm/hugetlb.c		# Muchun
> > >    7881 mm/slub.c		# Christoph/David/Vlastimil
> > >    7745 mm/vmscan.c		#
> 
> This is, as Andrew rightly points out, a key one, I will have a look around
> the git history and put something together here. I'm not sure if we will
> get an M here, but at least can populate some reviewers.
> 
> > >    7424 mm/page_alloc.c		#
> 
> Yeah Vlastimil put effort into sorting out reviewers here (thanks
> Vlastimil!) but nobody's stepped up for an M yet :)
> 
> > >    7166 mm/memory.c		# David
> > >    5962 mm/shmem.c		# Hugh
> > >    5553 mm/memcontrol.c		# Johannes/Roman/Shakeel
> > >    5245 mm/vmalloc.c		#
> 
> As discussed below 100% Ulad is very clearly the right guy for M (and who
> has graciously offered his services as such) :>)
> 
> Ulad - do you want to send a patch upgrading yourself there? cc me and
> David, I will happily ack of course, and I suspect David as well!
> 
I will :)

> > >    4703 mm/huge_memory.c	# David
> > >    4538 mm/filemap.c		# Willy
> > >    3964 mm/swapfile.c		#
> 
> The various discussions at LSF lend themselves to suggesting people here,
> can take a look at this also.
> 
> > >    3871 mm/ksm.c		#
> 
> As per discussion below, thanks for suggesting yourself David, I hope this
> is a case of 'well de facto I am maintaining this' rather than taking
> anything new on, as I worry about how much your workload involves :P
> 
> I will sniff around the git history too and put something together.
> 
> > >    3720 mm/gup.c		# David
> > >    3675 mm/mempolicy.c		#
> 
> Ack below, and will take a look here also.
> 
> > >    3371 mm/percpu.c		# Dennis/Tejun/Christoph
> > >    3370 mm/compaction.c		#
> 
> As you say lots of R's which is good.
> 
> As per below would you want M for this?
> 
> I will take a look also.
> 
> > >    3197 mm/page-writeback.c	# Willy
> > >    3097 mm/vma.c		# Liam/Lorenzo
> > >    2988 mm/rmap.c		# David/Lorenzo
> 
> > >
> > > I've been messing with KSM for a long time, so I could easily jump in as
> > > maintainer for that. Probably we want page migration (incl. mempolicy?) as a
> > > separate entry. I've been messing with that as well (and will be messing
> > > more), so I could jump in for that as well.
> > >
> > > For page allocator stuff (incl. compaction) we at least have plenty of
> > > reviewers now. For vmalloc we at least have Uladzislau as single reviewer.
> > >
> > > vmscan.c and vmalloc.c really need some love.
> > >
> > As for "vmalloc.c" i can jump in as an extra maintainer aside with
> > Andrew if no objections.
> 
> Entirely the opposite of an objection, I'd be aghast if you weren't a
> maintainer there, thank you for your excellent work in vmalloc, you're a
> top chap and we're very lucky to have you working on this!
> 
Thank you i send out that patch today and put into CC you and David!

--
Uladzislau Rezki
