Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75801F3D56
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693259; cv=none; b=Q716yELXQuyVlTz9gqp0kr75ksEkus/A2l4+vmsMx4gq0YD9j0P2pMBEjEJ6LMiCElVcCAIG4S5grFFby4KvoRfpE54w8mzjhXeaSXl7E2afXJWuZYizrn/kdZX/rBsO/Js32qiD5VCyS1uPutAYepgKmy9x2zFzRFtMfvsU+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693259; c=relaxed/simple;
	bh=Bg+dtnYpl2VdhNpsVZPf6Taz3ai8xl6l07TTWY3wZo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owBMfl2poVv/XDjAoVyafU+EtSXpc4hvVbO/E3m63rY74INAbQ/t2XwXVGvG2G6vOR+vRLeJC1fKG3/HhcNOcIpcoY2Yz7rkBETbFRsdyi3lkFcJaGQnaWh9bsUlv4PJfbX3/HlkW4lQgTYsTty2ZS71NW8IfQffmk6aNAenMoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grXgdaAp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grXgdaAp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc1f6so879240f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693256; x=1744298056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zesTfvhE2YJxqZrUkOmQImcB4JZs5LCDw+hQnMIH21A=;
        b=grXgdaAp/4Fzt6OwVRCEVuz/azRE0t8bp7WTrohz5xDdu/BB6CucPG/AIlHToJBsUw
         JU8zKMCFsZH2dh23kiLU9J42W88zowDLQB1223GIPDxP+Uu08+3mjjvce0eduiSL/qVA
         3OZ+mxEdhgcoyv/zXUwgjA9oXsz0rxTT71RnAs47kxeyGvHoA0h4HjFliuq/snJJrDZD
         g7Ztj+vNsaauNnJ8B9XWTHt456wy3LUo0CFWBEsLyy9ZmIkn2In25M8Z6lSMov/DXXL1
         c+F59hJi1GXfOSRJ0fAo8P3NiZ1bbiXabsROn+JOCcB9f9yKC8zQ1zm5mljd6SpU3u8O
         U/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693256; x=1744298056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zesTfvhE2YJxqZrUkOmQImcB4JZs5LCDw+hQnMIH21A=;
        b=LgRgozHogs3f1TukOK0DBTi+wswTmEv/LFO/t38dvzfsp1yhO9JMnAQ9YznqL508YZ
         5HwcFZTwTnZmkpQ5TJRwmEuLPUltlVyS8ikD7zfyqmjvS+kxK1X8jIakewleeAxEBy5E
         Z+JxpSw1cMwT6EX+BNs0bd7k8g5ru4O6d01GVK4kuM6rncdL2LNRNvxq55nKuL1/rjdA
         6sneDCFLKyp1lQDQW5XKP1iOEyja6IfMt0lqEBP9vmywfiYxRSybwC6d6uGKcw6gWHzl
         FA2awHY8JjR5nqsYotDGMYvSW+Sq0Co21OrCg168fmGMqVWqIJlyau0irP53oga/fouJ
         NmCw==
X-Forwarded-Encrypted: i=1; AJvYcCVeU0o1/DbMqerqIFUwC4EI+u7fa1WmKez7ann7FGuLNi6nmuZzEIo4w9JpsqfFa4jE7Oj3jDZLVSQpU/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ppArpQLuDKVmmF6pTreTMC63cVUl4yBaXexruWxdWWhMYnYo
	ovdwAEN7c+cvU3S7pjW5U+VdMro+B+b5pKkQ/JOiCqUD3lPozntQ0s9U7PddV3Q=
X-Gm-Gg: ASbGncvJjif/DE6QwqGB6TFGAZG/rS4qUvoMV2RhF2nE6PZNmN1rvCrpyAQMyhCJU5a
	//6peZEsJPWJqLMh/0EnIeidSFvrEl6yplBfnw4qfGtFc7w1NHzRNJcZo7oGGcu1g1KSSeJ4NF8
	AGoeEUqrl10acs32YEiW9zPyLq1oABnCJNepIxCV58JDXkpifobr+MGyihMQBx5Gu1AczytwP6M
	8D1nShFpuTJBv2Ms9iaZhm7RAai5s5cFWfCbdbgVOfm5IJ3FkC0axzZ5gwNvdRc8zFXO0tUu5iG
	jdb33IHcnt9purc3UDcOIwCXI2qMqe8ztu0OZdJgz6EmrXzwSA==
X-Google-Smtp-Source: AGHT+IFMCCjbDEb0ODe6Sl1fKegMQn7DnIEF6seKhoqCEcHbDlk903Mu/qkvcsEO6a7wEAqglg0Faw==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr22332900f8f.22.1743693255931;
        Thu, 03 Apr 2025 08:14:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a6796sm2085299f8f.31.2025.04.03.08.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:14:15 -0700 (PDT)
Date: Thu, 3 Apr 2025 18:14:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, kernel test robot <lkp@intel.com>,
	oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, x86@kernel.org
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>

Sorry, I've been having trouble with my email recently...  I replied
earlier but my email got eaten on the way out.

What happened here is that the zero day bot emails go to me first and
then I review them or forward them depending on if they're a real
issue or not.

Here it's a false postive because it's set and used if the
(src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
this correctly.  I've been meaning to fix this in Smatch for a
while.

But these days more and more people are using lei and b4 to get their
email so they see the unreviewed Smatch warnings.

regards,
dan carpenter

On Wed, Apr 02, 2025 at 12:37:24PM +0100, Lorenzo Stoakes wrote:
> Bcc:
> Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
>  copy_page_range()
> Message-ID: <0f94adaf-37a4-4d38-b952-01c2dc474a2c@lucifer.local>
> Reply-To:
> In-Reply-To: <b21bcd61-faf0-4ad8-b644-99794794594f@redhat.com>
> 
> Actually let me +cc a few more so this isn't lost further :P
> 
> On Wed, Apr 02, 2025 at 01:32:52PM +0200, David Hildenbrand wrote:
> > On 02.04.25 13:19, Lorenzo Stoakes wrote:
> > > On Thu, Mar 27, 2025 at 09:59:02AM +0800, kernel test robot wrote:
> > > > BCC: lkp@intel.com
> > > > CC: oe-kbuild-all@lists.linux.dev
> > > > In-Reply-To: <20250325191951.471185-1-david@redhat.com>
> > > > References: <20250325191951.471185-1-david@redhat.com>
> > > > TO: David Hildenbrand <david@redhat.com>
> > > >
> > > > Hi David,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250326-032200
> > > > base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> > > > patch link:    https://lore.kernel.org/r/20250325191951.471185-1-david%40redhat.com
> > > > patch subject: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
> > > > :::::: branch date: 31 hours ago
> > > > :::::: commit date: 31 hours ago
> > > > config: hexagon-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270941.IFILyNCX-lkp@intel.com/config)
> > > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > > | Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
> > > >
> > > > smatch warnings:
> > > > mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
> >
> > Huh,
> >
> > how did the original report not make it into my inbox ? :/
> 
> Yeah it's odd... maybe broken script?
> 
> >
> > Thanks for replying Lorenzo!
> 
> NP!
> 
> >
> > >
> > > I have a feeling this is because if ndef __HAVE_PFNMAP_TRACKING you just
> > > don't touch pfn at all, but also I see in the new track_pfn_copy() there
> > > are code paths where pfn doesn't get set, but you still pass the
> > > uninitialised pfn to untrack_pfn_copy()...
> >
> > If track_pfn_copy() returns 0 and VM_PAT applies, the pfn is set. Otherwise
> > (returns an error), we immediately return from copy_page_range().
> >
> > So once we reach untrack_pfn_copy() ... the PFN was set.
> >
> > In case of !__HAVE_PFNMAP_TRACKING the pfn is not set and not used.
> >
> > >
> > > I mean it could also be in the case of !(src_vma->vm_flags & VM_PAT) (but &
> > > VM_PFNMAP), where we return 0 but still pass pfn to untrack_pfn_copy()...
> >
> > I assume that's what it is complaining about, and it doesn't figure out that
> > the parameter is unused.
> >
> > So likely it's best to just initialize pfn to 0.
> >
> > >
> > > This is all super icky, we probably want to actually have track_pfn_copy()
> > > indicate whether we want to later untrack, not only if there's an error.
> >
> > Sounds overly-complicated. But having a pfn != 0 might work.
> >
> > > > Will comment accordingly on patch, but I mean I don't like the idea of
> > us
> > > just initialising the pfn here, because... what to?... :)
> >
> 
> Sure, I mean for all of above let's have the debate on the main patch I guess so
> it's in one place...
> 
> > Stared at that code for too long (and I reached a point where the PAT stuff
> > absolutely annoys me).
> 
> But, also lol. Can. Relate.
> 
> >
> > Thanks!
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
> 
> Cheers, Lorenzo
