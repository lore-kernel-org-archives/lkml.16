Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36E7DA6D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811007; cv=none; b=kFjZAOanpFCxQwAzuu6nmZtPiShkOurBAMhtSWwJCLVjGZTIC2bLXMsCvRnHK3teLiPCQ/rrRg7V130hrHSbFyCjyR2pM4EB0UnETC8v7SwnP3rQLrCRf8xSJO8XOsS2udPxi7AQ+KCN/S8FDh3xUM04NwBkBkxtJlS/ZHKKsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811007; c=relaxed/simple;
	bh=kVNGCSv5A8Mdp6tV80Ni75YMoUHYLUoNN2u7D8SGxwY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E8sbjoL+ZuS8DXrb8Uba22W5tZ/Duoz4zlWo5iXEZk0PVJSAXa5olHHdnxA4CZp8K39Ikn62LInsskmEjPGLP6kEP5kWCE96LKvegUIw3TD6eW7hAwCiuesK3pPkqov+04Grnd1Om+Rvadgz50zWnxiQl/70mU0O/Q8/mLYyMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GQ8E6jwN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GQ8E6jwN"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231d7a20b31so49685935ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747811005; x=1748415805; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fvqFxmwCugkGRFduaM1yC9/G72/UC4N96zy6Pb6E2hc=;
        b=GQ8E6jwNTc9dsms3+BnO8X89rh+IHded/9CaN0QhvvCw4yVgCNDKu/zdUW/cyjAoGt
         HW81P0Ce2A1xuQkMz9cw5Y2RVfjj1EXgnaXSikRBgQov5SfETn1aVHhQyIuvSuUz23SO
         i+UMt++4ekSMlX4zhhRF0ZEkA8OQVe3KfE2AQc08kKlJgJmPgO/FW+cEvAVFErUF67gw
         XvSrdYFIXb6kpzk6+BwY0l4ceeciAgNCNIlkt/7+z7Zk2UjbShv14T0YDzuF9P9zXO3b
         APl7nb6Z6M97Si4I5nswU+JFxiVwtQ4jfqtnZ7ij38xl45Y+xcrnY2wZXX0CEL9DM0lO
         N78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811005; x=1748415805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvqFxmwCugkGRFduaM1yC9/G72/UC4N96zy6Pb6E2hc=;
        b=Uh8LSigkeBqQJK405NfouZaMTOOoVRfkVSdDfePkmlyHXD7tC+jTzjoWOMOj1Op8rS
         1npJSBgWvtPifpTn6cAjRqjrrkO3PPydELOz7oeaF8Xl3Rsj1vML36cdJQDMCgDnTOOi
         bx5vpqKNAqMHuJeVQEByhcf8V+VJoVns72GGKF1CdD97UHuFskAW1ziTyRkWsMGcYGH4
         xCswrN05SyMPYI/78C6QGhX0qKJd0EmNrSbtic86LPU13Pi3ey+DhHmth0dkvIx5yeXJ
         rmMymawDpCqysbBazQrKe2sYWNwPWmc07Wor8sqwIOf0DmGw28OcLtSYl3Ty6Dh9Dcu9
         Do/w==
X-Forwarded-Encrypted: i=1; AJvYcCXIqIrBXWF4I7z/Xw8sk2SXEnXC3waHXCd0d0dIV2wll7wcqs4g+JzqLMdfHYfOZDRQbxi4dXTiZ7E91xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YztiN3sTLjt39ZofniutWPjD+h8l/NvSZ8bYJpNlFvUWVhERyDp
	qI7aOiMQPX1MaIXC0Y9saixNrqV494ykuPMHuv9JshsafIzBjU0pvO8UDeEhw7+VUcCQg8zJJxf
	65UB+NOS+kYB5aceWQLlXJw==
X-Google-Smtp-Source: AGHT+IF6aDnLlx0cahb66vqQ/hyXs7ORhFhmlY5s4lac6acsvfd20OfJpd5g3oyQKnm4eJ+Vxo2lhAf+V0NPk9Qi
X-Received: from pliy11.prod.google.com ([2002:a17:903:3d0b:b0:231:e2ee:34c9])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f4c:b0:231:bbbe:3c85 with SMTP id d9443c01a7336-231d45a9b69mr316255325ad.38.1747811004933;
 Wed, 21 May 2025 00:03:24 -0700 (PDT)
Date: Wed, 21 May 2025 00:03:10 -0700
In-Reply-To: <aCoFphqeZAMkhq51@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aCoFphqeZAMkhq51@kernel.org>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521070310.2478491-1-changyuanl@google.com>
Subject: Re: [PATCH 1/2] memblock: show a warning if allocation in KHO scratch fails
From: Changyuan Lyu <changyuanl@google.com>
To: rppt@kernel.org
Cc: akpm@linux-foundation.org, bhe@redhat.com, changyuanl@google.com, 
	chrisl@kernel.org, graf@amazon.com, jasonmiu@google.com, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	pasha.tatashin@soleen.com
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

On Sun, May 18, 2025 at 19:07:02 +0300, Mike Rapoport <rppt@kernel.org> wrote:
> On Sun, May 18, 2025 at 07:23:14AM -0700, Changyuan Lyu wrote:
> > When we kexec into a new kernel from an old kernel with KHO
> > enabled, the new kernel allocates vmemmap in the scratch area.
> > If the KHO scratch size is too small, vmemmap allocation would
> > fail and cause kernel panic, like the following,
> >
> > [    0.027133] Faking a node at [mem 0x0000000000000000-0x00000004ffffffff]
> > [    0.027877] NODE_DATA(0) allocated [mem 0x4e4bd5a00-0x4e4bfffff]
> > [    0.029696] sparse_init_nid: node[0] memory map backing failed. Some memory will not be available.
> > [    0.029698] Zone ranges:
> > [    0.030974]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> > [    0.031627]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> > [    0.032281]   Normal   [mem 0x0000000100000000-0x00000004ffffffff]
> > [    0.032930]   Device   empty
> > [    0.033251] Movable zone start for each node
> > [    0.033710] Early memory node ranges
> > [    0.034108]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
> > [    0.034801]   node   0: [mem 0x0000000000100000-0x00000000773fffff]
> > [    0.035461]   node   0: [mem 0x0000000077400000-0x00000000775fffff]
> > [    0.036116]   node   0: [mem 0x0000000077600000-0x000000007fffffff]
> > [    0.036768]   node   0: [mem 0x0000000100000000-0x00000004ccbfffff]
> > [    0.037423]   node   0: [mem 0x00000004ccc00000-0x00000004e4bfffff]
> > [    0.038111] BUG: kernel NULL pointer dereference, address: 0000000000000010
> > [    0.038880] #PF: supervisor write access in kernel mode
> > [    0.039474] #PF: error_code(0x0002) - not-present page
> > [    0.040056] PGD 0 P4D 0
> > [    0.040335] Oops: Oops: 0002 [#1] SMP
> > [    0.040745] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc4+ #275 NONE
> > [    0.041541] RIP: 0010:__bitmap_set+0x2b/0x80
> > [    0.041992] Code: 0f 1e fa 55 48 89 e5 89 f1 89 f0 c1 e8 06 48 8d 04 c7 48 c7 c7 ff ff ff ff 48 d3 e7 41 89 f0 41 83 c8 c0 44 89 c6 01 d6 78 43 <48> 09 38 48 83 c0 08 83 fe 40 72 1a 41 8d 3c 10 83 c7 40 48 c7 00
> > [    0.043986] RSP: 0000:ffffffff96203df0 EFLAGS: 00010047
> > [    0.044546] RAX: 0000000000000010 RBX: 000000000000cc00 RCX: 0000000000000000
> > [    0.045311] RDX: 0000000000000040 RSI: 0000000000000000 RDI: ffffffffffffffff
> > [    0.046075] RBP: ffffffff96203df0 R08: 00000000ffffffc0 R09: ffffffff9626c950
> > [    0.046830] R10: 000000000002fffd R11: 0000000000000004 R12: 0000000000008000
> > [    0.047574] R13: 0000000000000000 R14: 000000000000003f R15: 000000000000009b
> > [    0.048313] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> > [    0.049151] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.049751] CR2: 0000000000000010 CR3: 00000004d123e000 CR4: 00000000000200b0
> > [    0.050494] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [    0.051238] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [    0.051978] Call Trace:
> > [    0.052235]  <TASK>
> > [    0.052455]  subsection_map_init+0xe4/0x130
> > [    0.052891]  free_area_init+0x217/0x3d0
> > [    0.053290]  zone_sizes_init+0x5e/0x80
> > [    0.053682]  paging_init+0x27/0x30
> > [    0.054046]  setup_arch+0x307/0x3e0
> > [    0.054422]  start_kernel+0x59/0x390
> > [    0.054820]  x86_64_start_reservations+0x28/0x30
> > [    0.055307]  x86_64_start_kernel+0x70/0x80
> > [    0.055736]  common_startup_64+0x13b/0x140
> > [    0.056165]  </TASK>
> > [    0.056392] CR2: 0000000000000010
> > [    0.056737] ---[ end trace 0000000000000000 ]---
> > [    0.057218] RIP: 0010:__bitmap_set+0x2b/0x80
> > [    0.057667] Code: 0f 1e fa 55 48 89 e5 89 f1 89 f0 c1 e8 06 48 8d 04 c7 48 c7 c7 ff ff ff ff 48 d3 e7 41 89 f0 41 83 c8 c0 44 89 c6 01 d6 78 43 <48> 09 38 48 83 c0 08 83 fe 40 72 1a 41 8d 3c 10 83 c7 40 48 c7 00
> > [    0.059650] RSP: 0000:ffffffff96203df0 EFLAGS: 00010047
> > [    0.060218] RAX: 0000000000000010 RBX: 000000000000cc00 RCX: 0000000000000000
> > [    0.060985] RDX: 0000000000000040 RSI: 0000000000000000 RDI: ffffffffffffffff
> > [    0.061728] RBP: ffffffff96203df0 R08: 00000000ffffffc0 R09: ffffffff9626c950
> > [    0.062486] R10: 000000000002fffd R11: 0000000000000004 R12: 0000000000008000
> > [    0.063228] R13: 0000000000000000 R14: 000000000000003f R15: 000000000000009b
> > [    0.063968] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> > [    0.064812] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.065423] CR2: 0000000000000010 CR3: 00000004d123e000 CR4: 00000000000200b0
> > [    0.066175] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [    0.066926] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [    0.067678] Kernel panic - not syncing: Attempted to kill the idle task!
> > [    0.068403] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> >
> > The panic above can be easily reproduced by the following steps,
> >
> > 1.  boot a VM with 20GiB physical memory (or larger) and kernel command
> >     line "kho=on kho_scratch=2m,256m,128m"
> > 2.  echo 1 > /sys/kernel/debug/kho/out/finalize
> > 3.  kexec to a new kernel
>
> This can be reproduced without KHO, just squeeze the RAM size, boot with a huge
> kernel and initrd and you'll get the same panic.
>
> The issue is that sparse_init_nid() does not treat allocation failures as
> fatal and just continues with some sections being unpopulated and then
> subsection_map_init() presumes all the sections are valid.
>
> This should be fixed in mm/sparse.c regardless of KHO, maybe as simple as
>
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 3c012cf83cc2..64d071f9f037 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -197,6 +197,10 @@ void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
>  		pfns = min(nr_pages, PAGES_PER_SECTION
>  				- (pfn & ~PAGE_SECTION_MASK));
>  		ms = __nr_to_section(nr);
> +
> +		if (!ms->section_mem_map)
> +			continue;
> +
>  		subsection_mask_set(ms->usage->subsection_map, pfn, pfns);
>
>  		pr_debug("%s: sec: %lu pfns: %lu set(%d, %d)\n", __func__, nr,

I tried your patch and the kernel log now looks like

[    0.027562] Faking a node at [mem 0x0000000000000000-0x000000057fffffff]
[    0.028338] NODE_DATA(0) allocated [mem 0x562bd5a00-0x562bfffff]
[    0.029201] Could not allocate 0x0000000014000000 bytes in KHO scratch
[    0.030229] sparse_init_nid: node[0] memory map backing failed. Some memory will not be available.
[    0.030232] Zone ranges:
[    0.031539]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.032242]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.032952]   Normal   [mem 0x0000000100000000-0x000000057fffffff]
[    0.033658]   Device   empty
[    0.033987] Movable zone start for each node
[    0.034473] Early memory node ranges
[    0.034878]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
[    0.035591]   node   0: [mem 0x0000000000100000-0x00000000773fffff]
[    0.036308]   node   0: [mem 0x0000000077400000-0x00000000775fffff]
[    0.037030]   node   0: [mem 0x0000000077600000-0x000000007fffffff]
[    0.037750]   node   0: [mem 0x0000000100000000-0x000000054abfffff]
[    0.038463]   node   0: [mem 0x000000054ac00000-0x0000000562bfffff]
[    0.039180]   node   0: [mem 0x0000000562c00000-0x000000057fffffff]
[    0.039901] Initmem setup node 0 [mem 0x0000000000001000-0x000000057fffffff]
[    0.040707] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.041401] On node 0, zone DMA: 128 pages in unavailable ranges
[    0.221829] BUG: kernel NULL pointer dereference, address: 0000000000000018
[    0.222675] #PF: supervisor read access in kernel mode
[    0.223271] #PF: error_code(0x0000) - not-present page
[    0.223859] PGD 0 P4D 0
[    0.224152] Oops: Oops: 0000 [#1] SMP
[    0.224575] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc4+ #279 NONE
[    0.225439] RIP: 0010:set_pageblock_migratetype+0x97/0xd0
[    0.226069] Code: b6 c9 c1 e1 04 48 01 c8 eb 02 31 c0 48 8b 70 08 89 f9 c1 e9 07 c1 ef 0d 83 e7 03 80 e1 3c 41 b8 07 00 00 00 49 d3 e0 48 d3 e2 <48> 8b 44 fe 18 49 f7 d0 48 89 c1 4c 21 c1 48 09 d1 f0 48 0f b1 4c
[    0.228231] RSP: 0000:ffffffffa4203d58 EFLAGS: 00010046
[    0.228834] RAX: ffff8e4722bd13b0 RBX: 0000000000000000 RCX: 0000000000009b00
[    0.229664] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
[    0.230487] RBP: ffffffffa4203d58 R08: 0000000000000007 R09: 0000000000000000
[    0.231303] R10: ffffffffa4edc610 R11: 000000000000000c R12: 000000000054ac00
[    0.232119] R13: 0017fff000000000 R14: 0000000000000002 R15: 00000000004d8000
[    0.232937] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    0.233868] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.234529] CR2: 0000000000000018 CR3: 000000055923e000 CR4: 00000000000200b0
[    0.235351] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.236171] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.236990] Call Trace:
[    0.237272]  <TASK>
[    0.237514]  memmap_init_range+0x1d8/0x210
[    0.237983]  memmap_init_zone_range+0x7f/0xb0
[    0.238488]  memmap_init+0x9a/0x120
[    0.238892]  free_area_init+0x369/0x3d0
[    0.239331]  zone_sizes_init+0x5e/0x80
[    0.239765]  paging_init+0x27/0x30
[    0.240153]  setup_arch+0x307/0x3e0
[    0.240556]  start_kernel+0x59/0x390
[    0.240968]  x86_64_start_reservations+0x28/0x30
[    0.241493]  x86_64_start_kernel+0x70/0x80
[    0.241962]  common_startup_64+0x13b/0x140
[    0.242433]  </TASK>
[    0.242682] CR2: 0000000000000018
[    0.243064] ---[ end trace 0000000000000000 ]---

It seems we are just defering the panic from subsection_map_init() to
memmap_init(). To me it is still not obvious that the failure was
caused by samll KHO scratch.

I think the error log in my original patch still makes sense since it
indicates potential panics early.

> > The current panic log above is confusing and it's hard to find the
> > root cause.
> >
> > Add an error log to make it easier to debug such kind of panics.
> >
> > Fixes: d59f43b57480 ("memblock: add support for scratch memory")
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > ---
> >  mm/memblock.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index 154f1d73b61f..ed886bfd3de7 100644
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -1573,6 +1573,9 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
> >  		goto again;
> >  	}
> >
> > +	if (flags & MEMBLOCK_KHO_SCRATCH)
> > +		pr_err_once("Could not allocate %pap bytes in KHO scratch\n", &size);
> > +
> >  	return 0;
> >
> >  done:
> > --
> > 2.49.0.1101.gccaa498523-goog
>
> --
> Sincerely yours,
> Mike.

Best,
Changyuan
