Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831E25E444
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213826; cv=none; b=HA4KxKt1A5it5ZMtRBEYAJ9XisNDvoptPP8PlN9Iqm6zclhRRyKiGzAF4x+mflLI9dFmtQP8QNtgCokfMtkWg1FlkgpZdLqbyWainbilnqj8pKZjma04J8+ZkqPey28kHfgDFqLSJ7ioWzFZFg6tX7wegC70JV0PwrjCGkxONuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213826; c=relaxed/simple;
	bh=/8TFukhjNZFl/QAmZfFGpYkHMiZ48gFKFD/2h1j3e2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/CvOEoU7Q3VWTLXmYLRiF8nEfCkL2Eby4Wa/bAmGOTj1CqgtQ8VZpM4eypG+p+dbFpDB//1AJpKK82JcDwIiiIcKG3VBRiPlr8Da8UH6LYj3aquS2p4UQAUZLsD/yQcr7WdxXi74q084HnxV5RXndZU0JIk/6mGAekRt3XKAmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BXYeDHDg; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BXYeDHDg"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47190a013d4so19881cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739213824; x=1739818624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRAb/D03pytUenhuHtQraadFW6pLnX0kbPnJgYRVOzo=;
        b=BXYeDHDg6nQXxABDdzOgt0LltRJtamAMsOJxvQswXHSsA+X7du8JGSe8ehxnyu16bT
         6+rKHO+nvv/TJJFccLnYd2EVOLVhPrCVP/jXAkBCVJGT7Cd4w/chFVPB3jV0NebkzaZ+
         uS7nTXh3vMmcZ71t/hK84j2ivN/PYuBgmyl3HBNQTkA7FGoQ9Dweo15Roy4YR8DArB3x
         iwg/Oru2ED2G6GtZ0blElPppN8oWk8ZssKiKkgdQD/wQCdyu1uMauTeTHsH5nmqymBwa
         1R9CvLmQh6YLCkb3nvTSkimyxUyR7jrLXuguXaRREqdb/KpFqg2iMXR6VX3LPPTPjn+O
         iK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213824; x=1739818624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRAb/D03pytUenhuHtQraadFW6pLnX0kbPnJgYRVOzo=;
        b=YCY0BVHT0t9cJnc+8ncs1i503CbXl/4pBvVaQxE63MBJYaEUBWge2x40NnYc6MxASj
         2pVN+cvLeZEdLXxsddPFBWYgmf8st0cIqBErfhzuRV2e1LRMvHwrXmzgNHovb0szwDZ+
         5z/DwDaKTbYTMnkT9kzFTiwakiPQCfh60pWMWKj7sa+aH0PY8fCKBKP4T42n9a5DXh4H
         n9qL+MBYHzvzqT53TgbDLBdloRmmHbjvJBkGWKjiVjfwso1OFNE0ijJsU8QegGoR9LTI
         zrEYV3xVw/vZXTvLlV1I42k5BQmelVZlZ1oFVewo2SfZeV5DKlJigpM4YpCKls47felc
         qA9A==
X-Forwarded-Encrypted: i=1; AJvYcCWlr/YdRYmo6DFcxgCFS6vaNm1Ftxp9fzSe8tLHse04waG+dUHqKJ7L9Z8H327epm5T3YrSD/o5jVupBzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfzOQ+/mGigZ4Ss1wqvCNrC9aPmntjCYtOrsWSpGElZwtrMffz
	LXyCMbPYsmLmwlCSw65OrnIlPIFCE/FBgzsyz3lEg5YRRXi7fYyqtjwfSjt2OQAqSMTYtJLGj9b
	1h8Uw0eg0XcaMQ9+dy1JIKgYujM+VClb8jWAg
X-Gm-Gg: ASbGncvvG4yIY0fZCyVb5+MK1dTmtt5kbCHJ1NBIdzJXHEFJNRozcCvCI7JkAH1uWki
	jzbF6fBLtqREBeoJRwiE6YA39z1IAYJL7k3O9jtaQToW3nylSECzJrvagJV0xbpPCJfGfmQ==
X-Google-Smtp-Source: AGHT+IHGrUGKctHgF5EXuFj6W7gx2uPEg3KGYpeyi4npFHQFkAoFsxTe5QJZlN3hiorx189s1yAIElU7d3eINrZp58w=
X-Received: by 2002:a05:622a:189d:b0:461:4150:b835 with SMTP id
 d75a77b69052e-471a2113accmr91301cf.6.1739213822004; Mon, 10 Feb 2025 10:57:02
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com> <Z6pH_9X-kFhwPz2-@localhost.localdomain>
In-Reply-To: <Z6pH_9X-kFhwPz2-@localhost.localdomain>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 10 Feb 2025 10:56:50 -0800
X-Gm-Features: AWEUYZkSA6fxf7ilqP88ncNgDHw5A1iKJ25LiAsKbIkCmOgG3Ya5fm3t_K7yjG8
Message-ID: <CAPTztWYD09A5rJBPNtjDa07uMswxFHutYGwBR54ByfMchd6YKA@mail.gmail.com>
Subject: Re: [PATCH v3 00/28] hugetlb/CMA improvements for large systems
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 10:40=E2=80=AFAM Oscar Salvador <osalvador@suse.de>=
 wrote:
>
> On Thu, Feb 06, 2025 at 06:50:40PM +0000, Frank van der Linden wrote:
> > v3:
> > * Fix SPDX comment include file format.
> > * Add new hugetlb_cma.* files to MAINTAINERS
> > * Document new ranges/ subdir in CMA debugfs.
> > * Fix powerpc compilation for config without HAVE_BOOTMEM_INFO_NODE
> > * Fix various other nits found by kernel test robot.
> > * Use a PFN value of -1 to indicate a non-mirrored mapping
> >   in sparse-vmemmap.c, not 0.
> > * Fix incorrect if() statement that got mangled in cma.c
> >
> > v2:
> > * Add missing CMA debugfs code.
> > * Minor cleanups in hugetlb_cma changes.
> > * Move hugetlb_cma code to its own file to further clean
> >   things up.
> >
> > On large systems, we observed some issues with hugetlb and CMA:
> >
> > 1) When specifying a large number of hugetlb boot pages (hugepages=3D
> >    on the commandline), the kernel may run out of memory before it
> >    even gets to HVO. For example, if you have a 3072G system, and
> >    want to use 3024 1G hugetlb pages for VMs, that should leave
> >    you plenty of space for the hypervisor, provided you have the
> >    hugetlb vmemmap optimization (HVO) enabled. However, since
> >    the vmemmap pages are always allocated first, and then later
> >    in boot freed, you will actually run yourself out of memory
> >    before you can do HVO. This means not getting all the hugetlb
> >    pages you want, and worse, failure to boot if there is an
> >    allocation failure in the system from which it can't recover.
> >
> > 2) There is a system setup where you might want to use hugetlb_cma
> >    with a large value (say, again, 3024 out of 3072G like above),
> >    and then lower that if system usage allows it, to make room
> >    for non-hugetlb processes. For this, a variation of the problem
> >    above applies: the kernel runs out of unmovable space to allocate
> >    from before you finish boot, since your CMA area takes up all
> >    the space.
> >
> > 3) CMA wants to use one big contiguous area for allocations. Which
> >    fails if you have the aforementioned 3T system with a gap in the
> >    middle of physical memory (like the < 40bits BIOS DMA area seen on
> >    some AMD systems). You then won't be able to set up a CMA area for
> >    one of the NUMA nodes, leading to loss of half of your hugetlb
> >    CMA area.
> >
> > 4) Under the scenario mentioned in 2), when trying to grow the
> >    number of hugetlb pages after dropping it for a while, new
> >    CMA allocations may fail occasionally. This is not unexpected,
> >    some transient references on pages may prevent cma_alloc
> >    from succeeding under memory pressure. However, the hugetlb
> >    code then falls back to a normal contiguous alloc, which may
> >    end up succeeding. This is not always desired behavior. If
> >    you have a large CMA area, then the kernel has a restricted
> >    amount of memory it can do unmovable allocations from (a well
> >    known issue). A normal contiguous alloc may eat further in to
> >    this space.
>
> Hi Frank,
>
> While I plan to keep reviewing the series, I think it would make sense
> to split this patchset into two smaller ones.
> The way I see it, we are trying to deal with two different problems and t=
heir
> solutions.
>
> 1) pre-hvo at boot time
> 2) multi-range support of CMA (only used for hugetlb)
>
> I did not go through the entire patchset yet, so I ignore whether the
> respective patches to tackle these two problems are really dependent on
> each other, but I think that would be very interesting to consider a
> patchset per solution if that is not the case.
>
> IMHO, it would ease review quite a lot.

Hi Oskar,

Thanks a lot for reviewing this series.

I certainly could split it up, but here are the dependencies (it's
actually 3 parts):

1. Multi-range CMA (used by hugetlb) (patches 1-4)
2. Pre-HVO for hugetlb bootmem pages (patches 5-22)
3. Enable hugepages=3D (and pre-HVO) for CMA (patches 23-28)

1 and 2 are independent. 3 depends on 1 and 2.

So, I could post 1) and 2) simultaneously, and 3) would have to wait
until 1) and 2) are resolved.

Andrew, do you have any thoughts on splitting it up?

- Frank
