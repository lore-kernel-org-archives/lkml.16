Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49D612E5B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813403; cv=none; b=dokeXGdYl0wzfrQkEd/N/dI3KWwOqndNSJoTL4s+fuTRfk6Mde2FZ7XMM2hlXtjpcC054dQL5kmgXODVNVEleuIyVCcikC/UijCw4godaB1KF7QqnIPsjsK8JsNFIry429YsDk3EKpIRzmKSoYi1UiqlnU95RfSb64n7Te08OI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813403; c=relaxed/simple;
	bh=IaXGz566qug/+3EDaHBOJMa42yV+T656nzKq4hpX70A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRiG83ROQ8ca5dEOuj83WDSwmdVRCr6a+8Mzxv6gAtz3i25/cs+eOOpJIxZWYGH4Smc66zEEr3KAYZsrB0Jd2x1yHlZMtjo69ZrBeyKG8mHAbQyaFrd9sZnT/d9q+RZEO2M6XADVfxt+FJoC0L/2r/werOwLqVXSLl6n7Ecc5eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tniVTUKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tniVTUKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC49FC4CEEA;
	Wed, 21 May 2025 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747813403;
	bh=IaXGz566qug/+3EDaHBOJMa42yV+T656nzKq4hpX70A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tniVTUKM4XvL4gNhywgKr7aRHfydPT1P95tSVrdRRZah7fr7CfHyu4SD8A5iOLXWQ
	 fddFnOKbF7JJoxNQQ86pNryBmgx0W9LznRBXv/FY0L080INbPqjn644g+ce3cmKPLZ
	 P8rcOvI00ufaMAbagclmhJ+6Flgkw01Ujifw8AQAsd0ijkHfkXe0zS8L47tcObZhCL
	 MXxAgNQC1MJ4GAlSbbQUP6YnVlT9P5dp7Ubviph56Tsmh3ykF5eanv6mNG2tyMdosH
	 lnw+HiM5D3oHvdkMKyy9bWTs6iVrmeDu390ARaR3VYjb8+11irgtcuGihmG3wo0yUG
	 8cnOIEdBtjtTA==
Date: Wed, 21 May 2025 10:43:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Changyuan Lyu <changyuanl@google.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, chrisl@kernel.org,
	graf@amazon.com, jasonmiu@google.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	pasha.tatashin@soleen.com
Subject: Re: [PATCH 1/2] memblock: show a warning if allocation in KHO
 scratch fails
Message-ID: <aC2EE1pg9ktQdstI@kernel.org>
References: <aCoFphqeZAMkhq51@kernel.org>
 <20250521070310.2478491-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521070310.2478491-1-changyuanl@google.com>

Hi Changyuan,

On Wed, May 21, 2025 at 12:03:10AM -0700, Changyuan Lyu wrote:
> Hi Mike,
> 
> On Sun, May 18, 2025 at 19:07:02 +0300, Mike Rapoport <rppt@kernel.org> wrote:
> >
> > This can be reproduced without KHO, just squeeze the RAM size, boot with a huge
> > kernel and initrd and you'll get the same panic.
> >
> > The issue is that sparse_init_nid() does not treat allocation failures as
> > fatal and just continues with some sections being unpopulated and then
> > subsection_map_init() presumes all the sections are valid.
> >
> > This should be fixed in mm/sparse.c regardless of KHO, maybe as simple as
> >
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index 3c012cf83cc2..64d071f9f037 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -197,6 +197,10 @@ void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
> >  		pfns = min(nr_pages, PAGES_PER_SECTION
> >  				- (pfn & ~PAGE_SECTION_MASK));
> >  		ms = __nr_to_section(nr);
> > +
> > +		if (!ms->section_mem_map)
> > +			continue;
> > +
> >  		subsection_mask_set(ms->usage->subsection_map, pfn, pfns);
> >
> >  		pr_debug("%s: sec: %lu pfns: %lu set(%d, %d)\n", __func__, nr,
> 
> I tried your patch and the kernel log now looks like
> 
> [    0.027562] Faking a node at [mem 0x0000000000000000-0x000000057fffffff]
> [    0.028338] NODE_DATA(0) allocated [mem 0x562bd5a00-0x562bfffff]
> [    0.029201] Could not allocate 0x0000000014000000 bytes in KHO scratch
> [    0.030229] sparse_init_nid: node[0] memory map backing failed. Some memory will not be available.
> [    0.030232] Zone ranges:
> [    0.031539]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.032242]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.032952]   Normal   [mem 0x0000000100000000-0x000000057fffffff]
> [    0.033658]   Device   empty
> [    0.033987] Movable zone start for each node
> [    0.034473] Early memory node ranges
> [    0.034878]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
> [    0.035591]   node   0: [mem 0x0000000000100000-0x00000000773fffff]
> [    0.036308]   node   0: [mem 0x0000000077400000-0x00000000775fffff]
> [    0.037030]   node   0: [mem 0x0000000077600000-0x000000007fffffff]
> [    0.037750]   node   0: [mem 0x0000000100000000-0x000000054abfffff]
> [    0.038463]   node   0: [mem 0x000000054ac00000-0x0000000562bfffff]
> [    0.039180]   node   0: [mem 0x0000000562c00000-0x000000057fffffff]
> [    0.039901] Initmem setup node 0 [mem 0x0000000000001000-0x000000057fffffff]
> [    0.040707] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.041401] On node 0, zone DMA: 128 pages in unavailable ranges
> [    0.221829] BUG: kernel NULL pointer dereference, address: 0000000000000018
> [    0.222675] #PF: supervisor read access in kernel mode
> [    0.223271] #PF: error_code(0x0000) - not-present page
> [    0.223859] PGD 0 P4D 0
> [    0.224152] Oops: Oops: 0000 [#1] SMP
> [    0.224575] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc4+ #279 NONE
> [    0.225439] RIP: 0010:set_pageblock_migratetype+0x97/0xd0
> [    0.226069] Code: b6 c9 c1 e1 04 48 01 c8 eb 02 31 c0 48 8b 70 08 89 f9 c1 e9 07 c1 ef 0d 83 e7 03 80 e1 3c 41 b8 07 00 00 00 49 d3 e0 48 d3 e2 <48> 8b 44 fe 18 49 f7 d0 48 89 c1 4c 21 c1 48 09 d1 f0 48 0f b1 4c
> [    0.228231] RSP: 0000:ffffffffa4203d58 EFLAGS: 00010046
> [    0.228834] RAX: ffff8e4722bd13b0 RBX: 0000000000000000 RCX: 0000000000009b00
> [    0.229664] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
> [    0.230487] RBP: ffffffffa4203d58 R08: 0000000000000007 R09: 0000000000000000
> [    0.231303] R10: ffffffffa4edc610 R11: 000000000000000c R12: 000000000054ac00
> [    0.232119] R13: 0017fff000000000 R14: 0000000000000002 R15: 00000000004d8000
> [    0.232937] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.233868] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.234529] CR2: 0000000000000018 CR3: 000000055923e000 CR4: 00000000000200b0
> [    0.235351] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    0.236171] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    0.236990] Call Trace:
> [    0.237272]  <TASK>
> [    0.237514]  memmap_init_range+0x1d8/0x210
> [    0.237983]  memmap_init_zone_range+0x7f/0xb0
> [    0.238488]  memmap_init+0x9a/0x120
> [    0.238892]  free_area_init+0x369/0x3d0
> [    0.239331]  zone_sizes_init+0x5e/0x80
> [    0.239765]  paging_init+0x27/0x30
> [    0.240153]  setup_arch+0x307/0x3e0
> [    0.240556]  start_kernel+0x59/0x390
> [    0.240968]  x86_64_start_reservations+0x28/0x30
> [    0.241493]  x86_64_start_kernel+0x70/0x80
> [    0.241962]  common_startup_64+0x13b/0x140
> [    0.242433]  </TASK>
> [    0.242682] CR2: 0000000000000018
> [    0.243064] ---[ end trace 0000000000000000 ]---
> 
> It seems we are just defering the panic from subsection_map_init() to
> memmap_init(). To me it is still not obvious that the failure was
> caused by samll KHO scratch.

Small KHO scratch only exposes the issue that from one side
sparse_init_nid() does not treat OOM condition as fatal and tries to
continue with hardly noticeable error message but from the other side, we
presume that all section data was properly allocated and access it.
 
> I think the error log in my original patch still makes sense since it
> indicates potential panics early.

This will add another barely noticeable message at the same place
sparse_init_nid() reports an error.
I don't see how it will be better.

I think we should just make sparse_init_nid() panic or at least change 
"sparse_init_nid: node[0] memory map backing failed. Some memory will not be available."
to something more visible and clear. 

> Best,
> Changyuan

-- 
Sincerely yours,
Mike.
